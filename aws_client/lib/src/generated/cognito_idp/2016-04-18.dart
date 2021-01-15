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

part '2016-04-18.g.dart';

/// Using the Amazon Cognito User Pools API, you can create a user pool to
/// manage directories and users. You can authenticate a user to obtain tokens
/// related to user identity and access policies.
///
/// This API reference provides information about user pools in Amazon Cognito
/// User Pools.
///
/// For more information, see the Amazon Cognito Documentation.
class CognitoIdentityProvider {
  final _s.JsonProtocol _protocol;
  CognitoIdentityProvider({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cognito-idp',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds additional user attributes to the user pool schema.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserImportInProgressException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [customAttributes] :
  /// An array of custom attributes, such as Mutable and Name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to add custom
  /// attributes.
  Future<void> addCustomAttributes({
    @_s.required List<SchemaAttributeType> customAttributes,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(customAttributes, 'customAttributes');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AddCustomAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomAttributes': customAttributes,
        'UserPoolId': userPoolId,
      },
    );

    return AddCustomAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Adds the specified user to the specified group.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [groupName] :
  /// The group name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [username] :
  /// The username for the user.
  Future<void> adminAddUserToGroup({
    @_s.required String groupName,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminAddUserToGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );
  }

  /// Confirms user registration as an admin without using a confirmation code.
  /// Works on any user.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyFailedAttemptsException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for which you want to confirm user registration.
  ///
  /// Parameter [username] :
  /// The user name for which you want to confirm user registration.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// If your user pool configuration includes triggers, the AdminConfirmSignUp
  /// API action invokes the AWS Lambda function that is specified for the
  /// <i>post confirmation</i> trigger. When Amazon Cognito invokes this
  /// function, it passes a JSON payload, which the function receives as input.
  /// In this payload, the <code>clientMetadata</code> attribute provides the
  /// data that you assigned to the ClientMetadata parameter in your
  /// AdminConfirmSignUp request. In your function code in AWS Lambda, you can
  /// process the ClientMetadata value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  Future<void> adminConfirmSignUp({
    @_s.required String userPoolId,
    @_s.required String username,
    Map<String, String> clientMetadata,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminConfirmSignUp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
      },
    );

    return AdminConfirmSignUpResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new user in the specified user pool.
  ///
  /// If <code>MessageAction</code> is not set, the default is to send a welcome
  /// message via email or phone (SMS).
  ///
  /// This message is based on a template that you configured in your call to
  /// create or update a user pool. This template includes your custom sign-up
  /// instructions and placeholders for user name and temporary password.
  ///
  /// Alternatively, you can call <code>AdminCreateUser</code> with “SUPPRESS”
  /// for the <code>MessageAction</code> parameter, and Amazon Cognito will not
  /// send any email.
  ///
  /// In either case, the user will be in the <code>FORCE_CHANGE_PASSWORD</code>
  /// state until they sign in and change their password.
  ///
  /// <code>AdminCreateUser</code> requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UserNotFoundException].
  /// May throw [UsernameExistsException].
  /// May throw [InvalidPasswordException].
  /// May throw [CodeDeliveryFailureException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [PreconditionNotMetException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UnsupportedUserStateException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where the user will be created.
  ///
  /// Parameter [username] :
  /// The username for the user. Must be unique within the user pool. Must be a
  /// UTF-8 string between 1 and 128 characters. After the user is created, the
  /// username cannot be changed.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the AdminCreateUser API action, Amazon Cognito
  /// invokes the function that is assigned to the <i>pre sign-up</i> trigger.
  /// When Amazon Cognito invokes this function, it passes a JSON payload, which
  /// the function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your AdminCreateUser request.
  /// In your function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [desiredDeliveryMediums] :
  /// Specify <code>"EMAIL"</code> if email will be used to send the welcome
  /// message. Specify <code>"SMS"</code> if the phone number will be used. The
  /// default value is <code>"SMS"</code>. More than one value can be specified.
  ///
  /// Parameter [forceAliasCreation] :
  /// This parameter is only used if the <code>phone_number_verified</code> or
  /// <code>email_verified</code> attribute is set to <code>True</code>.
  /// Otherwise, it is ignored.
  ///
  /// If this parameter is set to <code>True</code> and the phone number or
  /// email address specified in the UserAttributes parameter already exists as
  /// an alias with a different user, the API call will migrate the alias from
  /// the previous user to the newly created user. The previous user will no
  /// longer be able to log in using that alias.
  ///
  /// If this parameter is set to <code>False</code>, the API throws an
  /// <code>AliasExistsException</code> error if the alias already exists. The
  /// default value is <code>False</code>.
  ///
  /// Parameter [messageAction] :
  /// Set to <code>"RESEND"</code> to resend the invitation message to a user
  /// that already exists and reset the expiration limit on the user's account.
  /// Set to <code>"SUPPRESS"</code> to suppress sending the message. Only one
  /// value can be specified.
  ///
  /// Parameter [temporaryPassword] :
  /// The user's temporary password. This password must conform to the password
  /// policy that you specified when you created the user pool.
  ///
  /// The temporary password is valid only once. To complete the Admin Create
  /// User flow, the user must enter the temporary password in the sign-in page
  /// along with a new password to be used in all future sign-ins.
  ///
  /// This parameter is not required. If you do not specify a value, Amazon
  /// Cognito generates one for you.
  ///
  /// The temporary password can only be used until the user account expiration
  /// limit that you specified when you created the user pool. To reset the
  /// account after that time limit, you must call <code>AdminCreateUser</code>
  /// again, specifying <code>"RESEND"</code> for the <code>MessageAction</code>
  /// parameter.
  ///
  /// Parameter [userAttributes] :
  /// An array of name-value pairs that contain user attributes and attribute
  /// values to be set for the user to be created. You can create a user without
  /// specifying any attributes other than <code>Username</code>. However, any
  /// attributes that you specify as required (when creating a user pool or in
  /// the <b>Attributes</b> tab of the console) must be supplied either by you
  /// (in your call to <code>AdminCreateUser</code>) or by the user (when he or
  /// she signs up in response to your welcome message).
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  ///
  /// To send a message inviting the user to sign up, you must specify the
  /// user's email address or phone number. This can be done in your call to
  /// AdminCreateUser or in the <b>Users</b> tab of the Amazon Cognito console
  /// for managing your user pools.
  ///
  /// In your call to <code>AdminCreateUser</code>, you can set the
  /// <code>email_verified</code> attribute to <code>True</code>, and you can
  /// set the <code>phone_number_verified</code> attribute to <code>True</code>.
  /// (You can also do this by calling <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminUpdateUserAttributes.html">AdminUpdateUserAttributes</a>.)
  ///
  /// <ul>
  /// <li>
  /// <b>email</b>: The email address of the user to whom the message that
  /// contains the code and username will be sent. Required if the
  /// <code>email_verified</code> attribute is set to <code>True</code>, or if
  /// <code>"EMAIL"</code> is specified in the
  /// <code>DesiredDeliveryMediums</code> parameter.
  /// </li>
  /// <li>
  /// <b>phone_number</b>: The phone number of the user to whom the message that
  /// contains the code and username will be sent. Required if the
  /// <code>phone_number_verified</code> attribute is set to <code>True</code>,
  /// or if <code>"SMS"</code> is specified in the
  /// <code>DesiredDeliveryMediums</code> parameter.
  /// </li>
  /// </ul>
  ///
  /// Parameter [validationData] :
  /// The user's validation data. This is an array of name-value pairs that
  /// contain user attributes and attribute values that you can use for custom
  /// validation, such as restricting the types of user accounts that can be
  /// registered. For example, you might choose to allow or disallow user
  /// sign-up based on the user's domain.
  ///
  /// To configure custom validation, you must create a Pre Sign-up Lambda
  /// trigger for the user pool as described in the Amazon Cognito Developer
  /// Guide. The Lambda trigger receives the validation data and uses it in the
  /// validation process.
  ///
  /// The user's validation data is not persisted.
  Future<AdminCreateUserResponse> adminCreateUser({
    @_s.required String userPoolId,
    @_s.required String username,
    Map<String, String> clientMetadata,
    List<DeliveryMediumType> desiredDeliveryMediums,
    bool forceAliasCreation,
    MessageActionType messageAction,
    String temporaryPassword,
    List<AttributeType> userAttributes,
    List<AttributeType> validationData,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'temporaryPassword',
      temporaryPassword,
      6,
      256,
    );
    _s.validateStringPattern(
      'temporaryPassword',
      temporaryPassword,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminCreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (desiredDeliveryMediums != null)
          'DesiredDeliveryMediums':
              desiredDeliveryMediums.map((e) => e?.toValue() ?? '').toList(),
        if (forceAliasCreation != null)
          'ForceAliasCreation': forceAliasCreation,
        if (messageAction != null) 'MessageAction': messageAction.toValue(),
        if (temporaryPassword != null) 'TemporaryPassword': temporaryPassword,
        if (userAttributes != null) 'UserAttributes': userAttributes,
        if (validationData != null) 'ValidationData': validationData,
      },
    );

    return AdminCreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a user as an administrator. Works on any user.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to delete the user.
  ///
  /// Parameter [username] :
  /// The user name of the user you wish to delete.
  Future<void> adminDeleteUser({
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminDeleteUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );
  }

  /// Deletes the user attributes in a user pool as an administrator. Works on
  /// any user.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userAttributeNames] :
  /// An array of strings representing the user attribute names you wish to
  /// delete.
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to delete user
  /// attributes.
  ///
  /// Parameter [username] :
  /// The user name of the user from which you would like to delete attributes.
  Future<void> adminDeleteUserAttributes({
    @_s.required List<String> userAttributeNames,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(userAttributeNames, 'userAttributeNames');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminDeleteUserAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserAttributeNames': userAttributeNames,
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminDeleteUserAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Disables the user from signing in with the specified external (SAML or
  /// social) identity provider. If the user to disable is a Cognito User Pools
  /// native username + password user, they are not permitted to use their
  /// password to sign-in. If the user to disable is a linked external IdP user,
  /// any link between that user and an existing user is removed. The next time
  /// the external user (no longer attached to the previously linked
  /// <code>DestinationUser</code>) signs in, they must create a new user
  /// account. See <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminLinkProviderForUser.html">AdminLinkProviderForUser</a>.
  ///
  /// This action is enabled only for admin access and requires developer
  /// credentials.
  ///
  /// The <code>ProviderName</code> must match the value specified when creating
  /// an IdP for the pool.
  ///
  /// To disable a native username + password user, the
  /// <code>ProviderName</code> value must be <code>Cognito</code> and the
  /// <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code>,
  /// with the <code>ProviderAttributeValue</code> being the name that is used
  /// in the user pool for the user.
  ///
  /// The <code>ProviderAttributeName</code> must always be
  /// <code>Cognito_Subject</code> for social identity providers. The
  /// <code>ProviderAttributeValue</code> must always be the exact subject that
  /// was used when the user was originally linked as a source user.
  ///
  /// For de-linking a SAML identity, there are two scenarios. If the linked
  /// identity has not yet been used to sign-in, the
  /// <code>ProviderAttributeName</code> and <code>ProviderAttributeValue</code>
  /// must be the same values that were used for the <code>SourceUser</code>
  /// when the identities were originally linked using <code>
  /// AdminLinkProviderForUser</code> call. (If the linking was done with
  /// <code>ProviderAttributeName</code> set to <code>Cognito_Subject</code>,
  /// the same applies here). However, if the user has already signed in, the
  /// <code>ProviderAttributeName</code> must be <code>Cognito_Subject</code>
  /// and <code>ProviderAttributeValue</code> must be the subject of the SAML
  /// assertion.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [AliasExistsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [user] :
  /// The user to be disabled.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  Future<void> adminDisableProviderForUser({
    @_s.required ProviderUserIdentifierType user,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(user, 'user');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminDisableProviderForUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'User': user,
        'UserPoolId': userPoolId,
      },
    );

    return AdminDisableProviderForUserResponse.fromJson(jsonResponse.body);
  }

