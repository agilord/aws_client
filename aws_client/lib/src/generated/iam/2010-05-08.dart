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

import '2010-05-08.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

part '2010-05-08.g.dart';

/// AWS Identity and Access Management (IAM) is a web service for securely
/// controlling access to AWS services. With IAM, you can centrally manage
/// users, security credentials such as access keys, and permissions that
/// control which AWS resources users and applications can access. For more
/// information about IAM, see <a href="http://aws.amazon.com/iam/">AWS Identity
/// and Access Management (IAM)</a> and the <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/">AWS Identity and
/// Access Management User Guide</a>.
class Iam {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Iam({
    String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iam',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Adds a new client ID (also known as audience) to the list of client IDs
  /// already registered for the specified IAM OpenID Connect (OIDC) provider
  /// resource.
  ///
  /// This operation is idempotent; it does not fail or return an error if you
  /// add an existing client ID to the provider.
  ///
  /// May throw [InvalidInputException].
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [clientID] :
  /// The client ID (also known as audience) to add to the IAM OpenID Connect
  /// provider resource.
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The Amazon Resource Name (ARN) of the IAM OpenID Connect (OIDC) provider
  /// resource to add the client ID to. You can get a list of OIDC provider ARNs
  /// by using the <a>ListOpenIDConnectProviders</a> operation.
  Future<void> addClientIDToOpenIDConnectProvider({
    @_s.required String clientID,
    @_s.required String openIDConnectProviderArn,
  }) async {
    ArgumentError.checkNotNull(clientID, 'clientID');
    _s.validateStringLength(
      'clientID',
      clientID,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        openIDConnectProviderArn, 'openIDConnectProviderArn');
    _s.validateStringLength(
      'openIDConnectProviderArn',
      openIDConnectProviderArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['ClientID'] = clientID;
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    await _protocol.send(
      $request,
      action: 'AddClientIDToOpenIDConnectProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddClientIDToOpenIDConnectProviderRequest'],
      shapes: shapes,
    );
  }

  /// Adds the specified IAM role to the specified instance profile. An instance
  /// profile can contain only one role. (The number and size of IAM resources
  /// in an AWS account are limited. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.) You can remove the
  /// existing role and then add a different role to an instance profile. You
  /// must then wait for the change to appear across all of AWS because of <a
  /// href="https://en.wikipedia.org/wiki/Eventual_consistency">eventual
  /// consistency</a>. To force the change, you must <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DisassociateIamInstanceProfile.html">disassociate
  /// the instance profile</a> and then <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_AssociateIamInstanceProfile.html">associate
  /// the instance profile</a>, or you can stop your instance and then restart
  /// it.
  /// <note>
  /// The caller of this API must be granted the <code>PassRole</code>
  /// permission on the IAM role by a permissions policy.
  /// </note>
  /// For more information about roles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working
  /// with Roles</a>. For more information about instance profiles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
  /// Instance Profiles</a>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the instance profile to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [roleName] :
  /// The name of the role to add.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> addRoleToInstanceProfile({
    @_s.required String instanceProfileName,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(instanceProfileName, 'instanceProfileName');
    _s.validateStringLength(
      'instanceProfileName',
      instanceProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceProfileName',
      instanceProfileName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'AddRoleToInstanceProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddRoleToInstanceProfileRequest'],
      shapes: shapes,
    );
  }

  /// Adds the specified user to the specified group.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the group to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [userName] :
  /// The name of the user to add.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> addUserToGroup({
    @_s.required String groupName,
    @_s.required String userName,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'AddUserToGroup',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddUserToGroupRequest'],
      shapes: shapes,
    );
  }

  /// Attaches the specified managed policy to the specified IAM group.
  ///
  /// You use this API to attach a managed policy to a group. To embed an inline
  /// policy in a group, use <a>PutGroupPolicy</a>.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotAttachableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name (friendly name, not ARN) of the group to attach the policy to.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy you want to attach.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<void> attachGroupPolicy({
    @_s.required String groupName,
    @_s.required String policyArn,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    $request['PolicyArn'] = policyArn;
    await _protocol.send(
      $request,
      action: 'AttachGroupPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AttachGroupPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Attaches the specified managed policy to the specified IAM role. When you
  /// attach a managed policy to a role, the managed policy becomes part of the
  /// role's permission (access) policy.
  /// <note>
  /// You cannot use a managed policy as the role's trust policy. The role's
  /// trust policy is created at the same time as the role, using
  /// <a>CreateRole</a>. You can update a role's trust policy using
  /// <a>UpdateAssumeRolePolicy</a>.
  /// </note>
  /// Use this API to attach a <i>managed</i> policy to a role. To embed an
  /// inline policy in a role, use <a>PutRolePolicy</a>. For more information
  /// about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [PolicyNotAttachableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy you want to attach.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [roleName] :
  /// The name (friendly name, not ARN) of the role to attach the policy to.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> attachRolePolicy({
    @_s.required String policyArn,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'AttachRolePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AttachRolePolicyRequest'],
      shapes: shapes,
    );
  }

  /// Attaches the specified managed policy to the specified user.
  ///
  /// You use this API to attach a <i>managed</i> policy to a user. To embed an
  /// inline policy in a user, use <a>PutUserPolicy</a>.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotAttachableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy you want to attach.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [userName] :
  /// The name (friendly name, not ARN) of the IAM user to attach the policy to.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> attachUserPolicy({
    @_s.required String policyArn,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'AttachUserPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AttachUserPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Changes the password of the IAM user who is calling this operation. The
  /// AWS account root user password is not affected by this operation.
  ///
  /// To change the password for a different user, see
  /// <a>UpdateLoginProfile</a>. For more information about modifying passwords,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing
  /// Passwords</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidUserTypeException].
  /// May throw [LimitExceededException].
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [PasswordPolicyViolationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [newPassword] :
  /// The new password. The new password must conform to the AWS account's
  /// password policy, if one exists.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter is a string of characters. That string can
  /// include almost any printable ASCII character from the space
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// (<code>\u00FF</code>). You can also include the tab (<code>\u0009</code>),
  /// line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// characters. Any of these characters are valid in a password. However, many
  /// tools, such as the AWS Management Console, might restrict the ability to
  /// type certain characters because they have special meaning within that
  /// tool.
  ///
  /// Parameter [oldPassword] :
  /// The IAM user's current password.
  Future<void> changePassword({
    @_s.required String newPassword,
    @_s.required String oldPassword,
  }) async {
    ArgumentError.checkNotNull(newPassword, 'newPassword');
    _s.validateStringLength(
      'newPassword',
      newPassword,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'newPassword',
      newPassword,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(oldPassword, 'oldPassword');
    _s.validateStringLength(
      'oldPassword',
      oldPassword,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'oldPassword',
      oldPassword,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['NewPassword'] = newPassword;
    $request['OldPassword'] = oldPassword;
    await _protocol.send(
      $request,
      action: 'ChangePassword',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ChangePasswordRequest'],
      shapes: shapes,
    );
  }

  /// Creates a new AWS secret access key and corresponding AWS access key ID
  /// for the specified user. The default status for new keys is
  /// <code>Active</code>.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID signing the request. This operation works
  /// for access keys under the AWS account. Consequently, you can use this
  /// operation to manage AWS account root user credentials. This is true even
  /// if the AWS account has no associated users.
  ///
  /// The number and size of IAM resources in an AWS account are limited. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.
  /// <important>
  /// To ensure the security of your AWS account, the secret access key is
  /// accessible only during key and user creation. You must save the key (for
  /// example, in a text file) if you want to be able to access it again. If a
  /// secret key is lost, you can delete the access keys for the associated user
  /// and then create new keys.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the IAM user that the new key will belong to.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<CreateAccessKeyResponse> createAccessKey({
    String userName,
  }) async {
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateAccessKey',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateAccessKeyRequest'],
      shapes: shapes,
      resultWrapper: 'CreateAccessKeyResult',
    );
    return CreateAccessKeyResponse.fromXml($result);
  }

  /// Creates an alias for your AWS account. For information about using an AWS
  /// account alias, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html">Using
  /// an Alias for Your AWS Account ID</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountAlias] :
  /// The account alias to create.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of lowercase letters, digits, and dashes. You cannot
  /// start or finish with a dash, nor can you have two dashes in a row.
  Future<void> createAccountAlias({
    @_s.required String accountAlias,
  }) async {
    ArgumentError.checkNotNull(accountAlias, 'accountAlias');
    _s.validateStringLength(
      'accountAlias',
      accountAlias,
      3,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountAlias',
      accountAlias,
      r'''^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AccountAlias'] = accountAlias;
    await _protocol.send(
      $request,
      action: 'CreateAccountAlias',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateAccountAliasRequest'],
      shapes: shapes,
    );
  }

  /// Creates a new group.
  ///
  /// The number and size of IAM resources in an AWS account are limited. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the group to create. Do not include the path in this value.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// Parameter [path] :
  /// The path to the group. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<CreateGroupResponse> createGroup({
    @_s.required String groupName,
    String path,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'path',
      path,
      1,
      512,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    path?.also((arg) => $request['Path'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateGroup',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateGroupRequest'],
      shapes: shapes,
      resultWrapper: 'CreateGroupResult',
    );
    return CreateGroupResponse.fromXml($result);
  }

  /// Creates a new instance profile. For information about instance profiles,
  /// go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
  /// Instance Profiles</a>.
  ///
  /// The number and size of IAM resources in an AWS account are limited. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the instance profile to create.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [path] :
  /// The path to the instance profile. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<CreateInstanceProfileResponse> createInstanceProfile({
    @_s.required String instanceProfileName,
    String path,
  }) async {
    ArgumentError.checkNotNull(instanceProfileName, 'instanceProfileName');
    _s.validateStringLength(
      'instanceProfileName',
      instanceProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceProfileName',
      instanceProfileName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'path',
      path,
      1,
      512,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    path?.also((arg) => $request['Path'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateInstanceProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateInstanceProfileRequest'],
      shapes: shapes,
      resultWrapper: 'CreateInstanceProfileResult',
    );
    return CreateInstanceProfileResponse.fromXml($result);
  }

  /// Creates a password for the specified user, giving the user the ability to
  /// access AWS services through the AWS Management Console. For more
  /// information about managing passwords, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing
  /// Passwords</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [NoSuchEntityException].
  /// May throw [PasswordPolicyViolationException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [password] :
  /// The new password for the user.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter is a string of characters. That string can
  /// include almost any printable ASCII character from the space
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// (<code>\u00FF</code>). You can also include the tab (<code>\u0009</code>),
  /// line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// characters. Any of these characters are valid in a password. However, many
  /// tools, such as the AWS Management Console, might restrict the ability to
  /// type certain characters because they have special meaning within that
  /// tool.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user to create a password for. The user must already
  /// exist.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [passwordResetRequired] :
  /// Specifies whether the user is required to set a new password on next
  /// sign-in.
  Future<CreateLoginProfileResponse> createLoginProfile({
    @_s.required String password,
    @_s.required String userName,
    bool passwordResetRequired,
  }) async {
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Password'] = password;
    $request['UserName'] = userName;
    passwordResetRequired
        ?.also((arg) => $request['PasswordResetRequired'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateLoginProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateLoginProfileRequest'],
      shapes: shapes,
      resultWrapper: 'CreateLoginProfileResult',
    );
    return CreateLoginProfileResponse.fromXml($result);
  }

  /// Creates an IAM entity to describe an identity provider (IdP) that supports
  /// <a href="http://openid.net/connect/">OpenID Connect (OIDC)</a>.
  ///
  /// The OIDC provider that you create with this operation can be used as a
  /// principal in a role's trust policy. Such a policy establishes a trust
  /// relationship between AWS and the OIDC provider.
  ///
  /// When you create the IAM OIDC provider, you specify the following:
  ///
  /// <ul>
  /// <li>
  /// The URL of the OIDC identity provider (IdP) to trust
  /// </li>
  /// <li>
  /// A list of client IDs (also known as audiences) that identify the
  /// application or applications that are allowed to authenticate using the
  /// OIDC provider
  /// </li>
  /// <li>
  /// A list of thumbprints of one or more server certificates that the IdP uses
  /// </li>
  /// </ul>
  /// You get all of this information from the OIDC IdP that you want to use to
  /// access AWS.
  /// <note>
  /// The trust for the OIDC provider is derived from the IAM provider that this
  /// operation creates. Therefore, it is best to limit access to the
  /// <a>CreateOpenIDConnectProvider</a> operation to highly privileged users.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [thumbprintList] :
  /// A list of server certificate thumbprints for the OpenID Connect (OIDC)
  /// identity provider's server certificates. Typically this list includes only
  /// one entry. However, IAM lets you have up to five thumbprints for an OIDC
  /// provider. This lets you maintain multiple thumbprints if the identity
  /// provider is rotating certificates.
  ///
  /// The server certificate thumbprint is the hex-encoded SHA-1 hash value of
  /// the X.509 certificate used by the domain where the OpenID Connect provider
  /// makes its keys available. It is always a 40-character string.
  ///
  /// You must provide at least one thumbprint when creating an IAM OIDC
  /// provider. For example, assume that the OIDC provider is
  /// <code>server.example.com</code> and the provider stores its keys at
  /// https://keys.server.example.com/openid-connect. In that case, the
  /// thumbprint string would be the hex-encoded SHA-1 hash value of the
  /// certificate used by https://keys.server.example.com.
  ///
  /// For more information about obtaining the OIDC provider's thumbprint, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/identity-providers-oidc-obtain-thumbprint.html">Obtaining
  /// the Thumbprint for an OpenID Connect Provider</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// Parameter [url] :
  /// The URL of the identity provider. The URL must begin with
  /// <code>https://</code> and should correspond to the <code>iss</code> claim
  /// in the provider's OpenID Connect ID tokens. Per the OIDC standard, path
  /// components are allowed but query parameters are not. Typically the URL
  /// consists of only a hostname, like <code>https://server.example.org</code>
  /// or <code>https://example.com</code>.
  ///
  /// You cannot register the same provider multiple times in a single AWS
  /// account. If you try to submit a URL that has already been used for an
  /// OpenID Connect provider in the AWS account, you will get an error.
  ///
  /// Parameter [clientIDList] :
  /// A list of client IDs (also known as audiences). When a mobile or web app
  /// registers with an OpenID Connect provider, they establish a value that
  /// identifies the application. (This is the value that's sent as the
  /// <code>client_id</code> parameter on OAuth requests.)
  ///
  /// You can register multiple client IDs with the same provider. For example,
  /// you might have multiple applications that use the same OIDC provider. You
  /// cannot register more than 100 client IDs with a single IAM OIDC provider.
  ///
  /// There is no defined format for a client ID. The
  /// <code>CreateOpenIDConnectProviderRequest</code> operation accepts client
  /// IDs up to 255 characters long.
  Future<CreateOpenIDConnectProviderResponse> createOpenIDConnectProvider({
    @_s.required List<String> thumbprintList,
    @_s.required String url,
    List<String> clientIDList,
  }) async {
    ArgumentError.checkNotNull(thumbprintList, 'thumbprintList');
    ArgumentError.checkNotNull(url, 'url');
    _s.validateStringLength(
      'url',
      url,
      1,
      255,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['ThumbprintList'] = thumbprintList;
    $request['Url'] = url;
    clientIDList?.also((arg) => $request['ClientIDList'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateOpenIDConnectProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateOpenIDConnectProviderRequest'],
      shapes: shapes,
      resultWrapper: 'CreateOpenIDConnectProviderResult',
    );
    return CreateOpenIDConnectProviderResponse.fromXml($result);
  }

  /// Creates a new managed policy for your AWS account.
  ///
  /// This operation creates a policy version with a version identifier of
  /// <code>v1</code> and sets v1 as the policy's default version. For more
  /// information about policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about managed policies in general, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON policy document that you want to use as the content for the new
  /// policy.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [policyName] :
  /// The friendly name of the policy.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// Parameter [description] :
  /// A friendly description of the policy.
  ///
  /// Typically used to store information about the permissions defined in the
  /// policy. For example, "Grants access to production DynamoDB tables."
  ///
  /// The policy description is immutable. After a value is assigned, it cannot
  /// be changed.
  ///
  /// Parameter [path] :
  /// The path for the policy.
  ///
  /// For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<CreatePolicyResponse> createPolicy({
    @_s.required String policyDocument,
    @_s.required String policyName,
    String description,
    String path,
  }) async {
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyDocument',
      policyDocument,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'path',
      path,
      1,
      512,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''((/[A-Za-z0-9\.,\+@=_-]+)*)/''',
    );
    final $request = <String, dynamic>{};
    $request['PolicyDocument'] = policyDocument;
    $request['PolicyName'] = policyName;
    description?.also((arg) => $request['Description'] = arg);
    path?.also((arg) => $request['Path'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreatePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreatePolicyRequest'],
      shapes: shapes,
      resultWrapper: 'CreatePolicyResult',
    );
    return CreatePolicyResponse.fromXml($result);
  }

  /// Creates a new version of the specified managed policy. To update a managed
  /// policy, you create a new policy version. A managed policy can have up to
  /// five versions. If the policy has five versions, you must delete an
  /// existing version using <a>DeletePolicyVersion</a> before you create a new
  /// version.
  ///
  /// Optionally, you can set the new version as the policy's default version.
  /// The default version is the version that is in effect for the IAM users,
  /// groups, and roles to which the policy is attached.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy to which you want to add
  /// a new version.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [policyDocument] :
  /// The JSON policy document that you want to use as the content for this new
  /// version of the policy.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [setAsDefault] :
  /// Specifies whether to set this version as the policy's default version.
  ///
  /// When this parameter is <code>true</code>, the new policy version becomes
  /// the operative version. That is, it becomes the version that is in effect
  /// for the IAM users, groups, and roles that the policy is attached to.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  Future<CreatePolicyVersionResponse> createPolicyVersion({
    @_s.required String policyArn,
    @_s.required String policyDocument,
    bool setAsDefault,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyDocument',
      policyDocument,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['PolicyDocument'] = policyDocument;
    setAsDefault?.also((arg) => $request['SetAsDefault'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreatePolicyVersion',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreatePolicyVersionRequest'],
      shapes: shapes,
      resultWrapper: 'CreatePolicyVersionResult',
    );
    return CreatePolicyVersionResponse.fromXml($result);
  }

  /// Creates a new role for your AWS account. For more information about roles,
  /// go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">IAM
  /// Roles</a>. The number and size of IAM resources in an AWS account are
  /// limited. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [assumeRolePolicyDocument] :
  /// The trust relationship policy document that grants an entity permission to
  /// assume the role.
  ///
  /// In IAM, you must provide a JSON policy that has been converted to a
  /// string. However, for AWS CloudFormation templates formatted in YAML, you
  /// can provide the policy in JSON or YAML format. AWS CloudFormation always
  /// converts a YAML policy to JSON format before submitting it to IAM.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  /// Upon success, the response includes the same trust policy in JSON format.
  ///
  /// Parameter [roleName] :
  /// The name of the role to create.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// Parameter [description] :
  /// A description of the role.
  ///
  /// Parameter [maxSessionDuration] :
  /// The maximum session duration (in seconds) that you want to set for the
  /// specified role. If you do not specify a value for this setting, the
  /// default maximum of one hour is applied. This setting can have a value from
  /// 1 hour to 12 hours.
  ///
  /// Anyone who assumes the role from the AWS CLI or API can use the
  /// <code>DurationSeconds</code> API parameter or the
  /// <code>duration-seconds</code> CLI parameter to request a longer session.
  /// The <code>MaxSessionDuration</code> setting determines the maximum
  /// duration that can be requested using the <code>DurationSeconds</code>
  /// parameter. If users don't specify a value for the
  /// <code>DurationSeconds</code> parameter, their security credentials are
  /// valid for one hour by default. This applies when you use the
  /// <code>AssumeRole*</code> API operations or the <code>assume-role*</code>
  /// CLI operations but does not apply when you use those operations to create
  /// a console URL. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using
  /// IAM Roles</a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [path] :
  /// The path to the role. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  ///
  /// Parameter [permissionsBoundary] :
  /// The ARN of the policy that is used to set the permissions boundary for the
  /// role.
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the newly created role. Each tag
  /// consists of a key name and an associated value. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags per role, then the entire request fails and the role is not created.
  /// </note>
  Future<CreateRoleResponse> createRole({
    @_s.required String assumeRolePolicyDocument,
    @_s.required String roleName,
    String description,
    int maxSessionDuration,
    String path,
    String permissionsBoundary,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        assumeRolePolicyDocument, 'assumeRolePolicyDocument');
    _s.validateStringLength(
      'assumeRolePolicyDocument',
      assumeRolePolicyDocument,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assumeRolePolicyDocument',
      assumeRolePolicyDocument,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
    );
    _s.validateNumRange(
      'maxSessionDuration',
      maxSessionDuration,
      3600,
      43200,
    );
    _s.validateStringLength(
      'path',
      path,
      1,
      512,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    _s.validateStringLength(
      'permissionsBoundary',
      permissionsBoundary,
      20,
      2048,
    );
    final $request = <String, dynamic>{};
    $request['AssumeRolePolicyDocument'] = assumeRolePolicyDocument;
    $request['RoleName'] = roleName;
    description?.also((arg) => $request['Description'] = arg);
    maxSessionDuration?.also((arg) => $request['MaxSessionDuration'] = arg);
    path?.also((arg) => $request['Path'] = arg);
    permissionsBoundary?.also((arg) => $request['PermissionsBoundary'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateRoleRequest'],
      shapes: shapes,
      resultWrapper: 'CreateRoleResult',
    );
    return CreateRoleResponse.fromXml($result);
  }

  /// Creates an IAM resource that describes an identity provider (IdP) that
  /// supports SAML 2.0.
  ///
  /// The SAML provider resource that you create with this operation can be used
  /// as a principal in an IAM role's trust policy. Such a policy can enable
  /// federated users who sign in using the SAML IdP to assume the role. You can
  /// create an IAM role that supports Web-based single sign-on (SSO) to the AWS
  /// Management Console or one that supports API access to AWS.
  ///
  /// When you create the SAML provider resource, you upload a SAML metadata
  /// document that you get from your IdP. That document includes the issuer's
  /// name, expiration information, and keys that can be used to validate the
  /// SAML authentication response (assertions) that the IdP sends. You must
  /// generate the metadata document using the identity management software that
  /// is used as your organization's IdP.
  /// <note>
  /// This operation requires <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html">Enabling
  /// SAML 2.0 Federated Users to Access the AWS Management Console</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About
  /// SAML 2.0-based Federation</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the provider to create.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [sAMLMetadataDocument] :
  /// An XML document generated by an identity provider (IdP) that supports SAML
  /// 2.0. The document includes the issuer's name, expiration information, and
  /// keys that can be used to validate the SAML authentication response
  /// (assertions) that are received from the IdP. You must generate the
  /// metadata document using the identity management software that is used as
  /// your organization's IdP.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About
  /// SAML 2.0-based Federation</a> in the <i>IAM User Guide</i>
  Future<CreateSAMLProviderResponse> createSAMLProvider({
    @_s.required String name,
    @_s.required String sAMLMetadataDocument,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w._-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sAMLMetadataDocument, 'sAMLMetadataDocument');
    _s.validateStringLength(
      'sAMLMetadataDocument',
      sAMLMetadataDocument,
      1000,
      10000000,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    $request['SAMLMetadataDocument'] = sAMLMetadataDocument;
    final $result = await _protocol.send(
      $request,
      action: 'CreateSAMLProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateSAMLProviderRequest'],
      shapes: shapes,
      resultWrapper: 'CreateSAMLProviderResult',
    );
    return CreateSAMLProviderResponse.fromXml($result);
  }

  /// Creates an IAM role that is linked to a specific AWS service. The service
  /// controls the attached policies and when the role can be deleted. This
  /// helps ensure that the service is not broken by an unexpectedly changed or
  /// deleted role, which could put your AWS resources into an unknown state.
  /// Allowing the service to control the role helps improve service stability
  /// and proper cleanup when a service and its role are no longer needed. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">Using
  /// Service-Linked Roles</a> in the <i>IAM User Guide</i>.
  ///
  /// To attach a policy to this service-linked role, you must make the request
  /// using the AWS service that depends on this role.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [awsServiceName] :
  /// The service principal for the AWS service to which this role is attached.
  /// You use a string similar to a URL but without the http:// in front. For
  /// example: <code>elasticbeanstalk.amazonaws.com</code>.
  ///
  /// Service principals are unique and case-sensitive. To find the exact
  /// service principal for your service-linked role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html">AWS
  /// Services That Work with IAM</a> in the <i>IAM User Guide</i>. Look for the
  /// services that have <b>Yes </b>in the <b>Service-Linked Role</b> column.
  /// Choose the <b>Yes</b> link to view the service-linked role documentation
  /// for that service.
  ///
  /// Parameter [customSuffix] :
  /// <p/>
  /// A string that you provide, which is combined with the service-provided
  /// prefix to form the complete role name. If you make multiple requests for
  /// the same service, then you must supply a different
  /// <code>CustomSuffix</code> for each request. Otherwise the request fails
  /// with a duplicate role name error. For example, you could add
  /// <code>-1</code> or <code>-debug</code> to the suffix.
  ///
  /// Some services do not support the <code>CustomSuffix</code> parameter. If
  /// you provide an optional suffix and the operation fails, try the operation
  /// again without the suffix.
  ///
  /// Parameter [description] :
  /// The description of the role.
  Future<CreateServiceLinkedRoleResponse> createServiceLinkedRole({
    @_s.required String awsServiceName,
    String customSuffix,
    String description,
  }) async {
    ArgumentError.checkNotNull(awsServiceName, 'awsServiceName');
    _s.validateStringLength(
      'awsServiceName',
      awsServiceName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsServiceName',
      awsServiceName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'customSuffix',
      customSuffix,
      1,
      64,
    );
    _s.validateStringPattern(
      'customSuffix',
      customSuffix,
      r'''[\w+=,.@-]+''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
    );
    final $request = <String, dynamic>{};
    $request['AWSServiceName'] = awsServiceName;
    customSuffix?.also((arg) => $request['CustomSuffix'] = arg);
    description?.also((arg) => $request['Description'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateServiceLinkedRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateServiceLinkedRoleRequest'],
      shapes: shapes,
      resultWrapper: 'CreateServiceLinkedRoleResult',
    );
    return CreateServiceLinkedRoleResponse.fromXml($result);
  }

  /// Generates a set of credentials consisting of a user name and password that
  /// can be used to access the service specified in the request. These
  /// credentials are generated by IAM, and can be used only for the specified
  /// service.
  ///
  /// You can have a maximum of two sets of service-specific credentials for
  /// each supported service per user.
  ///
  /// The only supported service at this time is AWS CodeCommit.
  ///
  /// You can reset the password to a new service-generated value by calling
  /// <a>ResetServiceSpecificCredential</a>.
  ///
  /// For more information about service-specific credentials, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html">Using
  /// IAM with AWS CodeCommit: Git Credentials, SSH Keys, and AWS Access
  /// Keys</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceNotSupportedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the AWS service that is to be associated with the credentials.
  /// The service you specify here is the only service that can be accessed
  /// using these credentials.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user that is to be associated with the credentials.
  /// The new service-specific credentials have the same permissions as the
  /// associated user except that they can be used only to access the specified
  /// service.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<CreateServiceSpecificCredentialResponse>
      createServiceSpecificCredential({
    @_s.required String serviceName,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['ServiceName'] = serviceName;
    $request['UserName'] = userName;
    final $result = await _protocol.send(
      $request,
      action: 'CreateServiceSpecificCredential',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateServiceSpecificCredentialRequest'],
      shapes: shapes,
      resultWrapper: 'CreateServiceSpecificCredentialResult',
    );
    return CreateServiceSpecificCredentialResponse.fromXml($result);
  }

  /// Creates a new IAM user for your AWS account.
  ///
  /// The number and size of IAM resources in an AWS account are limited. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user to create.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// Parameter [path] :
  /// The path for the user name. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  ///
  /// Parameter [permissionsBoundary] :
  /// The ARN of the policy that is used to set the permissions boundary for the
  /// user.
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the newly created user. Each tag
  /// consists of a key name and an associated value. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags per user, then the entire request fails and the user is not created.
  /// </note>
  Future<CreateUserResponse> createUser({
    @_s.required String userName,
    String path,
    String permissionsBoundary,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'path',
      path,
      1,
      512,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    _s.validateStringLength(
      'permissionsBoundary',
      permissionsBoundary,
      20,
      2048,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    path?.also((arg) => $request['Path'] = arg);
    permissionsBoundary?.also((arg) => $request['PermissionsBoundary'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateUser',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateUserRequest'],
      shapes: shapes,
      resultWrapper: 'CreateUserResult',
    );
    return CreateUserResponse.fromXml($result);
  }

  /// Creates a new virtual MFA device for the AWS account. After creating the
  /// virtual MFA, use <a>EnableMFADevice</a> to attach the MFA device to an IAM
  /// user. For more information about creating and working with virtual MFA
  /// devices, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Using
  /// a Virtual MFA Device</a> in the <i>IAM User Guide</i>.
  ///
  /// The number and size of IAM resources in an AWS account are limited. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.
  /// <important>
  /// The seed information contained in the QR code and the Base32 string should
  /// be treated like any other secret access information. In other words,
  /// protect the seed information as you would your AWS access keys or your
  /// passwords. After you provision your virtual device, you should ensure that
  /// the information is destroyed following secure procedures.
  /// </important>
  ///
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [virtualMFADeviceName] :
  /// The name of the virtual MFA device. Use with path to uniquely identify a
  /// virtual MFA device.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [path] :
  /// The path for the virtual MFA device. For more information about paths, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/).
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<CreateVirtualMFADeviceResponse> createVirtualMFADevice({
    @_s.required String virtualMFADeviceName,
    String path,
  }) async {
    ArgumentError.checkNotNull(virtualMFADeviceName, 'virtualMFADeviceName');
    _s.validateStringLength(
      'virtualMFADeviceName',
      virtualMFADeviceName,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringPattern(
      'virtualMFADeviceName',
      virtualMFADeviceName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'path',
      path,
      1,
      512,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    final $request = <String, dynamic>{};
    $request['VirtualMFADeviceName'] = virtualMFADeviceName;
    path?.also((arg) => $request['Path'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateVirtualMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateVirtualMFADeviceRequest'],
      shapes: shapes,
      resultWrapper: 'CreateVirtualMFADeviceResult',
    );
    return CreateVirtualMFADeviceResponse.fromXml($result);
  }

  /// Deactivates the specified MFA device and removes it from association with
  /// the user name for which it was originally enabled.
  ///
  /// For more information about creating and working with virtual MFA devices,
  /// go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Enabling
  /// a Virtual Multi-factor Authentication (MFA) Device</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serialNumber] :
  /// The serial number that uniquely identifies the MFA device. For virtual MFA
  /// devices, the serial number is the device ARN.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: =,.@:/-
  ///
  /// Parameter [userName] :
  /// The name of the user whose MFA device you want to deactivate.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deactivateMFADevice({
    @_s.required String serialNumber,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(serialNumber, 'serialNumber');
    _s.validateStringLength(
      'serialNumber',
      serialNumber,
      9,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serialNumber',
      serialNumber,
      r'''[\w+=/:,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SerialNumber'] = serialNumber;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'DeactivateMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeactivateMFADeviceRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the access key pair associated with the specified IAM user.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID signing the request. This operation works
  /// for access keys under the AWS account. Consequently, you can use this
  /// operation to manage AWS account root user credentials even if the AWS
  /// account has no associated users.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accessKeyId] :
  /// The access key ID for the access key ID and secret access key you want to
  /// delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [userName] :
  /// The name of the user whose access key pair you want to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteAccessKey({
    @_s.required String accessKeyId,
    String userName,
  }) async {
    ArgumentError.checkNotNull(accessKeyId, 'accessKeyId');
    _s.validateStringLength(
      'accessKeyId',
      accessKeyId,
      16,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessKeyId',
      accessKeyId,
      r'''[\w]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['AccessKeyId'] = accessKeyId;
    userName?.also((arg) => $request['UserName'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteAccessKey',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAccessKeyRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified AWS account alias. For information about using an
  /// AWS account alias, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html">Using
  /// an Alias for Your AWS Account ID</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountAlias] :
  /// The name of the account alias to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of lowercase letters, digits, and dashes. You cannot
  /// start or finish with a dash, nor can you have two dashes in a row.
  Future<void> deleteAccountAlias({
    @_s.required String accountAlias,
  }) async {
    ArgumentError.checkNotNull(accountAlias, 'accountAlias');
    _s.validateStringLength(
      'accountAlias',
      accountAlias,
      3,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountAlias',
      accountAlias,
      r'''^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AccountAlias'] = accountAlias;
    await _protocol.send(
      $request,
      action: 'DeleteAccountAlias',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteAccountAliasRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the password policy for the AWS account. There are no parameters.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  Future<void> deleteAccountPasswordPolicy() async {
    final $request = <String, dynamic>{};
    await _protocol.send(
      $request,
      action: 'DeleteAccountPasswordPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
    );
  }

  /// Deletes the specified IAM group. The group must not contain any users or
  /// have any attached policies.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [DeleteConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the IAM group to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteGroup({
    @_s.required String groupName,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    await _protocol.send(
      $request,
      action: 'DeleteGroup',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteGroupRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// group.
  ///
  /// A group can also have managed policies attached to it. To detach a managed
  /// policy from a group, use <a>DetachGroupPolicy</a>. For more information
  /// about policies, refer to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name (friendly name, not ARN) identifying the group that the policy is
  /// embedded in.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [policyName] :
  /// The name identifying the policy document to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteGroupPolicy({
    @_s.required String groupName,
    @_s.required String policyName,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    $request['PolicyName'] = policyName;
    await _protocol.send(
      $request,
      action: 'DeleteGroupPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteGroupPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified instance profile. The instance profile must not have
  /// an associated role.
  /// <important>
  /// Make sure that you do not have any Amazon EC2 instances running with the
  /// instance profile you are about to delete. Deleting a role or instance
  /// profile that is associated with a running instance will break any
  /// applications running on the instance.
  /// </important>
  /// For more information about instance profiles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
  /// Instance Profiles</a>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [DeleteConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the instance profile to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteInstanceProfile({
    @_s.required String instanceProfileName,
  }) async {
    ArgumentError.checkNotNull(instanceProfileName, 'instanceProfileName');
    _s.validateStringLength(
      'instanceProfileName',
      instanceProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceProfileName',
      instanceProfileName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    await _protocol.send(
      $request,
      action: 'DeleteInstanceProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteInstanceProfileRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the password for the specified IAM user, which terminates the
  /// user's ability to access AWS services through the AWS Management Console.
  /// <important>
  /// Deleting a user's password does not prevent a user from accessing AWS
  /// through the command line interface or the API. To prevent all user access,
  /// you must also either make any access keys inactive or delete them. For
  /// more information about making keys inactive or deleting them, see
  /// <a>UpdateAccessKey</a> and <a>DeleteAccessKey</a>.
  /// </important>
  ///
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user whose password you want to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteLoginProfile({
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'DeleteLoginProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteLoginProfileRequest'],
      shapes: shapes,
    );
  }

  /// Deletes an OpenID Connect identity provider (IdP) resource object in IAM.
  ///
  /// Deleting an IAM OIDC provider resource does not update any roles that
  /// reference the provider as a principal in their trust policies. Any attempt
  /// to assume a role that references a deleted provider fails.
  ///
  /// This operation is idempotent; it does not fail or return an error if you
  /// call the operation for a provider that does not exist.
  ///
  /// May throw [InvalidInputException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The Amazon Resource Name (ARN) of the IAM OpenID Connect provider resource
  /// object to delete. You can get a list of OpenID Connect provider resource
  /// ARNs by using the <a>ListOpenIDConnectProviders</a> operation.
  Future<void> deleteOpenIDConnectProvider({
    @_s.required String openIDConnectProviderArn,
  }) async {
    ArgumentError.checkNotNull(
        openIDConnectProviderArn, 'openIDConnectProviderArn');
    _s.validateStringLength(
      'openIDConnectProviderArn',
      openIDConnectProviderArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    await _protocol.send(
      $request,
      action: 'DeleteOpenIDConnectProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteOpenIDConnectProviderRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified managed policy.
  ///
  /// Before you can delete a managed policy, you must first detach the policy
  /// from all users, groups, and roles that it is attached to. In addition, you
  /// must delete all the policy's versions. The following steps describe the
  /// process for deleting a managed policy:
  ///
  /// <ul>
  /// <li>
  /// Detach the policy from all users, groups, and roles that the policy is
  /// attached to, using the <a>DetachUserPolicy</a>, <a>DetachGroupPolicy</a>,
  /// or <a>DetachRolePolicy</a> API operations. To list all the users, groups,
  /// and roles that a policy is attached to, use <a>ListEntitiesForPolicy</a>.
  /// </li>
  /// <li>
  /// Delete all versions of the policy using <a>DeletePolicyVersion</a>. To
  /// list the policy's versions, use <a>ListPolicyVersions</a>. You cannot use
  /// <a>DeletePolicyVersion</a> to delete the version that is marked as the
  /// default version. You delete the policy's default version in the next step
  /// of the process.
  /// </li>
  /// <li>
  /// Delete the policy (this automatically deletes the policy's default
  /// version) using this API.
  /// </li>
  /// </ul>
  /// For information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [DeleteConflictException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy you want to delete.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<void> deletePolicy({
    @_s.required String policyArn,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    await _protocol.send(
      $request,
      action: 'DeletePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeletePolicyRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified version from the specified managed policy.
  ///
  /// You cannot delete the default version from a policy using this API. To
  /// delete the default version from a policy, use <a>DeletePolicy</a>. To find
  /// out which version of a policy is marked as the default version, use
  /// <a>ListPolicyVersions</a>.
  ///
  /// For information about versions for managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [DeleteConflictException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy from which you want to
  /// delete a version.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [versionId] :
  /// The policy version to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consists of the lowercase letter 'v' followed by one or
  /// two digits, and optionally followed by a period '.' and a string of
  /// letters and digits.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  Future<void> deletePolicyVersion({
    @_s.required String policyArn,
    @_s.required String versionId,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''v[1-9][0-9]*(\.[A-Za-z0-9-]*)?''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['VersionId'] = versionId;
    await _protocol.send(
      $request,
      action: 'DeletePolicyVersion',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeletePolicyVersionRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified role. The role must not have any policies attached.
  /// For more information about roles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working
  /// with Roles</a>.
  /// <important>
  /// Make sure that you do not have any Amazon EC2 instances running with the
  /// role you are about to delete. Deleting a role or instance profile that is
  /// associated with a running instance will break any applications running on
  /// the instance.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [DeleteConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the role to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteRole({
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'DeleteRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteRoleRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the permissions boundary for the specified IAM role.
  /// <important>
  /// Deleting the permissions boundary for a role might increase its
  /// permissions. For example, it might allow anyone who assumes the role to
  /// perform all the actions granted in its permissions policies.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name (friendly name, not ARN) of the IAM role from which you want to
  /// remove the permissions boundary.
  Future<void> deleteRolePermissionsBoundary({
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'DeleteRolePermissionsBoundary',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteRolePermissionsBoundaryRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// role.
  ///
  /// A role can also have managed policies attached to it. To detach a managed
  /// policy from a role, use <a>DetachRolePolicy</a>. For more information
  /// about policies, refer to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the inline policy to delete from the specified IAM role.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [roleName] :
  /// The name (friendly name, not ARN) identifying the role that the policy is
  /// embedded in.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteRolePolicy({
    @_s.required String policyName,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyName'] = policyName;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'DeleteRolePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteRolePolicyRequest'],
      shapes: shapes,
    );
  }

  /// Deletes a SAML provider resource in IAM.
  ///
  /// Deleting the provider resource from IAM does not update any roles that
  /// reference the SAML provider resource's ARN as a principal in their trust
  /// policies. Any attempt to assume a role that references a non-existent
  /// provider resource ARN fails.
  /// <note>
  /// This operation requires <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sAMLProviderArn] :
  /// The Amazon Resource Name (ARN) of the SAML provider to delete.
  Future<void> deleteSAMLProvider({
    @_s.required String sAMLProviderArn,
  }) async {
    ArgumentError.checkNotNull(sAMLProviderArn, 'sAMLProviderArn');
    _s.validateStringLength(
      'sAMLProviderArn',
      sAMLProviderArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SAMLProviderArn'] = sAMLProviderArn;
    await _protocol.send(
      $request,
      action: 'DeleteSAMLProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSAMLProviderRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified SSH public key.
  ///
  /// The SSH public key deleted by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up AWS CodeCommit for SSH Connections</a> in the <i>AWS CodeCommit User
  /// Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  ///
  /// Parameter [sSHPublicKeyId] :
  /// The unique identifier for the SSH public key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user associated with the SSH public key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteSSHPublicKey({
    @_s.required String sSHPublicKeyId,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(sSHPublicKeyId, 'sSHPublicKeyId');
    _s.validateStringLength(
      'sSHPublicKeyId',
      sSHPublicKeyId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sSHPublicKeyId',
      sSHPublicKeyId,
      r'''[\w]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SSHPublicKeyId'] = sSHPublicKeyId;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'DeleteSSHPublicKey',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSSHPublicKeyRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified server certificate.
  ///
  /// For more information about working with server certificates, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with Server Certificates</a> in the <i>IAM User Guide</i>. This topic also
  /// includes a list of AWS services that can use the server certificates that
  /// you manage with IAM.
  /// <important>
  /// If you are using a server certificate with Elastic Load Balancing,
  /// deleting the certificate could have implications for your application. If
  /// Elastic Load Balancing doesn't detect the deletion of bound certificates,
  /// it may continue to use the certificates. This could cause Elastic Load
  /// Balancing to stop accepting traffic. We recommend that you remove the
  /// reference to the certificate from Elastic Load Balancing before using this
  /// command to delete the certificate. For more information, go to <a
  /// href="https://docs.aws.amazon.com/ElasticLoadBalancing/latest/APIReference/API_DeleteLoadBalancerListeners.html">DeleteLoadBalancerListeners</a>
  /// in the <i>Elastic Load Balancing API Reference</i>.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [DeleteConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serverCertificateName] :
  /// The name of the server certificate you want to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteServerCertificate({
    @_s.required String serverCertificateName,
  }) async {
    ArgumentError.checkNotNull(serverCertificateName, 'serverCertificateName');
    _s.validateStringLength(
      'serverCertificateName',
      serverCertificateName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverCertificateName',
      serverCertificateName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['ServerCertificateName'] = serverCertificateName;
    await _protocol.send(
      $request,
      action: 'DeleteServerCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteServerCertificateRequest'],
      shapes: shapes,
    );
  }

  /// Submits a service-linked role deletion request and returns a
  /// <code>DeletionTaskId</code>, which you can use to check the status of the
  /// deletion. Before you call this operation, confirm that the role has no
  /// active sessions and that any resources used by the role in the linked
  /// service are deleted. If you call this operation more than once for the
  /// same service-linked role and an earlier deletion task is not complete,
  /// then the <code>DeletionTaskId</code> of the earlier request is returned.
  ///
  /// If you submit a deletion request for a service-linked role whose linked
  /// service is still accessing a resource, then the deletion task fails. If it
  /// fails, the <a>GetServiceLinkedRoleDeletionStatus</a> API operation returns
  /// the reason for the failure, usually including the resources that must be
  /// deleted. To delete the service-linked role, you must first remove those
  /// resources from the linked service and then submit the deletion request
  /// again. Resources are specific to the service that is linked to the role.
  /// For more information about removing resources from a service, see the <a
  /// href="http://docs.aws.amazon.com/">AWS documentation</a> for your service.
  ///
  /// For more information about service-linked roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role">Roles
  /// Terms and Concepts: AWS Service-Linked Role</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the service-linked role to be deleted.
  Future<DeleteServiceLinkedRoleResponse> deleteServiceLinkedRole({
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteServiceLinkedRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteServiceLinkedRoleRequest'],
      shapes: shapes,
      resultWrapper: 'DeleteServiceLinkedRoleResult',
    );
    return DeleteServiceLinkedRoleResponse.fromXml($result);
  }

  /// Deletes the specified service-specific credential.
  ///
  /// May throw [NoSuchEntityException].
  ///
  /// Parameter [serviceSpecificCredentialId] :
  /// The unique identifier of the service-specific credential. You can get this
  /// value by calling <a>ListServiceSpecificCredentials</a>.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user associated with the service-specific credential.
  /// If this value is not specified, then the operation assumes the user whose
  /// credentials are used to call the operation.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteServiceSpecificCredential({
    @_s.required String serviceSpecificCredentialId,
    String userName,
  }) async {
    ArgumentError.checkNotNull(
        serviceSpecificCredentialId, 'serviceSpecificCredentialId');
    _s.validateStringLength(
      'serviceSpecificCredentialId',
      serviceSpecificCredentialId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceSpecificCredentialId',
      serviceSpecificCredentialId,
      r'''[\w]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['ServiceSpecificCredentialId'] = serviceSpecificCredentialId;
    userName?.also((arg) => $request['UserName'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteServiceSpecificCredential',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteServiceSpecificCredentialRequest'],
      shapes: shapes,
    );
  }

  /// Deletes a signing certificate associated with the specified IAM user.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID signing the request. This operation works
  /// for access keys under the AWS account. Consequently, you can use this
  /// operation to manage AWS account root user credentials even if the AWS
  /// account has no associated IAM users.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the signing certificate to delete.
  ///
  /// The format of this parameter, as described by its <a
  /// href="http://wikipedia.org/wiki/regex">regex</a> pattern, is a string of
  /// characters that can be upper- or lower-cased letters or digits.
  ///
  /// Parameter [userName] :
  /// The name of the user the signing certificate belongs to.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteSigningCertificate({
    @_s.required String certificateId,
    String userName,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      24,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''[\w]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['CertificateId'] = certificateId;
    userName?.also((arg) => $request['UserName'] = arg);
    await _protocol.send(
      $request,
      action: 'DeleteSigningCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteSigningCertificateRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified IAM user. Unlike the AWS Management Console, when
  /// you delete a user programmatically, you must delete the items attached to
  /// the user manually, or the deletion fails. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_deleting_cli">Deleting
  /// an IAM User</a>. Before attempting to delete a user, remove the following
  /// items:
  ///
  /// <ul>
  /// <li>
  /// Password (<a>DeleteLoginProfile</a>)
  /// </li>
  /// <li>
  /// Access keys (<a>DeleteAccessKey</a>)
  /// </li>
  /// <li>
  /// Signing certificate (<a>DeleteSigningCertificate</a>)
  /// </li>
  /// <li>
  /// SSH public key (<a>DeleteSSHPublicKey</a>)
  /// </li>
  /// <li>
  /// Git credentials (<a>DeleteServiceSpecificCredential</a>)
  /// </li>
  /// <li>
  /// Multi-factor authentication (MFA) device (<a>DeactivateMFADevice</a>,
  /// <a>DeleteVirtualMFADevice</a>)
  /// </li>
  /// <li>
  /// Inline policies (<a>DeleteUserPolicy</a>)
  /// </li>
  /// <li>
  /// Attached managed policies (<a>DetachUserPolicy</a>)
  /// </li>
  /// <li>
  /// Group memberships (<a>RemoveUserFromGroup</a>)
  /// </li>
  /// </ul>
  ///
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [DeleteConflictException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteUser({
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'DeleteUser',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteUserRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the permissions boundary for the specified IAM user.
  /// <important>
  /// Deleting the permissions boundary for a user might increase its
  /// permissions by allowing the user to perform all the actions granted in its
  /// permissions policies.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name (friendly name, not ARN) of the IAM user from which you want to
  /// remove the permissions boundary.
  Future<void> deleteUserPermissionsBoundary({
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'DeleteUserPermissionsBoundary',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteUserPermissionsBoundaryRequest'],
      shapes: shapes,
    );
  }

  /// Deletes the specified inline policy that is embedded in the specified IAM
  /// user.
  ///
  /// A user can also have managed policies attached to it. To detach a managed
  /// policy from a user, use <a>DetachUserPolicy</a>. For more information
  /// about policies, refer to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyName] :
  /// The name identifying the policy document to delete.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [userName] :
  /// The name (friendly name, not ARN) identifying the user that the policy is
  /// embedded in.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> deleteUserPolicy({
    @_s.required String policyName,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyName'] = policyName;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'DeleteUserPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteUserPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Deletes a virtual MFA device.
  /// <note>
  /// You must deactivate a user's virtual MFA device before you can delete it.
  /// For information about deactivating MFA devices, see
  /// <a>DeactivateMFADevice</a>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [DeleteConflictException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serialNumber] :
  /// The serial number that uniquely identifies the MFA device. For virtual MFA
  /// devices, the serial number is the same as the ARN.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: =,.@:/-
  Future<void> deleteVirtualMFADevice({
    @_s.required String serialNumber,
  }) async {
    ArgumentError.checkNotNull(serialNumber, 'serialNumber');
    _s.validateStringLength(
      'serialNumber',
      serialNumber,
      9,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serialNumber',
      serialNumber,
      r'''[\w+=/:,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SerialNumber'] = serialNumber;
    await _protocol.send(
      $request,
      action: 'DeleteVirtualMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteVirtualMFADeviceRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified managed policy from the specified IAM group.
  ///
  /// A group can also have inline policies embedded with it. To delete an
  /// inline policy, use the <a>DeleteGroupPolicy</a> API. For information about
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name (friendly name, not ARN) of the IAM group to detach the policy
  /// from.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy you want to detach.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<void> detachGroupPolicy({
    @_s.required String groupName,
    @_s.required String policyArn,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    $request['PolicyArn'] = policyArn;
    await _protocol.send(
      $request,
      action: 'DetachGroupPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetachGroupPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified managed policy from the specified role.
  ///
  /// A role can also have inline policies embedded with it. To delete an inline
  /// policy, use the <a>DeleteRolePolicy</a> API. For information about
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy you want to detach.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [roleName] :
  /// The name (friendly name, not ARN) of the IAM role to detach the policy
  /// from.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> detachRolePolicy({
    @_s.required String policyArn,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'DetachRolePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetachRolePolicyRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified managed policy from the specified user.
  ///
  /// A user can also have inline policies embedded with it. To delete an inline
  /// policy, use the <a>DeleteUserPolicy</a> API. For information about
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy you want to detach.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [userName] :
  /// The name (friendly name, not ARN) of the IAM user to detach the policy
  /// from.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> detachUserPolicy({
    @_s.required String policyArn,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'DetachUserPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DetachUserPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Enables the specified MFA device and associates it with the specified IAM
  /// user. When enabled, the MFA device is required for every subsequent login
  /// by the IAM user associated with the device.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [InvalidAuthenticationCodeException].
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [authenticationCode1] :
  /// An authentication code emitted by the device.
  ///
  /// The format for this parameter is a string of six digits.
  /// <important>
  /// Submit your request immediately after generating the authentication codes.
  /// If you generate the codes and then wait too long to submit the request,
  /// the MFA device successfully associates with the user but the MFA device
  /// becomes out of sync. This happens because time-based one-time passwords
  /// (TOTP) expire after a short period of time. If this happens, you can <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html">resync
  /// the device</a>.
  /// </important>
  ///
  /// Parameter [authenticationCode2] :
  /// A subsequent authentication code emitted by the device.
  ///
  /// The format for this parameter is a string of six digits.
  /// <important>
  /// Submit your request immediately after generating the authentication codes.
  /// If you generate the codes and then wait too long to submit the request,
  /// the MFA device successfully associates with the user but the MFA device
  /// becomes out of sync. This happens because time-based one-time passwords
  /// (TOTP) expire after a short period of time. If this happens, you can <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_sync.html">resync
  /// the device</a>.
  /// </important>
  ///
  /// Parameter [serialNumber] :
  /// The serial number that uniquely identifies the MFA device. For virtual MFA
  /// devices, the serial number is the device ARN.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: =,.@:/-
  ///
  /// Parameter [userName] :
  /// The name of the IAM user for whom you want to enable the MFA device.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> enableMFADevice({
    @_s.required String authenticationCode1,
    @_s.required String authenticationCode2,
    @_s.required String serialNumber,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(authenticationCode1, 'authenticationCode1');
    _s.validateStringLength(
      'authenticationCode1',
      authenticationCode1,
      6,
      6,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authenticationCode1',
      authenticationCode1,
      r'''[\d]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(authenticationCode2, 'authenticationCode2');
    _s.validateStringLength(
      'authenticationCode2',
      authenticationCode2,
      6,
      6,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authenticationCode2',
      authenticationCode2,
      r'''[\d]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serialNumber, 'serialNumber');
    _s.validateStringLength(
      'serialNumber',
      serialNumber,
      9,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serialNumber',
      serialNumber,
      r'''[\w+=/:,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AuthenticationCode1'] = authenticationCode1;
    $request['AuthenticationCode2'] = authenticationCode2;
    $request['SerialNumber'] = serialNumber;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'EnableMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['EnableMFADeviceRequest'],
      shapes: shapes,
    );
  }

  /// Generates a credential report for the AWS account. For more information
  /// about the credential report, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Getting
  /// Credential Reports</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  Future<GenerateCredentialReportResponse> generateCredentialReport() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GenerateCredentialReport',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'GenerateCredentialReportResult',
    );
    return GenerateCredentialReportResponse.fromXml($result);
  }

  /// Generates a report for service last accessed data for AWS Organizations.
  /// You can generate a report for any entities (organization root,
  /// organizational unit, or account) or policies in your organization.
  ///
  /// To call this operation, you must be signed in using your AWS Organizations
  /// master account credentials. You can use your long-term IAM user or root
  /// user credentials, or temporary credentials from assuming an IAM role. SCPs
  /// must be enabled for your organization root. You must have the required IAM
  /// and AWS Organizations permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Refining
  /// Permissions Using Service Last Accessed Data</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// You can generate a service last accessed data report for entities by
  /// specifying only the entity's path. This data includes a list of services
  /// that are allowed by any service control policies (SCPs) that apply to the
  /// entity.
  ///
  /// You can generate a service last accessed data report for a policy by
  /// specifying an entity's path and an optional AWS Organizations policy ID.
  /// This data includes a list of services that are allowed by the specified
  /// SCP.
  ///
  /// For each service in both report types, the data includes the most recent
  /// account activity that the policy allows to account principals in the
  /// entity or the entity's children. For important information about the data,
  /// reporting period, permissions required, troubleshooting, and supported
  /// Regions see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing
  /// Permissions Using Service Last Accessed Data</a> in the <i>IAM User
  /// Guide</i>.
  /// <important>
  /// The data includes all attempts to access AWS, not just the successful
  /// ones. This includes all attempts that were made using the AWS Management
  /// Console, the AWS API through any of the SDKs, or any of the command line
  /// tools. An unexpected entry in the service last accessed data does not mean
  /// that an account has been compromised, because the request might have been
  /// denied. Refer to your CloudTrail logs as the authoritative source for
  /// information about all API calls and whether they were successful or denied
  /// access. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html">Logging
  /// IAM Events with CloudTrail</a> in the <i>IAM User Guide</i>.
  /// </important>
  /// This operation returns a <code>JobId</code>. Use this parameter in the
  /// <code> <a>GetOrganizationsAccessReport</a> </code> operation to check the
  /// status of the report generation. To check the status of this request, use
  /// the <code>JobId</code> parameter in the <code>
  /// <a>GetOrganizationsAccessReport</a> </code> operation and test the
  /// <code>JobStatus</code> response parameter. When the job is complete, you
  /// can retrieve the report.
  ///
  /// To generate a service last accessed data report for entities, specify an
  /// entity path without specifying the optional AWS Organizations policy ID.
  /// The type of entity that you specify determines the data returned in the
  /// report.
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> – When you specify the organizations root as the entity, the
  /// resulting report lists all of the services allowed by SCPs that are
  /// attached to your root. For each service, the report includes data for all
  /// accounts in your organization except the master account, because the
  /// master account is not limited by SCPs.
  /// </li>
  /// <li>
  /// <b>OU</b> – When you specify an organizational unit (OU) as the entity,
  /// the resulting report lists all of the services allowed by SCPs that are
  /// attached to the OU and its parents. For each service, the report includes
  /// data for all accounts in the OU or its children. This data excludes the
  /// master account, because the master account is not limited by SCPs.
  /// </li>
  /// <li>
  /// <b>Master account</b> – When you specify the master account, the resulting
  /// report lists all AWS services, because the master account is not limited
  /// by SCPs. For each service, the report includes data for only the master
  /// account.
  /// </li>
  /// <li>
  /// <b>Account</b> – When you specify another account as the entity, the
  /// resulting report lists all of the services allowed by SCPs that are
  /// attached to the account and its parents. For each service, the report
  /// includes data for only the specified account.
  /// </li>
  /// </ul>
  /// To generate a service last accessed data report for policies, specify an
  /// entity path and the optional AWS Organizations policy ID. The type of
  /// entity that you specify determines the data returned for each service.
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> – When you specify the root entity and a policy ID, the
  /// resulting report lists all of the services that are allowed by the
  /// specified SCP. For each service, the report includes data for all accounts
  /// in your organization to which the SCP applies. This data excludes the
  /// master account, because the master account is not limited by SCPs. If the
  /// SCP is not attached to any entities in the organization, then the report
  /// will return a list of services with no data.
  /// </li>
  /// <li>
  /// <b>OU</b> – When you specify an OU entity and a policy ID, the resulting
  /// report lists all of the services that are allowed by the specified SCP.
  /// For each service, the report includes data for all accounts in the OU or
  /// its children to which the SCP applies. This means that other accounts
  /// outside the OU that are affected by the SCP might not be included in the
  /// data. This data excludes the master account, because the master account is
  /// not limited by SCPs. If the SCP is not attached to the OU or one of its
  /// children, the report will return a list of services with no data.
  /// </li>
  /// <li>
  /// <b>Master account</b> – When you specify the master account, the resulting
  /// report lists all AWS services, because the master account is not limited
  /// by SCPs. If you specify a policy ID in the CLI or API, the policy is
  /// ignored. For each service, the report includes data for only the master
  /// account.
  /// </li>
  /// <li>
  /// <b>Account</b> – When you specify another account entity and a policy ID,
  /// the resulting report lists all of the services that are allowed by the
  /// specified SCP. For each service, the report includes data for only the
  /// specified account. This means that other accounts in the organization that
  /// are affected by the SCP might not be included in the data. If the SCP is
  /// not attached to the account, the report will return a list of services
  /// with no data.
  /// </li>
  /// </ul> <note>
  /// Service last accessed data does not use other policy types when
  /// determining whether a principal could access a service. These other policy
  /// types include identity-based policies, resource-based policies, access
  /// control lists, IAM permissions boundaries, and STS assume role policies.
  /// It only applies SCP logic. For more about the evaluation of policy types,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// Policies</a> in the <i>IAM User Guide</i>.
  /// </note>
  /// For more information about service last accessed data, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing
  /// Policy Scope by Viewing User Activity</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [ReportGenerationLimitExceededException].
  ///
  /// Parameter [entityPath] :
  /// The path of the AWS Organizations entity (root, OU, or account). You can
  /// build an entity path using the known structure of your organization. For
  /// example, assume that your account ID is <code>123456789012</code> and its
  /// parent OU ID is <code>ou-rge0-awsabcde</code>. The organization root ID is
  /// <code>r-f6g7h8i9j0example</code> and your organization ID is
  /// <code>o-a1b2c3d4e5</code>. Your entity path is
  /// <code>o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-rge0-awsabcde/123456789012</code>.
  ///
  /// Parameter [organizationsPolicyId] :
  /// The identifier of the AWS Organizations service control policy (SCP). This
  /// parameter is optional.
  ///
  /// This ID is used to generate information about when an account principal
  /// that is limited by the SCP attempted to access an AWS service.
  Future<GenerateOrganizationsAccessReportResponse>
      generateOrganizationsAccessReport({
    @_s.required String entityPath,
    String organizationsPolicyId,
  }) async {
    ArgumentError.checkNotNull(entityPath, 'entityPath');
    _s.validateStringLength(
      'entityPath',
      entityPath,
      19,
      427,
      isRequired: true,
    );
    _s.validateStringPattern(
      'entityPath',
      entityPath,
      r'''^o-[0-9a-z]{10,32}\/r-[0-9a-z]{4,32}[0-9a-z-\/]*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationsPolicyId',
      organizationsPolicyId,
      r'''^p-[0-9a-zA-Z_]{8,128}$''',
    );
    final $request = <String, dynamic>{};
    $request['EntityPath'] = entityPath;
    organizationsPolicyId
        ?.also((arg) => $request['OrganizationsPolicyId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GenerateOrganizationsAccessReport',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GenerateOrganizationsAccessReportRequest'],
      shapes: shapes,
      resultWrapper: 'GenerateOrganizationsAccessReportResult',
    );
    return GenerateOrganizationsAccessReportResponse.fromXml($result);
  }

  /// Generates a report that includes details about when an IAM resource (user,
  /// group, role, or policy) was last used in an attempt to access AWS
  /// services. Recent activity usually appears within four hours. IAM reports
  /// activity for the last 365 days, or less if your Region began supporting
  /// this feature within the last year. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
  /// Where Data Is Tracked</a>.
  /// <important>
  /// The service last accessed data includes all attempts to access an AWS API,
  /// not just the successful ones. This includes all attempts that were made
  /// using the AWS Management Console, the AWS API through any of the SDKs, or
  /// any of the command line tools. An unexpected entry in the service last
  /// accessed data does not mean that your account has been compromised,
  /// because the request might have been denied. Refer to your CloudTrail logs
  /// as the authoritative source for information about all API calls and
  /// whether they were successful or denied access. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html">Logging
  /// IAM Events with CloudTrail</a> in the <i>IAM User Guide</i>.
  /// </important>
  /// The <code>GenerateServiceLastAccessedDetails</code> operation returns a
  /// <code>JobId</code>. Use this parameter in the following operations to
  /// retrieve the following details from your report:
  ///
  /// <ul>
  /// <li>
  /// <a>GetServiceLastAccessedDetails</a> – Use this operation for users,
  /// groups, roles, or policies to list every AWS service that the resource
  /// could access using permissions policies. For each service, the response
  /// includes information about the most recent access attempt.
  ///
  /// The <code>JobId</code> returned by
  /// <code>GenerateServiceLastAccessedDetail</code> must be used by the same
  /// role within a session, or by the same user when used to call
  /// <code>GetServiceLastAccessedDetail</code>.
  /// </li>
  /// <li>
  /// <a>GetServiceLastAccessedDetailsWithEntities</a> – Use this operation for
  /// groups and policies to list information about the associated entities
  /// (users or roles) that attempted to access a specific AWS service.
  /// </li>
  /// </ul>
  /// To check the status of the <code>GenerateServiceLastAccessedDetails</code>
  /// request, use the <code>JobId</code> parameter in the same operations and
  /// test the <code>JobStatus</code> response parameter.
  ///
  /// For additional information about the permissions policies that allow an
  /// identity (user, group, or role) to access specific services, use the
  /// <a>ListPoliciesGrantingServiceAccess</a> operation.
  /// <note>
  /// Service last accessed data does not use other policy types when
  /// determining whether a resource could access a service. These other policy
  /// types include resource-based policies, access control lists, AWS
  /// Organizations policies, IAM permissions boundaries, and AWS STS assume
  /// role policies. It only applies permissions policy logic. For more about
  /// the evaluation of policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// Policies</a> in the <i>IAM User Guide</i>.
  /// </note>
  /// For more information about service and action last accessed data, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing
  /// Permissions Using Service Last Accessed Data</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [arn] :
  /// The ARN of the IAM resource (user, group, role, or managed policy) used to
  /// generate information about when the resource was last used in an attempt
  /// to access an AWS service.
  ///
  /// Parameter [granularity] :
  /// The level of detail that you want to generate. You can specify whether you
  /// want to generate information about the last attempt to access services or
  /// actions. If you specify service-level granularity, this operation
  /// generates only service data. If you specify action-level granularity, it
  /// generates service and action data. If you don't include this optional
  /// parameter, the operation generates service data.
  Future<GenerateServiceLastAccessedDetailsResponse>
      generateServiceLastAccessedDetails({
    @_s.required String arn,
    AccessAdvisorUsageGranularityType granularity,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Arn'] = arn;
    granularity?.also((arg) => $request['Granularity'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'GenerateServiceLastAccessedDetails',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GenerateServiceLastAccessedDetailsRequest'],
      shapes: shapes,
      resultWrapper: 'GenerateServiceLastAccessedDetailsResult',
    );
    return GenerateServiceLastAccessedDetailsResponse.fromXml($result);
  }

  /// Retrieves information about when the specified access key was last used.
  /// The information includes the date and time of last use, along with the AWS
  /// service and Region that were specified in the last request made with that
  /// key.
  ///
  /// Parameter [accessKeyId] :
  /// The identifier of an access key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  Future<GetAccessKeyLastUsedResponse> getAccessKeyLastUsed({
    @_s.required String accessKeyId,
  }) async {
    ArgumentError.checkNotNull(accessKeyId, 'accessKeyId');
    _s.validateStringLength(
      'accessKeyId',
      accessKeyId,
      16,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessKeyId',
      accessKeyId,
      r'''[\w]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AccessKeyId'] = accessKeyId;
    final $result = await _protocol.send(
      $request,
      action: 'GetAccessKeyLastUsed',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetAccessKeyLastUsedRequest'],
      shapes: shapes,
      resultWrapper: 'GetAccessKeyLastUsedResult',
    );
    return GetAccessKeyLastUsedResponse.fromXml($result);
  }

  /// Retrieves information about all IAM users, groups, roles, and policies in
  /// your AWS account, including their relationships to one another. Use this
  /// API to obtain a snapshot of the configuration of IAM permissions (users,
  /// groups, roles, and policies) in your account.
  /// <note>
  /// Policies returned by this API are URL-encoded compliant with <a
  /// href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of
  /// the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  /// </note>
  /// You can optionally filter the results using the <code>Filter</code>
  /// parameter. You can paginate the results using the <code>MaxItems</code>
  /// and <code>Marker</code> parameters.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [filter] :
  /// A list of entity types used to filter the results. Only the entities that
  /// match the types you specify are included in the output. Use the value
  /// <code>LocalManagedPolicy</code> to include customer managed policies.
  ///
  /// The format for this parameter is a comma-separated (if more than one) list
  /// of strings. Each string value in the list must be one of the valid values
  /// listed below.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<GetAccountAuthorizationDetailsResponse>
      getAccountAuthorizationDetails({
    List<EntityType> filter,
    String marker,
    int maxItems,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    filter?.also((arg) =>
        $request['Filter'] = arg.map((e) => e?.toValue() ?? '').toList());
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetAccountAuthorizationDetails',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetAccountAuthorizationDetailsRequest'],
      shapes: shapes,
      resultWrapper: 'GetAccountAuthorizationDetailsResult',
    );
    return GetAccountAuthorizationDetailsResponse.fromXml($result);
  }

  /// Retrieves the password policy for the AWS account. For more information
  /// about using a password policy, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html">Managing
  /// an IAM Password Policy</a>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  Future<GetAccountPasswordPolicyResponse> getAccountPasswordPolicy() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetAccountPasswordPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'GetAccountPasswordPolicyResult',
    );
    return GetAccountPasswordPolicyResponse.fromXml($result);
  }

  /// Retrieves information about IAM entity usage and IAM quotas in the AWS
  /// account.
  ///
  /// The number and size of IAM resources in an AWS account are limited. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS Quotas</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [ServiceFailureException].
  Future<GetAccountSummaryResponse> getAccountSummary() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetAccountSummary',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'GetAccountSummaryResult',
    );
    return GetAccountSummaryResponse.fromXml($result);
  }

  /// Gets a list of all of the context keys referenced in the input policies.
  /// The policies are supplied as a list of one or more strings. To get the
  /// context keys from policies associated with an IAM user, group, or role,
  /// use <a>GetContextKeysForPrincipalPolicy</a>.
  ///
  /// Context keys are variables maintained by AWS and its services that provide
  /// details about the context of an API query request. Context keys can be
  /// evaluated by testing against a value specified in an IAM policy. Use
  /// <code>GetContextKeysForCustomPolicy</code> to understand what key names
  /// and values you must supply when you call <a>SimulateCustomPolicy</a>. Note
  /// that all parameters are shown in unencoded form here for clarity but must
  /// be URL encoded to be included as a part of a real HTML request.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [policyInputList] :
  /// A list of policies for which you want the list of context keys referenced
  /// in those policies. Each document is specified as a string containing the
  /// complete, valid JSON text of an IAM policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  Future<GetContextKeysForPolicyResponse> getContextKeysForCustomPolicy({
    @_s.required List<String> policyInputList,
  }) async {
    ArgumentError.checkNotNull(policyInputList, 'policyInputList');
    final $request = <String, dynamic>{};
    $request['PolicyInputList'] = policyInputList;
    final $result = await _protocol.send(
      $request,
      action: 'GetContextKeysForCustomPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetContextKeysForCustomPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'GetContextKeysForCustomPolicyResult',
    );
    return GetContextKeysForPolicyResponse.fromXml($result);
  }

  /// Gets a list of all of the context keys referenced in all the IAM policies
  /// that are attached to the specified IAM entity. The entity can be an IAM
  /// user, group, or role. If you specify a user, then the request also
  /// includes all of the policies attached to groups that the user is a member
  /// of.
  ///
  /// You can optionally include a list of one or more additional policies,
  /// specified as strings. If you want to include <i>only</i> a list of
  /// policies by string, use <a>GetContextKeysForCustomPolicy</a> instead.
  ///
  /// <b>Note:</b> This API discloses information about the permissions granted
  /// to other users. If you do not want users to see other user's permissions,
  /// then consider allowing them to use <a>GetContextKeysForCustomPolicy</a>
  /// instead.
  ///
  /// Context keys are variables maintained by AWS and its services that provide
  /// details about the context of an API query request. Context keys can be
  /// evaluated by testing against a value in an IAM policy. Use
  /// <a>GetContextKeysForPrincipalPolicy</a> to understand what key names and
  /// values you must supply when you call <a>SimulatePrincipalPolicy</a>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [policySourceArn] :
  /// The ARN of a user, group, or role whose policies contain the context keys
  /// that you want listed. If you specify a user, the list includes context
  /// keys that are found in all policies that are attached to the user. The
  /// list also includes all groups that the user is a member of. If you pick a
  /// group or a role, then it includes only those context keys that are found
  /// in policies attached to that entity. Note that all parameters are shown in
  /// unencoded form here for clarity, but must be URL encoded to be included as
  /// a part of a real HTML request.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [policyInputList] :
  /// An optional list of additional policies for which you want the list of
  /// context keys that are referenced.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  Future<GetContextKeysForPolicyResponse> getContextKeysForPrincipalPolicy({
    @_s.required String policySourceArn,
    List<String> policyInputList,
  }) async {
    ArgumentError.checkNotNull(policySourceArn, 'policySourceArn');
    _s.validateStringLength(
      'policySourceArn',
      policySourceArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicySourceArn'] = policySourceArn;
    policyInputList?.also((arg) => $request['PolicyInputList'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetContextKeysForPrincipalPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetContextKeysForPrincipalPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'GetContextKeysForPrincipalPolicyResult',
    );
    return GetContextKeysForPolicyResponse.fromXml($result);
  }

  /// Retrieves a credential report for the AWS account. For more information
  /// about the credential report, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Getting
  /// Credential Reports</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [CredentialReportNotPresentException].
  /// May throw [CredentialReportExpiredException].
  /// May throw [CredentialReportNotReadyException].
  /// May throw [ServiceFailureException].
  Future<GetCredentialReportResponse> getCredentialReport() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetCredentialReport',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
      resultWrapper: 'GetCredentialReportResult',
    );
    return GetCredentialReportResponse.fromXml($result);
  }

  /// Returns a list of IAM users that are in the specified IAM group. You can
  /// paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the group.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<GetGroupResponse> getGroup({
    @_s.required String groupName,
    String marker,
    int maxItems,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetGroup',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetGroupRequest'],
      shapes: shapes,
      resultWrapper: 'GetGroupResult',
    );
    return GetGroupResponse.fromXml($result);
  }

  /// Retrieves the specified inline policy document that is embedded in the
  /// specified IAM group.
  /// <note>
  /// Policies returned by this API are URL-encoded compliant with <a
  /// href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of
  /// the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  /// </note>
  /// An IAM group can also have managed policies attached to it. To retrieve a
  /// managed policy document that is attached to a group, use <a>GetPolicy</a>
  /// to determine the policy's default version, then use
  /// <a>GetPolicyVersion</a> to retrieve the policy document.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the group the policy is associated with.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [policyName] :
  /// The name of the policy document to get.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetGroupPolicyResponse> getGroupPolicy({
    @_s.required String groupName,
    @_s.required String policyName,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    $request['PolicyName'] = policyName;
    final $result = await _protocol.send(
      $request,
      action: 'GetGroupPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetGroupPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'GetGroupPolicyResult',
    );
    return GetGroupPolicyResponse.fromXml($result);
  }

  /// Retrieves information about the specified instance profile, including the
  /// instance profile's path, GUID, ARN, and role. For more information about
  /// instance profiles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
  /// Instance Profiles</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the instance profile to get information about.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetInstanceProfileResponse> getInstanceProfile({
    @_s.required String instanceProfileName,
  }) async {
    ArgumentError.checkNotNull(instanceProfileName, 'instanceProfileName');
    _s.validateStringLength(
      'instanceProfileName',
      instanceProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceProfileName',
      instanceProfileName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    final $result = await _protocol.send(
      $request,
      action: 'GetInstanceProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetInstanceProfileRequest'],
      shapes: shapes,
      resultWrapper: 'GetInstanceProfileResult',
    );
    return GetInstanceProfileResponse.fromXml($result);
  }

  /// Retrieves the user name and password-creation date for the specified IAM
  /// user. If the user has not been assigned a password, the operation returns
  /// a 404 (<code>NoSuchEntity</code>) error.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user whose login profile you want to retrieve.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetLoginProfileResponse> getLoginProfile({
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    final $result = await _protocol.send(
      $request,
      action: 'GetLoginProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetLoginProfileRequest'],
      shapes: shapes,
      resultWrapper: 'GetLoginProfileResult',
    );
    return GetLoginProfileResponse.fromXml($result);
  }

  /// Returns information about the specified OpenID Connect (OIDC) provider
  /// resource object in IAM.
  ///
  /// May throw [InvalidInputException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The Amazon Resource Name (ARN) of the OIDC provider resource object in IAM
  /// to get information for. You can get a list of OIDC provider resource ARNs
  /// by using the <a>ListOpenIDConnectProviders</a> operation.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<GetOpenIDConnectProviderResponse> getOpenIDConnectProvider({
    @_s.required String openIDConnectProviderArn,
  }) async {
    ArgumentError.checkNotNull(
        openIDConnectProviderArn, 'openIDConnectProviderArn');
    _s.validateStringLength(
      'openIDConnectProviderArn',
      openIDConnectProviderArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetOpenIDConnectProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetOpenIDConnectProviderRequest'],
      shapes: shapes,
      resultWrapper: 'GetOpenIDConnectProviderResult',
    );
    return GetOpenIDConnectProviderResponse.fromXml($result);
  }

  /// Retrieves the service last accessed data report for AWS Organizations that
  /// was previously generated using the <code>
  /// <a>GenerateOrganizationsAccessReport</a> </code> operation. This operation
  /// retrieves the status of your report job and the report contents.
  ///
  /// Depending on the parameters that you passed when you generated the report,
  /// the data returned could include different information. For details, see
  /// <a>GenerateOrganizationsAccessReport</a>.
  ///
  /// To call this operation, you must be signed in to the master account in
  /// your organization. SCPs must be enabled for your organization root. You
  /// must have permissions to perform this operation. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Refining
  /// Permissions Using Service Last Accessed Data</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// For each service that principals in an account (root users, IAM users, or
  /// IAM roles) could access using SCPs, the operation returns details about
  /// the most recent access attempt. If there was no attempt, the service is
  /// listed without details about the most recent attempt to access the
  /// service. If the operation fails, it returns the reason that it failed.
  ///
  /// By default, the list is sorted by service namespace.
  ///
  /// May throw [NoSuchEntityException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the request generated by the
  /// <a>GenerateOrganizationsAccessReport</a> operation.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [sortKey] :
  /// The key that is used to sort the results. If you choose the namespace key,
  /// the results are returned in alphabetical order. If you choose the time
  /// key, the results are sorted numerically by the date and time.
  Future<GetOrganizationsAccessReportResponse> getOrganizationsAccessReport({
    @_s.required String jobId,
    String marker,
    int maxItems,
    SortKeyType sortKey,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['JobId'] = jobId;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    sortKey?.also((arg) => $request['SortKey'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'GetOrganizationsAccessReport',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetOrganizationsAccessReportRequest'],
      shapes: shapes,
      resultWrapper: 'GetOrganizationsAccessReportResult',
    );
    return GetOrganizationsAccessReportResponse.fromXml($result);
  }

  /// Retrieves information about the specified managed policy, including the
  /// policy's default version and the total number of IAM users, groups, and
  /// roles to which the policy is attached. To retrieve the list of the
  /// specific users, groups, and roles that the policy is attached to, use the
  /// <a>ListEntitiesForPolicy</a> API. This API returns metadata about the
  /// policy. To retrieve the actual policy document for a specific version of
  /// the policy, use <a>GetPolicyVersion</a>.
  ///
  /// This API retrieves information about managed policies. To retrieve
  /// information about an inline policy that is embedded with an IAM user,
  /// group, or role, use the <a>GetUserPolicy</a>, <a>GetGroupPolicy</a>, or
  /// <a>GetRolePolicy</a> API.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the managed policy that you want
  /// information about.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<GetPolicyResponse> getPolicy({
    @_s.required String policyArn,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'GetPolicyResult',
    );
    return GetPolicyResponse.fromXml($result);
  }

  /// Retrieves information about the specified version of the specified managed
  /// policy, including the policy document.
  /// <note>
  /// Policies returned by this API are URL-encoded compliant with <a
  /// href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of
  /// the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  /// </note>
  /// To list the available versions for a policy, use
  /// <a>ListPolicyVersions</a>.
  ///
  /// This API retrieves information about managed policies. To retrieve
  /// information about an inline policy that is embedded in a user, group, or
  /// role, use the <a>GetUserPolicy</a>, <a>GetGroupPolicy</a>, or
  /// <a>GetRolePolicy</a> API.
  ///
  /// For more information about the types of policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the managed policy that you want
  /// information about.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [versionId] :
  /// Identifies the policy version to retrieve.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consists of the lowercase letter 'v' followed by one or
  /// two digits, and optionally followed by a period '.' and a string of
  /// letters and digits.
  Future<GetPolicyVersionResponse> getPolicyVersion({
    @_s.required String policyArn,
    @_s.required String versionId,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''v[1-9][0-9]*(\.[A-Za-z0-9-]*)?''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['VersionId'] = versionId;
    final $result = await _protocol.send(
      $request,
      action: 'GetPolicyVersion',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetPolicyVersionRequest'],
      shapes: shapes,
      resultWrapper: 'GetPolicyVersionResult',
    );
    return GetPolicyVersionResponse.fromXml($result);
  }

  /// Retrieves information about the specified role, including the role's path,
  /// GUID, ARN, and the role's trust policy that grants permission to assume
  /// the role. For more information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working
  /// with Roles</a>.
  /// <note>
  /// Policies returned by this API are URL-encoded compliant with <a
  /// href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of
  /// the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the IAM role to get information about.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetRoleResponse> getRole({
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    final $result = await _protocol.send(
      $request,
      action: 'GetRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetRoleRequest'],
      shapes: shapes,
      resultWrapper: 'GetRoleResult',
    );
    return GetRoleResponse.fromXml($result);
  }

  /// Retrieves the specified inline policy document that is embedded with the
  /// specified IAM role.
  /// <note>
  /// Policies returned by this API are URL-encoded compliant with <a
  /// href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of
  /// the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  /// </note>
  /// An IAM role can also have managed policies attached to it. To retrieve a
  /// managed policy document that is attached to a role, use <a>GetPolicy</a>
  /// to determine the policy's default version, then use
  /// <a>GetPolicyVersion</a> to retrieve the policy document.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">Using
  /// Roles to Delegate Permissions and Federate Identities</a>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy document to get.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [roleName] :
  /// The name of the role associated with the policy.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetRolePolicyResponse> getRolePolicy({
    @_s.required String policyName,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyName'] = policyName;
    $request['RoleName'] = roleName;
    final $result = await _protocol.send(
      $request,
      action: 'GetRolePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetRolePolicyRequest'],
      shapes: shapes,
      resultWrapper: 'GetRolePolicyResult',
    );
    return GetRolePolicyResponse.fromXml($result);
  }

  /// Returns the SAML provider metadocument that was uploaded when the IAM SAML
  /// provider resource object was created or updated.
  /// <note>
  /// This operation requires <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sAMLProviderArn] :
  /// The Amazon Resource Name (ARN) of the SAML provider resource object in IAM
  /// to get information about.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<GetSAMLProviderResponse> getSAMLProvider({
    @_s.required String sAMLProviderArn,
  }) async {
    ArgumentError.checkNotNull(sAMLProviderArn, 'sAMLProviderArn');
    _s.validateStringLength(
      'sAMLProviderArn',
      sAMLProviderArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SAMLProviderArn'] = sAMLProviderArn;
    final $result = await _protocol.send(
      $request,
      action: 'GetSAMLProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetSAMLProviderRequest'],
      shapes: shapes,
      resultWrapper: 'GetSAMLProviderResult',
    );
    return GetSAMLProviderResponse.fromXml($result);
  }

  /// Retrieves the specified SSH public key, including metadata about the key.
  ///
  /// The SSH public key retrieved by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up AWS CodeCommit for SSH Connections</a> in the <i>AWS CodeCommit User
  /// Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [UnrecognizedPublicKeyEncodingException].
  ///
  /// Parameter [encoding] :
  /// Specifies the public key encoding format to use in the response. To
  /// retrieve the public key in ssh-rsa format, use <code>SSH</code>. To
  /// retrieve the public key in PEM format, use <code>PEM</code>.
  ///
  /// Parameter [sSHPublicKeyId] :
  /// The unique identifier for the SSH public key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user associated with the SSH public key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetSSHPublicKeyResponse> getSSHPublicKey({
    @_s.required EncodingType encoding,
    @_s.required String sSHPublicKeyId,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(encoding, 'encoding');
    ArgumentError.checkNotNull(sSHPublicKeyId, 'sSHPublicKeyId');
    _s.validateStringLength(
      'sSHPublicKeyId',
      sSHPublicKeyId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sSHPublicKeyId',
      sSHPublicKeyId,
      r'''[\w]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Encoding'] = encoding.toValue();
    $request['SSHPublicKeyId'] = sSHPublicKeyId;
    $request['UserName'] = userName;
    final $result = await _protocol.send(
      $request,
      action: 'GetSSHPublicKey',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetSSHPublicKeyRequest'],
      shapes: shapes,
      resultWrapper: 'GetSSHPublicKeyResult',
    );
    return GetSSHPublicKeyResponse.fromXml($result);
  }

  /// Retrieves information about the specified server certificate stored in
  /// IAM.
  ///
  /// For more information about working with server certificates, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with Server Certificates</a> in the <i>IAM User Guide</i>. This topic
  /// includes a list of AWS services that can use the server certificates that
  /// you manage with IAM.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serverCertificateName] :
  /// The name of the server certificate you want to retrieve information about.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetServerCertificateResponse> getServerCertificate({
    @_s.required String serverCertificateName,
  }) async {
    ArgumentError.checkNotNull(serverCertificateName, 'serverCertificateName');
    _s.validateStringLength(
      'serverCertificateName',
      serverCertificateName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverCertificateName',
      serverCertificateName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['ServerCertificateName'] = serverCertificateName;
    final $result = await _protocol.send(
      $request,
      action: 'GetServerCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetServerCertificateRequest'],
      shapes: shapes,
      resultWrapper: 'GetServerCertificateResult',
    );
    return GetServerCertificateResponse.fromXml($result);
  }

  /// Retrieves a service last accessed report that was created using the
  /// <code>GenerateServiceLastAccessedDetails</code> operation. You can use the
  /// <code>JobId</code> parameter in <code>GetServiceLastAccessedDetails</code>
  /// to retrieve the status of your report job. When the report is complete,
  /// you can retrieve the generated report. The report includes a list of AWS
  /// services that the resource (user, group, role, or managed policy) can
  /// access.
  /// <note>
  /// Service last accessed data does not use other policy types when
  /// determining whether a resource could access a service. These other policy
  /// types include resource-based policies, access control lists, AWS
  /// Organizations policies, IAM permissions boundaries, and AWS STS assume
  /// role policies. It only applies permissions policy logic. For more about
  /// the evaluation of policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// Policies</a> in the <i>IAM User Guide</i>.
  /// </note>
  /// For each service that the resource could access using permissions
  /// policies, the operation returns details about the most recent access
  /// attempt. If there was no attempt, the service is listed without details
  /// about the most recent attempt to access the service. If the operation
  /// fails, the <code>GetServiceLastAccessedDetails</code> operation returns
  /// the reason that it failed.
  ///
  /// The <code>GetServiceLastAccessedDetails</code> operation returns a list of
  /// services. This list includes the number of entities that have attempted to
  /// access the service and the date and time of the last attempt. It also
  /// returns the ARN of the following entity, depending on the resource ARN
  /// that you used to generate the report:
  ///
  /// <ul>
  /// <li>
  /// <b>User</b> – Returns the user ARN that you used to generate the report
  /// </li>
  /// <li>
  /// <b>Group</b> – Returns the ARN of the group member (user) that last
  /// attempted to access the service
  /// </li>
  /// <li>
  /// <b>Role</b> – Returns the role ARN that you used to generate the report
  /// </li>
  /// <li>
  /// <b>Policy</b> – Returns the ARN of the user or role that last used the
  /// policy to attempt to access the service
  /// </li>
  /// </ul>
  /// By default, the list is sorted by service namespace.
  ///
  /// If you specified <code>ACTION_LEVEL</code> granularity when you generated
  /// the report, this operation returns service and action last accessed data.
  /// This includes the most recent access attempt for each tracked action
  /// within a service. Otherwise, this operation returns only service data.
  ///
  /// For more information about service and action last accessed data, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing
  /// Permissions Using Service Last Accessed Data</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [jobId] :
  /// The ID of the request generated by the
  /// <a>GenerateServiceLastAccessedDetails</a> operation. The
  /// <code>JobId</code> returned by
  /// <code>GenerateServiceLastAccessedDetail</code> must be used by the same
  /// role within a session, or by the same user when used to call
  /// <code>GetServiceLastAccessedDetail</code>.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<GetServiceLastAccessedDetailsResponse> getServiceLastAccessedDetails({
    @_s.required String jobId,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['JobId'] = jobId;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetServiceLastAccessedDetails',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetServiceLastAccessedDetailsRequest'],
      shapes: shapes,
      resultWrapper: 'GetServiceLastAccessedDetailsResult',
    );
    return GetServiceLastAccessedDetailsResponse.fromXml($result);
  }

  /// After you generate a group or policy report using the
  /// <code>GenerateServiceLastAccessedDetails</code> operation, you can use the
  /// <code>JobId</code> parameter in
  /// <code>GetServiceLastAccessedDetailsWithEntities</code>. This operation
  /// retrieves the status of your report job and a list of entities that could
  /// have used group or policy permissions to access the specified service.
  ///
  /// <ul>
  /// <li>
  /// <b>Group</b> – For a group report, this operation returns a list of users
  /// in the group that could have used the group’s policies in an attempt to
  /// access the service.
  /// </li>
  /// <li>
  /// <b>Policy</b> – For a policy report, this operation returns a list of
  /// entities (users or roles) that could have used the policy in an attempt to
  /// access the service.
  /// </li>
  /// </ul>
  /// You can also use this operation for user or role reports to retrieve
  /// details about those entities.
  ///
  /// If the operation fails, the
  /// <code>GetServiceLastAccessedDetailsWithEntities</code> operation returns
  /// the reason that it failed.
  ///
  /// By default, the list of associated entities is sorted by date, with the
  /// most recent access listed first.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [jobId] :
  /// The ID of the request generated by the
  /// <code>GenerateServiceLastAccessedDetails</code> operation.
  ///
  /// Parameter [serviceNamespace] :
  /// The service namespace for an AWS service. Provide the service namespace to
  /// learn when the IAM entity last attempted to access the specified service.
  ///
  /// To learn the service namespace for a service, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions,
  /// Resources, and Condition Keys for AWS Services</a> in the <i>IAM User
  /// Guide</i>. Choose the name of the service to view details for that
  /// service. In the first paragraph, find the service prefix. For example,
  /// <code>(service prefix: a4b)</code>. For more information about service
  /// namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<GetServiceLastAccessedDetailsWithEntitiesResponse>
      getServiceLastAccessedDetailsWithEntities({
    @_s.required String jobId,
    @_s.required String serviceNamespace,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    _s.validateStringLength(
      'serviceNamespace',
      serviceNamespace,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceNamespace',
      serviceNamespace,
      r'''[\w-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['JobId'] = jobId;
    $request['ServiceNamespace'] = serviceNamespace;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetServiceLastAccessedDetailsWithEntities',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetServiceLastAccessedDetailsWithEntitiesRequest'],
      shapes: shapes,
      resultWrapper: 'GetServiceLastAccessedDetailsWithEntitiesResult',
    );
    return GetServiceLastAccessedDetailsWithEntitiesResponse.fromXml($result);
  }

  /// Retrieves the status of your service-linked role deletion. After you use
  /// the <a>DeleteServiceLinkedRole</a> API operation to submit a
  /// service-linked role for deletion, you can use the
  /// <code>DeletionTaskId</code> parameter in
  /// <code>GetServiceLinkedRoleDeletionStatus</code> to check the status of the
  /// deletion. If the deletion fails, this operation returns the reason that it
  /// failed, if that information is returned by the service.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [deletionTaskId] :
  /// The deletion task identifier. This identifier is returned by the
  /// <a>DeleteServiceLinkedRole</a> operation in the format
  /// <code>task/aws-service-role/&lt;service-principal-name&gt;/&lt;role-name&gt;/&lt;task-uuid&gt;</code>.
  Future<GetServiceLinkedRoleDeletionStatusResponse>
      getServiceLinkedRoleDeletionStatus({
    @_s.required String deletionTaskId,
  }) async {
    ArgumentError.checkNotNull(deletionTaskId, 'deletionTaskId');
    _s.validateStringLength(
      'deletionTaskId',
      deletionTaskId,
      1,
      1000,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['DeletionTaskId'] = deletionTaskId;
    final $result = await _protocol.send(
      $request,
      action: 'GetServiceLinkedRoleDeletionStatus',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetServiceLinkedRoleDeletionStatusRequest'],
      shapes: shapes,
      resultWrapper: 'GetServiceLinkedRoleDeletionStatusResult',
    );
    return GetServiceLinkedRoleDeletionStatusResponse.fromXml($result);
  }

  /// Retrieves information about the specified IAM user, including the user's
  /// creation date, path, unique ID, and ARN.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the AWS access key ID used to sign the request to this API.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user to get information about.
  ///
  /// This parameter is optional. If it is not included, it defaults to the user
  /// making the request. This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetUserResponse> getUser({
    String userName,
  }) async {
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetUser',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetUserRequest'],
      shapes: shapes,
      resultWrapper: 'GetUserResult',
    );
    return GetUserResponse.fromXml($result);
  }

  /// Retrieves the specified inline policy document that is embedded in the
  /// specified IAM user.
  /// <note>
  /// Policies returned by this API are URL-encoded compliant with <a
  /// href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of
  /// the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  /// </note>
  /// An IAM user can also have managed policies attached to it. To retrieve a
  /// managed policy document that is attached to a user, use <a>GetPolicy</a>
  /// to determine the policy's default version. Then use
  /// <a>GetPolicyVersion</a> to retrieve the policy document.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy document to get.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [userName] :
  /// The name of the user who the policy is associated with.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<GetUserPolicyResponse> getUserPolicy({
    @_s.required String policyName,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyName'] = policyName;
    $request['UserName'] = userName;
    final $result = await _protocol.send(
      $request,
      action: 'GetUserPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetUserPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'GetUserPolicyResult',
    );
    return GetUserPolicyResponse.fromXml($result);
  }

  /// Returns information about the access key IDs associated with the specified
  /// IAM user. If there is none, the operation returns an empty list.
  ///
  /// Although each user is limited to a small number of keys, you can still
  /// paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// If the <code>UserName</code> field is not specified, the user name is
  /// determined implicitly based on the AWS access key ID used to sign the
  /// request. This operation works for access keys under the AWS account.
  /// Consequently, you can use this operation to manage AWS account root user
  /// credentials even if the AWS account has no associated users.
  /// <note>
  /// To ensure the security of your AWS account, the secret access key is
  /// accessible only during key and user creation.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [userName] :
  /// The name of the user.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<ListAccessKeysResponse> listAccessKeys({
    String marker,
    int maxItems,
    String userName,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListAccessKeys',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListAccessKeysRequest'],
      shapes: shapes,
      resultWrapper: 'ListAccessKeysResult',
    );
    return ListAccessKeysResponse.fromXml($result);
  }

  /// Lists the account alias associated with the AWS account (Note: you can
  /// have only one). For information about using an AWS account alias, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AccountAlias.html">Using
  /// an Alias for Your AWS Account ID</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListAccountAliasesResponse> listAccountAliases({
    String marker,
    int maxItems,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListAccountAliases',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListAccountAliasesRequest'],
      shapes: shapes,
      resultWrapper: 'ListAccountAliasesResult',
    );
    return ListAccountAliasesResponse.fromXml($result);
  }

  /// Lists all managed policies that are attached to the specified IAM group.
  ///
  /// An IAM group can also have inline policies embedded with it. To list the
  /// inline policies for a group, use the <a>ListGroupPolicies</a> API. For
  /// information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters. You can use the <code>PathPrefix</code>
  /// parameter to limit the list of policies to only those matching the
  /// specified path prefix. If there are no policies attached to the specified
  /// group (or none that match the specified path prefix), the operation
  /// returns an empty list.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name (friendly name, not ARN) of the group to list attached policies
  /// for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. This parameter is optional. If
  /// it is not included, it defaults to a slash (/), listing all policies.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListAttachedGroupPoliciesResponse> listAttachedGroupPolicies({
    @_s.required String groupName,
    String marker,
    int maxItems,
    String pathPrefix,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''((/[A-Za-z0-9\.,\+@=_-]+)*)/''',
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListAttachedGroupPolicies',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListAttachedGroupPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListAttachedGroupPoliciesResult',
    );
    return ListAttachedGroupPoliciesResponse.fromXml($result);
  }

  /// Lists all managed policies that are attached to the specified IAM role.
  ///
  /// An IAM role can also have inline policies embedded with it. To list the
  /// inline policies for a role, use the <a>ListRolePolicies</a> API. For
  /// information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters. You can use the <code>PathPrefix</code>
  /// parameter to limit the list of policies to only those matching the
  /// specified path prefix. If there are no policies attached to the specified
  /// role (or none that match the specified path prefix), the operation returns
  /// an empty list.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name (friendly name, not ARN) of the role to list attached policies
  /// for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. This parameter is optional. If
  /// it is not included, it defaults to a slash (/), listing all policies.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListAttachedRolePoliciesResponse> listAttachedRolePolicies({
    @_s.required String roleName,
    String marker,
    int maxItems,
    String pathPrefix,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''((/[A-Za-z0-9\.,\+@=_-]+)*)/''',
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListAttachedRolePolicies',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListAttachedRolePoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListAttachedRolePoliciesResult',
    );
    return ListAttachedRolePoliciesResponse.fromXml($result);
  }

  /// Lists all managed policies that are attached to the specified IAM user.
  ///
  /// An IAM user can also have inline policies embedded with it. To list the
  /// inline policies for a user, use the <a>ListUserPolicies</a> API. For
  /// information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters. You can use the <code>PathPrefix</code>
  /// parameter to limit the list of policies to only those matching the
  /// specified path prefix. If there are no policies attached to the specified
  /// group (or none that match the specified path prefix), the operation
  /// returns an empty list.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name (friendly name, not ARN) of the user to list attached policies
  /// for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. This parameter is optional. If
  /// it is not included, it defaults to a slash (/), listing all policies.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListAttachedUserPoliciesResponse> listAttachedUserPolicies({
    @_s.required String userName,
    String marker,
    int maxItems,
    String pathPrefix,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''((/[A-Za-z0-9\.,\+@=_-]+)*)/''',
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListAttachedUserPolicies',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListAttachedUserPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListAttachedUserPoliciesResult',
    );
    return ListAttachedUserPoliciesResponse.fromXml($result);
  }

  /// Lists all IAM users, groups, and roles that the specified managed policy
  /// is attached to.
  ///
  /// You can use the optional <code>EntityFilter</code> parameter to limit the
  /// results to a particular type of entity (users, groups, or roles). For
  /// example, to list only the roles that are attached to the specified policy,
  /// set <code>EntityFilter</code> to <code>Role</code>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy for which you want the
  /// versions.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [entityFilter] :
  /// The entity type to use for filtering the results.
  ///
  /// For example, when <code>EntityFilter</code> is <code>Role</code>, only the
  /// roles that are attached to the specified policy are returned. This
  /// parameter is optional. If it is not included, all attached entities
  /// (users, groups, and roles) are returned. The argument for this parameter
  /// must be one of the valid values listed below.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. This parameter is optional. If
  /// it is not included, it defaults to a slash (/), listing all entities.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  ///
  /// Parameter [policyUsageFilter] :
  /// The policy usage method to use for filtering the results.
  ///
  /// To list only permissions policies,
  /// set <code>PolicyUsageFilter</code> to <code>PermissionsPolicy</code>. To
  /// list only the policies used to set permissions boundaries, set the value
  /// to <code>PermissionsBoundary</code>.
  ///
  /// This parameter is optional. If it is not included, all policies are
  /// returned.
  Future<ListEntitiesForPolicyResponse> listEntitiesForPolicy({
    @_s.required String policyArn,
    EntityType entityFilter,
    String marker,
    int maxItems,
    String pathPrefix,
    PolicyUsageType policyUsageFilter,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    entityFilter?.also((arg) => $request['EntityFilter'] = arg.toValue());
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    policyUsageFilter
        ?.also((arg) => $request['PolicyUsageFilter'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ListEntitiesForPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListEntitiesForPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'ListEntitiesForPolicyResult',
    );
    return ListEntitiesForPolicyResponse.fromXml($result);
  }

  /// Lists the names of the inline policies that are embedded in the specified
  /// IAM group.
  ///
  /// An IAM group can also have managed policies attached to it. To list the
  /// managed policies that are attached to a group, use
  /// <a>ListAttachedGroupPolicies</a>. For more information about policies, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters. If there are no inline policies embedded
  /// with the specified group, the operation returns an empty list.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the group to list policies for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListGroupPoliciesResponse> listGroupPolicies({
    @_s.required String groupName,
    String marker,
    int maxItems,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListGroupPolicies',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListGroupPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListGroupPoliciesResult',
    );
    return ListGroupPoliciesResponse.fromXml($result);
  }

  /// Lists the IAM groups that have the specified path prefix.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. For example, the prefix
  /// <code>/division_abc/subdivision_xyz/</code> gets all groups whose path
  /// starts with <code>/division_abc/subdivision_xyz/</code>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all groups. This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListGroupsResponse> listGroups({
    String marker,
    int maxItems,
    String pathPrefix,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''\u002F[\u0021-\u007F]*''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListGroups',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListGroupsRequest'],
      shapes: shapes,
      resultWrapper: 'ListGroupsResult',
    );
    return ListGroupsResponse.fromXml($result);
  }

  /// Lists the IAM groups that the specified IAM user belongs to.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user to list groups for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListGroupsForUserResponse> listGroupsForUser({
    @_s.required String userName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListGroupsForUser',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListGroupsForUserRequest'],
      shapes: shapes,
      resultWrapper: 'ListGroupsForUserResult',
    );
    return ListGroupsForUserResponse.fromXml($result);
  }

  /// Lists the instance profiles that have the specified path prefix. If there
  /// are none, the operation returns an empty list. For more information about
  /// instance profiles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
  /// Instance Profiles</a>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. For example, the prefix
  /// <code>/application_abc/component_xyz/</code> gets all instance profiles
  /// whose path starts with <code>/application_abc/component_xyz/</code>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all instance profiles. This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListInstanceProfilesResponse> listInstanceProfiles({
    String marker,
    int maxItems,
    String pathPrefix,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''\u002F[\u0021-\u007F]*''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListInstanceProfiles',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListInstanceProfilesRequest'],
      shapes: shapes,
      resultWrapper: 'ListInstanceProfilesResult',
    );
    return ListInstanceProfilesResponse.fromXml($result);
  }

  /// Lists the instance profiles that have the specified associated IAM role.
  /// If there are none, the operation returns an empty list. For more
  /// information about instance profiles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
  /// Instance Profiles</a>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the role to list instance profiles for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListInstanceProfilesForRoleResponse> listInstanceProfilesForRole({
    @_s.required String roleName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListInstanceProfilesForRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListInstanceProfilesForRoleRequest'],
      shapes: shapes,
      resultWrapper: 'ListInstanceProfilesForRoleResult',
    );
    return ListInstanceProfilesForRoleResponse.fromXml($result);
  }

  /// Lists the MFA devices for an IAM user. If the request includes a IAM user
  /// name, then this operation lists all the MFA devices associated with the
  /// specified user. If you do not specify a user name, IAM determines the user
  /// name implicitly based on the AWS access key ID signing the request for
  /// this API.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [userName] :
  /// The name of the user whose MFA devices you want to list.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<ListMFADevicesResponse> listMFADevices({
    String marker,
    int maxItems,
    String userName,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListMFADevices',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListMFADevicesRequest'],
      shapes: shapes,
      resultWrapper: 'ListMFADevicesResult',
    );
    return ListMFADevicesResponse.fromXml($result);
  }

  /// Lists information about the IAM OpenID Connect (OIDC) provider resource
  /// objects defined in the AWS account.
  ///
  /// May throw [ServiceFailureException].
  Future<ListOpenIDConnectProvidersResponse>
      listOpenIDConnectProviders() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListOpenIDConnectProviders',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListOpenIDConnectProvidersRequest'],
      shapes: shapes,
      resultWrapper: 'ListOpenIDConnectProvidersResult',
    );
    return ListOpenIDConnectProvidersResponse.fromXml($result);
  }

  /// Lists all the managed policies that are available in your AWS account,
  /// including your own customer-defined managed policies and all AWS managed
  /// policies.
  ///
  /// You can filter the list of policies that is returned using the optional
  /// <code>OnlyAttached</code>, <code>Scope</code>, and <code>PathPrefix</code>
  /// parameters. For example, to list only the customer managed policies in
  /// your AWS account, set <code>Scope</code> to <code>Local</code>. To list
  /// only AWS managed policies, set <code>Scope</code> to <code>AWS</code>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// For more information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [onlyAttached] :
  /// A flag to filter the results to only the attached policies.
  ///
  /// When <code>OnlyAttached</code> is <code>true</code>, the returned list
  /// contains only the policies that are attached to an IAM user, group, or
  /// role. When <code>OnlyAttached</code> is <code>false</code>, or when the
  /// parameter is not included, all policies are returned.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. This parameter is optional. If
  /// it is not included, it defaults to a slash (/), listing all policies. This
  /// parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  ///
  /// Parameter [policyUsageFilter] :
  /// The policy usage method to use for filtering the results.
  ///
  /// To list only permissions policies,
  /// set <code>PolicyUsageFilter</code> to <code>PermissionsPolicy</code>. To
  /// list only the policies used to set permissions boundaries, set the value
  /// to <code>PermissionsBoundary</code>.
  ///
  /// This parameter is optional. If it is not included, all policies are
  /// returned.
  ///
  /// Parameter [scope] :
  /// The scope to use for filtering the results.
  ///
  /// To list only AWS managed policies, set <code>Scope</code> to
  /// <code>AWS</code>. To list only the customer managed policies in your AWS
  /// account, set <code>Scope</code> to <code>Local</code>.
  ///
  /// This parameter is optional. If it is not included, or if it is set to
  /// <code>All</code>, all policies are returned.
  Future<ListPoliciesResponse> listPolicies({
    String marker,
    int maxItems,
    bool onlyAttached,
    String pathPrefix,
    PolicyUsageType policyUsageFilter,
    PolicyScopeType scope,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''((/[A-Za-z0-9\.,\+@=_-]+)*)/''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    onlyAttached?.also((arg) => $request['OnlyAttached'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    policyUsageFilter
        ?.also((arg) => $request['PolicyUsageFilter'] = arg.toValue());
    scope?.also((arg) => $request['Scope'] = arg.toValue());
    final $result = await _protocol.send(
      $request,
      action: 'ListPolicies',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListPoliciesResult',
    );
    return ListPoliciesResponse.fromXml($result);
  }

  /// Retrieves a list of policies that the IAM identity (user, group, or role)
  /// can use to access each specified service.
  /// <note>
  /// This operation does not use other policy types when determining whether a
  /// resource could access a service. These other policy types include
  /// resource-based policies, access control lists, AWS Organizations policies,
  /// IAM permissions boundaries, and AWS STS assume role policies. It only
  /// applies permissions policy logic. For more about the evaluation of policy
  /// types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// Policies</a> in the <i>IAM User Guide</i>.
  /// </note>
  /// The list of policies returned by the operation depends on the ARN of the
  /// identity that you provide.
  ///
  /// <ul>
  /// <li>
  /// <b>User</b> – The list of policies includes the managed and inline
  /// policies that are attached to the user directly. The list also includes
  /// any additional managed and inline policies that are attached to the group
  /// to which the user belongs.
  /// </li>
  /// <li>
  /// <b>Group</b> – The list of policies includes only the managed and inline
  /// policies that are attached to the group directly. Policies that are
  /// attached to the group’s user are not included.
  /// </li>
  /// <li>
  /// <b>Role</b> – The list of policies includes only the managed and inline
  /// policies that are attached to the role.
  /// </li>
  /// </ul>
  /// For each managed policy, this operation returns the ARN and policy name.
  /// For each inline policy, it returns the policy name and the entity to which
  /// it is attached. Inline policies do not have an ARN. For more information
  /// about these policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// Policies that are attached to users and roles as permissions boundaries
  /// are not returned. To view which managed policy is currently used to set
  /// the permissions boundary for a user or role, use the <a>GetUser</a> or
  /// <a>GetRole</a> operations.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [arn] :
  /// The ARN of the IAM identity (user, group, or role) whose policies you want
  /// to list.
  ///
  /// Parameter [serviceNamespaces] :
  /// The service namespace for the AWS services whose policies you want to
  /// list.
  ///
  /// To learn the service namespace for a service, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions,
  /// Resources, and Condition Keys for AWS Services</a> in the <i>IAM User
  /// Guide</i>. Choose the name of the service to view details for that
  /// service. In the first paragraph, find the service prefix. For example,
  /// <code>(service prefix: a4b)</code>. For more information about service
  /// namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  Future<ListPoliciesGrantingServiceAccessResponse>
      listPoliciesGrantingServiceAccess({
    @_s.required String arn,
    @_s.required List<String> serviceNamespaces,
    String marker,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceNamespaces, 'serviceNamespaces');
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    final $request = <String, dynamic>{};
    $request['Arn'] = arn;
    $request['ServiceNamespaces'] = serviceNamespaces;
    marker?.also((arg) => $request['Marker'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListPoliciesGrantingServiceAccess',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPoliciesGrantingServiceAccessRequest'],
      shapes: shapes,
      resultWrapper: 'ListPoliciesGrantingServiceAccessResult',
    );
    return ListPoliciesGrantingServiceAccessResponse.fromXml($result);
  }

  /// Lists information about the versions of the specified managed policy,
  /// including the version that is currently set as the policy's default
  /// version.
  ///
  /// For more information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy for which you want the
  /// versions.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListPolicyVersionsResponse> listPolicyVersions({
    @_s.required String policyArn,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListPolicyVersions',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPolicyVersionsRequest'],
      shapes: shapes,
      resultWrapper: 'ListPolicyVersionsResult',
    );
    return ListPolicyVersionsResponse.fromXml($result);
  }

  /// Lists the names of the inline policies that are embedded in the specified
  /// IAM role.
  ///
  /// An IAM role can also have managed policies attached to it. To list the
  /// managed policies that are attached to a role, use
  /// <a>ListAttachedRolePolicies</a>. For more information about policies, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters. If there are no inline policies embedded
  /// with the specified role, the operation returns an empty list.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the role to list policies for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListRolePoliciesResponse> listRolePolicies({
    @_s.required String roleName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListRolePolicies',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListRolePoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListRolePoliciesResult',
    );
    return ListRolePoliciesResponse.fromXml($result);
  }

  /// Lists the tags that are attached to the specified role. The returned list
  /// of tags is sorted by tag key. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the IAM role for which you want to see the list of tags.
  ///
  /// This parameter accepts (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consist of upper and lowercase alphanumeric characters
  /// with no spaces. You can also include any of the following characters:
  /// _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// (Optional) Use this only when paginating results to indicate the maximum
  /// number of items that you want in the response. If additional items exist
  /// beyond the maximum that you specify, the <code>IsTruncated</code> response
  /// element is <code>true</code>.
  ///
  /// If you do not include this parameter, it defaults to 100. Note that IAM
  /// might return fewer results, even when more results are available. In that
  /// case, the <code>IsTruncated</code> response element returns
  /// <code>true</code>, and <code>Marker</code> contains a value to include in
  /// the subsequent call that tells the service where to continue from.
  Future<ListRoleTagsResponse> listRoleTags({
    @_s.required String roleName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListRoleTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListRoleTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListRoleTagsResult',
    );
    return ListRoleTagsResponse.fromXml($result);
  }

  /// Lists the IAM roles that have the specified path prefix. If there are
  /// none, the operation returns an empty list. For more information about
  /// roles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working
  /// with Roles</a>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. For example, the prefix
  /// <code>/application_abc/component_xyz/</code> gets all roles whose path
  /// starts with <code>/application_abc/component_xyz/</code>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all roles. This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListRolesResponse> listRoles({
    String marker,
    int maxItems,
    String pathPrefix,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''\u002F[\u0021-\u007F]*''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListRoles',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListRolesRequest'],
      shapes: shapes,
      resultWrapper: 'ListRolesResult',
    );
    return ListRolesResponse.fromXml($result);
  }

  /// Lists the SAML provider resource objects defined in IAM in the account.
  /// <note>
  /// This operation requires <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  /// </note>
  ///
  /// May throw [ServiceFailureException].
  Future<ListSAMLProvidersResponse> listSAMLProviders() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'ListSAMLProviders',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListSAMLProvidersRequest'],
      shapes: shapes,
      resultWrapper: 'ListSAMLProvidersResult',
    );
    return ListSAMLProvidersResponse.fromXml($result);
  }

  /// Returns information about the SSH public keys associated with the
  /// specified IAM user. If none exists, the operation returns an empty list.
  ///
  /// The SSH public keys returned by this operation are used only for
  /// authenticating the IAM user to an AWS CodeCommit repository. For more
  /// information about using SSH keys to authenticate to an AWS CodeCommit
  /// repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up AWS CodeCommit for SSH Connections</a> in the <i>AWS CodeCommit User
  /// Guide</i>.
  ///
  /// Although each user is limited to a small number of keys, you can still
  /// paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [NoSuchEntityException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user to list SSH public keys for. If none is
  /// specified, the <code>UserName</code> field is determined implicitly based
  /// on the AWS access key used to sign the request.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<ListSSHPublicKeysResponse> listSSHPublicKeys({
    String marker,
    int maxItems,
    String userName,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListSSHPublicKeys',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListSSHPublicKeysRequest'],
      shapes: shapes,
      resultWrapper: 'ListSSHPublicKeysResult',
    );
    return ListSSHPublicKeysResponse.fromXml($result);
  }

  /// Lists the server certificates stored in IAM that have the specified path
  /// prefix. If none exist, the operation returns an empty list.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// For more information about working with server certificates, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with Server Certificates</a> in the <i>IAM User Guide</i>. This topic also
  /// includes a list of AWS services that can use the server certificates that
  /// you manage with IAM.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. For example:
  /// <code>/company/servercerts</code> would get all server certificates for
  /// which the path starts with <code>/company/servercerts</code>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all server certificates. This parameter allows (through its
  /// <a href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListServerCertificatesResponse> listServerCertificates({
    String marker,
    int maxItems,
    String pathPrefix,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''\u002F[\u0021-\u007F]*''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListServerCertificates',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListServerCertificatesRequest'],
      shapes: shapes,
      resultWrapper: 'ListServerCertificatesResult',
    );
    return ListServerCertificatesResponse.fromXml($result);
  }

  /// Returns information about the service-specific credentials associated with
  /// the specified IAM user. If none exists, the operation returns an empty
  /// list. The service-specific credentials returned by this operation are used
  /// only for authenticating the IAM user to a specific service. For more
  /// information about using service-specific credentials to authenticate to an
  /// AWS service, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html">Set
  /// Up service-specific credentials</a> in the AWS CodeCommit User Guide.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceNotSupportedException].
  ///
  /// Parameter [serviceName] :
  /// Filters the returned results to only those for the specified AWS service.
  /// If not specified, then AWS returns service-specific credentials for all
  /// services.
  ///
  /// Parameter [userName] :
  /// The name of the user whose service-specific credentials you want
  /// information about. If this value is not specified, then the operation
  /// assumes the user whose credentials are used to call the operation.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<ListServiceSpecificCredentialsResponse>
      listServiceSpecificCredentials({
    String serviceName,
    String userName,
  }) async {
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    serviceName?.also((arg) => $request['ServiceName'] = arg);
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListServiceSpecificCredentials',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListServiceSpecificCredentialsRequest'],
      shapes: shapes,
      resultWrapper: 'ListServiceSpecificCredentialsResult',
    );
    return ListServiceSpecificCredentialsResponse.fromXml($result);
  }

  /// Returns information about the signing certificates associated with the
  /// specified IAM user. If none exists, the operation returns an empty list.
  ///
  /// Although each user is limited to a small number of signing certificates,
  /// you can still paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// If the <code>UserName</code> field is not specified, the user name is
  /// determined implicitly based on the AWS access key ID used to sign the
  /// request for this API. This operation works for access keys under the AWS
  /// account. Consequently, you can use this operation to manage AWS account
  /// root user credentials even if the AWS account has no associated users.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user whose signing certificates you want to examine.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<ListSigningCertificatesResponse> listSigningCertificates({
    String marker,
    int maxItems,
    String userName,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListSigningCertificates',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListSigningCertificatesRequest'],
      shapes: shapes,
      resultWrapper: 'ListSigningCertificatesResult',
    );
    return ListSigningCertificatesResponse.fromXml($result);
  }

  /// Lists the names of the inline policies embedded in the specified IAM user.
  ///
  /// An IAM user can also have managed policies attached to it. To list the
  /// managed policies that are attached to a user, use
  /// <a>ListAttachedUserPolicies</a>. For more information about policies, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters. If there are no inline policies embedded
  /// with the specified user, the operation returns an empty list.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user to list policies for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListUserPoliciesResponse> listUserPolicies({
    @_s.required String userName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListUserPolicies',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListUserPoliciesRequest'],
      shapes: shapes,
      resultWrapper: 'ListUserPoliciesResult',
    );
    return ListUserPoliciesResponse.fromXml($result);
  }

  /// Lists the tags that are attached to the specified user. The returned list
  /// of tags is sorted by tag key. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the IAM user whose tags you want to see.
  ///
  /// This parameter accepts (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consist of upper and lowercase alphanumeric characters
  /// with no spaces. You can also include any of the following characters:
  /// =,.@-
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// (Optional) Use this only when paginating results to indicate the maximum
  /// number of items that you want in the response. If additional items exist
  /// beyond the maximum that you specify, the <code>IsTruncated</code> response
  /// element is <code>true</code>.
  ///
  /// If you do not include this parameter, it defaults to 100. Note that IAM
  /// might return fewer results, even when more results are available. In that
  /// case, the <code>IsTruncated</code> response element returns
  /// <code>true</code>, and <code>Marker</code> contains a value to include in
  /// the subsequent call that tells the service where to continue from.
  Future<ListUserTagsResponse> listUserTags({
    @_s.required String userName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListUserTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListUserTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListUserTagsResult',
    );
    return ListUserTagsResponse.fromXml($result);
  }

  /// Lists the IAM users that have the specified path prefix. If no path prefix
  /// is specified, the operation returns all users in the AWS account. If there
  /// are none, the operation returns an empty list.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [pathPrefix] :
  /// The path prefix for filtering the results. For example:
  /// <code>/division_abc/subdivision_xyz/</code>, which would get all user
  /// names whose path starts with <code>/division_abc/subdivision_xyz/</code>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/), listing all user names. This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<ListUsersResponse> listUsers({
    String marker,
    int maxItems,
    String pathPrefix,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'pathPrefix',
      pathPrefix,
      1,
      512,
    );
    _s.validateStringPattern(
      'pathPrefix',
      pathPrefix,
      r'''\u002F[\u0021-\u007F]*''',
    );
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    pathPrefix?.also((arg) => $request['PathPrefix'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListUsers',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListUsersRequest'],
      shapes: shapes,
      resultWrapper: 'ListUsersResult',
    );
    return ListUsersResponse.fromXml($result);
  }

  /// Lists the virtual MFA devices defined in the AWS account by assignment
  /// status. If you do not specify an assignment status, the operation returns
  /// a list of all virtual MFA devices. Assignment status can be
  /// <code>Assigned</code>, <code>Unassigned</code>, or <code>Any</code>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// Parameter [assignmentStatus] :
  /// The status (<code>Unassigned</code> or <code>Assigned</code>) of the
  /// devices to list. If you do not specify an <code>AssignmentStatus</code>,
  /// the operation defaults to <code>Any</code>, which lists both assigned and
  /// unassigned virtual MFA devices.,
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  Future<ListVirtualMFADevicesResponse> listVirtualMFADevices({
    AssignmentStatusType assignmentStatus,
    String marker,
    int maxItems,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    assignmentStatus
        ?.also((arg) => $request['AssignmentStatus'] = arg.toValue());
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListVirtualMFADevices',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListVirtualMFADevicesRequest'],
      shapes: shapes,
      resultWrapper: 'ListVirtualMFADevicesResult',
    );
    return ListVirtualMFADevicesResponse.fromXml($result);
  }

  /// Adds or updates an inline policy document that is embedded in the
  /// specified IAM group.
  ///
  /// A user can also have managed policies attached to it. To attach a managed
  /// policy to a group, use <a>AttachGroupPolicy</a>. To create a new managed
  /// policy, use <a>CreatePolicy</a>. For information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For information about limits on the number of inline policies that you can
  /// embed in a group, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html">Limitations
  /// on IAM Entities</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling <code>PutGroupPolicy</code>. For general information about
  /// using the Query API with IAM, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// Query Requests</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the group to associate the policy with.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-.
  ///
  /// Parameter [policyDocument] :
  /// The policy document.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [policyName] :
  /// The name of the policy document.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> putGroupPolicy({
    @_s.required String groupName,
    @_s.required String policyDocument,
    @_s.required String policyName,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyDocument',
      policyDocument,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    $request['PolicyDocument'] = policyDocument;
    $request['PolicyName'] = policyName;
    await _protocol.send(
      $request,
      action: 'PutGroupPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutGroupPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Adds or updates the policy that is specified as the IAM role's permissions
  /// boundary. You can use an AWS managed policy or a customer managed policy
  /// to set the boundary for a role. Use the boundary to control the maximum
  /// permissions that the role can have. Setting a permissions boundary is an
  /// advanced feature that can affect the permissions for the role.
  ///
  /// You cannot set the boundary for a service-linked role.
  /// <important>
  /// Policies used as permissions boundaries do not provide permissions. You
  /// must also attach a permissions policy to the role. To learn how the
  /// effective permissions for a role are evaluated, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html">IAM
  /// JSON Policy Evaluation Logic</a> in the IAM User Guide.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [PolicyNotAttachableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [permissionsBoundary] :
  /// The ARN of the policy that is used to set the permissions boundary for the
  /// role.
  ///
  /// Parameter [roleName] :
  /// The name (friendly name, not ARN) of the IAM role for which you want to
  /// set the permissions boundary.
  Future<void> putRolePermissionsBoundary({
    @_s.required String permissionsBoundary,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(permissionsBoundary, 'permissionsBoundary');
    _s.validateStringLength(
      'permissionsBoundary',
      permissionsBoundary,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PermissionsBoundary'] = permissionsBoundary;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'PutRolePermissionsBoundary',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutRolePermissionsBoundaryRequest'],
      shapes: shapes,
    );
  }

  /// Adds or updates an inline policy document that is embedded in the
  /// specified IAM role.
  ///
  /// When you embed an inline policy in a role, the inline policy is used as
  /// part of the role's access (permissions) policy. The role's trust policy is
  /// created at the same time as the role, using <a>CreateRole</a>. You can
  /// update a role's trust policy using <a>UpdateAssumeRolePolicy</a>. For more
  /// information about IAM roles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">Using
  /// Roles to Delegate Permissions and Federate Identities</a>.
  ///
  /// A role can also have a managed policy attached to it. To attach a managed
  /// policy to a role, use <a>AttachRolePolicy</a>. To create a new managed
  /// policy, use <a>CreatePolicy</a>. For information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For information about limits on the number of inline policies that you can
  /// embed with a role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html">Limitations
  /// on IAM Entities</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling <code>PutRolePolicy</code>. For general information about
  /// using the Query API with IAM, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// Query Requests</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [NoSuchEntityException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The policy document.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [policyName] :
  /// The name of the policy document.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [roleName] :
  /// The name of the role to associate the policy with.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> putRolePolicy({
    @_s.required String policyDocument,
    @_s.required String policyName,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyDocument',
      policyDocument,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyDocument'] = policyDocument;
    $request['PolicyName'] = policyName;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'PutRolePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutRolePolicyRequest'],
      shapes: shapes,
    );
  }

  /// Adds or updates the policy that is specified as the IAM user's permissions
  /// boundary. You can use an AWS managed policy or a customer managed policy
  /// to set the boundary for a user. Use the boundary to control the maximum
  /// permissions that the user can have. Setting a permissions boundary is an
  /// advanced feature that can affect the permissions for the user.
  /// <important>
  /// Policies that are used as permissions boundaries do not provide
  /// permissions. You must also attach a permissions policy to the user. To
  /// learn how the effective permissions for a user are evaluated, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html">IAM
  /// JSON Policy Evaluation Logic</a> in the IAM User Guide.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotAttachableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [permissionsBoundary] :
  /// The ARN of the policy that is used to set the permissions boundary for the
  /// user.
  ///
  /// Parameter [userName] :
  /// The name (friendly name, not ARN) of the IAM user for which you want to
  /// set the permissions boundary.
  Future<void> putUserPermissionsBoundary({
    @_s.required String permissionsBoundary,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(permissionsBoundary, 'permissionsBoundary');
    _s.validateStringLength(
      'permissionsBoundary',
      permissionsBoundary,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PermissionsBoundary'] = permissionsBoundary;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'PutUserPermissionsBoundary',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutUserPermissionsBoundaryRequest'],
      shapes: shapes,
    );
  }

  /// Adds or updates an inline policy document that is embedded in the
  /// specified IAM user.
  ///
  /// An IAM user can also have a managed policy attached to it. To attach a
  /// managed policy to a user, use <a>AttachUserPolicy</a>. To create a new
  /// managed policy, use <a>CreatePolicy</a>. For information about policies,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For information about limits on the number of inline policies that you can
  /// embed in a user, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/LimitationsOnEntities.html">Limitations
  /// on IAM Entities</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling <code>PutUserPolicy</code>. For general information about
  /// using the Query API with IAM, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// Query Requests</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The policy document.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [policyName] :
  /// The name of the policy document.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [userName] :
  /// The name of the user to associate the policy with.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> putUserPolicy({
    @_s.required String policyDocument,
    @_s.required String policyName,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyDocument',
      policyDocument,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyDocument'] = policyDocument;
    $request['PolicyName'] = policyName;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'PutUserPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PutUserPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified client ID (also known as audience) from the list of
  /// client IDs registered for the specified IAM OpenID Connect (OIDC) provider
  /// resource object.
  ///
  /// This operation is idempotent; it does not fail or return an error if you
  /// try to remove a client ID that does not exist.
  ///
  /// May throw [InvalidInputException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [clientID] :
  /// The client ID (also known as audience) to remove from the IAM OIDC
  /// provider resource. For more information about client IDs, see
  /// <a>CreateOpenIDConnectProvider</a>.
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The Amazon Resource Name (ARN) of the IAM OIDC provider resource to remove
  /// the client ID from. You can get a list of OIDC provider ARNs by using the
  /// <a>ListOpenIDConnectProviders</a> operation.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<void> removeClientIDFromOpenIDConnectProvider({
    @_s.required String clientID,
    @_s.required String openIDConnectProviderArn,
  }) async {
    ArgumentError.checkNotNull(clientID, 'clientID');
    _s.validateStringLength(
      'clientID',
      clientID,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        openIDConnectProviderArn, 'openIDConnectProviderArn');
    _s.validateStringLength(
      'openIDConnectProviderArn',
      openIDConnectProviderArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['ClientID'] = clientID;
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    await _protocol.send(
      $request,
      action: 'RemoveClientIDFromOpenIDConnectProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveClientIDFromOpenIDConnectProviderRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified IAM role from the specified EC2 instance profile.
  /// <important>
  /// Make sure that you do not have any Amazon EC2 instances running with the
  /// role you are about to remove from the instance profile. Removing a role
  /// from an instance profile that is associated with a running instance might
  /// break any applications running on the instance.
  /// </important>
  /// For more information about IAM roles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/WorkingWithRoles.html">Working
  /// with Roles</a>. For more information about instance profiles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/AboutInstanceProfiles.html">About
  /// Instance Profiles</a>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the instance profile to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [roleName] :
  /// The name of the role to remove.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> removeRoleFromInstanceProfile({
    @_s.required String instanceProfileName,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(instanceProfileName, 'instanceProfileName');
    _s.validateStringLength(
      'instanceProfileName',
      instanceProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceProfileName',
      instanceProfileName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'RemoveRoleFromInstanceProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveRoleFromInstanceProfileRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified user from the specified group.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// The name of the group to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [userName] :
  /// The name of the user to remove.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> removeUserFromGroup({
    @_s.required String groupName,
    @_s.required String userName,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'RemoveUserFromGroup',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveUserFromGroupRequest'],
      shapes: shapes,
    );
  }

  /// Resets the password for a service-specific credential. The new password is
  /// AWS generated and cryptographically strong. It cannot be configured by the
  /// user. Resetting the password immediately invalidates the previous password
  /// associated with this user.
  ///
  /// May throw [NoSuchEntityException].
  ///
  /// Parameter [serviceSpecificCredentialId] :
  /// The unique identifier of the service-specific credential.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user associated with the service-specific credential.
  /// If this value is not specified, then the operation assumes the user whose
  /// credentials are used to call the operation.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<ResetServiceSpecificCredentialResponse>
      resetServiceSpecificCredential({
    @_s.required String serviceSpecificCredentialId,
    String userName,
  }) async {
    ArgumentError.checkNotNull(
        serviceSpecificCredentialId, 'serviceSpecificCredentialId');
    _s.validateStringLength(
      'serviceSpecificCredentialId',
      serviceSpecificCredentialId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceSpecificCredentialId',
      serviceSpecificCredentialId,
      r'''[\w]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['ServiceSpecificCredentialId'] = serviceSpecificCredentialId;
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetServiceSpecificCredential',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetServiceSpecificCredentialRequest'],
      shapes: shapes,
      resultWrapper: 'ResetServiceSpecificCredentialResult',
    );
    return ResetServiceSpecificCredentialResponse.fromXml($result);
  }

  /// Synchronizes the specified MFA device with its IAM resource object on the
  /// AWS servers.
  ///
  /// For more information about creating and working with virtual MFA devices,
  /// go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Using
  /// a Virtual MFA Device</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [InvalidAuthenticationCodeException].
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [authenticationCode1] :
  /// An authentication code emitted by the device.
  ///
  /// The format for this parameter is a sequence of six digits.
  ///
  /// Parameter [authenticationCode2] :
  /// A subsequent authentication code emitted by the device.
  ///
  /// The format for this parameter is a sequence of six digits.
  ///
  /// Parameter [serialNumber] :
  /// Serial number that uniquely identifies the MFA device.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [userName] :
  /// The name of the user whose MFA device you want to resynchronize.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> resyncMFADevice({
    @_s.required String authenticationCode1,
    @_s.required String authenticationCode2,
    @_s.required String serialNumber,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(authenticationCode1, 'authenticationCode1');
    _s.validateStringLength(
      'authenticationCode1',
      authenticationCode1,
      6,
      6,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authenticationCode1',
      authenticationCode1,
      r'''[\d]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(authenticationCode2, 'authenticationCode2');
    _s.validateStringLength(
      'authenticationCode2',
      authenticationCode2,
      6,
      6,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authenticationCode2',
      authenticationCode2,
      r'''[\d]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serialNumber, 'serialNumber');
    _s.validateStringLength(
      'serialNumber',
      serialNumber,
      9,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serialNumber',
      serialNumber,
      r'''[\w+=/:,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AuthenticationCode1'] = authenticationCode1;
    $request['AuthenticationCode2'] = authenticationCode2;
    $request['SerialNumber'] = serialNumber;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'ResyncMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResyncMFADeviceRequest'],
      shapes: shapes,
    );
  }

  /// Sets the specified version of the specified policy as the policy's default
  /// (operative) version.
  ///
  /// This operation affects all users, groups, and roles that the policy is
  /// attached to. To list the users, groups, and roles that the policy is
  /// attached to, use the <a>ListEntitiesForPolicy</a> API.
  ///
  /// For information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the IAM policy whose default version you
  /// want to set.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [versionId] :
  /// The version of the policy to set as the default (operative) version.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  Future<void> setDefaultPolicyVersion({
    @_s.required String policyArn,
    @_s.required String versionId,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    _s.validateStringLength(
      'policyArn',
      policyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    _s.validateStringPattern(
      'versionId',
      versionId,
      r'''v[1-9][0-9]*(\.[A-Za-z0-9-]*)?''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['VersionId'] = versionId;
    await _protocol.send(
      $request,
      action: 'SetDefaultPolicyVersion',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetDefaultPolicyVersionRequest'],
      shapes: shapes,
    );
  }

  /// Sets the specified version of the global endpoint token as the token
  /// version used for the AWS account.
  ///
  /// By default, AWS Security Token Service (STS) is available as a global
  /// service, and all STS requests go to a single endpoint at
  /// <code>https://sts.amazonaws.com</code>. AWS recommends using Regional STS
  /// endpoints to reduce latency, build in redundancy, and increase session
  /// token availability. For information about Regional endpoints for STS, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#sts_region">AWS
  /// Regions and Endpoints</a> in the <i>AWS General Reference</i>.
  ///
  /// If you make an STS call to the global endpoint, the resulting session
  /// tokens might be valid in some Regions but not others. It depends on the
  /// version that is set in this operation. Version 1 tokens are valid only in
  /// AWS Regions that are available by default. These tokens do not work in
  /// manually enabled Regions, such as Asia Pacific (Hong Kong). Version 2
  /// tokens are valid in all Regions. However, version 2 tokens are longer and
  /// might affect systems where you temporarily store tokens. For information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and Deactivating STS in an AWS Region</a> in the <i>IAM User Guide</i>.
  ///
  /// To view the current session token version, see the
  /// <code>GlobalEndpointTokenVersion</code> entry in the response of the
  /// <a>GetAccountSummary</a> operation.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [globalEndpointTokenVersion] :
  /// The version of the global endpoint token. Version 1 tokens are valid only
  /// in AWS Regions that are available by default. These tokens do not work in
  /// manually enabled Regions, such as Asia Pacific (Hong Kong). Version 2
  /// tokens are valid in all Regions. However, version 2 tokens are longer and
  /// might affect systems where you temporarily store tokens.
  ///
  /// For information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and Deactivating STS in an AWS Region</a> in the <i>IAM User Guide</i>.
  Future<void> setSecurityTokenServicePreferences({
    @_s.required GlobalEndpointTokenVersion globalEndpointTokenVersion,
  }) async {
    ArgumentError.checkNotNull(
        globalEndpointTokenVersion, 'globalEndpointTokenVersion');
    final $request = <String, dynamic>{};
    $request['GlobalEndpointTokenVersion'] =
        globalEndpointTokenVersion.toValue();
    await _protocol.send(
      $request,
      action: 'SetSecurityTokenServicePreferences',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SetSecurityTokenServicePreferencesRequest'],
      shapes: shapes,
    );
  }

  /// Simulate how a set of IAM policies and optionally a resource-based policy
  /// works with a list of API operations and AWS resources to determine the
  /// policies' effective permissions. The policies are provided as strings.
  ///
  /// The simulation does not perform the API operations; it only checks the
  /// authorization to determine if the simulated policies allow or deny the
  /// operations.
  ///
  /// If you want to simulate existing policies that are attached to an IAM
  /// user, group, or role, use <a>SimulatePrincipalPolicy</a> instead.
  ///
  /// Context keys are variables that are maintained by AWS and its services and
  /// which provide details about the context of an API query request. You can
  /// use the <code>Condition</code> element of an IAM policy to evaluate
  /// context keys. To get the list of context keys that the policies require
  /// for correct simulation, use <a>GetContextKeysForCustomPolicy</a>.
  ///
  /// If the output is long, you can use <code>MaxItems</code> and
  /// <code>Marker</code> parameters to paginate the results.
  ///
  /// May throw [InvalidInputException].
  /// May throw [PolicyEvaluationException].
  ///
  /// Parameter [actionNames] :
  /// A list of names of API operations to evaluate in the simulation. Each
  /// operation is evaluated against each resource. Each operation must include
  /// the service identifier, such as <code>iam:CreateUser</code>. This
  /// operation does not support using wildcards (*) in an action name.
  ///
  /// Parameter [policyInputList] :
  /// A list of policy documents to include in the simulation. Each document is
  /// specified as a string containing the complete, valid JSON text of an IAM
  /// policy. Do not include any resource-based policies in this parameter. Any
  /// resource-based policy must be submitted with the
  /// <code>ResourcePolicy</code> parameter. The policies cannot be "scope-down"
  /// policies, such as you could include in a call to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetFederationToken.html">GetFederationToken</a>
  /// or one of the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_AssumeRole.html">AssumeRole</a>
  /// API operations. In other words, do not use policies designed to restrict
  /// what a user can do while using the temporary credentials.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [callerArn] :
  /// The ARN of the IAM user that you want to use as the simulated caller of
  /// the API operations. <code>CallerArn</code> is required if you include a
  /// <code>ResourcePolicy</code> so that the policy's <code>Principal</code>
  /// element has a value to use in evaluating the policy.
  ///
  /// You can specify only the ARN of an IAM user. You cannot specify the ARN of
  /// an assumed role, federated user, or a service principal.
  ///
  /// Parameter [contextEntries] :
  /// A list of context keys and corresponding values for the simulation to use.
  /// Whenever a context key is evaluated in one of the simulated IAM
  /// permissions policies, the corresponding value is supplied.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [permissionsBoundaryPolicyInputList] :
  /// The IAM permissions boundary policy to simulate. The permissions boundary
  /// sets the maximum permissions that an IAM entity can have. You can input
  /// only one permissions boundary when you pass a policy to this operation.
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Entities</a> in the <i>IAM User Guide</i>. The policy
  /// input is specified as a string that contains the complete, valid JSON text
  /// of a permissions boundary policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceArns] :
  /// A list of ARNs of AWS resources to include in the simulation. If this
  /// parameter is not provided, then the value defaults to <code>*</code> (all
  /// resources). Each API in the <code>ActionNames</code> parameter is
  /// evaluated for each resource in this list. The simulation determines the
  /// access result (allowed or denied) of each combination and reports it in
  /// the response.
  ///
  /// The simulation does not automatically retrieve policies for the specified
  /// resources. If you want to include a resource policy in the simulation,
  /// then you must include the policy as a string in the
  /// <code>ResourcePolicy</code> parameter.
  ///
  /// If you include a <code>ResourcePolicy</code>, then it must be applicable
  /// to all of the resources included in the simulation or you receive an
  /// invalid input error.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [resourceHandlingOption] :
  /// Specifies the type of simulation to run. Different API operations that
  /// support resource-based policies require different combinations of
  /// resources. By specifying the type of simulation to run, you enable the
  /// policy simulator to enforce the presence of the required resources to
  /// ensure reliable simulation results. If your simulation does not match one
  /// of the following scenarios, then you can omit this parameter. The
  /// following list shows each of the supported scenario values and the
  /// resources that you must define to run the simulation.
  ///
  /// Each of the EC2 scenarios requires that you specify instance, image, and
  /// security-group resources. If your scenario includes an EBS volume, then
  /// you must specify that volume as a resource. If the EC2 scenario includes
  /// VPC, then you must supply the network-interface resource. If it includes
  /// an IP subnet, then you must specify the subnet resource. For more
  /// information on the EC2 scenario options, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// Platforms</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// <b>EC2-Classic-InstanceStore</b>
  ///
  /// instance, image, security-group
  /// </li>
  /// <li>
  /// <b>EC2-Classic-EBS</b>
  ///
  /// instance, image, security-group, volume
  /// </li>
  /// <li>
  /// <b>EC2-VPC-InstanceStore</b>
  ///
  /// instance, image, security-group, network-interface
  /// </li>
  /// <li>
  /// <b>EC2-VPC-InstanceStore-Subnet</b>
  ///
  /// instance, image, security-group, network-interface, subnet
  /// </li>
  /// <li>
  /// <b>EC2-VPC-EBS</b>
  ///
  /// instance, image, security-group, network-interface, volume
  /// </li>
  /// <li>
  /// <b>EC2-VPC-EBS-Subnet</b>
  ///
  /// instance, image, security-group, network-interface, subnet, volume
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceOwner] :
  /// An ARN representing the AWS account ID that specifies the owner of any
  /// simulated resource that does not identify its owner in the resource ARN.
  /// Examples of resource ARNs include an S3 bucket or object. If
  /// <code>ResourceOwner</code> is specified, it is also used as the account
  /// owner of any <code>ResourcePolicy</code> included in the simulation. If
  /// the <code>ResourceOwner</code> parameter is not specified, then the owner
  /// of the resources and the resource policy defaults to the account of the
  /// identity provided in <code>CallerArn</code>. This parameter is required
  /// only if you specify a resource-based policy and account that owns the
  /// resource is different from the account that owns the simulated calling
  /// user <code>CallerArn</code>.
  ///
  /// The ARN for an account uses the following syntax:
  /// <code>arn:aws:iam::<i>AWS-account-ID</i>:root</code>. For example, to
  /// represent the account with the 112233445566 ID, use the following ARN:
  /// <code>arn:aws:iam::112233445566-ID:root</code>.
  ///
  /// Parameter [resourcePolicy] :
  /// A resource-based policy to include in the simulation provided as a string.
  /// Each resource in the simulation is treated as if it had this policy
  /// attached. You can include only one resource-based policy in a simulation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  Future<SimulatePolicyResponse> simulateCustomPolicy({
    @_s.required List<String> actionNames,
    @_s.required List<String> policyInputList,
    String callerArn,
    List<ContextEntry> contextEntries,
    String marker,
    int maxItems,
    List<String> permissionsBoundaryPolicyInputList,
    List<String> resourceArns,
    String resourceHandlingOption,
    String resourceOwner,
    String resourcePolicy,
  }) async {
    ArgumentError.checkNotNull(actionNames, 'actionNames');
    ArgumentError.checkNotNull(policyInputList, 'policyInputList');
    _s.validateStringLength(
      'callerArn',
      callerArn,
      1,
      2048,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'resourceHandlingOption',
      resourceHandlingOption,
      1,
      64,
    );
    _s.validateStringLength(
      'resourceOwner',
      resourceOwner,
      1,
      2048,
    );
    _s.validateStringLength(
      'resourcePolicy',
      resourcePolicy,
      1,
      131072,
    );
    _s.validateStringPattern(
      'resourcePolicy',
      resourcePolicy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    final $request = <String, dynamic>{};
    $request['ActionNames'] = actionNames;
    $request['PolicyInputList'] = policyInputList;
    callerArn?.also((arg) => $request['CallerArn'] = arg);
    contextEntries?.also((arg) => $request['ContextEntries'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    permissionsBoundaryPolicyInputList
        ?.also((arg) => $request['PermissionsBoundaryPolicyInputList'] = arg);
    resourceArns?.also((arg) => $request['ResourceArns'] = arg);
    resourceHandlingOption
        ?.also((arg) => $request['ResourceHandlingOption'] = arg);
    resourceOwner?.also((arg) => $request['ResourceOwner'] = arg);
    resourcePolicy?.also((arg) => $request['ResourcePolicy'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SimulateCustomPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SimulateCustomPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'SimulateCustomPolicyResult',
    );
    return SimulatePolicyResponse.fromXml($result);
  }

  /// Simulate how a set of IAM policies attached to an IAM entity works with a
  /// list of API operations and AWS resources to determine the policies'
  /// effective permissions. The entity can be an IAM user, group, or role. If
  /// you specify a user, then the simulation also includes all of the policies
  /// that are attached to groups that the user belongs to.
  ///
  /// You can optionally include a list of one or more additional policies
  /// specified as strings to include in the simulation. If you want to simulate
  /// only policies specified as strings, use <a>SimulateCustomPolicy</a>
  /// instead.
  ///
  /// You can also optionally include one resource-based policy to be evaluated
  /// with each of the resources included in the simulation.
  ///
  /// The simulation does not perform the API operations; it only checks the
  /// authorization to determine if the simulated policies allow or deny the
  /// operations.
  ///
  /// <b>Note:</b> This API discloses information about the permissions granted
  /// to other users. If you do not want users to see other user's permissions,
  /// then consider allowing them to use <a>SimulateCustomPolicy</a> instead.
  ///
  /// Context keys are variables maintained by AWS and its services that provide
  /// details about the context of an API query request. You can use the
  /// <code>Condition</code> element of an IAM policy to evaluate context keys.
  /// To get the list of context keys that the policies require for correct
  /// simulation, use <a>GetContextKeysForPrincipalPolicy</a>.
  ///
  /// If the output is long, you can use the <code>MaxItems</code> and
  /// <code>Marker</code> parameters to paginate the results.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyEvaluationException].
  ///
  /// Parameter [actionNames] :
  /// A list of names of API operations to evaluate in the simulation. Each
  /// operation is evaluated for each resource. Each operation must include the
  /// service identifier, such as <code>iam:CreateUser</code>.
  ///
  /// Parameter [policySourceArn] :
  /// The Amazon Resource Name (ARN) of a user, group, or role whose policies
  /// you want to include in the simulation. If you specify a user, group, or
  /// role, the simulation includes all policies that are associated with that
  /// entity. If you specify a user, the simulation also includes all policies
  /// that are attached to any groups the user belongs to.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [callerArn] :
  /// The ARN of the IAM user that you want to specify as the simulated caller
  /// of the API operations. If you do not specify a <code>CallerArn</code>, it
  /// defaults to the ARN of the user that you specify in
  /// <code>PolicySourceArn</code>, if you specified a user. If you include both
  /// a <code>PolicySourceArn</code> (for example,
  /// <code>arn:aws:iam::123456789012:user/David</code>) and a
  /// <code>CallerArn</code> (for example,
  /// <code>arn:aws:iam::123456789012:user/Bob</code>), the result is that you
  /// simulate calling the API operations as Bob, as if Bob had David's
  /// policies.
  ///
  /// You can specify only the ARN of an IAM user. You cannot specify the ARN of
  /// an assumed role, federated user, or a service principal.
  ///
  /// <code>CallerArn</code> is required if you include a
  /// <code>ResourcePolicy</code> and the <code>PolicySourceArn</code> is not
  /// the ARN for an IAM user. This is required so that the resource-based
  /// policy's <code>Principal</code> element has a value to use in evaluating
  /// the policy.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [contextEntries] :
  /// A list of context keys and corresponding values for the simulation to use.
  /// Whenever a context key is evaluated in one of the simulated IAM
  /// permissions policies, the corresponding value is supplied.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  ///
  /// Parameter [maxItems] :
  /// Use this only when paginating results to indicate the maximum number of
  /// items you want in the response. If additional items exist beyond the
  /// maximum you specify, the <code>IsTruncated</code> response element is
  /// <code>true</code>.
  ///
  /// If you do not include this parameter, the number of items defaults to 100.
  /// Note that IAM might return fewer results, even when there are more results
  /// available. In that case, the <code>IsTruncated</code> response element
  /// returns <code>true</code>, and <code>Marker</code> contains a value to
  /// include in the subsequent call that tells the service where to continue
  /// from.
  ///
  /// Parameter [permissionsBoundaryPolicyInputList] :
  /// The IAM permissions boundary policy to simulate. The permissions boundary
  /// sets the maximum permissions that the entity can have. You can input only
  /// one permissions boundary when you pass a policy to this operation. An IAM
  /// entity can only have one permissions boundary in effect at a time. For
  /// example, if a permissions boundary is attached to an entity and you pass
  /// in a different permissions boundary policy using this parameter, then the
  /// new permissions boundary policy is used for the simulation. For more
  /// information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Entities</a> in the <i>IAM User Guide</i>. The policy
  /// input is specified as a string containing the complete, valid JSON text of
  /// a permissions boundary policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [policyInputList] :
  /// An optional list of additional policy documents to include in the
  /// simulation. Each document is specified as a string containing the
  /// complete, valid JSON text of an IAM policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceArns] :
  /// A list of ARNs of AWS resources to include in the simulation. If this
  /// parameter is not provided, then the value defaults to <code>*</code> (all
  /// resources). Each API in the <code>ActionNames</code> parameter is
  /// evaluated for each resource in this list. The simulation determines the
  /// access result (allowed or denied) of each combination and reports it in
  /// the response.
  ///
  /// The simulation does not automatically retrieve policies for the specified
  /// resources. If you want to include a resource policy in the simulation,
  /// then you must include the policy as a string in the
  /// <code>ResourcePolicy</code> parameter.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [resourceHandlingOption] :
  /// Specifies the type of simulation to run. Different API operations that
  /// support resource-based policies require different combinations of
  /// resources. By specifying the type of simulation to run, you enable the
  /// policy simulator to enforce the presence of the required resources to
  /// ensure reliable simulation results. If your simulation does not match one
  /// of the following scenarios, then you can omit this parameter. The
  /// following list shows each of the supported scenario values and the
  /// resources that you must define to run the simulation.
  ///
  /// Each of the EC2 scenarios requires that you specify instance, image, and
  /// security group resources. If your scenario includes an EBS volume, then
  /// you must specify that volume as a resource. If the EC2 scenario includes
  /// VPC, then you must supply the network interface resource. If it includes
  /// an IP subnet, then you must specify the subnet resource. For more
  /// information on the EC2 scenario options, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// Platforms</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// <b>EC2-Classic-InstanceStore</b>
  ///
  /// instance, image, security group
  /// </li>
  /// <li>
  /// <b>EC2-Classic-EBS</b>
  ///
  /// instance, image, security group, volume
  /// </li>
  /// <li>
  /// <b>EC2-VPC-InstanceStore</b>
  ///
  /// instance, image, security group, network interface
  /// </li>
  /// <li>
  /// <b>EC2-VPC-InstanceStore-Subnet</b>
  ///
  /// instance, image, security group, network interface, subnet
  /// </li>
  /// <li>
  /// <b>EC2-VPC-EBS</b>
  ///
  /// instance, image, security group, network interface, volume
  /// </li>
  /// <li>
  /// <b>EC2-VPC-EBS-Subnet</b>
  ///
  /// instance, image, security group, network interface, subnet, volume
  /// </li>
  /// </ul>
  ///
  /// Parameter [resourceOwner] :
  /// An AWS account ID that specifies the owner of any simulated resource that
  /// does not identify its owner in the resource ARN. Examples of resource ARNs
  /// include an S3 bucket or object. If <code>ResourceOwner</code> is
  /// specified, it is also used as the account owner of any
  /// <code>ResourcePolicy</code> included in the simulation. If the
  /// <code>ResourceOwner</code> parameter is not specified, then the owner of
  /// the resources and the resource policy defaults to the account of the
  /// identity provided in <code>CallerArn</code>. This parameter is required
  /// only if you specify a resource-based policy and account that owns the
  /// resource is different from the account that owns the simulated calling
  /// user <code>CallerArn</code>.
  ///
  /// Parameter [resourcePolicy] :
  /// A resource-based policy to include in the simulation provided as a string.
  /// Each resource in the simulation is treated as if it had this policy
  /// attached. You can include only one resource-based policy in a simulation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  Future<SimulatePolicyResponse> simulatePrincipalPolicy({
    @_s.required List<String> actionNames,
    @_s.required String policySourceArn,
    String callerArn,
    List<ContextEntry> contextEntries,
    String marker,
    int maxItems,
    List<String> permissionsBoundaryPolicyInputList,
    List<String> policyInputList,
    List<String> resourceArns,
    String resourceHandlingOption,
    String resourceOwner,
    String resourcePolicy,
  }) async {
    ArgumentError.checkNotNull(actionNames, 'actionNames');
    ArgumentError.checkNotNull(policySourceArn, 'policySourceArn');
    _s.validateStringLength(
      'policySourceArn',
      policySourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'callerArn',
      callerArn,
      1,
      2048,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      320,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]+''',
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'resourceHandlingOption',
      resourceHandlingOption,
      1,
      64,
    );
    _s.validateStringLength(
      'resourceOwner',
      resourceOwner,
      1,
      2048,
    );
    _s.validateStringLength(
      'resourcePolicy',
      resourcePolicy,
      1,
      131072,
    );
    _s.validateStringPattern(
      'resourcePolicy',
      resourcePolicy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    final $request = <String, dynamic>{};
    $request['ActionNames'] = actionNames;
    $request['PolicySourceArn'] = policySourceArn;
    callerArn?.also((arg) => $request['CallerArn'] = arg);
    contextEntries?.also((arg) => $request['ContextEntries'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    permissionsBoundaryPolicyInputList
        ?.also((arg) => $request['PermissionsBoundaryPolicyInputList'] = arg);
    policyInputList?.also((arg) => $request['PolicyInputList'] = arg);
    resourceArns?.also((arg) => $request['ResourceArns'] = arg);
    resourceHandlingOption
        ?.also((arg) => $request['ResourceHandlingOption'] = arg);
    resourceOwner?.also((arg) => $request['ResourceOwner'] = arg);
    resourcePolicy?.also((arg) => $request['ResourcePolicy'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'SimulatePrincipalPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['SimulatePrincipalPolicyRequest'],
      shapes: shapes,
      resultWrapper: 'SimulatePrincipalPolicyResult',
    );
    return SimulatePolicyResponse.fromXml($result);
  }

  /// Adds one or more tags to an IAM role. The role can be a regular role or a
  /// service-linked role. If a tag with the same key name already exists, then
  /// that tag is overwritten with the new value.
  ///
  /// A tag consists of a key name and an associated value. By assigning tags to
  /// your resources, you can do the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Administrative grouping and discovery</b> - Attach tags to resources to
  /// aid in organization and search. For example, you could search for all
  /// resources with the key name <i>Project</i> and the value
  /// <i>MyImportantProject</i>. Or search for all resources with the key name
  /// <i>Cost Center</i> and the value <i>41200</i>.
  /// </li>
  /// <li>
  /// <b>Access control</b> - Reference tags in IAM user-based and
  /// resource-based policies. You can use tags to restrict access to only an
  /// IAM user or role that has a specified tag attached. You can also restrict
  /// access to only those resources that have a certain tag attached. For
  /// examples of policies that show how to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// Access Using IAM Tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Cost allocation</b> - Use tags to help track which individuals and
  /// teams are using which AWS resources.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// Make sure that you have no invalid tags and that you do not exceed the
  /// allowed number of tags per role. In either case, the entire request fails
  /// and <i>no</i> tags are added to the role.
  /// </li>
  /// <li>
  /// AWS always interprets the tag <code>Value</code> as a single string. If
  /// you need to store an array, you can store comma-separated values in the
  /// string. However, you must interpret the value in your code.
  /// </li>
  /// </ul> </note>
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the role that you want to add tags to.
  ///
  /// This parameter accepts (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consist of upper and lowercase alphanumeric characters
  /// with no spaces. You can also include any of the following characters:
  /// _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the role. Each tag consists of
  /// a key name and an associated value. You can specify this with a JSON
  /// string.
  Future<void> tagRole({
    @_s.required String roleName,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagRoleRequest'],
      shapes: shapes,
    );
  }

  /// Adds one or more tags to an IAM user. If a tag with the same key name
  /// already exists, then that tag is overwritten with the new value.
  ///
  /// A tag consists of a key name and an associated value. By assigning tags to
  /// your resources, you can do the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Administrative grouping and discovery</b> - Attach tags to resources to
  /// aid in organization and search. For example, you could search for all
  /// resources with the key name <i>Project</i> and the value
  /// <i>MyImportantProject</i>. Or search for all resources with the key name
  /// <i>Cost Center</i> and the value <i>41200</i>.
  /// </li>
  /// <li>
  /// <b>Access control</b> - Reference tags in IAM user-based and
  /// resource-based policies. You can use tags to restrict access to only an
  /// IAM requesting user or to a role that has a specified tag attached. You
  /// can also restrict access to only those resources that have a certain tag
  /// attached. For examples of policies that show how to use tags to control
  /// access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// Access Using IAM Tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Cost allocation</b> - Use tags to help track which individuals and
  /// teams are using which AWS resources.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// Make sure that you have no invalid tags and that you do not exceed the
  /// allowed number of tags per role. In either case, the entire request fails
  /// and <i>no</i> tags are added to the role.
  /// </li>
  /// <li>
  /// AWS always interprets the tag <code>Value</code> as a single string. If
  /// you need to store an array, you can store comma-separated values in the
  /// string. However, you must interpret the value in your code.
  /// </li>
  /// </ul> </note>
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the user. Each tag consists of
  /// a key name and an associated value.
  ///
  /// Parameter [userName] :
  /// The name of the user that you want to add tags to.
  ///
  /// This parameter accepts (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consist of upper and lowercase alphanumeric characters
  /// with no spaces. You can also include any of the following characters:
  /// =,.@-
  Future<void> tagUser({
    @_s.required List<Tag> tags,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(tags, 'tags');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Tags'] = tags;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'TagUser',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagUserRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the role. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the IAM role from which you want to remove tags.
  ///
  /// This parameter accepts (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consist of upper and lowercase alphanumeric characters
  /// with no spaces. You can also include any of the following characters:
  /// _+=,.@-
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified role.
  Future<void> untagRole({
    @_s.required String roleName,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagRoleRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the user. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified user.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user from which you want to remove tags.
  ///
  /// This parameter accepts (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consist of upper and lowercase alphanumeric characters
  /// with no spaces. You can also include any of the following characters:
  /// =,.@-
  Future<void> untagUser({
    @_s.required List<String> tagKeys,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['TagKeys'] = tagKeys;
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'UntagUser',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagUserRequest'],
      shapes: shapes,
    );
  }

  /// Changes the status of the specified access key from Active to Inactive, or
  /// vice versa. This operation can be used to disable a user's key as part of
  /// a key rotation workflow.
  ///
  /// If the <code>UserName</code> is not specified, the user name is determined
  /// implicitly based on the AWS access key ID used to sign the request. This
  /// operation works for access keys under the AWS account. Consequently, you
  /// can use this operation to manage AWS account root user credentials even if
  /// the AWS account has no associated users.
  ///
  /// For information about rotating keys, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingCredentials.html">Managing
  /// Keys and Certificates</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accessKeyId] :
  /// The access key ID of the secret access key you want to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [status] :
  /// The status you want to assign to the secret access key.
  /// <code>Active</code> means that the key can be used for API calls to AWS,
  /// while <code>Inactive</code> means that the key cannot be used.
  ///
  /// Parameter [userName] :
  /// The name of the user whose key you want to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateAccessKey({
    @_s.required String accessKeyId,
    @_s.required StatusType status,
    String userName,
  }) async {
    ArgumentError.checkNotNull(accessKeyId, 'accessKeyId');
    _s.validateStringLength(
      'accessKeyId',
      accessKeyId,
      16,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accessKeyId',
      accessKeyId,
      r'''[\w]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['AccessKeyId'] = accessKeyId;
    $request['Status'] = status.toValue();
    userName?.also((arg) => $request['UserName'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateAccessKey',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateAccessKeyRequest'],
      shapes: shapes,
    );
  }

  /// Updates the password policy settings for the AWS account.
  /// <note>
  /// <ul>
  /// <li>
  /// This operation does not support partial updates. No parameters are
  /// required, but if you do not specify a parameter, that parameter's value
  /// reverts to its default value. See the <b>Request Parameters</b> section
  /// for each parameter's default value. Also note that some parameters do not
  /// allow the default parameter to be explicitly set. Instead, to invoke the
  /// default value, do not include that parameter when you invoke the
  /// operation.
  /// </li>
  /// </ul> </note>
  /// For more information about using a password policy, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html">Managing
  /// an IAM Password Policy</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [allowUsersToChangePassword] :
  /// Allows all IAM users in your account to use the AWS Management Console to
  /// change their own passwords. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/HowToPwdIAMUser.html">Letting
  /// IAM Users Change Their Own Passwords</a> in the <i>IAM User Guide</i>.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that IAM users in
  /// the account do not automatically have permissions to change their own
  /// password.
  ///
  /// Parameter [hardExpiry] :
  /// Prevents IAM users from setting a new password after their password has
  /// expired. The IAM user cannot be accessed until an administrator resets the
  /// password.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that IAM users can
  /// change their passwords after they expire and continue to sign in as the
  /// user.
  ///
  /// Parameter [maxPasswordAge] :
  /// The number of days that an IAM user password is valid.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>0</code>. The result is that IAM user passwords
  /// never expire.
  ///
  /// Parameter [minimumPasswordLength] :
  /// The minimum number of characters allowed in an IAM user password.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>6</code>.
  ///
  /// Parameter [passwordReusePrevention] :
  /// Specifies the number of previous passwords that IAM users are prevented
  /// from reusing.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>0</code>. The result is that IAM users are not
  /// prevented from reusing previous passwords.
  ///
  /// Parameter [requireLowercaseCharacters] :
  /// Specifies whether IAM user passwords must contain at least one lowercase
  /// character from the ISO basic Latin alphabet (a to z).
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that passwords do
  /// not require at least one lowercase character.
  ///
  /// Parameter [requireNumbers] :
  /// Specifies whether IAM user passwords must contain at least one numeric
  /// character (0 to 9).
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that passwords do
  /// not require at least one numeric character.
  ///
  /// Parameter [requireSymbols] :
  /// Specifies whether IAM user passwords must contain at least one of the
  /// following non-alphanumeric characters:
  ///
  /// ! @ # $ % ^ &amp; * ( ) _ + - = [ ] { } | '
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that passwords do
  /// not require at least one symbol character.
  ///
  /// Parameter [requireUppercaseCharacters] :
  /// Specifies whether IAM user passwords must contain at least one uppercase
  /// character from the ISO basic Latin alphabet (A to Z).
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that passwords do
  /// not require at least one uppercase character.
  Future<void> updateAccountPasswordPolicy({
    bool allowUsersToChangePassword,
    bool hardExpiry,
    int maxPasswordAge,
    int minimumPasswordLength,
    int passwordReusePrevention,
    bool requireLowercaseCharacters,
    bool requireNumbers,
    bool requireSymbols,
    bool requireUppercaseCharacters,
  }) async {
    _s.validateNumRange(
      'maxPasswordAge',
      maxPasswordAge,
      1,
      1095,
    );
    _s.validateNumRange(
      'minimumPasswordLength',
      minimumPasswordLength,
      6,
      128,
    );
    _s.validateNumRange(
      'passwordReusePrevention',
      passwordReusePrevention,
      1,
      24,
    );
    final $request = <String, dynamic>{};
    allowUsersToChangePassword
        ?.also((arg) => $request['AllowUsersToChangePassword'] = arg);
    hardExpiry?.also((arg) => $request['HardExpiry'] = arg);
    maxPasswordAge?.also((arg) => $request['MaxPasswordAge'] = arg);
    minimumPasswordLength
        ?.also((arg) => $request['MinimumPasswordLength'] = arg);
    passwordReusePrevention
        ?.also((arg) => $request['PasswordReusePrevention'] = arg);
    requireLowercaseCharacters
        ?.also((arg) => $request['RequireLowercaseCharacters'] = arg);
    requireNumbers?.also((arg) => $request['RequireNumbers'] = arg);
    requireSymbols?.also((arg) => $request['RequireSymbols'] = arg);
    requireUppercaseCharacters
        ?.also((arg) => $request['RequireUppercaseCharacters'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateAccountPasswordPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateAccountPasswordPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Updates the policy that grants an IAM entity permission to assume a role.
  /// This is typically referred to as the "role trust policy". For more
  /// information about roles, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">Using
  /// Roles to Delegate Permissions and Federate Identities</a>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [LimitExceededException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The policy that grants an entity permission to assume the role.
  ///
  /// You must provide policies in JSON format in IAM. However, for AWS
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. AWS CloudFormation always converts a YAML policy to
  /// JSON format before submitting it to IAM.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [roleName] :
  /// The name of the role to update with the new policy.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateAssumeRolePolicy({
    @_s.required String policyDocument,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyDocument',
      policyDocument,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['PolicyDocument'] = policyDocument;
    $request['RoleName'] = roleName;
    await _protocol.send(
      $request,
      action: 'UpdateAssumeRolePolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateAssumeRolePolicyRequest'],
      shapes: shapes,
    );
  }

  /// Updates the name and/or the path of the specified IAM group.
  /// <important>
  /// You should understand the implications of changing a group's path or name.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_WorkingWithGroupsAndUsers.html">Renaming
  /// Users and Groups</a> in the <i>IAM User Guide</i>.
  /// </important> <note>
  /// The person making the request (the principal), must have permission to
  /// change the role group with the old name and the new name. For example, to
  /// change the group named <code>Managers</code> to <code>MGRs</code>, the
  /// principal must have a policy that allows them to update both groups. If
  /// the principal has permission to update the <code>Managers</code> group,
  /// but not the <code>MGRs</code> group, then the update fails. For more
  /// information about permissions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html">Access
  /// Management</a>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [groupName] :
  /// Name of the IAM group to update. If you're changing the name of the group,
  /// this is the original name.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [newGroupName] :
  /// New name for the IAM group. Only include this if changing the group's
  /// name.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  ///
  /// Parameter [newPath] :
  /// New path for the IAM group. Only include this if changing the group's
  /// path.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  Future<void> updateGroup({
    @_s.required String groupName,
    String newGroupName,
    String newPath,
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
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'newGroupName',
      newGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'newGroupName',
      newGroupName,
      r'''[\w+=,.@-]+''',
    );
    _s.validateStringLength(
      'newPath',
      newPath,
      1,
      512,
    );
    _s.validateStringPattern(
      'newPath',
      newPath,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    final $request = <String, dynamic>{};
    $request['GroupName'] = groupName;
    newGroupName?.also((arg) => $request['NewGroupName'] = arg);
    newPath?.also((arg) => $request['NewPath'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateGroup',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateGroupRequest'],
      shapes: shapes,
    );
  }

  /// Changes the password for the specified IAM user.
  ///
  /// IAM users can change their own passwords by calling <a>ChangePassword</a>.
  /// For more information about modifying passwords, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing
  /// Passwords</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [NoSuchEntityException].
  /// May throw [PasswordPolicyViolationException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the user whose password you want to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [password] :
  /// The new password for the specified IAM user.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  /// However, the format can be further restricted by the account administrator
  /// by setting a password policy on the AWS account. For more information, see
  /// <a>UpdateAccountPasswordPolicy</a>.
  ///
  /// Parameter [passwordResetRequired] :
  /// Allows this new password to be used only once by requiring the specified
  /// IAM user to set a new password on next sign-in.
  Future<void> updateLoginProfile({
    @_s.required String userName,
    String password,
    bool passwordResetRequired,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'password',
      password,
      1,
      128,
    );
    _s.validateStringPattern(
      'password',
      password,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    password?.also((arg) => $request['Password'] = arg);
    passwordResetRequired
        ?.also((arg) => $request['PasswordResetRequired'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateLoginProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateLoginProfileRequest'],
      shapes: shapes,
    );
  }

  /// Replaces the existing list of server certificate thumbprints associated
  /// with an OpenID Connect (OIDC) provider resource object with a new list of
  /// thumbprints.
  ///
  /// The list that you pass with this operation completely replaces the
  /// existing list of thumbprints. (The lists are not merged.)
  ///
  /// Typically, you need to update a thumbprint only when the identity
  /// provider's certificate changes, which occurs rarely. However, if the
  /// provider's certificate <i>does</i> change, any attempt to assume an IAM
  /// role that specifies the OIDC provider as a principal fails until the
  /// certificate thumbprint is updated.
  /// <note>
  /// Trust for the OIDC provider is derived from the provider's certificate and
  /// is validated by the thumbprint. Therefore, it is best to limit access to
  /// the <code>UpdateOpenIDConnectProviderThumbprint</code> operation to highly
  /// privileged users.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The Amazon Resource Name (ARN) of the IAM OIDC provider resource object
  /// for which you want to update the thumbprint. You can get a list of OIDC
  /// provider ARNs by using the <a>ListOpenIDConnectProviders</a> operation.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  ///
  /// Parameter [thumbprintList] :
  /// A list of certificate thumbprints that are associated with the specified
  /// IAM OpenID Connect provider. For more information, see
  /// <a>CreateOpenIDConnectProvider</a>.
  Future<void> updateOpenIDConnectProviderThumbprint({
    @_s.required String openIDConnectProviderArn,
    @_s.required List<String> thumbprintList,
  }) async {
    ArgumentError.checkNotNull(
        openIDConnectProviderArn, 'openIDConnectProviderArn');
    _s.validateStringLength(
      'openIDConnectProviderArn',
      openIDConnectProviderArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(thumbprintList, 'thumbprintList');
    final $request = <String, dynamic>{};
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    $request['ThumbprintList'] = thumbprintList;
    await _protocol.send(
      $request,
      action: 'UpdateOpenIDConnectProviderThumbprint',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateOpenIDConnectProviderThumbprintRequest'],
      shapes: shapes,
    );
  }

  /// Updates the description or maximum session duration setting of a role.
  ///
  /// May throw [UnmodifiableEntityException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the role that you want to modify.
  ///
  /// Parameter [description] :
  /// The new description that you want to apply to the specified role.
  ///
  /// Parameter [maxSessionDuration] :
  /// The maximum session duration (in seconds) that you want to set for the
  /// specified role. If you do not specify a value for this setting, the
  /// default maximum of one hour is applied. This setting can have a value from
  /// 1 hour to 12 hours.
  ///
  /// Anyone who assumes the role from the AWS CLI or API can use the
  /// <code>DurationSeconds</code> API parameter or the
  /// <code>duration-seconds</code> CLI parameter to request a longer session.
  /// The <code>MaxSessionDuration</code> setting determines the maximum
  /// duration that can be requested using the <code>DurationSeconds</code>
  /// parameter. If users don't specify a value for the
  /// <code>DurationSeconds</code> parameter, their security credentials are
  /// valid for one hour by default. This applies when you use the
  /// <code>AssumeRole*</code> API operations or the <code>assume-role*</code>
  /// CLI operations but does not apply when you use those operations to create
  /// a console URL. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using
  /// IAM Roles</a> in the <i>IAM User Guide</i>.
  Future<void> updateRole({
    @_s.required String roleName,
    String description,
    int maxSessionDuration,
  }) async {
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
    );
    _s.validateNumRange(
      'maxSessionDuration',
      maxSessionDuration,
      3600,
      43200,
    );
    final $request = <String, dynamic>{};
    $request['RoleName'] = roleName;
    description?.also((arg) => $request['Description'] = arg);
    maxSessionDuration?.also((arg) => $request['MaxSessionDuration'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateRole',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateRoleRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateRoleResult',
    );
  }

  /// Use <a>UpdateRole</a> instead.
  ///
  /// Modifies only the description of a role. This operation performs the same
  /// function as the <code>Description</code> parameter in the
  /// <code>UpdateRole</code> operation.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [description] :
  /// The new description that you want to apply to the specified role.
  ///
  /// Parameter [roleName] :
  /// The name of the role that you want to modify.
  Future<UpdateRoleDescriptionResponse> updateRoleDescription({
    @_s.required String description,
    @_s.required String roleName,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleName, 'roleName');
    _s.validateStringLength(
      'roleName',
      roleName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['Description'] = description;
    $request['RoleName'] = roleName;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateRoleDescription',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateRoleDescriptionRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateRoleDescriptionResult',
    );
    return UpdateRoleDescriptionResponse.fromXml($result);
  }

  /// Updates the metadata document for an existing SAML provider resource
  /// object.
  /// <note>
  /// This operation requires <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sAMLMetadataDocument] :
  /// An XML document generated by an identity provider (IdP) that supports SAML
  /// 2.0. The document includes the issuer's name, expiration information, and
  /// keys that can be used to validate the SAML authentication response
  /// (assertions) that are received from the IdP. You must generate the
  /// metadata document using the identity management software that is used as
  /// your organization's IdP.
  ///
  /// Parameter [sAMLProviderArn] :
  /// The Amazon Resource Name (ARN) of the SAML provider to update.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  Future<UpdateSAMLProviderResponse> updateSAMLProvider({
    @_s.required String sAMLMetadataDocument,
    @_s.required String sAMLProviderArn,
  }) async {
    ArgumentError.checkNotNull(sAMLMetadataDocument, 'sAMLMetadataDocument');
    _s.validateStringLength(
      'sAMLMetadataDocument',
      sAMLMetadataDocument,
      1000,
      10000000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sAMLProviderArn, 'sAMLProviderArn');
    _s.validateStringLength(
      'sAMLProviderArn',
      sAMLProviderArn,
      20,
      2048,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SAMLMetadataDocument'] = sAMLMetadataDocument;
    $request['SAMLProviderArn'] = sAMLProviderArn;
    final $result = await _protocol.send(
      $request,
      action: 'UpdateSAMLProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateSAMLProviderRequest'],
      shapes: shapes,
      resultWrapper: 'UpdateSAMLProviderResult',
    );
    return UpdateSAMLProviderResponse.fromXml($result);
  }

  /// Sets the status of an IAM user's SSH public key to active or inactive. SSH
  /// public keys that are inactive cannot be used for authentication. This
  /// operation can be used to disable a user's SSH public key as part of a key
  /// rotation work flow.
  ///
  /// The SSH public key affected by this operation is used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up AWS CodeCommit for SSH Connections</a> in the <i>AWS CodeCommit User
  /// Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  ///
  /// Parameter [sSHPublicKeyId] :
  /// The unique identifier for the SSH public key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [status] :
  /// The status to assign to the SSH public key. <code>Active</code> means that
  /// the key can be used for authentication with an AWS CodeCommit repository.
  /// <code>Inactive</code> means that the key cannot be used.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user associated with the SSH public key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateSSHPublicKey({
    @_s.required String sSHPublicKeyId,
    @_s.required StatusType status,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(sSHPublicKeyId, 'sSHPublicKeyId');
    _s.validateStringLength(
      'sSHPublicKeyId',
      sSHPublicKeyId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sSHPublicKeyId',
      sSHPublicKeyId,
      r'''[\w]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SSHPublicKeyId'] = sSHPublicKeyId;
    $request['Status'] = status.toValue();
    $request['UserName'] = userName;
    await _protocol.send(
      $request,
      action: 'UpdateSSHPublicKey',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateSSHPublicKeyRequest'],
      shapes: shapes,
    );
  }

  /// Updates the name and/or the path of the specified server certificate
  /// stored in IAM.
  ///
  /// For more information about working with server certificates, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with Server Certificates</a> in the <i>IAM User Guide</i>. This topic also
  /// includes a list of AWS services that can use the server certificates that
  /// you manage with IAM.
  /// <important>
  /// You should understand the implications of changing a server certificate's
  /// path or name. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs_manage.html#RenamingServerCerts">Renaming
  /// a Server Certificate</a> in the <i>IAM User Guide</i>.
  /// </important> <note>
  /// The person making the request (the principal), must have permission to
  /// change the server certificate with the old name and the new name. For
  /// example, to change the certificate named <code>ProductionCert</code> to
  /// <code>ProdCert</code>, the principal must have a policy that allows them
  /// to update both certificates. If the principal has permission to update the
  /// <code>ProductionCert</code> group, but not the <code>ProdCert</code>
  /// certificate, then the update fails. For more information about
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html">Access
  /// Management</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serverCertificateName] :
  /// The name of the server certificate that you want to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [newPath] :
  /// The new path for the server certificate. Include this only if you are
  /// updating the server certificate's path.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  ///
  /// Parameter [newServerCertificateName] :
  /// The new name for the server certificate. Include this only if you are
  /// updating the server certificate's name. The name of the certificate cannot
  /// contain any spaces.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateServerCertificate({
    @_s.required String serverCertificateName,
    String newPath,
    String newServerCertificateName,
  }) async {
    ArgumentError.checkNotNull(serverCertificateName, 'serverCertificateName');
    _s.validateStringLength(
      'serverCertificateName',
      serverCertificateName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverCertificateName',
      serverCertificateName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'newPath',
      newPath,
      1,
      512,
    );
    _s.validateStringPattern(
      'newPath',
      newPath,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    _s.validateStringLength(
      'newServerCertificateName',
      newServerCertificateName,
      1,
      128,
    );
    _s.validateStringPattern(
      'newServerCertificateName',
      newServerCertificateName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['ServerCertificateName'] = serverCertificateName;
    newPath?.also((arg) => $request['NewPath'] = arg);
    newServerCertificateName
        ?.also((arg) => $request['NewServerCertificateName'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateServerCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateServerCertificateRequest'],
      shapes: shapes,
    );
  }

  /// Sets the status of a service-specific credential to <code>Active</code> or
  /// <code>Inactive</code>. Service-specific credentials that are inactive
  /// cannot be used for authentication to the service. This operation can be
  /// used to disable a user's service-specific credential as part of a
  /// credential rotation work flow.
  ///
  /// May throw [NoSuchEntityException].
  ///
  /// Parameter [serviceSpecificCredentialId] :
  /// The unique identifier of the service-specific credential.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [status] :
  /// The status to be assigned to the service-specific credential.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user associated with the service-specific credential.
  /// If you do not specify this value, then the operation assumes the user
  /// whose credentials are used to call the operation.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateServiceSpecificCredential({
    @_s.required String serviceSpecificCredentialId,
    @_s.required StatusType status,
    String userName,
  }) async {
    ArgumentError.checkNotNull(
        serviceSpecificCredentialId, 'serviceSpecificCredentialId');
    _s.validateStringLength(
      'serviceSpecificCredentialId',
      serviceSpecificCredentialId,
      20,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceSpecificCredentialId',
      serviceSpecificCredentialId,
      r'''[\w]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['ServiceSpecificCredentialId'] = serviceSpecificCredentialId;
    $request['Status'] = status.toValue();
    userName?.also((arg) => $request['UserName'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateServiceSpecificCredential',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateServiceSpecificCredentialRequest'],
      shapes: shapes,
    );
  }

  /// Changes the status of the specified user signing certificate from active
  /// to disabled, or vice versa. This operation can be used to disable an IAM
  /// user's signing certificate as part of a certificate rotation work flow.
  ///
  /// If the <code>UserName</code> field is not specified, the user name is
  /// determined implicitly based on the AWS access key ID used to sign the
  /// request. This operation works for access keys under the AWS account.
  /// Consequently, you can use this operation to manage AWS account root user
  /// credentials even if the AWS account has no associated users.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the signing certificate you want to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  ///
  /// Parameter [status] :
  /// The status you want to assign to the certificate. <code>Active</code>
  /// means that the certificate can be used for API calls to AWS
  /// <code>Inactive</code> means that the certificate cannot be used.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user the signing certificate belongs to.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateSigningCertificate({
    @_s.required String certificateId,
    @_s.required StatusType status,
    String userName,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      24,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''[\w]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['CertificateId'] = certificateId;
    $request['Status'] = status.toValue();
    userName?.also((arg) => $request['UserName'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateSigningCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateSigningCertificateRequest'],
      shapes: shapes,
    );
  }

  /// Updates the name and/or the path of the specified IAM user.
  /// <important>
  /// You should understand the implications of changing an IAM user's path or
  /// name. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_renaming">Renaming
  /// an IAM User</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_rename.html">Renaming
  /// an IAM Group</a> in the <i>IAM User Guide</i>.
  /// </important> <note>
  /// To change a user name, the requester must have appropriate permissions on
  /// both the source object and the target object. For example, to change Bob
  /// to Robert, the entity making the request must have permission on Bob and
  /// Robert, or must have permission on all (*). For more information about
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html">Permissions
  /// and Policies</a>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// Name of the user to update. If you're changing the name of the user, this
  /// is the original user name.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [newPath] :
  /// New path for the IAM user. Include this parameter only if you're changing
  /// the user's path.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  ///
  /// Parameter [newUserName] :
  /// New name for the user. Include this parameter only if you're changing the
  /// user's name.
  ///
  /// IAM user, group, role, and policy names must be unique within the account.
  /// Names are not distinguished by case. For example, you cannot create
  /// resources named both "MyResource" and "myresource".
  Future<void> updateUser({
    @_s.required String userName,
    String newPath,
    String newUserName,
  }) async {
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'newPath',
      newPath,
      1,
      512,
    );
    _s.validateStringPattern(
      'newPath',
      newPath,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    _s.validateStringLength(
      'newUserName',
      newUserName,
      1,
      64,
    );
    _s.validateStringPattern(
      'newUserName',
      newUserName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['UserName'] = userName;
    newPath?.also((arg) => $request['NewPath'] = arg);
    newUserName?.also((arg) => $request['NewUserName'] = arg);
    await _protocol.send(
      $request,
      action: 'UpdateUser',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UpdateUserRequest'],
      shapes: shapes,
    );
  }

  /// Uploads an SSH public key and associates it with the specified IAM user.
  ///
  /// The SSH public key uploaded by this operation can be used only for
  /// authenticating the associated IAM user to an AWS CodeCommit repository.
  /// For more information about using SSH keys to authenticate to an AWS
  /// CodeCommit repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up AWS CodeCommit for SSH Connections</a> in the <i>AWS CodeCommit User
  /// Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidPublicKeyException].
  /// May throw [DuplicateSSHPublicKeyException].
  /// May throw [UnrecognizedPublicKeyEncodingException].
  ///
  /// Parameter [sSHPublicKeyBody] :
  /// The SSH public key. The public key must be encoded in ssh-rsa format or
  /// PEM format. The minimum bit-length of the public key is 2048 bits. For
  /// example, you can generate a 2048-bit key, and the resulting PEM file is
  /// 1679 bytes long.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [userName] :
  /// The name of the IAM user to associate the SSH public key with.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<UploadSSHPublicKeyResponse> uploadSSHPublicKey({
    @_s.required String sSHPublicKeyBody,
    @_s.required String userName,
  }) async {
    ArgumentError.checkNotNull(sSHPublicKeyBody, 'sSHPublicKeyBody');
    _s.validateStringLength(
      'sSHPublicKeyBody',
      sSHPublicKeyBody,
      1,
      16384,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sSHPublicKeyBody',
      sSHPublicKeyBody,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userName, 'userName');
    _s.validateStringLength(
      'userName',
      userName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['SSHPublicKeyBody'] = sSHPublicKeyBody;
    $request['UserName'] = userName;
    final $result = await _protocol.send(
      $request,
      action: 'UploadSSHPublicKey',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UploadSSHPublicKeyRequest'],
      shapes: shapes,
      resultWrapper: 'UploadSSHPublicKeyResult',
    );
    return UploadSSHPublicKeyResponse.fromXml($result);
  }

  /// Uploads a server certificate entity for the AWS account. The server
  /// certificate entity includes a public key certificate, a private key, and
  /// an optional certificate chain, which should all be PEM-encoded.
  ///
  /// We recommend that you use <a href="https://docs.aws.amazon.com/acm/">AWS
  /// Certificate Manager</a> to provision, manage, and deploy your server
  /// certificates. With ACM you can request a certificate, deploy it to AWS
  /// resources, and let ACM handle certificate renewals for you. Certificates
  /// provided by ACM are free. For more information about using ACM, see the <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/">AWS Certificate
  /// Manager User Guide</a>.
  ///
  /// For more information about working with server certificates, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with Server Certificates</a> in the <i>IAM User Guide</i>. This topic
  /// includes a list of AWS services that can use the server certificates that
  /// you manage with IAM.
  ///
  /// For information about the number of server certificates you can upload,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html">Limitations
  /// on IAM Entities and Objects</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because the body of the public key certificate, private key, and the
  /// certificate chain can be large, you should use POST rather than GET when
  /// calling <code>UploadServerCertificate</code>. For information about
  /// setting up signatures and authorization through the API, go to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html">Signing
  /// AWS API Requests</a> in the <i>AWS General Reference</i>. For general
  /// information about using the Query API with IAM, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/programming.html">Calling
  /// the API by Making HTTP Query Requests</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [MalformedCertificateException].
  /// May throw [KeyPairMismatchException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [certificateBody] :
  /// The contents of the public key certificate in PEM-encoded format.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [privateKey] :
  /// The contents of the private key in PEM-encoded format.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [serverCertificateName] :
  /// The name for the server certificate. Do not include the path in this
  /// value. The name of the certificate cannot contain any spaces.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [certificateChain] :
  /// The contents of the certificate chain. This is typically a concatenation
  /// of the PEM-encoded public key certificates of the chain.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [path] :
  /// The path for the server certificate. For more information about paths, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. If it is not included, it defaults to a slash
  /// (/). This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of either a forward slash (/) by itself or a string
  /// that must begin and end with forward slashes. In addition, it can contain
  /// any ASCII character from the ! (<code>\u0021</code>) through the DEL
  /// character (<code>\u007F</code>), including most punctuation characters,
  /// digits, and upper and lowercased letters.
  /// <note>
  /// If you are uploading a server certificate specifically for use with Amazon
  /// CloudFront distributions, you must specify a path using the
  /// <code>path</code> parameter. The path must begin with
  /// <code>/cloudfront</code> and must include a trailing slash (for example,
  /// <code>/cloudfront/test/</code>).
  /// </note>
  Future<UploadServerCertificateResponse> uploadServerCertificate({
    @_s.required String certificateBody,
    @_s.required String privateKey,
    @_s.required String serverCertificateName,
    String certificateChain,
    String path,
  }) async {
    ArgumentError.checkNotNull(certificateBody, 'certificateBody');
    _s.validateStringLength(
      'certificateBody',
      certificateBody,
      1,
      16384,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateBody',
      certificateBody,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(privateKey, 'privateKey');
    _s.validateStringLength(
      'privateKey',
      privateKey,
      1,
      16384,
      isRequired: true,
    );
    _s.validateStringPattern(
      'privateKey',
      privateKey,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serverCertificateName, 'serverCertificateName');
    _s.validateStringLength(
      'serverCertificateName',
      serverCertificateName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serverCertificateName',
      serverCertificateName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'certificateChain',
      certificateChain,
      1,
      2097152,
    );
    _s.validateStringPattern(
      'certificateChain',
      certificateChain,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    _s.validateStringLength(
      'path',
      path,
      1,
      512,
    );
    _s.validateStringPattern(
      'path',
      path,
      r'''(\u002F)|(\u002F[\u0021-\u007F]+\u002F)''',
    );
    final $request = <String, dynamic>{};
    $request['CertificateBody'] = certificateBody;
    $request['PrivateKey'] = privateKey;
    $request['ServerCertificateName'] = serverCertificateName;
    certificateChain?.also((arg) => $request['CertificateChain'] = arg);
    path?.also((arg) => $request['Path'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UploadServerCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UploadServerCertificateRequest'],
      shapes: shapes,
      resultWrapper: 'UploadServerCertificateResult',
    );
    return UploadServerCertificateResponse.fromXml($result);
  }

  /// Uploads an X.509 signing certificate and associates it with the specified
  /// IAM user. Some AWS services use X.509 signing certificates to validate
  /// requests that are signed with a corresponding private key. When you upload
  /// the certificate, its default status is <code>Active</code>.
  ///
  /// If the <code>UserName</code> is not specified, the IAM user name is
  /// determined implicitly based on the AWS access key ID used to sign the
  /// request. This operation works for access keys under the AWS account.
  /// Consequently, you can use this operation to manage AWS account root user
  /// credentials even if the AWS account has no associated users.
  /// <note>
  /// Because the body of an X.509 certificate can be large, you should use POST
  /// rather than GET when calling <code>UploadSigningCertificate</code>. For
  /// information about setting up signatures and authorization through the API,
  /// go to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html">Signing
  /// AWS API Requests</a> in the <i>AWS General Reference</i>. For general
  /// information about using the Query API with IAM, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// Query Requests</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [MalformedCertificateException].
  /// May throw [InvalidCertificateException].
  /// May throw [DuplicateCertificateException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [certificateBody] :
  /// The contents of the signing certificate.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> used to
  /// validate this parameter is a string of characters consisting of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Any printable ASCII character ranging from the space character
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// </li>
  /// <li>
  /// The printable characters in the Basic Latin and Latin-1 Supplement
  /// character set (through <code>\u00FF</code>)
  /// </li>
  /// <li>
  /// The special characters tab (<code>\u0009</code>), line feed
  /// (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// </li>
  /// </ul>
  ///
  /// Parameter [userName] :
  /// The name of the user the signing certificate is for.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<UploadSigningCertificateResponse> uploadSigningCertificate({
    @_s.required String certificateBody,
    String userName,
  }) async {
    ArgumentError.checkNotNull(certificateBody, 'certificateBody');
    _s.validateStringLength(
      'certificateBody',
      certificateBody,
      1,
      16384,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateBody',
      certificateBody,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'userName',
      userName,
      1,
      128,
    );
    _s.validateStringPattern(
      'userName',
      userName,
      r'''[\w+=,.@-]+''',
    );
    final $request = <String, dynamic>{};
    $request['CertificateBody'] = certificateBody;
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'UploadSigningCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UploadSigningCertificateRequest'],
      shapes: shapes,
      resultWrapper: 'UploadSigningCertificateResult',
    );
    return UploadSigningCertificateResponse.fromXml($result);
  }
}

enum AccessAdvisorUsageGranularityType {
  @_s.JsonValue('SERVICE_LEVEL')
  serviceLevel,
  @_s.JsonValue('ACTION_LEVEL')
  actionLevel,
}

extension on AccessAdvisorUsageGranularityType {
  String toValue() {
    switch (this) {
      case AccessAdvisorUsageGranularityType.serviceLevel:
        return 'SERVICE_LEVEL';
      case AccessAdvisorUsageGranularityType.actionLevel:
        return 'ACTION_LEVEL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  AccessAdvisorUsageGranularityType toAccessAdvisorUsageGranularityType() {
    switch (this) {
      case 'SERVICE_LEVEL':
        return AccessAdvisorUsageGranularityType.serviceLevel;
      case 'ACTION_LEVEL':
        return AccessAdvisorUsageGranularityType.actionLevel;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that contains details about when a principal in the reported AWS
/// Organizations entity last attempted to access an AWS service. A principal
/// can be an IAM user, an IAM role, or the AWS account root user within the
/// reported Organizations entity.
///
/// This data type is a response element in the
/// <a>GetOrganizationsAccessReport</a> operation.
class AccessDetail {
  /// The name of the service in which access was attempted.
  final String serviceName;

  /// The namespace of the service in which access was attempted.
  ///
  /// To learn the service namespace of a service, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions,
  /// Resources, and Condition Keys for AWS Services</a> in the <i>IAM User
  /// Guide</i>. Choose the name of the service to view details for that service.
  /// In the first paragraph, find the service prefix. For example, <code>(service
  /// prefix: a4b)</code>. For more information about service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>AWS General Reference</i>.
  final String serviceNamespace;

  /// The path of the Organizations entity (root, organizational unit, or account)
  /// from which an authenticated principal last attempted to access the service.
  /// AWS does not report unauthenticated requests.
  ///
  /// This field is null if no principals (IAM users, IAM roles, or root users) in
  /// the reported Organizations entity attempted to access the service within the
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final String entityPath;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when an authenticated principal most recently
  /// attempted to access the service. AWS does not report unauthenticated
  /// requests.
  ///
  /// This field is null if no principals in the reported Organizations entity
  /// attempted to access the service within the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final DateTime lastAuthenticatedTime;

  /// The Region where the last service access attempt occurred.
  ///
  /// This field is null if no principals in the reported Organizations entity
  /// attempted to access the service within the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final String region;

  /// The number of accounts with authenticated principals (root users, IAM users,
  /// and IAM roles) that attempted to access the service in the reporting period.
  final int totalAuthenticatedEntities;

  AccessDetail({
    @_s.required this.serviceName,
    @_s.required this.serviceNamespace,
    this.entityPath,
    this.lastAuthenticatedTime,
    this.region,
    this.totalAuthenticatedEntities,
  });
  factory AccessDetail.fromXml(_s.XmlElement elem) {
    return AccessDetail(
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName'),
      serviceNamespace: _s.extractXmlStringValue(elem, 'ServiceNamespace'),
      entityPath: _s.extractXmlStringValue(elem, 'EntityPath'),
      lastAuthenticatedTime:
          _s.extractXmlDateTimeValue(elem, 'LastAuthenticatedTime'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      totalAuthenticatedEntities:
          _s.extractXmlIntValue(elem, 'TotalAuthenticatedEntities'),
    );
  }
}

/// Contains information about an AWS access key.
///
/// This data type is used as a response element in the <a>CreateAccessKey</a>
/// and <a>ListAccessKeys</a> operations.
/// <note>
/// The <code>SecretAccessKey</code> value is returned only in response to
/// <a>CreateAccessKey</a>. You can get a secret access key only when you first
/// create an access key; you cannot recover the secret access key later. If you
/// lose a secret access key, you must create a new access key.
/// </note>
class AccessKey {
  /// The ID for this access key.
  final String accessKeyId;

  /// The secret key used to sign requests.
  final String secretAccessKey;

  /// The status of the access key. <code>Active</code> means that the key is
  /// valid for API calls, while <code>Inactive</code> means it is not.
  final StatusType status;

  /// The name of the IAM user that the access key is associated with.
  final String userName;

  /// The date when the access key was created.
  final DateTime createDate;

  AccessKey({
    @_s.required this.accessKeyId,
    @_s.required this.secretAccessKey,
    @_s.required this.status,
    @_s.required this.userName,
    this.createDate,
  });
  factory AccessKey.fromXml(_s.XmlElement elem) {
    return AccessKey(
      accessKeyId: _s.extractXmlStringValue(elem, 'AccessKeyId'),
      secretAccessKey: _s.extractXmlStringValue(elem, 'SecretAccessKey'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
    );
  }
}

/// Contains information about the last time an AWS access key was used since
/// IAM began tracking this information on April 22, 2015.
///
/// This data type is used as a response element in the
/// <a>GetAccessKeyLastUsed</a> operation.
class AccessKeyLastUsed {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the access key was most recently used. This field
  /// is null in the following situations:
  ///
  /// <ul>
  /// <li>
  /// The user does not have an access key.
  /// </li>
  /// <li>
  /// An access key exists but has not been used since IAM began tracking this
  /// information.
  /// </li>
  /// <li>
  /// There is no sign-in data associated with the user.
  /// </li>
  /// </ul>
  final DateTime lastUsedDate;

  /// The AWS Region where this access key was most recently used. The value for
  /// this field is "N/A" in the following situations:
  ///
  /// <ul>
  /// <li>
  /// The user does not have an access key.
  /// </li>
  /// <li>
  /// An access key exists but has not been used since IAM began tracking this
  /// information.
  /// </li>
  /// <li>
  /// There is no sign-in data associated with the user.
  /// </li>
  /// </ul>
  /// For more information about AWS Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// Endpoints</a> in the Amazon Web Services General Reference.
  final String region;

  /// The name of the AWS service with which this access key was most recently
  /// used. The value of this field is "N/A" in the following situations:
  ///
  /// <ul>
  /// <li>
  /// The user does not have an access key.
  /// </li>
  /// <li>
  /// An access key exists but has not been used since IAM started tracking this
  /// information.
  /// </li>
  /// <li>
  /// There is no sign-in data associated with the user.
  /// </li>
  /// </ul>
  final String serviceName;

  AccessKeyLastUsed({
    @_s.required this.lastUsedDate,
    @_s.required this.region,
    @_s.required this.serviceName,
  });
  factory AccessKeyLastUsed.fromXml(_s.XmlElement elem) {
    return AccessKeyLastUsed(
      lastUsedDate: _s.extractXmlDateTimeValue(elem, 'LastUsedDate'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName'),
    );
  }
}

/// Contains information about an AWS access key, without its secret key.
///
/// This data type is used as a response element in the <a>ListAccessKeys</a>
/// operation.
class AccessKeyMetadata {
  /// The ID for this access key.
  final String accessKeyId;

  /// The date when the access key was created.
  final DateTime createDate;

  /// The status of the access key. <code>Active</code> means that the key is
  /// valid for API calls; <code>Inactive</code> means it is not.
  final StatusType status;

  /// The name of the IAM user that the key is associated with.
  final String userName;

  AccessKeyMetadata({
    this.accessKeyId,
    this.createDate,
    this.status,
    this.userName,
  });
  factory AccessKeyMetadata.fromXml(_s.XmlElement elem) {
    return AccessKeyMetadata(
      accessKeyId: _s.extractXmlStringValue(elem, 'AccessKeyId'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains information about an attached permissions boundary.
///
/// An attached permissions boundary is a managed policy that has been attached
/// to a user or role to set the permissions boundary.
///
/// For more information about permissions boundaries, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
/// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
class AttachedPermissionsBoundary {
  /// The ARN of the policy used to set the permissions boundary for the user or
  /// role.
  final String permissionsBoundaryArn;

  /// The permissions boundary usage type that indicates what type of IAM resource
  /// is used as the permissions boundary for an entity. This data type can only
  /// have a value of <code>Policy</code>.
  final PermissionsBoundaryAttachmentType permissionsBoundaryType;

  AttachedPermissionsBoundary({
    this.permissionsBoundaryArn,
    this.permissionsBoundaryType,
  });
  factory AttachedPermissionsBoundary.fromXml(_s.XmlElement elem) {
    return AttachedPermissionsBoundary(
      permissionsBoundaryArn:
          _s.extractXmlStringValue(elem, 'PermissionsBoundaryArn'),
      permissionsBoundaryType: _s
          .extractXmlStringValue(elem, 'PermissionsBoundaryType')
          ?.toPermissionsBoundaryAttachmentType(),
    );
  }
}

/// Contains information about an attached policy.
///
/// An attached policy is a managed policy that has been attached to a user,
/// group, or role. This data type is used as a response element in the
/// <a>ListAttachedGroupPolicies</a>, <a>ListAttachedRolePolicies</a>,
/// <a>ListAttachedUserPolicies</a>, and <a>GetAccountAuthorizationDetails</a>
/// operations.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
class AttachedPolicy {
  final String policyArn;

  /// The friendly name of the attached policy.
  final String policyName;

  AttachedPolicy({
    this.policyArn,
    this.policyName,
  });
  factory AttachedPolicy.fromXml(_s.XmlElement elem) {
    return AttachedPolicy(
      policyArn: _s.extractXmlStringValue(elem, 'PolicyArn'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
    );
  }
}

/// Contains information about a condition context key. It includes the name of
/// the key and specifies the value (or values, if the context key supports
/// multiple values) to use in the simulation. This information is used when
/// evaluating the <code>Condition</code> elements of the input policies.
///
/// This data type is used as an input parameter to <a>SimulateCustomPolicy</a>
/// and <a>SimulatePrincipalPolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ContextEntry {
  /// The full name of a condition context key, including the service prefix. For
  /// example, <code>aws:SourceIp</code> or <code>s3:VersionId</code>.
  @_s.JsonKey(name: 'ContextKeyName')
  final String contextKeyName;

  /// The data type of the value (or values) specified in the
  /// <code>ContextKeyValues</code> parameter.
  @_s.JsonKey(name: 'ContextKeyType')
  final ContextKeyTypeEnum contextKeyType;

  /// The value (or values, if the condition context key supports multiple values)
  /// to provide to the simulation when the key is referenced by a
  /// <code>Condition</code> element in an input policy.
  @_s.JsonKey(name: 'ContextKeyValues')
  final List<String> contextKeyValues;

  ContextEntry({
    this.contextKeyName,
    this.contextKeyType,
    this.contextKeyValues,
  });
  Map<String, dynamic> toJson() => _$ContextEntryToJson(this);
}

enum ContextKeyTypeEnum {
  @_s.JsonValue('string')
  string,
  @_s.JsonValue('stringList')
  stringList,
  @_s.JsonValue('numeric')
  numeric,
  @_s.JsonValue('numericList')
  numericList,
  @_s.JsonValue('boolean')
  boolean,
  @_s.JsonValue('booleanList')
  booleanList,
  @_s.JsonValue('ip')
  ip,
  @_s.JsonValue('ipList')
  ipList,
  @_s.JsonValue('binary')
  binary,
  @_s.JsonValue('binaryList')
  binaryList,
  @_s.JsonValue('date')
  date,
  @_s.JsonValue('dateList')
  dateList,
}

extension on String {
  ContextKeyTypeEnum toContextKeyTypeEnum() {
    switch (this) {
      case 'string':
        return ContextKeyTypeEnum.string;
      case 'stringList':
        return ContextKeyTypeEnum.stringList;
      case 'numeric':
        return ContextKeyTypeEnum.numeric;
      case 'numericList':
        return ContextKeyTypeEnum.numericList;
      case 'boolean':
        return ContextKeyTypeEnum.boolean;
      case 'booleanList':
        return ContextKeyTypeEnum.booleanList;
      case 'ip':
        return ContextKeyTypeEnum.ip;
      case 'ipList':
        return ContextKeyTypeEnum.ipList;
      case 'binary':
        return ContextKeyTypeEnum.binary;
      case 'binaryList':
        return ContextKeyTypeEnum.binaryList;
      case 'date':
        return ContextKeyTypeEnum.date;
      case 'dateList':
        return ContextKeyTypeEnum.dateList;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the response to a successful <a>CreateAccessKey</a> request.
class CreateAccessKeyResponse {
  /// A structure with details about the access key.
  final AccessKey accessKey;

  CreateAccessKeyResponse({
    @_s.required this.accessKey,
  });
  factory CreateAccessKeyResponse.fromXml(_s.XmlElement elem) {
    return CreateAccessKeyResponse(
      accessKey: _s
          .extractXmlChild(elem, 'AccessKey')
          ?.let((e) => AccessKey.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateGroup</a> request.
class CreateGroupResponse {
  /// A structure containing details about the new group.
  final Group group;

  CreateGroupResponse({
    @_s.required this.group,
  });
  factory CreateGroupResponse.fromXml(_s.XmlElement elem) {
    return CreateGroupResponse(
      group: _s.extractXmlChild(elem, 'Group')?.let((e) => Group.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateInstanceProfile</a> request.
class CreateInstanceProfileResponse {
  /// A structure containing details about the new instance profile.
  final InstanceProfile instanceProfile;

  CreateInstanceProfileResponse({
    @_s.required this.instanceProfile,
  });
  factory CreateInstanceProfileResponse.fromXml(_s.XmlElement elem) {
    return CreateInstanceProfileResponse(
      instanceProfile: _s
          .extractXmlChild(elem, 'InstanceProfile')
          ?.let((e) => InstanceProfile.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateLoginProfile</a> request.
class CreateLoginProfileResponse {
  /// A structure containing the user name and password create date.
  final LoginProfile loginProfile;

  CreateLoginProfileResponse({
    @_s.required this.loginProfile,
  });
  factory CreateLoginProfileResponse.fromXml(_s.XmlElement elem) {
    return CreateLoginProfileResponse(
      loginProfile: _s
          .extractXmlChild(elem, 'LoginProfile')
          ?.let((e) => LoginProfile.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateOpenIDConnectProvider</a>
/// request.
class CreateOpenIDConnectProviderResponse {
  /// The Amazon Resource Name (ARN) of the new IAM OpenID Connect provider that
  /// is created. For more information, see <a>OpenIDConnectProviderListEntry</a>.
  final String openIDConnectProviderArn;

  CreateOpenIDConnectProviderResponse({
    this.openIDConnectProviderArn,
  });
  factory CreateOpenIDConnectProviderResponse.fromXml(_s.XmlElement elem) {
    return CreateOpenIDConnectProviderResponse(
      openIDConnectProviderArn:
          _s.extractXmlStringValue(elem, 'OpenIDConnectProviderArn'),
    );
  }
}

/// Contains the response to a successful <a>CreatePolicy</a> request.
class CreatePolicyResponse {
  /// A structure containing details about the new policy.
  final Policy policy;

  CreatePolicyResponse({
    this.policy,
  });
  factory CreatePolicyResponse.fromXml(_s.XmlElement elem) {
    return CreatePolicyResponse(
      policy: _s.extractXmlChild(elem, 'Policy')?.let((e) => Policy.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreatePolicyVersion</a> request.
class CreatePolicyVersionResponse {
  /// A structure containing details about the new policy version.
  final PolicyVersion policyVersion;

  CreatePolicyVersionResponse({
    this.policyVersion,
  });
  factory CreatePolicyVersionResponse.fromXml(_s.XmlElement elem) {
    return CreatePolicyVersionResponse(
      policyVersion: _s
          .extractXmlChild(elem, 'PolicyVersion')
          ?.let((e) => PolicyVersion.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateRole</a> request.
class CreateRoleResponse {
  /// A structure containing details about the new role.
  final Role role;

  CreateRoleResponse({
    @_s.required this.role,
  });
  factory CreateRoleResponse.fromXml(_s.XmlElement elem) {
    return CreateRoleResponse(
      role: _s.extractXmlChild(elem, 'Role')?.let((e) => Role.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateSAMLProvider</a> request.
class CreateSAMLProviderResponse {
  /// The Amazon Resource Name (ARN) of the new SAML provider resource in IAM.
  final String sAMLProviderArn;

  CreateSAMLProviderResponse({
    this.sAMLProviderArn,
  });
  factory CreateSAMLProviderResponse.fromXml(_s.XmlElement elem) {
    return CreateSAMLProviderResponse(
      sAMLProviderArn: _s.extractXmlStringValue(elem, 'SAMLProviderArn'),
    );
  }
}

class CreateServiceLinkedRoleResponse {
  /// A <a>Role</a> object that contains details about the newly created role.
  final Role role;

  CreateServiceLinkedRoleResponse({
    this.role,
  });
  factory CreateServiceLinkedRoleResponse.fromXml(_s.XmlElement elem) {
    return CreateServiceLinkedRoleResponse(
      role: _s.extractXmlChild(elem, 'Role')?.let((e) => Role.fromXml(e)),
    );
  }
}

class CreateServiceSpecificCredentialResponse {
  /// A structure that contains information about the newly created
  /// service-specific credential.
  /// <important>
  /// This is the only time that the password for this credential set is
  /// available. It cannot be recovered later. Instead, you must reset the
  /// password with <a>ResetServiceSpecificCredential</a>.
  /// </important>
  final ServiceSpecificCredential serviceSpecificCredential;

  CreateServiceSpecificCredentialResponse({
    this.serviceSpecificCredential,
  });
  factory CreateServiceSpecificCredentialResponse.fromXml(_s.XmlElement elem) {
    return CreateServiceSpecificCredentialResponse(
      serviceSpecificCredential: _s
          .extractXmlChild(elem, 'ServiceSpecificCredential')
          ?.let((e) => ServiceSpecificCredential.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateUser</a> request.
class CreateUserResponse {
  /// A structure with details about the new IAM user.
  final User user;

  CreateUserResponse({
    this.user,
  });
  factory CreateUserResponse.fromXml(_s.XmlElement elem) {
    return CreateUserResponse(
      user: _s.extractXmlChild(elem, 'User')?.let((e) => User.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>CreateVirtualMFADevice</a> request.
class CreateVirtualMFADeviceResponse {
  /// A structure containing details about the new virtual MFA device.
  final VirtualMFADevice virtualMFADevice;

  CreateVirtualMFADeviceResponse({
    @_s.required this.virtualMFADevice,
  });
  factory CreateVirtualMFADeviceResponse.fromXml(_s.XmlElement elem) {
    return CreateVirtualMFADeviceResponse(
      virtualMFADevice: _s
          .extractXmlChild(elem, 'VirtualMFADevice')
          ?.let((e) => VirtualMFADevice.fromXml(e)),
    );
  }
}

class DeleteServiceLinkedRoleResponse {
  /// The deletion task identifier that you can use to check the status of the
  /// deletion. This identifier is returned in the format
  /// <code>task/aws-service-role/&lt;service-principal-name&gt;/&lt;role-name&gt;/&lt;task-uuid&gt;</code>.
  final String deletionTaskId;

  DeleteServiceLinkedRoleResponse({
    @_s.required this.deletionTaskId,
  });
  factory DeleteServiceLinkedRoleResponse.fromXml(_s.XmlElement elem) {
    return DeleteServiceLinkedRoleResponse(
      deletionTaskId: _s.extractXmlStringValue(elem, 'DeletionTaskId'),
    );
  }
}

/// The reason that the service-linked role deletion failed.
///
/// This data type is used as a response element in the
/// <a>GetServiceLinkedRoleDeletionStatus</a> operation.
class DeletionTaskFailureReasonType {
  /// A short description of the reason that the service-linked role deletion
  /// failed.
  final String reason;

  /// A list of objects that contains details about the service-linked role
  /// deletion failure, if that information is returned by the service. If the
  /// service-linked role has active sessions or if any resources that were used
  /// by the role have not been deleted from the linked service, the role can't be
  /// deleted. This parameter includes a list of the resources that are associated
  /// with the role and the Region in which the resources are being used.
  final List<RoleUsageType> roleUsageList;

  DeletionTaskFailureReasonType({
    this.reason,
    this.roleUsageList,
  });
  factory DeletionTaskFailureReasonType.fromXml(_s.XmlElement elem) {
    return DeletionTaskFailureReasonType(
      reason: _s.extractXmlStringValue(elem, 'Reason'),
      roleUsageList: _s.extractXmlChild(elem, 'RoleUsageList')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => RoleUsageType.fromXml(c))
              .toList()),
    );
  }
}

enum DeletionTaskStatusType {
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('NOT_STARTED')
  notStarted,
}

extension on String {
  DeletionTaskStatusType toDeletionTaskStatusType() {
    switch (this) {
      case 'SUCCEEDED':
        return DeletionTaskStatusType.succeeded;
      case 'IN_PROGRESS':
        return DeletionTaskStatusType.inProgress;
      case 'FAILED':
        return DeletionTaskStatusType.failed;
      case 'NOT_STARTED':
        return DeletionTaskStatusType.notStarted;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that contains details about when the IAM entities (users or roles)
/// were last used in an attempt to access the specified AWS service.
///
/// This data type is a response element in the
/// <a>GetServiceLastAccessedDetailsWithEntities</a> operation.
class EntityDetails {
  /// The <code>EntityInfo</code> object that contains details about the entity
  /// (user or role).
  final EntityInfo entityInfo;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the authenticated entity last attempted to access
  /// AWS. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final DateTime lastAuthenticated;

  EntityDetails({
    @_s.required this.entityInfo,
    this.lastAuthenticated,
  });
  factory EntityDetails.fromXml(_s.XmlElement elem) {
    return EntityDetails(
      entityInfo: _s
          .extractXmlChild(elem, 'EntityInfo')
          ?.let((e) => EntityInfo.fromXml(e)),
      lastAuthenticated: _s.extractXmlDateTimeValue(elem, 'LastAuthenticated'),
    );
  }
}

/// Contains details about the specified entity (user or role).
///
/// This data type is an element of the <a>EntityDetails</a> object.
class EntityInfo {
  final String arn;

  /// The identifier of the entity (user or role).
  final String id;

  /// The name of the entity (user or role).
  final String name;

  /// The type of entity (user or role).
  final PolicyOwnerEntityType type;

  /// The path to the entity (user or role). For more information about paths, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  EntityInfo({
    @_s.required this.arn,
    @_s.required this.id,
    @_s.required this.name,
    @_s.required this.type,
    this.path,
  });
  factory EntityInfo.fromXml(_s.XmlElement elem) {
    return EntityInfo(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      type: _s.extractXmlStringValue(elem, 'Type')?.toPolicyOwnerEntityType(),
      path: _s.extractXmlStringValue(elem, 'Path'),
    );
  }
}

enum EntityType {
  @_s.JsonValue('User')
  user,
  @_s.JsonValue('Role')
  role,
  @_s.JsonValue('Group')
  group,
  @_s.JsonValue('LocalManagedPolicy')
  localManagedPolicy,
  @_s.JsonValue('AWSManagedPolicy')
  awsManagedPolicy,
}

extension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.user:
        return 'User';
      case EntityType.role:
        return 'Role';
      case EntityType.group:
        return 'Group';
      case EntityType.localManagedPolicy:
        return 'LocalManagedPolicy';
      case EntityType.awsManagedPolicy:
        return 'AWSManagedPolicy';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  EntityType toEntityType() {
    switch (this) {
      case 'User':
        return EntityType.user;
      case 'Role':
        return EntityType.role;
      case 'Group':
        return EntityType.group;
      case 'LocalManagedPolicy':
        return EntityType.localManagedPolicy;
      case 'AWSManagedPolicy':
        return EntityType.awsManagedPolicy;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about the reason that the operation failed.
///
/// This data type is used as a response element in the
/// <a>GetOrganizationsAccessReport</a>, <a>GetServiceLastAccessedDetails</a>,
/// and <a>GetServiceLastAccessedDetailsWithEntities</a> operations.
class ErrorDetails {
  /// The error code associated with the operation failure.
  final String code;

  /// Detailed information about the reason that the operation failed.
  final String message;

  ErrorDetails({
    @_s.required this.code,
    @_s.required this.message,
  });
  factory ErrorDetails.fromXml(_s.XmlElement elem) {
    return ErrorDetails(
      code: _s.extractXmlStringValue(elem, 'Code'),
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }
}

/// Contains the results of a simulation.
///
/// This data type is used by the return parameter of <code>
/// <a>SimulateCustomPolicy</a> </code> and <code>
/// <a>SimulatePrincipalPolicy</a> </code>.
class EvaluationResult {
  /// The name of the API operation tested on the indicated resource.
  final String evalActionName;

  /// The result of the simulation.
  final PolicyEvaluationDecisionType evalDecision;

  /// Additional details about the results of the cross-account evaluation
  /// decision. This parameter is populated for only cross-account simulations. It
  /// contains a brief summary of how each policy type contributes to the final
  /// evaluation decision.
  ///
  /// If the simulation evaluates policies within the same account and includes a
  /// resource ARN, then the parameter is present but the response is empty. If
  /// the simulation evaluates policies within the same account and specifies all
  /// resources (<code>*</code>), then the parameter is not returned.
  ///
  /// When you make a cross-account request, AWS evaluates the request in the
  /// trusting account and the trusted account. The request is allowed only if
  /// both evaluations return <code>true</code>. For more information about how
  /// policies are evaluated, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// Policies Within a Single Account</a>.
  ///
  /// If an AWS Organizations SCP included in the evaluation denies access, the
  /// simulation ends. In this case, policy evaluation does not proceed any
  /// further and this parameter is not returned.
  final Map<String, PolicyEvaluationDecisionType> evalDecisionDetails;

  /// The ARN of the resource that the indicated API operation was tested on.
  final String evalResourceName;

  /// A list of the statements in the input policies that determine the result for
  /// this scenario. Remember that even if multiple statements allow the operation
  /// on the resource, if only one statement denies that operation, then the
  /// explicit deny overrides any allow. In addition, the deny statement is the
  /// only entry included in the result.
  final List<Statement> matchedStatements;

  /// A list of context keys that are required by the included input policies but
  /// that were not provided by one of the input parameters. This list is used
  /// when the resource in a simulation is "*", either explicitly, or when the
  /// <code>ResourceArns</code> parameter blank. If you include a list of
  /// resources, then any missing context values are instead included under the
  /// <code>ResourceSpecificResults</code> section. To discover the context keys
  /// used by a set of policies, you can call <a>GetContextKeysForCustomPolicy</a>
  /// or <a>GetContextKeysForPrincipalPolicy</a>.
  final List<String> missingContextValues;

  /// A structure that details how Organizations and its service control policies
  /// affect the results of the simulation. Only applies if the simulated user's
  /// account is part of an organization.
  final OrganizationsDecisionDetail organizationsDecisionDetail;

  /// Contains information about the effect that a permissions boundary has on a
  /// policy simulation when the boundary is applied to an IAM entity.
  final PermissionsBoundaryDecisionDetail permissionsBoundaryDecisionDetail;

  /// The individual results of the simulation of the API operation specified in
  /// EvalActionName on each resource.
  final List<ResourceSpecificResult> resourceSpecificResults;

  EvaluationResult({
    @_s.required this.evalActionName,
    @_s.required this.evalDecision,
    this.evalDecisionDetails,
    this.evalResourceName,
    this.matchedStatements,
    this.missingContextValues,
    this.organizationsDecisionDetail,
    this.permissionsBoundaryDecisionDetail,
    this.resourceSpecificResults,
  });
  factory EvaluationResult.fromXml(_s.XmlElement elem) {
    return EvaluationResult(
      evalActionName: _s.extractXmlStringValue(elem, 'EvalActionName'),
      evalDecision: _s
          .extractXmlStringValue(elem, 'EvalDecision')
          ?.toPolicyEvaluationDecisionType(),
      evalDecisionDetails: Map.fromEntries(
        elem.getElement('EvalDecisionDetails').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s
                    .extractXmlStringValue(c, 'value')
                    ?.toPolicyEvaluationDecisionType(),
              ),
            ),
      ),
      evalResourceName: _s.extractXmlStringValue(elem, 'EvalResourceName'),
      matchedStatements: _s.extractXmlChild(elem, 'MatchedStatements')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => Statement.fromXml(c))
              .toList()),
      missingContextValues: _s
          .extractXmlChild(elem, 'MissingContextValues')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      organizationsDecisionDetail: _s
          .extractXmlChild(elem, 'OrganizationsDecisionDetail')
          ?.let((e) => OrganizationsDecisionDetail.fromXml(e)),
      permissionsBoundaryDecisionDetail: _s
          .extractXmlChild(elem, 'PermissionsBoundaryDecisionDetail')
          ?.let((e) => PermissionsBoundaryDecisionDetail.fromXml(e)),
      resourceSpecificResults: _s
          .extractXmlChild(elem, 'ResourceSpecificResults')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => ResourceSpecificResult.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the response to a successful <a>GenerateCredentialReport</a>
/// request.
class GenerateCredentialReportResponse {
  /// Information about the credential report.
  final String description;

  /// Information about the state of the credential report.
  final ReportStateType state;

  GenerateCredentialReportResponse({
    this.description,
    this.state,
  });
  factory GenerateCredentialReportResponse.fromXml(_s.XmlElement elem) {
    return GenerateCredentialReportResponse(
      description: _s.extractXmlStringValue(elem, 'Description'),
      state: _s.extractXmlStringValue(elem, 'State')?.toReportStateType(),
    );
  }
}

class GenerateOrganizationsAccessReportResponse {
  /// The job identifier that you can use in the
  /// <a>GetOrganizationsAccessReport</a> operation.
  final String jobId;

  GenerateOrganizationsAccessReportResponse({
    this.jobId,
  });
  factory GenerateOrganizationsAccessReportResponse.fromXml(
      _s.XmlElement elem) {
    return GenerateOrganizationsAccessReportResponse(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
    );
  }
}

class GenerateServiceLastAccessedDetailsResponse {
  /// The <code>JobId</code> that you can use in the
  /// <a>GetServiceLastAccessedDetails</a> or
  /// <a>GetServiceLastAccessedDetailsWithEntities</a> operations. The
  /// <code>JobId</code> returned by
  /// <code>GenerateServiceLastAccessedDetail</code> must be used by the same role
  /// within a session, or by the same user when used to call
  /// <code>GetServiceLastAccessedDetail</code>.
  final String jobId;

  GenerateServiceLastAccessedDetailsResponse({
    this.jobId,
  });
  factory GenerateServiceLastAccessedDetailsResponse.fromXml(
      _s.XmlElement elem) {
    return GenerateServiceLastAccessedDetailsResponse(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
    );
  }
}

/// Contains the response to a successful <a>GetAccessKeyLastUsed</a> request.
/// It is also returned as a member of the <a>AccessKeyMetaData</a> structure
/// returned by the <a>ListAccessKeys</a> action.
class GetAccessKeyLastUsedResponse {
  /// Contains information about the last time the access key was used.
  final AccessKeyLastUsed accessKeyLastUsed;

  /// The name of the AWS IAM user that owns this access key.
  /// <p/>
  final String userName;

  GetAccessKeyLastUsedResponse({
    this.accessKeyLastUsed,
    this.userName,
  });
  factory GetAccessKeyLastUsedResponse.fromXml(_s.XmlElement elem) {
    return GetAccessKeyLastUsedResponse(
      accessKeyLastUsed: _s
          .extractXmlChild(elem, 'AccessKeyLastUsed')
          ?.let((e) => AccessKeyLastUsed.fromXml(e)),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains the response to a successful <a>GetAccountAuthorizationDetails</a>
/// request.
class GetAccountAuthorizationDetailsResponse {
  /// A list containing information about IAM groups.
  final List<GroupDetail> groupDetailList;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  /// A list containing information about managed policies.
  final List<ManagedPolicyDetail> policies;

  /// A list containing information about IAM roles.
  final List<RoleDetail> roleDetailList;

  /// A list containing information about IAM users.
  final List<UserDetail> userDetailList;

  GetAccountAuthorizationDetailsResponse({
    this.groupDetailList,
    this.isTruncated,
    this.marker,
    this.policies,
    this.roleDetailList,
    this.userDetailList,
  });
  factory GetAccountAuthorizationDetailsResponse.fromXml(_s.XmlElement elem) {
    return GetAccountAuthorizationDetailsResponse(
      groupDetailList: _s.extractXmlChild(elem, 'GroupDetailList')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => GroupDetail.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      policies: _s.extractXmlChild(elem, 'Policies')?.let((elem) => elem
          .findElements('member')
          .map((c) => ManagedPolicyDetail.fromXml(c))
          .toList()),
      roleDetailList: _s.extractXmlChild(elem, 'RoleDetailList')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => RoleDetail.fromXml(c))
              .toList()),
      userDetailList: _s.extractXmlChild(elem, 'UserDetailList')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => UserDetail.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the response to a successful <a>GetAccountPasswordPolicy</a>
/// request.
class GetAccountPasswordPolicyResponse {
  /// A structure that contains details about the account's password policy.
  final PasswordPolicy passwordPolicy;

  GetAccountPasswordPolicyResponse({
    @_s.required this.passwordPolicy,
  });
  factory GetAccountPasswordPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetAccountPasswordPolicyResponse(
      passwordPolicy: _s
          .extractXmlChild(elem, 'PasswordPolicy')
          ?.let((e) => PasswordPolicy.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetAccountSummary</a> request.
class GetAccountSummaryResponse {
  /// A set of key–value pairs containing information about IAM entity usage and
  /// IAM quotas.
  final Map<SummaryKeyType, int> summaryMap;

  GetAccountSummaryResponse({
    this.summaryMap,
  });
  factory GetAccountSummaryResponse.fromXml(_s.XmlElement elem) {
    return GetAccountSummaryResponse(
      summaryMap: Map.fromEntries(
        elem.getElement('SummaryMap').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key')?.toSummaryKeyType(),
                _s.extractXmlIntValue(c, 'value'),
              ),
            ),
      ),
    );
  }
}

/// Contains the response to a successful
/// <a>GetContextKeysForPrincipalPolicy</a> or
/// <a>GetContextKeysForCustomPolicy</a> request.
class GetContextKeysForPolicyResponse {
  /// The list of context keys that are referenced in the input policies.
  final List<String> contextKeyNames;

  GetContextKeysForPolicyResponse({
    this.contextKeyNames,
  });
  factory GetContextKeysForPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetContextKeysForPolicyResponse(
      contextKeyNames: _s
          .extractXmlChild(elem, 'ContextKeyNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// Contains the response to a successful <a>GetCredentialReport</a> request.
class GetCredentialReportResponse {
  /// Contains the credential report. The report is Base64-encoded.
  final Uint8List content;

  /// The date and time when the credential report was created, in <a
  /// href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>.
  final DateTime generatedTime;

  /// The format (MIME type) of the credential report.
  final ReportFormatType reportFormat;

  GetCredentialReportResponse({
    this.content,
    this.generatedTime,
    this.reportFormat,
  });
  factory GetCredentialReportResponse.fromXml(_s.XmlElement elem) {
    return GetCredentialReportResponse(
      content: _s.extractXmlUint8ListValue(elem, 'Content'),
      generatedTime: _s.extractXmlDateTimeValue(elem, 'GeneratedTime'),
      reportFormat:
          _s.extractXmlStringValue(elem, 'ReportFormat')?.toReportFormatType(),
    );
  }
}

/// Contains the response to a successful <a>GetGroupPolicy</a> request.
class GetGroupPolicyResponse {
  /// The group the policy is associated with.
  final String groupName;

  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using AWS CloudFormation templates can be formatted in YAML. AWS
  /// CloudFormation always converts a YAML policy to JSON format before
  /// submitting it to IAM.
  final String policyDocument;

  /// The name of the policy.
  final String policyName;

  GetGroupPolicyResponse({
    @_s.required this.groupName,
    @_s.required this.policyDocument,
    @_s.required this.policyName,
  });
  factory GetGroupPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetGroupPolicyResponse(
      groupName: _s.extractXmlStringValue(elem, 'GroupName'),
      policyDocument: _s.extractXmlStringValue(elem, 'PolicyDocument'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
    );
  }
}

/// Contains the response to a successful <a>GetGroup</a> request.
class GetGroupResponse {
  /// A structure that contains details about the group.
  final Group group;

  /// A list of users in the group.
  final List<User> users;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  GetGroupResponse({
    @_s.required this.group,
    @_s.required this.users,
    this.isTruncated,
    this.marker,
  });
  factory GetGroupResponse.fromXml(_s.XmlElement elem) {
    return GetGroupResponse(
      group: _s.extractXmlChild(elem, 'Group')?.let((e) => Group.fromXml(e)),
      users: _s.extractXmlChild(elem, 'Users')?.let((elem) =>
          elem.findElements('member').map((c) => User.fromXml(c)).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>GetInstanceProfile</a> request.
class GetInstanceProfileResponse {
  /// A structure containing details about the instance profile.
  final InstanceProfile instanceProfile;

  GetInstanceProfileResponse({
    @_s.required this.instanceProfile,
  });
  factory GetInstanceProfileResponse.fromXml(_s.XmlElement elem) {
    return GetInstanceProfileResponse(
      instanceProfile: _s
          .extractXmlChild(elem, 'InstanceProfile')
          ?.let((e) => InstanceProfile.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetLoginProfile</a> request.
class GetLoginProfileResponse {
  /// A structure containing the user name and password create date for the user.
  final LoginProfile loginProfile;

  GetLoginProfileResponse({
    @_s.required this.loginProfile,
  });
  factory GetLoginProfileResponse.fromXml(_s.XmlElement elem) {
    return GetLoginProfileResponse(
      loginProfile: _s
          .extractXmlChild(elem, 'LoginProfile')
          ?.let((e) => LoginProfile.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetOpenIDConnectProvider</a>
/// request.
class GetOpenIDConnectProviderResponse {
  /// A list of client IDs (also known as audiences) that are associated with the
  /// specified IAM OIDC provider resource object. For more information, see
  /// <a>CreateOpenIDConnectProvider</a>.
  final List<String> clientIDList;

  /// The date and time when the IAM OIDC provider resource object was created in
  /// the AWS account.
  final DateTime createDate;

  /// A list of certificate thumbprints that are associated with the specified IAM
  /// OIDC provider resource object. For more information, see
  /// <a>CreateOpenIDConnectProvider</a>.
  final List<String> thumbprintList;

  /// The URL that the IAM OIDC provider resource object is associated with. For
  /// more information, see <a>CreateOpenIDConnectProvider</a>.
  final String url;

  GetOpenIDConnectProviderResponse({
    this.clientIDList,
    this.createDate,
    this.thumbprintList,
    this.url,
  });
  factory GetOpenIDConnectProviderResponse.fromXml(_s.XmlElement elem) {
    return GetOpenIDConnectProviderResponse(
      clientIDList: _s
          .extractXmlChild(elem, 'ClientIDList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      thumbprintList: _s
          .extractXmlChild(elem, 'ThumbprintList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      url: _s.extractXmlStringValue(elem, 'Url'),
    );
  }
}

class GetOrganizationsAccessReportResponse {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the report job was created.
  final DateTime jobCreationDate;

  /// The status of the job.
  final JobStatusType jobStatus;

  /// An object that contains details about the most recent attempt to access the
  /// service.
  final List<AccessDetail> accessDetails;
  final ErrorDetails errorDetails;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the generated report job was completed or failed.
  ///
  /// This field is null if the job is still in progress, as indicated by a job
  /// status value of <code>IN_PROGRESS</code>.
  final DateTime jobCompletionDate;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  /// The number of services that the applicable SCPs allow account principals to
  /// access.
  final int numberOfServicesAccessible;

  /// The number of services that account principals are allowed but did not
  /// attempt to access.
  final int numberOfServicesNotAccessed;

  GetOrganizationsAccessReportResponse({
    @_s.required this.jobCreationDate,
    @_s.required this.jobStatus,
    this.accessDetails,
    this.errorDetails,
    this.isTruncated,
    this.jobCompletionDate,
    this.marker,
    this.numberOfServicesAccessible,
    this.numberOfServicesNotAccessed,
  });
  factory GetOrganizationsAccessReportResponse.fromXml(_s.XmlElement elem) {
    return GetOrganizationsAccessReportResponse(
      jobCreationDate: _s.extractXmlDateTimeValue(elem, 'JobCreationDate'),
      jobStatus: _s.extractXmlStringValue(elem, 'JobStatus')?.toJobStatusType(),
      accessDetails: _s.extractXmlChild(elem, 'AccessDetails')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => AccessDetail.fromXml(c))
              .toList()),
      errorDetails: _s
          .extractXmlChild(elem, 'ErrorDetails')
          ?.let((e) => ErrorDetails.fromXml(e)),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      jobCompletionDate: _s.extractXmlDateTimeValue(elem, 'JobCompletionDate'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      numberOfServicesAccessible:
          _s.extractXmlIntValue(elem, 'NumberOfServicesAccessible'),
      numberOfServicesNotAccessed:
          _s.extractXmlIntValue(elem, 'NumberOfServicesNotAccessed'),
    );
  }
}

/// Contains the response to a successful <a>GetPolicy</a> request.
class GetPolicyResponse {
  /// A structure containing details about the policy.
  final Policy policy;

  GetPolicyResponse({
    this.policy,
  });
  factory GetPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetPolicyResponse(
      policy: _s.extractXmlChild(elem, 'Policy')?.let((e) => Policy.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetPolicyVersion</a> request.
class GetPolicyVersionResponse {
  /// A structure containing details about the policy version.
  final PolicyVersion policyVersion;

  GetPolicyVersionResponse({
    this.policyVersion,
  });
  factory GetPolicyVersionResponse.fromXml(_s.XmlElement elem) {
    return GetPolicyVersionResponse(
      policyVersion: _s
          .extractXmlChild(elem, 'PolicyVersion')
          ?.let((e) => PolicyVersion.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetRolePolicy</a> request.
class GetRolePolicyResponse {
  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using AWS CloudFormation templates can be formatted in YAML. AWS
  /// CloudFormation always converts a YAML policy to JSON format before
  /// submitting it to IAM.
  final String policyDocument;

  /// The name of the policy.
  final String policyName;

  /// The role the policy is associated with.
  final String roleName;

  GetRolePolicyResponse({
    @_s.required this.policyDocument,
    @_s.required this.policyName,
    @_s.required this.roleName,
  });
  factory GetRolePolicyResponse.fromXml(_s.XmlElement elem) {
    return GetRolePolicyResponse(
      policyDocument: _s.extractXmlStringValue(elem, 'PolicyDocument'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
      roleName: _s.extractXmlStringValue(elem, 'RoleName'),
    );
  }
}

/// Contains the response to a successful <a>GetRole</a> request.
class GetRoleResponse {
  /// A structure containing details about the IAM role.
  final Role role;

  GetRoleResponse({
    @_s.required this.role,
  });
  factory GetRoleResponse.fromXml(_s.XmlElement elem) {
    return GetRoleResponse(
      role: _s.extractXmlChild(elem, 'Role')?.let((e) => Role.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetSAMLProvider</a> request.
class GetSAMLProviderResponse {
  /// The date and time when the SAML provider was created.
  final DateTime createDate;

  /// The XML metadata document that includes information about an identity
  /// provider.
  final String sAMLMetadataDocument;

  /// The expiration date and time for the SAML provider.
  final DateTime validUntil;

  GetSAMLProviderResponse({
    this.createDate,
    this.sAMLMetadataDocument,
    this.validUntil,
  });
  factory GetSAMLProviderResponse.fromXml(_s.XmlElement elem) {
    return GetSAMLProviderResponse(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      sAMLMetadataDocument:
          _s.extractXmlStringValue(elem, 'SAMLMetadataDocument'),
      validUntil: _s.extractXmlDateTimeValue(elem, 'ValidUntil'),
    );
  }
}

/// Contains the response to a successful <a>GetSSHPublicKey</a> request.
class GetSSHPublicKeyResponse {
  /// A structure containing details about the SSH public key.
  final SSHPublicKey sSHPublicKey;

  GetSSHPublicKeyResponse({
    this.sSHPublicKey,
  });
  factory GetSSHPublicKeyResponse.fromXml(_s.XmlElement elem) {
    return GetSSHPublicKeyResponse(
      sSHPublicKey: _s
          .extractXmlChild(elem, 'SSHPublicKey')
          ?.let((e) => SSHPublicKey.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetServerCertificate</a> request.
class GetServerCertificateResponse {
  /// A structure containing details about the server certificate.
  final ServerCertificate serverCertificate;

  GetServerCertificateResponse({
    @_s.required this.serverCertificate,
  });
  factory GetServerCertificateResponse.fromXml(_s.XmlElement elem) {
    return GetServerCertificateResponse(
      serverCertificate: _s
          .extractXmlChild(elem, 'ServerCertificate')
          ?.let((e) => ServerCertificate.fromXml(e)),
    );
  }
}

class GetServiceLastAccessedDetailsResponse {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the generated report job was completed or failed.
  ///
  /// This field is null if the job is still in progress, as indicated by a job
  /// status value of <code>IN_PROGRESS</code>.
  final DateTime jobCompletionDate;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the report job was created.
  final DateTime jobCreationDate;

  /// The status of the job.
  final JobStatusType jobStatus;

  /// A <code>ServiceLastAccessed</code> object that contains details about the
  /// most recent attempt to access the service.
  final List<ServiceLastAccessed> servicesLastAccessed;

  /// An object that contains details about the reason the operation failed.
  final ErrorDetails error;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// The type of job. Service jobs return information about when each service was
  /// last accessed. Action jobs also include information about when tracked
  /// actions within the service were last accessed.
  final AccessAdvisorUsageGranularityType jobType;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  GetServiceLastAccessedDetailsResponse({
    @_s.required this.jobCompletionDate,
    @_s.required this.jobCreationDate,
    @_s.required this.jobStatus,
    @_s.required this.servicesLastAccessed,
    this.error,
    this.isTruncated,
    this.jobType,
    this.marker,
  });
  factory GetServiceLastAccessedDetailsResponse.fromXml(_s.XmlElement elem) {
    return GetServiceLastAccessedDetailsResponse(
      jobCompletionDate: _s.extractXmlDateTimeValue(elem, 'JobCompletionDate'),
      jobCreationDate: _s.extractXmlDateTimeValue(elem, 'JobCreationDate'),
      jobStatus: _s.extractXmlStringValue(elem, 'JobStatus')?.toJobStatusType(),
      servicesLastAccessed: _s
          .extractXmlChild(elem, 'ServicesLastAccessed')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => ServiceLastAccessed.fromXml(c))
              .toList()),
      error: _s
          .extractXmlChild(elem, 'Error')
          ?.let((e) => ErrorDetails.fromXml(e)),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      jobType: _s
          .extractXmlStringValue(elem, 'JobType')
          ?.toAccessAdvisorUsageGranularityType(),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class GetServiceLastAccessedDetailsWithEntitiesResponse {
  /// An <code>EntityDetailsList</code> object that contains details about when an
  /// IAM entity (user or role) used group or policy permissions in an attempt to
  /// access the specified AWS service.
  final List<EntityDetails> entityDetailsList;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the generated report job was completed or failed.
  ///
  /// This field is null if the job is still in progress, as indicated by a job
  /// status value of <code>IN_PROGRESS</code>.
  final DateTime jobCompletionDate;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the report job was created.
  final DateTime jobCreationDate;

  /// The status of the job.
  final JobStatusType jobStatus;

  /// An object that contains details about the reason the operation failed.
  final ErrorDetails error;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  GetServiceLastAccessedDetailsWithEntitiesResponse({
    @_s.required this.entityDetailsList,
    @_s.required this.jobCompletionDate,
    @_s.required this.jobCreationDate,
    @_s.required this.jobStatus,
    this.error,
    this.isTruncated,
    this.marker,
  });
  factory GetServiceLastAccessedDetailsWithEntitiesResponse.fromXml(
      _s.XmlElement elem) {
    return GetServiceLastAccessedDetailsWithEntitiesResponse(
      entityDetailsList: _s.extractXmlChild(elem, 'EntityDetailsList')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => EntityDetails.fromXml(c))
              .toList()),
      jobCompletionDate: _s.extractXmlDateTimeValue(elem, 'JobCompletionDate'),
      jobCreationDate: _s.extractXmlDateTimeValue(elem, 'JobCreationDate'),
      jobStatus: _s.extractXmlStringValue(elem, 'JobStatus')?.toJobStatusType(),
      error: _s
          .extractXmlChild(elem, 'Error')
          ?.let((e) => ErrorDetails.fromXml(e)),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class GetServiceLinkedRoleDeletionStatusResponse {
  /// The status of the deletion.
  final DeletionTaskStatusType status;

  /// An object that contains details about the reason the deletion failed.
  final DeletionTaskFailureReasonType reason;

  GetServiceLinkedRoleDeletionStatusResponse({
    @_s.required this.status,
    this.reason,
  });
  factory GetServiceLinkedRoleDeletionStatusResponse.fromXml(
      _s.XmlElement elem) {
    return GetServiceLinkedRoleDeletionStatusResponse(
      status:
          _s.extractXmlStringValue(elem, 'Status')?.toDeletionTaskStatusType(),
      reason: _s
          .extractXmlChild(elem, 'Reason')
          ?.let((e) => DeletionTaskFailureReasonType.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>GetUserPolicy</a> request.
class GetUserPolicyResponse {
  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using AWS CloudFormation templates can be formatted in YAML. AWS
  /// CloudFormation always converts a YAML policy to JSON format before
  /// submitting it to IAM.
  final String policyDocument;

  /// The name of the policy.
  final String policyName;

  /// The user the policy is associated with.
  final String userName;

  GetUserPolicyResponse({
    @_s.required this.policyDocument,
    @_s.required this.policyName,
    @_s.required this.userName,
  });
  factory GetUserPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetUserPolicyResponse(
      policyDocument: _s.extractXmlStringValue(elem, 'PolicyDocument'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains the response to a successful <a>GetUser</a> request.
class GetUserResponse {
  /// A structure containing details about the IAM user.
  /// <important>
  /// Due to a service issue, password last used data does not include password
  /// use from May 3, 2018 22:50 PDT to May 23, 2018 14:08 PDT. This affects <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_finding-unused.html">last
  /// sign-in</a> dates shown in the IAM console and password last used dates in
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html">IAM
  /// credential report</a>, and returned by this GetUser API. If users signed in
  /// during the affected time, the password last used date that is returned is
  /// the date the user last signed in before May 3, 2018. For users that signed
  /// in after May 23, 2018 14:08 PDT, the returned password last used date is
  /// accurate.
  ///
  /// You can use password last used information to identify unused credentials
  /// for deletion. For example, you might delete users who did not sign in to AWS
  /// in the last 90 days. In cases like this, we recommend that you adjust your
  /// evaluation window to include dates after May 23, 2018. Alternatively, if
  /// your users use access keys to access AWS programmatically you can refer to
  /// access key last used information because it is accurate for all dates.
  /// </important>
  final User user;

  GetUserResponse({
    @_s.required this.user,
  });
  factory GetUserResponse.fromXml(_s.XmlElement elem) {
    return GetUserResponse(
      user: _s.extractXmlChild(elem, 'User')?.let((e) => User.fromXml(e)),
    );
  }
}

/// Contains information about an IAM group entity.
///
/// This data type is used as a response element in the following operations:
///
/// <ul>
/// <li>
/// <a>CreateGroup</a>
/// </li>
/// <li>
/// <a>GetGroup</a>
/// </li>
/// <li>
/// <a>ListGroups</a>
/// </li>
/// </ul>
class Group {
  /// The Amazon Resource Name (ARN) specifying the group. For more information
  /// about ARNs and how to use them in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the group was created.
  final DateTime createDate;

  /// The stable and unique string identifying the group. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String groupId;

  /// The friendly name that identifies the group.
  final String groupName;

  /// The path to the group. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  Group({
    @_s.required this.arn,
    @_s.required this.createDate,
    @_s.required this.groupId,
    @_s.required this.groupName,
    @_s.required this.path,
  });
  factory Group.fromXml(_s.XmlElement elem) {
    return Group(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      groupId: _s.extractXmlStringValue(elem, 'GroupId'),
      groupName: _s.extractXmlStringValue(elem, 'GroupName'),
      path: _s.extractXmlStringValue(elem, 'Path'),
    );
  }
}

/// Contains information about an IAM group, including all of the group's
/// policies.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class GroupDetail {
  final String arn;

  /// A list of the managed policies attached to the group.
  final List<AttachedPolicy> attachedManagedPolicies;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the group was created.
  final DateTime createDate;

  /// The stable and unique string identifying the group. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String groupId;

  /// The friendly name that identifies the group.
  final String groupName;

  /// A list of the inline policies embedded in the group.
  final List<PolicyDetail> groupPolicyList;

  /// The path to the group. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  GroupDetail({
    this.arn,
    this.attachedManagedPolicies,
    this.createDate,
    this.groupId,
    this.groupName,
    this.groupPolicyList,
    this.path,
  });
  factory GroupDetail.fromXml(_s.XmlElement elem) {
    return GroupDetail(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      attachedManagedPolicies: _s
          .extractXmlChild(elem, 'AttachedManagedPolicies')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => AttachedPolicy.fromXml(c))
              .toList()),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      groupId: _s.extractXmlStringValue(elem, 'GroupId'),
      groupName: _s.extractXmlStringValue(elem, 'GroupName'),
      groupPolicyList: _s.extractXmlChild(elem, 'GroupPolicyList')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => PolicyDetail.fromXml(c))
              .toList()),
      path: _s.extractXmlStringValue(elem, 'Path'),
    );
  }
}

/// Contains information about an instance profile.
///
/// This data type is used as a response element in the following operations:
///
/// <ul>
/// <li>
/// <a>CreateInstanceProfile</a>
/// </li>
/// <li>
/// <a>GetInstanceProfile</a>
/// </li>
/// <li>
/// <a>ListInstanceProfiles</a>
/// </li>
/// <li>
/// <a>ListInstanceProfilesForRole</a>
/// </li>
/// </ul>
class InstanceProfile {
  /// The Amazon Resource Name (ARN) specifying the instance profile. For more
  /// information about ARNs and how to use them in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The date when the instance profile was created.
  final DateTime createDate;

  /// The stable and unique string identifying the instance profile. For more
  /// information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String instanceProfileId;

  /// The name identifying the instance profile.
  final String instanceProfileName;

  /// The path to the instance profile. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The role associated with the instance profile.
  final List<Role> roles;

  InstanceProfile({
    @_s.required this.arn,
    @_s.required this.createDate,
    @_s.required this.instanceProfileId,
    @_s.required this.instanceProfileName,
    @_s.required this.path,
    @_s.required this.roles,
  });
  factory InstanceProfile.fromXml(_s.XmlElement elem) {
    return InstanceProfile(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      instanceProfileId: _s.extractXmlStringValue(elem, 'InstanceProfileId'),
      instanceProfileName:
          _s.extractXmlStringValue(elem, 'InstanceProfileName'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      roles: _s.extractXmlChild(elem, 'Roles')?.let((elem) =>
          elem.findElements('member').map((c) => Role.fromXml(c)).toList()),
    );
  }
}

/// Contains the response to a successful <a>ListAccessKeys</a> request.
class ListAccessKeysResponse {
  /// A list of objects containing metadata about the access keys.
  final List<AccessKeyMetadata> accessKeyMetadata;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListAccessKeysResponse({
    @_s.required this.accessKeyMetadata,
    this.isTruncated,
    this.marker,
  });
  factory ListAccessKeysResponse.fromXml(_s.XmlElement elem) {
    return ListAccessKeysResponse(
      accessKeyMetadata: _s.extractXmlChild(elem, 'AccessKeyMetadata')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AccessKeyMetadata.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListAccountAliases</a> request.
class ListAccountAliasesResponse {
  /// A list of aliases associated with the account. AWS supports only one alias
  /// per account.
  final List<String> accountAliases;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListAccountAliasesResponse({
    @_s.required this.accountAliases,
    this.isTruncated,
    this.marker,
  });
  factory ListAccountAliasesResponse.fromXml(_s.XmlElement elem) {
    return ListAccountAliasesResponse(
      accountAliases: _s
          .extractXmlChild(elem, 'AccountAliases')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListAttachedGroupPolicies</a>
/// request.
class ListAttachedGroupPoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy> attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListAttachedGroupPoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  factory ListAttachedGroupPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListAttachedGroupPoliciesResponse(
      attachedPolicies: _s.extractXmlChild(elem, 'AttachedPolicies')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AttachedPolicy.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListAttachedRolePolicies</a>
/// request.
class ListAttachedRolePoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy> attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListAttachedRolePoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  factory ListAttachedRolePoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListAttachedRolePoliciesResponse(
      attachedPolicies: _s.extractXmlChild(elem, 'AttachedPolicies')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AttachedPolicy.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListAttachedUserPolicies</a>
/// request.
class ListAttachedUserPoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy> attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListAttachedUserPoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  factory ListAttachedUserPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListAttachedUserPoliciesResponse(
      attachedPolicies: _s.extractXmlChild(elem, 'AttachedPolicies')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => AttachedPolicy.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListEntitiesForPolicy</a> request.
class ListEntitiesForPolicyResponse {
  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  /// A list of IAM groups that the policy is attached to.
  final List<PolicyGroup> policyGroups;

  /// A list of IAM roles that the policy is attached to.
  final List<PolicyRole> policyRoles;

  /// A list of IAM users that the policy is attached to.
  final List<PolicyUser> policyUsers;

  ListEntitiesForPolicyResponse({
    this.isTruncated,
    this.marker,
    this.policyGroups,
    this.policyRoles,
    this.policyUsers,
  });
  factory ListEntitiesForPolicyResponse.fromXml(_s.XmlElement elem) {
    return ListEntitiesForPolicyResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      policyGroups: _s.extractXmlChild(elem, 'PolicyGroups')?.let((elem) => elem
          .findElements('member')
          .map((c) => PolicyGroup.fromXml(c))
          .toList()),
      policyRoles: _s.extractXmlChild(elem, 'PolicyRoles')?.let((elem) => elem
          .findElements('member')
          .map((c) => PolicyRole.fromXml(c))
          .toList()),
      policyUsers: _s.extractXmlChild(elem, 'PolicyUsers')?.let((elem) => elem
          .findElements('member')
          .map((c) => PolicyUser.fromXml(c))
          .toList()),
    );
  }
}

/// Contains the response to a successful <a>ListGroupPolicies</a> request.
class ListGroupPoliciesResponse {
  /// A list of policy names.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with no
  /// spaces. You can also include any of the following characters: _+=,.@-
  final List<String> policyNames;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListGroupPoliciesResponse({
    @_s.required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  factory ListGroupPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListGroupPoliciesResponse(
      policyNames: _s
          .extractXmlChild(elem, 'PolicyNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListGroupsForUser</a> request.
class ListGroupsForUserResponse {
  /// A list of groups.
  final List<Group> groups;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListGroupsForUserResponse({
    @_s.required this.groups,
    this.isTruncated,
    this.marker,
  });
  factory ListGroupsForUserResponse.fromXml(_s.XmlElement elem) {
    return ListGroupsForUserResponse(
      groups: _s.extractXmlChild(elem, 'Groups')?.let((elem) =>
          elem.findElements('member').map((c) => Group.fromXml(c)).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListGroups</a> request.
class ListGroupsResponse {
  /// A list of groups.
  final List<Group> groups;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListGroupsResponse({
    @_s.required this.groups,
    this.isTruncated,
    this.marker,
  });
  factory ListGroupsResponse.fromXml(_s.XmlElement elem) {
    return ListGroupsResponse(
      groups: _s.extractXmlChild(elem, 'Groups')?.let((elem) =>
          elem.findElements('member').map((c) => Group.fromXml(c)).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListInstanceProfilesForRole</a>
/// request.
class ListInstanceProfilesForRoleResponse {
  /// A list of instance profiles.
  final List<InstanceProfile> instanceProfiles;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListInstanceProfilesForRoleResponse({
    @_s.required this.instanceProfiles,
    this.isTruncated,
    this.marker,
  });
  factory ListInstanceProfilesForRoleResponse.fromXml(_s.XmlElement elem) {
    return ListInstanceProfilesForRoleResponse(
      instanceProfiles: _s.extractXmlChild(elem, 'InstanceProfiles')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => InstanceProfile.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListInstanceProfiles</a> request.
class ListInstanceProfilesResponse {
  /// A list of instance profiles.
  final List<InstanceProfile> instanceProfiles;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListInstanceProfilesResponse({
    @_s.required this.instanceProfiles,
    this.isTruncated,
    this.marker,
  });
  factory ListInstanceProfilesResponse.fromXml(_s.XmlElement elem) {
    return ListInstanceProfilesResponse(
      instanceProfiles: _s.extractXmlChild(elem, 'InstanceProfiles')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => InstanceProfile.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListMFADevices</a> request.
class ListMFADevicesResponse {
  /// A list of MFA devices.
  final List<MFADevice> mFADevices;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListMFADevicesResponse({
    @_s.required this.mFADevices,
    this.isTruncated,
    this.marker,
  });
  factory ListMFADevicesResponse.fromXml(_s.XmlElement elem) {
    return ListMFADevicesResponse(
      mFADevices: _s.extractXmlChild(elem, 'MFADevices')?.let((elem) => elem
          .findElements('member')
          .map((c) => MFADevice.fromXml(c))
          .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListOpenIDConnectProviders</a>
/// request.
class ListOpenIDConnectProvidersResponse {
  /// The list of IAM OIDC provider resource objects defined in the AWS account.
  final List<OpenIDConnectProviderListEntry> openIDConnectProviderList;

  ListOpenIDConnectProvidersResponse({
    this.openIDConnectProviderList,
  });
  factory ListOpenIDConnectProvidersResponse.fromXml(_s.XmlElement elem) {
    return ListOpenIDConnectProvidersResponse(
      openIDConnectProviderList: _s
          .extractXmlChild(elem, 'OpenIDConnectProviderList')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => OpenIDConnectProviderListEntry.fromXml(c))
              .toList()),
    );
  }
}

/// Contains details about the permissions policies that are attached to the
/// specified identity (user, group, or role).
///
/// This data type is used as a response element in the
/// <a>ListPoliciesGrantingServiceAccess</a> operation.
class ListPoliciesGrantingServiceAccessEntry {
  /// The <code>PoliciesGrantingServiceAccess</code> object that contains details
  /// about the policy.
  final List<PolicyGrantingServiceAccess> policies;

  /// The namespace of the service that was accessed.
  ///
  /// To learn the service namespace of a service, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions,
  /// Resources, and Condition Keys for AWS Services</a> in the <i>IAM User
  /// Guide</i>. Choose the name of the service to view details for that service.
  /// In the first paragraph, find the service prefix. For example, <code>(service
  /// prefix: a4b)</code>. For more information about service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>AWS General Reference</i>.
  final String serviceNamespace;

  ListPoliciesGrantingServiceAccessEntry({
    this.policies,
    this.serviceNamespace,
  });
  factory ListPoliciesGrantingServiceAccessEntry.fromXml(_s.XmlElement elem) {
    return ListPoliciesGrantingServiceAccessEntry(
      policies: _s.extractXmlChild(elem, 'Policies')?.let((elem) => elem
          .findElements('member')
          .map((c) => PolicyGrantingServiceAccess.fromXml(c))
          .toList()),
      serviceNamespace: _s.extractXmlStringValue(elem, 'ServiceNamespace'),
    );
  }
}

class ListPoliciesGrantingServiceAccessResponse {
  /// A <code>ListPoliciesGrantingServiceAccess</code> object that contains
  /// details about the permissions policies attached to the specified identity
  /// (user, group, or role).
  final List<ListPoliciesGrantingServiceAccessEntry>
      policiesGrantingServiceAccess;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. We
  /// recommend that you check <code>IsTruncated</code> after every call to ensure
  /// that you receive all your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListPoliciesGrantingServiceAccessResponse({
    @_s.required this.policiesGrantingServiceAccess,
    this.isTruncated,
    this.marker,
  });
  factory ListPoliciesGrantingServiceAccessResponse.fromXml(
      _s.XmlElement elem) {
    return ListPoliciesGrantingServiceAccessResponse(
      policiesGrantingServiceAccess: _s
          .extractXmlChild(elem, 'PoliciesGrantingServiceAccess')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => ListPoliciesGrantingServiceAccessEntry.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListPolicies</a> request.
class ListPoliciesResponse {
  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  /// A list of policies.
  final List<Policy> policies;

  ListPoliciesResponse({
    this.isTruncated,
    this.marker,
    this.policies,
  });
  factory ListPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListPoliciesResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      policies: _s.extractXmlChild(elem, 'Policies')?.let((elem) =>
          elem.findElements('member').map((c) => Policy.fromXml(c)).toList()),
    );
  }
}

/// Contains the response to a successful <a>ListPolicyVersions</a> request.
class ListPolicyVersionsResponse {
  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  /// A list of policy versions.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  final List<PolicyVersion> versions;

  ListPolicyVersionsResponse({
    this.isTruncated,
    this.marker,
    this.versions,
  });
  factory ListPolicyVersionsResponse.fromXml(_s.XmlElement elem) {
    return ListPolicyVersionsResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      versions: _s.extractXmlChild(elem, 'Versions')?.let((elem) => elem
          .findElements('member')
          .map((c) => PolicyVersion.fromXml(c))
          .toList()),
    );
  }
}

/// Contains the response to a successful <a>ListRolePolicies</a> request.
class ListRolePoliciesResponse {
  /// A list of policy names.
  final List<String> policyNames;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListRolePoliciesResponse({
    @_s.required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  factory ListRolePoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListRolePoliciesResponse(
      policyNames: _s
          .extractXmlChild(elem, 'PolicyNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class ListRoleTagsResponse {
  /// The list of tags currently that is attached to the role. Each tag consists
  /// of a key name and an associated value. If no tags are attached to the
  /// specified role, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can use the <code>Marker</code> request
  /// parameter to make a subsequent pagination request that retrieves more items.
  /// Note that IAM might return fewer than the <code>MaxItems</code> number of
  /// results even when more results are available. Check <code>IsTruncated</code>
  /// after every call to ensure that you receive all of your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListRoleTagsResponse({
    @_s.required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListRoleTagsResponse.fromXml(_s.XmlElement elem) {
    return ListRoleTagsResponse(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListRoles</a> request.
class ListRolesResponse {
  /// A list of roles.
  final List<Role> roles;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListRolesResponse({
    @_s.required this.roles,
    this.isTruncated,
    this.marker,
  });
  factory ListRolesResponse.fromXml(_s.XmlElement elem) {
    return ListRolesResponse(
      roles: _s.extractXmlChild(elem, 'Roles')?.let((elem) =>
          elem.findElements('member').map((c) => Role.fromXml(c)).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListSAMLProviders</a> request.
class ListSAMLProvidersResponse {
  /// The list of SAML provider resource objects defined in IAM for this AWS
  /// account.
  final List<SAMLProviderListEntry> sAMLProviderList;

  ListSAMLProvidersResponse({
    this.sAMLProviderList,
  });
  factory ListSAMLProvidersResponse.fromXml(_s.XmlElement elem) {
    return ListSAMLProvidersResponse(
      sAMLProviderList: _s.extractXmlChild(elem, 'SAMLProviderList')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => SAMLProviderListEntry.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the response to a successful <a>ListSSHPublicKeys</a> request.
class ListSSHPublicKeysResponse {
  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  /// A list of the SSH public keys assigned to IAM user.
  final List<SSHPublicKeyMetadata> sSHPublicKeys;

  ListSSHPublicKeysResponse({
    this.isTruncated,
    this.marker,
    this.sSHPublicKeys,
  });
  factory ListSSHPublicKeysResponse.fromXml(_s.XmlElement elem) {
    return ListSSHPublicKeysResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      sSHPublicKeys: _s.extractXmlChild(elem, 'SSHPublicKeys')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => SSHPublicKeyMetadata.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the response to a successful <a>ListServerCertificates</a> request.
class ListServerCertificatesResponse {
  /// A list of server certificates.
  final List<ServerCertificateMetadata> serverCertificateMetadataList;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListServerCertificatesResponse({
    @_s.required this.serverCertificateMetadataList,
    this.isTruncated,
    this.marker,
  });
  factory ListServerCertificatesResponse.fromXml(_s.XmlElement elem) {
    return ListServerCertificatesResponse(
      serverCertificateMetadataList: _s
          .extractXmlChild(elem, 'ServerCertificateMetadataList')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => ServerCertificateMetadata.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class ListServiceSpecificCredentialsResponse {
  /// A list of structures that each contain details about a service-specific
  /// credential.
  final List<ServiceSpecificCredentialMetadata> serviceSpecificCredentials;

  ListServiceSpecificCredentialsResponse({
    this.serviceSpecificCredentials,
  });
  factory ListServiceSpecificCredentialsResponse.fromXml(_s.XmlElement elem) {
    return ListServiceSpecificCredentialsResponse(
      serviceSpecificCredentials: _s
          .extractXmlChild(elem, 'ServiceSpecificCredentials')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => ServiceSpecificCredentialMetadata.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the response to a successful <a>ListSigningCertificates</a>
/// request.
class ListSigningCertificatesResponse {
  /// A list of the user's signing certificate information.
  final List<SigningCertificate> certificates;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListSigningCertificatesResponse({
    @_s.required this.certificates,
    this.isTruncated,
    this.marker,
  });
  factory ListSigningCertificatesResponse.fromXml(_s.XmlElement elem) {
    return ListSigningCertificatesResponse(
      certificates: _s.extractXmlChild(elem, 'Certificates')?.let((elem) => elem
          .findElements('member')
          .map((c) => SigningCertificate.fromXml(c))
          .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListUserPolicies</a> request.
class ListUserPoliciesResponse {
  /// A list of policy names.
  final List<String> policyNames;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListUserPoliciesResponse({
    @_s.required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  factory ListUserPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListUserPoliciesResponse(
      policyNames: _s
          .extractXmlChild(elem, 'PolicyNames')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class ListUserTagsResponse {
  /// The list of tags that are currently attached to the user. Each tag consists
  /// of a key name and an associated value. If no tags are attached to the
  /// specified user, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can use the <code>Marker</code> request
  /// parameter to make a subsequent pagination request that retrieves more items.
  /// Note that IAM might return fewer than the <code>MaxItems</code> number of
  /// results even when more results are available. Check <code>IsTruncated</code>
  /// after every call to ensure that you receive all of your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListUserTagsResponse({
    @_s.required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListUserTagsResponse.fromXml(_s.XmlElement elem) {
    return ListUserTagsResponse(
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListUsers</a> request.
class ListUsersResponse {
  /// A list of users.
  final List<User> users;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListUsersResponse({
    @_s.required this.users,
    this.isTruncated,
    this.marker,
  });
  factory ListUsersResponse.fromXml(_s.XmlElement elem) {
    return ListUsersResponse(
      users: _s.extractXmlChild(elem, 'Users')?.let((elem) =>
          elem.findElements('member').map((c) => User.fromXml(c)).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the response to a successful <a>ListVirtualMFADevices</a> request.
class ListVirtualMFADevicesResponse {
  /// The list of virtual MFA devices in the current account that match the
  /// <code>AssignmentStatus</code> value that was passed in the request.
  final List<VirtualMFADevice> virtualMFADevices;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  ListVirtualMFADevicesResponse({
    @_s.required this.virtualMFADevices,
    this.isTruncated,
    this.marker,
  });
  factory ListVirtualMFADevicesResponse.fromXml(_s.XmlElement elem) {
    return ListVirtualMFADevicesResponse(
      virtualMFADevices: _s.extractXmlChild(elem, 'VirtualMFADevices')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => VirtualMFADevice.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains the user name and password create date for a user.
///
/// This data type is used as a response element in the
/// <a>CreateLoginProfile</a> and <a>GetLoginProfile</a> operations.
class LoginProfile {
  /// The date when the password for the user was created.
  final DateTime createDate;

  /// The name of the user, which can be used for signing in to the AWS Management
  /// Console.
  final String userName;

  /// Specifies whether the user is required to set a new password on next
  /// sign-in.
  final bool passwordResetRequired;

  LoginProfile({
    @_s.required this.createDate,
    @_s.required this.userName,
    this.passwordResetRequired,
  });
  factory LoginProfile.fromXml(_s.XmlElement elem) {
    return LoginProfile(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
      passwordResetRequired:
          _s.extractXmlBoolValue(elem, 'PasswordResetRequired'),
    );
  }
}

/// Contains information about an MFA device.
///
/// This data type is used as a response element in the <a>ListMFADevices</a>
/// operation.
class MFADevice {
  /// The date when the MFA device was enabled for the user.
  final DateTime enableDate;

  /// The serial number that uniquely identifies the MFA device. For virtual MFA
  /// devices, the serial number is the device ARN.
  final String serialNumber;

  /// The user with whom the MFA device is associated.
  final String userName;

  MFADevice({
    @_s.required this.enableDate,
    @_s.required this.serialNumber,
    @_s.required this.userName,
  });
  factory MFADevice.fromXml(_s.XmlElement elem) {
    return MFADevice(
      enableDate: _s.extractXmlDateTimeValue(elem, 'EnableDate'),
      serialNumber: _s.extractXmlStringValue(elem, 'SerialNumber'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains information about a managed policy, including the policy's ARN,
/// versions, and the number of principal entities (users, groups, and roles)
/// that the policy is attached to.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
///
/// For more information about managed policies, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
class ManagedPolicyDetail {
  final String arn;

  /// The number of principal entities (users, groups, and roles) that the policy
  /// is attached to.
  final int attachmentCount;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was created.
  final DateTime createDate;

  /// The identifier for the version of the policy that is set as the default
  /// (operative) version.
  ///
  /// For more information about policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for Managed Policies</a> in the <i>IAM User Guide</i>.
  final String defaultVersionId;

  /// A friendly description of the policy.
  final String description;

  /// Specifies whether the policy can be attached to an IAM user, group, or role.
  final bool isAttachable;

  /// The path to the policy.
  ///
  /// For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The number of entities (users and roles) for which the policy is used as the
  /// permissions boundary.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
  final int permissionsBoundaryUsageCount;

  /// The stable and unique string identifying the policy.
  ///
  /// For more information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String policyId;

  /// The friendly name (not ARN) identifying the policy.
  final String policyName;

  /// A list containing information about the versions of the policy.
  final List<PolicyVersion> policyVersionList;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was last updated.
  ///
  /// When a policy has only one version, this field contains the date and time
  /// when the policy was created. When a policy has more than one version, this
  /// field contains the date and time when the most recent policy version was
  /// created.
  final DateTime updateDate;

  ManagedPolicyDetail({
    this.arn,
    this.attachmentCount,
    this.createDate,
    this.defaultVersionId,
    this.description,
    this.isAttachable,
    this.path,
    this.permissionsBoundaryUsageCount,
    this.policyId,
    this.policyName,
    this.policyVersionList,
    this.updateDate,
  });
  factory ManagedPolicyDetail.fromXml(_s.XmlElement elem) {
    return ManagedPolicyDetail(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      attachmentCount: _s.extractXmlIntValue(elem, 'AttachmentCount'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      defaultVersionId: _s.extractXmlStringValue(elem, 'DefaultVersionId'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isAttachable: _s.extractXmlBoolValue(elem, 'IsAttachable'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      permissionsBoundaryUsageCount:
          _s.extractXmlIntValue(elem, 'PermissionsBoundaryUsageCount'),
      policyId: _s.extractXmlStringValue(elem, 'PolicyId'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
      policyVersionList: _s.extractXmlChild(elem, 'PolicyVersionList')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => PolicyVersion.fromXml(c))
              .toList()),
      updateDate: _s.extractXmlDateTimeValue(elem, 'UpdateDate'),
    );
  }
}

/// Contains the Amazon Resource Name (ARN) for an IAM OpenID Connect provider.
class OpenIDConnectProviderListEntry {
  final String arn;

  OpenIDConnectProviderListEntry({
    this.arn,
  });
  factory OpenIDConnectProviderListEntry.fromXml(_s.XmlElement elem) {
    return OpenIDConnectProviderListEntry(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
    );
  }
}

/// Contains information about the effect that Organizations has on a policy
/// simulation.
class OrganizationsDecisionDetail {
  /// Specifies whether the simulated operation is allowed by the Organizations
  /// service control policies that impact the simulated user's account.
  final bool allowedByOrganizations;

  OrganizationsDecisionDetail({
    this.allowedByOrganizations,
  });
  factory OrganizationsDecisionDetail.fromXml(_s.XmlElement elem) {
    return OrganizationsDecisionDetail(
      allowedByOrganizations:
          _s.extractXmlBoolValue(elem, 'AllowedByOrganizations'),
    );
  }
}

/// Contains information about the account password policy.
///
/// This data type is used as a response element in the
/// <a>GetAccountPasswordPolicy</a> operation.
class PasswordPolicy {
  /// Specifies whether IAM users are allowed to change their own password.
  final bool allowUsersToChangePassword;

  /// Indicates whether passwords in the account expire. Returns true if
  /// <code>MaxPasswordAge</code> contains a value greater than 0. Returns false
  /// if MaxPasswordAge is 0 or not present.
  final bool expirePasswords;

  /// Specifies whether IAM users are prevented from setting a new password after
  /// their password has expired.
  final bool hardExpiry;

  /// The number of days that an IAM user password is valid.
  final int maxPasswordAge;

  /// Minimum length to require for IAM user passwords.
  final int minimumPasswordLength;

  /// Specifies the number of previous passwords that IAM users are prevented from
  /// reusing.
  final int passwordReusePrevention;

  /// Specifies whether to require lowercase characters for IAM user passwords.
  final bool requireLowercaseCharacters;

  /// Specifies whether to require numbers for IAM user passwords.
  final bool requireNumbers;

  /// Specifies whether to require symbols for IAM user passwords.
  final bool requireSymbols;

  /// Specifies whether to require uppercase characters for IAM user passwords.
  final bool requireUppercaseCharacters;

  PasswordPolicy({
    this.allowUsersToChangePassword,
    this.expirePasswords,
    this.hardExpiry,
    this.maxPasswordAge,
    this.minimumPasswordLength,
    this.passwordReusePrevention,
    this.requireLowercaseCharacters,
    this.requireNumbers,
    this.requireSymbols,
    this.requireUppercaseCharacters,
  });
  factory PasswordPolicy.fromXml(_s.XmlElement elem) {
    return PasswordPolicy(
      allowUsersToChangePassword:
          _s.extractXmlBoolValue(elem, 'AllowUsersToChangePassword'),
      expirePasswords: _s.extractXmlBoolValue(elem, 'ExpirePasswords'),
      hardExpiry: _s.extractXmlBoolValue(elem, 'HardExpiry'),
      maxPasswordAge: _s.extractXmlIntValue(elem, 'MaxPasswordAge'),
      minimumPasswordLength:
          _s.extractXmlIntValue(elem, 'MinimumPasswordLength'),
      passwordReusePrevention:
          _s.extractXmlIntValue(elem, 'PasswordReusePrevention'),
      requireLowercaseCharacters:
          _s.extractXmlBoolValue(elem, 'RequireLowercaseCharacters'),
      requireNumbers: _s.extractXmlBoolValue(elem, 'RequireNumbers'),
      requireSymbols: _s.extractXmlBoolValue(elem, 'RequireSymbols'),
      requireUppercaseCharacters:
          _s.extractXmlBoolValue(elem, 'RequireUppercaseCharacters'),
    );
  }
}

enum PermissionsBoundaryAttachmentType {
  @_s.JsonValue('PermissionsBoundaryPolicy')
  permissionsBoundaryPolicy,
}

extension on String {
  PermissionsBoundaryAttachmentType toPermissionsBoundaryAttachmentType() {
    switch (this) {
      case 'PermissionsBoundaryPolicy':
        return PermissionsBoundaryAttachmentType.permissionsBoundaryPolicy;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about the effect that a permissions boundary has on a
/// policy simulation when the boundary is applied to an IAM entity.
class PermissionsBoundaryDecisionDetail {
  /// Specifies whether an action is allowed by a permissions boundary that is
  /// applied to an IAM entity (user or role). A value of <code>true</code> means
  /// that the permissions boundary does not deny the action. This means that the
  /// policy includes an <code>Allow</code> statement that matches the request. In
  /// this case, if an identity-based policy also allows the action, the request
  /// is allowed. A value of <code>false</code> means that either the requested
  /// action is not allowed (implicitly denied) or that the action is explicitly
  /// denied by the permissions boundary. In both of these cases, the action is
  /// not allowed, regardless of the identity-based policy.
  final bool allowedByPermissionsBoundary;

  PermissionsBoundaryDecisionDetail({
    this.allowedByPermissionsBoundary,
  });
  factory PermissionsBoundaryDecisionDetail.fromXml(_s.XmlElement elem) {
    return PermissionsBoundaryDecisionDetail(
      allowedByPermissionsBoundary:
          _s.extractXmlBoolValue(elem, 'AllowedByPermissionsBoundary'),
    );
  }
}

/// Contains information about a managed policy.
///
/// This data type is used as a response element in the <a>CreatePolicy</a>,
/// <a>GetPolicy</a>, and <a>ListPolicies</a> operations.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
class Policy {
  final String arn;

  /// The number of entities (users, groups, and roles) that the policy is
  /// attached to.
  final int attachmentCount;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was created.
  final DateTime createDate;

  /// The identifier for the version of the policy that is set as the default
  /// version.
  final String defaultVersionId;

  /// A friendly description of the policy.
  ///
  /// This element is included in the response to the <a>GetPolicy</a> operation.
  /// It is not included in the response to the <a>ListPolicies</a> operation.
  final String description;

  /// Specifies whether the policy can be attached to an IAM user, group, or role.
  final bool isAttachable;

  /// The path to the policy.
  ///
  /// For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The number of entities (users and roles) for which the policy is used to set
  /// the permissions boundary.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
  final int permissionsBoundaryUsageCount;

  /// The stable and unique string identifying the policy.
  ///
  /// For more information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String policyId;

  /// The friendly name (not ARN) identifying the policy.
  final String policyName;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was last updated.
  ///
  /// When a policy has only one version, this field contains the date and time
  /// when the policy was created. When a policy has more than one version, this
  /// field contains the date and time when the most recent policy version was
  /// created.
  final DateTime updateDate;

  Policy({
    this.arn,
    this.attachmentCount,
    this.createDate,
    this.defaultVersionId,
    this.description,
    this.isAttachable,
    this.path,
    this.permissionsBoundaryUsageCount,
    this.policyId,
    this.policyName,
    this.updateDate,
  });
  factory Policy.fromXml(_s.XmlElement elem) {
    return Policy(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      attachmentCount: _s.extractXmlIntValue(elem, 'AttachmentCount'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      defaultVersionId: _s.extractXmlStringValue(elem, 'DefaultVersionId'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isAttachable: _s.extractXmlBoolValue(elem, 'IsAttachable'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      permissionsBoundaryUsageCount:
          _s.extractXmlIntValue(elem, 'PermissionsBoundaryUsageCount'),
      policyId: _s.extractXmlStringValue(elem, 'PolicyId'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
      updateDate: _s.extractXmlDateTimeValue(elem, 'UpdateDate'),
    );
  }
}

/// Contains information about an IAM policy, including the policy document.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class PolicyDetail {
  /// The policy document.
  final String policyDocument;

  /// The name of the policy.
  final String policyName;

  PolicyDetail({
    this.policyDocument,
    this.policyName,
  });
  factory PolicyDetail.fromXml(_s.XmlElement elem) {
    return PolicyDetail(
      policyDocument: _s.extractXmlStringValue(elem, 'PolicyDocument'),
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
    );
  }
}

enum PolicyEvaluationDecisionType {
  @_s.JsonValue('allowed')
  allowed,
  @_s.JsonValue('explicitDeny')
  explicitDeny,
  @_s.JsonValue('implicitDeny')
  implicitDeny,
}

extension on String {
  PolicyEvaluationDecisionType toPolicyEvaluationDecisionType() {
    switch (this) {
      case 'allowed':
        return PolicyEvaluationDecisionType.allowed;
      case 'explicitDeny':
        return PolicyEvaluationDecisionType.explicitDeny;
      case 'implicitDeny':
        return PolicyEvaluationDecisionType.implicitDeny;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains details about the permissions policies that are attached to the
/// specified identity (user, group, or role).
///
/// This data type is an element of the
/// <a>ListPoliciesGrantingServiceAccessEntry</a> object.
class PolicyGrantingServiceAccess {
  /// The policy name.
  final String policyName;

  /// The policy type. For more information about these policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  final PolicyType policyType;

  /// The name of the entity (user or role) to which the inline policy is
  /// attached.
  ///
  /// This field is null for managed policies. For more information about these
  /// policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  final String entityName;

  /// The type of entity (user or role) that used the policy to access the service
  /// to which the inline policy is attached.
  ///
  /// This field is null for managed policies. For more information about these
  /// policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed
  /// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
  final PolicyOwnerEntityType entityType;
  final String policyArn;

  PolicyGrantingServiceAccess({
    @_s.required this.policyName,
    @_s.required this.policyType,
    this.entityName,
    this.entityType,
    this.policyArn,
  });
  factory PolicyGrantingServiceAccess.fromXml(_s.XmlElement elem) {
    return PolicyGrantingServiceAccess(
      policyName: _s.extractXmlStringValue(elem, 'PolicyName'),
      policyType: _s.extractXmlStringValue(elem, 'PolicyType')?.toPolicyType(),
      entityName: _s.extractXmlStringValue(elem, 'EntityName'),
      entityType: _s
          .extractXmlStringValue(elem, 'EntityType')
          ?.toPolicyOwnerEntityType(),
      policyArn: _s.extractXmlStringValue(elem, 'PolicyArn'),
    );
  }
}

/// Contains information about a group that a managed policy is attached to.
///
/// This data type is used as a response element in the
/// <a>ListEntitiesForPolicy</a> operation.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
class PolicyGroup {
  /// The stable and unique string identifying the group. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String groupId;

  /// The name (friendly name, not ARN) identifying the group.
  final String groupName;

  PolicyGroup({
    this.groupId,
    this.groupName,
  });
  factory PolicyGroup.fromXml(_s.XmlElement elem) {
    return PolicyGroup(
      groupId: _s.extractXmlStringValue(elem, 'GroupId'),
      groupName: _s.extractXmlStringValue(elem, 'GroupName'),
    );
  }
}

/// Contains information about a role that a managed policy is attached to.
///
/// This data type is used as a response element in the
/// <a>ListEntitiesForPolicy</a> operation.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
class PolicyRole {
  /// The stable and unique string identifying the role. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String roleId;

  /// The name (friendly name, not ARN) identifying the role.
  final String roleName;

  PolicyRole({
    this.roleId,
    this.roleName,
  });
  factory PolicyRole.fromXml(_s.XmlElement elem) {
    return PolicyRole(
      roleId: _s.extractXmlStringValue(elem, 'RoleId'),
      roleName: _s.extractXmlStringValue(elem, 'RoleName'),
    );
  }
}

enum PolicySourceType {
  @_s.JsonValue('user')
  user,
  @_s.JsonValue('group')
  group,
  @_s.JsonValue('role')
  role,
  @_s.JsonValue('aws-managed')
  awsManaged,
  @_s.JsonValue('user-managed')
  userManaged,
  @_s.JsonValue('resource')
  resource,
  @_s.JsonValue('none')
  none,
}

extension on String {
  PolicySourceType toPolicySourceType() {
    switch (this) {
      case 'user':
        return PolicySourceType.user;
      case 'group':
        return PolicySourceType.group;
      case 'role':
        return PolicySourceType.role;
      case 'aws-managed':
        return PolicySourceType.awsManaged;
      case 'user-managed':
        return PolicySourceType.userManaged;
      case 'resource':
        return PolicySourceType.resource;
      case 'none':
        return PolicySourceType.none;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The policy usage type that indicates whether the policy is used as a
/// permissions policy or as the permissions boundary for an entity.
///
/// For more information about permissions boundaries, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
/// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
enum PolicyUsageType {
  @_s.JsonValue('PermissionsPolicy')
  permissionsPolicy,
  @_s.JsonValue('PermissionsBoundary')
  permissionsBoundary,
}

extension on PolicyUsageType {
  String toValue() {
    switch (this) {
      case PolicyUsageType.permissionsPolicy:
        return 'PermissionsPolicy';
      case PolicyUsageType.permissionsBoundary:
        return 'PermissionsBoundary';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  PolicyUsageType toPolicyUsageType() {
    switch (this) {
      case 'PermissionsPolicy':
        return PolicyUsageType.permissionsPolicy;
      case 'PermissionsBoundary':
        return PolicyUsageType.permissionsBoundary;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a user that a managed policy is attached to.
///
/// This data type is used as a response element in the
/// <a>ListEntitiesForPolicy</a> operation.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
class PolicyUser {
  /// The stable and unique string identifying the user. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String userId;

  /// The name (friendly name, not ARN) identifying the user.
  final String userName;

  PolicyUser({
    this.userId,
    this.userName,
  });
  factory PolicyUser.fromXml(_s.XmlElement elem) {
    return PolicyUser(
      userId: _s.extractXmlStringValue(elem, 'UserId'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains information about a version of a managed policy.
///
/// This data type is used as a response element in the
/// <a>CreatePolicyVersion</a>, <a>GetPolicyVersion</a>,
/// <a>ListPolicyVersions</a>, and <a>GetAccountAuthorizationDetails</a>
/// operations.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// Policies and Inline Policies</a> in the <i>IAM User Guide</i>.
class PolicyVersion {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy version was created.
  final DateTime createDate;

  /// The policy document.
  ///
  /// The policy document is returned in the response to the
  /// <a>GetPolicyVersion</a> and <a>GetAccountAuthorizationDetails</a>
  /// operations. It is not returned in the response to the
  /// <a>CreatePolicyVersion</a> or <a>ListPolicyVersions</a> operations.
  ///
  /// The policy document returned in this structure is URL-encoded compliant with
  /// <a href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a
  /// URL decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of the
  /// <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  final String document;

  /// Specifies whether the policy version is set as the policy's default version.
  final bool isDefaultVersion;

  /// The identifier for the policy version.
  ///
  /// Policy version identifiers always begin with <code>v</code> (always
  /// lowercase). When a policy is created, the first policy version is
  /// <code>v1</code>.
  final String versionId;

  PolicyVersion({
    this.createDate,
    this.document,
    this.isDefaultVersion,
    this.versionId,
  });
  factory PolicyVersion.fromXml(_s.XmlElement elem) {
    return PolicyVersion(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      document: _s.extractXmlStringValue(elem, 'Document'),
      isDefaultVersion: _s.extractXmlBoolValue(elem, 'IsDefaultVersion'),
      versionId: _s.extractXmlStringValue(elem, 'VersionId'),
    );
  }
}

/// Contains the row and column of a location of a <code>Statement</code>
/// element in a policy document.
///
/// This data type is used as a member of the <code> <a>Statement</a> </code>
/// type.
class Position {
  /// The column in the line containing the specified position in the document.
  final int column;

  /// The line containing the specified position in the document.
  final int line;

  Position({
    this.column,
    this.line,
  });
  factory Position.fromXml(_s.XmlElement elem) {
    return Position(
      column: _s.extractXmlIntValue(elem, 'Column'),
      line: _s.extractXmlIntValue(elem, 'Line'),
    );
  }
}

enum ReportFormatType {
  @_s.JsonValue('text/csv')
  textCsv,
}

extension on String {
  ReportFormatType toReportFormatType() {
    switch (this) {
      case 'text/csv':
        return ReportFormatType.textCsv;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ReportStateType {
  @_s.JsonValue('STARTED')
  started,
  @_s.JsonValue('INPROGRESS')
  inprogress,
  @_s.JsonValue('COMPLETE')
  complete,
}

extension on String {
  ReportStateType toReportStateType() {
    switch (this) {
      case 'STARTED':
        return ReportStateType.started;
      case 'INPROGRESS':
        return ReportStateType.inprogress;
      case 'COMPLETE':
        return ReportStateType.complete;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class ResetServiceSpecificCredentialResponse {
  /// A structure with details about the updated service-specific credential,
  /// including the new password.
  /// <important>
  /// This is the <b>only</b> time that you can access the password. You cannot
  /// recover the password later, but you can reset it again.
  /// </important>
  final ServiceSpecificCredential serviceSpecificCredential;

  ResetServiceSpecificCredentialResponse({
    this.serviceSpecificCredential,
  });
  factory ResetServiceSpecificCredentialResponse.fromXml(_s.XmlElement elem) {
    return ResetServiceSpecificCredentialResponse(
      serviceSpecificCredential: _s
          .extractXmlChild(elem, 'ServiceSpecificCredential')
          ?.let((e) => ServiceSpecificCredential.fromXml(e)),
    );
  }
}

/// Contains the result of the simulation of a single API operation call on a
/// single resource.
///
/// This data type is used by a member of the <a>EvaluationResult</a> data type.
class ResourceSpecificResult {
  /// The result of the simulation of the simulated API operation on the resource
  /// specified in <code>EvalResourceName</code>.
  final PolicyEvaluationDecisionType evalResourceDecision;

  /// The name of the simulated resource, in Amazon Resource Name (ARN) format.
  final String evalResourceName;

  /// Additional details about the results of the evaluation decision on a single
  /// resource. This parameter is returned only for cross-account simulations.
  /// This parameter explains how each policy type contributes to the
  /// resource-specific evaluation decision.
  final Map<String, PolicyEvaluationDecisionType> evalDecisionDetails;

  /// A list of the statements in the input policies that determine the result for
  /// this part of the simulation. Remember that even if multiple statements allow
  /// the operation on the resource, if <i>any</i> statement denies that
  /// operation, then the explicit deny overrides any allow. In addition, the deny
  /// statement is the only entry included in the result.
  final List<Statement> matchedStatements;

  /// A list of context keys that are required by the included input policies but
  /// that were not provided by one of the input parameters. This list is used
  /// when a list of ARNs is included in the <code>ResourceArns</code> parameter
  /// instead of "*". If you do not specify individual resources, by setting
  /// <code>ResourceArns</code> to "*" or by not including the
  /// <code>ResourceArns</code> parameter, then any missing context values are
  /// instead included under the <code>EvaluationResults</code> section. To
  /// discover the context keys used by a set of policies, you can call
  /// <a>GetContextKeysForCustomPolicy</a> or
  /// <a>GetContextKeysForPrincipalPolicy</a>.
  final List<String> missingContextValues;

  /// Contains information about the effect that a permissions boundary has on a
  /// policy simulation when that boundary is applied to an IAM entity.
  final PermissionsBoundaryDecisionDetail permissionsBoundaryDecisionDetail;

  ResourceSpecificResult({
    @_s.required this.evalResourceDecision,
    @_s.required this.evalResourceName,
    this.evalDecisionDetails,
    this.matchedStatements,
    this.missingContextValues,
    this.permissionsBoundaryDecisionDetail,
  });
  factory ResourceSpecificResult.fromXml(_s.XmlElement elem) {
    return ResourceSpecificResult(
      evalResourceDecision: _s
          .extractXmlStringValue(elem, 'EvalResourceDecision')
          ?.toPolicyEvaluationDecisionType(),
      evalResourceName: _s.extractXmlStringValue(elem, 'EvalResourceName'),
      evalDecisionDetails: Map.fromEntries(
        elem.getElement('EvalDecisionDetails').findElements('entry').map(
              (c) => MapEntry(
                _s.extractXmlStringValue(c, 'key'),
                _s
                    .extractXmlStringValue(c, 'value')
                    ?.toPolicyEvaluationDecisionType(),
              ),
            ),
      ),
      matchedStatements: _s.extractXmlChild(elem, 'MatchedStatements')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => Statement.fromXml(c))
              .toList()),
      missingContextValues: _s
          .extractXmlChild(elem, 'MissingContextValues')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      permissionsBoundaryDecisionDetail: _s
          .extractXmlChild(elem, 'PermissionsBoundaryDecisionDetail')
          ?.let((e) => PermissionsBoundaryDecisionDetail.fromXml(e)),
    );
  }
}

/// Contains information about an IAM role. This structure is returned as a
/// response element in several API operations that interact with roles.
class Role {
  /// The Amazon Resource Name (ARN) specifying the role. For more information
  /// about ARNs and how to use them in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i> guide.
  final String arn;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the role was created.
  final DateTime createDate;

  /// The path to the role. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The stable and unique string identifying the role. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String roleId;

  /// The friendly name that identifies the role.
  final String roleName;

  /// The policy that grants an entity permission to assume the role.
  final String assumeRolePolicyDocument;

  /// A description of the role that you provide.
  final String description;

  /// The maximum session duration (in seconds) for the specified role. Anyone who
  /// uses the AWS CLI, or API to assume the role can specify the duration using
  /// the optional <code>DurationSeconds</code> API parameter or
  /// <code>duration-seconds</code> CLI parameter.
  final int maxSessionDuration;

  /// The ARN of the policy used to set the permissions boundary for the role.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// Contains information about the last time that an IAM role was used. This
  /// includes the date and time and the Region in which the role was last used.
  /// Activity is only reported for the trailing 400 days. This period can be
  /// shorter if your Region began supporting these features within the last year.
  /// The role might have been used more than 400 days ago. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
  /// Where Data Is Tracked</a> in the <i>IAM User Guide</i>.
  final RoleLastUsed roleLastUsed;

  /// A list of tags that are attached to the specified role. For more information
  /// about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  final List<Tag> tags;

  Role({
    @_s.required this.arn,
    @_s.required this.createDate,
    @_s.required this.path,
    @_s.required this.roleId,
    @_s.required this.roleName,
    this.assumeRolePolicyDocument,
    this.description,
    this.maxSessionDuration,
    this.permissionsBoundary,
    this.roleLastUsed,
    this.tags,
  });
  factory Role.fromXml(_s.XmlElement elem) {
    return Role(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      roleId: _s.extractXmlStringValue(elem, 'RoleId'),
      roleName: _s.extractXmlStringValue(elem, 'RoleName'),
      assumeRolePolicyDocument:
          _s.extractXmlStringValue(elem, 'AssumeRolePolicyDocument'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      maxSessionDuration: _s.extractXmlIntValue(elem, 'MaxSessionDuration'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let((e) => AttachedPermissionsBoundary.fromXml(e)),
      roleLastUsed: _s
          .extractXmlChild(elem, 'RoleLastUsed')
          ?.let((e) => RoleLastUsed.fromXml(e)),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

/// Contains information about an IAM role, including all of the role's
/// policies.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class RoleDetail {
  final String arn;

  /// The trust policy that grants permission to assume the role.
  final String assumeRolePolicyDocument;

  /// A list of managed policies attached to the role. These policies are the
  /// role's access (permissions) policies.
  final List<AttachedPolicy> attachedManagedPolicies;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the role was created.
  final DateTime createDate;

  /// A list of instance profiles that contain this role.
  final List<InstanceProfile> instanceProfileList;

  /// The path to the role. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The ARN of the policy used to set the permissions boundary for the role.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// The stable and unique string identifying the role. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String roleId;

  /// Contains information about the last time that an IAM role was used. This
  /// includes the date and time and the Region in which the role was last used.
  /// Activity is only reported for the trailing 400 days. This period can be
  /// shorter if your Region began supporting these features within the last year.
  /// The role might have been used more than 400 days ago. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
  /// Where Data Is Tracked</a> in the <i>IAM User Guide</i>.
  final RoleLastUsed roleLastUsed;

  /// The friendly name that identifies the role.
  final String roleName;

  /// A list of inline policies embedded in the role. These policies are the
  /// role's access (permissions) policies.
  final List<PolicyDetail> rolePolicyList;

  /// A list of tags that are attached to the specified role. For more information
  /// about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  final List<Tag> tags;

  RoleDetail({
    this.arn,
    this.assumeRolePolicyDocument,
    this.attachedManagedPolicies,
    this.createDate,
    this.instanceProfileList,
    this.path,
    this.permissionsBoundary,
    this.roleId,
    this.roleLastUsed,
    this.roleName,
    this.rolePolicyList,
    this.tags,
  });
  factory RoleDetail.fromXml(_s.XmlElement elem) {
    return RoleDetail(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      assumeRolePolicyDocument:
          _s.extractXmlStringValue(elem, 'AssumeRolePolicyDocument'),
      attachedManagedPolicies: _s
          .extractXmlChild(elem, 'AttachedManagedPolicies')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => AttachedPolicy.fromXml(c))
              .toList()),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      instanceProfileList: _s.extractXmlChild(elem, 'InstanceProfileList')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => InstanceProfile.fromXml(c))
              .toList()),
      path: _s.extractXmlStringValue(elem, 'Path'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let((e) => AttachedPermissionsBoundary.fromXml(e)),
      roleId: _s.extractXmlStringValue(elem, 'RoleId'),
      roleLastUsed: _s
          .extractXmlChild(elem, 'RoleLastUsed')
          ?.let((e) => RoleLastUsed.fromXml(e)),
      roleName: _s.extractXmlStringValue(elem, 'RoleName'),
      rolePolicyList: _s.extractXmlChild(elem, 'RolePolicyList')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => PolicyDetail.fromXml(c))
              .toList()),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

/// Contains information about the last time that an IAM role was used. This
/// includes the date and time and the Region in which the role was last used.
/// Activity is only reported for the trailing 400 days. This period can be
/// shorter if your Region began supporting these features within the last year.
/// The role might have been used more than 400 days ago. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
/// Where Data Is Tracked</a> in the <i>IAM User Guide</i>.
///
/// This data type is returned as a response element in the <a>GetRole</a> and
/// <a>GetAccountAuthorizationDetails</a> operations.
class RoleLastUsed {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a> that the role was last used.
  ///
  /// This field is null if the role has not been used within the IAM tracking
  /// period. For more information about the tracking period, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
  /// Where Data Is Tracked</a> in the <i>IAM User Guide</i>.
  final DateTime lastUsedDate;

  /// The name of the AWS Region in which the role was last used.
  final String region;

  RoleLastUsed({
    this.lastUsedDate,
    this.region,
  });
  factory RoleLastUsed.fromXml(_s.XmlElement elem) {
    return RoleLastUsed(
      lastUsedDate: _s.extractXmlDateTimeValue(elem, 'LastUsedDate'),
      region: _s.extractXmlStringValue(elem, 'Region'),
    );
  }
}

/// An object that contains details about how a service-linked role is used, if
/// that information is returned by the service.
///
/// This data type is used as a response element in the
/// <a>GetServiceLinkedRoleDeletionStatus</a> operation.
class RoleUsageType {
  /// The name of the Region where the service-linked role is being used.
  final String region;

  /// The name of the resource that is using the service-linked role.
  final List<String> resources;

  RoleUsageType({
    this.region,
    this.resources,
  });
  factory RoleUsageType.fromXml(_s.XmlElement elem) {
    return RoleUsageType(
      region: _s.extractXmlStringValue(elem, 'Region'),
      resources: _s
          .extractXmlChild(elem, 'Resources')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
    );
  }
}

/// Contains the list of SAML providers for this account.
class SAMLProviderListEntry {
  /// The Amazon Resource Name (ARN) of the SAML provider.
  final String arn;

  /// The date and time when the SAML provider was created.
  final DateTime createDate;

  /// The expiration date and time for the SAML provider.
  final DateTime validUntil;

  SAMLProviderListEntry({
    this.arn,
    this.createDate,
    this.validUntil,
  });
  factory SAMLProviderListEntry.fromXml(_s.XmlElement elem) {
    return SAMLProviderListEntry(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      validUntil: _s.extractXmlDateTimeValue(elem, 'ValidUntil'),
    );
  }
}

/// Contains information about an SSH public key.
///
/// This data type is used as a response element in the <a>GetSSHPublicKey</a>
/// and <a>UploadSSHPublicKey</a> operations.
class SSHPublicKey {
  /// The MD5 message digest of the SSH public key.
  final String fingerprint;

  /// The SSH public key.
  final String sSHPublicKeyBody;

  /// The unique identifier for the SSH public key.
  final String sSHPublicKeyId;

  /// The status of the SSH public key. <code>Active</code> means that the key can
  /// be used for authentication with an AWS CodeCommit repository.
  /// <code>Inactive</code> means that the key cannot be used.
  final StatusType status;

  /// The name of the IAM user associated with the SSH public key.
  final String userName;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the SSH public key was uploaded.
  final DateTime uploadDate;

  SSHPublicKey({
    @_s.required this.fingerprint,
    @_s.required this.sSHPublicKeyBody,
    @_s.required this.sSHPublicKeyId,
    @_s.required this.status,
    @_s.required this.userName,
    this.uploadDate,
  });
  factory SSHPublicKey.fromXml(_s.XmlElement elem) {
    return SSHPublicKey(
      fingerprint: _s.extractXmlStringValue(elem, 'Fingerprint'),
      sSHPublicKeyBody: _s.extractXmlStringValue(elem, 'SSHPublicKeyBody'),
      sSHPublicKeyId: _s.extractXmlStringValue(elem, 'SSHPublicKeyId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate'),
    );
  }
}

/// Contains information about an SSH public key, without the key's body or
/// fingerprint.
///
/// This data type is used as a response element in the <a>ListSSHPublicKeys</a>
/// operation.
class SSHPublicKeyMetadata {
  /// The unique identifier for the SSH public key.
  final String sSHPublicKeyId;

  /// The status of the SSH public key. <code>Active</code> means that the key can
  /// be used for authentication with an AWS CodeCommit repository.
  /// <code>Inactive</code> means that the key cannot be used.
  final StatusType status;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the SSH public key was uploaded.
  final DateTime uploadDate;

  /// The name of the IAM user associated with the SSH public key.
  final String userName;

  SSHPublicKeyMetadata({
    @_s.required this.sSHPublicKeyId,
    @_s.required this.status,
    @_s.required this.uploadDate,
    @_s.required this.userName,
  });
  factory SSHPublicKeyMetadata.fromXml(_s.XmlElement elem) {
    return SSHPublicKeyMetadata(
      sSHPublicKeyId: _s.extractXmlStringValue(elem, 'SSHPublicKeyId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStatusType(),
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains information about a server certificate.
///
/// This data type is used as a response element in the
/// <a>GetServerCertificate</a> operation.
class ServerCertificate {
  /// The contents of the public key certificate.
  final String certificateBody;

  /// The meta information of the server certificate, such as its name, path, ID,
  /// and ARN.
  final ServerCertificateMetadata serverCertificateMetadata;

  /// The contents of the public key certificate chain.
  final String certificateChain;

  ServerCertificate({
    @_s.required this.certificateBody,
    @_s.required this.serverCertificateMetadata,
    this.certificateChain,
  });
  factory ServerCertificate.fromXml(_s.XmlElement elem) {
    return ServerCertificate(
      certificateBody: _s.extractXmlStringValue(elem, 'CertificateBody'),
      serverCertificateMetadata: _s
          .extractXmlChild(elem, 'ServerCertificateMetadata')
          ?.let((e) => ServerCertificateMetadata.fromXml(e)),
      certificateChain: _s.extractXmlStringValue(elem, 'CertificateChain'),
    );
  }
}

/// Contains information about a server certificate without its certificate
/// body, certificate chain, and private key.
///
/// This data type is used as a response element in the
/// <a>UploadServerCertificate</a> and <a>ListServerCertificates</a> operations.
class ServerCertificateMetadata {
  /// The Amazon Resource Name (ARN) specifying the server certificate. For more
  /// information about ARNs and how to use them in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The path to the server certificate. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The stable and unique string identifying the server certificate. For more
  /// information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String serverCertificateId;

  /// The name that identifies the server certificate.
  final String serverCertificateName;

  /// The date on which the certificate is set to expire.
  final DateTime expiration;

  /// The date when the server certificate was uploaded.
  final DateTime uploadDate;

  ServerCertificateMetadata({
    @_s.required this.arn,
    @_s.required this.path,
    @_s.required this.serverCertificateId,
    @_s.required this.serverCertificateName,
    this.expiration,
    this.uploadDate,
  });
  factory ServerCertificateMetadata.fromXml(_s.XmlElement elem) {
    return ServerCertificateMetadata(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      serverCertificateId:
          _s.extractXmlStringValue(elem, 'ServerCertificateId'),
      serverCertificateName:
          _s.extractXmlStringValue(elem, 'ServerCertificateName'),
      expiration: _s.extractXmlDateTimeValue(elem, 'Expiration'),
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate'),
    );
  }
}

/// Contains details about the most recent attempt to access the service.
///
/// This data type is used as a response element in the
/// <a>GetServiceLastAccessedDetails</a> operation.
class ServiceLastAccessed {
  /// The name of the service in which access was attempted.
  final String serviceName;

  /// The namespace of the service in which access was attempted.
  ///
  /// To learn the service namespace of a service, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_actions-resources-contextkeys.html">Actions,
  /// Resources, and Condition Keys for AWS Services</a> in the <i>IAM User
  /// Guide</i>. Choose the name of the service to view details for that service.
  /// In the first paragraph, find the service prefix. For example, <code>(service
  /// prefix: a4b)</code>. For more information about service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>AWS General Reference</i>.
  final String serviceNamespace;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when an authenticated entity most recently attempted
  /// to access the service. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final DateTime lastAuthenticated;

  /// The ARN of the authenticated entity (user or role) that last attempted to
  /// access the service. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final String lastAuthenticatedEntity;

  /// The Region from which the authenticated entity (user or role) last attempted
  /// to access the service. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final String lastAuthenticatedRegion;

  /// The total number of authenticated principals (root user, IAM users, or IAM
  /// roles) that have attempted to access the service.
  ///
  /// This field is null if no principals attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final int totalAuthenticatedEntities;

  /// An object that contains details about the most recent attempt to access a
  /// tracked action within the service.
  ///
  /// This field is null if there no tracked actions or if the principal did not
  /// use the tracked actions within the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>. This field is also null if the report was generated at the
  /// service level and not the action level. For more information, see the
  /// <code>Granularity</code> field in <a>GenerateServiceLastAccessedDetails</a>.
  final List<TrackedActionLastAccessed> trackedActionsLastAccessed;

  ServiceLastAccessed({
    @_s.required this.serviceName,
    @_s.required this.serviceNamespace,
    this.lastAuthenticated,
    this.lastAuthenticatedEntity,
    this.lastAuthenticatedRegion,
    this.totalAuthenticatedEntities,
    this.trackedActionsLastAccessed,
  });
  factory ServiceLastAccessed.fromXml(_s.XmlElement elem) {
    return ServiceLastAccessed(
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName'),
      serviceNamespace: _s.extractXmlStringValue(elem, 'ServiceNamespace'),
      lastAuthenticated: _s.extractXmlDateTimeValue(elem, 'LastAuthenticated'),
      lastAuthenticatedEntity:
          _s.extractXmlStringValue(elem, 'LastAuthenticatedEntity'),
      lastAuthenticatedRegion:
          _s.extractXmlStringValue(elem, 'LastAuthenticatedRegion'),
      totalAuthenticatedEntities:
          _s.extractXmlIntValue(elem, 'TotalAuthenticatedEntities'),
      trackedActionsLastAccessed: _s
          .extractXmlChild(elem, 'TrackedActionsLastAccessed')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => TrackedActionLastAccessed.fromXml(c))
              .toList()),
    );
  }
}

/// Contains the details of a service-specific credential.
class ServiceSpecificCredential {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the service-specific credential were created.
  final DateTime createDate;

  /// The name of the service associated with the service-specific credential.
  final String serviceName;

  /// The generated password for the service-specific credential.
  final String servicePassword;

  /// The unique identifier for the service-specific credential.
  final String serviceSpecificCredentialId;

  /// The generated user name for the service-specific credential. This value is
  /// generated by combining the IAM user's name combined with the ID number of
  /// the AWS account, as in <code>jane-at-123456789012</code>, for example. This
  /// value cannot be configured by the user.
  final String serviceUserName;

  /// The status of the service-specific credential. <code>Active</code> means
  /// that the key is valid for API calls, while <code>Inactive</code> means it is
  /// not.
  final StatusType status;

  /// The name of the IAM user associated with the service-specific credential.
  final String userName;

  ServiceSpecificCredential({
    @_s.required this.createDate,
    @_s.required this.serviceName,
    @_s.required this.servicePassword,
    @_s.required this.serviceSpecificCredentialId,
    @_s.required this.serviceUserName,
    @_s.required this.status,
    @_s.required this.userName,
  });
  factory ServiceSpecificCredential.fromXml(_s.XmlElement elem) {
    return ServiceSpecificCredential(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName'),
      servicePassword: _s.extractXmlStringValue(elem, 'ServicePassword'),
      serviceSpecificCredentialId:
          _s.extractXmlStringValue(elem, 'ServiceSpecificCredentialId'),
      serviceUserName: _s.extractXmlStringValue(elem, 'ServiceUserName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains additional details about a service-specific credential.
class ServiceSpecificCredentialMetadata {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the service-specific credential were created.
  final DateTime createDate;

  /// The name of the service associated with the service-specific credential.
  final String serviceName;

  /// The unique identifier for the service-specific credential.
  final String serviceSpecificCredentialId;

  /// The generated user name for the service-specific credential.
  final String serviceUserName;

  /// The status of the service-specific credential. <code>Active</code> means
  /// that the key is valid for API calls, while <code>Inactive</code> means it is
  /// not.
  final StatusType status;

  /// The name of the IAM user associated with the service-specific credential.
  final String userName;

  ServiceSpecificCredentialMetadata({
    @_s.required this.createDate,
    @_s.required this.serviceName,
    @_s.required this.serviceSpecificCredentialId,
    @_s.required this.serviceUserName,
    @_s.required this.status,
    @_s.required this.userName,
  });
  factory ServiceSpecificCredentialMetadata.fromXml(_s.XmlElement elem) {
    return ServiceSpecificCredentialMetadata(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName'),
      serviceSpecificCredentialId:
          _s.extractXmlStringValue(elem, 'ServiceSpecificCredentialId'),
      serviceUserName: _s.extractXmlStringValue(elem, 'ServiceUserName'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }
}

/// Contains information about an X.509 signing certificate.
///
/// This data type is used as a response element in the
/// <a>UploadSigningCertificate</a> and <a>ListSigningCertificates</a>
/// operations.
class SigningCertificate {
  /// The contents of the signing certificate.
  final String certificateBody;

  /// The ID for the signing certificate.
  final String certificateId;

  /// The status of the signing certificate. <code>Active</code> means that the
  /// key is valid for API calls, while <code>Inactive</code> means it is not.
  final StatusType status;

  /// The name of the user the signing certificate is associated with.
  final String userName;

  /// The date when the signing certificate was uploaded.
  final DateTime uploadDate;

  SigningCertificate({
    @_s.required this.certificateBody,
    @_s.required this.certificateId,
    @_s.required this.status,
    @_s.required this.userName,
    this.uploadDate,
  });
  factory SigningCertificate.fromXml(_s.XmlElement elem) {
    return SigningCertificate(
      certificateBody: _s.extractXmlStringValue(elem, 'CertificateBody'),
      certificateId: _s.extractXmlStringValue(elem, 'CertificateId'),
      status: _s.extractXmlStringValue(elem, 'Status')?.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate'),
    );
  }
}

/// Contains the response to a successful <a>SimulatePrincipalPolicy</a> or
/// <a>SimulateCustomPolicy</a> request.
class SimulatePolicyResponse {
  /// The results of the simulation.
  final List<EvaluationResult> evaluationResults;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String marker;

  SimulatePolicyResponse({
    this.evaluationResults,
    this.isTruncated,
    this.marker,
  });
  factory SimulatePolicyResponse.fromXml(_s.XmlElement elem) {
    return SimulatePolicyResponse(
      evaluationResults: _s.extractXmlChild(elem, 'EvaluationResults')?.let(
          (elem) => elem
              .findElements('member')
              .map((c) => EvaluationResult.fromXml(c))
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

/// Contains a reference to a <code>Statement</code> element in a policy
/// document that determines the result of the simulation.
///
/// This data type is used by the <code>MatchedStatements</code> member of the
/// <code> <a>EvaluationResult</a> </code> type.
class Statement {
  /// The row and column of the end of a <code>Statement</code> in an IAM policy.
  final Position endPosition;

  /// The identifier of the policy that was provided as an input.
  final String sourcePolicyId;

  /// The type of the policy.
  final PolicySourceType sourcePolicyType;

  /// The row and column of the beginning of the <code>Statement</code> in an IAM
  /// policy.
  final Position startPosition;

  Statement({
    this.endPosition,
    this.sourcePolicyId,
    this.sourcePolicyType,
    this.startPosition,
  });
  factory Statement.fromXml(_s.XmlElement elem) {
    return Statement(
      endPosition: _s
          .extractXmlChild(elem, 'EndPosition')
          ?.let((e) => Position.fromXml(e)),
      sourcePolicyId: _s.extractXmlStringValue(elem, 'SourcePolicyId'),
      sourcePolicyType: _s
          .extractXmlStringValue(elem, 'SourcePolicyType')
          ?.toPolicySourceType(),
      startPosition: _s
          .extractXmlChild(elem, 'StartPosition')
          ?.let((e) => Position.fromXml(e)),
    );
  }
}

/// A structure that represents user-provided metadata that can be associated
/// with a resource such as an IAM user or role. For more information about
/// tagging, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
/// IAM Identities</a> in the <i>IAM User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The key name that can be used to look up or retrieve the associated value.
  /// For example, <code>Department</code> or <code>Cost Center</code> are common
  /// choices.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value associated with this tag. For example, tags with a key name of
  /// <code>Department</code> could have values such as <code>Human
  /// Resources</code>, <code>Accounting</code>, and <code>Support</code>. Tags
  /// with a key name of <code>Cost Center</code> might have values that consist
  /// of the number associated with the different cost centers in your company.
  /// Typically, many resources have tags with the same key name but with
  /// different values.
  /// <note>
  /// AWS always interprets the tag <code>Value</code> as a single string. If you
  /// need to store an array, you can store comma-separated values in the string.
  /// However, you must interpret the value in your code.
  /// </note>
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Contains details about the most recent attempt to access an action within
/// the service.
///
/// This data type is used as a response element in the
/// <a>GetServiceLastAccessedDetails</a> operation.
class TrackedActionLastAccessed {
  /// The name of the tracked action to which access was attempted. Tracked
  /// actions are actions that report activity to IAM.
  final String actionName;
  final String lastAccessedEntity;

  /// The Region from which the authenticated entity (user or role) last attempted
  /// to access the tracked action. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final String lastAccessedRegion;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when an authenticated entity most recently attempted
  /// to access the tracked service. AWS does not report unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">reporting
  /// period</a>.
  final DateTime lastAccessedTime;

  TrackedActionLastAccessed({
    this.actionName,
    this.lastAccessedEntity,
    this.lastAccessedRegion,
    this.lastAccessedTime,
  });
  factory TrackedActionLastAccessed.fromXml(_s.XmlElement elem) {
    return TrackedActionLastAccessed(
      actionName: _s.extractXmlStringValue(elem, 'ActionName'),
      lastAccessedEntity: _s.extractXmlStringValue(elem, 'LastAccessedEntity'),
      lastAccessedRegion: _s.extractXmlStringValue(elem, 'LastAccessedRegion'),
      lastAccessedTime: _s.extractXmlDateTimeValue(elem, 'LastAccessedTime'),
    );
  }
}

class UpdateRoleDescriptionResponse {
  /// A structure that contains details about the modified role.
  final Role role;

  UpdateRoleDescriptionResponse({
    this.role,
  });
  factory UpdateRoleDescriptionResponse.fromXml(_s.XmlElement elem) {
    return UpdateRoleDescriptionResponse(
      role: _s.extractXmlChild(elem, 'Role')?.let((e) => Role.fromXml(e)),
    );
  }
}

class UpdateRoleResponse {
  UpdateRoleResponse();
  factory UpdateRoleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateRoleResponse();
  }
}

/// Contains the response to a successful <a>UpdateSAMLProvider</a> request.
class UpdateSAMLProviderResponse {
  /// The Amazon Resource Name (ARN) of the SAML provider that was updated.
  final String sAMLProviderArn;

  UpdateSAMLProviderResponse({
    this.sAMLProviderArn,
  });
  factory UpdateSAMLProviderResponse.fromXml(_s.XmlElement elem) {
    return UpdateSAMLProviderResponse(
      sAMLProviderArn: _s.extractXmlStringValue(elem, 'SAMLProviderArn'),
    );
  }
}

/// Contains the response to a successful <a>UploadSSHPublicKey</a> request.
class UploadSSHPublicKeyResponse {
  /// Contains information about the SSH public key.
  final SSHPublicKey sSHPublicKey;

  UploadSSHPublicKeyResponse({
    this.sSHPublicKey,
  });
  factory UploadSSHPublicKeyResponse.fromXml(_s.XmlElement elem) {
    return UploadSSHPublicKeyResponse(
      sSHPublicKey: _s
          .extractXmlChild(elem, 'SSHPublicKey')
          ?.let((e) => SSHPublicKey.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>UploadServerCertificate</a>
/// request.
class UploadServerCertificateResponse {
  /// The meta information of the uploaded server certificate without its
  /// certificate body, certificate chain, and private key.
  final ServerCertificateMetadata serverCertificateMetadata;

  UploadServerCertificateResponse({
    this.serverCertificateMetadata,
  });
  factory UploadServerCertificateResponse.fromXml(_s.XmlElement elem) {
    return UploadServerCertificateResponse(
      serverCertificateMetadata: _s
          .extractXmlChild(elem, 'ServerCertificateMetadata')
          ?.let((e) => ServerCertificateMetadata.fromXml(e)),
    );
  }
}

/// Contains the response to a successful <a>UploadSigningCertificate</a>
/// request.
class UploadSigningCertificateResponse {
  /// Information about the certificate.
  final SigningCertificate certificate;

  UploadSigningCertificateResponse({
    @_s.required this.certificate,
  });
  factory UploadSigningCertificateResponse.fromXml(_s.XmlElement elem) {
    return UploadSigningCertificateResponse(
      certificate: _s
          .extractXmlChild(elem, 'Certificate')
          ?.let((e) => SigningCertificate.fromXml(e)),
    );
  }
}

/// Contains information about an IAM user entity.
///
/// This data type is used as a response element in the following operations:
///
/// <ul>
/// <li>
/// <a>CreateUser</a>
/// </li>
/// <li>
/// <a>GetUser</a>
/// </li>
/// <li>
/// <a>ListUsers</a>
/// </li>
/// </ul>
class User {
  /// The Amazon Resource Name (ARN) that identifies the user. For more
  /// information about ARNs and how to use ARNs in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the user was created.
  final DateTime createDate;

  /// The path to the user. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The stable and unique string identifying the user. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String userId;

  /// The friendly name identifying the user.
  final String userName;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the user's password was last used to sign in to
  /// an AWS website. For a list of AWS websites that capture a user's last
  /// sign-in time, see the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Credential
  /// Reports</a> topic in the <i>IAM User Guide</i>. If a password is used more
  /// than once in a five-minute span, only the first use is returned in this
  /// field. If the field is null (no value), then it indicates that they never
  /// signed in with a password. This can be because:
  ///
  /// <ul>
  /// <li>
  /// The user never had a password.
  /// </li>
  /// <li>
  /// A password exists but has not been used since IAM started tracking this
  /// information on October 20, 2014.
  /// </li>
  /// </ul>
  /// A null value does not mean that the user <i>never</i> had a password. Also,
  /// if the user does not currently have a password but had one in the past, then
  /// this field contains the date and time the most recent password was used.
  ///
  /// This value is returned only in the <a>GetUser</a> and <a>ListUsers</a>
  /// operations.
  final DateTime passwordLastUsed;

  /// The ARN of the policy used to set the permissions boundary for the user.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// A list of tags that are associated with the specified user. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  final List<Tag> tags;

  User({
    @_s.required this.arn,
    @_s.required this.createDate,
    @_s.required this.path,
    @_s.required this.userId,
    @_s.required this.userName,
    this.passwordLastUsed,
    this.permissionsBoundary,
    this.tags,
  });
  factory User.fromXml(_s.XmlElement elem) {
    return User(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      path: _s.extractXmlStringValue(elem, 'Path'),
      userId: _s.extractXmlStringValue(elem, 'UserId'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
      passwordLastUsed: _s.extractXmlDateTimeValue(elem, 'PasswordLastUsed'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let((e) => AttachedPermissionsBoundary.fromXml(e)),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
    );
  }
}

/// Contains information about an IAM user, including all the user's policies
/// and all the IAM groups the user is in.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class UserDetail {
  final String arn;

  /// A list of the managed policies attached to the user.
  final List<AttachedPolicy> attachedManagedPolicies;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the user was created.
  final DateTime createDate;

  /// A list of IAM groups that the user is in.
  final List<String> groupList;

  /// The path to the user. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The ARN of the policy used to set the permissions boundary for the user.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// Boundaries for IAM Identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary permissionsBoundary;

  /// A list of tags that are associated with the specified user. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM Identities</a> in the <i>IAM User Guide</i>.
  final List<Tag> tags;

  /// The stable and unique string identifying the user. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String userId;

  /// The friendly name identifying the user.
  final String userName;

  /// A list of the inline policies embedded in the user.
  final List<PolicyDetail> userPolicyList;

  UserDetail({
    this.arn,
    this.attachedManagedPolicies,
    this.createDate,
    this.groupList,
    this.path,
    this.permissionsBoundary,
    this.tags,
    this.userId,
    this.userName,
    this.userPolicyList,
  });
  factory UserDetail.fromXml(_s.XmlElement elem) {
    return UserDetail(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      attachedManagedPolicies: _s
          .extractXmlChild(elem, 'AttachedManagedPolicies')
          ?.let((elem) => elem
              .findElements('member')
              .map((c) => AttachedPolicy.fromXml(c))
              .toList()),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      groupList: _s
          .extractXmlChild(elem, 'GroupList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      path: _s.extractXmlStringValue(elem, 'Path'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let((e) => AttachedPermissionsBoundary.fromXml(e)),
      tags: _s.extractXmlChild(elem, 'Tags')?.let((elem) =>
          elem.findElements('member').map((c) => Tag.fromXml(c)).toList()),
      userId: _s.extractXmlStringValue(elem, 'UserId'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
      userPolicyList: _s.extractXmlChild(elem, 'UserPolicyList')?.let((elem) =>
          elem
              .findElements('member')
              .map((c) => PolicyDetail.fromXml(c))
              .toList()),
    );
  }
}

/// Contains information about a virtual MFA device.
class VirtualMFADevice {
  /// The serial number associated with <code>VirtualMFADevice</code>.
  final String serialNumber;

  /// The base32 seed defined as specified in <a
  /// href="https://tools.ietf.org/html/rfc3548.txt">RFC3548</a>. The
  /// <code>Base32StringSeed</code> is base64-encoded.
  final Uint8List base32StringSeed;

  /// The date and time on which the virtual MFA device was enabled.
  final DateTime enableDate;

  /// A QR code PNG image that encodes
  /// <code>otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String</code>
  /// where <code>$virtualMFADeviceName</code> is one of the create call
  /// arguments. <code>AccountName</code> is the user name if set (otherwise, the
  /// account ID otherwise), and <code>Base32String</code> is the seed in base32
  /// format. The <code>Base32String</code> value is base64-encoded.
  final Uint8List qRCodePNG;

  /// The IAM user associated with this virtual MFA device.
  final User user;

  VirtualMFADevice({
    @_s.required this.serialNumber,
    this.base32StringSeed,
    this.enableDate,
    this.qRCodePNG,
    this.user,
  });
  factory VirtualMFADevice.fromXml(_s.XmlElement elem) {
    return VirtualMFADevice(
      serialNumber: _s.extractXmlStringValue(elem, 'SerialNumber'),
      base32StringSeed: _s.extractXmlUint8ListValue(elem, 'Base32StringSeed'),
      enableDate: _s.extractXmlDateTimeValue(elem, 'EnableDate'),
      qRCodePNG: _s.extractXmlUint8ListValue(elem, 'QRCodePNG'),
      user: _s.extractXmlChild(elem, 'User')?.let((e) => User.fromXml(e)),
    );
  }
}

enum AssignmentStatusType {
  @_s.JsonValue('Assigned')
  assigned,
  @_s.JsonValue('Unassigned')
  unassigned,
  @_s.JsonValue('Any')
  any,
}

extension on AssignmentStatusType {
  String toValue() {
    switch (this) {
      case AssignmentStatusType.assigned:
        return 'Assigned';
      case AssignmentStatusType.unassigned:
        return 'Unassigned';
      case AssignmentStatusType.any:
        return 'Any';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  AssignmentStatusType toAssignmentStatusType() {
    switch (this) {
      case 'Assigned':
        return AssignmentStatusType.assigned;
      case 'Unassigned':
        return AssignmentStatusType.unassigned;
      case 'Any':
        return AssignmentStatusType.any;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum EncodingType {
  @_s.JsonValue('SSH')
  ssh,
  @_s.JsonValue('PEM')
  pem,
}

extension on EncodingType {
  String toValue() {
    switch (this) {
      case EncodingType.ssh:
        return 'SSH';
      case EncodingType.pem:
        return 'PEM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  EncodingType toEncodingType() {
    switch (this) {
      case 'SSH':
        return EncodingType.ssh;
      case 'PEM':
        return EncodingType.pem;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum GlobalEndpointTokenVersion {
  @_s.JsonValue('v1Token')
  v1Token,
  @_s.JsonValue('v2Token')
  v2Token,
}

extension on GlobalEndpointTokenVersion {
  String toValue() {
    switch (this) {
      case GlobalEndpointTokenVersion.v1Token:
        return 'v1Token';
      case GlobalEndpointTokenVersion.v2Token:
        return 'v2Token';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  GlobalEndpointTokenVersion toGlobalEndpointTokenVersion() {
    switch (this) {
      case 'v1Token':
        return GlobalEndpointTokenVersion.v1Token;
      case 'v2Token':
        return GlobalEndpointTokenVersion.v2Token;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum JobStatusType {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

extension on String {
  JobStatusType toJobStatusType() {
    switch (this) {
      case 'IN_PROGRESS':
        return JobStatusType.inProgress;
      case 'COMPLETED':
        return JobStatusType.completed;
      case 'FAILED':
        return JobStatusType.failed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PolicyOwnerEntityType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('ROLE')
  role,
  @_s.JsonValue('GROUP')
  group,
}

extension on String {
  PolicyOwnerEntityType toPolicyOwnerEntityType() {
    switch (this) {
      case 'USER':
        return PolicyOwnerEntityType.user;
      case 'ROLE':
        return PolicyOwnerEntityType.role;
      case 'GROUP':
        return PolicyOwnerEntityType.group;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PolicyScopeType {
  @_s.JsonValue('All')
  all,
  @_s.JsonValue('AWS')
  aws,
  @_s.JsonValue('Local')
  local,
}

extension on PolicyScopeType {
  String toValue() {
    switch (this) {
      case PolicyScopeType.all:
        return 'All';
      case PolicyScopeType.aws:
        return 'AWS';
      case PolicyScopeType.local:
        return 'Local';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  PolicyScopeType toPolicyScopeType() {
    switch (this) {
      case 'All':
        return PolicyScopeType.all;
      case 'AWS':
        return PolicyScopeType.aws;
      case 'Local':
        return PolicyScopeType.local;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PolicyType {
  @_s.JsonValue('INLINE')
  inline,
  @_s.JsonValue('MANAGED')
  managed,
}

extension on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'INLINE':
        return PolicyType.inline;
      case 'MANAGED':
        return PolicyType.managed;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SortKeyType {
  @_s.JsonValue('SERVICE_NAMESPACE_ASCENDING')
  serviceNamespaceAscending,
  @_s.JsonValue('SERVICE_NAMESPACE_DESCENDING')
  serviceNamespaceDescending,
  @_s.JsonValue('LAST_AUTHENTICATED_TIME_ASCENDING')
  lastAuthenticatedTimeAscending,
  @_s.JsonValue('LAST_AUTHENTICATED_TIME_DESCENDING')
  lastAuthenticatedTimeDescending,
}

extension on SortKeyType {
  String toValue() {
    switch (this) {
      case SortKeyType.serviceNamespaceAscending:
        return 'SERVICE_NAMESPACE_ASCENDING';
      case SortKeyType.serviceNamespaceDescending:
        return 'SERVICE_NAMESPACE_DESCENDING';
      case SortKeyType.lastAuthenticatedTimeAscending:
        return 'LAST_AUTHENTICATED_TIME_ASCENDING';
      case SortKeyType.lastAuthenticatedTimeDescending:
        return 'LAST_AUTHENTICATED_TIME_DESCENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  SortKeyType toSortKeyType() {
    switch (this) {
      case 'SERVICE_NAMESPACE_ASCENDING':
        return SortKeyType.serviceNamespaceAscending;
      case 'SERVICE_NAMESPACE_DESCENDING':
        return SortKeyType.serviceNamespaceDescending;
      case 'LAST_AUTHENTICATED_TIME_ASCENDING':
        return SortKeyType.lastAuthenticatedTimeAscending;
      case 'LAST_AUTHENTICATED_TIME_DESCENDING':
        return SortKeyType.lastAuthenticatedTimeDescending;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum StatusType {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Inactive')
  inactive,
}

extension on StatusType {
  String toValue() {
    switch (this) {
      case StatusType.active:
        return 'Active';
      case StatusType.inactive:
        return 'Inactive';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  StatusType toStatusType() {
    switch (this) {
      case 'Active':
        return StatusType.active;
      case 'Inactive':
        return StatusType.inactive;
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SummaryKeyType {
  @_s.JsonValue('Users')
  users,
  @_s.JsonValue('UsersQuota')
  usersQuota,
  @_s.JsonValue('Groups')
  groups,
  @_s.JsonValue('GroupsQuota')
  groupsQuota,
  @_s.JsonValue('ServerCertificates')
  serverCertificates,
  @_s.JsonValue('ServerCertificatesQuota')
  serverCertificatesQuota,
  @_s.JsonValue('UserPolicySizeQuota')
  userPolicySizeQuota,
  @_s.JsonValue('GroupPolicySizeQuota')
  groupPolicySizeQuota,
  @_s.JsonValue('GroupsPerUserQuota')
  groupsPerUserQuota,
  @_s.JsonValue('SigningCertificatesPerUserQuota')
  signingCertificatesPerUserQuota,
  @_s.JsonValue('AccessKeysPerUserQuota')
  accessKeysPerUserQuota,
  @_s.JsonValue('MFADevices')
  mFADevices,
  @_s.JsonValue('MFADevicesInUse')
  mFADevicesInUse,
  @_s.JsonValue('AccountMFAEnabled')
  accountMFAEnabled,
  @_s.JsonValue('AccountAccessKeysPresent')
  accountAccessKeysPresent,
  @_s.JsonValue('AccountSigningCertificatesPresent')
  accountSigningCertificatesPresent,
  @_s.JsonValue('AttachedPoliciesPerGroupQuota')
  attachedPoliciesPerGroupQuota,
  @_s.JsonValue('AttachedPoliciesPerRoleQuota')
  attachedPoliciesPerRoleQuota,
  @_s.JsonValue('AttachedPoliciesPerUserQuota')
  attachedPoliciesPerUserQuota,
  @_s.JsonValue('Policies')
  policies,
  @_s.JsonValue('PoliciesQuota')
  policiesQuota,
  @_s.JsonValue('PolicySizeQuota')
  policySizeQuota,
  @_s.JsonValue('PolicyVersionsInUse')
  policyVersionsInUse,
  @_s.JsonValue('PolicyVersionsInUseQuota')
  policyVersionsInUseQuota,
  @_s.JsonValue('VersionsPerPolicyQuota')
  versionsPerPolicyQuota,
  @_s.JsonValue('GlobalEndpointTokenVersion')
  globalEndpointTokenVersion,
}

extension on String {
  SummaryKeyType toSummaryKeyType() {
    switch (this) {
      case 'Users':
        return SummaryKeyType.users;
      case 'UsersQuota':
        return SummaryKeyType.usersQuota;
      case 'Groups':
        return SummaryKeyType.groups;
      case 'GroupsQuota':
        return SummaryKeyType.groupsQuota;
      case 'ServerCertificates':
        return SummaryKeyType.serverCertificates;
      case 'ServerCertificatesQuota':
        return SummaryKeyType.serverCertificatesQuota;
      case 'UserPolicySizeQuota':
        return SummaryKeyType.userPolicySizeQuota;
      case 'GroupPolicySizeQuota':
        return SummaryKeyType.groupPolicySizeQuota;
      case 'GroupsPerUserQuota':
        return SummaryKeyType.groupsPerUserQuota;
      case 'SigningCertificatesPerUserQuota':
        return SummaryKeyType.signingCertificatesPerUserQuota;
      case 'AccessKeysPerUserQuota':
        return SummaryKeyType.accessKeysPerUserQuota;
      case 'MFADevices':
        return SummaryKeyType.mFADevices;
      case 'MFADevicesInUse':
        return SummaryKeyType.mFADevicesInUse;
      case 'AccountMFAEnabled':
        return SummaryKeyType.accountMFAEnabled;
      case 'AccountAccessKeysPresent':
        return SummaryKeyType.accountAccessKeysPresent;
      case 'AccountSigningCertificatesPresent':
        return SummaryKeyType.accountSigningCertificatesPresent;
      case 'AttachedPoliciesPerGroupQuota':
        return SummaryKeyType.attachedPoliciesPerGroupQuota;
      case 'AttachedPoliciesPerRoleQuota':
        return SummaryKeyType.attachedPoliciesPerRoleQuota;
      case 'AttachedPoliciesPerUserQuota':
        return SummaryKeyType.attachedPoliciesPerUserQuota;
      case 'Policies':
        return SummaryKeyType.policies;
      case 'PoliciesQuota':
        return SummaryKeyType.policiesQuota;
      case 'PolicySizeQuota':
        return SummaryKeyType.policySizeQuota;
      case 'PolicyVersionsInUse':
        return SummaryKeyType.policyVersionsInUse;
      case 'PolicyVersionsInUseQuota':
        return SummaryKeyType.policyVersionsInUseQuota;
      case 'VersionsPerPolicyQuota':
        return SummaryKeyType.versionsPerPolicyQuota;
      case 'GlobalEndpointTokenVersion':
        return SummaryKeyType.globalEndpointTokenVersion;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class CredentialReportExpiredException extends _s.GenericAwsException {
  CredentialReportExpiredException({String type, String message})
      : super(
            type: type,
            code: 'CredentialReportExpiredException',
            message: message);
}

class CredentialReportNotPresentException extends _s.GenericAwsException {
  CredentialReportNotPresentException({String type, String message})
      : super(
            type: type,
            code: 'CredentialReportNotPresentException',
            message: message);
}

class CredentialReportNotReadyException extends _s.GenericAwsException {
  CredentialReportNotReadyException({String type, String message})
      : super(
            type: type,
            code: 'CredentialReportNotReadyException',
            message: message);
}

class DeleteConflictException extends _s.GenericAwsException {
  DeleteConflictException({String type, String message})
      : super(type: type, code: 'DeleteConflictException', message: message);
}

class DuplicateCertificateException extends _s.GenericAwsException {
  DuplicateCertificateException({String type, String message})
      : super(
            type: type,
            code: 'DuplicateCertificateException',
            message: message);
}

class DuplicateSSHPublicKeyException extends _s.GenericAwsException {
  DuplicateSSHPublicKeyException({String type, String message})
      : super(
            type: type,
            code: 'DuplicateSSHPublicKeyException',
            message: message);
}

class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

class EntityTemporarilyUnmodifiableException extends _s.GenericAwsException {
  EntityTemporarilyUnmodifiableException({String type, String message})
      : super(
            type: type,
            code: 'EntityTemporarilyUnmodifiableException',
            message: message);
}

class InvalidAuthenticationCodeException extends _s.GenericAwsException {
  InvalidAuthenticationCodeException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAuthenticationCodeException',
            message: message);
}

class InvalidCertificateException extends _s.GenericAwsException {
  InvalidCertificateException({String type, String message})
      : super(
            type: type, code: 'InvalidCertificateException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidPublicKeyException extends _s.GenericAwsException {
  InvalidPublicKeyException({String type, String message})
      : super(type: type, code: 'InvalidPublicKeyException', message: message);
}

class InvalidUserTypeException extends _s.GenericAwsException {
  InvalidUserTypeException({String type, String message})
      : super(type: type, code: 'InvalidUserTypeException', message: message);
}

class KeyPairMismatchException extends _s.GenericAwsException {
  KeyPairMismatchException({String type, String message})
      : super(type: type, code: 'KeyPairMismatchException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedCertificateException extends _s.GenericAwsException {
  MalformedCertificateException({String type, String message})
      : super(
            type: type,
            code: 'MalformedCertificateException',
            message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String type, String message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class NoSuchEntityException extends _s.GenericAwsException {
  NoSuchEntityException({String type, String message})
      : super(type: type, code: 'NoSuchEntityException', message: message);
}

class PasswordPolicyViolationException extends _s.GenericAwsException {
  PasswordPolicyViolationException({String type, String message})
      : super(
            type: type,
            code: 'PasswordPolicyViolationException',
            message: message);
}

class PolicyEvaluationException extends _s.GenericAwsException {
  PolicyEvaluationException({String type, String message})
      : super(type: type, code: 'PolicyEvaluationException', message: message);
}

class PolicyNotAttachableException extends _s.GenericAwsException {
  PolicyNotAttachableException({String type, String message})
      : super(
            type: type, code: 'PolicyNotAttachableException', message: message);
}

class ReportGenerationLimitExceededException extends _s.GenericAwsException {
  ReportGenerationLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ReportGenerationLimitExceededException',
            message: message);
}

class ServiceFailureException extends _s.GenericAwsException {
  ServiceFailureException({String type, String message})
      : super(type: type, code: 'ServiceFailureException', message: message);
}

class ServiceNotSupportedException extends _s.GenericAwsException {
  ServiceNotSupportedException({String type, String message})
      : super(
            type: type, code: 'ServiceNotSupportedException', message: message);
}

class UnmodifiableEntityException extends _s.GenericAwsException {
  UnmodifiableEntityException({String type, String message})
      : super(
            type: type, code: 'UnmodifiableEntityException', message: message);
}

class UnrecognizedPublicKeyEncodingException extends _s.GenericAwsException {
  UnrecognizedPublicKeyEncodingException({String type, String message})
      : super(
            type: type,
            code: 'UnrecognizedPublicKeyEncodingException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'CredentialReportExpiredException': (type, message) =>
      CredentialReportExpiredException(type: type, message: message),
  'CredentialReportNotPresentException': (type, message) =>
      CredentialReportNotPresentException(type: type, message: message),
  'CredentialReportNotReadyException': (type, message) =>
      CredentialReportNotReadyException(type: type, message: message),
  'DeleteConflictException': (type, message) =>
      DeleteConflictException(type: type, message: message),
  'DuplicateCertificateException': (type, message) =>
      DuplicateCertificateException(type: type, message: message),
  'DuplicateSSHPublicKeyException': (type, message) =>
      DuplicateSSHPublicKeyException(type: type, message: message),
  'EntityAlreadyExistsException': (type, message) =>
      EntityAlreadyExistsException(type: type, message: message),
  'EntityTemporarilyUnmodifiableException': (type, message) =>
      EntityTemporarilyUnmodifiableException(type: type, message: message),
  'InvalidAuthenticationCodeException': (type, message) =>
      InvalidAuthenticationCodeException(type: type, message: message),
  'InvalidCertificateException': (type, message) =>
      InvalidCertificateException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'InvalidPublicKeyException': (type, message) =>
      InvalidPublicKeyException(type: type, message: message),
  'InvalidUserTypeException': (type, message) =>
      InvalidUserTypeException(type: type, message: message),
  'KeyPairMismatchException': (type, message) =>
      KeyPairMismatchException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MalformedCertificateException': (type, message) =>
      MalformedCertificateException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
  'NoSuchEntityException': (type, message) =>
      NoSuchEntityException(type: type, message: message),
  'PasswordPolicyViolationException': (type, message) =>
      PasswordPolicyViolationException(type: type, message: message),
  'PolicyEvaluationException': (type, message) =>
      PolicyEvaluationException(type: type, message: message),
  'PolicyNotAttachableException': (type, message) =>
      PolicyNotAttachableException(type: type, message: message),
  'ReportGenerationLimitExceededException': (type, message) =>
      ReportGenerationLimitExceededException(type: type, message: message),
  'ServiceFailureException': (type, message) =>
      ServiceFailureException(type: type, message: message),
  'ServiceNotSupportedException': (type, message) =>
      ServiceNotSupportedException(type: type, message: message),
  'UnmodifiableEntityException': (type, message) =>
      UnmodifiableEntityException(type: type, message: message),
  'UnrecognizedPublicKeyEncodingException': (type, message) =>
      UnrecognizedPublicKeyEncodingException(type: type, message: message),
};