  /// Disables the specified user.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to disable the user.
  ///
  /// Parameter [username] :
  /// The user name of the user you wish to disable.
  Future<void> adminDisableUser({
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminDisableUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminDisableUserResponse.fromJson(jsonResponse.body);
  }

  /// Enables the specified user as an administrator. Works on any user.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to enable the user.
  ///
  /// Parameter [username] :
  /// The user name of the user you wish to enable.
  Future<void> adminEnableUser({
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminEnableUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminEnableUserResponse.fromJson(jsonResponse.body);
  }

  /// Forgets the device, as an administrator.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [deviceKey] :
  /// The device key.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user name.
  Future<void> adminForgetDevice({
    @_s.required String deviceKey,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(deviceKey, 'deviceKey');
    _s.validateStringLength(
      'deviceKey',
      deviceKey,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceKey',
      deviceKey,
      r'''[\w-]+_[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminForgetDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceKey': deviceKey,
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );
  }

  /// Gets the device, as an administrator.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [deviceKey] :
  /// The device key.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user name.
  Future<AdminGetDeviceResponse> adminGetDevice({
    @_s.required String deviceKey,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(deviceKey, 'deviceKey');
    _s.validateStringLength(
      'deviceKey',
      deviceKey,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceKey',
      deviceKey,
      r'''[\w-]+_[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminGetDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceKey': deviceKey,
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminGetDeviceResponse.fromJson(jsonResponse.body);
  }

  /// Gets the specified user by user name in a user pool as an administrator.
  /// Works on any user.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to get information about
  /// the user.
  ///
  /// Parameter [username] :
  /// The user name of the user you wish to retrieve.
  Future<AdminGetUserResponse> adminGetUser({
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminGetUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminGetUserResponse.fromJson(jsonResponse.body);
  }

  /// Initiates the authentication flow, as an administrator.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [MFAMethodNotFoundException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  ///
  /// Parameter [authFlow] :
  /// The authentication flow for this call to execute. The API action will
  /// depend on this value. For example:
  ///
  /// <ul>
  /// <li>
  /// <code>REFRESH_TOKEN_AUTH</code> will take in a valid refresh token and
  /// return new tokens.
  /// </li>
  /// <li>
  /// <code>USER_SRP_AUTH</code> will take in <code>USERNAME</code> and
  /// <code>SRP_A</code> and return the SRP variables to be used for next
  /// challenge execution.
  /// </li>
  /// <li>
  /// <code>USER_PASSWORD_AUTH</code> will take in <code>USERNAME</code> and
  /// <code>PASSWORD</code> and return the next challenge or tokens.
  /// </li>
  /// </ul>
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote
  /// Password (SRP) protocol.
  /// </li>
  /// <li>
  /// <code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication
  /// flow for refreshing the access token and ID token by supplying a valid
  /// refresh token.
  /// </li>
  /// <li>
  /// <code>CUSTOM_AUTH</code>: Custom authentication flow.
  /// </li>
  /// <li>
  /// <code>ADMIN_NO_SRP_AUTH</code>: Non-SRP authentication flow; you can pass
  /// in the USERNAME and PASSWORD directly if the flow is enabled for calling
  /// the app client.
  /// </li>
  /// <li>
  /// <code>USER_PASSWORD_AUTH</code>: Non-SRP authentication flow; USERNAME and
  /// PASSWORD are passed directly. If a user migration Lambda trigger is set,
  /// this flow will invoke the user migration Lambda if the USERNAME is not
  /// found in the user pool.
  /// </li>
  /// <li>
  /// <code>ADMIN_USER_PASSWORD_AUTH</code>: Admin-based user password
  /// authentication. This replaces the <code>ADMIN_NO_SRP_AUTH</code>
  /// authentication flow. In this flow, Cognito receives the password in the
  /// request instead of using the SRP process to verify passwords.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientId] :
  /// The app client ID.
  ///
  /// Parameter [userPoolId] :
  /// The ID of the Amazon Cognito user pool.
  ///
  /// Parameter [analyticsMetadata] :
  /// The analytics metadata for collecting Amazon Pinpoint metrics for
  /// <code>AdminInitiateAuth</code> calls.
  ///
  /// Parameter [authParameters] :
  /// The authentication parameters. These are inputs corresponding to the
  /// <code>AuthFlow</code> that you are invoking. The required values depend on
  /// the value of <code>AuthFlow</code>:
  ///
  /// <ul>
  /// <li>
  /// For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required),
  /// <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the
  /// app client is configured with a client secret), <code>DEVICE_KEY</code>.
  /// </li>
  /// <li>
  /// For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>:
  /// <code>REFRESH_TOKEN</code> (required), <code>SECRET_HASH</code> (required
  /// if the app client is configured with a client secret),
  /// <code>DEVICE_KEY</code>.
  /// </li>
  /// <li>
  /// For <code>ADMIN_NO_SRP_AUTH</code>: <code>USERNAME</code> (required),
  /// <code>SECRET_HASH</code> (if app client is configured with client secret),
  /// <code>PASSWORD</code> (required), <code>DEVICE_KEY</code>.
  /// </li>
  /// <li>
  /// For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required),
  /// <code>SECRET_HASH</code> (if app client is configured with client secret),
  /// <code>DEVICE_KEY</code>. To start the authentication flow with password
  /// verification, include <code>ChallengeName: SRP_A</code> and <code>SRP_A:
  /// (The SRP_A Value)</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for certain
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the AdminInitiateAuth API action, Amazon Cognito
  /// invokes the AWS Lambda functions that are specified for various triggers.
  /// The ClientMetadata value is passed as input to the functions for only the
  /// following triggers:
  ///
  /// <ul>
  /// <li>
  /// Pre signup
  /// </li>
  /// <li>
  /// Pre authentication
  /// </li>
  /// <li>
  /// User migration
  /// </li>
  /// </ul>
  /// When Amazon Cognito invokes the functions for these triggers, it passes a
  /// JSON payload, which the function receives as input. This payload contains
  /// a <code>validationData</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your AdminInitiateAuth
  /// request. In your function code in AWS Lambda, you can process the
  /// <code>validationData</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// When you use the AdminInitiateAuth API action, Amazon Cognito also invokes
  /// the functions for the following triggers, but it does not provide the
  /// ClientMetadata value as input:
  ///
  /// <ul>
  /// <li>
  /// Post authentication
  /// </li>
  /// <li>
  /// Custom message
  /// </li>
  /// <li>
  /// Pre token generation
  /// </li>
  /// <li>
  /// Create auth challenge
  /// </li>
  /// <li>
  /// Define auth challenge
  /// </li>
  /// <li>
  /// Verify auth challenge
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [contextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  Future<AdminInitiateAuthResponse> adminInitiateAuth({
    @_s.required AuthFlowType authFlow,
    @_s.required String clientId,
    @_s.required String userPoolId,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> authParameters,
    Map<String, String> clientMetadata,
    ContextDataType contextData,
  }) async {
    ArgumentError.checkNotNull(authFlow, 'authFlow');
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminInitiateAuth'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthFlow': authFlow?.toValue() ?? '',
        'ClientId': clientId,
        'UserPoolId': userPoolId,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (authParameters != null) 'AuthParameters': authParameters,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (contextData != null) 'ContextData': contextData,
      },
    );

    return AdminInitiateAuthResponse.fromJson(jsonResponse.body);
  }

  /// Links an existing user account in a user pool
  /// (<code>DestinationUser</code>) to an identity from an external identity
  /// provider (<code>SourceUser</code>) based on a specified attribute name and
  /// value from the external identity provider. This allows you to create a
  /// link from the existing user account to an external federated user identity
  /// that has not yet been used to sign in, so that the federated user identity
  /// can be used to sign in as the existing user account.
  ///
  /// For example, if there is an existing user with a username and password,
  /// this API links that user to a federated user identity, so that when the
  /// federated user identity is used, the user signs in as the existing user
  /// account.
  /// <note>
  /// The maximum number of federated identities linked to a user is 5.
  /// </note> <important>
  /// Because this API allows a user with an external federated identity to sign
  /// in as an existing user in the user pool, it is critical that it only be
  /// used with external identity providers and provider attributes that have
  /// been trusted by the application owner.
  /// </important>
  /// This action is enabled only for admin access and requires developer
  /// credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [AliasExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [destinationUser] :
  /// The existing user in the user pool to be linked to the external identity
  /// provider user account. Can be a native (Username + Password) Cognito User
  /// Pools user or a federated user (for example, a SAML or Facebook user). If
  /// the user doesn't exist, an exception is thrown. This is the user that is
  /// returned when the new user (with the linked identity provider attribute)
  /// signs in.
  ///
  /// For a native username + password user, the
  /// <code>ProviderAttributeValue</code> for the <code>DestinationUser</code>
  /// should be the username in the user pool. For a federated user, it should
  /// be the provider-specific <code>user_id</code>.
  ///
  /// The <code>ProviderAttributeName</code> of the <code>DestinationUser</code>
  /// is ignored.
  ///
  /// The <code>ProviderName</code> should be set to <code>Cognito</code> for
  /// users in Cognito user pools.
  ///
  /// Parameter [sourceUser] :
  /// An external identity provider account for a user who does not currently
  /// exist yet in the user pool. This user must be a federated user (for
  /// example, a SAML or Facebook user), not another native user.
  ///
  /// If the <code>SourceUser</code> is a federated social identity provider
  /// user (Facebook, Google, or Login with Amazon), you must set the
  /// <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>. For
  /// social identity providers, the <code>ProviderName</code> will be
  /// <code>Facebook</code>, <code>Google</code>, or
  /// <code>LoginWithAmazon</code>, and Cognito will automatically parse the
  /// Facebook, Google, and Login with Amazon tokens for <code>id</code>,
  /// <code>sub</code>, and <code>user_id</code>, respectively. The
  /// <code>ProviderAttributeValue</code> for the user must be the same value as
  /// the <code>id</code>, <code>sub</code>, or <code>user_id</code> value found
  /// in the social identity provider token.
  /// <p/>
  /// For SAML, the <code>ProviderAttributeName</code> can be any value that
  /// matches a claim in the SAML assertion. If you wish to link SAML users
  /// based on the subject of the SAML assertion, you should map the subject to
  /// a claim through the SAML identity provider and submit that claim name as
  /// the <code>ProviderAttributeName</code>. If you set
  /// <code>ProviderAttributeName</code> to <code>Cognito_Subject</code>,
  /// Cognito will automatically parse the default unique identifier found in
  /// the subject from the SAML token.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  Future<void> adminLinkProviderForUser({
    @_s.required ProviderUserIdentifierType destinationUser,
    @_s.required ProviderUserIdentifierType sourceUser,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(destinationUser, 'destinationUser');
    ArgumentError.checkNotNull(sourceUser, 'sourceUser');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminLinkProviderForUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationUser': destinationUser,
        'SourceUser': sourceUser,
        'UserPoolId': userPoolId,
      },
    );

    return AdminLinkProviderForUserResponse.fromJson(jsonResponse.body);
  }

  /// Lists devices, as an administrator.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user name.
  ///
  /// Parameter [limit] :
  /// The limit of the devices request.
  ///
  /// Parameter [paginationToken] :
  /// The pagination token.
  Future<AdminListDevicesResponse> adminListDevices({
    @_s.required String userPoolId,
    @_s.required String username,
    int limit,
    String paginationToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      0,
      60,
    );
    _s.validateStringLength(
      'paginationToken',
      paginationToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'paginationToken',
      paginationToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminListDevices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
        if (limit != null) 'Limit': limit,
        if (paginationToken != null) 'PaginationToken': paginationToken,
      },
    );

    return AdminListDevicesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the groups that the user belongs to.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [username] :
  /// The username for the user.
  ///
  /// Parameter [limit] :
  /// The limit of the request to list groups.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<AdminListGroupsForUserResponse> adminListGroupsForUser({
    @_s.required String userPoolId,
    @_s.required String username,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      0,
      60,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminListGroupsForUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return AdminListGroupsForUserResponse.fromJson(jsonResponse.body);
  }

  /// Lists a history of user activity and any risks detected as part of Amazon
  /// Cognito advanced security.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [UserPoolAddOnNotEnabledException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user pool username or an alias.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of authentication events to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<AdminListUserAuthEventsResponse> adminListUserAuthEvents({
    @_s.required String userPoolId,
    @_s.required String username,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      60,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminListUserAuthEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return AdminListUserAuthEventsResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified user from the specified group.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [groupName] :
  /// The group name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [username] :
  /// The username for the user.
  Future<void> adminRemoveUserFromGroup({
    @_s.required String groupName,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminRemoveUserFromGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );
  }

  /// Resets the specified user's password in a user pool as an administrator.
  /// Works on any user.
  ///
  /// When a developer calls this API, the current password is invalidated, so
  /// it must be changed. If a user tries to sign in after the API is called,
  /// the app will get a PasswordResetRequiredException exception back and
  /// should direct the user down the flow to reset the password, which is the
  /// same as the forgot password flow. In addition, if the user pool has phone
  /// verification selected and a verified phone number exists for the user, or
  /// if email verification is selected and a verified email exists for the
  /// user, calling this API will also result in sending a message to the end
  /// user with the code to change their password.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [UserNotFoundException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to reset the user's
  /// password.
  ///
  /// Parameter [username] :
  /// The user name of the user whose password you wish to reset.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the AdminResetUserPassword API action, Amazon
  /// Cognito invokes the function that is assigned to the <i>custom message</i>
  /// trigger. When Amazon Cognito invokes this function, it passes a JSON
  /// payload, which the function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your AdminResetUserPassword
  /// request. In your function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  Future<void> adminResetUserPassword({
    @_s.required String userPoolId,
    @_s.required String username,
    Map<String, String> clientMetadata,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminResetUserPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
      },
    );

    return AdminResetUserPasswordResponse.fromJson(jsonResponse.body);
  }

  /// Responds to an authentication challenge, as an administrator.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [CodeMismatchException].
  /// May throw [ExpiredCodeException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [InvalidPasswordException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [InternalErrorException].
  /// May throw [MFAMethodNotFoundException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [AliasExistsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [SoftwareTokenMFANotFoundException].
  ///
  /// Parameter [challengeName] :
  /// The challenge name. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html">AdminInitiateAuth</a>.
  ///
  /// Parameter [clientId] :
  /// The app client ID.
  ///
  /// Parameter [userPoolId] :
  /// The ID of the Amazon Cognito user pool.
  ///
  /// Parameter [analyticsMetadata] :
  /// The analytics metadata for collecting Amazon Pinpoint metrics for
  /// <code>AdminRespondToAuthChallenge</code> calls.
  ///
  /// Parameter [challengeResponses] :
  /// The challenge responses. These are inputs corresponding to the value of
  /// <code>ChallengeName</code>, for example:
  ///
  /// <ul>
  /// <li>
  /// <code>SMS_MFA</code>: <code>SMS_MFA_CODE</code>, <code>USERNAME</code>,
  /// <code>SECRET_HASH</code> (if app client is configured with client secret).
  /// </li>
  /// <li>
  /// <code>PASSWORD_VERIFIER</code>: <code>PASSWORD_CLAIM_SIGNATURE</code>,
  /// <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, <code>TIMESTAMP</code>,
  /// <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is
  /// configured with client secret).
  /// </li>
  /// <li>
  /// <code>ADMIN_NO_SRP_AUTH</code>: <code>PASSWORD</code>,
  /// <code>USERNAME</code>, <code>SECRET_HASH</code> (if app client is
  /// configured with client secret).
  /// </li>
  /// <li>
  /// <code>NEW_PASSWORD_REQUIRED</code>: <code>NEW_PASSWORD</code>, any other
  /// required attributes, <code>USERNAME</code>, <code>SECRET_HASH</code> (if
  /// app client is configured with client secret).
  /// </li>
  /// </ul>
  /// The value of the <code>USERNAME</code> attribute must be the user's actual
  /// username, not an alias (such as email address or phone number). To make
  /// this easier, the <code>AdminInitiateAuth</code> response includes the
  /// actual username value in the <code>USERNAMEUSER_ID_FOR_SRP</code>
  /// attribute, even if you specified an alias in your call to
  /// <code>AdminInitiateAuth</code>.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the AdminRespondToAuthChallenge API action, Amazon
  /// Cognito invokes any functions that are assigned to the following triggers:
  /// <i>pre sign-up</i>, <i>custom message</i>, <i>post authentication</i>,
  /// <i>user migration</i>, <i>pre token generation</i>, <i>define auth
  /// challenge</i>, <i>create auth challenge</i>, and <i>verify auth challenge
  /// response</i>. When Amazon Cognito invokes any of these functions, it
  /// passes a JSON payload, which the function receives as input. This payload
  /// contains a <code>clientMetadata</code> attribute, which provides the data
  /// that you assigned to the ClientMetadata parameter in your
  /// AdminRespondToAuthChallenge request. In your function code in AWS Lambda,
  /// you can process the <code>clientMetadata</code> value to enhance your
  /// workflow for your specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [contextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  ///
  /// Parameter [session] :
  /// The session which should be passed both ways in challenge-response calls
  /// to the service. If <code>InitiateAuth</code> or
  /// <code>RespondToAuthChallenge</code> API call determines that the caller
  /// needs to go through another challenge, they return a session with other
  /// challenge parameters. This session should be passed as it is to the next
  /// <code>RespondToAuthChallenge</code> API call.
  Future<AdminRespondToAuthChallengeResponse> adminRespondToAuthChallenge({
    @_s.required ChallengeNameType challengeName,
    @_s.required String clientId,
    @_s.required String userPoolId,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> challengeResponses,
    Map<String, String> clientMetadata,
    ContextDataType contextData,
    String session,
  }) async {
    ArgumentError.checkNotNull(challengeName, 'challengeName');
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'session',
      session,
      20,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminRespondToAuthChallenge'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChallengeName': challengeName?.toValue() ?? '',
        'ClientId': clientId,
        'UserPoolId': userPoolId,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (challengeResponses != null)
          'ChallengeResponses': challengeResponses,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (contextData != null) 'ContextData': contextData,
        if (session != null) 'Session': session,
      },
    );

    return AdminRespondToAuthChallengeResponse.fromJson(jsonResponse.body);
  }

  /// Sets the user's multi-factor authentication (MFA) preference, including
  /// which MFA options are enabled and if any are preferred. Only one factor
  /// can be set as preferred. The preferred MFA factor will be used to
  /// authenticate a user if multiple factors are enabled. If multiple options
  /// are enabled and no preference is set, a challenge to choose an MFA option
  /// will be returned during sign in.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user pool username or alias.
  ///
  /// Parameter [sMSMfaSettings] :
  /// The SMS text message MFA settings.
  ///
  /// Parameter [softwareTokenMfaSettings] :
  /// The time-based one-time password software token MFA settings.
  Future<void> adminSetUserMFAPreference({
    @_s.required String userPoolId,
    @_s.required String username,
    SMSMfaSettingsType sMSMfaSettings,
    SoftwareTokenMfaSettingsType softwareTokenMfaSettings,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminSetUserMFAPreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
        if (sMSMfaSettings != null) 'SMSMfaSettings': sMSMfaSettings,
        if (softwareTokenMfaSettings != null)
          'SoftwareTokenMfaSettings': softwareTokenMfaSettings,
      },
    );

    return AdminSetUserMFAPreferenceResponse.fromJson(jsonResponse.body);
  }

  /// Sets the specified user's password in a user pool as an administrator.
  /// Works on any user.
  ///
  /// The password can be temporary or permanent. If it is temporary, the user
  /// status will be placed into the <code>FORCE_CHANGE_PASSWORD</code> state.
  /// When the user next tries to sign in, the InitiateAuth/AdminInitiateAuth
  /// response will contain the <code>NEW_PASSWORD_REQUIRED</code> challenge. If
  /// the user does not sign in before it expires, the user will not be able to
  /// sign in and their password will need to be reset by an administrator.
  ///
  /// Once the user has set a new password, or the password is permanent, the
  /// user status will be set to <code>Confirmed</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPasswordException].
  ///
  /// Parameter [password] :
  /// The password for the user.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to set the user's
  /// password.
  ///
  /// Parameter [username] :
  /// The user name of the user whose password you wish to set.
  ///
  /// Parameter [permanent] :
  /// <code>True</code> if the password is permanent, <code>False</code> if it
  /// is temporary.
  Future<void> adminSetUserPassword({
    @_s.required String password,
    @_s.required String userPoolId,
    @_s.required String username,
    bool permanent,
  }) async {
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      6,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\S]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminSetUserPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Password': password,
        'UserPoolId': userPoolId,
        'Username': username,
        if (permanent != null) 'Permanent': permanent,
      },
    );

    return AdminSetUserPasswordResponse.fromJson(jsonResponse.body);
  }

  /// <i>This action is no longer supported.</i> You can use it to configure
  /// only SMS MFA. You can't use it to configure TOTP software token MFA. To
  /// configure either type of MFA, use <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminSetUserMFAPreference.html">AdminSetUserMFAPreference</a>
  /// instead.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [mFAOptions] :
  /// You can use this parameter only to set an SMS configuration that uses SMS
  /// for delivery.
  ///
  /// Parameter [userPoolId] :
  /// The ID of the user pool that contains the user that you are setting
  /// options for.
  ///
  /// Parameter [username] :
  /// The user name of the user that you are setting options for.
  Future<void> adminSetUserSettings({
    @_s.required List<MFAOptionType> mFAOptions,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(mFAOptions, 'mFAOptions');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminSetUserSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MFAOptions': mFAOptions,
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminSetUserSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Provides feedback for an authentication event as to whether it was from a
  /// valid user. This feedback is used for improving the risk evaluation
  /// decision for the user pool as part of Amazon Cognito advanced security.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [UserPoolAddOnNotEnabledException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [eventId] :
  /// The authentication event ID.
  ///
  /// Parameter [feedbackValue] :
  /// The authentication event feedback value.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user pool username.
  Future<void> adminUpdateAuthEventFeedback({
    @_s.required String eventId,
    @_s.required FeedbackValueType feedbackValue,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(eventId, 'eventId');
    _s.validateStringLength(
      'eventId',
      eventId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventId',
      eventId,
      r'''[\w+-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(feedbackValue, 'feedbackValue');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminUpdateAuthEventFeedback'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventId': eventId,
        'FeedbackValue': feedbackValue?.toValue() ?? '',
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminUpdateAuthEventFeedbackResponse.fromJson(jsonResponse.body);
  }

  /// Updates the device status as an administrator.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [deviceKey] :
  /// The device key.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user name.
  ///
  /// Parameter [deviceRememberedStatus] :
  /// The status indicating whether a device has been remembered or not.
  Future<void> adminUpdateDeviceStatus({
    @_s.required String deviceKey,
    @_s.required String userPoolId,
    @_s.required String username,
    DeviceRememberedStatusType deviceRememberedStatus,
  }) async {
    ArgumentError.checkNotNull(deviceKey, 'deviceKey');
    _s.validateStringLength(
      'deviceKey',
      deviceKey,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceKey',
      deviceKey,
      r'''[\w-]+_[0-9a-f-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminUpdateDeviceStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceKey': deviceKey,
        'UserPoolId': userPoolId,
        'Username': username,
        if (deviceRememberedStatus != null)
          'DeviceRememberedStatus': deviceRememberedStatus.toValue(),
      },
    );

    return AdminUpdateDeviceStatusResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified user's attributes, including developer attributes,
  /// as an administrator. Works on any user.
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  ///
  /// In addition to updating user attributes, this API can also be used to mark
  /// phone and email as verified.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [AliasExistsException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  ///
  /// Parameter [userAttributes] :
  /// An array of name-value pairs representing user attributes.
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to update user
  /// attributes.
  ///
  /// Parameter [username] :
  /// The user name of the user for whom you want to update user attributes.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the AdminUpdateUserAttributes API action, Amazon
  /// Cognito invokes the function that is assigned to the <i>custom message</i>
  /// trigger. When Amazon Cognito invokes this function, it passes a JSON
  /// payload, which the function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your AdminUpdateUserAttributes
  /// request. In your function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  Future<void> adminUpdateUserAttributes({
    @_s.required List<AttributeType> userAttributes,
    @_s.required String userPoolId,
    @_s.required String username,
    Map<String, String> clientMetadata,
  }) async {
    ArgumentError.checkNotNull(userAttributes, 'userAttributes');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.AdminUpdateUserAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserAttributes': userAttributes,
        'UserPoolId': userPoolId,
        'Username': username,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
      },
    );

    return AdminUpdateUserAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Signs out users from all devices, as an administrator. It also invalidates
  /// all refresh tokens issued to a user. The user's current access and Id
  /// tokens remain valid until their expiry. Access and Id tokens expire one
  /// hour after they are issued.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user name.
  Future<void> adminUserGlobalSignOut({
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AdminUserGlobalSignOut'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return AdminUserGlobalSignOutResponse.fromJson(jsonResponse.body);
  }

  /// Returns a unique generated shared secret key code for the user account.
  /// The request takes an access token or a session string, but not both.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [SoftwareTokenMFANotFoundException].
  ///
  /// Parameter [accessToken] :
  /// The access token.
  ///
  /// Parameter [session] :
  /// The session which should be passed both ways in challenge-response calls
  /// to the service. This allows authentication of the user as part of the MFA
  /// setup process.
  Future<AssociateSoftwareTokenResponse> associateSoftwareToken({
    String accessToken,
    String session,
  }) async {
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
    );
    _s.validateStringLength(
      'session',
      session,
      20,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.AssociateSoftwareToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (accessToken != null) 'AccessToken': accessToken,
        if (session != null) 'Session': session,
      },
    );

    return AssociateSoftwareTokenResponse.fromJson(jsonResponse.body);
  }

  /// Changes the password for a specified user in a user pool.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPasswordException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token.
  ///
  /// Parameter [previousPassword] :
  /// The old password.
  ///
  /// Parameter [proposedPassword] :
  /// The new password.
  Future<void> changePassword({
    @_s.required String accessToken,
    @_s.required String previousPassword,
    @_s.required String proposedPassword,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(previousPassword, 'previousPassword');
    _s.validateStringLength(
      'previousPassword',
      previousPassword,
      6,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'previousPassword',
      previousPassword,
      r'''[\S]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(proposedPassword, 'proposedPassword');
    _s.validateStringLength(
      'proposedPassword',
      proposedPassword,
      6,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'proposedPassword',
      proposedPassword,
      r'''[\S]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ChangePassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'PreviousPassword': previousPassword,
        'ProposedPassword': proposedPassword,
      },
    );

    return ChangePasswordResponse.fromJson(jsonResponse.body);
  }

  /// Confirms tracking of the device. This API call is the call that begins
  /// device tracking.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidPasswordException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [UsernameExistsException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token.
  ///
  /// Parameter [deviceKey] :
  /// The device key.
  ///
  /// Parameter [deviceName] :
  /// The device name.
  ///
  /// Parameter [deviceSecretVerifierConfig] :
  /// The configuration of the device secret verifier.
  Future<ConfirmDeviceResponse> confirmDevice({
    @_s.required String accessToken,
    @_s.required String deviceKey,
    String deviceName,
    DeviceSecretVerifierConfigType deviceSecretVerifierConfig,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceKey, 'deviceKey');
    _s.validateStringLength(
      'deviceKey',
      deviceKey,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceKey',
      deviceKey,
      r'''[\w-]+_[0-9a-f-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'deviceName',
      deviceName,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ConfirmDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'DeviceKey': deviceKey,
        if (deviceName != null) 'DeviceName': deviceName,
        if (deviceSecretVerifierConfig != null)
          'DeviceSecretVerifierConfig': deviceSecretVerifierConfig,
      },
    );

    return ConfirmDeviceResponse.fromJson(jsonResponse.body);
  }

  /// Allows a user to enter a confirmation code to reset a forgotten password.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPasswordException].
  /// May throw [NotAuthorizedException].
  /// May throw [CodeMismatchException].
  /// May throw [ExpiredCodeException].
  /// May throw [TooManyFailedAttemptsException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientId] :
  /// The app client ID of the app associated with the user pool.
  ///
  /// Parameter [confirmationCode] :
  /// The confirmation code sent by a user's request to retrieve a forgotten
  /// password. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ForgotPassword.html">ForgotPassword</a>.
  ///
  /// Parameter [password] :
  /// The password sent by a user's request to retrieve a forgotten password.
  ///
  /// Parameter [username] :
  /// The user name of the user for whom you want to enter a code to retrieve a
  /// forgotten password.
  ///
  /// Parameter [analyticsMetadata] :
  /// The Amazon Pinpoint analytics metadata for collecting metrics for
  /// <code>ConfirmForgotPassword</code> calls.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the ConfirmForgotPassword API action, Amazon
  /// Cognito invokes the function that is assigned to the <i>post
  /// confirmation</i> trigger. When Amazon Cognito invokes this function, it
  /// passes a JSON payload, which the function receives as input. This payload
  /// contains a <code>clientMetadata</code> attribute, which provides the data
  /// that you assigned to the ClientMetadata parameter in your
  /// ConfirmForgotPassword request. In your function code in AWS Lambda, you
  /// can process the <code>clientMetadata</code> value to enhance your workflow
  /// for your specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [secretHash] :
  /// A keyed-hash message authentication code (HMAC) calculated using the
  /// secret key of a user pool client and username plus the client ID in the
  /// message.
  ///
  /// Parameter [userContextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  Future<void> confirmForgotPassword({
    @_s.required String clientId,
    @_s.required String confirmationCode,
    @_s.required String password,
    @_s.required String username,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> clientMetadata,
    String secretHash,
    UserContextDataType userContextData,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(confirmationCode, 'confirmationCode');
    _s.validateStringLength(
      'confirmationCode',
      confirmationCode,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'confirmationCode',
      confirmationCode,
      r'''[\S]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      6,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\S]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'secretHash',
      secretHash,
      1,
      128,
    );
    _s.validateStringPattern(
      'secretHash',
      secretHash,
      r'''[\w+=/]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ConfirmForgotPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'ConfirmationCode': confirmationCode,
        'Password': password,
        'Username': username,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (secretHash != null) 'SecretHash': secretHash,
        if (userContextData != null) 'UserContextData': userContextData,
      },
    );

    return ConfirmForgotPasswordResponse.fromJson(jsonResponse.body);
  }

  /// Confirms registration of a user and handles the existing alias from a
  /// previous user.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyFailedAttemptsException].
  /// May throw [CodeMismatchException].
  /// May throw [ExpiredCodeException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [AliasExistsException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientId] :
  /// The ID of the app client associated with the user pool.
  ///
  /// Parameter [confirmationCode] :
  /// The confirmation code sent by a user's request to confirm registration.
  ///
  /// Parameter [username] :
  /// The user name of the user whose registration you wish to confirm.
  ///
  /// Parameter [analyticsMetadata] :
  /// The Amazon Pinpoint analytics metadata for collecting metrics for
  /// <code>ConfirmSignUp</code> calls.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the ConfirmSignUp API action, Amazon Cognito
  /// invokes the function that is assigned to the <i>post confirmation</i>
  /// trigger. When Amazon Cognito invokes this function, it passes a JSON
  /// payload, which the function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your ConfirmSignUp request. In
  /// your function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [forceAliasCreation] :
  /// Boolean to be specified to force user confirmation irrespective of
  /// existing alias. By default set to <code>False</code>. If this parameter is
  /// set to <code>True</code> and the phone number/email used for sign up
  /// confirmation already exists as an alias with a different user, the API
  /// call will migrate the alias from the previous user to the newly created
  /// user being confirmed. If set to <code>False</code>, the API will throw an
  /// <b>AliasExistsException</b> error.
  ///
  /// Parameter [secretHash] :
  /// A keyed-hash message authentication code (HMAC) calculated using the
  /// secret key of a user pool client and username plus the client ID in the
  /// message.
  ///
  /// Parameter [userContextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  Future<void> confirmSignUp({
    @_s.required String clientId,
    @_s.required String confirmationCode,
    @_s.required String username,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> clientMetadata,
    bool forceAliasCreation,
    String secretHash,
    UserContextDataType userContextData,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(confirmationCode, 'confirmationCode');
    _s.validateStringLength(
      'confirmationCode',
      confirmationCode,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'confirmationCode',
      confirmationCode,
      r'''[\S]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'secretHash',
      secretHash,
      1,
      128,
    );
    _s.validateStringPattern(
      'secretHash',
      secretHash,
      r'''[\w+=/]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ConfirmSignUp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'ConfirmationCode': confirmationCode,
        'Username': username,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (forceAliasCreation != null)
          'ForceAliasCreation': forceAliasCreation,
        if (secretHash != null) 'SecretHash': secretHash,
        if (userContextData != null) 'UserContextData': userContextData,
      },
    );

    return ConfirmSignUpResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new group in the specified user pool.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [GroupExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the group. Must be unique.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [description] :
  /// A string containing the description of the group.
  ///
  /// Parameter [precedence] :
  /// A nonnegative integer value that specifies the precedence of this group
  /// relative to the other groups that a user can belong to in the user pool.
  /// Zero is the highest precedence value. Groups with lower
  /// <code>Precedence</code> values take precedence over groups with higher or
  /// null <code>Precedence</code> values. If a user belongs to two or more
  /// groups, it is the group with the lowest precedence value whose role ARN
  /// will be used in the <code>cognito:roles</code> and
  /// <code>cognito:preferred_role</code> claims in the user's tokens.
  ///
  /// Two groups can have the same <code>Precedence</code> value. If this
  /// happens, neither group takes precedence over the other. If two groups with
  /// the same <code>Precedence</code> have the same role ARN, that role is used
  /// in the <code>cognito:preferred_role</code> claim in tokens for users in
  /// each group. If the two groups have different role ARNs, the
  /// <code>cognito:preferred_role</code> claim is not set in users' tokens.
  ///
  /// The default <code>Precedence</code> value is null.
  ///
  /// Parameter [roleArn] :
  /// The role ARN for the group.
  Future<CreateGroupResponse> createGroup({
    @_s.required String groupName,
    @_s.required String userPoolId,
    String description,
    int precedence,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateNumRange(
      'precedence',
      precedence,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:([\w+=/,.@-]*)?:[0-9]+:[\w+=/,.@-]+(:[\w+=/,.@-]+)?(:[\w+=/,.@-]+)?''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.CreateGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        'UserPoolId': userPoolId,
        if (description != null) 'Description': description,
        if (precedence != null) 'Precedence': precedence,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );

    return CreateGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates an identity provider for a user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DuplicateProviderException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [providerDetails] :
  /// The identity provider details. The following list describes the provider
  /// detail keys for each identity provider type.
  ///
  /// <ul>
  /// <li>
  /// For Google and Login with Amazon:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// client_secret
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Facebook:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// client_secret
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// <li>
  /// api_version
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Sign in with Apple:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// team_id
  /// </li>
  /// <li>
  /// key_id
  /// </li>
  /// <li>
  /// private_key
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For OIDC providers:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// client_secret
  /// </li>
  /// <li>
  /// attributes_request_method
  /// </li>
  /// <li>
  /// oidc_issuer
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// <li>
  /// authorize_url <i>if not available from discovery URL specified by
  /// oidc_issuer key</i>
  /// </li>
  /// <li>
  /// token_url <i>if not available from discovery URL specified by oidc_issuer
  /// key</i>
  /// </li>
  /// <li>
  /// attributes_url <i>if not available from discovery URL specified by
  /// oidc_issuer key</i>
  /// </li>
  /// <li>
  /// jwks_uri <i>if not available from discovery URL specified by oidc_issuer
  /// key</i>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For SAML providers:
  ///
  /// <ul>
  /// <li>
  /// MetadataFile OR MetadataURL
  /// </li>
  /// <li>
  /// IDPSignout <i>optional</i>
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [providerName] :
  /// The identity provider name.
  ///
  /// Parameter [providerType] :
  /// The identity provider type.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [attributeMapping] :
  /// A mapping of identity provider attributes to standard and custom user pool
  /// attributes.
  ///
  /// Parameter [idpIdentifiers] :
  /// A list of identity provider identifiers.
  Future<CreateIdentityProviderResponse> createIdentityProvider({
    @_s.required Map<String, String> providerDetails,
    @_s.required String providerName,
    @_s.required IdentityProviderTypeType providerType,
    @_s.required String userPoolId,
    Map<String, String> attributeMapping,
    List<String> idpIdentifiers,
  }) async {
    ArgumentError.checkNotNull(providerDetails, 'providerDetails');
    ArgumentError.checkNotNull(providerName, 'providerName');
    _s.validateStringLength(
      'providerName',
      providerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'providerName',
      providerName,
      r'''[^_][\p{L}\p{M}\p{S}\p{N}\p{P}][^_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(providerType, 'providerType');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.CreateIdentityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProviderDetails': providerDetails,
        'ProviderName': providerName,
        'ProviderType': providerType?.toValue() ?? '',
        'UserPoolId': userPoolId,
        if (attributeMapping != null) 'AttributeMapping': attributeMapping,
        if (idpIdentifiers != null) 'IdpIdentifiers': idpIdentifiers,
      },
    );

    return CreateIdentityProviderResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new OAuth2.0 resource server and defines custom scopes in it.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identifier] :
  /// A unique resource server identifier for the resource server. This could be
  /// an HTTPS endpoint where the resource server is located. For example,
  /// <code>https://my-weather-api.example.com</code>.
  ///
  /// Parameter [name] :
  /// A friendly name for the resource server.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [scopes] :
  /// A list of scopes. Each scope is map, where the keys are <code>name</code>
  /// and <code>description</code>.
  Future<CreateResourceServerResponse> createResourceServer({
    @_s.required String identifier,
    @_s.required String name,
    @_s.required String userPoolId,
    List<ResourceServerScopeType> scopes,
  }) async {
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identifier',
      identifier,
      r'''[\x21\x23-\x5B\x5D-\x7E]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w\s+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.CreateResourceServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'Name': name,
        'UserPoolId': userPoolId,
        if (scopes != null) 'Scopes': scopes,
      },
    );

    return CreateResourceServerResponse.fromJson(jsonResponse.body);
  }

  /// Creates the user import job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [PreconditionNotMetException].
  /// May throw [NotAuthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [cloudWatchLogsRoleArn] :
  /// The role ARN for the Amazon CloudWatch Logging role for the user import
  /// job.
  ///
  /// Parameter [jobName] :
  /// The job name for the user import job.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that the users are being imported into.
  Future<CreateUserImportJobResponse> createUserImportJob({
    @_s.required String cloudWatchLogsRoleArn,
    @_s.required String jobName,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(cloudWatchLogsRoleArn, 'cloudWatchLogsRoleArn');
    _s.validateStringLength(
      'cloudWatchLogsRoleArn',
      cloudWatchLogsRoleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'cloudWatchLogsRoleArn',
      cloudWatchLogsRoleArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:([\w+=/,.@-]*)?:[0-9]+:[\w+=/,.@-]+(:[\w+=/,.@-]+)?(:[\w+=/,.@-]+)?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''[\w\s+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.CreateUserImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
        'JobName': jobName,
        'UserPoolId': userPoolId,
      },
    );

    return CreateUserImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon Cognito user pool and sets the password policy for
  /// the pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserPoolTaggingException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [poolName] :
  /// A string used to name the user pool.
  ///
  /// Parameter [accountRecoverySetting] :
  /// Use this setting to define which verified available method a user can use
  /// to recover their password when they call <code>ForgotPassword</code>. It
  /// allows you to define a preferred method when a user has more than one
  /// method available. With this setting, SMS does not qualify for a valid
  /// password recovery mechanism if the user also has SMS MFA enabled. In the
  /// absence of this setting, Cognito uses the legacy behavior to determine the
  /// recovery method where SMS is preferred over email.
  ///
  /// Parameter [adminCreateUserConfig] :
  /// The configuration for <code>AdminCreateUser</code> requests.
  ///
  /// Parameter [aliasAttributes] :
  /// Attributes supported as an alias for this user pool. Possible values:
  /// <b>phone_number</b>, <b>email</b>, or <b>preferred_username</b>.
  ///
  /// Parameter [autoVerifiedAttributes] :
  /// The attributes to be auto-verified. Possible values: <b>email</b>,
  /// <b>phone_number</b>.
  ///
  /// Parameter [deviceConfiguration] :
  /// The device configuration.
  ///
  /// Parameter [emailConfiguration] :
  /// The email configuration.
  ///
  /// Parameter [emailVerificationMessage] :
  /// A string representing the email verification message.
  /// EmailVerificationMessage is allowed only if <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a>
  /// is DEVELOPER.
  ///
  /// Parameter [emailVerificationSubject] :
  /// A string representing the email verification subject.
  /// EmailVerificationSubject is allowed only if <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a>
  /// is DEVELOPER.
  ///
  /// Parameter [lambdaConfig] :
  /// The Lambda trigger configuration information for the new user pool.
  /// <note>
  /// In a push model, event sources (such as Amazon S3 and custom applications)
  /// need permission to invoke a function. So you will need to make an extra
  /// call to add permission for these event sources to invoke your Lambda
  /// function.
  /// <p/>
  /// For more information on using the Lambda API to add permission, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/API_AddPermission.html">
  /// AddPermission </a>.
  ///
  /// For adding permission using the AWS CLI, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/lambda/add-permission.html">
  /// add-permission </a>.
  /// </note>
  ///
  /// Parameter [mfaConfiguration] :
  /// Specifies MFA configuration details.
  ///
  /// Parameter [policies] :
  /// The policies associated with the new user pool.
  ///
  /// Parameter [schema] :
  /// An array of schema attributes for the new user pool. These attributes can
  /// be standard or custom attributes.
  ///
  /// Parameter [smsAuthenticationMessage] :
  /// A string representing the SMS authentication message.
  ///
  /// Parameter [smsConfiguration] :
  /// The SMS configuration.
  ///
  /// Parameter [smsVerificationMessage] :
  /// A string representing the SMS verification message.
  ///
  /// Parameter [userPoolAddOns] :
  /// Used to enable advanced security risk detection. Set the key
  /// <code>AdvancedSecurityMode</code> to the value "AUDIT".
  ///
  /// Parameter [userPoolTags] :
  /// The tag keys and values to assign to the user pool. A tag is a label that
  /// you can use to categorize and manage user pools in different ways, such as
  /// by purpose, owner, environment, or other criteria.
  ///
  /// Parameter [usernameAttributes] :
  /// Specifies whether email addresses or phone numbers can be specified as
  /// usernames when a user signs up.
  ///
  /// Parameter [usernameConfiguration] :
  /// You can choose to set case sensitivity on the username input for the
  /// selected sign-in option. For example, when this is set to
  /// <code>False</code>, users will be able to sign in using either "username"
  /// or "Username". This configuration is immutable once it has been set. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UsernameConfigurationType.html">UsernameConfigurationType</a>.
  ///
  /// Parameter [verificationMessageTemplate] :
  /// The template for the verification message that the user sees when the app
  /// requests permission to access the user's information.
  Future<CreateUserPoolResponse> createUserPool({
    @_s.required String poolName,
    AccountRecoverySettingType accountRecoverySetting,
    AdminCreateUserConfigType adminCreateUserConfig,
    List<AliasAttributeType> aliasAttributes,
    List<VerifiedAttributeType> autoVerifiedAttributes,
    DeviceConfigurationType deviceConfiguration,
    EmailConfigurationType emailConfiguration,
    String emailVerificationMessage,
    String emailVerificationSubject,
    LambdaConfigType lambdaConfig,
    UserPoolMfaType mfaConfiguration,
    UserPoolPolicyType policies,
    List<SchemaAttributeType> schema,
    String smsAuthenticationMessage,
    SmsConfigurationType smsConfiguration,
    String smsVerificationMessage,
    UserPoolAddOnsType userPoolAddOns,
    Map<String, String> userPoolTags,
    List<UsernameAttributeType> usernameAttributes,
    UsernameConfigurationType usernameConfiguration,
    VerificationMessageTemplateType verificationMessageTemplate,
  }) async {
    ArgumentError.checkNotNull(poolName, 'poolName');
    _s.validateStringLength(
      'poolName',
      poolName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'poolName',
      poolName,
      r'''[\w\s+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'emailVerificationMessage',
      emailVerificationMessage,
      6,
      20000,
    );
    _s.validateStringPattern(
      'emailVerificationMessage',
      emailVerificationMessage,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}\s*]*\{####\}[\p{L}\p{M}\p{S}\p{N}\p{P}\s*]*''',
    );
    _s.validateStringLength(
      'emailVerificationSubject',
      emailVerificationSubject,
      1,
      140,
    );
    _s.validateStringPattern(
      'emailVerificationSubject',
      emailVerificationSubject,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}\s]+''',
    );
    _s.validateStringLength(
      'smsAuthenticationMessage',
      smsAuthenticationMessage,
      6,
      140,
    );
    _s.validateStringPattern(
      'smsAuthenticationMessage',
      smsAuthenticationMessage,
      r'''.*\{####\}.*''',
    );
    _s.validateStringLength(
      'smsVerificationMessage',
      smsVerificationMessage,
      6,
      140,
    );
    _s.validateStringPattern(
      'smsVerificationMessage',
      smsVerificationMessage,
      r'''.*\{####\}.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.CreateUserPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PoolName': poolName,
        if (accountRecoverySetting != null)
          'AccountRecoverySetting': accountRecoverySetting,
        if (adminCreateUserConfig != null)
          'AdminCreateUserConfig': adminCreateUserConfig,
        if (aliasAttributes != null)
          'AliasAttributes':
              aliasAttributes.map((e) => e?.toValue() ?? '').toList(),
        if (autoVerifiedAttributes != null)
          'AutoVerifiedAttributes':
              autoVerifiedAttributes.map((e) => e?.toValue() ?? '').toList(),
        if (deviceConfiguration != null)
          'DeviceConfiguration': deviceConfiguration,
        if (emailConfiguration != null)
          'EmailConfiguration': emailConfiguration,
        if (emailVerificationMessage != null)
          'EmailVerificationMessage': emailVerificationMessage,
        if (emailVerificationSubject != null)
          'EmailVerificationSubject': emailVerificationSubject,
        if (lambdaConfig != null) 'LambdaConfig': lambdaConfig,
        if (mfaConfiguration != null)
          'MfaConfiguration': mfaConfiguration.toValue(),
        if (policies != null) 'Policies': policies,
        if (schema != null) 'Schema': schema,
        if (smsAuthenticationMessage != null)
          'SmsAuthenticationMessage': smsAuthenticationMessage,
        if (smsConfiguration != null) 'SmsConfiguration': smsConfiguration,
        if (smsVerificationMessage != null)
          'SmsVerificationMessage': smsVerificationMessage,
        if (userPoolAddOns != null) 'UserPoolAddOns': userPoolAddOns,
        if (userPoolTags != null) 'UserPoolTags': userPoolTags,
        if (usernameAttributes != null)
          'UsernameAttributes':
              usernameAttributes.map((e) => e?.toValue() ?? '').toList(),
        if (usernameConfiguration != null)
          'UsernameConfiguration': usernameConfiguration,
        if (verificationMessageTemplate != null)
          'VerificationMessageTemplate': verificationMessageTemplate,
      },
    );

    return CreateUserPoolResponse.fromJson(jsonResponse.body);
  }

  /// Creates the user pool client.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [NotAuthorizedException].
  /// May throw [ScopeDoesNotExistException].
  /// May throw [InvalidOAuthFlowException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientName] :
  /// The client name for the user pool client you would like to create.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to create a user pool
  /// client.
  ///
  /// Parameter [accessTokenValidity] :
  /// The time limit, between 5 minutes and 1 day, after which the access token
  /// is no longer valid and cannot be used. This value will be overridden if
  /// you have entered a value in TokenValidityUnits.
  ///
  /// Parameter [allowedOAuthFlows] :
  /// The allowed OAuth flows.
  ///
  /// Set to <code>code</code> to initiate a code grant flow, which provides an
  /// authorization code as the response. This code can be exchanged for access
  /// tokens with the token endpoint.
  ///
  /// Set to <code>implicit</code> to specify that the client should get the
  /// access token (and, optionally, ID token, based on scopes) directly.
  ///
  /// Set to <code>client_credentials</code> to specify that the client should
  /// get the access token (and, optionally, ID token, based on scopes) from the
  /// token endpoint using a combination of client and client_secret.
  ///
  /// Parameter [allowedOAuthFlowsUserPoolClient] :
  /// Set to true if the client is allowed to follow the OAuth protocol when
  /// interacting with Cognito user pools.
  ///
  /// Parameter [allowedOAuthScopes] :
  /// The allowed OAuth scopes. Possible values provided by OAuth are:
  /// <code>phone</code>, <code>email</code>, <code>openid</code>, and
  /// <code>profile</code>. Possible values provided by AWS are:
  /// <code>aws.cognito.signin.user.admin</code>. Custom scopes created in
  /// Resource Servers are also supported.
  ///
  /// Parameter [analyticsConfiguration] :
  /// The Amazon Pinpoint analytics configuration for collecting metrics for
  /// this user pool.
  /// <note>
  /// In regions where Pinpoint is not available, Cognito User Pools only
  /// supports sending events to Amazon Pinpoint projects in us-east-1. In
  /// regions where Pinpoint is available, Cognito User Pools will support
  /// sending events to Amazon Pinpoint projects within that same region.
  /// </note>
  ///
  /// Parameter [callbackURLs] :
  /// A list of allowed redirect (callback) URLs for the identity providers.
  ///
  /// A redirect URI must:
  ///
  /// <ul>
  /// <li>
  /// Be an absolute URI.
  /// </li>
  /// <li>
  /// Be registered with the authorization server.
  /// </li>
  /// <li>
  /// Not include a fragment component.
  /// </li>
  /// </ul>
  /// See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0
  /// - Redirection Endpoint</a>.
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// Parameter [defaultRedirectURI] :
  /// The default redirect URI. Must be in the <code>CallbackURLs</code> list.
  ///
  /// A redirect URI must:
  ///
  /// <ul>
  /// <li>
  /// Be an absolute URI.
  /// </li>
  /// <li>
  /// Be registered with the authorization server.
  /// </li>
  /// <li>
  /// Not include a fragment component.
  /// </li>
  /// </ul>
  /// See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0
  /// - Redirection Endpoint</a>.
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// Parameter [explicitAuthFlows] :
  /// The authentication flows that are supported by the user pool clients. Flow
  /// names without the <code>ALLOW_</code> prefix are deprecated in favor of
  /// new names with the <code>ALLOW_</code> prefix. Note that values with
  /// <code>ALLOW_</code> prefix cannot be used along with values without
  /// <code>ALLOW_</code> prefix.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user
  /// password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This
  /// setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this
  /// authentication flow, Cognito receives the password in the request instead
  /// of using the SRP (Secure Remote Password protocol) protocol to verify
  /// passwords.
  /// </li>
  /// <li>
  /// <code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based
  /// authentication.
  /// </li>
  /// <li>
  /// <code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based
  /// authentication. In this flow, Cognito receives the password in the request
  /// instead of using the SRP protocol to verify passwords.
  /// </li>
  /// <li>
  /// <code>ALLOW_USER_SRP_AUTH</code>: Enable SRP based authentication.
  /// </li>
  /// <li>
  /// <code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [generateSecret] :
  /// Boolean to specify whether you want to generate a secret for the user pool
  /// client being created.
  ///
  /// Parameter [idTokenValidity] :
  /// The time limit, between 5 minutes and 1 day, after which the ID token is
  /// no longer valid and cannot be used. This value will be overridden if you
  /// have entered a value in TokenValidityUnits.
  ///
  /// Parameter [logoutURLs] :
  /// A list of allowed logout URLs for the identity providers.
  ///
  /// Parameter [preventUserExistenceErrors] :
  /// Use this setting to choose which errors and responses are returned by
  /// Cognito APIs during authentication, account confirmation, and password
  /// recovery when the user does not exist in the user pool. When set to
  /// <code>ENABLED</code> and the user does not exist, authentication returns
  /// an error indicating either the username or password was incorrect, and
  /// account confirmation and password recovery return a response indicating a
  /// code was sent to a simulated destination. When set to <code>LEGACY</code>,
  /// those APIs will return a <code>UserNotFoundException</code> exception if
  /// the user does not exist in the user pool.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - This prevents user existence-related errors.
  /// </li>
  /// <li>
  /// <code>LEGACY</code> - This represents the old behavior of Cognito where
  /// user existence related errors are not prevented.
  /// </li>
  /// </ul> <note>
  /// After February 15th 2020, the value of
  /// <code>PreventUserExistenceErrors</code> will default to
  /// <code>ENABLED</code> for newly created user pool clients if no value is
  /// provided.
  /// </note>
  ///
  /// Parameter [readAttributes] :
  /// The read attributes.
  ///
  /// Parameter [refreshTokenValidity] :
  /// The time limit, in days, after which the refresh token is no longer valid
  /// and cannot be used.
  ///
  /// Parameter [supportedIdentityProviders] :
  /// A list of provider names for the identity providers that are supported on
  /// this client. The following are supported: <code>COGNITO</code>,
  /// <code>Facebook</code>, <code>Google</code> and
  /// <code>LoginWithAmazon</code>.
  ///
  /// Parameter [tokenValidityUnits] :
  /// The units in which the validity times are represented in. Default for
  /// RefreshToken is days, and default for ID and access tokens are hours.
  ///
  /// Parameter [writeAttributes] :
  /// The user pool attributes that the app client can write to.
  ///
  /// If your app client allows users to sign in through an identity provider,
  /// this array must include all attributes that are mapped to identity
  /// provider attributes. Amazon Cognito updates mapped attributes when users
  /// sign in to your application through an identity provider. If your app
  /// client lacks write access to a mapped attribute, Amazon Cognito throws an
  /// error when it attempts to update the attribute. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html">Specifying
  /// Identity Provider Attribute Mappings for Your User Pool</a>.
  Future<CreateUserPoolClientResponse> createUserPoolClient({
    @_s.required String clientName,
    @_s.required String userPoolId,
    int accessTokenValidity,
    List<OAuthFlowType> allowedOAuthFlows,
    bool allowedOAuthFlowsUserPoolClient,
    List<String> allowedOAuthScopes,
    AnalyticsConfigurationType analyticsConfiguration,
    List<String> callbackURLs,
    String defaultRedirectURI,
    List<ExplicitAuthFlowsType> explicitAuthFlows,
    bool generateSecret,
    int idTokenValidity,
    List<String> logoutURLs,
    PreventUserExistenceErrorTypes preventUserExistenceErrors,
    List<String> readAttributes,
    int refreshTokenValidity,
    List<String> supportedIdentityProviders,
    TokenValidityUnitsType tokenValidityUnits,
    List<String> writeAttributes,
  }) async {
    ArgumentError.checkNotNull(clientName, 'clientName');
    _s.validateStringLength(
      'clientName',
      clientName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientName',
      clientName,
      r'''[\w\s+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'accessTokenValidity',
      accessTokenValidity,
      1,
      86400,
    );
    _s.validateStringLength(
      'defaultRedirectURI',
      defaultRedirectURI,
      1,
      1024,
    );
    _s.validateStringPattern(
      'defaultRedirectURI',
      defaultRedirectURI,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
    );
    _s.validateNumRange(
      'idTokenValidity',
      idTokenValidity,
      1,
      86400,
    );
    _s.validateNumRange(
      'refreshTokenValidity',
      refreshTokenValidity,
      0,
      315360000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.CreateUserPoolClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientName': clientName,
        'UserPoolId': userPoolId,
        if (accessTokenValidity != null)
          'AccessTokenValidity': accessTokenValidity,
        if (allowedOAuthFlows != null)
          'AllowedOAuthFlows':
              allowedOAuthFlows.map((e) => e?.toValue() ?? '').toList(),
        if (allowedOAuthFlowsUserPoolClient != null)
          'AllowedOAuthFlowsUserPoolClient': allowedOAuthFlowsUserPoolClient,
        if (allowedOAuthScopes != null)
          'AllowedOAuthScopes': allowedOAuthScopes,
        if (analyticsConfiguration != null)
          'AnalyticsConfiguration': analyticsConfiguration,
        if (callbackURLs != null) 'CallbackURLs': callbackURLs,
        if (defaultRedirectURI != null)
          'DefaultRedirectURI': defaultRedirectURI,
        if (explicitAuthFlows != null)
          'ExplicitAuthFlows':
              explicitAuthFlows.map((e) => e?.toValue() ?? '').toList(),
        if (generateSecret != null) 'GenerateSecret': generateSecret,
        if (idTokenValidity != null) 'IdTokenValidity': idTokenValidity,
        if (logoutURLs != null) 'LogoutURLs': logoutURLs,
        if (preventUserExistenceErrors != null)
          'PreventUserExistenceErrors': preventUserExistenceErrors.toValue(),
        if (readAttributes != null) 'ReadAttributes': readAttributes,
        if (refreshTokenValidity != null)
          'RefreshTokenValidity': refreshTokenValidity,
        if (supportedIdentityProviders != null)
          'SupportedIdentityProviders': supportedIdentityProviders,
        if (tokenValidityUnits != null)
          'TokenValidityUnits': tokenValidityUnits,
        if (writeAttributes != null) 'WriteAttributes': writeAttributes,
      },
    );

    return CreateUserPoolClientResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new domain for a user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [domain] :
  /// The domain string.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [customDomainConfig] :
  /// The configuration for a custom domain that hosts the sign-up and sign-in
  /// webpages for your application.
  ///
  /// Provide this parameter only if you want to use a custom domain for your
  /// user pool. Otherwise, you can exclude this parameter and use the Amazon
  /// Cognito hosted domain instead.
  ///
  /// For more information about the hosted domain and custom domains, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-assign-domain.html">Configuring
  /// a User Pool Domain</a>.
  Future<CreateUserPoolDomainResponse> createUserPoolDomain({
    @_s.required String domain,
    @_s.required String userPoolId,
    CustomDomainConfigType customDomainConfig,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domain',
      domain,
      r'''^[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.CreateUserPoolDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Domain': domain,
        'UserPoolId': userPoolId,
        if (customDomainConfig != null)
          'CustomDomainConfig': customDomainConfig,
      },
    );

    return CreateUserPoolDomainResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a group. Currently only groups with no members can be deleted.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  Future<void> deleteGroup({
    @_s.required String groupName,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        'UserPoolId': userPoolId,
      },
    );
  }

  /// Deletes an identity provider for a user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedIdentityProviderException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [providerName] :
  /// The identity provider name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  Future<void> deleteIdentityProvider({
    @_s.required String providerName,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(providerName, 'providerName');
    _s.validateStringLength(
      'providerName',
      providerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'providerName',
      providerName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteIdentityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProviderName': providerName,
        'UserPoolId': userPoolId,
      },
    );
  }

  /// Deletes a resource server.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identifier] :
  /// The identifier for the resource server.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that hosts the resource server.
  Future<void> deleteResourceServer({
    @_s.required String identifier,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identifier',
      identifier,
      r'''[\x21\x23-\x5B\x5D-\x7E]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteResourceServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'UserPoolId': userPoolId,
      },
    );
  }

  /// Allows a user to delete himself or herself.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token from a request to delete a user.
  Future<void> deleteUser({
    @_s.required String accessToken,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
      },
    );
  }

  /// Deletes the attributes for a user.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token used in the request to delete user attributes.
  ///
  /// Parameter [userAttributeNames] :
  /// An array of strings representing the user attribute names you wish to
  /// delete.
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  Future<void> deleteUserAttributes({
    @_s.required String accessToken,
    @_s.required List<String> userAttributeNames,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userAttributeNames, 'userAttributeNames');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteUserAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'UserAttributeNames': userAttributeNames,
      },
    );

    return DeleteUserAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified Amazon Cognito user pool.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserImportInProgressException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool you want to delete.
  Future<void> deleteUserPool({
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteUserPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
      },
    );
  }

  /// Allows the developer to delete the user pool client.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientId] :
  /// The app client ID of the app associated with the user pool.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to delete the client.
  Future<void> deleteUserPoolClient({
    @_s.required String clientId,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteUserPoolClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'UserPoolId': userPoolId,
      },
    );
  }

  /// Deletes a domain for a user pool.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [domain] :
  /// The domain string.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  Future<void> deleteUserPoolDomain({
    @_s.required String domain,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domain',
      domain,
      r'''^[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DeleteUserPoolDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Domain': domain,
        'UserPoolId': userPoolId,
      },
    );

    return DeleteUserPoolDomainResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specific identity provider.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [providerName] :
  /// The identity provider name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  Future<DescribeIdentityProviderResponse> describeIdentityProvider({
    @_s.required String providerName,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(providerName, 'providerName');
    _s.validateStringLength(
      'providerName',
      providerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'providerName',
      providerName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.DescribeIdentityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProviderName': providerName,
        'UserPoolId': userPoolId,
      },
    );

    return DescribeIdentityProviderResponse.fromJson(jsonResponse.body);
  }

  /// Describes a resource server.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identifier] :
  /// The identifier for the resource server
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that hosts the resource server.
  Future<DescribeResourceServerResponse> describeResourceServer({
    @_s.required String identifier,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identifier',
      identifier,
      r'''[\x21\x23-\x5B\x5D-\x7E]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DescribeResourceServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'UserPoolId': userPoolId,
      },
    );

    return DescribeResourceServerResponse.fromJson(jsonResponse.body);
  }

  /// Describes the risk configuration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserPoolAddOnNotEnabledException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [clientId] :
  /// The app client ID.
  Future<DescribeRiskConfigurationResponse> describeRiskConfiguration({
    @_s.required String userPoolId,
    String clientId,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.DescribeRiskConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (clientId != null) 'ClientId': clientId,
      },
    );

    return DescribeRiskConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Describes the user import job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [jobId] :
  /// The job ID for the user import job.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that the users are being imported into.
  Future<DescribeUserImportJobResponse> describeUserImportJob({
    @_s.required String jobId,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''import-[0-9a-zA-Z-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DescribeUserImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        'UserPoolId': userPoolId,
      },
    );

    return DescribeUserImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Returns the configuration information and metadata of the specified user
  /// pool.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserPoolTaggingException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool you want to describe.
  Future<DescribeUserPoolResponse> describeUserPool({
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DescribeUserPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
      },
    );

    return DescribeUserPoolResponse.fromJson(jsonResponse.body);
  }

  /// Client method for returning the configuration information and metadata of
  /// the specified user pool app client.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientId] :
  /// The app client ID of the app associated with the user pool.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool you want to describe.
  Future<DescribeUserPoolClientResponse> describeUserPoolClient({
    @_s.required String clientId,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DescribeUserPoolClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'UserPoolId': userPoolId,
      },
    );

    return DescribeUserPoolClientResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a domain.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [domain] :
  /// The domain string.
  Future<DescribeUserPoolDomainResponse> describeUserPoolDomain({
    @_s.required String domain,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domain',
      domain,
      r'''^[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.DescribeUserPoolDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Domain': domain,
      },
    );

    return DescribeUserPoolDomainResponse.fromJson(jsonResponse.body);
  }

  /// Forgets the specified device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [deviceKey] :
  /// The device key.
  ///
  /// Parameter [accessToken] :
  /// The access token for the forgotten device request.
  Future<void> forgetDevice({
    @_s.required String deviceKey,
    String accessToken,
  }) async {
    ArgumentError.checkNotNull(deviceKey, 'deviceKey');
    _s.validateStringLength(
      'deviceKey',
      deviceKey,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceKey',
      deviceKey,
      r'''[\w-]+_[0-9a-f-]+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ForgetDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceKey': deviceKey,
        if (accessToken != null) 'AccessToken': accessToken,
      },
    );
  }

  /// Calling this API causes a message to be sent to the end user with a
  /// confirmation code that is required to change the user's password. For the
  /// <code>Username</code> parameter, you can use the username or user alias.
  /// The method used to send the confirmation code is sent according to the
  /// specified AccountRecoverySetting. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-recover-a-user-account.html">Recovering
  /// User Accounts</a> in the <i>Amazon Cognito Developer Guide</i>. If neither
  /// a verified phone number nor a verified email exists, an
  /// <code>InvalidParameterException</code> is thrown. To use the confirmation
  /// code for resetting the password, call <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_ConfirmForgotPassword.html">ConfirmForgotPassword</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [CodeDeliveryFailureException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientId] :
  /// The ID of the client associated with the user pool.
  ///
  /// Parameter [username] :
  /// The user name of the user for whom you want to enter a code to reset a
  /// forgotten password.
  ///
  /// Parameter [analyticsMetadata] :
  /// The Amazon Pinpoint analytics metadata for collecting metrics for
  /// <code>ForgotPassword</code> calls.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the ForgotPassword API action, Amazon Cognito
  /// invokes any functions that are assigned to the following triggers: <i>pre
  /// sign-up</i>, <i>custom message</i>, and <i>user migration</i>. When Amazon
  /// Cognito invokes any of these functions, it passes a JSON payload, which
  /// the function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your ForgotPassword request.
  /// In your function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [secretHash] :
  /// A keyed-hash message authentication code (HMAC) calculated using the
  /// secret key of a user pool client and username plus the client ID in the
  /// message.
  ///
  /// Parameter [userContextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  Future<ForgotPasswordResponse> forgotPassword({
    @_s.required String clientId,
    @_s.required String username,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> clientMetadata,
    String secretHash,
    UserContextDataType userContextData,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'secretHash',
      secretHash,
      1,
      128,
    );
    _s.validateStringPattern(
      'secretHash',
      secretHash,
      r'''[\w+=/]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ForgotPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'Username': username,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (secretHash != null) 'SecretHash': secretHash,
        if (userContextData != null) 'UserContextData': userContextData,
      },
    );

    return ForgotPasswordResponse.fromJson(jsonResponse.body);
  }

  /// Gets the header information for the .csv file to be used as input for the
  /// user import job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that the users are to be imported into.
  Future<GetCSVHeaderResponse> getCSVHeader({
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GetCSVHeader'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
      },
    );

    return GetCSVHeaderResponse.fromJson(jsonResponse.body);
  }

  /// Gets the device.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [deviceKey] :
  /// The device key.
  ///
  /// Parameter [accessToken] :
  /// The access token.
  Future<GetDeviceResponse> getDevice({
    @_s.required String deviceKey,
    String accessToken,
  }) async {
    ArgumentError.checkNotNull(deviceKey, 'deviceKey');
    _s.validateStringLength(
      'deviceKey',
      deviceKey,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceKey',
      deviceKey,
      r'''[\w-]+_[0-9a-f-]+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GetDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceKey': deviceKey,
        if (accessToken != null) 'AccessToken': accessToken,
      },
    );

    return GetDeviceResponse.fromJson(jsonResponse.body);
  }

  /// Gets a group.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  Future<GetGroupResponse> getGroup({
    @_s.required String groupName,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        'UserPoolId': userPoolId,
      },
    );

    return GetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Gets the specified identity provider.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [idpIdentifier] :
  /// The identity provider ID.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  Future<GetIdentityProviderByIdentifierResponse>
      getIdentityProviderByIdentifier({
    @_s.required String idpIdentifier,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(idpIdentifier, 'idpIdentifier');
    _s.validateStringLength(
      'idpIdentifier',
      idpIdentifier,
      1,
      40,
      isRequired: true,
    );
    _s.validateStringPattern(
      'idpIdentifier',
      idpIdentifier,
      r'''[\w\s+=.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.GetIdentityProviderByIdentifier'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdpIdentifier': idpIdentifier,
        'UserPoolId': userPoolId,
      },
    );

    return GetIdentityProviderByIdentifierResponse.fromJson(jsonResponse.body);
  }

  /// This method takes a user pool ID, and returns the signing certificate.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  Future<GetSigningCertificateResponse> getSigningCertificate({
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GetSigningCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
      },
    );

    return GetSigningCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Gets the UI Customization information for a particular app client's app
  /// UI, if there is something set. If nothing is set for the particular
  /// client, but there is an existing pool level customization (app
  /// <code>clientId</code> will be <code>ALL</code>), then that is returned. If
  /// nothing is present, then an empty shape is returned.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [clientId] :
  /// The client ID for the client app.
  Future<GetUICustomizationResponse> getUICustomization({
    @_s.required String userPoolId,
    String clientId,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GetUICustomization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (clientId != null) 'ClientId': clientId,
      },
    );

    return GetUICustomizationResponse.fromJson(jsonResponse.body);
  }

  /// Gets the user attributes and metadata for a user.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token returned by the server response to get information about
  /// the user.
  Future<GetUserResponse> getUser({
    @_s.required String accessToken,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GetUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
      },
    );

    return GetUserResponse.fromJson(jsonResponse.body);
  }

  /// Gets the user attribute verification code for the specified attribute
  /// name.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [CodeDeliveryFailureException].
  /// May throw [LimitExceededException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token returned by the server response to get the user attribute
  /// verification code.
  ///
  /// Parameter [attributeName] :
  /// The attribute name returned by the server response to get the user
  /// attribute verification code.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the GetUserAttributeVerificationCode API action,
  /// Amazon Cognito invokes the function that is assigned to the <i>custom
  /// message</i> trigger. When Amazon Cognito invokes this function, it passes
  /// a JSON payload, which the function receives as input. This payload
  /// contains a <code>clientMetadata</code> attribute, which provides the data
  /// that you assigned to the ClientMetadata parameter in your
  /// GetUserAttributeVerificationCode request. In your function code in AWS
  /// Lambda, you can process the <code>clientMetadata</code> value to enhance
  /// your workflow for your specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  Future<GetUserAttributeVerificationCodeResponse>
      getUserAttributeVerificationCode({
    @_s.required String accessToken,
    @_s.required String attributeName,
    Map<String, String> clientMetadata,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    _s.validateStringLength(
      'attributeName',
      attributeName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'attributeName',
      attributeName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.GetUserAttributeVerificationCode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'AttributeName': attributeName,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
      },
    );

    return GetUserAttributeVerificationCodeResponse.fromJson(jsonResponse.body);
  }

  /// Gets the user pool multi-factor authentication (MFA) configuration.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  Future<GetUserPoolMfaConfigResponse> getUserPoolMfaConfig({
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GetUserPoolMfaConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
      },
    );

    return GetUserPoolMfaConfigResponse.fromJson(jsonResponse.body);
  }

  /// Signs out users from all devices. It also invalidates all refresh tokens
  /// issued to a user. The user's current access and Id tokens remain valid
  /// until their expiry. Access and Id tokens expire one hour after they are
  /// issued.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token.
  Future<void> globalSignOut({
    @_s.required String accessToken,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.GlobalSignOut'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
      },
    );

    return GlobalSignOutResponse.fromJson(jsonResponse.body);
  }

  /// Initiates the authentication flow.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  ///
  /// Parameter [authFlow] :
  /// The authentication flow for this call to execute. The API action will
  /// depend on this value. For example:
  ///
  /// <ul>
  /// <li>
  /// <code>REFRESH_TOKEN_AUTH</code> will take in a valid refresh token and
  /// return new tokens.
  /// </li>
  /// <li>
  /// <code>USER_SRP_AUTH</code> will take in <code>USERNAME</code> and
  /// <code>SRP_A</code> and return the SRP variables to be used for next
  /// challenge execution.
  /// </li>
  /// <li>
  /// <code>USER_PASSWORD_AUTH</code> will take in <code>USERNAME</code> and
  /// <code>PASSWORD</code> and return the next challenge or tokens.
  /// </li>
  /// </ul>
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>USER_SRP_AUTH</code>: Authentication flow for the Secure Remote
  /// Password (SRP) protocol.
  /// </li>
  /// <li>
  /// <code>REFRESH_TOKEN_AUTH</code>/<code>REFRESH_TOKEN</code>: Authentication
  /// flow for refreshing the access token and ID token by supplying a valid
  /// refresh token.
  /// </li>
  /// <li>
  /// <code>CUSTOM_AUTH</code>: Custom authentication flow.
  /// </li>
  /// <li>
  /// <code>USER_PASSWORD_AUTH</code>: Non-SRP authentication flow; USERNAME and
  /// PASSWORD are passed directly. If a user migration Lambda trigger is set,
  /// this flow will invoke the user migration Lambda if the USERNAME is not
  /// found in the user pool.
  /// </li>
  /// <li>
  /// <code>ADMIN_USER_PASSWORD_AUTH</code>: Admin-based user password
  /// authentication. This replaces the <code>ADMIN_NO_SRP_AUTH</code>
  /// authentication flow. In this flow, Cognito receives the password in the
  /// request instead of using the SRP process to verify passwords.
  /// </li>
  /// </ul>
  /// <code>ADMIN_NO_SRP_AUTH</code> is not a valid value.
  ///
  /// Parameter [clientId] :
  /// The app client ID.
  ///
  /// Parameter [analyticsMetadata] :
  /// The Amazon Pinpoint analytics metadata for collecting metrics for
  /// <code>InitiateAuth</code> calls.
  ///
  /// Parameter [authParameters] :
  /// The authentication parameters. These are inputs corresponding to the
  /// <code>AuthFlow</code> that you are invoking. The required values depend on
  /// the value of <code>AuthFlow</code>:
  ///
  /// <ul>
  /// <li>
  /// For <code>USER_SRP_AUTH</code>: <code>USERNAME</code> (required),
  /// <code>SRP_A</code> (required), <code>SECRET_HASH</code> (required if the
  /// app client is configured with a client secret), <code>DEVICE_KEY</code>.
  /// </li>
  /// <li>
  /// For <code>REFRESH_TOKEN_AUTH/REFRESH_TOKEN</code>:
  /// <code>REFRESH_TOKEN</code> (required), <code>SECRET_HASH</code> (required
  /// if the app client is configured with a client secret),
  /// <code>DEVICE_KEY</code>.
  /// </li>
  /// <li>
  /// For <code>CUSTOM_AUTH</code>: <code>USERNAME</code> (required),
  /// <code>SECRET_HASH</code> (if app client is configured with client secret),
  /// <code>DEVICE_KEY</code>. To start the authentication flow with password
  /// verification, include <code>ChallengeName: SRP_A</code> and <code>SRP_A:
  /// (The SRP_A Value)</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for certain
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the InitiateAuth API action, Amazon Cognito invokes
  /// the AWS Lambda functions that are specified for various triggers. The
  /// ClientMetadata value is passed as input to the functions for only the
  /// following triggers:
  ///
  /// <ul>
  /// <li>
  /// Pre signup
  /// </li>
  /// <li>
  /// Pre authentication
  /// </li>
  /// <li>
  /// User migration
  /// </li>
  /// </ul>
  /// When Amazon Cognito invokes the functions for these triggers, it passes a
  /// JSON payload, which the function receives as input. This payload contains
  /// a <code>validationData</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your InitiateAuth request. In
  /// your function code in AWS Lambda, you can process the
  /// <code>validationData</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// When you use the InitiateAuth API action, Amazon Cognito also invokes the
  /// functions for the following triggers, but it does not provide the
  /// ClientMetadata value as input:
  ///
  /// <ul>
  /// <li>
  /// Post authentication
  /// </li>
  /// <li>
  /// Custom message
  /// </li>
  /// <li>
  /// Pre token generation
  /// </li>
  /// <li>
  /// Create auth challenge
  /// </li>
  /// <li>
  /// Define auth challenge
  /// </li>
  /// <li>
  /// Verify auth challenge
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [userContextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  Future<InitiateAuthResponse> initiateAuth({
    @_s.required AuthFlowType authFlow,
    @_s.required String clientId,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> authParameters,
    Map<String, String> clientMetadata,
    UserContextDataType userContextData,
  }) async {
    ArgumentError.checkNotNull(authFlow, 'authFlow');
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.InitiateAuth'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthFlow': authFlow?.toValue() ?? '',
        'ClientId': clientId,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (authParameters != null) 'AuthParameters': authParameters,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (userContextData != null) 'UserContextData': userContextData,
      },
    );

    return InitiateAuthResponse.fromJson(jsonResponse.body);
  }

  /// Lists the devices.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access tokens for the request to list devices.
  ///
  /// Parameter [limit] :
  /// The limit of the device request.
  ///
  /// Parameter [paginationToken] :
  /// The pagination token for the list request.
  Future<ListDevicesResponse> listDevices({
    @_s.required String accessToken,
    int limit,
    String paginationToken,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      0,
      60,
    );
    _s.validateStringLength(
      'paginationToken',
      paginationToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'paginationToken',
      paginationToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListDevices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        if (limit != null) 'Limit': limit,
        if (paginationToken != null) 'PaginationToken': paginationToken,
      },
    );

    return ListDevicesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the groups associated with a user pool.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [limit] :
  /// The limit of the request to list groups.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListGroupsResponse> listGroups({
    @_s.required String userPoolId,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      0,
      60,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Lists information about all identity providers for a user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of identity providers to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<ListIdentityProvidersResponse> listIdentityProviders({
    @_s.required String userPoolId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      60,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListIdentityProviders'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListIdentityProvidersResponse.fromJson(jsonResponse.body);
  }

  /// Lists the resource servers for a user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource servers to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token.
  Future<ListResourceServersResponse> listResourceServers({
    @_s.required String userPoolId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListResourceServers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourceServersResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags that are assigned to an Amazon Cognito user pool.
  ///
  /// A tag is a label that you can apply to user pools to categorize and manage
  /// them in different ways, such as by purpose, owner, environment, or other
  /// criteria.
  ///
  /// You can use this action up to 10 times per second, per account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the user pool that the tags are assigned
  /// to.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:([\w+=/,.@-]*)?:[0-9]+:[\w+=/,.@-]+(:[\w+=/,.@-]+)?(:[\w+=/,.@-]+)?''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists the user import jobs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of import jobs you want the request to return.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that the users are being imported into.
  ///
  /// Parameter [paginationToken] :
  /// An identifier that was returned from the previous call to
  /// <code>ListUserImportJobs</code>, which can be used to return the next set
  /// of import jobs in the list.
  Future<ListUserImportJobsResponse> listUserImportJobs({
    @_s.required int maxResults,
    @_s.required String userPoolId,
    String paginationToken,
  }) async {
    ArgumentError.checkNotNull(maxResults, 'maxResults');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'paginationToken',
      paginationToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'paginationToken',
      paginationToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListUserImportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'UserPoolId': userPoolId,
        if (paginationToken != null) 'PaginationToken': paginationToken,
      },
    );

    return ListUserImportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the clients that have been created for the specified user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to list user pool
  /// clients.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return when listing
  /// the user pool clients.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListUserPoolClientsResponse> listUserPoolClients({
    @_s.required String userPoolId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListUserPoolClients'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUserPoolClientsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the user pools associated with an AWS account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return when listing
  /// the user pools.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListUserPoolsResponse> listUserPools({
    @_s.required int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(maxResults, 'maxResults');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      60,
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListUserPools'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUserPoolsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the users in the Amazon Cognito user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool on which the search should be
  /// performed.
  ///
  /// Parameter [attributesToGet] :
  /// An array of strings, where each string is the name of a user attribute to
  /// be returned for each user in the search results. If the array is null, all
  /// attributes are returned.
  ///
  /// Parameter [filter] :
  /// A filter string of the form "<i>AttributeName</i> <i>Filter-Type</i>
  /// "<i>AttributeValue</i>"". Quotation marks within the filter string must be
  /// escaped using the backslash (\) character. For example,
  /// "<code>family_name</code> = \"Reddy\"".
  ///
  /// <ul>
  /// <li>
  /// <i>AttributeName</i>: The name of the attribute to search for. You can
  /// only search for one attribute at a time.
  /// </li>
  /// <li>
  /// <i>Filter-Type</i>: For an exact match, use =, for example,
  /// "<code>given_name</code> = \"Jon\"". For a prefix ("starts with") match,
  /// use ^=, for example, "<code>given_name</code> ^= \"Jon\"".
  /// </li>
  /// <li>
  /// <i>AttributeValue</i>: The attribute value that must be matched for each
  /// user.
  /// </li>
  /// </ul>
  /// If the filter string is empty, <code>ListUsers</code> returns all users in
  /// the user pool.
  ///
  /// You can only search for the following standard attributes:
  ///
  /// <ul>
  /// <li>
  /// <code>username</code> (case-sensitive)
  /// </li>
  /// <li>
  /// <code>email</code>
  /// </li>
  /// <li>
  /// <code>phone_number</code>
  /// </li>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>given_name</code>
  /// </li>
  /// <li>
  /// <code>family_name</code>
  /// </li>
  /// <li>
  /// <code>preferred_username</code>
  /// </li>
  /// <li>
  /// <code>cognito:user_status</code> (called <b>Status</b> in the Console)
  /// (case-insensitive)
  /// </li>
  /// <li>
  /// <code>status (called <b>Enabled</b> in the Console)
  /// (case-sensitive)</code>
  /// </li>
  /// <li>
  /// <code>sub</code>
  /// </li>
  /// </ul>
  /// Custom attributes are not searchable.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-using-listusers-api">Searching
  /// for Users Using the ListUsers API</a> and <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-listusers-api-examples">Examples
  /// of Using the ListUsers API</a> in the <i>Amazon Cognito Developer
  /// Guide</i>.
  ///
  /// Parameter [limit] :
  /// Maximum number of users to be returned.
  ///
  /// Parameter [paginationToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListUsersResponse> listUsers({
    @_s.required String userPoolId,
    List<String> attributesToGet,
    String filter,
    int limit,
    String paginationToken,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'filter',
      filter,
      0,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      0,
      60,
    );
    _s.validateStringLength(
      'paginationToken',
      paginationToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'paginationToken',
      paginationToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (attributesToGet != null) 'AttributesToGet': attributesToGet,
        if (filter != null) 'Filter': filter,
        if (limit != null) 'Limit': limit,
        if (paginationToken != null) 'PaginationToken': paginationToken,
      },
    );

    return ListUsersResponse.fromJson(jsonResponse.body);
  }

  /// Lists the users in the specified group.
  ///
  /// Calling this action requires developer credentials.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [limit] :
  /// The limit of the request to list users.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListUsersInGroupResponse> listUsersInGroup({
    @_s.required String groupName,
    @_s.required String userPoolId,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      0,
      60,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\S]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ListUsersInGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        'UserPoolId': userPoolId,
        if (limit != null) 'Limit': limit,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUsersInGroupResponse.fromJson(jsonResponse.body);
  }

  /// Resends the confirmation (for confirmation of registration) to a specific
  /// user in the user pool.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [CodeDeliveryFailureException].
  /// May throw [UserNotFoundException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientId] :
  /// The ID of the client associated with the user pool.
  ///
  /// Parameter [username] :
  /// The user name of the user to whom you wish to resend a confirmation code.
  ///
  /// Parameter [analyticsMetadata] :
  /// The Amazon Pinpoint analytics metadata for collecting metrics for
  /// <code>ResendConfirmationCode</code> calls.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the ResendConfirmationCode API action, Amazon
  /// Cognito invokes the function that is assigned to the <i>custom message</i>
  /// trigger. When Amazon Cognito invokes this function, it passes a JSON
  /// payload, which the function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your ResendConfirmationCode
  /// request. In your function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [secretHash] :
  /// A keyed-hash message authentication code (HMAC) calculated using the
  /// secret key of a user pool client and username plus the client ID in the
  /// message.
  ///
  /// Parameter [userContextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  Future<ResendConfirmationCodeResponse> resendConfirmationCode({
    @_s.required String clientId,
    @_s.required String username,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> clientMetadata,
    String secretHash,
    UserContextDataType userContextData,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'secretHash',
      secretHash,
      1,
      128,
    );
    _s.validateStringPattern(
      'secretHash',
      secretHash,
      r'''[\w+=/]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.ResendConfirmationCode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'Username': username,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (secretHash != null) 'SecretHash': secretHash,
        if (userContextData != null) 'UserContextData': userContextData,
      },
    );

    return ResendConfirmationCodeResponse.fromJson(jsonResponse.body);
  }

  /// Responds to the authentication challenge.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [CodeMismatchException].
  /// May throw [ExpiredCodeException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidPasswordException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [MFAMethodNotFoundException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [AliasExistsException].
  /// May throw [InternalErrorException].
  /// May throw [SoftwareTokenMFANotFoundException].
  ///
  /// Parameter [challengeName] :
  /// The challenge name. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html">InitiateAuth</a>.
  ///
  /// <code>ADMIN_NO_SRP_AUTH</code> is not a valid value.
  ///
  /// Parameter [clientId] :
  /// The app client ID.
  ///
  /// Parameter [analyticsMetadata] :
  /// The Amazon Pinpoint analytics metadata for collecting metrics for
  /// <code>RespondToAuthChallenge</code> calls.
  ///
  /// Parameter [challengeResponses] :
  /// The challenge responses. These are inputs corresponding to the value of
  /// <code>ChallengeName</code>, for example:
  /// <note>
  /// <code>SECRET_HASH</code> (if app client is configured with client secret)
  /// applies to all inputs below (including <code>SOFTWARE_TOKEN_MFA</code>).
  /// </note>
  /// <ul>
  /// <li>
  /// <code>SMS_MFA</code>: <code>SMS_MFA_CODE</code>, <code>USERNAME</code>.
  /// </li>
  /// <li>
  /// <code>PASSWORD_VERIFIER</code>: <code>PASSWORD_CLAIM_SIGNATURE</code>,
  /// <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, <code>TIMESTAMP</code>,
  /// <code>USERNAME</code>.
  /// </li>
  /// <li>
  /// <code>NEW_PASSWORD_REQUIRED</code>: <code>NEW_PASSWORD</code>, any other
  /// required attributes, <code>USERNAME</code>.
  /// </li>
  /// <li>
  /// <code>SOFTWARE_TOKEN_MFA</code>: <code>USERNAME</code> and
  /// <code>SOFTWARE_TOKEN_MFA_CODE</code> are required attributes.
  /// </li>
  /// <li>
  /// <code>DEVICE_SRP_AUTH</code> requires <code>USERNAME</code>,
  /// <code>DEVICE_KEY</code>, <code>SRP_A</code> (and
  /// <code>SECRET_HASH</code>).
  /// </li>
  /// <li>
  /// <code>DEVICE_PASSWORD_VERIFIER</code> requires everything that
  /// <code>PASSWORD_VERIFIER</code> requires plus <code>DEVICE_KEY</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the RespondToAuthChallenge API action, Amazon
  /// Cognito invokes any functions that are assigned to the following triggers:
  /// <i>post authentication</i>, <i>pre token generation</i>, <i>define auth
  /// challenge</i>, <i>create auth challenge</i>, and <i>verify auth
  /// challenge</i>. When Amazon Cognito invokes any of these functions, it
  /// passes a JSON payload, which the function receives as input. This payload
  /// contains a <code>clientMetadata</code> attribute, which provides the data
  /// that you assigned to the ClientMetadata parameter in your
  /// RespondToAuthChallenge request. In your function code in AWS Lambda, you
  /// can process the <code>clientMetadata</code> value to enhance your workflow
  /// for your specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [session] :
  /// The session which should be passed both ways in challenge-response calls
  /// to the service. If <code>InitiateAuth</code> or
  /// <code>RespondToAuthChallenge</code> API call determines that the caller
  /// needs to go through another challenge, they return a session with other
  /// challenge parameters. This session should be passed as it is to the next
  /// <code>RespondToAuthChallenge</code> API call.
  ///
  /// Parameter [userContextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  Future<RespondToAuthChallengeResponse> respondToAuthChallenge({
    @_s.required ChallengeNameType challengeName,
    @_s.required String clientId,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> challengeResponses,
    Map<String, String> clientMetadata,
    String session,
    UserContextDataType userContextData,
  }) async {
    ArgumentError.checkNotNull(challengeName, 'challengeName');
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'session',
      session,
      20,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.RespondToAuthChallenge'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChallengeName': challengeName?.toValue() ?? '',
        'ClientId': clientId,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (challengeResponses != null)
          'ChallengeResponses': challengeResponses,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (session != null) 'Session': session,
        if (userContextData != null) 'UserContextData': userContextData,
      },
    );

    return RespondToAuthChallengeResponse.fromJson(jsonResponse.body);
  }

  /// Configures actions on detected risks. To delete the risk configuration for
  /// <code>UserPoolId</code> or <code>ClientId</code>, pass null values for all
  /// four configuration types.
  ///
  /// To enable Amazon Cognito advanced security features, update the user pool
  /// to include the <code>UserPoolAddOns</code>
  /// key<code>AdvancedSecurityMode</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserPoolAddOnNotEnabledException].
  /// May throw [CodeDeliveryFailureException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [accountTakeoverRiskConfiguration] :
  /// The account takeover risk configuration.
  ///
  /// Parameter [clientId] :
  /// The app client ID. If <code>ClientId</code> is null, then the risk
  /// configuration is mapped to <code>userPoolId</code>. When the client ID is
  /// null, the same risk configuration is applied to all the clients in the
  /// userPool.
  ///
  /// Otherwise, <code>ClientId</code> is mapped to the client. When the client
  /// ID is not null, the user pool configuration is overridden and the risk
  /// configuration for the client is used instead.
  ///
  /// Parameter [compromisedCredentialsRiskConfiguration] :
  /// The compromised credentials risk configuration.
  ///
  /// Parameter [riskExceptionConfiguration] :
  /// The configuration to override the risk decision.
  Future<SetRiskConfigurationResponse> setRiskConfiguration({
    @_s.required String userPoolId,
    AccountTakeoverRiskConfigurationType accountTakeoverRiskConfiguration,
    String clientId,
    CompromisedCredentialsRiskConfigurationType
        compromisedCredentialsRiskConfiguration,
    RiskExceptionConfigurationType riskExceptionConfiguration,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.SetRiskConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (accountTakeoverRiskConfiguration != null)
          'AccountTakeoverRiskConfiguration': accountTakeoverRiskConfiguration,
        if (clientId != null) 'ClientId': clientId,
        if (compromisedCredentialsRiskConfiguration != null)
          'CompromisedCredentialsRiskConfiguration':
              compromisedCredentialsRiskConfiguration,
        if (riskExceptionConfiguration != null)
          'RiskExceptionConfiguration': riskExceptionConfiguration,
      },
    );

    return SetRiskConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Sets the UI customization information for a user pool's built-in app UI.
  ///
  /// You can specify app UI customization settings for a single client (with a
  /// specific <code>clientId</code>) or for all clients (by setting the
  /// <code>clientId</code> to <code>ALL</code>). If you specify
  /// <code>ALL</code>, the default configuration will be used for every client
  /// that has no UI customization set previously. If you specify UI
  /// customization settings for a particular client, it will no longer fall
  /// back to the <code>ALL</code> configuration.
  /// <note>
  /// To use this API, your user pool must have a domain associated with it.
  /// Otherwise, there is no place to host the app's pages, and the service will
  /// throw an error.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [css] :
  /// The CSS values in the UI customization.
  ///
  /// Parameter [clientId] :
  /// The client ID for the client app.
  ///
  /// Parameter [imageFile] :
  /// The uploaded logo image for the UI customization.
  Future<SetUICustomizationResponse> setUICustomization({
    @_s.required String userPoolId,
    String css,
    String clientId,
    Uint8List imageFile,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.SetUICustomization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (css != null) 'CSS': css,
        if (clientId != null) 'ClientId': clientId,
        if (imageFile != null) 'ImageFile': base64Encode(imageFile),
      },
    );

    return SetUICustomizationResponse.fromJson(jsonResponse.body);
  }

  /// Set the user's multi-factor authentication (MFA) method preference,
  /// including which MFA factors are enabled and if any are preferred. Only one
  /// factor can be set as preferred. The preferred MFA factor will be used to
  /// authenticate a user if multiple factors are enabled. If multiple options
  /// are enabled and no preference is set, a challenge to choose an MFA option
  /// will be returned during sign in. If an MFA type is enabled for a user, the
  /// user will be prompted for MFA during all sign in attempts, unless device
  /// tracking is turned on and the device has been trusted. If you would like
  /// MFA to be applied selectively based on the assessed risk level of sign in
  /// attempts, disable MFA for users and turn on Adaptive Authentication for
  /// the user pool.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token for the user.
  ///
  /// Parameter [sMSMfaSettings] :
  /// The SMS text message multi-factor authentication (MFA) settings.
  ///
  /// Parameter [softwareTokenMfaSettings] :
  /// The time-based one-time password software token MFA settings.
  Future<void> setUserMFAPreference({
    @_s.required String accessToken,
    SMSMfaSettingsType sMSMfaSettings,
    SoftwareTokenMfaSettingsType softwareTokenMfaSettings,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.SetUserMFAPreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        if (sMSMfaSettings != null) 'SMSMfaSettings': sMSMfaSettings,
        if (softwareTokenMfaSettings != null)
          'SoftwareTokenMfaSettings': softwareTokenMfaSettings,
      },
    );

    return SetUserMFAPreferenceResponse.fromJson(jsonResponse.body);
  }

  /// Set the user pool multi-factor authentication (MFA) configuration.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [mfaConfiguration] :
  /// The MFA configuration. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>OFF</code> MFA will not be used for any users.
  /// </li>
  /// <li>
  /// <code>ON</code> MFA is required for all users to sign in.
  /// </li>
  /// <li>
  /// <code>OPTIONAL</code> MFA will be required only for individual users who
  /// have an MFA factor enabled.
  /// </li>
  /// </ul>
  ///
  /// Parameter [smsMfaConfiguration] :
  /// The SMS text message MFA configuration.
  ///
  /// Parameter [softwareTokenMfaConfiguration] :
  /// The software token MFA configuration.
  Future<SetUserPoolMfaConfigResponse> setUserPoolMfaConfig({
    @_s.required String userPoolId,
    UserPoolMfaType mfaConfiguration,
    SmsMfaConfigType smsMfaConfiguration,
    SoftwareTokenMfaConfigType softwareTokenMfaConfiguration,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.SetUserPoolMfaConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (mfaConfiguration != null)
          'MfaConfiguration': mfaConfiguration.toValue(),
        if (smsMfaConfiguration != null)
          'SmsMfaConfiguration': smsMfaConfiguration,
        if (softwareTokenMfaConfiguration != null)
          'SoftwareTokenMfaConfiguration': softwareTokenMfaConfiguration,
      },
    );

    return SetUserPoolMfaConfigResponse.fromJson(jsonResponse.body);
  }

  /// <i>This action is no longer supported.</i> You can use it to configure
  /// only SMS MFA. You can't use it to configure TOTP software token MFA. To
  /// configure either type of MFA, use <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SetUserMFAPreference.html">SetUserMFAPreference</a>
  /// instead.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token for the set user settings request.
  ///
  /// Parameter [mFAOptions] :
  /// You can use this parameter only to set an SMS configuration that uses SMS
  /// for delivery.
  Future<void> setUserSettings({
    @_s.required String accessToken,
    @_s.required List<MFAOptionType> mFAOptions,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(mFAOptions, 'mFAOptions');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.SetUserSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'MFAOptions': mFAOptions,
      },
    );

    return SetUserSettingsResponse.fromJson(jsonResponse.body);
  }

  /// Registers the user in the specified user pool and creates a user name,
  /// password, and user attributes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidPasswordException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [UsernameExistsException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [CodeDeliveryFailureException].
  ///
  /// Parameter [clientId] :
  /// The ID of the client associated with the user pool.
  ///
  /// Parameter [password] :
  /// The password of the user you wish to register.
  ///
  /// Parameter [username] :
  /// The user name of the user you wish to register.
  ///
  /// Parameter [analyticsMetadata] :
  /// The Amazon Pinpoint analytics metadata for collecting metrics for
  /// <code>SignUp</code> calls.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the SignUp API action, Amazon Cognito invokes any
  /// functions that are assigned to the following triggers: <i>pre sign-up</i>,
  /// <i>custom message</i>, and <i>post confirmation</i>. When Amazon Cognito
  /// invokes any of these functions, it passes a JSON payload, which the
  /// function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your SignUp request. In your
  /// function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [secretHash] :
  /// A keyed-hash message authentication code (HMAC) calculated using the
  /// secret key of a user pool client and username plus the client ID in the
  /// message.
  ///
  /// Parameter [userAttributes] :
  /// An array of name-value pairs representing user attributes.
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  ///
  /// Parameter [userContextData] :
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  ///
  /// Parameter [validationData] :
  /// The validation data in the request to register a user.
  Future<SignUpResponse> signUp({
    @_s.required String clientId,
    @_s.required String password,
    @_s.required String username,
    AnalyticsMetadataType analyticsMetadata,
    Map<String, String> clientMetadata,
    String secretHash,
    List<AttributeType> userAttributes,
    UserContextDataType userContextData,
    List<AttributeType> validationData,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      6,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\S]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'secretHash',
      secretHash,
      1,
      128,
    );
    _s.validateStringPattern(
      'secretHash',
      secretHash,
      r'''[\w+=/]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.SignUp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'Password': password,
        'Username': username,
        if (analyticsMetadata != null) 'AnalyticsMetadata': analyticsMetadata,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
        if (secretHash != null) 'SecretHash': secretHash,
        if (userAttributes != null) 'UserAttributes': userAttributes,
        if (userContextData != null) 'UserContextData': userContextData,
        if (validationData != null) 'ValidationData': validationData,
      },
    );

    return SignUpResponse.fromJson(jsonResponse.body);
  }

  /// Starts the user import.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [PreconditionNotMetException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [jobId] :
  /// The job ID for the user import job.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that the users are being imported into.
  Future<StartUserImportJobResponse> startUserImportJob({
    @_s.required String jobId,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''import-[0-9a-zA-Z-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.StartUserImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        'UserPoolId': userPoolId,
      },
    );

    return StartUserImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops the user import job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  /// May throw [PreconditionNotMetException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [jobId] :
  /// The job ID for the user import job.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool that the users are being imported into.
  Future<StopUserImportJobResponse> stopUserImportJob({
    @_s.required String jobId,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''import-[0-9a-zA-Z-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.StopUserImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        'UserPoolId': userPoolId,
      },
    );

    return StopUserImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Assigns a set of tags to an Amazon Cognito user pool. A tag is a label
  /// that you can use to categorize and manage user pools in different ways,
  /// such as by purpose, owner, environment, or other criteria.
  ///
  /// Each tag consists of a key and value, both of which you define. A key is a
  /// general category for more specific values. For example, if you have two
  /// versions of a user pool, one for testing and another for production, you
  /// might assign an <code>Environment</code> tag key to both user pools. The
  /// value of this key might be <code>Test</code> for one user pool and
  /// <code>Production</code> for the other.
  ///
  /// Tags are useful for cost tracking and access control. You can activate
  /// your tags so that they appear on the Billing and Cost Management console,
  /// where you can track the costs associated with your user pools. In an IAM
  /// policy, you can constrain permissions for user pools based on specific
  /// tags or tag values.
  ///
  /// You can use this action up to 5 times per second, per account. A user pool
  /// can have as many as 50 tags.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the user pool to assign the tags to.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the user pool.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:([\w+=/,.@-]*)?:[0-9]+:[\w+=/,.@-]+(:[\w+=/,.@-]+)?(:[\w+=/,.@-]+)?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified tags from an Amazon Cognito user pool. You can use
  /// this action up to 5 times per second, per account
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the user pool that the tags are assigned
  /// to.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the user pool.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:([\w+=/,.@-]*)?:[0-9]+:[\w+=/,.@-]+(:[\w+=/,.@-]+)?(:[\w+=/,.@-]+)?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Provides the feedback for an authentication event whether it was from a
  /// valid user or not. This feedback is used for improving the risk evaluation
  /// decision for the user pool as part of Amazon Cognito advanced security.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserNotFoundException].
  /// May throw [UserPoolAddOnNotEnabledException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [eventId] :
  /// The event ID.
  ///
  /// Parameter [feedbackToken] :
  /// The feedback token.
  ///
  /// Parameter [feedbackValue] :
  /// The authentication event feedback value.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [username] :
  /// The user pool username.
  Future<void> updateAuthEventFeedback({
    @_s.required String eventId,
    @_s.required String feedbackToken,
    @_s.required FeedbackValueType feedbackValue,
    @_s.required String userPoolId,
    @_s.required String username,
  }) async {
    ArgumentError.checkNotNull(eventId, 'eventId');
    _s.validateStringLength(
      'eventId',
      eventId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventId',
      eventId,
      r'''[\w+-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(feedbackToken, 'feedbackToken');
    _s.validateStringPattern(
      'feedbackToken',
      feedbackToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(feedbackValue, 'feedbackValue');
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(username, 'username');
    _s.validateStringLength(
      'username',
      username,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSCognitoIdentityProviderService.UpdateAuthEventFeedback'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EventId': eventId,
        'FeedbackToken': feedbackToken,
        'FeedbackValue': feedbackValue?.toValue() ?? '',
        'UserPoolId': userPoolId,
        'Username': username,
      },
    );

    return UpdateAuthEventFeedbackResponse.fromJson(jsonResponse.body);
  }

  /// Updates the device status.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token.
  ///
  /// Parameter [deviceKey] :
  /// The device key.
  ///
  /// Parameter [deviceRememberedStatus] :
  /// The status of whether a device is remembered.
  Future<void> updateDeviceStatus({
    @_s.required String accessToken,
    @_s.required String deviceKey,
    DeviceRememberedStatusType deviceRememberedStatus,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceKey, 'deviceKey');
    _s.validateStringLength(
      'deviceKey',
      deviceKey,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceKey',
      deviceKey,
      r'''[\w-]+_[0-9a-f-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateDeviceStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'DeviceKey': deviceKey,
        if (deviceRememberedStatus != null)
          'DeviceRememberedStatus': deviceRememberedStatus.toValue(),
      },
    );

    return UpdateDeviceStatusResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified group with the specified attributes.
  ///
  /// Calling this action requires developer credentials.
  /// <important>
  /// If you don't provide a value for an attribute, it will be set to the
  /// default value.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [description] :
  /// A string containing the new description of the group.
  ///
  /// Parameter [precedence] :
  /// The new precedence value for the group. For more information about this
  /// parameter, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_CreateGroup.html">CreateGroup</a>.
  ///
  /// Parameter [roleArn] :
  /// The new role ARN for the group. This is used for setting the
  /// <code>cognito:roles</code> and <code>cognito:preferred_role</code> claims
  /// in the token.
  Future<UpdateGroupResponse> updateGroup({
    @_s.required String groupName,
    @_s.required String userPoolId,
    String description,
    int precedence,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'groupName',
      groupName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateNumRange(
      'precedence',
      precedence,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:([\w+=/,.@-]*)?:[0-9]+:[\w+=/,.@-]+(:[\w+=/,.@-]+)?(:[\w+=/,.@-]+)?''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupName': groupName,
        'UserPoolId': userPoolId,
        if (description != null) 'Description': description,
        if (precedence != null) 'Precedence': precedence,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );

    return UpdateGroupResponse.fromJson(jsonResponse.body);
  }

  /// Updates identity provider information for a user pool.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedIdentityProviderException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [providerName] :
  /// The identity provider name.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID.
  ///
  /// Parameter [attributeMapping] :
  /// The identity provider attribute mapping to be changed.
  ///
  /// Parameter [idpIdentifiers] :
  /// A list of identity provider identifiers.
  ///
  /// Parameter [providerDetails] :
  /// The identity provider details to be updated, such as
  /// <code>MetadataURL</code> and <code>MetadataFile</code>.
  Future<UpdateIdentityProviderResponse> updateIdentityProvider({
    @_s.required String providerName,
    @_s.required String userPoolId,
    Map<String, String> attributeMapping,
    List<String> idpIdentifiers,
    Map<String, String> providerDetails,
  }) async {
    ArgumentError.checkNotNull(providerName, 'providerName');
    _s.validateStringLength(
      'providerName',
      providerName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'providerName',
      providerName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateIdentityProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProviderName': providerName,
        'UserPoolId': userPoolId,
        if (attributeMapping != null) 'AttributeMapping': attributeMapping,
        if (idpIdentifiers != null) 'IdpIdentifiers': idpIdentifiers,
        if (providerDetails != null) 'ProviderDetails': providerDetails,
      },
    );

    return UpdateIdentityProviderResponse.fromJson(jsonResponse.body);
  }

  /// Updates the name and scopes of resource server. All other fields are
  /// read-only.
  /// <important>
  /// If you don't provide a value for an attribute, it will be set to the
  /// default value.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [identifier] :
  /// The identifier for the resource server.
  ///
  /// Parameter [name] :
  /// The name of the resource server.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool.
  ///
  /// Parameter [scopes] :
  /// The scope values to be set for the resource server.
  Future<UpdateResourceServerResponse> updateResourceServer({
    @_s.required String identifier,
    @_s.required String name,
    @_s.required String userPoolId,
    List<ResourceServerScopeType> scopes,
  }) async {
    ArgumentError.checkNotNull(identifier, 'identifier');
    _s.validateStringLength(
      'identifier',
      identifier,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'identifier',
      identifier,
      r'''[\x21\x23-\x5B\x5D-\x7E]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w\s+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateResourceServer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'Name': name,
        'UserPoolId': userPoolId,
        if (scopes != null) 'Scopes': scopes,
      },
    );

    return UpdateResourceServerResponse.fromJson(jsonResponse.body);
  }

  /// Allows a user to update a specific attribute (one at a time).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [CodeMismatchException].
  /// May throw [ExpiredCodeException].
  /// May throw [NotAuthorizedException].
  /// May throw [UnexpectedLambdaException].
  /// May throw [UserLambdaValidationException].
  /// May throw [InvalidLambdaResponseException].
  /// May throw [TooManyRequestsException].
  /// May throw [AliasExistsException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  /// May throw [CodeDeliveryFailureException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// The access token for the request to update user attributes.
  ///
  /// Parameter [userAttributes] :
  /// An array of name-value pairs representing user attributes.
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  ///
  /// Parameter [clientMetadata] :
  /// A map of custom key-value pairs that you can provide as input for any
  /// custom workflows that this action triggers.
  ///
  /// You create custom workflows by assigning AWS Lambda functions to user pool
  /// triggers. When you use the UpdateUserAttributes API action, Amazon Cognito
  /// invokes the function that is assigned to the <i>custom message</i>
  /// trigger. When Amazon Cognito invokes this function, it passes a JSON
  /// payload, which the function receives as input. This payload contains a
  /// <code>clientMetadata</code> attribute, which provides the data that you
  /// assigned to the ClientMetadata parameter in your UpdateUserAttributes
  /// request. In your function code in AWS Lambda, you can process the
  /// <code>clientMetadata</code> value to enhance your workflow for your
  /// specific needs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools-working-with-aws-lambda-triggers.html">Customizing
  /// User Pool Workflows with Lambda Triggers</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// <note>
  /// Take the following limitations into consideration when you use the
  /// ClientMetadata parameter:
  ///
  /// <ul>
  /// <li>
  /// Amazon Cognito does not store the ClientMetadata value. This data is
  /// available only to AWS Lambda triggers that are assigned to a user pool to
  /// support custom workflows. If your user pool configuration does not include
  /// triggers, the ClientMetadata parameter serves no purpose.
  /// </li>
  /// <li>
  /// Amazon Cognito does not validate the ClientMetadata value.
  /// </li>
  /// <li>
  /// Amazon Cognito does not encrypt the the ClientMetadata value, so don't use
  /// it to provide sensitive information.
  /// </li>
  /// </ul> </note>
  Future<UpdateUserAttributesResponse> updateUserAttributes({
    @_s.required String accessToken,
    @_s.required List<AttributeType> userAttributes,
    Map<String, String> clientMetadata,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userAttributes, 'userAttributes');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateUserAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'UserAttributes': userAttributes,
        if (clientMetadata != null) 'ClientMetadata': clientMetadata,
      },
    );

    return UpdateUserAttributesResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified user pool with the specified attributes. You can get
  /// a list of the current user pool settings using <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPool.html">DescribeUserPool</a>.
  /// <important>
  /// If you don't provide a value for an attribute, it will be set to the
  /// default value.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ConcurrentModificationException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [UserImportInProgressException].
  /// May throw [InternalErrorException].
  /// May throw [InvalidSmsRoleAccessPolicyException].
  /// May throw [InvalidSmsRoleTrustRelationshipException].
  /// May throw [UserPoolTaggingException].
  /// May throw [InvalidEmailRoleAccessPolicyException].
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool you want to update.
  ///
  /// Parameter [accountRecoverySetting] :
  /// Use this setting to define which verified available method a user can use
  /// to recover their password when they call <code>ForgotPassword</code>. It
  /// allows you to define a preferred method when a user has more than one
  /// method available. With this setting, SMS does not qualify for a valid
  /// password recovery mechanism if the user also has SMS MFA enabled. In the
  /// absence of this setting, Cognito uses the legacy behavior to determine the
  /// recovery method where SMS is preferred over email.
  ///
  /// Parameter [adminCreateUserConfig] :
  /// The configuration for <code>AdminCreateUser</code> requests.
  ///
  /// Parameter [autoVerifiedAttributes] :
  /// The attributes that are automatically verified when the Amazon Cognito
  /// service makes a request to update user pools.
  ///
  /// Parameter [deviceConfiguration] :
  /// Device configuration.
  ///
  /// Parameter [emailConfiguration] :
  /// Email configuration.
  ///
  /// Parameter [emailVerificationMessage] :
  /// The contents of the email verification message.
  ///
  /// Parameter [emailVerificationSubject] :
  /// The subject of the email verification message.
  ///
  /// Parameter [lambdaConfig] :
  /// The AWS Lambda configuration information from the request to update the
  /// user pool.
  ///
  /// Parameter [mfaConfiguration] :
  /// Can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>OFF</code> - MFA tokens are not required and cannot be specified
  /// during user registration.
  /// </li>
  /// <li>
  /// <code>ON</code> - MFA tokens are required for all user registrations. You
  /// can only specify required when you are initially creating a user pool.
  /// </li>
  /// <li>
  /// <code>OPTIONAL</code> - Users have the option when registering to create
  /// an MFA token.
  /// </li>
  /// </ul>
  ///
  /// Parameter [policies] :
  /// A container with the policies you wish to update in a user pool.
  ///
  /// Parameter [smsAuthenticationMessage] :
  /// The contents of the SMS authentication message.
  ///
  /// Parameter [smsConfiguration] :
  /// SMS configuration.
  ///
  /// Parameter [smsVerificationMessage] :
  /// A container with information about the SMS verification message.
  ///
  /// Parameter [userPoolAddOns] :
  /// Used to enable advanced security risk detection. Set the key
  /// <code>AdvancedSecurityMode</code> to the value "AUDIT".
  ///
  /// Parameter [userPoolTags] :
  /// The tag keys and values to assign to the user pool. A tag is a label that
  /// you can use to categorize and manage user pools in different ways, such as
  /// by purpose, owner, environment, or other criteria.
  ///
  /// Parameter [verificationMessageTemplate] :
  /// The template for verification messages.
  Future<void> updateUserPool({
    @_s.required String userPoolId,
    AccountRecoverySettingType accountRecoverySetting,
    AdminCreateUserConfigType adminCreateUserConfig,
    List<VerifiedAttributeType> autoVerifiedAttributes,
    DeviceConfigurationType deviceConfiguration,
    EmailConfigurationType emailConfiguration,
    String emailVerificationMessage,
    String emailVerificationSubject,
    LambdaConfigType lambdaConfig,
    UserPoolMfaType mfaConfiguration,
    UserPoolPolicyType policies,
    String smsAuthenticationMessage,
    SmsConfigurationType smsConfiguration,
    String smsVerificationMessage,
    UserPoolAddOnsType userPoolAddOns,
    Map<String, String> userPoolTags,
    VerificationMessageTemplateType verificationMessageTemplate,
  }) async {
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'emailVerificationMessage',
      emailVerificationMessage,
      6,
      20000,
    );
    _s.validateStringPattern(
      'emailVerificationMessage',
      emailVerificationMessage,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}\s*]*\{####\}[\p{L}\p{M}\p{S}\p{N}\p{P}\s*]*''',
    );
    _s.validateStringLength(
      'emailVerificationSubject',
      emailVerificationSubject,
      1,
      140,
    );
    _s.validateStringPattern(
      'emailVerificationSubject',
      emailVerificationSubject,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}\s]+''',
    );
    _s.validateStringLength(
      'smsAuthenticationMessage',
      smsAuthenticationMessage,
      6,
      140,
    );
    _s.validateStringPattern(
      'smsAuthenticationMessage',
      smsAuthenticationMessage,
      r'''.*\{####\}.*''',
    );
    _s.validateStringLength(
      'smsVerificationMessage',
      smsVerificationMessage,
      6,
      140,
    );
    _s.validateStringPattern(
      'smsVerificationMessage',
      smsVerificationMessage,
      r'''.*\{####\}.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateUserPool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserPoolId': userPoolId,
        if (accountRecoverySetting != null)
          'AccountRecoverySetting': accountRecoverySetting,
        if (adminCreateUserConfig != null)
          'AdminCreateUserConfig': adminCreateUserConfig,
        if (autoVerifiedAttributes != null)
          'AutoVerifiedAttributes':
              autoVerifiedAttributes.map((e) => e?.toValue() ?? '').toList(),
        if (deviceConfiguration != null)
          'DeviceConfiguration': deviceConfiguration,
        if (emailConfiguration != null)
          'EmailConfiguration': emailConfiguration,
        if (emailVerificationMessage != null)
          'EmailVerificationMessage': emailVerificationMessage,
        if (emailVerificationSubject != null)
          'EmailVerificationSubject': emailVerificationSubject,
        if (lambdaConfig != null) 'LambdaConfig': lambdaConfig,
        if (mfaConfiguration != null)
          'MfaConfiguration': mfaConfiguration.toValue(),
        if (policies != null) 'Policies': policies,
        if (smsAuthenticationMessage != null)
          'SmsAuthenticationMessage': smsAuthenticationMessage,
        if (smsConfiguration != null) 'SmsConfiguration': smsConfiguration,
        if (smsVerificationMessage != null)
          'SmsVerificationMessage': smsVerificationMessage,
        if (userPoolAddOns != null) 'UserPoolAddOns': userPoolAddOns,
        if (userPoolTags != null) 'UserPoolTags': userPoolTags,
        if (verificationMessageTemplate != null)
          'VerificationMessageTemplate': verificationMessageTemplate,
      },
    );

    return UpdateUserPoolResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified user pool app client with the specified attributes.
  /// You can get a list of the current user pool app client settings using <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_DescribeUserPoolClient.html">DescribeUserPoolClient</a>.
  /// <important>
  /// If you don't provide a value for an attribute, it will be set to the
  /// default value.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ConcurrentModificationException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotAuthorizedException].
  /// May throw [ScopeDoesNotExistException].
  /// May throw [InvalidOAuthFlowException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [clientId] :
  /// The ID of the client associated with the user pool.
  ///
  /// Parameter [userPoolId] :
  /// The user pool ID for the user pool where you want to update the user pool
  /// client.
  ///
  /// Parameter [accessTokenValidity] :
  /// The time limit, after which the access token is no longer valid and cannot
  /// be used.
  ///
  /// Parameter [allowedOAuthFlows] :
  /// The allowed OAuth flows.
  ///
  /// Set to <code>code</code> to initiate a code grant flow, which provides an
  /// authorization code as the response. This code can be exchanged for access
  /// tokens with the token endpoint.
  ///
  /// Set to <code>implicit</code> to specify that the client should get the
  /// access token (and, optionally, ID token, based on scopes) directly.
  ///
  /// Set to <code>client_credentials</code> to specify that the client should
  /// get the access token (and, optionally, ID token, based on scopes) from the
  /// token endpoint using a combination of client and client_secret.
  ///
  /// Parameter [allowedOAuthFlowsUserPoolClient] :
  /// Set to true if the client is allowed to follow the OAuth protocol when
  /// interacting with Cognito user pools.
  ///
  /// Parameter [allowedOAuthScopes] :
  /// The allowed OAuth scopes. Possible values provided by OAuth are:
  /// <code>phone</code>, <code>email</code>, <code>openid</code>, and
  /// <code>profile</code>. Possible values provided by AWS are:
  /// <code>aws.cognito.signin.user.admin</code>. Custom scopes created in
  /// Resource Servers are also supported.
  ///
  /// Parameter [analyticsConfiguration] :
  /// The Amazon Pinpoint analytics configuration for collecting metrics for
  /// this user pool.
  /// <note>
  /// In regions where Pinpoint is not available, Cognito User Pools only
  /// supports sending events to Amazon Pinpoint projects in us-east-1. In
  /// regions where Pinpoint is available, Cognito User Pools will support
  /// sending events to Amazon Pinpoint projects within that same region.
  /// </note>
  ///
  /// Parameter [callbackURLs] :
  /// A list of allowed redirect (callback) URLs for the identity providers.
  ///
  /// A redirect URI must:
  ///
  /// <ul>
  /// <li>
  /// Be an absolute URI.
  /// </li>
  /// <li>
  /// Be registered with the authorization server.
  /// </li>
  /// <li>
  /// Not include a fragment component.
  /// </li>
  /// </ul>
  /// See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0
  /// - Redirection Endpoint</a>.
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// Parameter [clientName] :
  /// The client name from the update user pool client request.
  ///
  /// Parameter [defaultRedirectURI] :
  /// The default redirect URI. Must be in the <code>CallbackURLs</code> list.
  ///
  /// A redirect URI must:
  ///
  /// <ul>
  /// <li>
  /// Be an absolute URI.
  /// </li>
  /// <li>
  /// Be registered with the authorization server.
  /// </li>
  /// <li>
  /// Not include a fragment component.
  /// </li>
  /// </ul>
  /// See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0
  /// - Redirection Endpoint</a>.
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  ///
  /// Parameter [explicitAuthFlows] :
  /// The authentication flows that are supported by the user pool clients. Flow
  /// names without the <code>ALLOW_</code> prefix are deprecated in favor of
  /// new names with the <code>ALLOW_</code> prefix. Note that values with
  /// <code>ALLOW_</code> prefix cannot be used along with values without
  /// <code>ALLOW_</code> prefix.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user
  /// password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This
  /// setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this
  /// authentication flow, Cognito receives the password in the request instead
  /// of using the SRP (Secure Remote Password protocol) protocol to verify
  /// passwords.
  /// </li>
  /// <li>
  /// <code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based
  /// authentication.
  /// </li>
  /// <li>
  /// <code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based
  /// authentication. In this flow, Cognito receives the password in the request
  /// instead of using the SRP protocol to verify passwords.
  /// </li>
  /// <li>
  /// <code>ALLOW_USER_SRP_AUTH</code>: Enable SRP based authentication.
  /// </li>
  /// <li>
  /// <code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.
  /// </li>
  /// </ul>
  ///
  /// Parameter [idTokenValidity] :
  /// The time limit, after which the ID token is no longer valid and cannot be
  /// used.
  ///
  /// Parameter [logoutURLs] :
  /// A list of allowed logout URLs for the identity providers.
  ///
  /// Parameter [preventUserExistenceErrors] :
  /// Use this setting to choose which errors and responses are returned by
  /// Cognito APIs during authentication, account confirmation, and password
  /// recovery when the user does not exist in the user pool. When set to
  /// <code>ENABLED</code> and the user does not exist, authentication returns
  /// an error indicating either the username or password was incorrect, and
  /// account confirmation and password recovery return a response indicating a
  /// code was sent to a simulated destination. When set to <code>LEGACY</code>,
  /// those APIs will return a <code>UserNotFoundException</code> exception if
  /// the user does not exist in the user pool.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - This prevents user existence-related errors.
  /// </li>
  /// <li>
  /// <code>LEGACY</code> - This represents the old behavior of Cognito where
  /// user existence related errors are not prevented.
  /// </li>
  /// </ul> <note>
  /// After February 15th 2020, the value of
  /// <code>PreventUserExistenceErrors</code> will default to
  /// <code>ENABLED</code> for newly created user pool clients if no value is
  /// provided.
  /// </note>
  ///
  /// Parameter [readAttributes] :
  /// The read-only attributes of the user pool.
  ///
  /// Parameter [refreshTokenValidity] :
  /// The time limit, in days, after which the refresh token is no longer valid
  /// and cannot be used.
  ///
  /// Parameter [supportedIdentityProviders] :
  /// A list of provider names for the identity providers that are supported on
  /// this client.
  ///
  /// Parameter [tokenValidityUnits] :
  /// The units in which the validity times are represented in. Default for
  /// RefreshToken is days, and default for ID and access tokens are hours.
  ///
  /// Parameter [writeAttributes] :
  /// The writeable attributes of the user pool.
  Future<UpdateUserPoolClientResponse> updateUserPoolClient({
    @_s.required String clientId,
    @_s.required String userPoolId,
    int accessTokenValidity,
    List<OAuthFlowType> allowedOAuthFlows,
    bool allowedOAuthFlowsUserPoolClient,
    List<String> allowedOAuthScopes,
    AnalyticsConfigurationType analyticsConfiguration,
    List<String> callbackURLs,
    String clientName,
    String defaultRedirectURI,
    List<ExplicitAuthFlowsType> explicitAuthFlows,
    int idTokenValidity,
    List<String> logoutURLs,
    PreventUserExistenceErrorTypes preventUserExistenceErrors,
    List<String> readAttributes,
    int refreshTokenValidity,
    List<String> supportedIdentityProviders,
    TokenValidityUnitsType tokenValidityUnits,
    List<String> writeAttributes,
  }) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[\w+]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'accessTokenValidity',
      accessTokenValidity,
      1,
      86400,
    );
    _s.validateStringLength(
      'clientName',
      clientName,
      1,
      128,
    );
    _s.validateStringPattern(
      'clientName',
      clientName,
      r'''[\w\s+=,.@-]+''',
    );
    _s.validateStringLength(
      'defaultRedirectURI',
      defaultRedirectURI,
      1,
      1024,
    );
    _s.validateStringPattern(
      'defaultRedirectURI',
      defaultRedirectURI,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
    );
    _s.validateNumRange(
      'idTokenValidity',
      idTokenValidity,
      1,
      86400,
    );
    _s.validateNumRange(
      'refreshTokenValidity',
      refreshTokenValidity,
      0,
      315360000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateUserPoolClient'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientId': clientId,
        'UserPoolId': userPoolId,
        if (accessTokenValidity != null)
          'AccessTokenValidity': accessTokenValidity,
        if (allowedOAuthFlows != null)
          'AllowedOAuthFlows':
              allowedOAuthFlows.map((e) => e?.toValue() ?? '').toList(),
        if (allowedOAuthFlowsUserPoolClient != null)
          'AllowedOAuthFlowsUserPoolClient': allowedOAuthFlowsUserPoolClient,
        if (allowedOAuthScopes != null)
          'AllowedOAuthScopes': allowedOAuthScopes,
        if (analyticsConfiguration != null)
          'AnalyticsConfiguration': analyticsConfiguration,
        if (callbackURLs != null) 'CallbackURLs': callbackURLs,
        if (clientName != null) 'ClientName': clientName,
        if (defaultRedirectURI != null)
          'DefaultRedirectURI': defaultRedirectURI,
        if (explicitAuthFlows != null)
          'ExplicitAuthFlows':
              explicitAuthFlows.map((e) => e?.toValue() ?? '').toList(),
        if (idTokenValidity != null) 'IdTokenValidity': idTokenValidity,
        if (logoutURLs != null) 'LogoutURLs': logoutURLs,
        if (preventUserExistenceErrors != null)
          'PreventUserExistenceErrors': preventUserExistenceErrors.toValue(),
        if (readAttributes != null) 'ReadAttributes': readAttributes,
        if (refreshTokenValidity != null)
          'RefreshTokenValidity': refreshTokenValidity,
        if (supportedIdentityProviders != null)
          'SupportedIdentityProviders': supportedIdentityProviders,
        if (tokenValidityUnits != null)
          'TokenValidityUnits': tokenValidityUnits,
        if (writeAttributes != null) 'WriteAttributes': writeAttributes,
      },
    );

    return UpdateUserPoolClientResponse.fromJson(jsonResponse.body);
  }

  /// Updates the Secure Sockets Layer (SSL) certificate for the custom domain
  /// for your user pool.
  ///
  /// You can use this operation to provide the Amazon Resource Name (ARN) of a
  /// new certificate to Amazon Cognito. You cannot use it to change the domain
  /// for a user pool.
  ///
  /// A custom domain is used to host the Amazon Cognito hosted UI, which
  /// provides sign-up and sign-in pages for your application. When you set up a
  /// custom domain, you provide a certificate that you manage with AWS
  /// Certificate Manager (ACM). When necessary, you can use this operation to
  /// change the certificate that you applied to your custom domain.
  ///
  /// Usually, this is unnecessary following routine certificate renewal with
  /// ACM. When you renew your existing certificate in ACM, the ARN for your
  /// certificate remains the same, and your custom domain uses the new
  /// certificate automatically.
  ///
  /// However, if you replace your existing certificate with a new one, ACM
  /// gives the new certificate a new ARN. To apply the new certificate to your
  /// custom domain, you must provide this ARN to Amazon Cognito.
  ///
  /// When you add your new certificate in ACM, you must choose US East (N.
  /// Virginia) as the AWS Region.
  ///
  /// After you submit your request, Amazon Cognito requires up to 1 hour to
  /// distribute your new certificate to your custom domain.
  ///
  /// For more information about adding a custom domain to your user pool, see
  /// <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html">Using
  /// Your Own Domain for the Hosted UI</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [NotAuthorizedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [customDomainConfig] :
  /// The configuration for a custom domain that hosts the sign-up and sign-in
  /// pages for your application. Use this object to specify an SSL certificate
  /// that is managed by ACM.
  ///
  /// Parameter [domain] :
  /// The domain name for the custom domain that hosts the sign-up and sign-in
  /// pages for your application. For example: <code>auth.example.com</code>.
  ///
  /// This string can include only lowercase letters, numbers, and hyphens. Do
  /// not use a hyphen for the first or last character. Use periods to separate
  /// subdomain names.
  ///
  /// Parameter [userPoolId] :
  /// The ID of the user pool that is associated with the custom domain that you
  /// are updating the certificate for.
  Future<UpdateUserPoolDomainResponse> updateUserPoolDomain({
    @_s.required CustomDomainConfigType customDomainConfig,
    @_s.required String domain,
    @_s.required String userPoolId,
  }) async {
    ArgumentError.checkNotNull(customDomainConfig, 'customDomainConfig');
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domain',
      domain,
      r'''^[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userPoolId, 'userPoolId');
    _s.validateStringLength(
      'userPoolId',
      userPoolId,
      1,
      55,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userPoolId',
      userPoolId,
      r'''[\w-]+_[0-9a-zA-Z]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.UpdateUserPoolDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomDomainConfig': customDomainConfig,
        'Domain': domain,
        'UserPoolId': userPoolId,
      },
    );

    return UpdateUserPoolDomainResponse.fromJson(jsonResponse.body);
  }

  /// Use this API to register a user's entered TOTP code and mark the user's
  /// software token MFA status as "verified" if successful. The request takes
  /// an access token or a session string, but not both.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidUserPoolConfigurationException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  /// May throw [EnableSoftwareTokenMFAException].
  /// May throw [NotAuthorizedException].
  /// May throw [SoftwareTokenMFANotFoundException].
  /// May throw [CodeMismatchException].
  ///
  /// Parameter [userCode] :
  /// The one time password computed using the secret code returned by <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AssociateSoftwareToken.html">AssociateSoftwareToken"</a>.
  ///
  /// Parameter [accessToken] :
  /// The access token.
  ///
  /// Parameter [friendlyDeviceName] :
  /// The friendly device name.
  ///
  /// Parameter [session] :
  /// The session which should be passed both ways in challenge-response calls
  /// to the service.
  Future<VerifySoftwareTokenResponse> verifySoftwareToken({
    @_s.required String userCode,
    String accessToken,
    String friendlyDeviceName,
    String session,
  }) async {
    ArgumentError.checkNotNull(userCode, 'userCode');
    _s.validateStringLength(
      'userCode',
      userCode,
      6,
      6,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userCode',
      userCode,
      r'''[0-9]+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
    );
    _s.validateStringLength(
      'session',
      session,
      20,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.VerifySoftwareToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserCode': userCode,
        if (accessToken != null) 'AccessToken': accessToken,
        if (friendlyDeviceName != null)
          'FriendlyDeviceName': friendlyDeviceName,
        if (session != null) 'Session': session,
      },
    );

    return VerifySoftwareTokenResponse.fromJson(jsonResponse.body);
  }

  /// Verifies the specified user attributes in the user pool.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [CodeMismatchException].
  /// May throw [ExpiredCodeException].
  /// May throw [NotAuthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [PasswordResetRequiredException].
  /// May throw [UserNotFoundException].
  /// May throw [UserNotConfirmedException].
  /// May throw [InternalErrorException].
  ///
  /// Parameter [accessToken] :
  /// Represents the access token of the request to verify user attributes.
  ///
  /// Parameter [attributeName] :
  /// The attribute name in the request to verify user attributes.
  ///
  /// Parameter [code] :
  /// The verification code in the request to verify user attributes.
  Future<void> verifyUserAttribute({
    @_s.required String accessToken,
    @_s.required String attributeName,
    @_s.required String code,
  }) async {
    ArgumentError.checkNotNull(accessToken, 'accessToken');
    _s.validateStringPattern(
      'accessToken',
      accessToken,
      r'''[A-Za-z0-9-_=.]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    _s.validateStringLength(
      'attributeName',
      attributeName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'attributeName',
      attributeName,
      r'''[\p{L}\p{M}\p{S}\p{N}\p{P}]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(code, 'code');
    _s.validateStringLength(
      'code',
      code,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'code',
      code,
      r'''[\S]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSCognitoIdentityProviderService.VerifyUserAttribute'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccessToken': accessToken,
        'AttributeName': attributeName,
        'Code': code,
      },
    );

    return VerifyUserAttributeResponse.fromJson(jsonResponse.body);
  }
}

/// The data type for <code>AccountRecoverySetting</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccountRecoverySettingType {
  /// The list of <code>RecoveryOptionTypes</code>.
  @_s.JsonKey(name: 'RecoveryMechanisms')
  final List<RecoveryOptionType> recoveryMechanisms;

  AccountRecoverySettingType({
    this.recoveryMechanisms,
  });
  factory AccountRecoverySettingType.fromJson(Map<String, dynamic> json) =>
      _$AccountRecoverySettingTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRecoverySettingTypeToJson(this);
}

/// Account takeover action type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccountTakeoverActionType {
  /// The event action.
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> Choosing this action will block the request.
  /// </li>
  /// <li>
  /// <code>MFA_IF_CONFIGURED</code> Throw MFA challenge if user has configured
  /// it, else allow the request.
  /// </li>
  /// <li>
  /// <code>MFA_REQUIRED</code> Throw MFA challenge if user has configured it,
  /// else block the request.
  /// </li>
  /// <li>
  /// <code>NO_ACTION</code> Allow the user sign-in.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EventAction')
  final AccountTakeoverEventActionType eventAction;

  /// Flag specifying whether to send a notification.
  @_s.JsonKey(name: 'Notify')
  final bool notify;

  AccountTakeoverActionType({
    @_s.required this.eventAction,
    @_s.required this.notify,
  });
  factory AccountTakeoverActionType.fromJson(Map<String, dynamic> json) =>
      _$AccountTakeoverActionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AccountTakeoverActionTypeToJson(this);
}

/// Account takeover actions type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccountTakeoverActionsType {
  /// Action to take for a high risk.
  @_s.JsonKey(name: 'HighAction')
  final AccountTakeoverActionType highAction;

  /// Action to take for a low risk.
  @_s.JsonKey(name: 'LowAction')
  final AccountTakeoverActionType lowAction;

  /// Action to take for a medium risk.
  @_s.JsonKey(name: 'MediumAction')
  final AccountTakeoverActionType mediumAction;

  AccountTakeoverActionsType({
    this.highAction,
    this.lowAction,
    this.mediumAction,
  });
  factory AccountTakeoverActionsType.fromJson(Map<String, dynamic> json) =>
      _$AccountTakeoverActionsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AccountTakeoverActionsTypeToJson(this);
}

enum AccountTakeoverEventActionType {
  @_s.JsonValue('BLOCK')
  block,
  @_s.JsonValue('MFA_IF_CONFIGURED')
  mfaIfConfigured,
  @_s.JsonValue('MFA_REQUIRED')
  mfaRequired,
  @_s.JsonValue('NO_ACTION')
  noAction,
}

/// Configuration for mitigation actions and notification for different levels
/// of risk detected for a potential account takeover.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccountTakeoverRiskConfigurationType {
  /// Account takeover risk configuration actions
  @_s.JsonKey(name: 'Actions')
  final AccountTakeoverActionsType actions;

  /// The notify configuration used to construct email notifications.
  @_s.JsonKey(name: 'NotifyConfiguration')
  final NotifyConfigurationType notifyConfiguration;

  AccountTakeoverRiskConfigurationType({
    @_s.required this.actions,
    this.notifyConfiguration,
  });
  factory AccountTakeoverRiskConfigurationType.fromJson(
          Map<String, dynamic> json) =>
      _$AccountTakeoverRiskConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AccountTakeoverRiskConfigurationTypeToJson(this);
}

/// Represents the response from the server for the request to add custom
/// attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddCustomAttributesResponse {
  AddCustomAttributesResponse();
  factory AddCustomAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCustomAttributesResponseFromJson(json);
}

/// Represents the response from the server for the request to confirm
/// registration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminConfirmSignUpResponse {
  AdminConfirmSignUpResponse();
  factory AdminConfirmSignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminConfirmSignUpResponseFromJson(json);
}

/// The configuration for creating a new user profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AdminCreateUserConfigType {
  /// Set to <code>True</code> if only the administrator is allowed to create user
  /// profiles. Set to <code>False</code> if users can sign themselves up via an
  /// app.
  @_s.JsonKey(name: 'AllowAdminCreateUserOnly')
  final bool allowAdminCreateUserOnly;

  /// The message template to be used for the welcome message to new users.
  ///
  /// See also <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-message-customizations.html#cognito-user-pool-settings-user-invitation-message-customization">Customizing
  /// User Invitation Messages</a>.
  @_s.JsonKey(name: 'InviteMessageTemplate')
  final MessageTemplateType inviteMessageTemplate;

  /// The user account expiration limit, in days, after which the account is no
  /// longer usable. To reset the account after that time limit, you must call
  /// <code>AdminCreateUser</code> again, specifying <code>"RESEND"</code> for the
  /// <code>MessageAction</code> parameter. The default value for this parameter
  /// is 7.
  /// <note>
  /// If you set a value for <code>TemporaryPasswordValidityDays</code> in
  /// <code>PasswordPolicy</code>, that value will be used and
  /// <code>UnusedAccountValidityDays</code> will be deprecated for that user
  /// pool.
  /// </note>
  @_s.JsonKey(name: 'UnusedAccountValidityDays')
  final int unusedAccountValidityDays;

  AdminCreateUserConfigType({
    this.allowAdminCreateUserOnly,
    this.inviteMessageTemplate,
    this.unusedAccountValidityDays,
  });
  factory AdminCreateUserConfigType.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateUserConfigTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCreateUserConfigTypeToJson(this);
}

/// Represents the response from the server to the request to create the user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminCreateUserResponse {
  /// The newly created user.
  @_s.JsonKey(name: 'User')
  final UserType user;

  AdminCreateUserResponse({
    this.user,
  });
  factory AdminCreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateUserResponseFromJson(json);
}

/// Represents the response received from the server for a request to delete
/// user attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminDeleteUserAttributesResponse {
  AdminDeleteUserAttributesResponse();
  factory AdminDeleteUserAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminDeleteUserAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminDisableProviderForUserResponse {
  AdminDisableProviderForUserResponse();
  factory AdminDisableProviderForUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminDisableProviderForUserResponseFromJson(json);
}

/// Represents the response received from the server to disable the user as an
/// administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminDisableUserResponse {
  AdminDisableUserResponse();
  factory AdminDisableUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminDisableUserResponseFromJson(json);
}

/// Represents the response from the server for the request to enable a user as
/// an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminEnableUserResponse {
  AdminEnableUserResponse();
  factory AdminEnableUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminEnableUserResponseFromJson(json);
}

/// Gets the device response, as an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminGetDeviceResponse {
  /// The device.
  @_s.JsonKey(name: 'Device')
  final DeviceType device;

  AdminGetDeviceResponse({
    @_s.required this.device,
  });
  factory AdminGetDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminGetDeviceResponseFromJson(json);
}

/// Represents the response from the server from the request to get the
/// specified user as an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminGetUserResponse {
  /// The user name of the user about whom you are receiving information.
  @_s.JsonKey(name: 'Username')
  final String username;

  /// Indicates that the status is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// <i>This response parameter is no longer supported.</i> It provides
  /// information only about SMS MFA configurations. It doesn't provide
  /// information about TOTP software token MFA configurations. To look up
  /// information about either type of MFA configuration, use UserMFASettingList
  /// instead.
  @_s.JsonKey(name: 'MFAOptions')
  final List<MFAOptionType> mFAOptions;

  /// The user's preferred MFA setting.
  @_s.JsonKey(name: 'PreferredMfaSetting')
  final String preferredMfaSetting;

  /// An array of name-value pairs representing user attributes.
  @_s.JsonKey(name: 'UserAttributes')
  final List<AttributeType> userAttributes;

  /// The date the user was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UserCreateDate')
  final DateTime userCreateDate;

  /// The date the user was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UserLastModifiedDate')
  final DateTime userLastModifiedDate;

  /// The MFA options that are enabled for the user. The possible values in this
  /// list are <code>SMS_MFA</code> and <code>SOFTWARE_TOKEN_MFA</code>.
  @_s.JsonKey(name: 'UserMFASettingList')
  final List<String> userMFASettingList;

  /// The user status. Can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// UNCONFIRMED - User has been created but not confirmed.
  /// </li>
  /// <li>
  /// CONFIRMED - User has been confirmed.
  /// </li>
  /// <li>
  /// ARCHIVED - User is no longer active.
  /// </li>
  /// <li>
  /// COMPROMISED - User is disabled due to a potential security threat.
  /// </li>
  /// <li>
  /// UNKNOWN - User status is not known.
  /// </li>
  /// <li>
  /// RESET_REQUIRED - User is confirmed, but the user must request a code and
  /// reset his or her password before he or she can sign in.
  /// </li>
  /// <li>
  /// FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using
  /// a temporary password, but on first sign-in, the user must change his or her
  /// password to a new value before doing anything else.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'UserStatus')
  final UserStatusType userStatus;

  AdminGetUserResponse({
    @_s.required this.username,
    this.enabled,
    this.mFAOptions,
    this.preferredMfaSetting,
    this.userAttributes,
    this.userCreateDate,
    this.userLastModifiedDate,
    this.userMFASettingList,
    this.userStatus,
  });
  factory AdminGetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminGetUserResponseFromJson(json);
}

/// Initiates the authentication response, as an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminInitiateAuthResponse {
  /// The result of the authentication response. This is only returned if the
  /// caller does not need to pass another challenge. If the caller does need to
  /// pass another challenge before it gets tokens, <code>ChallengeName</code>,
  /// <code>ChallengeParameters</code>, and <code>Session</code> are returned.
  @_s.JsonKey(name: 'AuthenticationResult')
  final AuthenticationResultType authenticationResult;

  /// The name of the challenge which you are responding to with this call. This
  /// is returned to you in the <code>AdminInitiateAuth</code> response if you
  /// need to pass another challenge.
  ///
  /// <ul>
  /// <li>
  /// <code>MFA_SETUP</code>: If MFA is required, users who do not have at least
  /// one of the MFA methods set up are presented with an <code>MFA_SETUP</code>
  /// challenge. The user must set up at least one MFA type to continue to
  /// authenticate.
  /// </li>
  /// <li>
  /// <code>SELECT_MFA_TYPE</code>: Selects the MFA type. Valid MFA options are
  /// <code>SMS_MFA</code> for text SMS MFA, and <code>SOFTWARE_TOKEN_MFA</code>
  /// for TOTP software token MFA.
  /// </li>
  /// <li>
  /// <code>SMS_MFA</code>: Next challenge is to supply an
  /// <code>SMS_MFA_CODE</code>, delivered via SMS.
  /// </li>
  /// <li>
  /// <code>PASSWORD_VERIFIER</code>: Next challenge is to supply
  /// <code>PASSWORD_CLAIM_SIGNATURE</code>,
  /// <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after
  /// the client-side SRP calculations.
  /// </li>
  /// <li>
  /// <code>CUSTOM_CHALLENGE</code>: This is returned if your custom
  /// authentication flow determines that the user should pass another challenge
  /// before tokens are issued.
  /// </li>
  /// <li>
  /// <code>DEVICE_SRP_AUTH</code>: If device tracking was enabled on your user
  /// pool and the previous challenges were passed, this challenge is returned so
  /// that Amazon Cognito can start tracking this device.
  /// </li>
  /// <li>
  /// <code>DEVICE_PASSWORD_VERIFIER</code>: Similar to
  /// <code>PASSWORD_VERIFIER</code>, but for devices only.
  /// </li>
  /// <li>
  /// <code>ADMIN_NO_SRP_AUTH</code>: This is returned if you need to authenticate
  /// with <code>USERNAME</code> and <code>PASSWORD</code> directly. An app client
  /// must be enabled to use this flow.
  /// </li>
  /// <li>
  /// <code>NEW_PASSWORD_REQUIRED</code>: For users which are required to change
  /// their passwords after successful first login. This challenge should be
  /// passed with <code>NEW_PASSWORD</code> and any other required attributes.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ChallengeName')
  final ChallengeNameType challengeName;

  /// The challenge parameters. These are returned to you in the
  /// <code>AdminInitiateAuth</code> response if you need to pass another
  /// challenge. The responses in this parameter should be used to compute inputs
  /// to the next call (<code>AdminRespondToAuthChallenge</code>).
  ///
  /// All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code>
  /// (if applicable).
  ///
  /// The value of the <code>USER_ID_FOR_SRP</code> attribute will be the user's
  /// actual username, not an alias (such as email address or phone number), even
  /// if you specified an alias in your call to <code>AdminInitiateAuth</code>.
  /// This is because, in the <code>AdminRespondToAuthChallenge</code> API
  /// <code>ChallengeResponses</code>, the <code>USERNAME</code> attribute cannot
  /// be an alias.
  @_s.JsonKey(name: 'ChallengeParameters')
  final Map<String, String> challengeParameters;

  /// The session which should be passed both ways in challenge-response calls to
  /// the service. If <code>AdminInitiateAuth</code> or
  /// <code>AdminRespondToAuthChallenge</code> API call determines that the caller
  /// needs to go through another challenge, they return a session with other
  /// challenge parameters. This session should be passed as it is to the next
  /// <code>AdminRespondToAuthChallenge</code> API call.
  @_s.JsonKey(name: 'Session')
  final String session;

  AdminInitiateAuthResponse({
    this.authenticationResult,
    this.challengeName,
    this.challengeParameters,
    this.session,
  });
  factory AdminInitiateAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminInitiateAuthResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminLinkProviderForUserResponse {
  AdminLinkProviderForUserResponse();
  factory AdminLinkProviderForUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminLinkProviderForUserResponseFromJson(json);
}

/// Lists the device's response, as an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminListDevicesResponse {
  /// The devices in the list of devices response.
  @_s.JsonKey(name: 'Devices')
  final List<DeviceType> devices;

  /// The pagination token.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  AdminListDevicesResponse({
    this.devices,
    this.paginationToken,
  });
  factory AdminListDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminListDevicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminListGroupsForUserResponse {
  /// The groups that the user belongs to.
  @_s.JsonKey(name: 'Groups')
  final List<GroupType> groups;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  AdminListGroupsForUserResponse({
    this.groups,
    this.nextToken,
  });
  factory AdminListGroupsForUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminListGroupsForUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminListUserAuthEventsResponse {
  /// The response object. It includes the <code>EventID</code>,
  /// <code>EventType</code>, <code>CreationDate</code>, <code>EventRisk</code>,
  /// and <code>EventResponse</code>.
  @_s.JsonKey(name: 'AuthEvents')
  final List<AuthEventType> authEvents;

  /// A pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  AdminListUserAuthEventsResponse({
    this.authEvents,
    this.nextToken,
  });
  factory AdminListUserAuthEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminListUserAuthEventsResponseFromJson(json);
}

/// Represents the response from the server to reset a user password as an
/// administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminResetUserPasswordResponse {
  AdminResetUserPasswordResponse();
  factory AdminResetUserPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminResetUserPasswordResponseFromJson(json);
}

/// Responds to the authentication challenge, as an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminRespondToAuthChallengeResponse {
  /// The result returned by the server in response to the authentication request.
  @_s.JsonKey(name: 'AuthenticationResult')
  final AuthenticationResultType authenticationResult;

  /// The name of the challenge. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html">AdminInitiateAuth</a>.
  @_s.JsonKey(name: 'ChallengeName')
  final ChallengeNameType challengeName;

  /// The challenge parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_AdminInitiateAuth.html">AdminInitiateAuth</a>.
  @_s.JsonKey(name: 'ChallengeParameters')
  final Map<String, String> challengeParameters;

  /// The session which should be passed both ways in challenge-response calls to
  /// the service. If the caller needs to go through another challenge, they
  /// return a session with other challenge parameters. This session should be
  /// passed as it is to the next <code>RespondToAuthChallenge</code> API call.
  @_s.JsonKey(name: 'Session')
  final String session;

  AdminRespondToAuthChallengeResponse({
    this.authenticationResult,
    this.challengeName,
    this.challengeParameters,
    this.session,
  });
  factory AdminRespondToAuthChallengeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminRespondToAuthChallengeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminSetUserMFAPreferenceResponse {
  AdminSetUserMFAPreferenceResponse();
  factory AdminSetUserMFAPreferenceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminSetUserMFAPreferenceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminSetUserPasswordResponse {
  AdminSetUserPasswordResponse();
  factory AdminSetUserPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminSetUserPasswordResponseFromJson(json);
}

/// Represents the response from the server to set user settings as an
/// administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminSetUserSettingsResponse {
  AdminSetUserSettingsResponse();
  factory AdminSetUserSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminSetUserSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminUpdateAuthEventFeedbackResponse {
  AdminUpdateAuthEventFeedbackResponse();
  factory AdminUpdateAuthEventFeedbackResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminUpdateAuthEventFeedbackResponseFromJson(json);
}

/// The status response from the request to update the device, as an
/// administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminUpdateDeviceStatusResponse {
  AdminUpdateDeviceStatusResponse();
  factory AdminUpdateDeviceStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateDeviceStatusResponseFromJson(json);
}

/// Represents the response from the server for the request to update user
/// attributes as an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminUpdateUserAttributesResponse {
  AdminUpdateUserAttributesResponse();
  factory AdminUpdateUserAttributesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdminUpdateUserAttributesResponseFromJson(json);
}

/// The global sign-out response, as an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminUserGlobalSignOutResponse {
  AdminUserGlobalSignOutResponse();
  factory AdminUserGlobalSignOutResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserGlobalSignOutResponseFromJson(json);
}

enum AdvancedSecurityModeType {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('AUDIT')
  audit,
  @_s.JsonValue('ENFORCED')
  enforced,
}

enum AliasAttributeType {
  @_s.JsonValue('phone_number')
  phoneNumber,
  @_s.JsonValue('email')
  email,
  @_s.JsonValue('preferred_username')
  preferredUsername,
}

extension on AliasAttributeType {
  String toValue() {
    switch (this) {
      case AliasAttributeType.phoneNumber:
        return 'phone_number';
      case AliasAttributeType.email:
        return 'email';
      case AliasAttributeType.preferredUsername:
        return 'preferred_username';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The Amazon Pinpoint analytics configuration for collecting metrics for a
/// user pool.
/// <note>
/// In regions where Pinpoint is not available, Cognito User Pools only supports
/// sending events to Amazon Pinpoint projects in us-east-1. In regions where
/// Pinpoint is available, Cognito User Pools will support sending events to
/// Amazon Pinpoint projects within that same region.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AnalyticsConfigurationType {
  /// The Amazon Resource Name (ARN) of an Amazon Pinpoint project. You can use
  /// the Amazon Pinpoint project for Pinpoint integration with the chosen User
  /// Pool Client. Amazon Cognito publishes events to the pinpoint project
  /// declared by the app ARN.
  @_s.JsonKey(name: 'ApplicationArn')
  final String applicationArn;

  /// The application ID for an Amazon Pinpoint application.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The external ID.
  @_s.JsonKey(name: 'ExternalId')
  final String externalId;

  /// The ARN of an IAM role that authorizes Amazon Cognito to publish events to
  /// Amazon Pinpoint analytics.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// If <code>UserDataShared</code> is <code>true</code>, Amazon Cognito will
  /// include user data in the events it publishes to Amazon Pinpoint analytics.
  @_s.JsonKey(name: 'UserDataShared')
  final bool userDataShared;

  AnalyticsConfigurationType({
    this.applicationArn,
    this.applicationId,
    this.externalId,
    this.roleArn,
    this.userDataShared,
  });
  factory AnalyticsConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticsConfigurationTypeToJson(this);
}

/// An Amazon Pinpoint analytics endpoint.
///
/// An endpoint uniquely identifies a mobile device, email address, or phone
/// number that can receive messages from Amazon Pinpoint analytics.
/// <note>
/// Cognito User Pools only supports sending events to Amazon Pinpoint projects
/// in the US East (N. Virginia) us-east-1 Region, regardless of the region in
/// which the user pool resides.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AnalyticsMetadataType {
  /// The endpoint ID.
  @_s.JsonKey(name: 'AnalyticsEndpointId')
  final String analyticsEndpointId;

  AnalyticsMetadataType({
    this.analyticsEndpointId,
  });
  Map<String, dynamic> toJson() => _$AnalyticsMetadataTypeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateSoftwareTokenResponse {
  /// A unique generated shared secret code that is used in the TOTP algorithm to
  /// generate a one time code.
  @_s.JsonKey(name: 'SecretCode')
  final String secretCode;

  /// The session which should be passed both ways in challenge-response calls to
  /// the service. This allows authentication of the user as part of the MFA setup
  /// process.
  @_s.JsonKey(name: 'Session')
  final String session;

  AssociateSoftwareTokenResponse({
    this.secretCode,
    this.session,
  });
  factory AssociateSoftwareTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateSoftwareTokenResponseFromJson(json);
}

enum AttributeDataType {
  @_s.JsonValue('String')
  string,
  @_s.JsonValue('Number')
  number,
  @_s.JsonValue('DateTime')
  dateTime,
  @_s.JsonValue('Boolean')
  boolean,
}

/// Specifies whether the attribute is standard or custom.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeType {
  /// The name of the attribute.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the attribute.
  @_s.JsonKey(name: 'Value')
  final String value;

  AttributeType({
    @_s.required this.name,
    this.value,
  });
  factory AttributeType.fromJson(Map<String, dynamic> json) =>
      _$AttributeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeTypeToJson(this);
}

/// The authentication event type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthEventType {
  /// The challenge responses.
  @_s.JsonKey(name: 'ChallengeResponses')
  final List<ChallengeResponseType> challengeResponses;

  /// The creation date
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The user context data captured at the time of an event request. It provides
  /// additional information about the client from which event the request is
  /// received.
  @_s.JsonKey(name: 'EventContextData')
  final EventContextDataType eventContextData;

  /// A flag specifying the user feedback captured at the time of an event request
  /// is good or bad.
  @_s.JsonKey(name: 'EventFeedback')
  final EventFeedbackType eventFeedback;

  /// The event ID.
  @_s.JsonKey(name: 'EventId')
  final String eventId;

  /// The event response.
  @_s.JsonKey(name: 'EventResponse')
  final EventResponseType eventResponse;

  /// The event risk.
  @_s.JsonKey(name: 'EventRisk')
  final EventRiskType eventRisk;

  /// The event type.
  @_s.JsonKey(name: 'EventType')
  final EventType eventType;

  AuthEventType({
    this.challengeResponses,
    this.creationDate,
    this.eventContextData,
    this.eventFeedback,
    this.eventId,
    this.eventResponse,
    this.eventRisk,
    this.eventType,
  });
  factory AuthEventType.fromJson(Map<String, dynamic> json) =>
      _$AuthEventTypeFromJson(json);
}

enum AuthFlowType {
  @_s.JsonValue('USER_SRP_AUTH')
  userSrpAuth,
  @_s.JsonValue('REFRESH_TOKEN_AUTH')
  refreshTokenAuth,
  @_s.JsonValue('REFRESH_TOKEN')
  refreshToken,
  @_s.JsonValue('CUSTOM_AUTH')
  customAuth,
  @_s.JsonValue('ADMIN_NO_SRP_AUTH')
  adminNoSrpAuth,
  @_s.JsonValue('USER_PASSWORD_AUTH')
  userPasswordAuth,
  @_s.JsonValue('ADMIN_USER_PASSWORD_AUTH')
  adminUserPasswordAuth,
}

extension on AuthFlowType {
  String toValue() {
    switch (this) {
      case AuthFlowType.userSrpAuth:
        return 'USER_SRP_AUTH';
      case AuthFlowType.refreshTokenAuth:
        return 'REFRESH_TOKEN_AUTH';
      case AuthFlowType.refreshToken:
        return 'REFRESH_TOKEN';
      case AuthFlowType.customAuth:
        return 'CUSTOM_AUTH';
      case AuthFlowType.adminNoSrpAuth:
        return 'ADMIN_NO_SRP_AUTH';
      case AuthFlowType.userPasswordAuth:
        return 'USER_PASSWORD_AUTH';
      case AuthFlowType.adminUserPasswordAuth:
        return 'ADMIN_USER_PASSWORD_AUTH';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The authentication result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthenticationResultType {
  /// The access token.
  @_s.JsonKey(name: 'AccessToken')
  final String accessToken;

  /// The expiration period of the authentication result in seconds.
  @_s.JsonKey(name: 'ExpiresIn')
  final int expiresIn;

  /// The ID token.
  @_s.JsonKey(name: 'IdToken')
  final String idToken;

  /// The new device metadata from an authentication result.
  @_s.JsonKey(name: 'NewDeviceMetadata')
  final NewDeviceMetadataType newDeviceMetadata;

  /// The refresh token.
  @_s.JsonKey(name: 'RefreshToken')
  final String refreshToken;

  /// The token type.
  @_s.JsonKey(name: 'TokenType')
  final String tokenType;

  AuthenticationResultType({
    this.accessToken,
    this.expiresIn,
    this.idToken,
    this.newDeviceMetadata,
    this.refreshToken,
    this.tokenType,
  });
  factory AuthenticationResultType.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResultTypeFromJson(json);
}

enum ChallengeName {
  @_s.JsonValue('Password')
  password,
  @_s.JsonValue('Mfa')
  mfa,
}

enum ChallengeNameType {
  @_s.JsonValue('SMS_MFA')
  smsMfa,
  @_s.JsonValue('SOFTWARE_TOKEN_MFA')
  softwareTokenMfa,
  @_s.JsonValue('SELECT_MFA_TYPE')
  selectMfaType,
  @_s.JsonValue('MFA_SETUP')
  mfaSetup,
  @_s.JsonValue('PASSWORD_VERIFIER')
  passwordVerifier,
  @_s.JsonValue('CUSTOM_CHALLENGE')
  customChallenge,
  @_s.JsonValue('DEVICE_SRP_AUTH')
  deviceSrpAuth,
  @_s.JsonValue('DEVICE_PASSWORD_VERIFIER')
  devicePasswordVerifier,
  @_s.JsonValue('ADMIN_NO_SRP_AUTH')
  adminNoSrpAuth,
  @_s.JsonValue('NEW_PASSWORD_REQUIRED')
  newPasswordRequired,
}

extension on ChallengeNameType {
  String toValue() {
    switch (this) {
      case ChallengeNameType.smsMfa:
        return 'SMS_MFA';
      case ChallengeNameType.softwareTokenMfa:
        return 'SOFTWARE_TOKEN_MFA';
      case ChallengeNameType.selectMfaType:
        return 'SELECT_MFA_TYPE';
      case ChallengeNameType.mfaSetup:
        return 'MFA_SETUP';
      case ChallengeNameType.passwordVerifier:
        return 'PASSWORD_VERIFIER';
      case ChallengeNameType.customChallenge:
        return 'CUSTOM_CHALLENGE';
      case ChallengeNameType.deviceSrpAuth:
        return 'DEVICE_SRP_AUTH';
      case ChallengeNameType.devicePasswordVerifier:
        return 'DEVICE_PASSWORD_VERIFIER';
      case ChallengeNameType.adminNoSrpAuth:
        return 'ADMIN_NO_SRP_AUTH';
      case ChallengeNameType.newPasswordRequired:
        return 'NEW_PASSWORD_REQUIRED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ChallengeResponse {
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failure')
  failure,
}

/// The challenge response type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChallengeResponseType {
  /// The challenge name
  @_s.JsonKey(name: 'ChallengeName')
  final ChallengeName challengeName;

  /// The challenge response.
  @_s.JsonKey(name: 'ChallengeResponse')
  final ChallengeResponse challengeResponse;

  ChallengeResponseType({
    this.challengeName,
    this.challengeResponse,
  });
  factory ChallengeResponseType.fromJson(Map<String, dynamic> json) =>
      _$ChallengeResponseTypeFromJson(json);
}

/// The response from the server to the change password request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChangePasswordResponse {
  ChangePasswordResponse();
  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
}

/// The code delivery details being returned from the server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CodeDeliveryDetailsType {
  /// The attribute name.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The delivery medium (email message or phone number).
  @_s.JsonKey(name: 'DeliveryMedium')
  final DeliveryMediumType deliveryMedium;

  /// The destination for the code delivery details.
  @_s.JsonKey(name: 'Destination')
  final String destination;

  CodeDeliveryDetailsType({
    this.attributeName,
    this.deliveryMedium,
    this.destination,
  });
  factory CodeDeliveryDetailsType.fromJson(Map<String, dynamic> json) =>
      _$CodeDeliveryDetailsTypeFromJson(json);
}

/// The compromised credentials actions type
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CompromisedCredentialsActionsType {
  /// The event action.
  @_s.JsonKey(name: 'EventAction')
  final CompromisedCredentialsEventActionType eventAction;

  CompromisedCredentialsActionsType({
    @_s.required this.eventAction,
  });
  factory CompromisedCredentialsActionsType.fromJson(
          Map<String, dynamic> json) =>
      _$CompromisedCredentialsActionsTypeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompromisedCredentialsActionsTypeToJson(this);
}

enum CompromisedCredentialsEventActionType {
  @_s.JsonValue('BLOCK')
  block,
  @_s.JsonValue('NO_ACTION')
  noAction,
}

/// The compromised credentials risk configuration type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CompromisedCredentialsRiskConfigurationType {
  /// The compromised credentials risk configuration actions.
  @_s.JsonKey(name: 'Actions')
  final CompromisedCredentialsActionsType actions;

  /// Perform the action for these events. The default is to perform all events if
  /// no event filter is specified.
  @_s.JsonKey(name: 'EventFilter')
  final List<EventFilterType> eventFilter;

  CompromisedCredentialsRiskConfigurationType({
    @_s.required this.actions,
    this.eventFilter,
  });
  factory CompromisedCredentialsRiskConfigurationType.fromJson(
          Map<String, dynamic> json) =>
      _$CompromisedCredentialsRiskConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompromisedCredentialsRiskConfigurationTypeToJson(this);
}

/// Confirms the device response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmDeviceResponse {
  /// Indicates whether the user confirmation is necessary to confirm the device
  /// response.
  @_s.JsonKey(name: 'UserConfirmationNecessary')
  final bool userConfirmationNecessary;

  ConfirmDeviceResponse({
    this.userConfirmationNecessary,
  });
  factory ConfirmDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmDeviceResponseFromJson(json);
}

/// The response from the server that results from a user's request to retrieve
/// a forgotten password.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmForgotPasswordResponse {
  ConfirmForgotPasswordResponse();
  factory ConfirmForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmForgotPasswordResponseFromJson(json);
}

/// Represents the response from the server for the registration confirmation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmSignUpResponse {
  ConfirmSignUpResponse();
  factory ConfirmSignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmSignUpResponseFromJson(json);
}

/// Contextual user data type used for evaluating the risk of an unexpected
/// event by Amazon Cognito advanced security.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ContextDataType {
  /// HttpHeaders received on your server in same order.
  @_s.JsonKey(name: 'HttpHeaders')
  final List<HttpHeader> httpHeaders;

  /// Source IP address of your user.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// Your server endpoint where this API is invoked.
  @_s.JsonKey(name: 'ServerName')
  final String serverName;

  /// Your server path where this API is invoked.
  @_s.JsonKey(name: 'ServerPath')
  final String serverPath;

  /// Encoded data containing device fingerprinting details, collected using the
  /// Amazon Cognito context data collection library.
  @_s.JsonKey(name: 'EncodedData')
  final String encodedData;

  ContextDataType({
    @_s.required this.httpHeaders,
    @_s.required this.ipAddress,
    @_s.required this.serverName,
    @_s.required this.serverPath,
    this.encodedData,
  });
  Map<String, dynamic> toJson() => _$ContextDataTypeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupResponse {
  /// The group object for the group.
  @_s.JsonKey(name: 'Group')
  final GroupType group;

  CreateGroupResponse({
    this.group,
  });
  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIdentityProviderResponse {
  /// The newly created identity provider object.
  @_s.JsonKey(name: 'IdentityProvider')
  final IdentityProviderType identityProvider;

  CreateIdentityProviderResponse({
    @_s.required this.identityProvider,
  });
  factory CreateIdentityProviderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateIdentityProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResourceServerResponse {
  /// The newly created resource server.
  @_s.JsonKey(name: 'ResourceServer')
  final ResourceServerType resourceServer;

  CreateResourceServerResponse({
    @_s.required this.resourceServer,
  });
  factory CreateResourceServerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResourceServerResponseFromJson(json);
}

/// Represents the response from the server to the request to create the user
/// import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserImportJobResponse {
  /// The job object that represents the user import job.
  @_s.JsonKey(name: 'UserImportJob')
  final UserImportJobType userImportJob;

  CreateUserImportJobResponse({
    this.userImportJob,
  });
  factory CreateUserImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserImportJobResponseFromJson(json);
}

/// Represents the response from the server to create a user pool client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserPoolClientResponse {
  /// The user pool client that was just created.
  @_s.JsonKey(name: 'UserPoolClient')
  final UserPoolClientType userPoolClient;

  CreateUserPoolClientResponse({
    this.userPoolClient,
  });
  factory CreateUserPoolClientResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserPoolClientResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserPoolDomainResponse {
  /// The Amazon CloudFront endpoint that you use as the target of the alias that
  /// you set up with your Domain Name Service (DNS) provider.
  @_s.JsonKey(name: 'CloudFrontDomain')
  final String cloudFrontDomain;

  CreateUserPoolDomainResponse({
    this.cloudFrontDomain,
  });
  factory CreateUserPoolDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserPoolDomainResponseFromJson(json);
}

/// Represents the response from the server for the request to create a user
/// pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserPoolResponse {
  /// A container for the user pool details.
  @_s.JsonKey(name: 'UserPool')
  final UserPoolType userPool;

  CreateUserPoolResponse({
    this.userPool,
  });
  factory CreateUserPoolResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserPoolResponseFromJson(json);
}

/// The configuration for a custom domain that hosts the sign-up and sign-in
/// webpages for your application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomDomainConfigType {
  /// The Amazon Resource Name (ARN) of an AWS Certificate Manager SSL
  /// certificate. You use this certificate for the subdomain of your custom
  /// domain.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  CustomDomainConfigType({
    @_s.required this.certificateArn,
  });
  factory CustomDomainConfigType.fromJson(Map<String, dynamic> json) =>
      _$CustomDomainConfigTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CustomDomainConfigTypeToJson(this);
}

/// A custom email sender Lambda configuration type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomEmailLambdaVersionConfigType {
  /// The Lambda Amazon Resource Name of the Lambda function that Amazon Cognito
  /// triggers to send email notifications to users.
  @_s.JsonKey(name: 'LambdaArn')
  final String lambdaArn;

  /// The Lambda version represents the signature of the "request" attribute in
  /// the "event" information Amazon Cognito passes to your custom email Lambda
  /// function. The only supported value is <code>V1_0</code>.
  @_s.JsonKey(name: 'LambdaVersion')
  final CustomEmailSenderLambdaVersionType lambdaVersion;

  CustomEmailLambdaVersionConfigType({
    @_s.required this.lambdaArn,
    @_s.required this.lambdaVersion,
  });
  factory CustomEmailLambdaVersionConfigType.fromJson(
          Map<String, dynamic> json) =>
      _$CustomEmailLambdaVersionConfigTypeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomEmailLambdaVersionConfigTypeToJson(this);
}

enum CustomEmailSenderLambdaVersionType {
  @_s.JsonValue('V1_0')
  v1_0,
}

/// A custom SMS sender Lambda configuration type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomSMSLambdaVersionConfigType {
  /// The Lambda Amazon Resource Name of the Lambda function that Amazon Cognito
  /// triggers to send SMS notifications to users.
  @_s.JsonKey(name: 'LambdaArn')
  final String lambdaArn;

  /// The Lambda version represents the signature of the "request" attribute in
  /// the "event" information Amazon Cognito passes to your custom SMS Lambda
  /// function. The only supported value is <code>V1_0</code>.
  @_s.JsonKey(name: 'LambdaVersion')
  final CustomSMSSenderLambdaVersionType lambdaVersion;

  CustomSMSLambdaVersionConfigType({
    @_s.required this.lambdaArn,
    @_s.required this.lambdaVersion,
  });
  factory CustomSMSLambdaVersionConfigType.fromJson(
          Map<String, dynamic> json) =>
      _$CustomSMSLambdaVersionConfigTypeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomSMSLambdaVersionConfigTypeToJson(this);
}

enum CustomSMSSenderLambdaVersionType {
  @_s.JsonValue('V1_0')
  v1_0,
}

enum DefaultEmailOptionType {
  @_s.JsonValue('CONFIRM_WITH_LINK')
  confirmWithLink,
  @_s.JsonValue('CONFIRM_WITH_CODE')
  confirmWithCode,
}

/// Represents the response from the server to delete user attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserAttributesResponse {
  DeleteUserAttributesResponse();
  factory DeleteUserAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserAttributesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserPoolDomainResponse {
  DeleteUserPoolDomainResponse();
  factory DeleteUserPoolDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserPoolDomainResponseFromJson(json);
}

enum DeliveryMediumType {
  @_s.JsonValue('SMS')
  sms,
  @_s.JsonValue('EMAIL')
  email,
}

extension on DeliveryMediumType {
  String toValue() {
    switch (this) {
      case DeliveryMediumType.sms:
        return 'SMS';
      case DeliveryMediumType.email:
        return 'EMAIL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIdentityProviderResponse {
  /// The identity provider that was deleted.
  @_s.JsonKey(name: 'IdentityProvider')
  final IdentityProviderType identityProvider;

  DescribeIdentityProviderResponse({
    @_s.required this.identityProvider,
  });
  factory DescribeIdentityProviderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeIdentityProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeResourceServerResponse {
  /// The resource server.
  @_s.JsonKey(name: 'ResourceServer')
  final ResourceServerType resourceServer;

  DescribeResourceServerResponse({
    @_s.required this.resourceServer,
  });
  factory DescribeResourceServerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeResourceServerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRiskConfigurationResponse {
  /// The risk configuration.
  @_s.JsonKey(name: 'RiskConfiguration')
  final RiskConfigurationType riskConfiguration;

  DescribeRiskConfigurationResponse({
    @_s.required this.riskConfiguration,
  });
  factory DescribeRiskConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRiskConfigurationResponseFromJson(json);
}

/// Represents the response from the server to the request to describe the user
/// import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserImportJobResponse {
  /// The job object that represents the user import job.
  @_s.JsonKey(name: 'UserImportJob')
  final UserImportJobType userImportJob;

  DescribeUserImportJobResponse({
    this.userImportJob,
  });
  factory DescribeUserImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserImportJobResponseFromJson(json);
}

/// Represents the response from the server from a request to describe the user
/// pool client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserPoolClientResponse {
  /// The user pool client from a server response to describe the user pool
  /// client.
  @_s.JsonKey(name: 'UserPoolClient')
  final UserPoolClientType userPoolClient;

  DescribeUserPoolClientResponse({
    this.userPoolClient,
  });
  factory DescribeUserPoolClientResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserPoolClientResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserPoolDomainResponse {
  /// A domain description object containing information about the domain.
  @_s.JsonKey(name: 'DomainDescription')
  final DomainDescriptionType domainDescription;

  DescribeUserPoolDomainResponse({
    this.domainDescription,
  });
  factory DescribeUserPoolDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserPoolDomainResponseFromJson(json);
}

/// Represents the response to describe the user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserPoolResponse {
  /// The container of metadata returned by the server to describe the pool.
  @_s.JsonKey(name: 'UserPool')
  final UserPoolType userPool;

  DescribeUserPoolResponse({
    this.userPool,
  });
  factory DescribeUserPoolResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserPoolResponseFromJson(json);
}

/// The configuration for the user pool's device tracking.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeviceConfigurationType {
  /// Indicates whether a challenge is required on a new device. Only applicable
  /// to a new device.
  @_s.JsonKey(name: 'ChallengeRequiredOnNewDevice')
  final bool challengeRequiredOnNewDevice;

  /// If true, a device is only remembered on user prompt.
  @_s.JsonKey(name: 'DeviceOnlyRememberedOnUserPrompt')
  final bool deviceOnlyRememberedOnUserPrompt;

  DeviceConfigurationType({
    this.challengeRequiredOnNewDevice,
    this.deviceOnlyRememberedOnUserPrompt,
  });
  factory DeviceConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$DeviceConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceConfigurationTypeToJson(this);
}

enum DeviceRememberedStatusType {
  @_s.JsonValue('remembered')
  remembered,
  @_s.JsonValue('not_remembered')
  notRemembered,
}

extension on DeviceRememberedStatusType {
  String toValue() {
    switch (this) {
      case DeviceRememberedStatusType.remembered:
        return 'remembered';
      case DeviceRememberedStatusType.notRemembered:
        return 'not_remembered';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The device verifier against which it will be authenticated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeviceSecretVerifierConfigType {
  /// The password verifier.
  @_s.JsonKey(name: 'PasswordVerifier')
  final String passwordVerifier;

  /// The salt.
  @_s.JsonKey(name: 'Salt')
  final String salt;

  DeviceSecretVerifierConfigType({
    this.passwordVerifier,
    this.salt,
  });
  Map<String, dynamic> toJson() => _$DeviceSecretVerifierConfigTypeToJson(this);
}

/// The device type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceType {
  /// The device attributes.
  @_s.JsonKey(name: 'DeviceAttributes')
  final List<AttributeType> deviceAttributes;

  /// The creation date of the device.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeviceCreateDate')
  final DateTime deviceCreateDate;

  /// The device key.
  @_s.JsonKey(name: 'DeviceKey')
  final String deviceKey;

  /// The date in which the device was last authenticated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeviceLastAuthenticatedDate')
  final DateTime deviceLastAuthenticatedDate;

  /// The last modified date of the device.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeviceLastModifiedDate')
  final DateTime deviceLastModifiedDate;

  DeviceType({
    this.deviceAttributes,
    this.deviceCreateDate,
    this.deviceKey,
    this.deviceLastAuthenticatedDate,
    this.deviceLastModifiedDate,
  });
  factory DeviceType.fromJson(Map<String, dynamic> json) =>
      _$DeviceTypeFromJson(json);
}

/// A container for information about a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainDescriptionType {
  /// The AWS account ID for the user pool owner.
  @_s.JsonKey(name: 'AWSAccountId')
  final String awsAccountId;

  /// The ARN of the CloudFront distribution.
  @_s.JsonKey(name: 'CloudFrontDistribution')
  final String cloudFrontDistribution;

  /// The configuration for a custom domain that hosts the sign-up and sign-in
  /// webpages for your application.
  @_s.JsonKey(name: 'CustomDomainConfig')
  final CustomDomainConfigType customDomainConfig;

  /// The domain string.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The S3 bucket where the static files for this domain are stored.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The domain status.
  @_s.JsonKey(name: 'Status')
  final DomainStatusType status;

  /// The user pool ID.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  /// The app version.
  @_s.JsonKey(name: 'Version')
  final String version;

  DomainDescriptionType({
    this.awsAccountId,
    this.cloudFrontDistribution,
    this.customDomainConfig,
    this.domain,
    this.s3Bucket,
    this.status,
    this.userPoolId,
    this.version,
  });
  factory DomainDescriptionType.fromJson(Map<String, dynamic> json) =>
      _$DomainDescriptionTypeFromJson(json);
}

enum DomainStatusType {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('FAILED')
  failed,
}

/// The email configuration type.
/// <note>
/// Amazon Cognito has specific regions for use with Amazon SES. For more
/// information on the supported regions, see <a
/// href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-email.html">Email
/// Settings for Amazon Cognito User Pools</a>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmailConfigurationType {
  /// The set of configuration rules that can be applied to emails sent using
  /// Amazon SES. A configuration set is applied to an email by including a
  /// reference to the configuration set in the headers of the email. Once
  /// applied, all of the rules in that configuration set are applied to the
  /// email. Configuration sets can be used to apply the following types of rules
  /// to emails:
  ///
  /// <ul>
  /// <li>
  /// Event publishing – Amazon SES can track the number of send, delivery, open,
  /// click, bounce, and complaint events for each email sent. Use event
  /// publishing to send information about these events to other AWS services such
  /// as SNS and CloudWatch.
  /// </li>
  /// <li>
  /// IP pool management – When leasing dedicated IP addresses with Amazon SES,
  /// you can create groups of IP addresses, called dedicated IP pools. You can
  /// then associate the dedicated IP pools with configuration sets.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ConfigurationSet')
  final String configurationSet;

  /// Specifies whether Amazon Cognito emails your users by using its built-in
  /// email functionality or your Amazon SES email configuration. Specify one of
  /// the following values:
  /// <dl> <dt>COGNITO_DEFAULT</dt> <dd>
  /// When Amazon Cognito emails your users, it uses its built-in email
  /// functionality. When you use the default option, Amazon Cognito allows only a
  /// limited number of emails each day for your user pool. For typical production
  /// environments, the default email limit is below the required delivery volume.
  /// To achieve a higher delivery volume, specify DEVELOPER to use your Amazon
  /// SES email configuration.
  ///
  /// To look up the email delivery limit for the default option, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/limits.html">Limits
  /// in Amazon Cognito</a> in the <i>Amazon Cognito Developer Guide</i>.
  ///
  /// The default FROM address is no-reply@verificationemail.com. To customize the
  /// FROM address, provide the ARN of an Amazon SES verified email address for
  /// the <code>SourceArn</code> parameter.
  ///
  /// If EmailSendingAccount is COGNITO_DEFAULT, the following parameters aren't
  /// allowed:
  ///
  /// <ul>
  /// <li>
  /// EmailVerificationMessage
  /// </li>
  /// <li>
  /// EmailVerificationSubject
  /// </li>
  /// <li>
  /// InviteMessageTemplate.EmailMessage
  /// </li>
  /// <li>
  /// InviteMessageTemplate.EmailSubject
  /// </li>
  /// <li>
  /// VerificationMessageTemplate.EmailMessage
  /// </li>
  /// <li>
  /// VerificationMessageTemplate.EmailMessageByLink
  /// </li>
  /// <li>
  /// VerificationMessageTemplate.EmailSubject,
  /// </li>
  /// <li>
  /// VerificationMessageTemplate.EmailSubjectByLink
  /// </li>
  /// </ul> <note>
  /// DEVELOPER EmailSendingAccount is required.
  /// </note> </dd> <dt>DEVELOPER</dt> <dd>
  /// When Amazon Cognito emails your users, it uses your Amazon SES
  /// configuration. Amazon Cognito calls Amazon SES on your behalf to send email
  /// from your verified email address. When you use this option, the email
  /// delivery limits are the same limits that apply to your Amazon SES verified
  /// email address in your AWS account.
  ///
  /// If you use this option, you must provide the ARN of an Amazon SES verified
  /// email address for the <code>SourceArn</code> parameter.
  ///
  /// Before Amazon Cognito can email your users, it requires additional
  /// permissions to call Amazon SES on your behalf. When you update your user
  /// pool with this option, Amazon Cognito creates a <i>service-linked role</i>,
  /// which is a type of IAM role, in your AWS account. This role contains the
  /// permissions that allow Amazon Cognito to access Amazon SES and send email
  /// messages with your address. For more information about the service-linked
  /// role that Amazon Cognito creates, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/using-service-linked-roles.html">Using
  /// Service-Linked Roles for Amazon Cognito</a> in the <i>Amazon Cognito
  /// Developer Guide</i>.
  /// </dd> </dl>
  @_s.JsonKey(name: 'EmailSendingAccount')
  final EmailSendingAccountType emailSendingAccount;

  /// Identifies either the sender’s email address or the sender’s name with their
  /// email address. For example, <code>testuser@example.com</code> or <code>Test
  /// User &lt;testuser@example.com&gt;</code>. This address will appear before
  /// the body of the email.
  @_s.JsonKey(name: 'From')
  final String from;

  /// The destination to which the receiver of the email should reply to.
  @_s.JsonKey(name: 'ReplyToEmailAddress')
  final String replyToEmailAddress;

  /// The Amazon Resource Name (ARN) of a verified email address in Amazon SES.
  /// This email address is used in one of the following ways, depending on the
  /// value that you specify for the <code>EmailSendingAccount</code> parameter:
  ///
  /// <ul>
  /// <li>
  /// If you specify <code>COGNITO_DEFAULT</code>, Amazon Cognito uses this
  /// address as the custom FROM address when it emails your users by using its
  /// built-in email account.
  /// </li>
  /// <li>
  /// If you specify <code>DEVELOPER</code>, Amazon Cognito emails your users with
  /// this address by calling Amazon SES on your behalf.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  EmailConfigurationType({
    this.configurationSet,
    this.emailSendingAccount,
    this.from,
    this.replyToEmailAddress,
    this.sourceArn,
  });
  factory EmailConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$EmailConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$EmailConfigurationTypeToJson(this);
}

enum EmailSendingAccountType {
  @_s.JsonValue('COGNITO_DEFAULT')
  cognitoDefault,
  @_s.JsonValue('DEVELOPER')
  developer,
}

/// Specifies the user context data captured at the time of an event request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventContextDataType {
  /// The user's city.
  @_s.JsonKey(name: 'City')
  final String city;

  /// The user's country.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// The user's device name.
  @_s.JsonKey(name: 'DeviceName')
  final String deviceName;

  /// The user's IP address.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// The user's time zone.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  EventContextDataType({
    this.city,
    this.country,
    this.deviceName,
    this.ipAddress,
    this.timezone,
  });
  factory EventContextDataType.fromJson(Map<String, dynamic> json) =>
      _$EventContextDataTypeFromJson(json);
}

/// Specifies the event feedback type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventFeedbackType {
  /// The event feedback value.
  @_s.JsonKey(name: 'FeedbackValue')
  final FeedbackValueType feedbackValue;

  /// The provider.
  @_s.JsonKey(name: 'Provider')
  final String provider;

  /// The event feedback date.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FeedbackDate')
  final DateTime feedbackDate;

  EventFeedbackType({
    @_s.required this.feedbackValue,
    @_s.required this.provider,
    this.feedbackDate,
  });
  factory EventFeedbackType.fromJson(Map<String, dynamic> json) =>
      _$EventFeedbackTypeFromJson(json);
}

enum EventFilterType {
  @_s.JsonValue('SIGN_IN')
  signIn,
  @_s.JsonValue('PASSWORD_CHANGE')
  passwordChange,
  @_s.JsonValue('SIGN_UP')
  signUp,
}

enum EventResponseType {
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failure')
  failure,
}

/// The event risk type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventRiskType {
  /// Indicates whether compromised credentials were detected during an
  /// authentication event.
  @_s.JsonKey(name: 'CompromisedCredentialsDetected')
  final bool compromisedCredentialsDetected;

  /// The risk decision.
  @_s.JsonKey(name: 'RiskDecision')
  final RiskDecisionType riskDecision;

  /// The risk level.
  @_s.JsonKey(name: 'RiskLevel')
  final RiskLevelType riskLevel;

  EventRiskType({
    this.compromisedCredentialsDetected,
    this.riskDecision,
    this.riskLevel,
  });
  factory EventRiskType.fromJson(Map<String, dynamic> json) =>
      _$EventRiskTypeFromJson(json);
}

enum EventType {
  @_s.JsonValue('SignIn')
  signIn,
  @_s.JsonValue('SignUp')
  signUp,
  @_s.JsonValue('ForgotPassword')
  forgotPassword,
}

enum ExplicitAuthFlowsType {
  @_s.JsonValue('ADMIN_NO_SRP_AUTH')
  adminNoSrpAuth,
  @_s.JsonValue('CUSTOM_AUTH_FLOW_ONLY')
  customAuthFlowOnly,
  @_s.JsonValue('USER_PASSWORD_AUTH')
  userPasswordAuth,
  @_s.JsonValue('ALLOW_ADMIN_USER_PASSWORD_AUTH')
  allowAdminUserPasswordAuth,
  @_s.JsonValue('ALLOW_CUSTOM_AUTH')
  allowCustomAuth,
  @_s.JsonValue('ALLOW_USER_PASSWORD_AUTH')
  allowUserPasswordAuth,
  @_s.JsonValue('ALLOW_USER_SRP_AUTH')
  allowUserSrpAuth,
  @_s.JsonValue('ALLOW_REFRESH_TOKEN_AUTH')
  allowRefreshTokenAuth,
}

extension on ExplicitAuthFlowsType {
  String toValue() {
    switch (this) {
      case ExplicitAuthFlowsType.adminNoSrpAuth:
        return 'ADMIN_NO_SRP_AUTH';
      case ExplicitAuthFlowsType.customAuthFlowOnly:
        return 'CUSTOM_AUTH_FLOW_ONLY';
      case ExplicitAuthFlowsType.userPasswordAuth:
        return 'USER_PASSWORD_AUTH';
      case ExplicitAuthFlowsType.allowAdminUserPasswordAuth:
        return 'ALLOW_ADMIN_USER_PASSWORD_AUTH';
      case ExplicitAuthFlowsType.allowCustomAuth:
        return 'ALLOW_CUSTOM_AUTH';
      case ExplicitAuthFlowsType.allowUserPasswordAuth:
        return 'ALLOW_USER_PASSWORD_AUTH';
      case ExplicitAuthFlowsType.allowUserSrpAuth:
        return 'ALLOW_USER_SRP_AUTH';
      case ExplicitAuthFlowsType.allowRefreshTokenAuth:
        return 'ALLOW_REFRESH_TOKEN_AUTH';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum FeedbackValueType {
  @_s.JsonValue('Valid')
  valid,
  @_s.JsonValue('Invalid')
  invalid,
}

extension on FeedbackValueType {
  String toValue() {
    switch (this) {
      case FeedbackValueType.valid:
        return 'Valid';
      case FeedbackValueType.invalid:
        return 'Invalid';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Respresents the response from the server regarding the request to reset a
/// password.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ForgotPasswordResponse {
  /// The code delivery details returned by the server in response to the request
  /// to reset a password.
  @_s.JsonKey(name: 'CodeDeliveryDetails')
  final CodeDeliveryDetailsType codeDeliveryDetails;

  ForgotPasswordResponse({
    this.codeDeliveryDetails,
  });
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

/// Represents the response from the server to the request to get the header
/// information for the .csv file for the user import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCSVHeaderResponse {
  /// The header information for the .csv file for the user import job.
  @_s.JsonKey(name: 'CSVHeader')
  final List<String> cSVHeader;

  /// The user pool ID for the user pool that the users are to be imported into.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  GetCSVHeaderResponse({
    this.cSVHeader,
    this.userPoolId,
  });
  factory GetCSVHeaderResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCSVHeaderResponseFromJson(json);
}

/// Gets the device response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceResponse {
  /// The device.
  @_s.JsonKey(name: 'Device')
  final DeviceType device;

  GetDeviceResponse({
    @_s.required this.device,
  });
  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupResponse {
  /// The group object for the group.
  @_s.JsonKey(name: 'Group')
  final GroupType group;

  GetGroupResponse({
    this.group,
  });
  factory GetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIdentityProviderByIdentifierResponse {
  /// The identity provider object.
  @_s.JsonKey(name: 'IdentityProvider')
  final IdentityProviderType identityProvider;

  GetIdentityProviderByIdentifierResponse({
    @_s.required this.identityProvider,
  });
  factory GetIdentityProviderByIdentifierResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetIdentityProviderByIdentifierResponseFromJson(json);
}

/// Response from Cognito for a signing certificate request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSigningCertificateResponse {
  /// The signing certificate.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  GetSigningCertificateResponse({
    this.certificate,
  });
  factory GetSigningCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSigningCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUICustomizationResponse {
  /// The UI customization information.
  @_s.JsonKey(name: 'UICustomization')
  final UICustomizationType uICustomization;

  GetUICustomizationResponse({
    @_s.required this.uICustomization,
  });
  factory GetUICustomizationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUICustomizationResponseFromJson(json);
}

/// The verification code response returned by the server response to get the
/// user attribute verification code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserAttributeVerificationCodeResponse {
  /// The code delivery details returned by the server in response to the request
  /// to get the user attribute verification code.
  @_s.JsonKey(name: 'CodeDeliveryDetails')
  final CodeDeliveryDetailsType codeDeliveryDetails;

  GetUserAttributeVerificationCodeResponse({
    this.codeDeliveryDetails,
  });
  factory GetUserAttributeVerificationCodeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserAttributeVerificationCodeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserPoolMfaConfigResponse {
  /// The multi-factor (MFA) configuration. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>OFF</code> MFA will not be used for any users.
  /// </li>
  /// <li>
  /// <code>ON</code> MFA is required for all users to sign in.
  /// </li>
  /// <li>
  /// <code>OPTIONAL</code> MFA will be required only for individual users who
  /// have an MFA factor enabled.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MfaConfiguration')
  final UserPoolMfaType mfaConfiguration;

  /// The SMS text message multi-factor (MFA) configuration.
  @_s.JsonKey(name: 'SmsMfaConfiguration')
  final SmsMfaConfigType smsMfaConfiguration;

  /// The software token multi-factor (MFA) configuration.
  @_s.JsonKey(name: 'SoftwareTokenMfaConfiguration')
  final SoftwareTokenMfaConfigType softwareTokenMfaConfiguration;

  GetUserPoolMfaConfigResponse({
    this.mfaConfiguration,
    this.smsMfaConfiguration,
    this.softwareTokenMfaConfiguration,
  });
  factory GetUserPoolMfaConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserPoolMfaConfigResponseFromJson(json);
}

/// Represents the response from the server from the request to get information
/// about the user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserResponse {
  /// An array of name-value pairs representing user attributes.
  ///
  /// For custom attributes, you must prepend the <code>custom:</code> prefix to
  /// the attribute name.
  @_s.JsonKey(name: 'UserAttributes')
  final List<AttributeType> userAttributes;

  /// The user name of the user you wish to retrieve from the get user request.
  @_s.JsonKey(name: 'Username')
  final String username;

  /// <i>This response parameter is no longer supported.</i> It provides
  /// information only about SMS MFA configurations. It doesn't provide
  /// information about TOTP software token MFA configurations. To look up
  /// information about either type of MFA configuration, use UserMFASettingList
  /// instead.
  @_s.JsonKey(name: 'MFAOptions')
  final List<MFAOptionType> mFAOptions;

  /// The user's preferred MFA setting.
  @_s.JsonKey(name: 'PreferredMfaSetting')
  final String preferredMfaSetting;

  /// The MFA options that are enabled for the user. The possible values in this
  /// list are <code>SMS_MFA</code> and <code>SOFTWARE_TOKEN_MFA</code>.
  @_s.JsonKey(name: 'UserMFASettingList')
  final List<String> userMFASettingList;

  GetUserResponse({
    @_s.required this.userAttributes,
    @_s.required this.username,
    this.mFAOptions,
    this.preferredMfaSetting,
    this.userMFASettingList,
  });
  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}

/// The response to the request to sign out all devices.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GlobalSignOutResponse {
  GlobalSignOutResponse();
  factory GlobalSignOutResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalSignOutResponseFromJson(json);
}

/// The group type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupType {
  /// The date the group was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// A string containing the description of the group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The date the group was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// A nonnegative integer value that specifies the precedence of this group
  /// relative to the other groups that a user can belong to in the user pool. If
  /// a user belongs to two or more groups, it is the group with the highest
  /// precedence whose role ARN will be used in the <code>cognito:roles</code> and
  /// <code>cognito:preferred_role</code> claims in the user's tokens. Groups with
  /// higher <code>Precedence</code> values take precedence over groups with lower
  /// <code>Precedence</code> values or with null <code>Precedence</code> values.
  ///
  /// Two groups can have the same <code>Precedence</code> value. If this happens,
  /// neither group takes precedence over the other. If two groups with the same
  /// <code>Precedence</code> have the same role ARN, that role is used in the
  /// <code>cognito:preferred_role</code> claim in tokens for users in each group.
  /// If the two groups have different role ARNs, the
  /// <code>cognito:preferred_role</code> claim is not set in users' tokens.
  ///
  /// The default <code>Precedence</code> value is null.
  @_s.JsonKey(name: 'Precedence')
  final int precedence;

  /// The role ARN for the group.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The user pool ID for the user pool.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  GroupType({
    this.creationDate,
    this.description,
    this.groupName,
    this.lastModifiedDate,
    this.precedence,
    this.roleArn,
    this.userPoolId,
  });
  factory GroupType.fromJson(Map<String, dynamic> json) =>
      _$GroupTypeFromJson(json);
}

/// The HTTP header.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpHeader {
  /// The header name
  @_s.JsonKey(name: 'headerName')
  final String headerName;

  /// The header value.
  @_s.JsonKey(name: 'headerValue')
  final String headerValue;

  HttpHeader({
    this.headerName,
    this.headerValue,
  });
  Map<String, dynamic> toJson() => _$HttpHeaderToJson(this);
}

/// A container for information about an identity provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdentityProviderType {
  /// A mapping of identity provider attributes to standard and custom user pool
  /// attributes.
  @_s.JsonKey(name: 'AttributeMapping')
  final Map<String, String> attributeMapping;

  /// The date the identity provider was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// A list of identity provider identifiers.
  @_s.JsonKey(name: 'IdpIdentifiers')
  final List<String> idpIdentifiers;

  /// The date the identity provider was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The identity provider details. The following list describes the provider
  /// detail keys for each identity provider type.
  ///
  /// <ul>
  /// <li>
  /// For Google and Login with Amazon:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// client_secret
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Facebook:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// client_secret
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// <li>
  /// api_version
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Sign in with Apple:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// team_id
  /// </li>
  /// <li>
  /// key_id
  /// </li>
  /// <li>
  /// private_key
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For OIDC providers:
  ///
  /// <ul>
  /// <li>
  /// client_id
  /// </li>
  /// <li>
  /// client_secret
  /// </li>
  /// <li>
  /// attributes_request_method
  /// </li>
  /// <li>
  /// oidc_issuer
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// <li>
  /// authorize_url <i>if not available from discovery URL specified by
  /// oidc_issuer key</i>
  /// </li>
  /// <li>
  /// token_url <i>if not available from discovery URL specified by oidc_issuer
  /// key</i>
  /// </li>
  /// <li>
  /// attributes_url <i>if not available from discovery URL specified by
  /// oidc_issuer key</i>
  /// </li>
  /// <li>
  /// jwks_uri <i>if not available from discovery URL specified by oidc_issuer
  /// key</i>
  /// </li>
  /// <li>
  /// authorize_scopes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For SAML providers:
  ///
  /// <ul>
  /// <li>
  /// MetadataFile OR MetadataURL
  /// </li>
  /// <li>
  /// IDPSignOut <i>optional</i>
  /// </li>
  /// </ul> </li>
  /// </ul>
  @_s.JsonKey(name: 'ProviderDetails')
  final Map<String, String> providerDetails;

  /// The identity provider name.
  @_s.JsonKey(name: 'ProviderName')
  final String providerName;

  /// The identity provider type.
  @_s.JsonKey(name: 'ProviderType')
  final IdentityProviderTypeType providerType;

  /// The user pool ID.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  IdentityProviderType({
    this.attributeMapping,
    this.creationDate,
    this.idpIdentifiers,
    this.lastModifiedDate,
    this.providerDetails,
    this.providerName,
    this.providerType,
    this.userPoolId,
  });
  factory IdentityProviderType.fromJson(Map<String, dynamic> json) =>
      _$IdentityProviderTypeFromJson(json);
}

enum IdentityProviderTypeType {
  @_s.JsonValue('SAML')
  saml,
  @_s.JsonValue('Facebook')
  facebook,
  @_s.JsonValue('Google')
  google,
  @_s.JsonValue('LoginWithAmazon')
  loginWithAmazon,
  @_s.JsonValue('SignInWithApple')
  signInWithApple,
  @_s.JsonValue('OIDC')
  oidc,
}

extension on IdentityProviderTypeType {
  String toValue() {
    switch (this) {
      case IdentityProviderTypeType.saml:
        return 'SAML';
      case IdentityProviderTypeType.facebook:
        return 'Facebook';
      case IdentityProviderTypeType.google:
        return 'Google';
      case IdentityProviderTypeType.loginWithAmazon:
        return 'LoginWithAmazon';
      case IdentityProviderTypeType.signInWithApple:
        return 'SignInWithApple';
      case IdentityProviderTypeType.oidc:
        return 'OIDC';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Initiates the authentication response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InitiateAuthResponse {
  /// The result of the authentication response. This is only returned if the
  /// caller does not need to pass another challenge. If the caller does need to
  /// pass another challenge before it gets tokens, <code>ChallengeName</code>,
  /// <code>ChallengeParameters</code>, and <code>Session</code> are returned.
  @_s.JsonKey(name: 'AuthenticationResult')
  final AuthenticationResultType authenticationResult;

  /// The name of the challenge which you are responding to with this call. This
  /// is returned to you in the <code>AdminInitiateAuth</code> response if you
  /// need to pass another challenge.
  ///
  /// Valid values include the following. Note that all of these challenges
  /// require <code>USERNAME</code> and <code>SECRET_HASH</code> (if applicable)
  /// in the parameters.
  ///
  /// <ul>
  /// <li>
  /// <code>SMS_MFA</code>: Next challenge is to supply an
  /// <code>SMS_MFA_CODE</code>, delivered via SMS.
  /// </li>
  /// <li>
  /// <code>PASSWORD_VERIFIER</code>: Next challenge is to supply
  /// <code>PASSWORD_CLAIM_SIGNATURE</code>,
  /// <code>PASSWORD_CLAIM_SECRET_BLOCK</code>, and <code>TIMESTAMP</code> after
  /// the client-side SRP calculations.
  /// </li>
  /// <li>
  /// <code>CUSTOM_CHALLENGE</code>: This is returned if your custom
  /// authentication flow determines that the user should pass another challenge
  /// before tokens are issued.
  /// </li>
  /// <li>
  /// <code>DEVICE_SRP_AUTH</code>: If device tracking was enabled on your user
  /// pool and the previous challenges were passed, this challenge is returned so
  /// that Amazon Cognito can start tracking this device.
  /// </li>
  /// <li>
  /// <code>DEVICE_PASSWORD_VERIFIER</code>: Similar to
  /// <code>PASSWORD_VERIFIER</code>, but for devices only.
  /// </li>
  /// <li>
  /// <code>NEW_PASSWORD_REQUIRED</code>: For users which are required to change
  /// their passwords after successful first login. This challenge should be
  /// passed with <code>NEW_PASSWORD</code> and any other required attributes.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ChallengeName')
  final ChallengeNameType challengeName;

  /// The challenge parameters. These are returned to you in the
  /// <code>InitiateAuth</code> response if you need to pass another challenge.
  /// The responses in this parameter should be used to compute inputs to the next
  /// call (<code>RespondToAuthChallenge</code>).
  ///
  /// All challenges require <code>USERNAME</code> and <code>SECRET_HASH</code>
  /// (if applicable).
  @_s.JsonKey(name: 'ChallengeParameters')
  final Map<String, String> challengeParameters;

  /// The session which should be passed both ways in challenge-response calls to
  /// the service. If the caller needs to go through another challenge, they
  /// return a session with other challenge parameters. This session should be
  /// passed as it is to the next <code>RespondToAuthChallenge</code> API call.
  @_s.JsonKey(name: 'Session')
  final String session;

  InitiateAuthResponse({
    this.authenticationResult,
    this.challengeName,
    this.challengeParameters,
    this.session,
  });
  factory InitiateAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$InitiateAuthResponseFromJson(json);
}

/// Specifies the configuration for AWS Lambda triggers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LambdaConfigType {
  /// Creates an authentication challenge.
  @_s.JsonKey(name: 'CreateAuthChallenge')
  final String createAuthChallenge;

  /// A custom email sender AWS Lambda trigger.
  @_s.JsonKey(name: 'CustomEmailSender')
  final CustomEmailLambdaVersionConfigType customEmailSender;

  /// A custom Message AWS Lambda trigger.
  @_s.JsonKey(name: 'CustomMessage')
  final String customMessage;

  /// A custom SMS sender AWS Lambda trigger.
  @_s.JsonKey(name: 'CustomSMSSender')
  final CustomSMSLambdaVersionConfigType customSMSSender;

  /// Defines the authentication challenge.
  @_s.JsonKey(name: 'DefineAuthChallenge')
  final String defineAuthChallenge;

  /// The Amazon Resource Name of Key Management Service <a
  /// href="/kms/latest/developerguide/concepts.html#master_keys">Customer master
  /// keys</a> . Amazon Cognito uses the key to encrypt codes and temporary
  /// passwords sent to <code>CustomEmailSender</code> and
  /// <code>CustomSMSSender</code>.
  @_s.JsonKey(name: 'KMSKeyID')
  final String kMSKeyID;

  /// A post-authentication AWS Lambda trigger.
  @_s.JsonKey(name: 'PostAuthentication')
  final String postAuthentication;

  /// A post-confirmation AWS Lambda trigger.
  @_s.JsonKey(name: 'PostConfirmation')
  final String postConfirmation;

  /// A pre-authentication AWS Lambda trigger.
  @_s.JsonKey(name: 'PreAuthentication')
  final String preAuthentication;

  /// A pre-registration AWS Lambda trigger.
  @_s.JsonKey(name: 'PreSignUp')
  final String preSignUp;

  /// A Lambda trigger that is invoked before token generation.
  @_s.JsonKey(name: 'PreTokenGeneration')
  final String preTokenGeneration;

  /// The user migration Lambda config type.
  @_s.JsonKey(name: 'UserMigration')
  final String userMigration;

  /// Verifies the authentication challenge response.
  @_s.JsonKey(name: 'VerifyAuthChallengeResponse')
  final String verifyAuthChallengeResponse;

  LambdaConfigType({
    this.createAuthChallenge,
    this.customEmailSender,
    this.customMessage,
    this.customSMSSender,
    this.defineAuthChallenge,
    this.kMSKeyID,
    this.postAuthentication,
    this.postConfirmation,
    this.preAuthentication,
    this.preSignUp,
    this.preTokenGeneration,
    this.userMigration,
    this.verifyAuthChallengeResponse,
  });
  factory LambdaConfigType.fromJson(Map<String, dynamic> json) =>
      _$LambdaConfigTypeFromJson(json);

  Map<String, dynamic> toJson() => _$LambdaConfigTypeToJson(this);
}

/// Represents the response to list devices.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDevicesResponse {
  /// The devices returned in the list devices response.
  @_s.JsonKey(name: 'Devices')
  final List<DeviceType> devices;

  /// The pagination token for the list device response.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  ListDevicesResponse({
    this.devices,
    this.paginationToken,
  });
  factory ListDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDevicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGroupsResponse {
  /// The group objects for the groups.
  @_s.JsonKey(name: 'Groups')
  final List<GroupType> groups;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });
  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIdentityProvidersResponse {
  /// A list of identity provider objects.
  @_s.JsonKey(name: 'Providers')
  final List<ProviderDescription> providers;

  /// A pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIdentityProvidersResponse({
    @_s.required this.providers,
    this.nextToken,
  });
  factory ListIdentityProvidersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIdentityProvidersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceServersResponse {
  /// The resource servers.
  @_s.JsonKey(name: 'ResourceServers')
  final List<ResourceServerType> resourceServers;

  /// A pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListResourceServersResponse({
    @_s.required this.resourceServers,
    this.nextToken,
  });
  factory ListResourceServersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourceServersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags that are assigned to the user pool.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Represents the response from the server to the request to list the user
/// import jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserImportJobsResponse {
  /// An identifier that can be used to return the next set of user import jobs in
  /// the list.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  /// The user import jobs.
  @_s.JsonKey(name: 'UserImportJobs')
  final List<UserImportJobType> userImportJobs;

  ListUserImportJobsResponse({
    this.paginationToken,
    this.userImportJobs,
  });
  factory ListUserImportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserImportJobsResponseFromJson(json);
}

/// Represents the response from the server that lists user pool clients.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserPoolClientsResponse {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The user pool clients in the response that lists user pool clients.
  @_s.JsonKey(name: 'UserPoolClients')
  final List<UserPoolClientDescription> userPoolClients;

  ListUserPoolClientsResponse({
    this.nextToken,
    this.userPoolClients,
  });
  factory ListUserPoolClientsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserPoolClientsResponseFromJson(json);
}

/// Represents the response to list user pools.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserPoolsResponse {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The user pools from the response to list users.
  @_s.JsonKey(name: 'UserPools')
  final List<UserPoolDescriptionType> userPools;

  ListUserPoolsResponse({
    this.nextToken,
    this.userPools,
  });
  factory ListUserPoolsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserPoolsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersInGroupResponse {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The users returned in the request to list users.
  @_s.JsonKey(name: 'Users')
  final List<UserType> users;

  ListUsersInGroupResponse({
    this.nextToken,
    this.users,
  });
  factory ListUsersInGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersInGroupResponseFromJson(json);
}

/// The response from the request to list users.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  /// The users returned in the request to list users.
  @_s.JsonKey(name: 'Users')
  final List<UserType> users;

  ListUsersResponse({
    this.paginationToken,
    this.users,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

/// <i>This data type is no longer supported.</i> You can use it only for SMS
/// MFA configurations. You can't use it for TOTP software token MFA
/// configurations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MFAOptionType {
  /// The attribute name of the MFA option type. The only valid value is
  /// <code>phone_number</code>.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The delivery medium to send the MFA code. You can use this parameter to set
  /// only the <code>SMS</code> delivery medium value.
  @_s.JsonKey(name: 'DeliveryMedium')
  final DeliveryMediumType deliveryMedium;

  MFAOptionType({
    this.attributeName,
    this.deliveryMedium,
  });
  factory MFAOptionType.fromJson(Map<String, dynamic> json) =>
      _$MFAOptionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$MFAOptionTypeToJson(this);
}

enum MessageActionType {
  @_s.JsonValue('RESEND')
  resend,
  @_s.JsonValue('SUPPRESS')
  suppress,
}

extension on MessageActionType {
  String toValue() {
    switch (this) {
      case MessageActionType.resend:
        return 'RESEND';
      case MessageActionType.suppress:
        return 'SUPPRESS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The message template structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MessageTemplateType {
  /// The message template for email messages. EmailMessage is allowed only if <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a>
  /// is DEVELOPER.
  @_s.JsonKey(name: 'EmailMessage')
  final String emailMessage;

  /// The subject line for email messages. EmailSubject is allowed only if <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a>
  /// is DEVELOPER.
  @_s.JsonKey(name: 'EmailSubject')
  final String emailSubject;

  /// The message template for SMS messages.
  @_s.JsonKey(name: 'SMSMessage')
  final String sMSMessage;

  MessageTemplateType({
    this.emailMessage,
    this.emailSubject,
    this.sMSMessage,
  });
  factory MessageTemplateType.fromJson(Map<String, dynamic> json) =>
      _$MessageTemplateTypeFromJson(json);

  Map<String, dynamic> toJson() => _$MessageTemplateTypeToJson(this);
}

/// The new device metadata type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NewDeviceMetadataType {
  /// The device group key.
  @_s.JsonKey(name: 'DeviceGroupKey')
  final String deviceGroupKey;

  /// The device key.
  @_s.JsonKey(name: 'DeviceKey')
  final String deviceKey;

  NewDeviceMetadataType({
    this.deviceGroupKey,
    this.deviceKey,
  });
  factory NewDeviceMetadataType.fromJson(Map<String, dynamic> json) =>
      _$NewDeviceMetadataTypeFromJson(json);
}

/// The notify configuration type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotifyConfigurationType {
  /// The Amazon Resource Name (ARN) of the identity that is associated with the
  /// sending authorization policy. It permits Amazon Cognito to send for the
  /// email address specified in the <code>From</code> parameter.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// Email template used when a detected risk event is blocked.
  @_s.JsonKey(name: 'BlockEmail')
  final NotifyEmailType blockEmail;

  /// The email address that is sending the email. It must be either individually
  /// verified with Amazon SES, or from a domain that has been verified with
  /// Amazon SES.
  @_s.JsonKey(name: 'From')
  final String from;

  /// The MFA email template used when MFA is challenged as part of a detected
  /// risk.
  @_s.JsonKey(name: 'MfaEmail')
  final NotifyEmailType mfaEmail;

  /// The email template used when a detected risk event is allowed.
  @_s.JsonKey(name: 'NoActionEmail')
  final NotifyEmailType noActionEmail;

  /// The destination to which the receiver of an email should reply to.
  @_s.JsonKey(name: 'ReplyTo')
  final String replyTo;

  NotifyConfigurationType({
    @_s.required this.sourceArn,
    this.blockEmail,
    this.from,
    this.mfaEmail,
    this.noActionEmail,
    this.replyTo,
  });
  factory NotifyConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$NotifyConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyConfigurationTypeToJson(this);
}

/// The notify email type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotifyEmailType {
  /// The subject.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  /// The HTML body.
  @_s.JsonKey(name: 'HtmlBody')
  final String htmlBody;

  /// The text body.
  @_s.JsonKey(name: 'TextBody')
  final String textBody;

  NotifyEmailType({
    @_s.required this.subject,
    this.htmlBody,
    this.textBody,
  });
  factory NotifyEmailType.fromJson(Map<String, dynamic> json) =>
      _$NotifyEmailTypeFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyEmailTypeToJson(this);
}

/// The minimum and maximum value of an attribute that is of the number data
/// type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NumberAttributeConstraintsType {
  /// The maximum value of an attribute that is of the number data type.
  @_s.JsonKey(name: 'MaxValue')
  final String maxValue;

  /// The minimum value of an attribute that is of the number data type.
  @_s.JsonKey(name: 'MinValue')
  final String minValue;

  NumberAttributeConstraintsType({
    this.maxValue,
    this.minValue,
  });
  factory NumberAttributeConstraintsType.fromJson(Map<String, dynamic> json) =>
      _$NumberAttributeConstraintsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$NumberAttributeConstraintsTypeToJson(this);
}

enum OAuthFlowType {
  @_s.JsonValue('code')
  code,
  @_s.JsonValue('implicit')
  implicit,
  @_s.JsonValue('client_credentials')
  clientCredentials,
}

extension on OAuthFlowType {
  String toValue() {
    switch (this) {
      case OAuthFlowType.code:
        return 'code';
      case OAuthFlowType.implicit:
        return 'implicit';
      case OAuthFlowType.clientCredentials:
        return 'client_credentials';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The password policy type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PasswordPolicyType {
  /// The minimum length of the password policy that you have set. Cannot be less
  /// than 6.
  @_s.JsonKey(name: 'MinimumLength')
  final int minimumLength;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one lowercase letter in their password.
  @_s.JsonKey(name: 'RequireLowercase')
  final bool requireLowercase;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one number in their password.
  @_s.JsonKey(name: 'RequireNumbers')
  final bool requireNumbers;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one symbol in their password.
  @_s.JsonKey(name: 'RequireSymbols')
  final bool requireSymbols;

  /// In the password policy that you have set, refers to whether you have
  /// required users to use at least one uppercase letter in their password.
  @_s.JsonKey(name: 'RequireUppercase')
  final bool requireUppercase;

  /// In the password policy you have set, refers to the number of days a
  /// temporary password is valid. If the user does not sign-in during this time,
  /// their password will need to be reset by an administrator.
  /// <note>
  /// When you set <code>TemporaryPasswordValidityDays</code> for a user pool, you
  /// will no longer be able to set the deprecated
  /// <code>UnusedAccountValidityDays</code> value for that user pool.
  /// </note>
  @_s.JsonKey(name: 'TemporaryPasswordValidityDays')
  final int temporaryPasswordValidityDays;

  PasswordPolicyType({
    this.minimumLength,
    this.requireLowercase,
    this.requireNumbers,
    this.requireSymbols,
    this.requireUppercase,
    this.temporaryPasswordValidityDays,
  });
  factory PasswordPolicyType.fromJson(Map<String, dynamic> json) =>
      _$PasswordPolicyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordPolicyTypeToJson(this);
}

enum PreventUserExistenceErrorTypes {
  @_s.JsonValue('LEGACY')
  legacy,
  @_s.JsonValue('ENABLED')
  enabled,
}

extension on PreventUserExistenceErrorTypes {
  String toValue() {
    switch (this) {
      case PreventUserExistenceErrorTypes.legacy:
        return 'LEGACY';
      case PreventUserExistenceErrorTypes.enabled:
        return 'ENABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A container for identity provider details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProviderDescription {
  /// The date the provider was added to the user pool.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The date the provider was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The identity provider name.
  @_s.JsonKey(name: 'ProviderName')
  final String providerName;

  /// The identity provider type.
  @_s.JsonKey(name: 'ProviderType')
  final IdentityProviderTypeType providerType;

  ProviderDescription({
    this.creationDate,
    this.lastModifiedDate,
    this.providerName,
    this.providerType,
  });
  factory ProviderDescription.fromJson(Map<String, dynamic> json) =>
      _$ProviderDescriptionFromJson(json);
}

/// A container for information about an identity provider for a user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ProviderUserIdentifierType {
  /// The name of the provider attribute to link to, for example,
  /// <code>NameID</code>.
  @_s.JsonKey(name: 'ProviderAttributeName')
  final String providerAttributeName;

  /// The value of the provider attribute to link to, for example,
  /// <code>xxxxx_account</code>.
  @_s.JsonKey(name: 'ProviderAttributeValue')
  final String providerAttributeValue;

  /// The name of the provider, for example, Facebook, Google, or Login with
  /// Amazon.
  @_s.JsonKey(name: 'ProviderName')
  final String providerName;

  ProviderUserIdentifierType({
    this.providerAttributeName,
    this.providerAttributeValue,
    this.providerName,
  });
  Map<String, dynamic> toJson() => _$ProviderUserIdentifierTypeToJson(this);
}

enum RecoveryOptionNameType {
  @_s.JsonValue('verified_email')
  verifiedEmail,
  @_s.JsonValue('verified_phone_number')
  verifiedPhoneNumber,
  @_s.JsonValue('admin_only')
  adminOnly,
}

/// A map containing a priority as a key, and recovery method name as a value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecoveryOptionType {
  /// Specifies the recovery method for a user.
  @_s.JsonKey(name: 'Name')
  final RecoveryOptionNameType name;

  /// A positive integer specifying priority of a method with 1 being the highest
  /// priority.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  RecoveryOptionType({
    @_s.required this.name,
    @_s.required this.priority,
  });
  factory RecoveryOptionType.fromJson(Map<String, dynamic> json) =>
      _$RecoveryOptionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RecoveryOptionTypeToJson(this);
}

/// The response from the server when the Amazon Cognito Your User Pools service
/// makes the request to resend a confirmation code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResendConfirmationCodeResponse {
  /// The code delivery details returned by the server in response to the request
  /// to resend the confirmation code.
  @_s.JsonKey(name: 'CodeDeliveryDetails')
  final CodeDeliveryDetailsType codeDeliveryDetails;

  ResendConfirmationCodeResponse({
    this.codeDeliveryDetails,
  });
  factory ResendConfirmationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendConfirmationCodeResponseFromJson(json);
}

/// A resource server scope.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceServerScopeType {
  /// A description of the scope.
  @_s.JsonKey(name: 'ScopeDescription')
  final String scopeDescription;

  /// The name of the scope.
  @_s.JsonKey(name: 'ScopeName')
  final String scopeName;

  ResourceServerScopeType({
    @_s.required this.scopeDescription,
    @_s.required this.scopeName,
  });
  factory ResourceServerScopeType.fromJson(Map<String, dynamic> json) =>
      _$ResourceServerScopeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceServerScopeTypeToJson(this);
}

/// A container for information about a resource server for a user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceServerType {
  /// The identifier for the resource server.
  @_s.JsonKey(name: 'Identifier')
  final String identifier;

  /// The name of the resource server.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of scopes that are defined for the resource server.
  @_s.JsonKey(name: 'Scopes')
  final List<ResourceServerScopeType> scopes;

  /// The user pool ID for the user pool that hosts the resource server.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  ResourceServerType({
    this.identifier,
    this.name,
    this.scopes,
    this.userPoolId,
  });
  factory ResourceServerType.fromJson(Map<String, dynamic> json) =>
      _$ResourceServerTypeFromJson(json);
}

/// The response to respond to the authentication challenge.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RespondToAuthChallengeResponse {
  /// The result returned by the server in response to the request to respond to
  /// the authentication challenge.
  @_s.JsonKey(name: 'AuthenticationResult')
  final AuthenticationResultType authenticationResult;

  /// The challenge name. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html">InitiateAuth</a>.
  @_s.JsonKey(name: 'ChallengeName')
  final ChallengeNameType challengeName;

  /// The challenge parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_InitiateAuth.html">InitiateAuth</a>.
  @_s.JsonKey(name: 'ChallengeParameters')
  final Map<String, String> challengeParameters;

  /// The session which should be passed both ways in challenge-response calls to
  /// the service. If the caller needs to go through another challenge, they
  /// return a session with other challenge parameters. This session should be
  /// passed as it is to the next <code>RespondToAuthChallenge</code> API call.
  @_s.JsonKey(name: 'Session')
  final String session;

  RespondToAuthChallengeResponse({
    this.authenticationResult,
    this.challengeName,
    this.challengeParameters,
    this.session,
  });
  factory RespondToAuthChallengeResponse.fromJson(Map<String, dynamic> json) =>
      _$RespondToAuthChallengeResponseFromJson(json);
}

/// The risk configuration type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RiskConfigurationType {
  /// The account takeover risk configuration object including the
  /// <code>NotifyConfiguration</code> object and <code>Actions</code> to take in
  /// the case of an account takeover.
  @_s.JsonKey(name: 'AccountTakeoverRiskConfiguration')
  final AccountTakeoverRiskConfigurationType accountTakeoverRiskConfiguration;

  /// The app client ID.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The compromised credentials risk configuration object including the
  /// <code>EventFilter</code> and the <code>EventAction</code>
  @_s.JsonKey(name: 'CompromisedCredentialsRiskConfiguration')
  final CompromisedCredentialsRiskConfigurationType
      compromisedCredentialsRiskConfiguration;

  /// The last modified date.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The configuration to override the risk decision.
  @_s.JsonKey(name: 'RiskExceptionConfiguration')
  final RiskExceptionConfigurationType riskExceptionConfiguration;

  /// The user pool ID.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  RiskConfigurationType({
    this.accountTakeoverRiskConfiguration,
    this.clientId,
    this.compromisedCredentialsRiskConfiguration,
    this.lastModifiedDate,
    this.riskExceptionConfiguration,
    this.userPoolId,
  });
  factory RiskConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$RiskConfigurationTypeFromJson(json);
}

enum RiskDecisionType {
  @_s.JsonValue('NoRisk')
  noRisk,
  @_s.JsonValue('AccountTakeover')
  accountTakeover,
  @_s.JsonValue('Block')
  block,
}

/// The type of the configuration to override the risk decision.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RiskExceptionConfigurationType {
  /// Overrides the risk decision to always block the pre-authentication requests.
  /// The IP range is in CIDR notation: a compact representation of an IP address
  /// and its associated routing prefix.
  @_s.JsonKey(name: 'BlockedIPRangeList')
  final List<String> blockedIPRangeList;

  /// Risk detection is not performed on the IP addresses in the range list. The
  /// IP range is in CIDR notation.
  @_s.JsonKey(name: 'SkippedIPRangeList')
  final List<String> skippedIPRangeList;

  RiskExceptionConfigurationType({
    this.blockedIPRangeList,
    this.skippedIPRangeList,
  });
  factory RiskExceptionConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$RiskExceptionConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RiskExceptionConfigurationTypeToJson(this);
}

enum RiskLevelType {
  @_s.JsonValue('Low')
  low,
  @_s.JsonValue('Medium')
  medium,
  @_s.JsonValue('High')
  high,
}

/// The type used for enabling SMS MFA at the user level. Phone numbers don't
/// need to be verified to be used for SMS MFA. If an MFA type is enabled for a
/// user, the user will be prompted for MFA during all sign in attempts, unless
/// device tracking is turned on and the device has been trusted. If you would
/// like MFA to be applied selectively based on the assessed risk level of sign
/// in attempts, disable MFA for users and turn on Adaptive Authentication for
/// the user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SMSMfaSettingsType {
  /// Specifies whether SMS text message MFA is enabled. If an MFA type is enabled
  /// for a user, the user will be prompted for MFA during all sign in attempts,
  /// unless device tracking is turned on and the device has been trusted.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Specifies whether SMS is the preferred MFA method.
  @_s.JsonKey(name: 'PreferredMfa')
  final bool preferredMfa;

  SMSMfaSettingsType({
    this.enabled,
    this.preferredMfa,
  });
  Map<String, dynamic> toJson() => _$SMSMfaSettingsTypeToJson(this);
}

/// Contains information about the schema attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SchemaAttributeType {
  /// The attribute data type.
  @_s.JsonKey(name: 'AttributeDataType')
  final AttributeDataType attributeDataType;

  /// <note>
  /// We recommend that you use <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UserPoolClientType.html#CognitoUserPools-Type-UserPoolClientType-WriteAttributes">WriteAttributes</a>
  /// in the user pool client to control how attributes can be mutated for new use
  /// cases instead of using <code>DeveloperOnlyAttribute</code>.
  /// </note>
  /// Specifies whether the attribute type is developer only. This attribute can
  /// only be modified by an administrator. Users will not be able to modify this
  /// attribute using their access token. For example,
  /// <code>DeveloperOnlyAttribute</code> can be modified using
  /// AdminUpdateUserAttributes but cannot be updated using UpdateUserAttributes.
  @_s.JsonKey(name: 'DeveloperOnlyAttribute')
  final bool developerOnlyAttribute;

  /// Specifies whether the value of the attribute can be changed.
  ///
  /// For any user pool attribute that's mapped to an identity provider attribute,
  /// you must set this parameter to <code>true</code>. Amazon Cognito updates
  /// mapped attributes when users sign in to your application through an identity
  /// provider. If an attribute is immutable, Amazon Cognito throws an error when
  /// it attempts to update the attribute. For more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html">Specifying
  /// Identity Provider Attribute Mappings for Your User Pool</a>.
  @_s.JsonKey(name: 'Mutable')
  final bool mutable;

  /// A schema attribute of the name type.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Specifies the constraints for an attribute of the number type.
  @_s.JsonKey(name: 'NumberAttributeConstraints')
  final NumberAttributeConstraintsType numberAttributeConstraints;

  /// Specifies whether a user pool attribute is required. If the attribute is
  /// required and the user does not provide a value, registration or sign-in will
  /// fail.
  @_s.JsonKey(name: 'Required')
  final bool required;

  /// Specifies the constraints for an attribute of the string type.
  @_s.JsonKey(name: 'StringAttributeConstraints')
  final StringAttributeConstraintsType stringAttributeConstraints;

  SchemaAttributeType({
    this.attributeDataType,
    this.developerOnlyAttribute,
    this.mutable,
    this.name,
    this.numberAttributeConstraints,
    this.required,
    this.stringAttributeConstraints,
  });
  factory SchemaAttributeType.fromJson(Map<String, dynamic> json) =>
      _$SchemaAttributeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaAttributeTypeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetRiskConfigurationResponse {
  /// The risk configuration.
  @_s.JsonKey(name: 'RiskConfiguration')
  final RiskConfigurationType riskConfiguration;

  SetRiskConfigurationResponse({
    @_s.required this.riskConfiguration,
  });
  factory SetRiskConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$SetRiskConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetUICustomizationResponse {
  /// The UI customization information.
  @_s.JsonKey(name: 'UICustomization')
  final UICustomizationType uICustomization;

  SetUICustomizationResponse({
    @_s.required this.uICustomization,
  });
  factory SetUICustomizationResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUICustomizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetUserMFAPreferenceResponse {
  SetUserMFAPreferenceResponse();
  factory SetUserMFAPreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserMFAPreferenceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetUserPoolMfaConfigResponse {
  /// The MFA configuration. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>OFF</code> MFA will not be used for any users.
  /// </li>
  /// <li>
  /// <code>ON</code> MFA is required for all users to sign in.
  /// </li>
  /// <li>
  /// <code>OPTIONAL</code> MFA will be required only for individual users who
  /// have an MFA factor enabled.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MfaConfiguration')
  final UserPoolMfaType mfaConfiguration;

  /// The SMS text message MFA configuration.
  @_s.JsonKey(name: 'SmsMfaConfiguration')
  final SmsMfaConfigType smsMfaConfiguration;

  /// The software token MFA configuration.
  @_s.JsonKey(name: 'SoftwareTokenMfaConfiguration')
  final SoftwareTokenMfaConfigType softwareTokenMfaConfiguration;

  SetUserPoolMfaConfigResponse({
    this.mfaConfiguration,
    this.smsMfaConfiguration,
    this.softwareTokenMfaConfiguration,
  });
  factory SetUserPoolMfaConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserPoolMfaConfigResponseFromJson(json);
}

/// The response from the server for a set user settings request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetUserSettingsResponse {
  SetUserSettingsResponse();
  factory SetUserSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SetUserSettingsResponseFromJson(json);
}

/// The response from the server for a registration request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SignUpResponse {
  /// A response from the server indicating that a user registration has been
  /// confirmed.
  @_s.JsonKey(name: 'UserConfirmed')
  final bool userConfirmed;

  /// The UUID of the authenticated user. This is not the same as
  /// <code>username</code>.
  @_s.JsonKey(name: 'UserSub')
  final String userSub;

  /// The code delivery details returned by the server response to the user
  /// registration request.
  @_s.JsonKey(name: 'CodeDeliveryDetails')
  final CodeDeliveryDetailsType codeDeliveryDetails;

  SignUpResponse({
    @_s.required this.userConfirmed,
    @_s.required this.userSub,
    this.codeDeliveryDetails,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

/// The SMS configuration type that includes the settings the Cognito User Pool
/// needs to call for the Amazon SNS service to send an SMS message from your
/// AWS account. The Cognito User Pool makes the request to the Amazon SNS
/// Service by using an AWS IAM role that you provide for your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SmsConfigurationType {
  /// The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
  /// (SNS) caller. This is the ARN of the IAM role in your AWS account which
  /// Cognito will use to send SMS messages. SMS messages are subject to a <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html">spending
  /// limit</a>.
  @_s.JsonKey(name: 'SnsCallerArn')
  final String snsCallerArn;

  /// The external ID is a value that we recommend you use to add security to your
  /// IAM role which is used to call Amazon SNS to send SMS messages for your user
  /// pool. If you provide an <code>ExternalId</code>, the Cognito User Pool will
  /// include it when attempting to assume your IAM role, so that you can set your
  /// roles trust policy to require the <code>ExternalID</code>. If you use the
  /// Cognito Management Console to create a role for SMS MFA, Cognito will create
  /// a role with the required permissions and a trust policy that demonstrates
  /// use of the <code>ExternalId</code>.
  @_s.JsonKey(name: 'ExternalId')
  final String externalId;

  SmsConfigurationType({
    @_s.required this.snsCallerArn,
    this.externalId,
  });
  factory SmsConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$SmsConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SmsConfigurationTypeToJson(this);
}

/// The SMS text message multi-factor authentication (MFA) configuration type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SmsMfaConfigType {
  /// The SMS authentication message that will be sent to users with the code they
  /// need to sign in. The message must contain the ‘{####}’ placeholder, which
  /// will be replaced with the code. If the message is not included, and default
  /// message will be used.
  @_s.JsonKey(name: 'SmsAuthenticationMessage')
  final String smsAuthenticationMessage;

  /// The SMS configuration.
  @_s.JsonKey(name: 'SmsConfiguration')
  final SmsConfigurationType smsConfiguration;

  SmsMfaConfigType({
    this.smsAuthenticationMessage,
    this.smsConfiguration,
  });
  factory SmsMfaConfigType.fromJson(Map<String, dynamic> json) =>
      _$SmsMfaConfigTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SmsMfaConfigTypeToJson(this);
}

/// The type used for enabling software token MFA at the user pool level.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SoftwareTokenMfaConfigType {
  /// Specifies whether software token MFA is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  SoftwareTokenMfaConfigType({
    this.enabled,
  });
  factory SoftwareTokenMfaConfigType.fromJson(Map<String, dynamic> json) =>
      _$SoftwareTokenMfaConfigTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SoftwareTokenMfaConfigTypeToJson(this);
}

/// The type used for enabling software token MFA at the user level. If an MFA
/// type is enabled for a user, the user will be prompted for MFA during all
/// sign in attempts, unless device tracking is turned on and the device has
/// been trusted. If you would like MFA to be applied selectively based on the
/// assessed risk level of sign in attempts, disable MFA for users and turn on
/// Adaptive Authentication for the user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SoftwareTokenMfaSettingsType {
  /// Specifies whether software token MFA is enabled. If an MFA type is enabled
  /// for a user, the user will be prompted for MFA during all sign in attempts,
  /// unless device tracking is turned on and the device has been trusted.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Specifies whether software token MFA is the preferred MFA method.
  @_s.JsonKey(name: 'PreferredMfa')
  final bool preferredMfa;

  SoftwareTokenMfaSettingsType({
    this.enabled,
    this.preferredMfa,
  });
  Map<String, dynamic> toJson() => _$SoftwareTokenMfaSettingsTypeToJson(this);
}

/// Represents the response from the server to the request to start the user
/// import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartUserImportJobResponse {
  /// The job object that represents the user import job.
  @_s.JsonKey(name: 'UserImportJob')
  final UserImportJobType userImportJob;

  StartUserImportJobResponse({
    this.userImportJob,
  });
  factory StartUserImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartUserImportJobResponseFromJson(json);
}

enum StatusType {
  @_s.JsonValue('Enabled')
  enabled,
  @_s.JsonValue('Disabled')
  disabled,
}

/// Represents the response from the server to the request to stop the user
/// import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopUserImportJobResponse {
  /// The job object that represents the user import job.
  @_s.JsonKey(name: 'UserImportJob')
  final UserImportJobType userImportJob;

  StopUserImportJobResponse({
    this.userImportJob,
  });
  factory StopUserImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StopUserImportJobResponseFromJson(json);
}

/// The constraints associated with a string attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StringAttributeConstraintsType {
  /// The maximum length.
  @_s.JsonKey(name: 'MaxLength')
  final String maxLength;

  /// The minimum length.
  @_s.JsonKey(name: 'MinLength')
  final String minLength;

  StringAttributeConstraintsType({
    this.maxLength,
    this.minLength,
  });
  factory StringAttributeConstraintsType.fromJson(Map<String, dynamic> json) =>
      _$StringAttributeConstraintsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$StringAttributeConstraintsTypeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

enum TimeUnitsType {
  @_s.JsonValue('seconds')
  seconds,
  @_s.JsonValue('minutes')
  minutes,
  @_s.JsonValue('hours')
  hours,
  @_s.JsonValue('days')
  days,
}

/// The data type for TokenValidityUnits that specifics the time measurements
/// for token validity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TokenValidityUnitsType {
  /// A time unit in “seconds”, “minutes”, “hours” or “days” for the value in
  /// AccessTokenValidity, defaults to hours.
  @_s.JsonKey(name: 'AccessToken')
  final TimeUnitsType accessToken;

  /// A time unit in “seconds”, “minutes”, “hours” or “days” for the value in
  /// IdTokenValidity, defaults to hours.
  @_s.JsonKey(name: 'IdToken')
  final TimeUnitsType idToken;

  /// A time unit in “seconds”, “minutes”, “hours” or “days” for the value in
  /// RefreshTokenValidity, defaults to days.
  @_s.JsonKey(name: 'RefreshToken')
  final TimeUnitsType refreshToken;

  TokenValidityUnitsType({
    this.accessToken,
    this.idToken,
    this.refreshToken,
  });
  factory TokenValidityUnitsType.fromJson(Map<String, dynamic> json) =>
      _$TokenValidityUnitsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TokenValidityUnitsTypeToJson(this);
}

/// A container for the UI customization information for a user pool's built-in
/// app UI.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UICustomizationType {
  /// The CSS values in the UI customization.
  @_s.JsonKey(name: 'CSS')
  final String css;

  /// The CSS version number.
  @_s.JsonKey(name: 'CSSVersion')
  final String cSSVersion;

  /// The client ID for the client app.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The creation date for the UI customization.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The logo image for the UI customization.
  @_s.JsonKey(name: 'ImageUrl')
  final String imageUrl;

  /// The last-modified date for the UI customization.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The user pool ID for the user pool.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  UICustomizationType({
    this.css,
    this.cSSVersion,
    this.clientId,
    this.creationDate,
    this.imageUrl,
    this.lastModifiedDate,
    this.userPoolId,
  });
  factory UICustomizationType.fromJson(Map<String, dynamic> json) =>
      _$UICustomizationTypeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAuthEventFeedbackResponse {
  UpdateAuthEventFeedbackResponse();
  factory UpdateAuthEventFeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAuthEventFeedbackResponseFromJson(json);
}

/// The response to the request to update the device status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDeviceStatusResponse {
  UpdateDeviceStatusResponse();
  factory UpdateDeviceStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeviceStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGroupResponse {
  /// The group object for the group.
  @_s.JsonKey(name: 'Group')
  final GroupType group;

  UpdateGroupResponse({
    this.group,
  });
  factory UpdateGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateIdentityProviderResponse {
  /// The identity provider object.
  @_s.JsonKey(name: 'IdentityProvider')
  final IdentityProviderType identityProvider;

  UpdateIdentityProviderResponse({
    @_s.required this.identityProvider,
  });
  factory UpdateIdentityProviderResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateIdentityProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResourceServerResponse {
  /// The resource server.
  @_s.JsonKey(name: 'ResourceServer')
  final ResourceServerType resourceServer;

  UpdateResourceServerResponse({
    @_s.required this.resourceServer,
  });
  factory UpdateResourceServerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResourceServerResponseFromJson(json);
}

/// Represents the response from the server for the request to update user
/// attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserAttributesResponse {
  /// The code delivery details list from the server for the request to update
  /// user attributes.
  @_s.JsonKey(name: 'CodeDeliveryDetailsList')
  final List<CodeDeliveryDetailsType> codeDeliveryDetailsList;

  UpdateUserAttributesResponse({
    this.codeDeliveryDetailsList,
  });
  factory UpdateUserAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserAttributesResponseFromJson(json);
}

/// Represents the response from the server to the request to update the user
/// pool client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserPoolClientResponse {
  /// The user pool client value from the response from the server when an update
  /// user pool client request is made.
  @_s.JsonKey(name: 'UserPoolClient')
  final UserPoolClientType userPoolClient;

  UpdateUserPoolClientResponse({
    this.userPoolClient,
  });
  factory UpdateUserPoolClientResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserPoolClientResponseFromJson(json);
}

/// The UpdateUserPoolDomain response output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserPoolDomainResponse {
  /// The Amazon CloudFront endpoint that Amazon Cognito set up when you added the
  /// custom domain to your user pool.
  @_s.JsonKey(name: 'CloudFrontDomain')
  final String cloudFrontDomain;

  UpdateUserPoolDomainResponse({
    this.cloudFrontDomain,
  });
  factory UpdateUserPoolDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserPoolDomainResponseFromJson(json);
}

/// Represents the response from the server when you make a request to update
/// the user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserPoolResponse {
  UpdateUserPoolResponse();
  factory UpdateUserPoolResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserPoolResponseFromJson(json);
}

/// Contextual data such as the user's device fingerprint, IP address, or
/// location used for evaluating the risk of an unexpected event by Amazon
/// Cognito advanced security.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UserContextDataType {
  /// Contextual data such as the user's device fingerprint, IP address, or
  /// location used for evaluating the risk of an unexpected event by Amazon
  /// Cognito advanced security.
  @_s.JsonKey(name: 'EncodedData')
  final String encodedData;

  UserContextDataType({
    this.encodedData,
  });
  Map<String, dynamic> toJson() => _$UserContextDataTypeToJson(this);
}

enum UserImportJobStatusType {
  @_s.JsonValue('Created')
  created,
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Expired')
  expired,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Succeeded')
  succeeded,
}

/// The user import job type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserImportJobType {
  /// The role ARN for the Amazon CloudWatch Logging role for the user import job.
  /// For more information, see "Creating the CloudWatch Logs IAM Role" in the
  /// Amazon Cognito Developer Guide.
  @_s.JsonKey(name: 'CloudWatchLogsRoleArn')
  final String cloudWatchLogsRoleArn;

  /// The date when the user import job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletionDate')
  final DateTime completionDate;

  /// The message returned when the user import job is completed.
  @_s.JsonKey(name: 'CompletionMessage')
  final String completionMessage;

  /// The date the user import job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The number of users that could not be imported.
  @_s.JsonKey(name: 'FailedUsers')
  final int failedUsers;

  /// The number of users that were successfully imported.
  @_s.JsonKey(name: 'ImportedUsers')
  final int importedUsers;

  /// The job ID for the user import job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The job name for the user import job.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The pre-signed URL to be used to upload the <code>.csv</code> file.
  @_s.JsonKey(name: 'PreSignedUrl')
  final String preSignedUrl;

  /// The number of users that were skipped.
  @_s.JsonKey(name: 'SkippedUsers')
  final int skippedUsers;

  /// The date when the user import job was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartDate')
  final DateTime startDate;

  /// The status of the user import job. One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Created</code> - The job was created but not started.
  /// </li>
  /// <li>
  /// <code>Pending</code> - A transition state. You have started the job, but it
  /// has not begun importing users yet.
  /// </li>
  /// <li>
  /// <code>InProgress</code> - The job has started, and users are being imported.
  /// </li>
  /// <li>
  /// <code>Stopping</code> - You have stopped the job, but the job has not
  /// stopped importing users yet.
  /// </li>
  /// <li>
  /// <code>Stopped</code> - You have stopped the job, and the job has stopped
  /// importing users.
  /// </li>
  /// <li>
  /// <code>Succeeded</code> - The job has completed successfully.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The job has stopped due to an error.
  /// </li>
  /// <li>
  /// <code>Expired</code> - You created a job, but did not start the job within
  /// 24-48 hours. All data associated with the job was deleted, and the job
  /// cannot be started.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final UserImportJobStatusType status;

  /// The user pool ID for the user pool that the users are being imported into.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  UserImportJobType({
    this.cloudWatchLogsRoleArn,
    this.completionDate,
    this.completionMessage,
    this.creationDate,
    this.failedUsers,
    this.importedUsers,
    this.jobId,
    this.jobName,
    this.preSignedUrl,
    this.skippedUsers,
    this.startDate,
    this.status,
    this.userPoolId,
  });
  factory UserImportJobType.fromJson(Map<String, dynamic> json) =>
      _$UserImportJobTypeFromJson(json);
}

/// The user pool add-ons type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserPoolAddOnsType {
  /// The advanced security mode.
  @_s.JsonKey(name: 'AdvancedSecurityMode')
  final AdvancedSecurityModeType advancedSecurityMode;

  UserPoolAddOnsType({
    @_s.required this.advancedSecurityMode,
  });
  factory UserPoolAddOnsType.fromJson(Map<String, dynamic> json) =>
      _$UserPoolAddOnsTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UserPoolAddOnsTypeToJson(this);
}

/// The description of the user pool client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserPoolClientDescription {
  /// The ID of the client associated with the user pool.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The client name from the user pool client description.
  @_s.JsonKey(name: 'ClientName')
  final String clientName;

  /// The user pool ID for the user pool where you want to describe the user pool
  /// client.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  UserPoolClientDescription({
    this.clientId,
    this.clientName,
    this.userPoolId,
  });
  factory UserPoolClientDescription.fromJson(Map<String, dynamic> json) =>
      _$UserPoolClientDescriptionFromJson(json);
}

/// Contains information about a user pool client.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserPoolClientType {
  /// The time limit, specified by tokenValidityUnits, defaulting to hours, after
  /// which the access token is no longer valid and cannot be used.
  @_s.JsonKey(name: 'AccessTokenValidity')
  final int accessTokenValidity;

  /// The allowed OAuth flows.
  ///
  /// Set to <code>code</code> to initiate a code grant flow, which provides an
  /// authorization code as the response. This code can be exchanged for access
  /// tokens with the token endpoint.
  ///
  /// Set to <code>implicit</code> to specify that the client should get the
  /// access token (and, optionally, ID token, based on scopes) directly.
  ///
  /// Set to <code>client_credentials</code> to specify that the client should get
  /// the access token (and, optionally, ID token, based on scopes) from the token
  /// endpoint using a combination of client and client_secret.
  @_s.JsonKey(name: 'AllowedOAuthFlows')
  final List<OAuthFlowType> allowedOAuthFlows;

  /// Set to true if the client is allowed to follow the OAuth protocol when
  /// interacting with Cognito user pools.
  @_s.JsonKey(name: 'AllowedOAuthFlowsUserPoolClient')
  final bool allowedOAuthFlowsUserPoolClient;

  /// The allowed OAuth scopes. Possible values provided by OAuth are:
  /// <code>phone</code>, <code>email</code>, <code>openid</code>, and
  /// <code>profile</code>. Possible values provided by AWS are:
  /// <code>aws.cognito.signin.user.admin</code>. Custom scopes created in
  /// Resource Servers are also supported.
  @_s.JsonKey(name: 'AllowedOAuthScopes')
  final List<String> allowedOAuthScopes;

  /// The Amazon Pinpoint analytics configuration for the user pool client.
  /// <note>
  /// Cognito User Pools only supports sending events to Amazon Pinpoint projects
  /// in the US East (N. Virginia) us-east-1 Region, regardless of the region in
  /// which the user pool resides.
  /// </note>
  @_s.JsonKey(name: 'AnalyticsConfiguration')
  final AnalyticsConfigurationType analyticsConfiguration;

  /// A list of allowed redirect (callback) URLs for the identity providers.
  ///
  /// A redirect URI must:
  ///
  /// <ul>
  /// <li>
  /// Be an absolute URI.
  /// </li>
  /// <li>
  /// Be registered with the authorization server.
  /// </li>
  /// <li>
  /// Not include a fragment component.
  /// </li>
  /// </ul>
  /// See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0 -
  /// Redirection Endpoint</a>.
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  @_s.JsonKey(name: 'CallbackURLs')
  final List<String> callbackURLs;

  /// The ID of the client associated with the user pool.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The client name from the user pool request of the client type.
  @_s.JsonKey(name: 'ClientName')
  final String clientName;

  /// The client secret from the user pool request of the client type.
  @_s.JsonKey(name: 'ClientSecret')
  final String clientSecret;

  /// The date the user pool client was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The default redirect URI. Must be in the <code>CallbackURLs</code> list.
  ///
  /// A redirect URI must:
  ///
  /// <ul>
  /// <li>
  /// Be an absolute URI.
  /// </li>
  /// <li>
  /// Be registered with the authorization server.
  /// </li>
  /// <li>
  /// Not include a fragment component.
  /// </li>
  /// </ul>
  /// See <a href="https://tools.ietf.org/html/rfc6749#section-3.1.2">OAuth 2.0 -
  /// Redirection Endpoint</a>.
  ///
  /// Amazon Cognito requires HTTPS over HTTP except for http://localhost for
  /// testing purposes only.
  ///
  /// App callback URLs such as myapp://example are also supported.
  @_s.JsonKey(name: 'DefaultRedirectURI')
  final String defaultRedirectURI;

  /// The authentication flows that are supported by the user pool clients. Flow
  /// names without the <code>ALLOW_</code> prefix are deprecated in favor of new
  /// names with the <code>ALLOW_</code> prefix. Note that values with
  /// <code>ALLOW_</code> prefix cannot be used along with values without
  /// <code>ALLOW_</code> prefix.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ALLOW_ADMIN_USER_PASSWORD_AUTH</code>: Enable admin based user
  /// password authentication flow <code>ADMIN_USER_PASSWORD_AUTH</code>. This
  /// setting replaces the <code>ADMIN_NO_SRP_AUTH</code> setting. With this
  /// authentication flow, Cognito receives the password in the request instead of
  /// using the SRP (Secure Remote Password protocol) protocol to verify
  /// passwords.
  /// </li>
  /// <li>
  /// <code>ALLOW_CUSTOM_AUTH</code>: Enable Lambda trigger based authentication.
  /// </li>
  /// <li>
  /// <code>ALLOW_USER_PASSWORD_AUTH</code>: Enable user password-based
  /// authentication. In this flow, Cognito receives the password in the request
  /// instead of using the SRP protocol to verify passwords.
  /// </li>
  /// <li>
  /// <code>ALLOW_USER_SRP_AUTH</code>: Enable SRP based authentication.
  /// </li>
  /// <li>
  /// <code>ALLOW_REFRESH_TOKEN_AUTH</code>: Enable authflow to refresh tokens.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ExplicitAuthFlows')
  final List<ExplicitAuthFlowsType> explicitAuthFlows;

  /// The time limit, specified by tokenValidityUnits, defaulting to hours, after
  /// which the refresh token is no longer valid and cannot be used.
  @_s.JsonKey(name: 'IdTokenValidity')
  final int idTokenValidity;

  /// The date the user pool client was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// A list of allowed logout URLs for the identity providers.
  @_s.JsonKey(name: 'LogoutURLs')
  final List<String> logoutURLs;

  /// Use this setting to choose which errors and responses are returned by
  /// Cognito APIs during authentication, account confirmation, and password
  /// recovery when the user does not exist in the user pool. When set to
  /// <code>ENABLED</code> and the user does not exist, authentication returns an
  /// error indicating either the username or password was incorrect, and account
  /// confirmation and password recovery return a response indicating a code was
  /// sent to a simulated destination. When set to <code>LEGACY</code>, those APIs
  /// will return a <code>UserNotFoundException</code> exception if the user does
  /// not exist in the user pool.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - This prevents user existence-related errors.
  /// </li>
  /// <li>
  /// <code>LEGACY</code> - This represents the old behavior of Cognito where user
  /// existence related errors are not prevented.
  /// </li>
  /// </ul> <note>
  /// After February 15th 2020, the value of
  /// <code>PreventUserExistenceErrors</code> will default to <code>ENABLED</code>
  /// for newly created user pool clients if no value is provided.
  /// </note>
  @_s.JsonKey(name: 'PreventUserExistenceErrors')
  final PreventUserExistenceErrorTypes preventUserExistenceErrors;

  /// The Read-only attributes.
  @_s.JsonKey(name: 'ReadAttributes')
  final List<String> readAttributes;

  /// The time limit, in days, after which the refresh token is no longer valid
  /// and cannot be used.
  @_s.JsonKey(name: 'RefreshTokenValidity')
  final int refreshTokenValidity;

  /// A list of provider names for the identity providers that are supported on
  /// this client.
  @_s.JsonKey(name: 'SupportedIdentityProviders')
  final List<String> supportedIdentityProviders;

  /// The time units used to specify the token validity times of their respective
  /// token.
  @_s.JsonKey(name: 'TokenValidityUnits')
  final TokenValidityUnitsType tokenValidityUnits;

  /// The user pool ID for the user pool client.
  @_s.JsonKey(name: 'UserPoolId')
  final String userPoolId;

  /// The writeable attributes.
  @_s.JsonKey(name: 'WriteAttributes')
  final List<String> writeAttributes;

  UserPoolClientType({
    this.accessTokenValidity,
    this.allowedOAuthFlows,
    this.allowedOAuthFlowsUserPoolClient,
    this.allowedOAuthScopes,
    this.analyticsConfiguration,
    this.callbackURLs,
    this.clientId,
    this.clientName,
    this.clientSecret,
    this.creationDate,
    this.defaultRedirectURI,
    this.explicitAuthFlows,
    this.idTokenValidity,
    this.lastModifiedDate,
    this.logoutURLs,
    this.preventUserExistenceErrors,
    this.readAttributes,
    this.refreshTokenValidity,
    this.supportedIdentityProviders,
    this.tokenValidityUnits,
    this.userPoolId,
    this.writeAttributes,
  });
  factory UserPoolClientType.fromJson(Map<String, dynamic> json) =>
      _$UserPoolClientTypeFromJson(json);
}

/// A user pool description.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserPoolDescriptionType {
  /// The date the user pool description was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The ID in a user pool description.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The AWS Lambda configuration information in a user pool description.
  @_s.JsonKey(name: 'LambdaConfig')
  final LambdaConfigType lambdaConfig;

  /// The date the user pool description was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// The name in a user pool description.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The user pool status in a user pool description.
  @_s.JsonKey(name: 'Status')
  final StatusType status;

  UserPoolDescriptionType({
    this.creationDate,
    this.id,
    this.lambdaConfig,
    this.lastModifiedDate,
    this.name,
    this.status,
  });
  factory UserPoolDescriptionType.fromJson(Map<String, dynamic> json) =>
      _$UserPoolDescriptionTypeFromJson(json);
}

enum UserPoolMfaType {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('ON')
  on,
  @_s.JsonValue('OPTIONAL')
  optional,
}

extension on UserPoolMfaType {
  String toValue() {
    switch (this) {
      case UserPoolMfaType.off:
        return 'OFF';
      case UserPoolMfaType.on:
        return 'ON';
      case UserPoolMfaType.optional:
        return 'OPTIONAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The policy associated with a user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserPoolPolicyType {
  /// The password policy.
  @_s.JsonKey(name: 'PasswordPolicy')
  final PasswordPolicyType passwordPolicy;

  UserPoolPolicyType({
    this.passwordPolicy,
  });
  factory UserPoolPolicyType.fromJson(Map<String, dynamic> json) =>
      _$UserPoolPolicyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UserPoolPolicyTypeToJson(this);
}

/// A container for information about the user pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserPoolType {
  /// Use this setting to define which verified available method a user can use to
  /// recover their password when they call <code>ForgotPassword</code>. It allows
  /// you to define a preferred method when a user has more than one method
  /// available. With this setting, SMS does not qualify for a valid password
  /// recovery mechanism if the user also has SMS MFA enabled. In the absence of
  /// this setting, Cognito uses the legacy behavior to determine the recovery
  /// method where SMS is preferred over email.
  @_s.JsonKey(name: 'AccountRecoverySetting')
  final AccountRecoverySettingType accountRecoverySetting;

  /// The configuration for <code>AdminCreateUser</code> requests.
  @_s.JsonKey(name: 'AdminCreateUserConfig')
  final AdminCreateUserConfigType adminCreateUserConfig;

  /// Specifies the attributes that are aliased in a user pool.
  @_s.JsonKey(name: 'AliasAttributes')
  final List<AliasAttributeType> aliasAttributes;

  /// The Amazon Resource Name (ARN) for the user pool.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Specifies the attributes that are auto-verified in a user pool.
  @_s.JsonKey(name: 'AutoVerifiedAttributes')
  final List<VerifiedAttributeType> autoVerifiedAttributes;

  /// The date the user pool was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// A custom domain name that you provide to Amazon Cognito. This parameter
  /// applies only if you use a custom domain to host the sign-up and sign-in
  /// pages for your application. For example: <code>auth.example.com</code>.
  ///
  /// For more information about adding a custom domain to your user pool, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html">Using
  /// Your Own Domain for the Hosted UI</a>.
  @_s.JsonKey(name: 'CustomDomain')
  final String customDomain;

  /// The device configuration.
  @_s.JsonKey(name: 'DeviceConfiguration')
  final DeviceConfigurationType deviceConfiguration;

  /// Holds the domain prefix if the user pool has a domain associated with it.
  @_s.JsonKey(name: 'Domain')
  final String domain;

  /// The email configuration.
  @_s.JsonKey(name: 'EmailConfiguration')
  final EmailConfigurationType emailConfiguration;

  /// The reason why the email configuration cannot send the messages to your
  /// users.
  @_s.JsonKey(name: 'EmailConfigurationFailure')
  final String emailConfigurationFailure;

  /// The contents of the email verification message.
  @_s.JsonKey(name: 'EmailVerificationMessage')
  final String emailVerificationMessage;

  /// The subject of the email verification message.
  @_s.JsonKey(name: 'EmailVerificationSubject')
  final String emailVerificationSubject;

  /// A number estimating the size of the user pool.
  @_s.JsonKey(name: 'EstimatedNumberOfUsers')
  final int estimatedNumberOfUsers;

  /// The ID of the user pool.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The AWS Lambda triggers associated with the user pool.
  @_s.JsonKey(name: 'LambdaConfig')
  final LambdaConfigType lambdaConfig;

  /// The date the user pool was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedDate')
  final DateTime lastModifiedDate;

  /// Can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>OFF</code> - MFA tokens are not required and cannot be specified
  /// during user registration.
  /// </li>
  /// <li>
  /// <code>ON</code> - MFA tokens are required for all user registrations. You
  /// can only specify required when you are initially creating a user pool.
  /// </li>
  /// <li>
  /// <code>OPTIONAL</code> - Users have the option when registering to create an
  /// MFA token.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'MfaConfiguration')
  final UserPoolMfaType mfaConfiguration;

  /// The name of the user pool.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The policies associated with the user pool.
  @_s.JsonKey(name: 'Policies')
  final UserPoolPolicyType policies;

  /// A container with the schema attributes of a user pool.
  @_s.JsonKey(name: 'SchemaAttributes')
  final List<SchemaAttributeType> schemaAttributes;

  /// The contents of the SMS authentication message.
  @_s.JsonKey(name: 'SmsAuthenticationMessage')
  final String smsAuthenticationMessage;

  /// The SMS configuration.
  @_s.JsonKey(name: 'SmsConfiguration')
  final SmsConfigurationType smsConfiguration;

  /// The reason why the SMS configuration cannot send the messages to your users.
  @_s.JsonKey(name: 'SmsConfigurationFailure')
  final String smsConfigurationFailure;

  /// The contents of the SMS verification message.
  @_s.JsonKey(name: 'SmsVerificationMessage')
  final String smsVerificationMessage;

  /// The status of a user pool.
  @_s.JsonKey(name: 'Status')
  final StatusType status;

  /// The user pool add-ons.
  @_s.JsonKey(name: 'UserPoolAddOns')
  final UserPoolAddOnsType userPoolAddOns;

  /// The tags that are assigned to the user pool. A tag is a label that you can
  /// apply to user pools to categorize and manage them in different ways, such as
  /// by purpose, owner, environment, or other criteria.
  @_s.JsonKey(name: 'UserPoolTags')
  final Map<String, String> userPoolTags;

  /// Specifies whether email addresses or phone numbers can be specified as
  /// usernames when a user signs up.
  @_s.JsonKey(name: 'UsernameAttributes')
  final List<UsernameAttributeType> usernameAttributes;

  /// You can choose to enable case sensitivity on the username input for the
  /// selected sign-in option. For example, when this is set to
  /// <code>False</code>, users will be able to sign in using either "username" or
  /// "Username". This configuration is immutable once it has been set. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UsernameConfigurationType.html">UsernameConfigurationType</a>.
  @_s.JsonKey(name: 'UsernameConfiguration')
  final UsernameConfigurationType usernameConfiguration;

  /// The template for verification messages.
  @_s.JsonKey(name: 'VerificationMessageTemplate')
  final VerificationMessageTemplateType verificationMessageTemplate;

  UserPoolType({
    this.accountRecoverySetting,
    this.adminCreateUserConfig,
    this.aliasAttributes,
    this.arn,
    this.autoVerifiedAttributes,
    this.creationDate,
    this.customDomain,
    this.deviceConfiguration,
    this.domain,
    this.emailConfiguration,
    this.emailConfigurationFailure,
    this.emailVerificationMessage,
    this.emailVerificationSubject,
    this.estimatedNumberOfUsers,
    this.id,
    this.lambdaConfig,
    this.lastModifiedDate,
    this.mfaConfiguration,
    this.name,
    this.policies,
    this.schemaAttributes,
    this.smsAuthenticationMessage,
    this.smsConfiguration,
    this.smsConfigurationFailure,
    this.smsVerificationMessage,
    this.status,
    this.userPoolAddOns,
    this.userPoolTags,
    this.usernameAttributes,
    this.usernameConfiguration,
    this.verificationMessageTemplate,
  });
  factory UserPoolType.fromJson(Map<String, dynamic> json) =>
      _$UserPoolTypeFromJson(json);
}

enum UserStatusType {
  @_s.JsonValue('UNCONFIRMED')
  unconfirmed,
  @_s.JsonValue('CONFIRMED')
  confirmed,
  @_s.JsonValue('ARCHIVED')
  archived,
  @_s.JsonValue('COMPROMISED')
  compromised,
  @_s.JsonValue('UNKNOWN')
  unknown,
  @_s.JsonValue('RESET_REQUIRED')
  resetRequired,
  @_s.JsonValue('FORCE_CHANGE_PASSWORD')
  forceChangePassword,
}

/// The user type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserType {
  /// A container with information about the user type attributes.
  @_s.JsonKey(name: 'Attributes')
  final List<AttributeType> attributes;

  /// Specifies whether the user is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The MFA options for the user.
  @_s.JsonKey(name: 'MFAOptions')
  final List<MFAOptionType> mFAOptions;

  /// The creation date of the user.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UserCreateDate')
  final DateTime userCreateDate;

  /// The last modified date of the user.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UserLastModifiedDate')
  final DateTime userLastModifiedDate;

  /// The user status. Can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// UNCONFIRMED - User has been created but not confirmed.
  /// </li>
  /// <li>
  /// CONFIRMED - User has been confirmed.
  /// </li>
  /// <li>
  /// ARCHIVED - User is no longer active.
  /// </li>
  /// <li>
  /// COMPROMISED - User is disabled due to a potential security threat.
  /// </li>
  /// <li>
  /// UNKNOWN - User status is not known.
  /// </li>
  /// <li>
  /// RESET_REQUIRED - User is confirmed, but the user must request a code and
  /// reset his or her password before he or she can sign in.
  /// </li>
  /// <li>
  /// FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using
  /// a temporary password, but on first sign-in, the user must change his or her
  /// password to a new value before doing anything else.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'UserStatus')
  final UserStatusType userStatus;

  /// The user name of the user you wish to describe.
  @_s.JsonKey(name: 'Username')
  final String username;

  UserType({
    this.attributes,
    this.enabled,
    this.mFAOptions,
    this.userCreateDate,
    this.userLastModifiedDate,
    this.userStatus,
    this.username,
  });
  factory UserType.fromJson(Map<String, dynamic> json) =>
      _$UserTypeFromJson(json);
}

enum UsernameAttributeType {
  @_s.JsonValue('phone_number')
  phoneNumber,
  @_s.JsonValue('email')
  email,
}

extension on UsernameAttributeType {
  String toValue() {
    switch (this) {
      case UsernameAttributeType.phoneNumber:
        return 'phone_number';
      case UsernameAttributeType.email:
        return 'email';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The username configuration type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UsernameConfigurationType {
  /// Specifies whether username case sensitivity will be applied for all users in
  /// the user pool through Cognito APIs.
  ///
  /// Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>True</code> </b>: Enables case sensitivity for all username input.
  /// When this option is set to <code>True</code>, users must sign in using the
  /// exact capitalization of their given username. For example, “UserName”. This
  /// is the default value.
  /// </li>
  /// <li>
  /// <b> <code>False</code> </b>: Enables case insensitivity for all username
  /// input. For example, when this option is set to <code>False</code>, users
  /// will be able to sign in using either "username" or "Username". This option
  /// also enables both <code>preferred_username</code> and <code>email</code>
  /// alias to be case insensitive, in addition to the <code>username</code>
  /// attribute.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'CaseSensitive')
  final bool caseSensitive;

  UsernameConfigurationType({
    @_s.required this.caseSensitive,
  });
  factory UsernameConfigurationType.fromJson(Map<String, dynamic> json) =>
      _$UsernameConfigurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameConfigurationTypeToJson(this);
}

/// The template for verification messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VerificationMessageTemplateType {
  /// The default email option.
  @_s.JsonKey(name: 'DefaultEmailOption')
  final DefaultEmailOptionType defaultEmailOption;

  /// The email message template. EmailMessage is allowed only if <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">
  /// EmailSendingAccount</a> is DEVELOPER.
  @_s.JsonKey(name: 'EmailMessage')
  final String emailMessage;

  /// The email message template for sending a confirmation link to the user.
  /// EmailMessageByLink is allowed only if <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">
  /// EmailSendingAccount</a> is DEVELOPER.
  @_s.JsonKey(name: 'EmailMessageByLink')
  final String emailMessageByLink;

  /// The subject line for the email message template. EmailSubject is allowed
  /// only if <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">EmailSendingAccount</a>
  /// is DEVELOPER.
  @_s.JsonKey(name: 'EmailSubject')
  final String emailSubject;

  /// The subject line for the email message template for sending a confirmation
  /// link to the user. EmailSubjectByLink is allowed only <a
  /// href="https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount">
  /// EmailSendingAccount</a> is DEVELOPER.
  @_s.JsonKey(name: 'EmailSubjectByLink')
  final String emailSubjectByLink;

  /// The SMS message template.
  @_s.JsonKey(name: 'SmsMessage')
  final String smsMessage;

  VerificationMessageTemplateType({
    this.defaultEmailOption,
    this.emailMessage,
    this.emailMessageByLink,
    this.emailSubject,
    this.emailSubjectByLink,
    this.smsMessage,
  });
  factory VerificationMessageTemplateType.fromJson(Map<String, dynamic> json) =>
      _$VerificationMessageTemplateTypeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VerificationMessageTemplateTypeToJson(this);
}

enum VerifiedAttributeType {
  @_s.JsonValue('phone_number')
  phoneNumber,
  @_s.JsonValue('email')
  email,
}

extension on VerifiedAttributeType {
  String toValue() {
    switch (this) {
      case VerifiedAttributeType.phoneNumber:
        return 'phone_number';
      case VerifiedAttributeType.email:
        return 'email';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VerifySoftwareTokenResponse {
  /// The session which should be passed both ways in challenge-response calls to
  /// the service.
  @_s.JsonKey(name: 'Session')
  final String session;

  /// The status of the verify software token.
  @_s.JsonKey(name: 'Status')
  final VerifySoftwareTokenResponseType status;

  VerifySoftwareTokenResponse({
    this.session,
    this.status,
  });
  factory VerifySoftwareTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifySoftwareTokenResponseFromJson(json);
}

enum VerifySoftwareTokenResponseType {
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('ERROR')
  error,
}

/// A container representing the response from the server from the request to
/// verify user attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VerifyUserAttributeResponse {
  VerifyUserAttributeResponse();
  factory VerifyUserAttributeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserAttributeResponseFromJson(json);
}

class AliasExistsException extends _s.GenericAwsException {
  AliasExistsException({String type, String message})
      : super(type: type, code: 'AliasExistsException', message: message);
}

class CodeDeliveryFailureException extends _s.GenericAwsException {
  CodeDeliveryFailureException({String type, String message})
      : super(
            type: type, code: 'CodeDeliveryFailureException', message: message);
}

class CodeMismatchException extends _s.GenericAwsException {
  CodeMismatchException({String type, String message})
      : super(type: type, code: 'CodeMismatchException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class DuplicateProviderException extends _s.GenericAwsException {
  DuplicateProviderException({String type, String message})
      : super(type: type, code: 'DuplicateProviderException', message: message);
}

class EnableSoftwareTokenMFAException extends _s.GenericAwsException {
  EnableSoftwareTokenMFAException({String type, String message})
      : super(
            type: type,
            code: 'EnableSoftwareTokenMFAException',
            message: message);
}

class ExpiredCodeException extends _s.GenericAwsException {
  ExpiredCodeException({String type, String message})
      : super(type: type, code: 'ExpiredCodeException', message: message);
}

class GroupExistsException extends _s.GenericAwsException {
  GroupExistsException({String type, String message})
      : super(type: type, code: 'GroupExistsException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String type, String message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidEmailRoleAccessPolicyException extends _s.GenericAwsException {
  InvalidEmailRoleAccessPolicyException({String type, String message})
      : super(
            type: type,
            code: 'InvalidEmailRoleAccessPolicyException',
            message: message);
}

class InvalidLambdaResponseException extends _s.GenericAwsException {
  InvalidLambdaResponseException({String type, String message})
      : super(
            type: type,
            code: 'InvalidLambdaResponseException',
            message: message);
}

class InvalidOAuthFlowException extends _s.GenericAwsException {
  InvalidOAuthFlowException({String type, String message})
      : super(type: type, code: 'InvalidOAuthFlowException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String type, String message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

class InvalidSmsRoleAccessPolicyException extends _s.GenericAwsException {
  InvalidSmsRoleAccessPolicyException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSmsRoleAccessPolicyException',
            message: message);
}

class InvalidSmsRoleTrustRelationshipException extends _s.GenericAwsException {
  InvalidSmsRoleTrustRelationshipException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSmsRoleTrustRelationshipException',
            message: message);
}

class InvalidUserPoolConfigurationException extends _s.GenericAwsException {
  InvalidUserPoolConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidUserPoolConfigurationException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MFAMethodNotFoundException extends _s.GenericAwsException {
  MFAMethodNotFoundException({String type, String message})
      : super(type: type, code: 'MFAMethodNotFoundException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String type, String message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class PasswordResetRequiredException extends _s.GenericAwsException {
  PasswordResetRequiredException({String type, String message})
      : super(
            type: type,
            code: 'PasswordResetRequiredException',
            message: message);
}

class PreconditionNotMetException extends _s.GenericAwsException {
  PreconditionNotMetException({String type, String message})
      : super(
            type: type, code: 'PreconditionNotMetException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ScopeDoesNotExistException extends _s.GenericAwsException {
  ScopeDoesNotExistException({String type, String message})
      : super(type: type, code: 'ScopeDoesNotExistException', message: message);
}

class SoftwareTokenMFANotFoundException extends _s.GenericAwsException {
  SoftwareTokenMFANotFoundException({String type, String message})
      : super(
            type: type,
            code: 'SoftwareTokenMFANotFoundException',
            message: message);
}

class TooManyFailedAttemptsException extends _s.GenericAwsException {
  TooManyFailedAttemptsException({String type, String message})
      : super(
            type: type,
            code: 'TooManyFailedAttemptsException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnexpectedLambdaException extends _s.GenericAwsException {
  UnexpectedLambdaException({String type, String message})
      : super(type: type, code: 'UnexpectedLambdaException', message: message);
}

class UnsupportedIdentityProviderException extends _s.GenericAwsException {
  UnsupportedIdentityProviderException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedIdentityProviderException',
            message: message);
}

class UnsupportedUserStateException extends _s.GenericAwsException {
  UnsupportedUserStateException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedUserStateException',
            message: message);
}

class UserImportInProgressException extends _s.GenericAwsException {
  UserImportInProgressException({String type, String message})
      : super(
            type: type,
            code: 'UserImportInProgressException',
            message: message);
}

class UserLambdaValidationException extends _s.GenericAwsException {
  UserLambdaValidationException({String type, String message})
      : super(
            type: type,
            code: 'UserLambdaValidationException',
            message: message);
}

class UserNotConfirmedException extends _s.GenericAwsException {
  UserNotConfirmedException({String type, String message})
      : super(type: type, code: 'UserNotConfirmedException', message: message);
}

class UserNotFoundException extends _s.GenericAwsException {
  UserNotFoundException({String type, String message})
      : super(type: type, code: 'UserNotFoundException', message: message);
}

class UserPoolAddOnNotEnabledException extends _s.GenericAwsException {
  UserPoolAddOnNotEnabledException({String type, String message})
      : super(
            type: type,
            code: 'UserPoolAddOnNotEnabledException',
            message: message);
}

class UserPoolTaggingException extends _s.GenericAwsException {
  UserPoolTaggingException({String type, String message})
      : super(type: type, code: 'UserPoolTaggingException', message: message);
}

class UsernameExistsException extends _s.GenericAwsException {
  UsernameExistsException({String type, String message})
      : super(type: type, code: 'UsernameExistsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AliasExistsException': (type, message) =>
      AliasExistsException(type: type, message: message),
  'CodeDeliveryFailureException': (type, message) =>
      CodeDeliveryFailureException(type: type, message: message),
  'CodeMismatchException': (type, message) =>
      CodeMismatchException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'DuplicateProviderException': (type, message) =>
      DuplicateProviderException(type: type, message: message),
  'EnableSoftwareTokenMFAException': (type, message) =>
      EnableSoftwareTokenMFAException(type: type, message: message),
  'ExpiredCodeException': (type, message) =>
      ExpiredCodeException(type: type, message: message),
  'GroupExistsException': (type, message) =>
      GroupExistsException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidEmailRoleAccessPolicyException': (type, message) =>
      InvalidEmailRoleAccessPolicyException(type: type, message: message),
  'InvalidLambdaResponseException': (type, message) =>
      InvalidLambdaResponseException(type: type, message: message),
  'InvalidOAuthFlowException': (type, message) =>
      InvalidOAuthFlowException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPasswordException': (type, message) =>
      InvalidPasswordException(type: type, message: message),
  'InvalidSmsRoleAccessPolicyException': (type, message) =>
      InvalidSmsRoleAccessPolicyException(type: type, message: message),
  'InvalidSmsRoleTrustRelationshipException': (type, message) =>
      InvalidSmsRoleTrustRelationshipException(type: type, message: message),
  'InvalidUserPoolConfigurationException': (type, message) =>
      InvalidUserPoolConfigurationException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MFAMethodNotFoundException': (type, message) =>
      MFAMethodNotFoundException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'PasswordResetRequiredException': (type, message) =>
      PasswordResetRequiredException(type: type, message: message),
  'PreconditionNotMetException': (type, message) =>
      PreconditionNotMetException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ScopeDoesNotExistException': (type, message) =>
      ScopeDoesNotExistException(type: type, message: message),
  'SoftwareTokenMFANotFoundException': (type, message) =>
      SoftwareTokenMFANotFoundException(type: type, message: message),
  'TooManyFailedAttemptsException': (type, message) =>
      TooManyFailedAttemptsException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnexpectedLambdaException': (type, message) =>
      UnexpectedLambdaException(type: type, message: message),
  'UnsupportedIdentityProviderException': (type, message) =>
      UnsupportedIdentityProviderException(type: type, message: message),
  'UnsupportedUserStateException': (type, message) =>
      UnsupportedUserStateException(type: type, message: message),
  'UserImportInProgressException': (type, message) =>
      UserImportInProgressException(type: type, message: message),
  'UserLambdaValidationException': (type, message) =>
      UserLambdaValidationException(type: type, message: message),
  'UserNotConfirmedException': (type, message) =>
      UserNotConfirmedException(type: type, message: message),
  'UserNotFoundException': (type, message) =>
      UserNotFoundException(type: type, message: message),
  'UserPoolAddOnNotEnabledException': (type, message) =>
      UserPoolAddOnNotEnabledException(type: type, message: message),
  'UserPoolTaggingException': (type, message) =>
      UserPoolTaggingException(type: type, message: message),
  'UsernameExistsException': (type, message) =>
      UsernameExistsException(type: type, message: message),
};
