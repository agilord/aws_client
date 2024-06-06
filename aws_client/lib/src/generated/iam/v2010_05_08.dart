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

import 'v2010_05_08.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

/// Identity and Access Management (IAM) is a web service for securely
/// controlling access to Amazon Web Services services. With IAM, you can
/// centrally manage users, security credentials such as access keys, and
/// permissions that control which Amazon Web Services resources users and
/// applications can access. For more information about IAM, see <a
/// href="http://aws.amazon.com/iam/">Identity and Access Management (IAM)</a>
/// and the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/">Identity
/// and Access Management User Guide</a>.
class Iam {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Iam({
    String? region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iam',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

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
    required String clientID,
    required String openIDConnectProviderArn,
  }) async {
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
  /// profile can contain only one role, and this quota cannot be increased. You
  /// can remove the existing role and then add a different role to an instance
  /// profile. You must then wait for the change to appear across all of Amazon
  /// Web Services because of <a
  /// href="https://en.wikipedia.org/wiki/Eventual_consistency">eventual
  /// consistency</a>. To force the change, you must <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DisassociateIamInstanceProfile.html">disassociate
  /// the instance profile</a> and then <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_AssociateIamInstanceProfile.html">associate
  /// the instance profile</a>, or you can stop your instance and then restart
  /// it.
  /// <note>
  /// The caller of this operation must be granted the <code>PassRole</code>
  /// permission on the IAM role by a permissions policy.
  /// </note>
  /// For more information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>IAM User Guide</i>. For more information about
  /// instance profiles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html">Using
  /// instance profiles</a> in the <i>IAM User Guide</i>.
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
    required String instanceProfileName,
    required String roleName,
  }) async {
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
    required String groupName,
    required String userName,
  }) async {
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
  /// You use this operation to attach a managed policy to a group. To embed an
  /// inline policy in a group, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutGroupPolicy.html">
  /// <code>PutGroupPolicy</code> </a>.
  ///
  /// As a best practice, you can validate your IAM policies. To learn more, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating
  /// IAM policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> attachGroupPolicy({
    required String groupName,
    required String policyArn,
  }) async {
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
  /// trust policy is created at the same time as the role, using <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">
  /// <code>CreateRole</code> </a>. You can update a role's trust policy using
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAssumeRolePolicy.html">
  /// <code>UpdateAssumerolePolicy</code> </a>.
  /// </note>
  /// Use this operation to attach a <i>managed</i> policy to a role. To embed
  /// an inline policy in a role, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutRolePolicy.html">
  /// <code>PutRolePolicy</code> </a>. For more information about policies, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  ///
  /// As a best practice, you can validate your IAM policies. To learn more, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating
  /// IAM policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policyArn,
    required String roleName,
  }) async {
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
  /// You use this operation to attach a <i>managed</i> policy to a user. To
  /// embed an inline policy in a user, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_PutUserPolicy.html">
  /// <code>PutUserPolicy</code> </a>.
  ///
  /// As a best practice, you can validate your IAM policies. To learn more, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating
  /// IAM policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policyArn,
    required String userName,
  }) async {
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

  /// Changes the password of the IAM user who is calling this operation. This
  /// operation can be performed using the CLI, the Amazon Web Services API, or
  /// the <b>My Security Credentials</b> page in the Amazon Web Services
  /// Management Console. The Amazon Web Services account root user password is
  /// not affected by this operation.
  ///
  /// Use <a>UpdateLoginProfile</a> to use the CLI, the Amazon Web Services API,
  /// or the <b>Users</b> page in the IAM console to change the password for any
  /// IAM user. For more information about modifying passwords, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing
  /// passwords</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidUserTypeException].
  /// May throw [LimitExceededException].
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [PasswordPolicyViolationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [newPassword] :
  /// The new password. The new password must conform to the Amazon Web Services
  /// account's password policy, if one exists.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter is a string of characters. That string can
  /// include almost any printable ASCII character from the space
  /// (<code>\u0020</code>) through the end of the ASCII character range
  /// (<code>\u00FF</code>). You can also include the tab (<code>\u0009</code>),
  /// line feed (<code>\u000A</code>), and carriage return (<code>\u000D</code>)
  /// characters. Any of these characters are valid in a password. However, many
  /// tools, such as the Amazon Web Services Management Console, might restrict
  /// the ability to type certain characters because they have special meaning
  /// within that tool.
  ///
  /// Parameter [oldPassword] :
  /// The IAM user's current password.
  Future<void> changePassword({
    required String newPassword,
    required String oldPassword,
  }) async {
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

  /// Creates a new Amazon Web Services secret access key and corresponding
  /// Amazon Web Services access key ID for the specified user. The default
  /// status for new keys is <code>Active</code>.
  ///
  /// If you do not specify a user name, IAM determines the user name implicitly
  /// based on the Amazon Web Services access key ID signing the request. This
  /// operation works for access keys under the Amazon Web Services account.
  /// Consequently, you can use this operation to manage Amazon Web Services
  /// account root user credentials. This is true even if the Amazon Web
  /// Services account has no associated users.
  ///
  /// For information about quotas on the number of keys you can create, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
  /// <important>
  /// To ensure the security of your Amazon Web Services account, the secret
  /// access key is accessible only during key and user creation. You must save
  /// the key (for example, in a text file) if you want to be able to access it
  /// again. If a secret key is lost, you can delete the access keys for the
  /// associated user and then create new keys.
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
    String? userName,
  }) async {
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

  /// Creates an alias for your Amazon Web Services account. For information
  /// about using an Amazon Web Services account alias, see <a
  /// href="https://docs.aws.amazon.com/signin/latest/userguide/CreateAccountAlias.html">Creating,
  /// deleting, and listing an Amazon Web Services account alias</a> in the
  /// <i>Amazon Web Services Sign-In User Guide</i>.
  ///
  /// May throw [ConcurrentModificationException].
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
    required String accountAlias,
  }) async {
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
  /// For information about the number of groups you can create, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
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
    required String groupName,
    String? path,
  }) async {
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
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html">Using
  /// roles for applications on Amazon EC2</a> in the <i>IAM User Guide</i>, and
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html#ec2-instance-profile">Instance
  /// profiles</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// For information about the number of instance profiles you can create, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// object quotas</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [EntityAlreadyExistsException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
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
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the newly created IAM instance
  /// profile. Each tag consists of a key name and an associated value. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  Future<CreateInstanceProfileResponse> createInstanceProfile({
    required String instanceProfileName,
    String? path,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    path?.also((arg) => $request['Path'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
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

  /// Creates a password for the specified IAM user. A password allows an IAM
  /// user to access Amazon Web Services services through the Amazon Web
  /// Services Management Console.
  ///
  /// You can use the CLI, the Amazon Web Services API, or the <b>Users</b> page
  /// in the IAM console to create a password for any IAM user. Use
  /// <a>ChangePassword</a> to update your own existing password in the <b>My
  /// Security Credentials</b> page in the Amazon Web Services Management
  /// Console.
  ///
  /// For more information about managing passwords, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing
  /// passwords</a> in the <i>IAM User Guide</i>.
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
  /// tools, such as the Amazon Web Services Management Console, might restrict
  /// the ability to type certain characters because they have special meaning
  /// within that tool.
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
    required String password,
    required String userName,
    bool? passwordResetRequired,
  }) async {
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
  /// relationship between Amazon Web Services and the OIDC provider.
  ///
  /// If you are using an OIDC identity provider from Google, Facebook, or
  /// Amazon Cognito, you don't need to create a separate IAM identity provider.
  /// These OIDC identity providers are already built-in to Amazon Web Services
  /// and are available for your use. Instead, you can move directly to creating
  /// new roles using your identity provider. To learn more, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html">Creating
  /// a role for web identity or OpenID connect federation</a> in the <i>IAM
  /// User Guide</i>.
  ///
  /// When you create the IAM OIDC provider, you specify the following:
  ///
  /// <ul>
  /// <li>
  /// The URL of the OIDC identity provider (IdP) to trust
  /// </li>
  /// <li>
  /// A list of client IDs (also known as audiences) that identify the
  /// application or applications allowed to authenticate using the OIDC
  /// provider
  /// </li>
  /// <li>
  /// A list of tags that are attached to the specified IAM OIDC provider
  /// </li>
  /// <li>
  /// A list of thumbprints of one or more server certificates that the IdP uses
  /// </li>
  /// </ul>
  /// You get all of this information from the OIDC IdP you want to use to
  /// access Amazon Web Services.
  /// <note>
  /// Amazon Web Services secures communication with some OIDC identity
  /// providers (IdPs) through our library of trusted root certificate
  /// authorities (CAs) instead of using a certificate thumbprint to verify your
  /// IdP server certificate. In these cases, your legacy thumbprint remains in
  /// your configuration, but is no longer used for validation. These OIDC IdPs
  /// include Auth0, GitHub, GitLab, Google, and those that use an Amazon S3
  /// bucket to host a JSON Web Key Set (JWKS) endpoint.
  /// </note> <note>
  /// The trust for the OIDC provider is derived from the IAM provider that this
  /// operation creates. Therefore, it is best to limit access to the
  /// <a>CreateOpenIDConnectProvider</a> operation to highly privileged users.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  /// May throw [OpenIdIdpCommunicationErrorException].
  ///
  /// Parameter [url] :
  /// The URL of the identity provider. The URL must begin with
  /// <code>https://</code> and should correspond to the <code>iss</code> claim
  /// in the provider's OpenID Connect ID tokens. Per the OIDC standard, path
  /// components are allowed but query parameters are not. Typically the URL
  /// consists of only a hostname, like <code>https://server.example.org</code>
  /// or <code>https://example.com</code>. The URL should not contain a port
  /// number.
  ///
  /// You cannot register the same provider multiple times in a single Amazon
  /// Web Services account. If you try to submit a URL that has already been
  /// used for an OpenID Connect provider in the Amazon Web Services account,
  /// you will get an error.
  ///
  /// Parameter [clientIDList] :
  /// Provides a list of client IDs, also known as audiences. When a mobile or
  /// web app registers with an OpenID Connect provider, they establish a value
  /// that identifies the application. This is the value that's sent as the
  /// <code>client_id</code> parameter on OAuth requests.
  ///
  /// You can register multiple client IDs with the same provider. For example,
  /// you might have multiple applications that use the same OIDC provider. You
  /// cannot register more than 100 client IDs with a single IAM OIDC provider.
  ///
  /// There is no defined format for a client ID. The
  /// <code>CreateOpenIDConnectProviderRequest</code> operation accepts client
  /// IDs up to 255 characters long.
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the new IAM OpenID Connect
  /// (OIDC) provider. Each tag consists of a key name and an associated value.
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  ///
  /// Parameter [thumbprintList] :
  /// A list of server certificate thumbprints for the OpenID Connect (OIDC)
  /// identity provider's server certificates. Typically this list includes only
  /// one entry. However, IAM lets you have up to five thumbprints for an OIDC
  /// provider. This lets you maintain multiple thumbprints if the identity
  /// provider is rotating certificates.
  ///
  /// This parameter is optional. If it is not included, IAM will retrieve and
  /// use the top intermediate certificate authority (CA) thumbprint of the
  /// OpenID Connect identity provider server certificate.
  ///
  /// The server certificate thumbprint is the hex-encoded SHA-1 hash value of
  /// the X.509 certificate used by the domain where the OpenID Connect provider
  /// makes its keys available. It is always a 40-character string.
  ///
  /// For example, assume that the OIDC provider is
  /// <code>server.example.com</code> and the provider stores its keys at
  /// https://keys.server.example.com/openid-connect. In that case, the
  /// thumbprint string would be the hex-encoded SHA-1 hash value of the
  /// certificate used by <code>https://keys.server.example.com.</code>
  ///
  /// For more information about obtaining the OIDC provider thumbprint, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/identity-providers-oidc-obtain-thumbprint.html">Obtaining
  /// the thumbprint for an OpenID Connect provider</a> in the <i>IAM user
  /// Guide</i>.
  Future<CreateOpenIDConnectProviderResponse> createOpenIDConnectProvider({
    required String url,
    List<String>? clientIDList,
    List<Tag>? tags,
    List<String>? thumbprintList,
  }) async {
    final $request = <String, dynamic>{};
    $request['Url'] = url;
    clientIDList?.also((arg) => $request['ClientIDList'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    thumbprintList?.also((arg) => $request['ThumbprintList'] = arg);
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

  /// Creates a new managed policy for your Amazon Web Services account.
  ///
  /// This operation creates a policy version with a version identifier of
  /// <code>v1</code> and sets v1 as the policy's default version. For more
  /// information about policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for managed policies</a> in the <i>IAM User Guide</i>.
  ///
  /// As a best practice, you can validate your IAM policies. To learn more, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_policy-validator.html">Validating
  /// IAM policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about managed policies in general, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON policy document that you want to use as the content for the new
  /// policy.
  ///
  /// You must provide policies in JSON format in IAM. However, for
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. CloudFormation always converts a YAML policy to JSON
  /// format before submitting it to IAM.
  ///
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
  ///
  /// To learn more about JSON policy grammar, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_grammar.html">Grammar
  /// of the IAM JSON policy language</a> in the <i>IAM User Guide</i>.
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
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
  /// <note>
  /// You cannot use an asterisk (*) in the path name.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the new IAM customer managed
  /// policy. Each tag consists of a key name and an associated value. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  Future<CreatePolicyResponse> createPolicy({
    required String policyDocument,
    required String policyName,
    String? description,
    String? path,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['PolicyDocument'] = policyDocument;
    $request['PolicyName'] = policyName;
    description?.also((arg) => $request['Description'] = arg);
    path?.also((arg) => $request['Path'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
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
  /// for managed policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [policyDocument] :
  /// The JSON policy document that you want to use as the content for this new
  /// version of the policy.
  ///
  /// You must provide policies in JSON format in IAM. However, for
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. CloudFormation always converts a YAML policy to JSON
  /// format before submitting it to IAM.
  ///
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
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
  /// for managed policies</a> in the <i>IAM User Guide</i>.
  Future<CreatePolicyVersionResponse> createPolicyVersion({
    required String policyArn,
    required String policyDocument,
    bool? setAsDefault,
  }) async {
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

  /// Creates a new role for your Amazon Web Services account.
  ///
  /// For more information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>IAM User Guide</i>. For information about quotas for
  /// role names and the number of roles you can create, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
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
  /// string. However, for CloudFormation templates formatted in YAML, you can
  /// provide the policy in JSON or YAML format. CloudFormation always converts
  /// a YAML policy to JSON format before submitting it to IAM.
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
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [description] :
  /// A description of the role.
  ///
  /// Parameter [maxSessionDuration] :
  /// The maximum session duration (in seconds) that you want to set for the
  /// specified role. If you do not specify a value for this setting, the
  /// default value of one hour is applied. This setting can have a value from 1
  /// hour to 12 hours.
  ///
  /// Anyone who assumes the role from the CLI or API can use the
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
  /// IAM roles</a> in the <i>IAM User Guide</i>.
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
  /// The ARN of the managed policy that is used to set the permissions boundary
  /// for the role.
  ///
  /// A permissions boundary policy defines the maximum permissions that
  /// identity-based policies can grant to an entity, but does not grant
  /// permissions. Permissions boundaries do not define the maximum permissions
  /// that a resource-based policy can grant to an entity. To learn more, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM entities</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types">Policy
  /// types </a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the new role. Each tag consists
  /// of a key name and an associated value. For more information about tagging,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  Future<CreateRoleResponse> createRole({
    required String assumeRolePolicyDocument,
    required String roleName,
    String? description,
    int? maxSessionDuration,
    String? path,
    String? permissionsBoundary,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'maxSessionDuration',
      maxSessionDuration,
      3600,
      43200,
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
  /// create an IAM role that supports Web-based single sign-on (SSO) to the
  /// Amazon Web Services Management Console or one that supports API access to
  /// Amazon Web Services.
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
  /// SAML 2.0 federated users to access the Amazon Web Services Management
  /// Console</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About
  /// SAML 2.0-based federation</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
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
  /// SAML 2.0-based federation</a> in the <i>IAM User Guide</i>
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the new IAM SAML provider. Each
  /// tag consists of a key name and an associated value. For more information
  /// about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  Future<CreateSAMLProviderResponse> createSAMLProvider({
    required String name,
    required String sAMLMetadataDocument,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    $request['SAMLMetadataDocument'] = sAMLMetadataDocument;
    tags?.also((arg) => $request['Tags'] = arg);
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

  /// Creates an IAM role that is linked to a specific Amazon Web Services
  /// service. The service controls the attached policies and when the role can
  /// be deleted. This helps ensure that the service is not broken by an
  /// unexpectedly changed or deleted role, which could put your Amazon Web
  /// Services resources into an unknown state. Allowing the service to control
  /// the role helps improve service stability and proper cleanup when a service
  /// and its role are no longer needed. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">Using
  /// service-linked roles</a> in the <i>IAM User Guide</i>.
  ///
  /// To attach a policy to this service-linked role, you must make the request
  /// using the Amazon Web Services service that depends on this role.
  ///
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [awsServiceName] :
  /// The service principal for the Amazon Web Services service to which this
  /// role is attached. You use a string similar to a URL but without the
  /// http:// in front. For example:
  /// <code>elasticbeanstalk.amazonaws.com</code>.
  ///
  /// Service principals are unique and case-sensitive. To find the exact
  /// service principal for your service-linked role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html">Amazon
  /// Web Services services that work with IAM</a> in the <i>IAM User Guide</i>.
  /// Look for the services that have <b>Yes </b>in the <b>Service-Linked
  /// Role</b> column. Choose the <b>Yes</b> link to view the service-linked
  /// role documentation for that service.
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
    required String awsServiceName,
    String? customSuffix,
    String? description,
  }) async {
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
  /// You can create service-specific credentials for CodeCommit and Amazon
  /// Keyspaces (for Apache Cassandra).
  ///
  /// You can reset the password to a new service-generated value by calling
  /// <a>ResetServiceSpecificCredential</a>.
  ///
  /// For more information about service-specific credentials, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html">Using
  /// IAM with CodeCommit: Git credentials, SSH keys, and Amazon Web Services
  /// access keys</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceNotSupportedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the Amazon Web Services service that is to be associated with
  /// the credentials. The service you specify here is the only service that can
  /// be accessed using these credentials.
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
    required String serviceName,
    required String userName,
  }) async {
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

  /// Creates a new IAM user for your Amazon Web Services account.
  ///
  /// For information about quotas for the number of IAM users you can create,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
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
  /// The ARN of the managed policy that is used to set the permissions boundary
  /// for the user.
  ///
  /// A permissions boundary policy defines the maximum permissions that
  /// identity-based policies can grant to an entity, but does not grant
  /// permissions. Permissions boundaries do not define the maximum permissions
  /// that a resource-based policy can grant to an entity. To learn more, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM entities</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types">Policy
  /// types </a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the new user. Each tag consists
  /// of a key name and an associated value. For more information about tagging,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  Future<CreateUserResponse> createUser({
    required String userName,
    String? path,
    String? permissionsBoundary,
    List<Tag>? tags,
  }) async {
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

  /// Creates a new virtual MFA device for the Amazon Web Services account.
  /// After creating the virtual MFA, use <a>EnableMFADevice</a> to attach the
  /// MFA device to an IAM user. For more information about creating and working
  /// with virtual MFA devices, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Using
  /// a virtual MFA device</a> in the <i>IAM User Guide</i>.
  ///
  /// For information about the maximum number of MFA devices you can create,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
  /// <important>
  /// The seed information contained in the QR code and the Base32 string should
  /// be treated like any other secret access information. In other words,
  /// protect the seed information as you would your Amazon Web Services access
  /// keys or your passwords. After you provision your virtual device, you
  /// should ensure that the information is destroyed following secure
  /// procedures.
  /// </important>
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [virtualMFADeviceName] :
  /// The name of the virtual MFA device, which must be unique. Use with path to
  /// uniquely identify a virtual MFA device.
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
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
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the new IAM virtual MFA device.
  /// Each tag consists of a key name and an associated value. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  Future<CreateVirtualMFADeviceResponse> createVirtualMFADevice({
    required String virtualMFADeviceName,
    String? path,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['VirtualMFADeviceName'] = virtualMFADeviceName;
    path?.also((arg) => $request['Path'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
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
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Enabling
  /// a virtual multi-factor authentication (MFA) device</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// May throw [EntityTemporarilyUnmodifiableException].
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ConcurrentModificationException].
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
    required String serialNumber,
    required String userName,
  }) async {
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
  /// based on the Amazon Web Services access key ID signing the request. This
  /// operation works for access keys under the Amazon Web Services account.
  /// Consequently, you can use this operation to manage Amazon Web Services
  /// account root user credentials even if the Amazon Web Services account has
  /// no associated users.
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
    required String accessKeyId,
    String? userName,
  }) async {
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

  /// Deletes the specified Amazon Web Services account alias. For information
  /// about using an Amazon Web Services account alias, see <a
  /// href="https://docs.aws.amazon.com/signin/latest/userguide/CreateAccountAlias.html">Creating,
  /// deleting, and listing an Amazon Web Services account alias</a> in the
  /// <i>Amazon Web Services Sign-In User Guide</i>.
  ///
  /// May throw [ConcurrentModificationException].
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
    required String accountAlias,
  }) async {
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

  /// Deletes the password policy for the Amazon Web Services account. There are
  /// no parameters.
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
    required String groupName,
  }) async {
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String groupName,
    required String policyName,
  }) async {
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
  /// For more information about instance profiles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html">Using
  /// instance profiles</a> in the <i>IAM User Guide</i>.
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
    required String instanceProfileName,
  }) async {
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

  /// Deletes the password for the specified IAM user, For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_admin-change-user.html">Managing
  /// passwords for IAM users</a>.
  ///
  /// You can use the CLI, the Amazon Web Services API, or the <b>Users</b> page
  /// in the IAM console to delete a password for any IAM user. You can use
  /// <a>ChangePassword</a> to update, but not delete, your own password in the
  /// <b>My Security Credentials</b> page in the Amazon Web Services Management
  /// Console.
  /// <important>
  /// Deleting a user's password does not prevent a user from accessing Amazon
  /// Web Services through the command line interface or the API. To prevent all
  /// user access, you must also either make any access keys inactive or delete
  /// them. For more information about making keys inactive or deleting them,
  /// see <a>UpdateAccessKey</a> and <a>DeleteAccessKey</a>.
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
    required String userName,
  }) async {
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
    required String openIDConnectProviderArn,
  }) async {
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
  /// attached to, using <a>DetachUserPolicy</a>, <a>DetachGroupPolicy</a>, or
  /// <a>DetachRolePolicy</a>. To list all the users, groups, and roles that a
  /// policy is attached to, use <a>ListEntitiesForPolicy</a>.
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
  /// version) using this operation.
  /// </li>
  /// </ul>
  /// For information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> deletePolicy({
    required String policyArn,
  }) async {
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
  /// You cannot delete the default version from a policy using this operation.
  /// To delete the default version from a policy, use <a>DeletePolicy</a>. To
  /// find out which version of a policy is marked as the default version, use
  /// <a>ListPolicyVersions</a>.
  ///
  /// For information about versions for managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for managed policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
  /// for managed policies</a> in the <i>IAM User Guide</i>.
  Future<void> deletePolicyVersion({
    required String policyArn,
    required String versionId,
  }) async {
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

  /// Deletes the specified role. Unlike the Amazon Web Services Management
  /// Console, when you delete a role programmatically, you must delete the
  /// items attached to the role manually, or the deletion fails. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_manage_delete.html#roles-managingrole-deleting-cli">Deleting
  /// an IAM role</a>. Before attempting to delete a role, remove the following
  /// attached items:
  ///
  /// <ul>
  /// <li>
  /// Inline policies (<a>DeleteRolePolicy</a>)
  /// </li>
  /// <li>
  /// Attached managed policies (<a>DetachRolePolicy</a>)
  /// </li>
  /// <li>
  /// Instance profile (<a>RemoveRoleFromInstanceProfile</a>)
  /// </li>
  /// <li>
  /// Optional – Delete instance profile after detaching from role for resource
  /// clean up (<a>DeleteInstanceProfile</a>)
  /// </li>
  /// </ul> <important>
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
    required String roleName,
  }) async {
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
  ///
  /// You cannot set the boundary for a service-linked role.
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
    required String roleName,
  }) async {
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String policyName,
    required String roleName,
  }) async {
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
    required String sAMLProviderArn,
  }) async {
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
  /// authenticating the associated IAM user to an CodeCommit repository. For
  /// more information about using SSH keys to authenticate to an CodeCommit
  /// repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up CodeCommit for SSH connections</a> in the <i>CodeCommit User Guide</i>.
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
    required String sSHPublicKeyId,
    required String userName,
  }) async {
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
  /// with server certificates</a> in the <i>IAM User Guide</i>. This topic also
  /// includes a list of Amazon Web Services services that can use the server
  /// certificates that you manage with IAM.
  /// <important>
  /// If you are using a server certificate with Elastic Load Balancing,
  /// deleting the certificate could have implications for your application. If
  /// Elastic Load Balancing doesn't detect the deletion of bound certificates,
  /// it may continue to use the certificates. This could cause Elastic Load
  /// Balancing to stop accepting traffic. We recommend that you remove the
  /// reference to the certificate from Elastic Load Balancing before using this
  /// command to delete the certificate. For more information, see <a
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
    required String serverCertificateName,
  }) async {
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
  /// fails, the <a>GetServiceLinkedRoleDeletionStatus</a> operation returns the
  /// reason for the failure, usually including the resources that must be
  /// deleted. To delete the service-linked role, you must first remove those
  /// resources from the linked service and then submit the deletion request
  /// again. Resources are specific to the service that is linked to the role.
  /// For more information about removing resources from a service, see the <a
  /// href="http://docs.aws.amazon.com/">Amazon Web Services documentation</a>
  /// for your service.
  ///
  /// For more information about service-linked roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html#iam-term-service-linked-role">Roles
  /// terms and concepts: Amazon Web Services service-linked role</a> in the
  /// <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the service-linked role to be deleted.
  Future<DeleteServiceLinkedRoleResponse> deleteServiceLinkedRole({
    required String roleName,
  }) async {
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
    required String serviceSpecificCredentialId,
    String? userName,
  }) async {
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
  /// based on the Amazon Web Services access key ID signing the request. This
  /// operation works for access keys under the Amazon Web Services account.
  /// Consequently, you can use this operation to manage Amazon Web Services
  /// account root user credentials even if the Amazon Web Services account has
  /// no associated IAM users.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
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
    required String certificateId,
    String? userName,
  }) async {
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

  /// Deletes the specified IAM user. Unlike the Amazon Web Services Management
  /// Console, when you delete a user programmatically, you must delete the
  /// items attached to the user manually, or the deletion fails. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_manage.html#id_users_deleting_cli">Deleting
  /// an IAM user</a>. Before attempting to delete a user, remove the following
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
    required String userName,
  }) async {
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
    required String userName,
  }) async {
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String policyName,
    required String userName,
  }) async {
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
  /// May throw [ConcurrentModificationException].
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
    required String serialNumber,
  }) async {
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
  /// inline policy, use <a>DeleteGroupPolicy</a>. For information about
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> detachGroupPolicy({
    required String groupName,
    required String policyArn,
  }) async {
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
  /// policy, use <a>DeleteRolePolicy</a>. For information about policies, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policyArn,
    required String roleName,
  }) async {
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
  /// policy, use <a>DeleteUserPolicy</a>. For information about policies, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policyArn,
    required String userName,
  }) async {
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
  /// May throw [ConcurrentModificationException].
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
    required String authenticationCode1,
    required String authenticationCode2,
    required String serialNumber,
    required String userName,
  }) async {
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

  /// Generates a credential report for the Amazon Web Services account. For
  /// more information about the credential report, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Getting
  /// credential reports</a> in the <i>IAM User Guide</i>.
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

  /// Generates a report for service last accessed data for Organizations. You
  /// can generate a report for any entities (organization root, organizational
  /// unit, or account) or policies in your organization.
  ///
  /// To call this operation, you must be signed in using your Organizations
  /// management account credentials. You can use your long-term IAM user or
  /// root user credentials, or temporary credentials from assuming an IAM role.
  /// SCPs must be enabled for your organization root. You must have the
  /// required IAM and Organizations permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Refining
  /// permissions using service last accessed data</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// You can generate a service last accessed data report for entities by
  /// specifying only the entity's path. This data includes a list of services
  /// that are allowed by any service control policies (SCPs) that apply to the
  /// entity.
  ///
  /// You can generate a service last accessed data report for a policy by
  /// specifying an entity's path and an optional Organizations policy ID. This
  /// data includes a list of services that are allowed by the specified SCP.
  ///
  /// For each service in both report types, the data includes the most recent
  /// account activity that the policy allows to account principals in the
  /// entity or the entity's children. For important information about the data,
  /// reporting period, permissions required, troubleshooting, and supported
  /// Regions see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing
  /// permissions using service last accessed data</a> in the <i>IAM User
  /// Guide</i>.
  /// <important>
  /// The data includes all attempts to access Amazon Web Services, not just the
  /// successful ones. This includes all attempts that were made using the
  /// Amazon Web Services Management Console, the Amazon Web Services API
  /// through any of the SDKs, or any of the command line tools. An unexpected
  /// entry in the service last accessed data does not mean that an account has
  /// been compromised, because the request might have been denied. Refer to
  /// your CloudTrail logs as the authoritative source for information about all
  /// API calls and whether they were successful or denied access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html">Logging
  /// IAM events with CloudTrail</a> in the <i>IAM User Guide</i>.
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
  /// entity path without specifying the optional Organizations policy ID. The
  /// type of entity that you specify determines the data returned in the
  /// report.
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> – When you specify the organizations root as the entity, the
  /// resulting report lists all of the services allowed by SCPs that are
  /// attached to your root. For each service, the report includes data for all
  /// accounts in your organization except the management account, because the
  /// management account is not limited by SCPs.
  /// </li>
  /// <li>
  /// <b>OU</b> – When you specify an organizational unit (OU) as the entity,
  /// the resulting report lists all of the services allowed by SCPs that are
  /// attached to the OU and its parents. For each service, the report includes
  /// data for all accounts in the OU or its children. This data excludes the
  /// management account, because the management account is not limited by SCPs.
  /// </li>
  /// <li>
  /// <b>management account</b> – When you specify the management account, the
  /// resulting report lists all Amazon Web Services services, because the
  /// management account is not limited by SCPs. For each service, the report
  /// includes data for only the management account.
  /// </li>
  /// <li>
  /// <b>Account</b> – When you specify another account as the entity, the
  /// resulting report lists all of the services allowed by SCPs that are
  /// attached to the account and its parents. For each service, the report
  /// includes data for only the specified account.
  /// </li>
  /// </ul>
  /// To generate a service last accessed data report for policies, specify an
  /// entity path and the optional Organizations policy ID. The type of entity
  /// that you specify determines the data returned for each service.
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> – When you specify the root entity and a policy ID, the
  /// resulting report lists all of the services that are allowed by the
  /// specified SCP. For each service, the report includes data for all accounts
  /// in your organization to which the SCP applies. This data excludes the
  /// management account, because the management account is not limited by SCPs.
  /// If the SCP is not attached to any entities in the organization, then the
  /// report will return a list of services with no data.
  /// </li>
  /// <li>
  /// <b>OU</b> – When you specify an OU entity and a policy ID, the resulting
  /// report lists all of the services that are allowed by the specified SCP.
  /// For each service, the report includes data for all accounts in the OU or
  /// its children to which the SCP applies. This means that other accounts
  /// outside the OU that are affected by the SCP might not be included in the
  /// data. This data excludes the management account, because the management
  /// account is not limited by SCPs. If the SCP is not attached to the OU or
  /// one of its children, the report will return a list of services with no
  /// data.
  /// </li>
  /// <li>
  /// <b>management account</b> – When you specify the management account, the
  /// resulting report lists all Amazon Web Services services, because the
  /// management account is not limited by SCPs. If you specify a policy ID in
  /// the CLI or API, the policy is ignored. For each service, the report
  /// includes data for only the management account.
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
  /// policies</a> in the <i>IAM User Guide</i>.
  /// </note>
  /// For more information about service last accessed data, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing
  /// policy scope by viewing user activity</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [ReportGenerationLimitExceededException].
  ///
  /// Parameter [entityPath] :
  /// The path of the Organizations entity (root, OU, or account). You can build
  /// an entity path using the known structure of your organization. For
  /// example, assume that your account ID is <code>123456789012</code> and its
  /// parent OU ID is <code>ou-rge0-awsabcde</code>. The organization root ID is
  /// <code>r-f6g7h8i9j0example</code> and your organization ID is
  /// <code>o-a1b2c3d4e5</code>. Your entity path is
  /// <code>o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-rge0-awsabcde/123456789012</code>.
  ///
  /// Parameter [organizationsPolicyId] :
  /// The identifier of the Organizations service control policy (SCP). This
  /// parameter is optional.
  ///
  /// This ID is used to generate information about when an account principal
  /// that is limited by the SCP attempted to access an Amazon Web Services
  /// service.
  Future<GenerateOrganizationsAccessReportResponse>
      generateOrganizationsAccessReport({
    required String entityPath,
    String? organizationsPolicyId,
  }) async {
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
  /// group, role, or policy) was last used in an attempt to access Amazon Web
  /// Services services. Recent activity usually appears within four hours. IAM
  /// reports activity for at least the last 400 days, or less if your Region
  /// began supporting this feature within the last year. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
  /// where data is tracked</a>. For more information about services and actions
  /// for which action last accessed information is displayed, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor-action-last-accessed.html">IAM
  /// action last accessed information services and actions</a>.
  /// <important>
  /// The service last accessed data includes all attempts to access an Amazon
  /// Web Services API, not just the successful ones. This includes all attempts
  /// that were made using the Amazon Web Services Management Console, the
  /// Amazon Web Services API through any of the SDKs, or any of the command
  /// line tools. An unexpected entry in the service last accessed data does not
  /// mean that your account has been compromised, because the request might
  /// have been denied. Refer to your CloudTrail logs as the authoritative
  /// source for information about all API calls and whether they were
  /// successful or denied access. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html">Logging
  /// IAM events with CloudTrail</a> in the <i>IAM User Guide</i>.
  /// </important>
  /// The <code>GenerateServiceLastAccessedDetails</code> operation returns a
  /// <code>JobId</code>. Use this parameter in the following operations to
  /// retrieve the following details from your report:
  ///
  /// <ul>
  /// <li>
  /// <a>GetServiceLastAccessedDetails</a> – Use this operation for users,
  /// groups, roles, or policies to list every Amazon Web Services service that
  /// the resource could access using permissions policies. For each service,
  /// the response includes information about the most recent access attempt.
  ///
  /// The <code>JobId</code> returned by
  /// <code>GenerateServiceLastAccessedDetail</code> must be used by the same
  /// role within a session, or by the same user when used to call
  /// <code>GetServiceLastAccessedDetail</code>.
  /// </li>
  /// <li>
  /// <a>GetServiceLastAccessedDetailsWithEntities</a> – Use this operation for
  /// groups and policies to list information about the associated entities
  /// (users or roles) that attempted to access a specific Amazon Web Services
  /// service.
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
  /// types include resource-based policies, access control lists, Organizations
  /// policies, IAM permissions boundaries, and STS assume role policies. It
  /// only applies permissions policy logic. For more about the evaluation of
  /// policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// policies</a> in the <i>IAM User Guide</i>.
  /// </note>
  /// For more information about service and action last accessed data, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Reducing
  /// permissions using service last accessed data</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [arn] :
  /// The ARN of the IAM resource (user, group, role, or managed policy) used to
  /// generate information about when the resource was last used in an attempt
  /// to access an Amazon Web Services service.
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
    required String arn,
    AccessAdvisorUsageGranularityType? granularity,
  }) async {
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
  /// The information includes the date and time of last use, along with the
  /// Amazon Web Services service and Region that were specified in the last
  /// request made with that key.
  ///
  /// Parameter [accessKeyId] :
  /// The identifier of an access key.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that can consist of any upper or lowercased letter or digit.
  Future<GetAccessKeyLastUsedResponse> getAccessKeyLastUsed({
    required String accessKeyId,
  }) async {
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
  /// your Amazon Web Services account, including their relationships to one
  /// another. Use this operation to obtain a snapshot of the configuration of
  /// IAM permissions (users, groups, roles, and policies) in your account.
  /// <note>
  /// Policies returned by this operation are URL-encoded compliant with <a
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
    List<EntityType>? filter,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    filter?.also(
        (arg) => $request['Filter'] = arg.map((e) => e.toValue()).toList());
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

  /// Retrieves the password policy for the Amazon Web Services account. This
  /// tells you the complexity requirements and mandatory rotation periods for
  /// the IAM user passwords in your account. For more information about using a
  /// password policy, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html">Managing
  /// an IAM password policy</a>.
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

  /// Retrieves information about IAM entity usage and IAM quotas in the Amazon
  /// Web Services account.
  ///
  /// For information about IAM quotas, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
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
  /// Context keys are variables maintained by Amazon Web Services and its
  /// services that provide details about the context of an API query request.
  /// Context keys can be evaluated by testing against a value specified in an
  /// IAM policy. Use <code>GetContextKeysForCustomPolicy</code> to understand
  /// what key names and values you must supply when you call
  /// <a>SimulateCustomPolicy</a>. Note that all parameters are shown in
  /// unencoded form here for clarity but must be URL encoded to be included as
  /// a part of a real HTML request.
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
    required List<String> policyInputList,
  }) async {
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
  /// <b>Note:</b> This operation discloses information about the permissions
  /// granted to other users. If you do not want users to see other user's
  /// permissions, then consider allowing them to use
  /// <a>GetContextKeysForCustomPolicy</a> instead.
  ///
  /// Context keys are variables maintained by Amazon Web Services and its
  /// services that provide details about the context of an API query request.
  /// Context keys can be evaluated by testing against a value in an IAM policy.
  /// Use <a>GetContextKeysForPrincipalPolicy</a> to understand what key names
  /// and values you must supply when you call <a>SimulatePrincipalPolicy</a>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policySourceArn,
    List<String>? policyInputList,
  }) async {
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

  /// Retrieves a credential report for the Amazon Web Services account. For
  /// more information about the credential report, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Getting
  /// credential reports</a> in the <i>IAM User Guide</i>.
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
    required String groupName,
    String? marker,
    int? maxItems,
  }) async {
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
  /// Policies returned by this operation are URL-encoded compliant with <a
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String groupName,
    required String policyName,
  }) async {
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
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html">Using
  /// instance profiles</a> in the <i>IAM User Guide</i>.
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
    required String instanceProfileName,
  }) async {
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

  /// Retrieves the user name for the specified IAM user. A login profile is
  /// created when you create a password for the user to access the Amazon Web
  /// Services Management Console. If the user does not exist or does not have a
  /// password, the operation returns a 404 (<code>NoSuchEntity</code>) error.
  ///
  /// If you create an IAM user with access to the console, the
  /// <code>CreateDate</code> reflects the date you created the initial password
  /// for the user.
  ///
  /// If you create an IAM user with programmatic access, and then later add a
  /// password for the user to access the Amazon Web Services Management
  /// Console, the <code>CreateDate</code> reflects the initial password
  /// creation date. A user with programmatic access does not have a login
  /// profile unless you create a password for the user to access the Amazon Web
  /// Services Management Console.
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
    required String userName,
  }) async {
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

  /// Retrieves information about an MFA device for a specified user.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serialNumber] :
  /// Serial number that uniquely identifies the MFA device. For this API, we
  /// only accept FIDO security key <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">ARNs</a>.
  ///
  /// Parameter [userName] :
  /// The friendly name identifying the user.
  Future<GetMFADeviceResponse> getMFADevice({
    required String serialNumber,
    String? userName,
  }) async {
    final $request = <String, dynamic>{};
    $request['SerialNumber'] = serialNumber;
    userName?.also((arg) => $request['UserName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetMFADeviceRequest'],
      shapes: shapes,
      resultWrapper: 'GetMFADeviceResult',
    );
    return GetMFADeviceResponse.fromXml($result);
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<GetOpenIDConnectProviderResponse> getOpenIDConnectProvider({
    required String openIDConnectProviderArn,
  }) async {
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

  /// Retrieves the service last accessed data report for Organizations that was
  /// previously generated using the <code>
  /// <a>GenerateOrganizationsAccessReport</a> </code> operation. This operation
  /// retrieves the status of your report job and the report contents.
  ///
  /// Depending on the parameters that you passed when you generated the report,
  /// the data returned could include different information. For details, see
  /// <a>GenerateOrganizationsAccessReport</a>.
  ///
  /// To call this operation, you must be signed in to the management account in
  /// your organization. SCPs must be enabled for your organization root. You
  /// must have permissions to perform this operation. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html">Refining
  /// permissions using service last accessed data</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// For each service that principals in an account (root user, IAM users, or
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
    required String jobId,
    String? marker,
    int? maxItems,
    SortKeyType? sortKey,
  }) async {
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
  /// specific users, groups, and roles that the policy is attached to, use
  /// <a>ListEntitiesForPolicy</a>. This operation returns metadata about the
  /// policy. To retrieve the actual policy document for a specific version of
  /// the policy, use <a>GetPolicyVersion</a>.
  ///
  /// This operation retrieves information about managed policies. To retrieve
  /// information about an inline policy that is embedded with an IAM user,
  /// group, or role, use <a>GetUserPolicy</a>, <a>GetGroupPolicy</a>, or
  /// <a>GetRolePolicy</a>.
  ///
  /// For more information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<GetPolicyResponse> getPolicy({
    required String policyArn,
  }) async {
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
  /// Policies returned by this operation are URL-encoded compliant with <a
  /// href="https://tools.ietf.org/html/rfc3986">RFC 3986</a>. You can use a URL
  /// decoding method to convert the policy back to plain JSON text. For
  /// example, if you use Java, you can use the <code>decode</code> method of
  /// the <code>java.net.URLDecoder</code> utility class in the Java SDK. Other
  /// languages and SDKs provide similar functionality.
  /// </note>
  /// To list the available versions for a policy, use
  /// <a>ListPolicyVersions</a>.
  ///
  /// This operation retrieves information about managed policies. To retrieve
  /// information about an inline policy that is embedded in a user, group, or
  /// role, use <a>GetUserPolicy</a>, <a>GetGroupPolicy</a>, or
  /// <a>GetRolePolicy</a>.
  ///
  /// For more information about the types of policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for managed policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policyArn,
    required String versionId,
  }) async {
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
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Policies returned by this operation are URL-encoded compliant with <a
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
    required String roleName,
  }) async {
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
  /// Policies returned by this operation are URL-encoded compliant with <a
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>IAM User Guide</i>.
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
    required String policyName,
    required String roleName,
  }) async {
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<GetSAMLProviderResponse> getSAMLProvider({
    required String sAMLProviderArn,
  }) async {
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
  /// authenticating the associated IAM user to an CodeCommit repository. For
  /// more information about using SSH keys to authenticate to an CodeCommit
  /// repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up CodeCommit for SSH connections</a> in the <i>CodeCommit User Guide</i>.
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
    required EncodingType encoding,
    required String sSHPublicKeyId,
    required String userName,
  }) async {
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
  /// with server certificates</a> in the <i>IAM User Guide</i>. This topic
  /// includes a list of Amazon Web Services services that can use the server
  /// certificates that you manage with IAM.
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
    required String serverCertificateName,
  }) async {
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
  /// you can retrieve the generated report. The report includes a list of
  /// Amazon Web Services services that the resource (user, group, role, or
  /// managed policy) can access.
  /// <note>
  /// Service last accessed data does not use other policy types when
  /// determining whether a resource could access a service. These other policy
  /// types include resource-based policies, access control lists, Organizations
  /// policies, IAM permissions boundaries, and STS assume role policies. It
  /// only applies permissions policy logic. For more about the evaluation of
  /// policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// policies</a> in the <i>IAM User Guide</i>.
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
  /// permissions using service last accessed data</a> in the <i>IAM User
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
    required String jobId,
    String? marker,
    int? maxItems,
  }) async {
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
  /// The service namespace for an Amazon Web Services service. Provide the
  /// service namespace to learn when the IAM entity last attempted to access
  /// the specified service.
  ///
  /// To learn the service namespace for a service, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Actions,
  /// resources, and condition keys for Amazon Web Services services</a> in the
  /// <i>IAM User Guide</i>. Choose the name of the service to view details for
  /// that service. In the first paragraph, find the service prefix. For
  /// example, <code>(service prefix: a4b)</code>. For more information about
  /// service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">Amazon
  /// Web Services service namespaces</a> in the <i>Amazon Web Services General
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
  Future<GetServiceLastAccessedDetailsWithEntitiesResponse>
      getServiceLastAccessedDetailsWithEntities({
    required String jobId,
    required String serviceNamespace,
    String? marker,
    int? maxItems,
  }) async {
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
  /// <a>DeleteServiceLinkedRole</a> to submit a service-linked role for
  /// deletion, you can use the <code>DeletionTaskId</code> parameter in
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
    required String deletionTaskId,
  }) async {
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
  /// based on the Amazon Web Services access key ID used to sign the request to
  /// this operation.
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
    String? userName,
  }) async {
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
  /// Policies returned by this operation are URL-encoded compliant with <a
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String policyName,
    required String userName,
  }) async {
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
  /// If the <code>UserName</code> is not specified, the user name is determined
  /// implicitly based on the Amazon Web Services access key ID used to sign the
  /// request. If a temporary access key is used, then <code>UserName</code> is
  /// required. If a long-term key is assigned to the user, then
  /// <code>UserName</code> is not required.
  ///
  /// This operation works for access keys under the Amazon Web Services
  /// account. If the Amazon Web Services account has no associated users, the
  /// root user returns it's own access key IDs by running this command.
  /// <note>
  /// To ensure the security of your Amazon Web Services account, the secret
  /// access key is accessible only during key and user creation.
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
    String? marker,
    int? maxItems,
    String? userName,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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

  /// Lists the account alias associated with the Amazon Web Services account
  /// (Note: you can have only one). For information about using an Amazon Web
  /// Services account alias, see <a
  /// href="https://docs.aws.amazon.com/signin/latest/userguide/CreateAccountAlias.html">Creating,
  /// deleting, and listing an Amazon Web Services account alias</a> in the
  /// <i>Amazon Web Services Sign-In User Guide</i>.
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
    String? marker,
    int? maxItems,
  }) async {
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
  /// inline policies for a group, use <a>ListGroupPolicies</a>. For information
  /// about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String groupName,
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
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
  /// inline policies for a role, use <a>ListRolePolicies</a>. For information
  /// about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String roleName,
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
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
  /// inline policies for a user, use <a>ListUserPolicies</a>. For information
  /// about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String userName,
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policyArn,
    EntityType? entityFilter,
    String? marker,
    int? maxItems,
    String? pathPrefix,
    PolicyUsageType? policyUsageFilter,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String groupName,
    String? marker,
    int? maxItems,
  }) async {
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
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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
    required String userName,
    String? marker,
    int? maxItems,
  }) async {
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

  /// Lists the tags that are attached to the specified IAM instance profile.
  /// The returned list of tags is sorted by tag key. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the IAM instance profile whose tags you want to see.
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
  Future<ListInstanceProfileTagsResponse> listInstanceProfileTags({
    required String instanceProfileName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListInstanceProfileTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListInstanceProfileTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListInstanceProfileTagsResult',
    );
    return ListInstanceProfileTagsResponse.fromXml($result);
  }

  /// Lists the instance profiles that have the specified path prefix. If there
  /// are none, the operation returns an empty list. For more information about
  /// instance profiles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html">Using
  /// instance profiles</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. For example, this operation does not return
  /// tags, even though they are an attribute of the returned object. To view
  /// all of the information for an instance profile, see
  /// <a>GetInstanceProfile</a>.
  /// </note>
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
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html">Using
  /// instance profiles</a> in the <i>IAM User Guide</i>.
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
    required String roleName,
    String? marker,
    int? maxItems,
  }) async {
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

  /// Lists the tags that are attached to the specified IAM virtual multi-factor
  /// authentication (MFA) device. The returned list of tags is sorted by tag
  /// key. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serialNumber] :
  /// The unique identifier for the IAM virtual MFA device whose tags you want
  /// to see. For virtual MFA devices, the serial number is the same as the ARN.
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
  Future<ListMFADeviceTagsResponse> listMFADeviceTags({
    required String serialNumber,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['SerialNumber'] = serialNumber;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListMFADeviceTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListMFADeviceTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListMFADeviceTagsResult',
    );
    return ListMFADeviceTagsResponse.fromXml($result);
  }

  /// Lists the MFA devices for an IAM user. If the request includes a IAM user
  /// name, then this operation lists all the MFA devices associated with the
  /// specified user. If you do not specify a user name, IAM determines the user
  /// name implicitly based on the Amazon Web Services access key ID signing the
  /// request for this operation.
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
    String? marker,
    int? maxItems,
    String? userName,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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

  /// Lists the tags that are attached to the specified OpenID Connect
  /// (OIDC)-compatible identity provider. The returned list of tags is sorted
  /// by tag key. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About
  /// web identity federation</a>.
  ///
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The ARN of the OpenID Connect (OIDC) identity provider whose tags you want
  /// to see.
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
  Future<ListOpenIDConnectProviderTagsResponse> listOpenIDConnectProviderTags({
    required String openIDConnectProviderArn,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListOpenIDConnectProviderTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListOpenIDConnectProviderTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListOpenIDConnectProviderTagsResult',
    );
    return ListOpenIDConnectProviderTagsResponse.fromXml($result);
  }

  /// Lists information about the IAM OpenID Connect (OIDC) provider resource
  /// objects defined in the Amazon Web Services account.
  /// <note>
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. For example, this operation does not return
  /// tags, even though they are an attribute of the returned object. To view
  /// all of the information for an OIDC provider, see
  /// <a>GetOpenIDConnectProvider</a>.
  /// </note>
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

  /// Lists all the managed policies that are available in your Amazon Web
  /// Services account, including your own customer-defined managed policies and
  /// all Amazon Web Services managed policies.
  ///
  /// You can filter the list of policies that is returned using the optional
  /// <code>OnlyAttached</code>, <code>Scope</code>, and <code>PathPrefix</code>
  /// parameters. For example, to list only the customer managed policies in
  /// your Amazon Web Services account, set <code>Scope</code> to
  /// <code>Local</code>. To list only Amazon Web Services managed policies, set
  /// <code>Scope</code> to <code>AWS</code>.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// For more information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. For example, this operation does not return
  /// tags, even though they are an attribute of the returned object. To view
  /// all of the information for a customer manged policy, see <a>GetPolicy</a>.
  /// </note>
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
  /// To list only Amazon Web Services managed policies, set <code>Scope</code>
  /// to <code>AWS</code>. To list only the customer managed policies in your
  /// Amazon Web Services account, set <code>Scope</code> to <code>Local</code>.
  ///
  /// This parameter is optional. If it is not included, or if it is set to
  /// <code>All</code>, all policies are returned.
  Future<ListPoliciesResponse> listPolicies({
    String? marker,
    int? maxItems,
    bool? onlyAttached,
    String? pathPrefix,
    PolicyUsageType? policyUsageFilter,
    PolicyScopeType? scope,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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
  /// resource-based policies, access control lists, Organizations policies, IAM
  /// permissions boundaries, and STS assume role policies. It only applies
  /// permissions policy logic. For more about the evaluation of policy types,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// policies</a> in the <i>IAM User Guide</i>.
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// The service namespace for the Amazon Web Services services whose policies
  /// you want to list.
  ///
  /// To learn the service namespace for a service, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Actions,
  /// resources, and condition keys for Amazon Web Services services</a> in the
  /// <i>IAM User Guide</i>. Choose the name of the service to view details for
  /// that service. In the first paragraph, find the service prefix. For
  /// example, <code>(service prefix: a4b)</code>. For more information about
  /// service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">Amazon
  /// Web Services service namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [marker] :
  /// Use this parameter only when paginating results and only after you receive
  /// a response indicating that the results are truncated. Set it to the value
  /// of the <code>Marker</code> element in the response that you received to
  /// indicate where the next call should start.
  Future<ListPoliciesGrantingServiceAccessResponse>
      listPoliciesGrantingServiceAccess({
    required String arn,
    required List<String> serviceNamespaces,
    String? marker,
  }) async {
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

  /// Lists the tags that are attached to the specified IAM customer managed
  /// policy. The returned list of tags is sorted by tag key. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [policyArn] :
  /// The ARN of the IAM customer managed policy whose tags you want to see.
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
  Future<ListPolicyTagsResponse> listPolicyTags({
    required String policyArn,
    String? marker,
    int? maxItems,
  }) async {
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
      action: 'ListPolicyTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListPolicyTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListPolicyTagsResult',
    );
    return ListPolicyTagsResponse.fromXml($result);
  }

  /// Lists information about the versions of the specified managed policy,
  /// including the version that is currently set as the policy's default
  /// version.
  ///
  /// For more information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
    required String policyArn,
    String? marker,
    int? maxItems,
  }) async {
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String roleName,
    String? marker,
    int? maxItems,
  }) async {
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
  /// IAM resources</a> in the <i>IAM User Guide</i>.
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
  Future<ListRoleTagsResponse> listRoleTags({
    required String roleName,
    String? marker,
    int? maxItems,
  }) async {
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
  /// roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. This operation does not return the following
  /// attributes, even though they are an attribute of the returned object:
  ///
  /// <ul>
  /// <li>
  /// PermissionsBoundary
  /// </li>
  /// <li>
  /// RoleLastUsed
  /// </li>
  /// <li>
  /// Tags
  /// </li>
  /// </ul>
  /// To view all of the information for a role, see <a>GetRole</a>.
  /// </note>
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
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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

  /// Lists the tags that are attached to the specified Security Assertion
  /// Markup Language (SAML) identity provider. The returned list of tags is
  /// sorted by tag key. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About
  /// SAML 2.0-based federation</a>.
  ///
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [sAMLProviderArn] :
  /// The ARN of the Security Assertion Markup Language (SAML) identity provider
  /// whose tags you want to see.
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
  Future<ListSAMLProviderTagsResponse> listSAMLProviderTags({
    required String sAMLProviderArn,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['SAMLProviderArn'] = sAMLProviderArn;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListSAMLProviderTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListSAMLProviderTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListSAMLProviderTagsResult',
    );
    return ListSAMLProviderTagsResponse.fromXml($result);
  }

  /// Lists the SAML provider resource objects defined in IAM in the account.
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. For example, this operation does not return
  /// tags, even though they are an attribute of the returned object. To view
  /// all of the information for a SAML provider, see <a>GetSAMLProvider</a>.
  /// <important>
  /// This operation requires <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  /// </important>
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
  /// authenticating the IAM user to an CodeCommit repository. For more
  /// information about using SSH keys to authenticate to an CodeCommit
  /// repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up CodeCommit for SSH connections</a> in the <i>CodeCommit User Guide</i>.
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
  /// on the Amazon Web Services access key used to sign the request.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<ListSSHPublicKeysResponse> listSSHPublicKeys({
    String? marker,
    int? maxItems,
    String? userName,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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

  /// Lists the tags that are attached to the specified IAM server certificate.
  /// The returned list of tags is sorted by tag key. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// For certificates in a Region supported by Certificate Manager (ACM), we
  /// recommend that you don't use IAM server certificates. Instead, use ACM to
  /// provision, manage, and deploy your server certificates. For more
  /// information about IAM server certificates, <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with server certificates</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serverCertificateName] :
  /// The name of the IAM server certificate whose tags you want to see.
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
  Future<ListServerCertificateTagsResponse> listServerCertificateTags({
    required String serverCertificateName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final $request = <String, dynamic>{};
    $request['ServerCertificateName'] = serverCertificateName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxItems?.also((arg) => $request['MaxItems'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ListServerCertificateTags',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListServerCertificateTagsRequest'],
      shapes: shapes,
      resultWrapper: 'ListServerCertificateTagsResult',
    );
    return ListServerCertificateTagsResponse.fromXml($result);
  }

  /// Lists the server certificates stored in IAM that have the specified path
  /// prefix. If none exist, the operation returns an empty list.
  ///
  /// You can paginate the results using the <code>MaxItems</code> and
  /// <code>Marker</code> parameters.
  ///
  /// For more information about working with server certificates, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with server certificates</a> in the <i>IAM User Guide</i>. This topic also
  /// includes a list of Amazon Web Services services that can use the server
  /// certificates that you manage with IAM.
  /// <note>
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. For example, this operation does not return
  /// tags, even though they are an attribute of the returned object. To view
  /// all of the information for a servercertificate, see
  /// <a>GetServerCertificate</a>.
  /// </note>
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
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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
  /// Amazon Web Services service, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html">Set
  /// up service-specific credentials</a> in the CodeCommit User Guide.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceNotSupportedException].
  ///
  /// Parameter [serviceName] :
  /// Filters the returned results to only those for the specified Amazon Web
  /// Services service. If not specified, then Amazon Web Services returns
  /// service-specific credentials for all services.
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
    String? serviceName,
    String? userName,
  }) async {
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
  /// determined implicitly based on the Amazon Web Services access key ID used
  /// to sign the request for this operation. This operation works for access
  /// keys under the Amazon Web Services account. Consequently, you can use this
  /// operation to manage Amazon Web Services account root user credentials even
  /// if the Amazon Web Services account has no associated users.
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
    String? marker,
    int? maxItems,
    String? userName,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
    required String userName,
    String? marker,
    int? maxItems,
  }) async {
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

  /// Lists the tags that are attached to the specified IAM user. The returned
  /// list of tags is sorted by tag key. For more information about tagging, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [userName] :
  /// The name of the IAM user whose tags you want to see.
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
  Future<ListUserTagsResponse> listUserTags({
    required String userName,
    String? marker,
    int? maxItems,
  }) async {
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
  /// is specified, the operation returns all users in the Amazon Web Services
  /// account. If there are none, the operation returns an empty list.
  /// <note>
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. This operation does not return the following
  /// attributes, even though they are an attribute of the returned object:
  ///
  /// <ul>
  /// <li>
  /// PermissionsBoundary
  /// </li>
  /// <li>
  /// Tags
  /// </li>
  /// </ul>
  /// To view all of the information for a user, see <a>GetUser</a>.
  /// </note>
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
    String? marker,
    int? maxItems,
    String? pathPrefix,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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

  /// Lists the virtual MFA devices defined in the Amazon Web Services account
  /// by assignment status. If you do not specify an assignment status, the
  /// operation returns a list of all virtual MFA devices. Assignment status can
  /// be <code>Assigned</code>, <code>Unassigned</code>, or <code>Any</code>.
  /// <note>
  /// IAM resource-listing operations return a subset of the available
  /// attributes for the resource. For example, this operation does not return
  /// tags, even though they are an attribute of the returned object. To view
  /// tag information for a virtual MFA device, see <a>ListMFADeviceTags</a>.
  /// </note>
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
    AssignmentStatusType? assignmentStatus,
    String? marker,
    int? maxItems,
  }) async {
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
  /// policy to a group, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachGroupPolicy.html">
  /// <code>AttachGroupPolicy</code> </a>. To create a new managed policy, use
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html">
  /// <code>CreatePolicy</code> </a>. For information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For information about the maximum number of inline policies that you can
  /// embed in a group, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling <code>PutGroupPolicy</code>. For general information about
  /// using the Query API with IAM, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// query requests</a> in the <i>IAM User Guide</i>.
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
  /// You must provide policies in JSON format in IAM. However, for
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. CloudFormation always converts a YAML policy to JSON
  /// format before submitting it to IAM.
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
    required String groupName,
    required String policyDocument,
    required String policyName,
  }) async {
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
  /// boundary. You can use an Amazon Web Services managed policy or a customer
  /// managed policy to set the boundary for a role. Use the boundary to control
  /// the maximum permissions that the role can have. Setting a permissions
  /// boundary is an advanced feature that can affect the permissions for the
  /// role.
  ///
  /// You cannot set the boundary for a service-linked role.
  /// <important>
  /// Policies used as permissions boundaries do not provide permissions. You
  /// must also attach a permissions policy to the role. To learn how the
  /// effective permissions for a role are evaluated, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html">IAM
  /// JSON policy evaluation logic</a> in the IAM User Guide.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [UnmodifiableEntityException].
  /// May throw [PolicyNotAttachableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [permissionsBoundary] :
  /// The ARN of the managed policy that is used to set the permissions boundary
  /// for the role.
  ///
  /// A permissions boundary policy defines the maximum permissions that
  /// identity-based policies can grant to an entity, but does not grant
  /// permissions. Permissions boundaries do not define the maximum permissions
  /// that a resource-based policy can grant to an entity. To learn more, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM entities</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types">Policy
  /// types </a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [roleName] :
  /// The name (friendly name, not ARN) of the IAM role for which you want to
  /// set the permissions boundary.
  Future<void> putRolePermissionsBoundary({
    required String permissionsBoundary,
    required String roleName,
  }) async {
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
  /// created at the same time as the role, using <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">
  /// <code>CreateRole</code> </a>. You can update a role's trust policy using
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_UpdateAssumeRolePolicy.html">
  /// <code>UpdateAssumeRolePolicy</code> </a>. For more information about
  /// roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">IAM
  /// roles</a> in the <i>IAM User Guide</i>.
  ///
  /// A role can also have a managed policy attached to it. To attach a managed
  /// policy to a role, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachRolePolicy.html">
  /// <code>AttachRolePolicy</code> </a>. To create a new managed policy, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html">
  /// <code>CreatePolicy</code> </a>. For information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For information about the maximum number of inline policies that you can
  /// embed with a role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling <code>PutRolePolicy</code>. For general information about
  /// using the Query API with IAM, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// query requests</a> in the <i>IAM User Guide</i>.
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
  /// You must provide policies in JSON format in IAM. However, for
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. CloudFormation always converts a YAML policy to JSON
  /// format before submitting it to IAM.
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
    required String policyDocument,
    required String policyName,
    required String roleName,
  }) async {
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
  /// boundary. You can use an Amazon Web Services managed policy or a customer
  /// managed policy to set the boundary for a user. Use the boundary to control
  /// the maximum permissions that the user can have. Setting a permissions
  /// boundary is an advanced feature that can affect the permissions for the
  /// user.
  /// <important>
  /// Policies that are used as permissions boundaries do not provide
  /// permissions. You must also attach a permissions policy to the user. To
  /// learn how the effective permissions for a user are evaluated, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html">IAM
  /// JSON policy evaluation logic</a> in the IAM User Guide.
  /// </important>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotAttachableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [permissionsBoundary] :
  /// The ARN of the managed policy that is used to set the permissions boundary
  /// for the user.
  ///
  /// A permissions boundary policy defines the maximum permissions that
  /// identity-based policies can grant to an entity, but does not grant
  /// permissions. Permissions boundaries do not define the maximum permissions
  /// that a resource-based policy can grant to an entity. To learn more, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM entities</a> in the <i>IAM User Guide</i>.
  ///
  /// For more information about policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policy-types">Policy
  /// types </a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [userName] :
  /// The name (friendly name, not ARN) of the IAM user for which you want to
  /// set the permissions boundary.
  Future<void> putUserPermissionsBoundary({
    required String permissionsBoundary,
    required String userName,
  }) async {
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
  /// managed policy to a user, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_AttachUserPolicy.html">
  /// <code>AttachUserPolicy</code> </a>. To create a new managed policy, use <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html">
  /// <code>CreatePolicy</code> </a>. For information about policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  ///
  /// For information about the maximum number of inline policies that you can
  /// embed in a user, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because policy documents can be large, you should use POST rather than GET
  /// when calling <code>PutUserPolicy</code>. For general information about
  /// using the Query API with IAM, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// query requests</a> in the <i>IAM User Guide</i>.
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
  /// You must provide policies in JSON format in IAM. However, for
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. CloudFormation always converts a YAML policy to JSON
  /// format before submitting it to IAM.
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
    required String policyDocument,
    required String policyName,
    required String userName,
  }) async {
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> removeClientIDFromOpenIDConnectProvider({
    required String clientID,
    required String openIDConnectProviderArn,
  }) async {
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

  /// Removes the specified IAM role from the specified Amazon EC2 instance
  /// profile.
  /// <important>
  /// Make sure that you do not have any Amazon EC2 instances running with the
  /// role you are about to remove from the instance profile. Removing a role
  /// from an instance profile that is associated with a running instance might
  /// break any applications running on the instance.
  /// </important>
  /// For more information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// roles</a> in the <i>IAM User Guide</i>. For more information about
  /// instance profiles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html">Using
  /// instance profiles</a> in the <i>IAM User Guide</i>.
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
    required String instanceProfileName,
    required String roleName,
  }) async {
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
    required String groupName,
    required String userName,
  }) async {
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
  /// Amazon Web Services generated and cryptographically strong. It cannot be
  /// configured by the user. Resetting the password immediately invalidates the
  /// previous password associated with this user.
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
    required String serviceSpecificCredentialId,
    String? userName,
  }) async {
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
  /// Amazon Web Services servers.
  ///
  /// For more information about creating and working with virtual MFA devices,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_VirtualMFA.html">Using
  /// a virtual MFA device</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [InvalidAuthenticationCodeException].
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ConcurrentModificationException].
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
    required String authenticationCode1,
    required String authenticationCode2,
    required String serialNumber,
    required String userName,
  }) async {
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
  /// attached to, use <a>ListEntitiesForPolicy</a>.
  ///
  /// For information about managed policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [versionId] :
  /// The version of the policy to set as the default (operative) version.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for managed policies</a> in the <i>IAM User Guide</i>.
  Future<void> setDefaultPolicyVersion({
    required String policyArn,
    required String versionId,
  }) async {
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
  /// version used for the Amazon Web Services account.
  ///
  /// By default, Security Token Service (STS) is available as a global service,
  /// and all STS requests go to a single endpoint at
  /// <code>https://sts.amazonaws.com</code>. Amazon Web Services recommends
  /// using Regional STS endpoints to reduce latency, build in redundancy, and
  /// increase session token availability. For information about Regional
  /// endpoints for STS, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/sts.html">Security
  /// Token Service endpoints and quotas</a> in the <i>Amazon Web Services
  /// General Reference</i>.
  ///
  /// If you make an STS call to the global endpoint, the resulting session
  /// tokens might be valid in some Regions but not others. It depends on the
  /// version that is set in this operation. Version 1 tokens are valid only in
  /// Amazon Web Services Regions that are available by default. These tokens do
  /// not work in manually enabled Regions, such as Asia Pacific (Hong Kong).
  /// Version 2 tokens are valid in all Regions. However, version 2 tokens are
  /// longer and might affect systems where you temporarily store tokens. For
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating STS in an Amazon Web Services Region</a> in the <i>IAM
  /// User Guide</i>.
  ///
  /// To view the current session token version, see the
  /// <code>GlobalEndpointTokenVersion</code> entry in the response of the
  /// <a>GetAccountSummary</a> operation.
  ///
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [globalEndpointTokenVersion] :
  /// The version of the global endpoint token. Version 1 tokens are valid only
  /// in Amazon Web Services Regions that are available by default. These tokens
  /// do not work in manually enabled Regions, such as Asia Pacific (Hong Kong).
  /// Version 2 tokens are valid in all Regions. However, version 2 tokens are
  /// longer and might affect systems where you temporarily store tokens.
  ///
  /// For information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and deactivating STS in an Amazon Web Services Region</a> in the <i>IAM
  /// User Guide</i>.
  Future<void> setSecurityTokenServicePreferences({
    required GlobalEndpointTokenVersion globalEndpointTokenVersion,
  }) async {
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
  /// works with a list of API operations and Amazon Web Services resources to
  /// determine the policies' effective permissions. The policies are provided
  /// as strings.
  ///
  /// The simulation does not perform the API operations; it only checks the
  /// authorization to determine if the simulated policies allow or deny the
  /// operations. You can simulate resources that don't exist in your account.
  ///
  /// If you want to simulate existing policies that are attached to an IAM
  /// user, group, or role, use <a>SimulatePrincipalPolicy</a> instead.
  ///
  /// Context keys are variables that are maintained by Amazon Web Services and
  /// its services and which provide details about the context of an API query
  /// request. You can use the <code>Condition</code> element of an IAM policy
  /// to evaluate context keys. To get the list of context keys that the
  /// policies require for correct simulation, use
  /// <a>GetContextKeysForCustomPolicy</a>.
  ///
  /// If the output is long, you can use <code>MaxItems</code> and
  /// <code>Marker</code> parameters to paginate the results.
  /// <note>
  /// The IAM policy simulator evaluates statements in the identity-based policy
  /// and the inputs that you provide during simulation. The policy simulator
  /// results can differ from your live Amazon Web Services environment. We
  /// recommend that you check your policies against your live Amazon Web
  /// Services environment after testing using the policy simulator to confirm
  /// that you have the desired results. For more information about using the
  /// policy simulator, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html">Testing
  /// IAM policies with the IAM policy simulator </a>in the <i>IAM User
  /// Guide</i>.
  /// </note>
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
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
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
  /// boundaries for IAM entities</a> in the <i>IAM User Guide</i>. The policy
  /// input is specified as a string that contains the complete, valid JSON text
  /// of a permissions boundary policy.
  ///
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
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
  /// A list of ARNs of Amazon Web Services resources to include in the
  /// simulation. If this parameter is not provided, then the value defaults to
  /// <code>*</code> (all resources). Each API in the <code>ActionNames</code>
  /// parameter is evaluated for each resource in this list. The simulation
  /// determines the access result (allowed or denied) of each combination and
  /// reports it in the response. You can simulate resources that don't exist in
  /// your account.
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  /// <note>
  /// Simulation of resource-based policies isn't supported for IAM roles.
  /// </note>
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
  /// Each of the Amazon EC2 scenarios requires that you specify instance,
  /// image, and security group resources. If your scenario includes an EBS
  /// volume, then you must specify that volume as a resource. If the Amazon EC2
  /// scenario includes VPC, then you must supply the network interface
  /// resource. If it includes an IP subnet, then you must specify the subnet
  /// resource. For more information on the Amazon EC2 scenario options, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// platforms</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// <ul>
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
  /// An ARN representing the Amazon Web Services account ID that specifies the
  /// owner of any simulated resource that does not identify its owner in the
  /// resource ARN. Examples of resource ARNs include an S3 bucket or object. If
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
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
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
  /// </ul> <note>
  /// Simulation of resource-based policies isn't supported for IAM roles.
  /// </note>
  Future<SimulatePolicyResponse> simulateCustomPolicy({
    required List<String> actionNames,
    required List<String> policyInputList,
    String? callerArn,
    List<ContextEntry>? contextEntries,
    String? marker,
    int? maxItems,
    List<String>? permissionsBoundaryPolicyInputList,
    List<String>? resourceArns,
    String? resourceHandlingOption,
    String? resourceOwner,
    String? resourcePolicy,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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
  /// list of API operations and Amazon Web Services resources to determine the
  /// policies' effective permissions. The entity can be an IAM user, group, or
  /// role. If you specify a user, then the simulation also includes all of the
  /// policies that are attached to groups that the user belongs to. You can
  /// simulate resources that don't exist in your account.
  ///
  /// You can optionally include a list of one or more additional policies
  /// specified as strings to include in the simulation. If you want to simulate
  /// only policies specified as strings, use <a>SimulateCustomPolicy</a>
  /// instead.
  ///
  /// You can also optionally include one resource-based policy to be evaluated
  /// with each of the resources included in the simulation for IAM users only.
  ///
  /// The simulation does not perform the API operations; it only checks the
  /// authorization to determine if the simulated policies allow or deny the
  /// operations.
  ///
  /// <b>Note:</b> This operation discloses information about the permissions
  /// granted to other users. If you do not want users to see other user's
  /// permissions, then consider allowing them to use
  /// <a>SimulateCustomPolicy</a> instead.
  ///
  /// Context keys are variables maintained by Amazon Web Services and its
  /// services that provide details about the context of an API query request.
  /// You can use the <code>Condition</code> element of an IAM policy to
  /// evaluate context keys. To get the list of context keys that the policies
  /// require for correct simulation, use
  /// <a>GetContextKeysForPrincipalPolicy</a>.
  ///
  /// If the output is long, you can use the <code>MaxItems</code> and
  /// <code>Marker</code> parameters to paginate the results.
  /// <note>
  /// The IAM policy simulator evaluates statements in the identity-based policy
  /// and the inputs that you provide during simulation. The policy simulator
  /// results can differ from your live Amazon Web Services environment. We
  /// recommend that you check your policies against your live Amazon Web
  /// Services environment after testing using the policy simulator to confirm
  /// that you have the desired results. For more information about using the
  /// policy simulator, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html">Testing
  /// IAM policies with the IAM policy simulator </a>in the <i>IAM User
  /// Guide</i>.
  /// </note>
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
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
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
  /// boundaries for IAM entities</a> in the <i>IAM User Guide</i>. The policy
  /// input is specified as a string containing the complete, valid JSON text of
  /// a permissions boundary policy.
  ///
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
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
  /// A list of ARNs of Amazon Web Services resources to include in the
  /// simulation. If this parameter is not provided, then the value defaults to
  /// <code>*</code> (all resources). Each API in the <code>ActionNames</code>
  /// parameter is evaluated for each resource in this list. The simulation
  /// determines the access result (allowed or denied) of each combination and
  /// reports it in the response. You can simulate resources that don't exist in
  /// your account.
  ///
  /// The simulation does not automatically retrieve policies for the specified
  /// resources. If you want to include a resource policy in the simulation,
  /// then you must include the policy as a string in the
  /// <code>ResourcePolicy</code> parameter.
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  /// <note>
  /// Simulation of resource-based policies isn't supported for IAM roles.
  /// </note>
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
  /// Each of the Amazon EC2 scenarios requires that you specify instance,
  /// image, and security group resources. If your scenario includes an EBS
  /// volume, then you must specify that volume as a resource. If the Amazon EC2
  /// scenario includes VPC, then you must supply the network interface
  /// resource. If it includes an IP subnet, then you must specify the subnet
  /// resource. For more information on the Amazon EC2 scenario options, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-platforms.html">Supported
  /// platforms</a> in the <i>Amazon EC2 User Guide</i>.
  ///
  /// <ul>
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
  /// An Amazon Web Services account ID that specifies the owner of any
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
  /// Parameter [resourcePolicy] :
  /// A resource-based policy to include in the simulation provided as a string.
  /// Each resource in the simulation is treated as if it had this policy
  /// attached. You can include only one resource-based policy in a simulation.
  ///
  /// The maximum length of the policy document that you can pass in this
  /// operation, including whitespace, is listed below. To view the maximum
  /// character counts of a managed policy with no whitespaces, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html#reference_iam-quotas-entity-length">IAM
  /// and STS character quotas</a>.
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
  /// </ul> <note>
  /// Simulation of resource-based policies isn't supported for IAM roles.
  /// </note>
  Future<SimulatePolicyResponse> simulatePrincipalPolicy({
    required List<String> actionNames,
    required String policySourceArn,
    String? callerArn,
    List<ContextEntry>? contextEntries,
    String? marker,
    int? maxItems,
    List<String>? permissionsBoundaryPolicyInputList,
    List<String>? policyInputList,
    List<String>? resourceArns,
    String? resourceHandlingOption,
    String? resourceOwner,
    String? resourcePolicy,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
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

  /// Adds one or more tags to an IAM instance profile. If a tag with the same
  /// key name already exists, then that tag is overwritten with the new value.
  ///
  /// Each tag consists of a key name and an associated value. By assigning tags
  /// to your resources, you can do the following:
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
  /// <b>Access control</b> - Include tags in IAM user-based and resource-based
  /// policies. You can use tags to restrict access to only an IAM instance
  /// profile that has a specified tag attached. For examples of policies that
  /// show how to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the IAM instance profile to which you want to add tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the IAM instance profile. Each
  /// tag consists of a key name and an associated value.
  Future<void> tagInstanceProfile({
    required String instanceProfileName,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagInstanceProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagInstanceProfileRequest'],
      shapes: shapes,
    );
  }

  /// Adds one or more tags to an IAM virtual multi-factor authentication (MFA)
  /// device. If a tag with the same key name already exists, then that tag is
  /// overwritten with the new value.
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
  /// <b>Access control</b> - Include tags in IAM user-based and resource-based
  /// policies. You can use tags to restrict access to only an IAM virtual MFA
  /// device that has a specified tag attached. For examples of policies that
  /// show how to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serialNumber] :
  /// The unique identifier for the IAM virtual MFA device to which you want to
  /// add tags. For virtual MFA devices, the serial number is the same as the
  /// ARN.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the IAM virtual MFA device.
  /// Each tag consists of a key name and an associated value.
  Future<void> tagMFADevice({
    required String serialNumber,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SerialNumber'] = serialNumber;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagMFADeviceRequest'],
      shapes: shapes,
    );
  }

  /// Adds one or more tags to an OpenID Connect (OIDC)-compatible identity
  /// provider. For more information about these providers, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About
  /// web identity federation</a>. If a tag with the same key name already
  /// exists, then that tag is overwritten with the new value.
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
  /// <b>Access control</b> - Include tags in IAM identity-based and
  /// resource-based policies. You can use tags to restrict access to only an
  /// OIDC provider that has a specified tag attached. For examples of policies
  /// that show how to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The ARN of the OIDC identity provider in IAM to which you want to add
  /// tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the OIDC identity provider in
  /// IAM. Each tag consists of a key name and an associated value.
  Future<void> tagOpenIDConnectProvider({
    required String openIDConnectProviderArn,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagOpenIDConnectProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagOpenIDConnectProviderRequest'],
      shapes: shapes,
    );
  }

  /// Adds one or more tags to an IAM customer managed policy. If a tag with the
  /// same key name already exists, then that tag is overwritten with the new
  /// value.
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
  /// <b>Access control</b> - Include tags in IAM user-based and resource-based
  /// policies. You can use tags to restrict access to only an IAM customer
  /// managed policy that has a specified tag attached. For examples of policies
  /// that show how to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The ARN of the IAM customer managed policy to which you want to add tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the IAM customer managed
  /// policy. Each tag consists of a key name and an associated value.
  Future<void> tagPolicy({
    required String policyArn,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagPolicyRequest'],
      shapes: shapes,
    );
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
  /// <b>Access control</b> - Include tags in IAM user-based and resource-based
  /// policies. You can use tags to restrict access to only an IAM role that has
  /// a specified tag attached. You can also restrict access to only those
  /// resources that have a certain tag attached. For examples of policies that
  /// show how to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Cost allocation</b> - Use tags to help track which individuals and
  /// teams are using which Amazon Web Services resources.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [roleName] :
  /// The name of the IAM role to which you want to add tags.
  ///
  /// This parameter accepts (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters that consist of upper and lowercase alphanumeric characters
  /// with no spaces. You can also include any of the following characters:
  /// _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the IAM role. Each tag
  /// consists of a key name and an associated value.
  Future<void> tagRole({
    required String roleName,
    required List<Tag> tags,
  }) async {
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

  /// Adds one or more tags to a Security Assertion Markup Language (SAML)
  /// identity provider. For more information about these providers, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About
  /// SAML 2.0-based federation </a>. If a tag with the same key name already
  /// exists, then that tag is overwritten with the new value.
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
  /// <b>Access control</b> - Include tags in IAM user-based and resource-based
  /// policies. You can use tags to restrict access to only a SAML identity
  /// provider that has a specified tag attached. For examples of policies that
  /// show how to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sAMLProviderArn] :
  /// The ARN of the SAML identity provider in IAM to which you want to add
  /// tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the SAML identity provider in
  /// IAM. Each tag consists of a key name and an associated value.
  Future<void> tagSAMLProvider({
    required String sAMLProviderArn,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['SAMLProviderArn'] = sAMLProviderArn;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagSAMLProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagSAMLProviderRequest'],
      shapes: shapes,
    );
  }

  /// Adds one or more tags to an IAM server certificate. If a tag with the same
  /// key name already exists, then that tag is overwritten with the new value.
  /// <note>
  /// For certificates in a Region supported by Certificate Manager (ACM), we
  /// recommend that you don't use IAM server certificates. Instead, use ACM to
  /// provision, manage, and deploy your server certificates. For more
  /// information about IAM server certificates, <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with server certificates</a> in the <i>IAM User Guide</i>.
  /// </note>
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
  /// <b>Access control</b> - Include tags in IAM user-based and resource-based
  /// policies. You can use tags to restrict access to only a server certificate
  /// that has a specified tag attached. For examples of policies that show how
  /// to use tags to control access, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Cost allocation</b> - Use tags to help track which individuals and
  /// teams are using which Amazon Web Services resources.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serverCertificateName] :
  /// The name of the IAM server certificate to which you want to add tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the IAM server certificate.
  /// Each tag consists of a key name and an associated value.
  Future<void> tagServerCertificate({
    required String serverCertificateName,
    required List<Tag> tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServerCertificateName'] = serverCertificateName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'TagServerCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['TagServerCertificateRequest'],
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
  /// <b>Access control</b> - Include tags in IAM identity-based and
  /// resource-based policies. You can use tags to restrict access to only an
  /// IAM requesting user that has a specified tag attached. You can also
  /// restrict access to only those resources that have a certain tag attached.
  /// For examples of policies that show how to use tags to control access, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Control
  /// access using IAM tags</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Cost allocation</b> - Use tags to help track which individuals and
  /// teams are using which Amazon Web Services resources.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a
  /// single string. If you need to store an array, you can store
  /// comma-separated values in the string. However, you must interpret the
  /// value in your code.
  /// </li>
  /// </ul> </note>
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM identities</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [tags] :
  /// The list of tags that you want to attach to the IAM user. Each tag
  /// consists of a key name and an associated value.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user to which you want to add tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> tagUser({
    required List<Tag> tags,
    required String userName,
  }) async {
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

  /// Removes the specified tags from the IAM instance profile. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [instanceProfileName] :
  /// The name of the IAM instance profile from which you want to remove tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified instance profile.
  Future<void> untagInstanceProfile({
    required String instanceProfileName,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['InstanceProfileName'] = instanceProfileName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagInstanceProfile',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagInstanceProfileRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the IAM virtual multi-factor
  /// authentication (MFA) device. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serialNumber] :
  /// The unique identifier for the IAM virtual MFA device from which you want
  /// to remove tags. For virtual MFA devices, the serial number is the same as
  /// the ARN.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified instance profile.
  Future<void> untagMFADevice({
    required String serialNumber,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['SerialNumber'] = serialNumber;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagMFADevice',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagMFADeviceRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the specified OpenID Connect
  /// (OIDC)-compatible identity provider in IAM. For more information about
  /// OIDC providers, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About
  /// web identity federation</a>. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [openIDConnectProviderArn] :
  /// The ARN of the OIDC provider in IAM from which you want to remove tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified OIDC provider.
  Future<void> untagOpenIDConnectProvider({
    required String openIDConnectProviderArn,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['OpenIDConnectProviderArn'] = openIDConnectProviderArn;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagOpenIDConnectProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagOpenIDConnectProviderRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the customer managed policy. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [policyArn] :
  /// The ARN of the IAM customer managed policy from which you want to remove
  /// tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified policy.
  Future<void> untagPolicy({
    required String policyArn,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['PolicyArn'] = policyArn;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagPolicy',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagPolicyRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the role. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
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
    required String roleName,
    required List<String> tagKeys,
  }) async {
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

  /// Removes the specified tags from the specified Security Assertion Markup
  /// Language (SAML) identity provider in IAM. For more information about these
  /// providers, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc.html">About
  /// web identity federation</a>. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sAMLProviderArn] :
  /// The ARN of the SAML identity provider in IAM from which you want to remove
  /// tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified SAML identity provider.
  Future<void> untagSAMLProvider({
    required String sAMLProviderArn,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['SAMLProviderArn'] = sAMLProviderArn;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagSAMLProvider',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagSAMLProviderRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the IAM server certificate. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// For certificates in a Region supported by Certificate Manager (ACM), we
  /// recommend that you don't use IAM server certificates. Instead, use ACM to
  /// provision, manage, and deploy your server certificates. For more
  /// information about IAM server certificates, <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with server certificates</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [serverCertificateName] :
  /// The name of the IAM server certificate from which you want to remove tags.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  ///
  /// Parameter [tagKeys] :
  /// A list of key names as a simple array of strings. The tags with matching
  /// keys are removed from the specified IAM server certificate.
  Future<void> untagServerCertificate({
    required String serverCertificateName,
    required List<String> tagKeys,
  }) async {
    final $request = <String, dynamic>{};
    $request['ServerCertificateName'] = serverCertificateName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'UntagServerCertificate',
      version: '2010-05-08',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['UntagServerCertificateRequest'],
      shapes: shapes,
    );
  }

  /// Removes the specified tags from the user. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
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
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> untagUser({
    required List<String> tagKeys,
    required String userName,
  }) async {
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
  /// implicitly based on the Amazon Web Services access key ID used to sign the
  /// request. If a temporary access key is used, then <code>UserName</code> is
  /// required. If a long-term key is assigned to the user, then
  /// <code>UserName</code> is not required. This operation works for access
  /// keys under the Amazon Web Services account. Consequently, you can use this
  /// operation to manage Amazon Web Services account root user credentials even
  /// if the Amazon Web Services account has no associated users.
  ///
  /// For information about rotating keys, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/ManagingCredentials.html">Managing
  /// keys and certificates</a> in the <i>IAM User Guide</i>.
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
  /// <code>Active</code> means that the key can be used for programmatic calls
  /// to Amazon Web Services, while <code>Inactive</code> means that the key
  /// cannot be used.
  ///
  /// Parameter [userName] :
  /// The name of the user whose key you want to update.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateAccessKey({
    required String accessKeyId,
    required StatusType status,
    String? userName,
  }) async {
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

  /// Updates the password policy settings for the Amazon Web Services account.
  /// <note>
  /// This operation does not support partial updates. No parameters are
  /// required, but if you do not specify a parameter, that parameter's value
  /// reverts to its default value. See the <b>Request Parameters</b> section
  /// for each parameter's default value. Also note that some parameters do not
  /// allow the default parameter to be explicitly set. Instead, to invoke the
  /// default value, do not include that parameter when you invoke the
  /// operation.
  /// </note>
  /// For more information about using a password policy, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingPasswordPolicies.html">Managing
  /// an IAM password policy</a> in the <i>IAM User Guide</i>.
  ///
  /// May throw [NoSuchEntityException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [allowUsersToChangePassword] :
  /// Allows all IAM users in your account to use the Amazon Web Services
  /// Management Console to change their own passwords. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_passwords_enable-user-change.html">Permitting
  /// IAM users to change their own passwords</a> in the <i>IAM User Guide</i>.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that IAM users in
  /// the account do not automatically have permissions to change their own
  /// password.
  ///
  /// Parameter [hardExpiry] :
  /// Prevents IAM users who are accessing the account via the Amazon Web
  /// Services Management Console from setting a new console password after
  /// their password has expired. The IAM user cannot access the console until
  /// an administrator resets the password.
  ///
  /// If you do not specify a value for this parameter, then the operation uses
  /// the default value of <code>false</code>. The result is that IAM users can
  /// change their passwords after they expire and continue to sign in as the
  /// user.
  /// <note>
  /// In the Amazon Web Services Management Console, the custom password policy
  /// option <b>Allow users to change their own password</b> gives IAM users
  /// permissions to <code>iam:ChangePassword</code> for only their user and to
  /// the <code>iam:GetAccountPasswordPolicy</code> action. This option does not
  /// attach a permissions policy to each user, rather the permissions are
  /// applied at the account-level for all users by IAM. IAM users with
  /// <code>iam:ChangePassword</code> permission and active access keys can
  /// reset their own expired console password using the CLI or API.
  /// </note>
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
    bool? allowUsersToChangePassword,
    bool? hardExpiry,
    int? maxPasswordAge,
    int? minimumPasswordLength,
    int? passwordReusePrevention,
    bool? requireLowercaseCharacters,
    bool? requireNumbers,
    bool? requireSymbols,
    bool? requireUppercaseCharacters,
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
  /// information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/roles-toplevel.html">Using
  /// roles to delegate permissions and federate identities</a>.
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
  /// You must provide policies in JSON format in IAM. However, for
  /// CloudFormation templates formatted in YAML, you can provide the policy in
  /// JSON or YAML format. CloudFormation always converts a YAML policy to JSON
  /// format before submitting it to IAM.
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
    required String policyDocument,
    required String roleName,
  }) async {
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
  /// users and groups</a> in the <i>IAM User Guide</i>.
  /// </important> <note>
  /// The person making the request (the principal), must have permission to
  /// change the role group with the old name and the new name. For example, to
  /// change the group named <code>Managers</code> to <code>MGRs</code>, the
  /// principal must have a policy that allows them to update both groups. If
  /// the principal has permission to update the <code>Managers</code> group,
  /// but not the <code>MGRs</code> group, then the update fails. For more
  /// information about permissions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html">Access
  /// management</a>.
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
    required String groupName,
    String? newGroupName,
    String? newPath,
  }) async {
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

  /// Changes the password for the specified IAM user. You can use the CLI, the
  /// Amazon Web Services API, or the <b>Users</b> page in the IAM console to
  /// change the password for any IAM user. Use <a>ChangePassword</a> to change
  /// your own password in the <b>My Security Credentials</b> page in the Amazon
  /// Web Services Management Console.
  ///
  /// For more information about modifying passwords, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_ManagingLogins.html">Managing
  /// passwords</a> in the <i>IAM User Guide</i>.
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
  /// by setting a password policy on the Amazon Web Services account. For more
  /// information, see <a>UpdateAccountPasswordPolicy</a>.
  ///
  /// Parameter [passwordResetRequired] :
  /// Allows this new password to be used only once by requiring the specified
  /// IAM user to set a new password on next sign-in.
  Future<void> updateLoginProfile({
    required String userName,
    String? password,
    bool? passwordResetRequired,
  }) async {
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
  /// Typically, you need to update a thumbprint only when the identity provider
  /// certificate changes, which occurs rarely. However, if the provider's
  /// certificate <i>does</i> change, any attempt to assume an IAM role that
  /// specifies the OIDC provider as a principal fails until the certificate
  /// thumbprint is updated.
  /// <note>
  /// Amazon Web Services secures communication with some OIDC identity
  /// providers (IdPs) through our library of trusted root certificate
  /// authorities (CAs) instead of using a certificate thumbprint to verify your
  /// IdP server certificate. In these cases, your legacy thumbprint remains in
  /// your configuration, but is no longer used for validation. These OIDC IdPs
  /// include Auth0, GitHub, GitLab, Google, and those that use an Amazon S3
  /// bucket to host a JSON Web Key Set (JWKS) endpoint.
  /// </note> <note>
  /// Trust for the OIDC provider is derived from the provider certificate and
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [thumbprintList] :
  /// A list of certificate thumbprints that are associated with the specified
  /// IAM OpenID Connect provider. For more information, see
  /// <a>CreateOpenIDConnectProvider</a>.
  Future<void> updateOpenIDConnectProviderThumbprint({
    required String openIDConnectProviderArn,
    required List<String> thumbprintList,
  }) async {
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
  /// default value of one hour is applied. This setting can have a value from 1
  /// hour to 12 hours.
  ///
  /// Anyone who assumes the role from the CLI or API can use the
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
  /// IAM roles</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// IAM role credentials provided by Amazon EC2 instances assigned to the role
  /// are not subject to the specified maximum session duration.
  /// </note>
  Future<void> updateRole({
    required String roleName,
    String? description,
    int? maxSessionDuration,
  }) async {
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
    required String description,
    required String roleName,
  }) async {
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
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<UpdateSAMLProviderResponse> updateSAMLProvider({
    required String sAMLMetadataDocument,
    required String sAMLProviderArn,
  }) async {
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
  /// authenticating the associated IAM user to an CodeCommit repository. For
  /// more information about using SSH keys to authenticate to an CodeCommit
  /// repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up CodeCommit for SSH connections</a> in the <i>CodeCommit User Guide</i>.
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
  /// the key can be used for authentication with an CodeCommit repository.
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
    required String sSHPublicKeyId,
    required StatusType status,
    required String userName,
  }) async {
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
  /// with server certificates</a> in the <i>IAM User Guide</i>. This topic also
  /// includes a list of Amazon Web Services services that can use the server
  /// certificates that you manage with IAM.
  /// <important>
  /// You should understand the implications of changing a server certificate's
  /// path or name. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs_manage.html#RenamingServerCerts">Renaming
  /// a server certificate</a> in the <i>IAM User Guide</i>.
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
  /// management</a> in the <i>IAM User Guide</i>.
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
    required String serverCertificateName,
    String? newPath,
    String? newServerCertificateName,
  }) async {
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
    required String serviceSpecificCredentialId,
    required StatusType status,
    String? userName,
  }) async {
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
  /// determined implicitly based on the Amazon Web Services access key ID used
  /// to sign the request. This operation works for access keys under the Amazon
  /// Web Services account. Consequently, you can use this operation to manage
  /// Amazon Web Services account root user credentials even if the Amazon Web
  /// Services account has no associated users.
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
  /// means that the certificate can be used for programmatic calls to Amazon
  /// Web Services <code>Inactive</code> means that the certificate cannot be
  /// used.
  ///
  /// Parameter [userName] :
  /// The name of the IAM user the signing certificate belongs to.
  ///
  /// This parameter allows (through its <a
  /// href="http://wikipedia.org/wiki/regex">regex pattern</a>) a string of
  /// characters consisting of upper and lowercase alphanumeric characters with
  /// no spaces. You can also include any of the following characters: _+=,.@-
  Future<void> updateSigningCertificate({
    required String certificateId,
    required StatusType status,
    String? userName,
  }) async {
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
  /// an IAM user</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_groups_manage_rename.html">Renaming
  /// an IAM group</a> in the <i>IAM User Guide</i>.
  /// </important> <note>
  /// To change a user name, the requester must have appropriate permissions on
  /// both the source object and the target object. For example, to change Bob
  /// to Robert, the entity making the request must have permission on Bob and
  /// Robert, or must have permission on all (*). For more information about
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/PermissionsAndPolicies.html">Permissions
  /// and policies</a>.
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
    required String userName,
    String? newPath,
    String? newUserName,
  }) async {
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
  /// authenticating the associated IAM user to an CodeCommit repository. For
  /// more information about using SSH keys to authenticate to an CodeCommit
  /// repository, see <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-credentials-ssh.html">Set
  /// up CodeCommit for SSH connections</a> in the <i>CodeCommit User Guide</i>.
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
    required String sSHPublicKeyBody,
    required String userName,
  }) async {
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

  /// Uploads a server certificate entity for the Amazon Web Services account.
  /// The server certificate entity includes a public key certificate, a private
  /// key, and an optional certificate chain, which should all be PEM-encoded.
  ///
  /// We recommend that you use <a
  /// href="https://docs.aws.amazon.com/acm/">Certificate Manager</a> to
  /// provision, manage, and deploy your server certificates. With ACM you can
  /// request a certificate, deploy it to Amazon Web Services resources, and let
  /// ACM handle certificate renewals for you. Certificates provided by ACM are
  /// free. For more information about using ACM, see the <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/">Certificate
  /// Manager User Guide</a>.
  ///
  /// For more information about working with server certificates, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Working
  /// with server certificates</a> in the <i>IAM User Guide</i>. This topic
  /// includes a list of Amazon Web Services services that can use the server
  /// certificates that you manage with IAM.
  ///
  /// For information about the number of server certificates you can upload,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
  /// and STS quotas</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// Because the body of the public key certificate, private key, and the
  /// certificate chain can be large, you should use POST rather than GET when
  /// calling <code>UploadServerCertificate</code>. For information about
  /// setting up signatures and authorization through the API, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html">Signing
  /// Amazon Web Services API requests</a> in the <i>Amazon Web Services General
  /// Reference</i>. For general information about using the Query API with IAM,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/programming.html">Calling
  /// the API by making HTTP query requests</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidInputException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [MalformedCertificateException].
  /// May throw [KeyPairMismatchException].
  /// May throw [ConcurrentModificationException].
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
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
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the new IAM server certificate
  /// resource. Each tag consists of a key name and an associated value. For
  /// more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed maximum
  /// number of tags, then the entire request fails and the resource is not
  /// created.
  /// </note>
  Future<UploadServerCertificateResponse> uploadServerCertificate({
    required String certificateBody,
    required String privateKey,
    required String serverCertificateName,
    String? certificateChain,
    String? path,
    List<Tag>? tags,
  }) async {
    final $request = <String, dynamic>{};
    $request['CertificateBody'] = certificateBody;
    $request['PrivateKey'] = privateKey;
    $request['ServerCertificateName'] = serverCertificateName;
    certificateChain?.also((arg) => $request['CertificateChain'] = arg);
    path?.also((arg) => $request['Path'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
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
  /// IAM user. Some Amazon Web Services services require you to use
  /// certificates to validate requests that are signed with a corresponding
  /// private key. When you upload the certificate, its default status is
  /// <code>Active</code>.
  ///
  /// For information about when you would use an X.509 signing certificate, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">Managing
  /// server certificates in IAM</a> in the <i>IAM User Guide</i>.
  ///
  /// If the <code>UserName</code> is not specified, the IAM user name is
  /// determined implicitly based on the Amazon Web Services access key ID used
  /// to sign the request. This operation works for access keys under the Amazon
  /// Web Services account. Consequently, you can use this operation to manage
  /// Amazon Web Services account root user credentials even if the Amazon Web
  /// Services account has no associated users.
  /// <note>
  /// Because the body of an X.509 certificate can be large, you should use POST
  /// rather than GET when calling <code>UploadSigningCertificate</code>. For
  /// information about setting up signatures and authorization through the API,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signing_aws_api_requests.html">Signing
  /// Amazon Web Services API requests</a> in the <i>Amazon Web Services General
  /// Reference</i>. For general information about using the Query API with IAM,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/IAM_UsingQueryAPI.html">Making
  /// query requests</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [EntityAlreadyExistsException].
  /// May throw [MalformedCertificateException].
  /// May throw [InvalidCertificateException].
  /// May throw [DuplicateCertificateException].
  /// May throw [NoSuchEntityException].
  /// May throw [ConcurrentModificationException].
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
    required String certificateBody,
    String? userName,
  }) async {
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
  serviceLevel,
  actionLevel,
}

extension AccessAdvisorUsageGranularityTypeValueExtension
    on AccessAdvisorUsageGranularityType {
  String toValue() {
    switch (this) {
      case AccessAdvisorUsageGranularityType.serviceLevel:
        return 'SERVICE_LEVEL';
      case AccessAdvisorUsageGranularityType.actionLevel:
        return 'ACTION_LEVEL';
    }
  }
}

extension AccessAdvisorUsageGranularityTypeFromString on String {
  AccessAdvisorUsageGranularityType toAccessAdvisorUsageGranularityType() {
    switch (this) {
      case 'SERVICE_LEVEL':
        return AccessAdvisorUsageGranularityType.serviceLevel;
      case 'ACTION_LEVEL':
        return AccessAdvisorUsageGranularityType.actionLevel;
    }
    throw Exception(
        '$this is not known in enum AccessAdvisorUsageGranularityType');
  }
}

/// An object that contains details about when a principal in the reported
/// Organizations entity last attempted to access an Amazon Web Services
/// service. A principal can be an IAM user, an IAM role, or the Amazon Web
/// Services account root user within the reported Organizations entity.
///
/// This data type is a response element in the
/// <a>GetOrganizationsAccessReport</a> operation.
class AccessDetail {
  /// The name of the service in which access was attempted.
  final String serviceName;

  /// The namespace of the service in which access was attempted.
  ///
  /// To learn the service namespace of a service, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Actions,
  /// resources, and condition keys for Amazon Web Services services</a> in the
  /// <i>Service Authorization Reference</i>. Choose the name of the service to
  /// view details for that service. In the first paragraph, find the service
  /// prefix. For example, <code>(service prefix: a4b)</code>. For more
  /// information about service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">Amazon
  /// Web Services service namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String serviceNamespace;

  /// The path of the Organizations entity (root, organizational unit, or account)
  /// from which an authenticated principal last attempted to access the service.
  /// Amazon Web Services does not report unauthenticated requests.
  ///
  /// This field is null if no principals (IAM users, IAM roles, or root user) in
  /// the reported Organizations entity attempted to access the service within the
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final String? entityPath;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when an authenticated principal most recently
  /// attempted to access the service. Amazon Web Services does not report
  /// unauthenticated requests.
  ///
  /// This field is null if no principals in the reported Organizations entity
  /// attempted to access the service within the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final DateTime? lastAuthenticatedTime;

  /// The Region where the last service access attempt occurred.
  ///
  /// This field is null if no principals in the reported Organizations entity
  /// attempted to access the service within the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final String? region;

  /// The number of accounts with authenticated principals (root user, IAM users,
  /// and IAM roles) that attempted to access the service in the tracking period.
  final int? totalAuthenticatedEntities;

  AccessDetail({
    required this.serviceName,
    required this.serviceNamespace,
    this.entityPath,
    this.lastAuthenticatedTime,
    this.region,
    this.totalAuthenticatedEntities,
  });
  factory AccessDetail.fromXml(_s.XmlElement elem) {
    return AccessDetail(
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName')!,
      serviceNamespace: _s.extractXmlStringValue(elem, 'ServiceNamespace')!,
      entityPath: _s.extractXmlStringValue(elem, 'EntityPath'),
      lastAuthenticatedTime:
          _s.extractXmlDateTimeValue(elem, 'LastAuthenticatedTime'),
      region: _s.extractXmlStringValue(elem, 'Region'),
      totalAuthenticatedEntities:
          _s.extractXmlIntValue(elem, 'TotalAuthenticatedEntities'),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final serviceNamespace = this.serviceNamespace;
    final entityPath = this.entityPath;
    final lastAuthenticatedTime = this.lastAuthenticatedTime;
    final region = this.region;
    final totalAuthenticatedEntities = this.totalAuthenticatedEntities;
    return {
      'ServiceName': serviceName,
      'ServiceNamespace': serviceNamespace,
      if (entityPath != null) 'EntityPath': entityPath,
      if (lastAuthenticatedTime != null)
        'LastAuthenticatedTime': iso8601ToJson(lastAuthenticatedTime),
      if (region != null) 'Region': region,
      if (totalAuthenticatedEntities != null)
        'TotalAuthenticatedEntities': totalAuthenticatedEntities,
    };
  }
}

/// Contains information about an Amazon Web Services access key.
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
  final DateTime? createDate;

  AccessKey({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.status,
    required this.userName,
    this.createDate,
  });
  factory AccessKey.fromXml(_s.XmlElement elem) {
    return AccessKey(
      accessKeyId: _s.extractXmlStringValue(elem, 'AccessKeyId')!,
      secretAccessKey: _s.extractXmlStringValue(elem, 'SecretAccessKey')!,
      status: _s.extractXmlStringValue(elem, 'Status')!.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final secretAccessKey = this.secretAccessKey;
    final status = this.status;
    final userName = this.userName;
    final createDate = this.createDate;
    return {
      'AccessKeyId': accessKeyId,
      'SecretAccessKey': secretAccessKey,
      'Status': status.toValue(),
      'UserName': userName,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
    };
  }
}

/// Contains information about the last time an Amazon Web Services access key
/// was used since IAM began tracking this information on April 22, 2015.
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

  /// The Amazon Web Services Region where this access key was most recently used.
  /// The value for this field is "N/A" in the following situations:
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
  /// For more information about Amazon Web Services Regions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html">Regions and
  /// endpoints</a> in the Amazon Web Services General Reference.
  final String region;

  /// The name of the Amazon Web Services service with which this access key was
  /// most recently used. The value of this field is "N/A" in the following
  /// situations:
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
    required this.lastUsedDate,
    required this.region,
    required this.serviceName,
  });
  factory AccessKeyLastUsed.fromXml(_s.XmlElement elem) {
    return AccessKeyLastUsed(
      lastUsedDate: _s.extractXmlDateTimeValue(elem, 'LastUsedDate')!,
      region: _s.extractXmlStringValue(elem, 'Region')!,
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUsedDate = this.lastUsedDate;
    final region = this.region;
    final serviceName = this.serviceName;
    return {
      'LastUsedDate': iso8601ToJson(lastUsedDate),
      'Region': region,
      'ServiceName': serviceName,
    };
  }
}

/// Contains information about an Amazon Web Services access key, without its
/// secret key.
///
/// This data type is used as a response element in the <a>ListAccessKeys</a>
/// operation.
class AccessKeyMetadata {
  /// The ID for this access key.
  final String? accessKeyId;

  /// The date when the access key was created.
  final DateTime? createDate;

  /// The status of the access key. <code>Active</code> means that the key is
  /// valid for API calls; <code>Inactive</code> means it is not.
  final StatusType? status;

  /// The name of the IAM user that the key is associated with.
  final String? userName;

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

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final createDate = this.createDate;
    final status = this.status;
    final userName = this.userName;
    return {
      if (accessKeyId != null) 'AccessKeyId': accessKeyId,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (status != null) 'Status': status.toValue(),
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Contains information about an attached permissions boundary.
///
/// An attached permissions boundary is a managed policy that has been attached
/// to a user or role to set the permissions boundary.
///
/// For more information about permissions boundaries, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
/// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
class AttachedPermissionsBoundary {
  /// The ARN of the policy used to set the permissions boundary for the user or
  /// role.
  final String? permissionsBoundaryArn;

  /// The permissions boundary usage type that indicates what type of IAM resource
  /// is used as the permissions boundary for an entity. This data type can only
  /// have a value of <code>Policy</code>.
  final PermissionsBoundaryAttachmentType? permissionsBoundaryType;

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

  Map<String, dynamic> toJson() {
    final permissionsBoundaryArn = this.permissionsBoundaryArn;
    final permissionsBoundaryType = this.permissionsBoundaryType;
    return {
      if (permissionsBoundaryArn != null)
        'PermissionsBoundaryArn': permissionsBoundaryArn,
      if (permissionsBoundaryType != null)
        'PermissionsBoundaryType': permissionsBoundaryType.toValue(),
    };
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
/// policies and inline policies</a> in the <i>IAM User Guide</i>.
class AttachedPolicy {
  final String? policyArn;

  /// The friendly name of the attached policy.
  final String? policyName;

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

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyName = this.policyName;
    return {
      if (policyArn != null) 'PolicyArn': policyArn,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

/// Contains information about a condition context key. It includes the name of
/// the key and specifies the value (or values, if the context key supports
/// multiple values) to use in the simulation. This information is used when
/// evaluating the <code>Condition</code> elements of the input policies.
///
/// This data type is used as an input parameter to <a>SimulateCustomPolicy</a>
/// and <a>SimulatePrincipalPolicy</a>.
class ContextEntry {
  /// The full name of a condition context key, including the service prefix. For
  /// example, <code>aws:SourceIp</code> or <code>s3:VersionId</code>.
  final String? contextKeyName;

  /// The data type of the value (or values) specified in the
  /// <code>ContextKeyValues</code> parameter.
  final ContextKeyTypeEnum? contextKeyType;

  /// The value (or values, if the condition context key supports multiple values)
  /// to provide to the simulation when the key is referenced by a
  /// <code>Condition</code> element in an input policy.
  final List<String>? contextKeyValues;

  ContextEntry({
    this.contextKeyName,
    this.contextKeyType,
    this.contextKeyValues,
  });

  Map<String, dynamic> toJson() {
    final contextKeyName = this.contextKeyName;
    final contextKeyType = this.contextKeyType;
    final contextKeyValues = this.contextKeyValues;
    return {
      if (contextKeyName != null) 'ContextKeyName': contextKeyName,
      if (contextKeyType != null) 'ContextKeyType': contextKeyType.toValue(),
      if (contextKeyValues != null) 'ContextKeyValues': contextKeyValues,
    };
  }
}

enum ContextKeyTypeEnum {
  string,
  stringList,
  numeric,
  numericList,
  boolean,
  booleanList,
  ip,
  ipList,
  binary,
  binaryList,
  date,
  dateList,
}

extension ContextKeyTypeEnumValueExtension on ContextKeyTypeEnum {
  String toValue() {
    switch (this) {
      case ContextKeyTypeEnum.string:
        return 'string';
      case ContextKeyTypeEnum.stringList:
        return 'stringList';
      case ContextKeyTypeEnum.numeric:
        return 'numeric';
      case ContextKeyTypeEnum.numericList:
        return 'numericList';
      case ContextKeyTypeEnum.boolean:
        return 'boolean';
      case ContextKeyTypeEnum.booleanList:
        return 'booleanList';
      case ContextKeyTypeEnum.ip:
        return 'ip';
      case ContextKeyTypeEnum.ipList:
        return 'ipList';
      case ContextKeyTypeEnum.binary:
        return 'binary';
      case ContextKeyTypeEnum.binaryList:
        return 'binaryList';
      case ContextKeyTypeEnum.date:
        return 'date';
      case ContextKeyTypeEnum.dateList:
        return 'dateList';
    }
  }
}

extension ContextKeyTypeEnumFromString on String {
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
    throw Exception('$this is not known in enum ContextKeyTypeEnum');
  }
}

/// Contains the response to a successful <a>CreateAccessKey</a> request.
class CreateAccessKeyResponse {
  /// A structure with details about the access key.
  final AccessKey accessKey;

  CreateAccessKeyResponse({
    required this.accessKey,
  });
  factory CreateAccessKeyResponse.fromXml(_s.XmlElement elem) {
    return CreateAccessKeyResponse(
      accessKey: AccessKey.fromXml(_s.extractXmlChild(elem, 'AccessKey')!),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKey = this.accessKey;
    return {
      'AccessKey': accessKey,
    };
  }
}

/// Contains the response to a successful <a>CreateGroup</a> request.
class CreateGroupResponse {
  /// A structure containing details about the new group.
  final Group group;

  CreateGroupResponse({
    required this.group,
  });
  factory CreateGroupResponse.fromXml(_s.XmlElement elem) {
    return CreateGroupResponse(
      group: Group.fromXml(_s.extractXmlChild(elem, 'Group')!),
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      'Group': group,
    };
  }
}

/// Contains the response to a successful <a>CreateInstanceProfile</a> request.
class CreateInstanceProfileResponse {
  /// A structure containing details about the new instance profile.
  final InstanceProfile instanceProfile;

  CreateInstanceProfileResponse({
    required this.instanceProfile,
  });
  factory CreateInstanceProfileResponse.fromXml(_s.XmlElement elem) {
    return CreateInstanceProfileResponse(
      instanceProfile:
          InstanceProfile.fromXml(_s.extractXmlChild(elem, 'InstanceProfile')!),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfile = this.instanceProfile;
    return {
      'InstanceProfile': instanceProfile,
    };
  }
}

/// Contains the response to a successful <a>CreateLoginProfile</a> request.
class CreateLoginProfileResponse {
  /// A structure containing the user name and password create date.
  final LoginProfile loginProfile;

  CreateLoginProfileResponse({
    required this.loginProfile,
  });
  factory CreateLoginProfileResponse.fromXml(_s.XmlElement elem) {
    return CreateLoginProfileResponse(
      loginProfile:
          LoginProfile.fromXml(_s.extractXmlChild(elem, 'LoginProfile')!),
    );
  }

  Map<String, dynamic> toJson() {
    final loginProfile = this.loginProfile;
    return {
      'LoginProfile': loginProfile,
    };
  }
}

/// Contains the response to a successful <a>CreateOpenIDConnectProvider</a>
/// request.
class CreateOpenIDConnectProviderResponse {
  /// The Amazon Resource Name (ARN) of the new IAM OpenID Connect provider that
  /// is created. For more information, see <a>OpenIDConnectProviderListEntry</a>.
  final String? openIDConnectProviderArn;

  /// A list of tags that are attached to the new IAM OIDC provider. The returned
  /// list of tags is sorted by tag key. For more information about tagging, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  CreateOpenIDConnectProviderResponse({
    this.openIDConnectProviderArn,
    this.tags,
  });
  factory CreateOpenIDConnectProviderResponse.fromXml(_s.XmlElement elem) {
    return CreateOpenIDConnectProviderResponse(
      openIDConnectProviderArn:
          _s.extractXmlStringValue(elem, 'OpenIDConnectProviderArn'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final openIDConnectProviderArn = this.openIDConnectProviderArn;
    final tags = this.tags;
    return {
      if (openIDConnectProviderArn != null)
        'OpenIDConnectProviderArn': openIDConnectProviderArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains the response to a successful <a>CreatePolicy</a> request.
class CreatePolicyResponse {
  /// A structure containing details about the new policy.
  final Policy? policy;

  CreatePolicyResponse({
    this.policy,
  });
  factory CreatePolicyResponse.fromXml(_s.XmlElement elem) {
    return CreatePolicyResponse(
      policy: _s.extractXmlChild(elem, 'Policy')?.let(Policy.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

/// Contains the response to a successful <a>CreatePolicyVersion</a> request.
class CreatePolicyVersionResponse {
  /// A structure containing details about the new policy version.
  final PolicyVersion? policyVersion;

  CreatePolicyVersionResponse({
    this.policyVersion,
  });
  factory CreatePolicyVersionResponse.fromXml(_s.XmlElement elem) {
    return CreatePolicyVersionResponse(
      policyVersion:
          _s.extractXmlChild(elem, 'PolicyVersion')?.let(PolicyVersion.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final policyVersion = this.policyVersion;
    return {
      if (policyVersion != null) 'PolicyVersion': policyVersion,
    };
  }
}

/// Contains the response to a successful <a>CreateRole</a> request.
class CreateRoleResponse {
  /// A structure containing details about the new role.
  final Role role;

  CreateRoleResponse({
    required this.role,
  });
  factory CreateRoleResponse.fromXml(_s.XmlElement elem) {
    return CreateRoleResponse(
      role: Role.fromXml(_s.extractXmlChild(elem, 'Role')!),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      'Role': role,
    };
  }
}

/// Contains the response to a successful <a>CreateSAMLProvider</a> request.
class CreateSAMLProviderResponse {
  /// The Amazon Resource Name (ARN) of the new SAML provider resource in IAM.
  final String? sAMLProviderArn;

  /// A list of tags that are attached to the new IAM SAML provider. The returned
  /// list of tags is sorted by tag key. For more information about tagging, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  CreateSAMLProviderResponse({
    this.sAMLProviderArn,
    this.tags,
  });
  factory CreateSAMLProviderResponse.fromXml(_s.XmlElement elem) {
    return CreateSAMLProviderResponse(
      sAMLProviderArn: _s.extractXmlStringValue(elem, 'SAMLProviderArn'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final sAMLProviderArn = this.sAMLProviderArn;
    final tags = this.tags;
    return {
      if (sAMLProviderArn != null) 'SAMLProviderArn': sAMLProviderArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateServiceLinkedRoleResponse {
  /// A <a>Role</a> object that contains details about the newly created role.
  final Role? role;

  CreateServiceLinkedRoleResponse({
    this.role,
  });
  factory CreateServiceLinkedRoleResponse.fromXml(_s.XmlElement elem) {
    return CreateServiceLinkedRoleResponse(
      role: _s.extractXmlChild(elem, 'Role')?.let(Role.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      if (role != null) 'Role': role,
    };
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
  final ServiceSpecificCredential? serviceSpecificCredential;

  CreateServiceSpecificCredentialResponse({
    this.serviceSpecificCredential,
  });
  factory CreateServiceSpecificCredentialResponse.fromXml(_s.XmlElement elem) {
    return CreateServiceSpecificCredentialResponse(
      serviceSpecificCredential: _s
          .extractXmlChild(elem, 'ServiceSpecificCredential')
          ?.let(ServiceSpecificCredential.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSpecificCredential = this.serviceSpecificCredential;
    return {
      if (serviceSpecificCredential != null)
        'ServiceSpecificCredential': serviceSpecificCredential,
    };
  }
}

/// Contains the response to a successful <a>CreateUser</a> request.
class CreateUserResponse {
  /// A structure with details about the new IAM user.
  final User? user;

  CreateUserResponse({
    this.user,
  });
  factory CreateUserResponse.fromXml(_s.XmlElement elem) {
    return CreateUserResponse(
      user: _s.extractXmlChild(elem, 'User')?.let(User.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

/// Contains the response to a successful <a>CreateVirtualMFADevice</a> request.
class CreateVirtualMFADeviceResponse {
  /// A structure containing details about the new virtual MFA device.
  final VirtualMFADevice virtualMFADevice;

  CreateVirtualMFADeviceResponse({
    required this.virtualMFADevice,
  });
  factory CreateVirtualMFADeviceResponse.fromXml(_s.XmlElement elem) {
    return CreateVirtualMFADeviceResponse(
      virtualMFADevice: VirtualMFADevice.fromXml(
          _s.extractXmlChild(elem, 'VirtualMFADevice')!),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualMFADevice = this.virtualMFADevice;
    return {
      'VirtualMFADevice': virtualMFADevice,
    };
  }
}

class DeleteServiceLinkedRoleResponse {
  /// The deletion task identifier that you can use to check the status of the
  /// deletion. This identifier is returned in the format
  /// <code>task/aws-service-role/&lt;service-principal-name&gt;/&lt;role-name&gt;/&lt;task-uuid&gt;</code>.
  final String deletionTaskId;

  DeleteServiceLinkedRoleResponse({
    required this.deletionTaskId,
  });
  factory DeleteServiceLinkedRoleResponse.fromXml(_s.XmlElement elem) {
    return DeleteServiceLinkedRoleResponse(
      deletionTaskId: _s.extractXmlStringValue(elem, 'DeletionTaskId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionTaskId = this.deletionTaskId;
    return {
      'DeletionTaskId': deletionTaskId,
    };
  }
}

/// The reason that the service-linked role deletion failed.
///
/// This data type is used as a response element in the
/// <a>GetServiceLinkedRoleDeletionStatus</a> operation.
class DeletionTaskFailureReasonType {
  /// A short description of the reason that the service-linked role deletion
  /// failed.
  final String? reason;

  /// A list of objects that contains details about the service-linked role
  /// deletion failure, if that information is returned by the service. If the
  /// service-linked role has active sessions or if any resources that were used
  /// by the role have not been deleted from the linked service, the role can't be
  /// deleted. This parameter includes a list of the resources that are associated
  /// with the role and the Region in which the resources are being used.
  final List<RoleUsageType>? roleUsageList;

  DeletionTaskFailureReasonType({
    this.reason,
    this.roleUsageList,
  });
  factory DeletionTaskFailureReasonType.fromXml(_s.XmlElement elem) {
    return DeletionTaskFailureReasonType(
      reason: _s.extractXmlStringValue(elem, 'Reason'),
      roleUsageList: _s.extractXmlChild(elem, 'RoleUsageList')?.let((elem) =>
          elem.findElements('member').map(RoleUsageType.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final roleUsageList = this.roleUsageList;
    return {
      if (reason != null) 'Reason': reason,
      if (roleUsageList != null) 'RoleUsageList': roleUsageList,
    };
  }
}

enum DeletionTaskStatusType {
  succeeded,
  inProgress,
  failed,
  notStarted,
}

extension DeletionTaskStatusTypeValueExtension on DeletionTaskStatusType {
  String toValue() {
    switch (this) {
      case DeletionTaskStatusType.succeeded:
        return 'SUCCEEDED';
      case DeletionTaskStatusType.inProgress:
        return 'IN_PROGRESS';
      case DeletionTaskStatusType.failed:
        return 'FAILED';
      case DeletionTaskStatusType.notStarted:
        return 'NOT_STARTED';
    }
  }
}

extension DeletionTaskStatusTypeFromString on String {
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
    throw Exception('$this is not known in enum DeletionTaskStatusType');
  }
}

/// An object that contains details about when the IAM entities (users or roles)
/// were last used in an attempt to access the specified Amazon Web Services
/// service.
///
/// This data type is a response element in the
/// <a>GetServiceLastAccessedDetailsWithEntities</a> operation.
class EntityDetails {
  /// The <code>EntityInfo</code> object that contains details about the entity
  /// (user or role).
  final EntityInfo entityInfo;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the authenticated entity last attempted to access
  /// Amazon Web Services. Amazon Web Services does not report unauthenticated
  /// requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final DateTime? lastAuthenticated;

  EntityDetails({
    required this.entityInfo,
    this.lastAuthenticated,
  });
  factory EntityDetails.fromXml(_s.XmlElement elem) {
    return EntityDetails(
      entityInfo: EntityInfo.fromXml(_s.extractXmlChild(elem, 'EntityInfo')!),
      lastAuthenticated: _s.extractXmlDateTimeValue(elem, 'LastAuthenticated'),
    );
  }

  Map<String, dynamic> toJson() {
    final entityInfo = this.entityInfo;
    final lastAuthenticated = this.lastAuthenticated;
    return {
      'EntityInfo': entityInfo,
      if (lastAuthenticated != null)
        'LastAuthenticated': iso8601ToJson(lastAuthenticated),
    };
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? path;

  EntityInfo({
    required this.arn,
    required this.id,
    required this.name,
    required this.type,
    this.path,
  });
  factory EntityInfo.fromXml(_s.XmlElement elem) {
    return EntityInfo(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      name: _s.extractXmlStringValue(elem, 'Name')!,
      type: _s.extractXmlStringValue(elem, 'Type')!.toPolicyOwnerEntityType(),
      path: _s.extractXmlStringValue(elem, 'Path'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final type = this.type;
    final path = this.path;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      'Type': type.toValue(),
      if (path != null) 'Path': path,
    };
  }
}

enum EntityType {
  user,
  role,
  group,
  localManagedPolicy,
  awsManagedPolicy,
}

extension EntityTypeValueExtension on EntityType {
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
  }
}

extension EntityTypeFromString on String {
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
    throw Exception('$this is not known in enum EntityType');
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
    required this.code,
    required this.message,
  });
  factory ErrorDetails.fromXml(_s.XmlElement elem) {
    return ErrorDetails(
      code: _s.extractXmlStringValue(elem, 'Code')!,
      message: _s.extractXmlStringValue(elem, 'Message')!,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'Code': code,
      'Message': message,
    };
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
  /// When you make a cross-account request, Amazon Web Services evaluates the
  /// request in the trusting account and the trusted account. The request is
  /// allowed only if both evaluations return <code>true</code>. For more
  /// information about how policies are evaluated, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-basics">Evaluating
  /// policies within a single account</a>.
  ///
  /// If an Organizations SCP included in the evaluation denies access, the
  /// simulation ends. In this case, policy evaluation does not proceed any
  /// further and this parameter is not returned.
  final Map<String, PolicyEvaluationDecisionType>? evalDecisionDetails;

  /// The ARN of the resource that the indicated API operation was tested on.
  final String? evalResourceName;

  /// A list of the statements in the input policies that determine the result for
  /// this scenario. Remember that even if multiple statements allow the operation
  /// on the resource, if only one statement denies that operation, then the
  /// explicit deny overrides any allow. In addition, the deny statement is the
  /// only entry included in the result.
  final List<Statement>? matchedStatements;

  /// A list of context keys that are required by the included input policies but
  /// that were not provided by one of the input parameters. This list is used
  /// when the resource in a simulation is "*", either explicitly, or when the
  /// <code>ResourceArns</code> parameter blank. If you include a list of
  /// resources, then any missing context values are instead included under the
  /// <code>ResourceSpecificResults</code> section. To discover the context keys
  /// used by a set of policies, you can call <a>GetContextKeysForCustomPolicy</a>
  /// or <a>GetContextKeysForPrincipalPolicy</a>.
  final List<String>? missingContextValues;

  /// A structure that details how Organizations and its service control policies
  /// affect the results of the simulation. Only applies if the simulated user's
  /// account is part of an organization.
  final OrganizationsDecisionDetail? organizationsDecisionDetail;

  /// Contains information about the effect that a permissions boundary has on a
  /// policy simulation when the boundary is applied to an IAM entity.
  final PermissionsBoundaryDecisionDetail? permissionsBoundaryDecisionDetail;

  /// The individual results of the simulation of the API operation specified in
  /// EvalActionName on each resource.
  final List<ResourceSpecificResult>? resourceSpecificResults;

  EvaluationResult({
    required this.evalActionName,
    required this.evalDecision,
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
      evalActionName: _s.extractXmlStringValue(elem, 'EvalActionName')!,
      evalDecision: _s
          .extractXmlStringValue(elem, 'EvalDecision')!
          .toPolicyEvaluationDecisionType(),
      evalDecisionDetails: Map.fromEntries(
        elem.getElement('EvalDecisionDetails')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s
                        .extractXmlStringValue(c, 'value')!
                        .toPolicyEvaluationDecisionType(),
                  ),
                ) ??
            {},
      ),
      evalResourceName: _s.extractXmlStringValue(elem, 'EvalResourceName'),
      matchedStatements: _s.extractXmlChild(elem, 'MatchedStatements')?.let(
          (elem) =>
              elem.findElements('member').map(Statement.fromXml).toList()),
      missingContextValues: _s
          .extractXmlChild(elem, 'MissingContextValues')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      organizationsDecisionDetail: _s
          .extractXmlChild(elem, 'OrganizationsDecisionDetail')
          ?.let(OrganizationsDecisionDetail.fromXml),
      permissionsBoundaryDecisionDetail: _s
          .extractXmlChild(elem, 'PermissionsBoundaryDecisionDetail')
          ?.let(PermissionsBoundaryDecisionDetail.fromXml),
      resourceSpecificResults: _s
          .extractXmlChild(elem, 'ResourceSpecificResults')
          ?.let((elem) => elem
              .findElements('member')
              .map(ResourceSpecificResult.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final evalActionName = this.evalActionName;
    final evalDecision = this.evalDecision;
    final evalDecisionDetails = this.evalDecisionDetails;
    final evalResourceName = this.evalResourceName;
    final matchedStatements = this.matchedStatements;
    final missingContextValues = this.missingContextValues;
    final organizationsDecisionDetail = this.organizationsDecisionDetail;
    final permissionsBoundaryDecisionDetail =
        this.permissionsBoundaryDecisionDetail;
    final resourceSpecificResults = this.resourceSpecificResults;
    return {
      'EvalActionName': evalActionName,
      'EvalDecision': evalDecision.toValue(),
      if (evalDecisionDetails != null)
        'EvalDecisionDetails':
            evalDecisionDetails.map((k, e) => MapEntry(k, e.toValue())),
      if (evalResourceName != null) 'EvalResourceName': evalResourceName,
      if (matchedStatements != null) 'MatchedStatements': matchedStatements,
      if (missingContextValues != null)
        'MissingContextValues': missingContextValues,
      if (organizationsDecisionDetail != null)
        'OrganizationsDecisionDetail': organizationsDecisionDetail,
      if (permissionsBoundaryDecisionDetail != null)
        'PermissionsBoundaryDecisionDetail': permissionsBoundaryDecisionDetail,
      if (resourceSpecificResults != null)
        'ResourceSpecificResults': resourceSpecificResults,
    };
  }
}

/// Contains the response to a successful <a>GenerateCredentialReport</a>
/// request.
class GenerateCredentialReportResponse {
  /// Information about the credential report.
  final String? description;

  /// Information about the state of the credential report.
  final ReportStateType? state;

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

  Map<String, dynamic> toJson() {
    final description = this.description;
    final state = this.state;
    return {
      if (description != null) 'Description': description,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class GenerateOrganizationsAccessReportResponse {
  /// The job identifier that you can use in the
  /// <a>GetOrganizationsAccessReport</a> operation.
  final String? jobId;

  GenerateOrganizationsAccessReportResponse({
    this.jobId,
  });
  factory GenerateOrganizationsAccessReportResponse.fromXml(
      _s.XmlElement elem) {
    return GenerateOrganizationsAccessReportResponse(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
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
  final String? jobId;

  GenerateServiceLastAccessedDetailsResponse({
    this.jobId,
  });
  factory GenerateServiceLastAccessedDetailsResponse.fromXml(
      _s.XmlElement elem) {
    return GenerateServiceLastAccessedDetailsResponse(
      jobId: _s.extractXmlStringValue(elem, 'JobId'),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

/// Contains the response to a successful <a>GetAccessKeyLastUsed</a> request.
/// It is also returned as a member of the <a>AccessKeyMetaData</a> structure
/// returned by the <a>ListAccessKeys</a> action.
class GetAccessKeyLastUsedResponse {
  /// Contains information about the last time the access key was used.
  final AccessKeyLastUsed? accessKeyLastUsed;

  /// The name of the IAM user that owns this access key.
  /// <p/>
  final String? userName;

  GetAccessKeyLastUsedResponse({
    this.accessKeyLastUsed,
    this.userName,
  });
  factory GetAccessKeyLastUsedResponse.fromXml(_s.XmlElement elem) {
    return GetAccessKeyLastUsedResponse(
      accessKeyLastUsed: _s
          .extractXmlChild(elem, 'AccessKeyLastUsed')
          ?.let(AccessKeyLastUsed.fromXml),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyLastUsed = this.accessKeyLastUsed;
    final userName = this.userName;
    return {
      if (accessKeyLastUsed != null) 'AccessKeyLastUsed': accessKeyLastUsed,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Contains the response to a successful <a>GetAccountAuthorizationDetails</a>
/// request.
class GetAccountAuthorizationDetailsResponse {
  /// A list containing information about IAM groups.
  final List<GroupDetail>? groupDetailList;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  /// A list containing information about managed policies.
  final List<ManagedPolicyDetail>? policies;

  /// A list containing information about IAM roles.
  final List<RoleDetail>? roleDetailList;

  /// A list containing information about IAM users.
  final List<UserDetail>? userDetailList;

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
          (elem) =>
              elem.findElements('member').map(GroupDetail.fromXml).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      policies: _s.extractXmlChild(elem, 'Policies')?.let((elem) => elem
          .findElements('member')
          .map(ManagedPolicyDetail.fromXml)
          .toList()),
      roleDetailList: _s.extractXmlChild(elem, 'RoleDetailList')?.let((elem) =>
          elem.findElements('member').map(RoleDetail.fromXml).toList()),
      userDetailList: _s.extractXmlChild(elem, 'UserDetailList')?.let((elem) =>
          elem.findElements('member').map(UserDetail.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final groupDetailList = this.groupDetailList;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final policies = this.policies;
    final roleDetailList = this.roleDetailList;
    final userDetailList = this.userDetailList;
    return {
      if (groupDetailList != null) 'GroupDetailList': groupDetailList,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
      if (policies != null) 'Policies': policies,
      if (roleDetailList != null) 'RoleDetailList': roleDetailList,
      if (userDetailList != null) 'UserDetailList': userDetailList,
    };
  }
}

/// Contains the response to a successful <a>GetAccountPasswordPolicy</a>
/// request.
class GetAccountPasswordPolicyResponse {
  /// A structure that contains details about the account's password policy.
  final PasswordPolicy passwordPolicy;

  GetAccountPasswordPolicyResponse({
    required this.passwordPolicy,
  });
  factory GetAccountPasswordPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetAccountPasswordPolicyResponse(
      passwordPolicy:
          PasswordPolicy.fromXml(_s.extractXmlChild(elem, 'PasswordPolicy')!),
    );
  }

  Map<String, dynamic> toJson() {
    final passwordPolicy = this.passwordPolicy;
    return {
      'PasswordPolicy': passwordPolicy,
    };
  }
}

/// Contains the response to a successful <a>GetAccountSummary</a> request.
class GetAccountSummaryResponse {
  /// A set of key–value pairs containing information about IAM entity usage and
  /// IAM quotas.
  final Map<SummaryKeyType, int>? summaryMap;

  GetAccountSummaryResponse({
    this.summaryMap,
  });
  factory GetAccountSummaryResponse.fromXml(_s.XmlElement elem) {
    return GetAccountSummaryResponse(
      summaryMap: Map.fromEntries(
        elem.getElement('SummaryMap')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!.toSummaryKeyType(),
                    _s.extractXmlIntValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final summaryMap = this.summaryMap;
    return {
      if (summaryMap != null)
        'SummaryMap': summaryMap.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Contains the response to a successful
/// <a>GetContextKeysForPrincipalPolicy</a> or
/// <a>GetContextKeysForCustomPolicy</a> request.
class GetContextKeysForPolicyResponse {
  /// The list of context keys that are referenced in the input policies.
  final List<String>? contextKeyNames;

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

  Map<String, dynamic> toJson() {
    final contextKeyNames = this.contextKeyNames;
    return {
      if (contextKeyNames != null) 'ContextKeyNames': contextKeyNames,
    };
  }
}

/// Contains the response to a successful <a>GetCredentialReport</a> request.
class GetCredentialReportResponse {
  /// Contains the credential report. The report is Base64-encoded.
  final Uint8List? content;

  /// The date and time when the credential report was created, in <a
  /// href="http://www.iso.org/iso/iso8601">ISO 8601 date-time format</a>.
  final DateTime? generatedTime;

  /// The format (MIME type) of the credential report.
  final ReportFormatType? reportFormat;

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

  Map<String, dynamic> toJson() {
    final content = this.content;
    final generatedTime = this.generatedTime;
    final reportFormat = this.reportFormat;
    return {
      if (content != null) 'Content': base64Encode(content),
      if (generatedTime != null) 'GeneratedTime': iso8601ToJson(generatedTime),
      if (reportFormat != null) 'ReportFormat': reportFormat.toValue(),
    };
  }
}

/// Contains the response to a successful <a>GetGroupPolicy</a> request.
class GetGroupPolicyResponse {
  /// The group the policy is associated with.
  final String groupName;

  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using CloudFormation templates can be formatted in YAML. CloudFormation
  /// always converts a YAML policy to JSON format before submitting it to IAM.
  final String policyDocument;

  /// The name of the policy.
  final String policyName;

  GetGroupPolicyResponse({
    required this.groupName,
    required this.policyDocument,
    required this.policyName,
  });
  factory GetGroupPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetGroupPolicyResponse(
      groupName: _s.extractXmlStringValue(elem, 'GroupName')!,
      policyDocument: _s.extractXmlStringValue(elem, 'PolicyDocument')!,
      policyName: _s.extractXmlStringValue(elem, 'PolicyName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    return {
      'GroupName': groupName,
      'PolicyDocument': policyDocument,
      'PolicyName': policyName,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  GetGroupResponse({
    required this.group,
    required this.users,
    this.isTruncated,
    this.marker,
  });
  factory GetGroupResponse.fromXml(_s.XmlElement elem) {
    return GetGroupResponse(
      group: Group.fromXml(_s.extractXmlChild(elem, 'Group')!),
      users: _s
          .extractXmlChild(elem, 'Users')!
          .findElements('member')
          .map(User.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final users = this.users;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Group': group,
      'Users': users,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the response to a successful <a>GetInstanceProfile</a> request.
class GetInstanceProfileResponse {
  /// A structure containing details about the instance profile.
  final InstanceProfile instanceProfile;

  GetInstanceProfileResponse({
    required this.instanceProfile,
  });
  factory GetInstanceProfileResponse.fromXml(_s.XmlElement elem) {
    return GetInstanceProfileResponse(
      instanceProfile:
          InstanceProfile.fromXml(_s.extractXmlChild(elem, 'InstanceProfile')!),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfile = this.instanceProfile;
    return {
      'InstanceProfile': instanceProfile,
    };
  }
}

/// Contains the response to a successful <a>GetLoginProfile</a> request.
class GetLoginProfileResponse {
  /// A structure containing the user name and the profile creation date for the
  /// user.
  final LoginProfile loginProfile;

  GetLoginProfileResponse({
    required this.loginProfile,
  });
  factory GetLoginProfileResponse.fromXml(_s.XmlElement elem) {
    return GetLoginProfileResponse(
      loginProfile:
          LoginProfile.fromXml(_s.extractXmlChild(elem, 'LoginProfile')!),
    );
  }

  Map<String, dynamic> toJson() {
    final loginProfile = this.loginProfile;
    return {
      'LoginProfile': loginProfile,
    };
  }
}

class GetMFADeviceResponse {
  /// Serial number that uniquely identifies the MFA device. For this API, we only
  /// accept FIDO security key <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference-arns.html">ARNs</a>.
  final String serialNumber;

  /// The certifications of a specified user's MFA device. We currently provide
  /// FIPS-140-2, FIPS-140-3, and FIDO certification levels obtained from <a
  /// href="https://fidoalliance.org/metadata/"> FIDO Alliance Metadata Service
  /// (MDS)</a>.
  final Map<String, String>? certifications;

  /// The date that a specified user's MFA device was first enabled.
  final DateTime? enableDate;

  /// The friendly name identifying the user.
  final String? userName;

  GetMFADeviceResponse({
    required this.serialNumber,
    this.certifications,
    this.enableDate,
    this.userName,
  });
  factory GetMFADeviceResponse.fromXml(_s.XmlElement elem) {
    return GetMFADeviceResponse(
      serialNumber: _s.extractXmlStringValue(elem, 'SerialNumber')!,
      certifications: Map.fromEntries(
        elem.getElement('Certifications')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s.extractXmlStringValue(c, 'value')!,
                  ),
                ) ??
            {},
      ),
      enableDate: _s.extractXmlDateTimeValue(elem, 'EnableDate'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
    );
  }

  Map<String, dynamic> toJson() {
    final serialNumber = this.serialNumber;
    final certifications = this.certifications;
    final enableDate = this.enableDate;
    final userName = this.userName;
    return {
      'SerialNumber': serialNumber,
      if (certifications != null) 'Certifications': certifications,
      if (enableDate != null) 'EnableDate': iso8601ToJson(enableDate),
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Contains the response to a successful <a>GetOpenIDConnectProvider</a>
/// request.
class GetOpenIDConnectProviderResponse {
  /// A list of client IDs (also known as audiences) that are associated with the
  /// specified IAM OIDC provider resource object. For more information, see
  /// <a>CreateOpenIDConnectProvider</a>.
  final List<String>? clientIDList;

  /// The date and time when the IAM OIDC provider resource object was created in
  /// the Amazon Web Services account.
  final DateTime? createDate;

  /// A list of tags that are attached to the specified IAM OIDC provider. The
  /// returned list of tags is sorted by tag key. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  /// A list of certificate thumbprints that are associated with the specified IAM
  /// OIDC provider resource object. For more information, see
  /// <a>CreateOpenIDConnectProvider</a>.
  final List<String>? thumbprintList;

  /// The URL that the IAM OIDC provider resource object is associated with. For
  /// more information, see <a>CreateOpenIDConnectProvider</a>.
  final String? url;

  GetOpenIDConnectProviderResponse({
    this.clientIDList,
    this.createDate,
    this.tags,
    this.thumbprintList,
    this.url,
  });
  factory GetOpenIDConnectProviderResponse.fromXml(_s.XmlElement elem) {
    return GetOpenIDConnectProviderResponse(
      clientIDList: _s
          .extractXmlChild(elem, 'ClientIDList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
      thumbprintList: _s
          .extractXmlChild(elem, 'ThumbprintList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      url: _s.extractXmlStringValue(elem, 'Url'),
    );
  }

  Map<String, dynamic> toJson() {
    final clientIDList = this.clientIDList;
    final createDate = this.createDate;
    final tags = this.tags;
    final thumbprintList = this.thumbprintList;
    final url = this.url;
    return {
      if (clientIDList != null) 'ClientIDList': clientIDList,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (tags != null) 'Tags': tags,
      if (thumbprintList != null) 'ThumbprintList': thumbprintList,
      if (url != null) 'Url': url,
    };
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
  final List<AccessDetail>? accessDetails;
  final ErrorDetails? errorDetails;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the generated report job was completed or failed.
  ///
  /// This field is null if the job is still in progress, as indicated by a job
  /// status value of <code>IN_PROGRESS</code>.
  final DateTime? jobCompletionDate;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  /// The number of services that the applicable SCPs allow account principals to
  /// access.
  final int? numberOfServicesAccessible;

  /// The number of services that account principals are allowed but did not
  /// attempt to access.
  final int? numberOfServicesNotAccessed;

  GetOrganizationsAccessReportResponse({
    required this.jobCreationDate,
    required this.jobStatus,
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
      jobCreationDate: _s.extractXmlDateTimeValue(elem, 'JobCreationDate')!,
      jobStatus: _s.extractXmlStringValue(elem, 'JobStatus')!.toJobStatusType(),
      accessDetails: _s.extractXmlChild(elem, 'AccessDetails')?.let((elem) =>
          elem.findElements('member').map(AccessDetail.fromXml).toList()),
      errorDetails:
          _s.extractXmlChild(elem, 'ErrorDetails')?.let(ErrorDetails.fromXml),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      jobCompletionDate: _s.extractXmlDateTimeValue(elem, 'JobCompletionDate'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      numberOfServicesAccessible:
          _s.extractXmlIntValue(elem, 'NumberOfServicesAccessible'),
      numberOfServicesNotAccessed:
          _s.extractXmlIntValue(elem, 'NumberOfServicesNotAccessed'),
    );
  }

  Map<String, dynamic> toJson() {
    final jobCreationDate = this.jobCreationDate;
    final jobStatus = this.jobStatus;
    final accessDetails = this.accessDetails;
    final errorDetails = this.errorDetails;
    final isTruncated = this.isTruncated;
    final jobCompletionDate = this.jobCompletionDate;
    final marker = this.marker;
    final numberOfServicesAccessible = this.numberOfServicesAccessible;
    final numberOfServicesNotAccessed = this.numberOfServicesNotAccessed;
    return {
      'JobCreationDate': iso8601ToJson(jobCreationDate),
      'JobStatus': jobStatus.toValue(),
      if (accessDetails != null) 'AccessDetails': accessDetails,
      if (errorDetails != null) 'ErrorDetails': errorDetails,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (jobCompletionDate != null)
        'JobCompletionDate': iso8601ToJson(jobCompletionDate),
      if (marker != null) 'Marker': marker,
      if (numberOfServicesAccessible != null)
        'NumberOfServicesAccessible': numberOfServicesAccessible,
      if (numberOfServicesNotAccessed != null)
        'NumberOfServicesNotAccessed': numberOfServicesNotAccessed,
    };
  }
}

/// Contains the response to a successful <a>GetPolicy</a> request.
class GetPolicyResponse {
  /// A structure containing details about the policy.
  final Policy? policy;

  GetPolicyResponse({
    this.policy,
  });
  factory GetPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetPolicyResponse(
      policy: _s.extractXmlChild(elem, 'Policy')?.let(Policy.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

/// Contains the response to a successful <a>GetPolicyVersion</a> request.
class GetPolicyVersionResponse {
  /// A structure containing details about the policy version.
  final PolicyVersion? policyVersion;

  GetPolicyVersionResponse({
    this.policyVersion,
  });
  factory GetPolicyVersionResponse.fromXml(_s.XmlElement elem) {
    return GetPolicyVersionResponse(
      policyVersion:
          _s.extractXmlChild(elem, 'PolicyVersion')?.let(PolicyVersion.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final policyVersion = this.policyVersion;
    return {
      if (policyVersion != null) 'PolicyVersion': policyVersion,
    };
  }
}

/// Contains the response to a successful <a>GetRolePolicy</a> request.
class GetRolePolicyResponse {
  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using CloudFormation templates can be formatted in YAML. CloudFormation
  /// always converts a YAML policy to JSON format before submitting it to IAM.
  final String policyDocument;

  /// The name of the policy.
  final String policyName;

  /// The role the policy is associated with.
  final String roleName;

  GetRolePolicyResponse({
    required this.policyDocument,
    required this.policyName,
    required this.roleName,
  });
  factory GetRolePolicyResponse.fromXml(_s.XmlElement elem) {
    return GetRolePolicyResponse(
      policyDocument: _s.extractXmlStringValue(elem, 'PolicyDocument')!,
      policyName: _s.extractXmlStringValue(elem, 'PolicyName')!,
      roleName: _s.extractXmlStringValue(elem, 'RoleName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final roleName = this.roleName;
    return {
      'PolicyDocument': policyDocument,
      'PolicyName': policyName,
      'RoleName': roleName,
    };
  }
}

/// Contains the response to a successful <a>GetRole</a> request.
class GetRoleResponse {
  /// A structure containing details about the IAM role.
  final Role role;

  GetRoleResponse({
    required this.role,
  });
  factory GetRoleResponse.fromXml(_s.XmlElement elem) {
    return GetRoleResponse(
      role: Role.fromXml(_s.extractXmlChild(elem, 'Role')!),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      'Role': role,
    };
  }
}

/// Contains the response to a successful <a>GetSAMLProvider</a> request.
class GetSAMLProviderResponse {
  /// The date and time when the SAML provider was created.
  final DateTime? createDate;

  /// The XML metadata document that includes information about an identity
  /// provider.
  final String? sAMLMetadataDocument;

  /// A list of tags that are attached to the specified IAM SAML provider. The
  /// returned list of tags is sorted by tag key. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  /// The expiration date and time for the SAML provider.
  final DateTime? validUntil;

  GetSAMLProviderResponse({
    this.createDate,
    this.sAMLMetadataDocument,
    this.tags,
    this.validUntil,
  });
  factory GetSAMLProviderResponse.fromXml(_s.XmlElement elem) {
    return GetSAMLProviderResponse(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      sAMLMetadataDocument:
          _s.extractXmlStringValue(elem, 'SAMLMetadataDocument'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
      validUntil: _s.extractXmlDateTimeValue(elem, 'ValidUntil'),
    );
  }

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final sAMLMetadataDocument = this.sAMLMetadataDocument;
    final tags = this.tags;
    final validUntil = this.validUntil;
    return {
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (sAMLMetadataDocument != null)
        'SAMLMetadataDocument': sAMLMetadataDocument,
      if (tags != null) 'Tags': tags,
      if (validUntil != null) 'ValidUntil': iso8601ToJson(validUntil),
    };
  }
}

/// Contains the response to a successful <a>GetSSHPublicKey</a> request.
class GetSSHPublicKeyResponse {
  /// A structure containing details about the SSH public key.
  final SSHPublicKey? sSHPublicKey;

  GetSSHPublicKeyResponse({
    this.sSHPublicKey,
  });
  factory GetSSHPublicKeyResponse.fromXml(_s.XmlElement elem) {
    return GetSSHPublicKeyResponse(
      sSHPublicKey:
          _s.extractXmlChild(elem, 'SSHPublicKey')?.let(SSHPublicKey.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final sSHPublicKey = this.sSHPublicKey;
    return {
      if (sSHPublicKey != null) 'SSHPublicKey': sSHPublicKey,
    };
  }
}

/// Contains the response to a successful <a>GetServerCertificate</a> request.
class GetServerCertificateResponse {
  /// A structure containing details about the server certificate.
  final ServerCertificate serverCertificate;

  GetServerCertificateResponse({
    required this.serverCertificate,
  });
  factory GetServerCertificateResponse.fromXml(_s.XmlElement elem) {
    return GetServerCertificateResponse(
      serverCertificate: ServerCertificate.fromXml(
          _s.extractXmlChild(elem, 'ServerCertificate')!),
    );
  }

  Map<String, dynamic> toJson() {
    final serverCertificate = this.serverCertificate;
    return {
      'ServerCertificate': serverCertificate,
    };
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
  final ErrorDetails? error;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// The type of job. Service jobs return information about when each service was
  /// last accessed. Action jobs also include information about when tracked
  /// actions within the service were last accessed.
  final AccessAdvisorUsageGranularityType? jobType;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  GetServiceLastAccessedDetailsResponse({
    required this.jobCompletionDate,
    required this.jobCreationDate,
    required this.jobStatus,
    required this.servicesLastAccessed,
    this.error,
    this.isTruncated,
    this.jobType,
    this.marker,
  });
  factory GetServiceLastAccessedDetailsResponse.fromXml(_s.XmlElement elem) {
    return GetServiceLastAccessedDetailsResponse(
      jobCompletionDate: _s.extractXmlDateTimeValue(elem, 'JobCompletionDate')!,
      jobCreationDate: _s.extractXmlDateTimeValue(elem, 'JobCreationDate')!,
      jobStatus: _s.extractXmlStringValue(elem, 'JobStatus')!.toJobStatusType(),
      servicesLastAccessed: _s
          .extractXmlChild(elem, 'ServicesLastAccessed')!
          .findElements('member')
          .map(ServiceLastAccessed.fromXml)
          .toList(),
      error: _s.extractXmlChild(elem, 'Error')?.let(ErrorDetails.fromXml),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      jobType: _s
          .extractXmlStringValue(elem, 'JobType')
          ?.toAccessAdvisorUsageGranularityType(),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final jobCompletionDate = this.jobCompletionDate;
    final jobCreationDate = this.jobCreationDate;
    final jobStatus = this.jobStatus;
    final servicesLastAccessed = this.servicesLastAccessed;
    final error = this.error;
    final isTruncated = this.isTruncated;
    final jobType = this.jobType;
    final marker = this.marker;
    return {
      'JobCompletionDate': iso8601ToJson(jobCompletionDate),
      'JobCreationDate': iso8601ToJson(jobCreationDate),
      'JobStatus': jobStatus.toValue(),
      'ServicesLastAccessed': servicesLastAccessed,
      if (error != null) 'Error': error,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (jobType != null) 'JobType': jobType.toValue(),
      if (marker != null) 'Marker': marker,
    };
  }
}

class GetServiceLastAccessedDetailsWithEntitiesResponse {
  /// An <code>EntityDetailsList</code> object that contains details about when an
  /// IAM entity (user or role) used group or policy permissions in an attempt to
  /// access the specified Amazon Web Services service.
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
  final ErrorDetails? error;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  GetServiceLastAccessedDetailsWithEntitiesResponse({
    required this.entityDetailsList,
    required this.jobCompletionDate,
    required this.jobCreationDate,
    required this.jobStatus,
    this.error,
    this.isTruncated,
    this.marker,
  });
  factory GetServiceLastAccessedDetailsWithEntitiesResponse.fromXml(
      _s.XmlElement elem) {
    return GetServiceLastAccessedDetailsWithEntitiesResponse(
      entityDetailsList: _s
          .extractXmlChild(elem, 'EntityDetailsList')!
          .findElements('member')
          .map(EntityDetails.fromXml)
          .toList(),
      jobCompletionDate: _s.extractXmlDateTimeValue(elem, 'JobCompletionDate')!,
      jobCreationDate: _s.extractXmlDateTimeValue(elem, 'JobCreationDate')!,
      jobStatus: _s.extractXmlStringValue(elem, 'JobStatus')!.toJobStatusType(),
      error: _s.extractXmlChild(elem, 'Error')?.let(ErrorDetails.fromXml),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final entityDetailsList = this.entityDetailsList;
    final jobCompletionDate = this.jobCompletionDate;
    final jobCreationDate = this.jobCreationDate;
    final jobStatus = this.jobStatus;
    final error = this.error;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'EntityDetailsList': entityDetailsList,
      'JobCompletionDate': iso8601ToJson(jobCompletionDate),
      'JobCreationDate': iso8601ToJson(jobCreationDate),
      'JobStatus': jobStatus.toValue(),
      if (error != null) 'Error': error,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class GetServiceLinkedRoleDeletionStatusResponse {
  /// The status of the deletion.
  final DeletionTaskStatusType status;

  /// An object that contains details about the reason the deletion failed.
  final DeletionTaskFailureReasonType? reason;

  GetServiceLinkedRoleDeletionStatusResponse({
    required this.status,
    this.reason,
  });
  factory GetServiceLinkedRoleDeletionStatusResponse.fromXml(
      _s.XmlElement elem) {
    return GetServiceLinkedRoleDeletionStatusResponse(
      status:
          _s.extractXmlStringValue(elem, 'Status')!.toDeletionTaskStatusType(),
      reason: _s
          .extractXmlChild(elem, 'Reason')
          ?.let(DeletionTaskFailureReasonType.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final reason = this.reason;
    return {
      'Status': status.toValue(),
      if (reason != null) 'Reason': reason,
    };
  }
}

/// Contains the response to a successful <a>GetUserPolicy</a> request.
class GetUserPolicyResponse {
  /// The policy document.
  ///
  /// IAM stores policies in JSON format. However, resources that were created
  /// using CloudFormation templates can be formatted in YAML. CloudFormation
  /// always converts a YAML policy to JSON format before submitting it to IAM.
  final String policyDocument;

  /// The name of the policy.
  final String policyName;

  /// The user the policy is associated with.
  final String userName;

  GetUserPolicyResponse({
    required this.policyDocument,
    required this.policyName,
    required this.userName,
  });
  factory GetUserPolicyResponse.fromXml(_s.XmlElement elem) {
    return GetUserPolicyResponse(
      policyDocument: _s.extractXmlStringValue(elem, 'PolicyDocument')!,
      policyName: _s.extractXmlStringValue(elem, 'PolicyName')!,
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final userName = this.userName;
    return {
      'PolicyDocument': policyDocument,
      'PolicyName': policyName,
      'UserName': userName,
    };
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
  /// credential report</a>, and returned by this operation. If users signed in
  /// during the affected time, the password last used date that is returned is
  /// the date the user last signed in before May 3, 2018. For users that signed
  /// in after May 23, 2018 14:08 PDT, the returned password last used date is
  /// accurate.
  ///
  /// You can use password last used information to identify unused credentials
  /// for deletion. For example, you might delete users who did not sign in to
  /// Amazon Web Services in the last 90 days. In cases like this, we recommend
  /// that you adjust your evaluation window to include dates after May 23, 2018.
  /// Alternatively, if your users use access keys to access Amazon Web Services
  /// programmatically you can refer to access key last used information because
  /// it is accurate for all dates.
  /// </important>
  final User user;

  GetUserResponse({
    required this.user,
  });
  factory GetUserResponse.fromXml(_s.XmlElement elem) {
    return GetUserResponse(
      user: User.fromXml(_s.extractXmlChild(elem, 'User')!),
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      'User': user,
    };
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the group was created.
  final DateTime createDate;

  /// The stable and unique string identifying the group. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String groupId;

  /// The friendly name that identifies the group.
  final String groupName;

  /// The path to the group. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  Group({
    required this.arn,
    required this.createDate,
    required this.groupId,
    required this.groupName,
    required this.path,
  });
  factory Group.fromXml(_s.XmlElement elem) {
    return Group(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate')!,
      groupId: _s.extractXmlStringValue(elem, 'GroupId')!,
      groupName: _s.extractXmlStringValue(elem, 'GroupName')!,
      path: _s.extractXmlStringValue(elem, 'Path')!,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final groupId = this.groupId;
    final groupName = this.groupName;
    final path = this.path;
    return {
      'Arn': arn,
      'CreateDate': iso8601ToJson(createDate),
      'GroupId': groupId,
      'GroupName': groupName,
      'Path': path,
    };
  }
}

/// Contains information about an IAM group, including all of the group's
/// policies.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class GroupDetail {
  final String? arn;

  /// A list of the managed policies attached to the group.
  final List<AttachedPolicy>? attachedManagedPolicies;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the group was created.
  final DateTime? createDate;

  /// The stable and unique string identifying the group. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? groupId;

  /// The friendly name that identifies the group.
  final String? groupName;

  /// A list of the inline policies embedded in the group.
  final List<PolicyDetail>? groupPolicyList;

  /// The path to the group. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? path;

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
          ?.let((elem) =>
              elem.findElements('member').map(AttachedPolicy.fromXml).toList()),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      groupId: _s.extractXmlStringValue(elem, 'GroupId'),
      groupName: _s.extractXmlStringValue(elem, 'GroupName'),
      groupPolicyList: _s.extractXmlChild(elem, 'GroupPolicyList')?.let(
          (elem) =>
              elem.findElements('member').map(PolicyDetail.fromXml).toList()),
      path: _s.extractXmlStringValue(elem, 'Path'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachedManagedPolicies = this.attachedManagedPolicies;
    final createDate = this.createDate;
    final groupId = this.groupId;
    final groupName = this.groupName;
    final groupPolicyList = this.groupPolicyList;
    final path = this.path;
    return {
      if (arn != null) 'Arn': arn,
      if (attachedManagedPolicies != null)
        'AttachedManagedPolicies': attachedManagedPolicies,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (groupId != null) 'GroupId': groupId,
      if (groupName != null) 'GroupName': groupName,
      if (groupPolicyList != null) 'GroupPolicyList': groupPolicyList,
      if (path != null) 'Path': path,
    };
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The date when the instance profile was created.
  final DateTime createDate;

  /// The stable and unique string identifying the instance profile. For more
  /// information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String instanceProfileId;

  /// The name identifying the instance profile.
  final String instanceProfileName;

  /// The path to the instance profile. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The role associated with the instance profile.
  final List<Role> roles;

  /// A list of tags that are attached to the instance profile. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  InstanceProfile({
    required this.arn,
    required this.createDate,
    required this.instanceProfileId,
    required this.instanceProfileName,
    required this.path,
    required this.roles,
    this.tags,
  });
  factory InstanceProfile.fromXml(_s.XmlElement elem) {
    return InstanceProfile(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate')!,
      instanceProfileId: _s.extractXmlStringValue(elem, 'InstanceProfileId')!,
      instanceProfileName:
          _s.extractXmlStringValue(elem, 'InstanceProfileName')!,
      path: _s.extractXmlStringValue(elem, 'Path')!,
      roles: _s
          .extractXmlChild(elem, 'Roles')!
          .findElements('member')
          .map(Role.fromXml)
          .toList(),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final instanceProfileId = this.instanceProfileId;
    final instanceProfileName = this.instanceProfileName;
    final path = this.path;
    final roles = this.roles;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreateDate': iso8601ToJson(createDate),
      'InstanceProfileId': instanceProfileId,
      'InstanceProfileName': instanceProfileName,
      'Path': path,
      'Roles': roles,
      if (tags != null) 'Tags': tags,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListAccessKeysResponse({
    required this.accessKeyMetadata,
    this.isTruncated,
    this.marker,
  });
  factory ListAccessKeysResponse.fromXml(_s.XmlElement elem) {
    return ListAccessKeysResponse(
      accessKeyMetadata: _s
          .extractXmlChild(elem, 'AccessKeyMetadata')!
          .findElements('member')
          .map(AccessKeyMetadata.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyMetadata = this.accessKeyMetadata;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'AccessKeyMetadata': accessKeyMetadata,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the response to a successful <a>ListAccountAliases</a> request.
class ListAccountAliasesResponse {
  /// A list of aliases associated with the account. Amazon Web Services supports
  /// only one alias per account.
  final List<String> accountAliases;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListAccountAliasesResponse({
    required this.accountAliases,
    this.isTruncated,
    this.marker,
  });
  factory ListAccountAliasesResponse.fromXml(_s.XmlElement elem) {
    return ListAccountAliasesResponse(
      accountAliases: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'AccountAliases')!, 'member'),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final accountAliases = this.accountAliases;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'AccountAliases': accountAliases,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the response to a successful <a>ListAttachedGroupPolicies</a>
/// request.
class ListAttachedGroupPoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy>? attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListAttachedGroupPoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  factory ListAttachedGroupPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListAttachedGroupPoliciesResponse(
      attachedPolicies: _s.extractXmlChild(elem, 'AttachedPolicies')?.let(
          (elem) =>
              elem.findElements('member').map(AttachedPolicy.fromXml).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final attachedPolicies = this.attachedPolicies;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      if (attachedPolicies != null) 'AttachedPolicies': attachedPolicies,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the response to a successful <a>ListAttachedRolePolicies</a>
/// request.
class ListAttachedRolePoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy>? attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListAttachedRolePoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  factory ListAttachedRolePoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListAttachedRolePoliciesResponse(
      attachedPolicies: _s.extractXmlChild(elem, 'AttachedPolicies')?.let(
          (elem) =>
              elem.findElements('member').map(AttachedPolicy.fromXml).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final attachedPolicies = this.attachedPolicies;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      if (attachedPolicies != null) 'AttachedPolicies': attachedPolicies,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the response to a successful <a>ListAttachedUserPolicies</a>
/// request.
class ListAttachedUserPoliciesResponse {
  /// A list of the attached policies.
  final List<AttachedPolicy>? attachedPolicies;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListAttachedUserPoliciesResponse({
    this.attachedPolicies,
    this.isTruncated,
    this.marker,
  });
  factory ListAttachedUserPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListAttachedUserPoliciesResponse(
      attachedPolicies: _s.extractXmlChild(elem, 'AttachedPolicies')?.let(
          (elem) =>
              elem.findElements('member').map(AttachedPolicy.fromXml).toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final attachedPolicies = this.attachedPolicies;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      if (attachedPolicies != null) 'AttachedPolicies': attachedPolicies,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  /// A list of IAM groups that the policy is attached to.
  final List<PolicyGroup>? policyGroups;

  /// A list of IAM roles that the policy is attached to.
  final List<PolicyRole>? policyRoles;

  /// A list of IAM users that the policy is attached to.
  final List<PolicyUser>? policyUsers;

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
      policyGroups: _s.extractXmlChild(elem, 'PolicyGroups')?.let((elem) =>
          elem.findElements('member').map(PolicyGroup.fromXml).toList()),
      policyRoles: _s.extractXmlChild(elem, 'PolicyRoles')?.let((elem) =>
          elem.findElements('member').map(PolicyRole.fromXml).toList()),
      policyUsers: _s.extractXmlChild(elem, 'PolicyUsers')?.let((elem) =>
          elem.findElements('member').map(PolicyUser.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final policyGroups = this.policyGroups;
    final policyRoles = this.policyRoles;
    final policyUsers = this.policyUsers;
    return {
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
      if (policyGroups != null) 'PolicyGroups': policyGroups,
      if (policyRoles != null) 'PolicyRoles': policyRoles,
      if (policyUsers != null) 'PolicyUsers': policyUsers,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListGroupPoliciesResponse({
    required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  factory ListGroupPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListGroupPoliciesResponse(
      policyNames: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'PolicyNames')!, 'member'),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final policyNames = this.policyNames;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'PolicyNames': policyNames,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListGroupsForUserResponse({
    required this.groups,
    this.isTruncated,
    this.marker,
  });
  factory ListGroupsForUserResponse.fromXml(_s.XmlElement elem) {
    return ListGroupsForUserResponse(
      groups: _s
          .extractXmlChild(elem, 'Groups')!
          .findElements('member')
          .map(Group.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Groups': groups,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListGroupsResponse({
    required this.groups,
    this.isTruncated,
    this.marker,
  });
  factory ListGroupsResponse.fromXml(_s.XmlElement elem) {
    return ListGroupsResponse(
      groups: _s
          .extractXmlChild(elem, 'Groups')!
          .findElements('member')
          .map(Group.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Groups': groups,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListInstanceProfileTagsResponse {
  /// The list of tags that are currently attached to the IAM instance profile.
  /// Each tag consists of a key name and an associated value. If no tags are
  /// attached to the specified resource, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListInstanceProfileTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListInstanceProfileTagsResponse.fromXml(_s.XmlElement elem) {
    return ListInstanceProfileTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListInstanceProfilesForRoleResponse({
    required this.instanceProfiles,
    this.isTruncated,
    this.marker,
  });
  factory ListInstanceProfilesForRoleResponse.fromXml(_s.XmlElement elem) {
    return ListInstanceProfilesForRoleResponse(
      instanceProfiles: _s
          .extractXmlChild(elem, 'InstanceProfiles')!
          .findElements('member')
          .map(InstanceProfile.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfiles = this.instanceProfiles;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'InstanceProfiles': instanceProfiles,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListInstanceProfilesResponse({
    required this.instanceProfiles,
    this.isTruncated,
    this.marker,
  });
  factory ListInstanceProfilesResponse.fromXml(_s.XmlElement elem) {
    return ListInstanceProfilesResponse(
      instanceProfiles: _s
          .extractXmlChild(elem, 'InstanceProfiles')!
          .findElements('member')
          .map(InstanceProfile.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceProfiles = this.instanceProfiles;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'InstanceProfiles': instanceProfiles,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListMFADeviceTagsResponse {
  /// The list of tags that are currently attached to the virtual MFA device. Each
  /// tag consists of a key name and an associated value. If no tags are attached
  /// to the specified resource, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListMFADeviceTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListMFADeviceTagsResponse.fromXml(_s.XmlElement elem) {
    return ListMFADeviceTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListMFADevicesResponse({
    required this.mFADevices,
    this.isTruncated,
    this.marker,
  });
  factory ListMFADevicesResponse.fromXml(_s.XmlElement elem) {
    return ListMFADevicesResponse(
      mFADevices: _s
          .extractXmlChild(elem, 'MFADevices')!
          .findElements('member')
          .map(MFADevice.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final mFADevices = this.mFADevices;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'MFADevices': mFADevices,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListOpenIDConnectProviderTagsResponse {
  /// The list of tags that are currently attached to the OpenID Connect (OIDC)
  /// identity provider. Each tag consists of a key name and an associated value.
  /// If no tags are attached to the specified resource, the response contains an
  /// empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListOpenIDConnectProviderTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListOpenIDConnectProviderTagsResponse.fromXml(_s.XmlElement elem) {
    return ListOpenIDConnectProviderTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the response to a successful <a>ListOpenIDConnectProviders</a>
/// request.
class ListOpenIDConnectProvidersResponse {
  /// The list of IAM OIDC provider resource objects defined in the Amazon Web
  /// Services account.
  final List<OpenIDConnectProviderListEntry>? openIDConnectProviderList;

  ListOpenIDConnectProvidersResponse({
    this.openIDConnectProviderList,
  });
  factory ListOpenIDConnectProvidersResponse.fromXml(_s.XmlElement elem) {
    return ListOpenIDConnectProvidersResponse(
      openIDConnectProviderList: _s
          .extractXmlChild(elem, 'OpenIDConnectProviderList')
          ?.let((elem) => elem
              .findElements('member')
              .map(OpenIDConnectProviderListEntry.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final openIDConnectProviderList = this.openIDConnectProviderList;
    return {
      if (openIDConnectProviderList != null)
        'OpenIDConnectProviderList': openIDConnectProviderList,
    };
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
  final List<PolicyGrantingServiceAccess>? policies;

  /// The namespace of the service that was accessed.
  ///
  /// To learn the service namespace of a service, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Actions,
  /// resources, and condition keys for Amazon Web Services services</a> in the
  /// <i>Service Authorization Reference</i>. Choose the name of the service to
  /// view details for that service. In the first paragraph, find the service
  /// prefix. For example, <code>(service prefix: a4b)</code>. For more
  /// information about service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">Amazon
  /// Web Services service namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? serviceNamespace;

  ListPoliciesGrantingServiceAccessEntry({
    this.policies,
    this.serviceNamespace,
  });
  factory ListPoliciesGrantingServiceAccessEntry.fromXml(_s.XmlElement elem) {
    return ListPoliciesGrantingServiceAccessEntry(
      policies: _s.extractXmlChild(elem, 'Policies')?.let((elem) => elem
          .findElements('member')
          .map(PolicyGrantingServiceAccess.fromXml)
          .toList()),
      serviceNamespace: _s.extractXmlStringValue(elem, 'ServiceNamespace'),
    );
  }

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    final serviceNamespace = this.serviceNamespace;
    return {
      if (policies != null) 'Policies': policies,
      if (serviceNamespace != null) 'ServiceNamespace': serviceNamespace,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListPoliciesGrantingServiceAccessResponse({
    required this.policiesGrantingServiceAccess,
    this.isTruncated,
    this.marker,
  });
  factory ListPoliciesGrantingServiceAccessResponse.fromXml(
      _s.XmlElement elem) {
    return ListPoliciesGrantingServiceAccessResponse(
      policiesGrantingServiceAccess: _s
          .extractXmlChild(elem, 'PoliciesGrantingServiceAccess')!
          .findElements('member')
          .map(ListPoliciesGrantingServiceAccessEntry.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final policiesGrantingServiceAccess = this.policiesGrantingServiceAccess;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'PoliciesGrantingServiceAccess': policiesGrantingServiceAccess,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  /// A list of policies.
  final List<Policy>? policies;

  ListPoliciesResponse({
    this.isTruncated,
    this.marker,
    this.policies,
  });
  factory ListPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListPoliciesResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      policies: _s.extractXmlChild(elem, 'Policies')?.let(
          (elem) => elem.findElements('member').map(Policy.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final policies = this.policies;
    return {
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
      if (policies != null) 'Policies': policies,
    };
  }
}

class ListPolicyTagsResponse {
  /// The list of tags that are currently attached to the IAM customer managed
  /// policy. Each tag consists of a key name and an associated value. If no tags
  /// are attached to the specified resource, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListPolicyTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListPolicyTagsResponse.fromXml(_s.XmlElement elem) {
    return ListPolicyTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  /// A list of policy versions.
  ///
  /// For more information about managed policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for managed policies</a> in the <i>IAM User Guide</i>.
  final List<PolicyVersion>? versions;

  ListPolicyVersionsResponse({
    this.isTruncated,
    this.marker,
    this.versions,
  });
  factory ListPolicyVersionsResponse.fromXml(_s.XmlElement elem) {
    return ListPolicyVersionsResponse(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      versions: _s.extractXmlChild(elem, 'Versions')?.let((elem) =>
          elem.findElements('member').map(PolicyVersion.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final versions = this.versions;
    return {
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
      if (versions != null) 'Versions': versions,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListRolePoliciesResponse({
    required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  factory ListRolePoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListRolePoliciesResponse(
      policyNames: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'PolicyNames')!, 'member'),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final policyNames = this.policyNames;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'PolicyNames': policyNames,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListRoleTagsResponse {
  /// The list of tags that are currently attached to the role. Each tag consists
  /// of a key name and an associated value. If no tags are attached to the
  /// specified resource, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListRoleTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListRoleTagsResponse.fromXml(_s.XmlElement elem) {
    return ListRoleTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListRolesResponse({
    required this.roles,
    this.isTruncated,
    this.marker,
  });
  factory ListRolesResponse.fromXml(_s.XmlElement elem) {
    return ListRolesResponse(
      roles: _s
          .extractXmlChild(elem, 'Roles')!
          .findElements('member')
          .map(Role.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final roles = this.roles;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Roles': roles,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListSAMLProviderTagsResponse {
  /// The list of tags that are currently attached to the Security Assertion
  /// Markup Language (SAML) identity provider. Each tag consists of a key name
  /// and an associated value. If no tags are attached to the specified resource,
  /// the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListSAMLProviderTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListSAMLProviderTagsResponse.fromXml(_s.XmlElement elem) {
    return ListSAMLProviderTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the response to a successful <a>ListSAMLProviders</a> request.
class ListSAMLProvidersResponse {
  /// The list of SAML provider resource objects defined in IAM for this Amazon
  /// Web Services account.
  final List<SAMLProviderListEntry>? sAMLProviderList;

  ListSAMLProvidersResponse({
    this.sAMLProviderList,
  });
  factory ListSAMLProvidersResponse.fromXml(_s.XmlElement elem) {
    return ListSAMLProvidersResponse(
      sAMLProviderList: _s.extractXmlChild(elem, 'SAMLProviderList')?.let(
          (elem) => elem
              .findElements('member')
              .map(SAMLProviderListEntry.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final sAMLProviderList = this.sAMLProviderList;
    return {
      if (sAMLProviderList != null) 'SAMLProviderList': sAMLProviderList,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  /// A list of the SSH public keys assigned to IAM user.
  final List<SSHPublicKeyMetadata>? sSHPublicKeys;

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
              .map(SSHPublicKeyMetadata.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final sSHPublicKeys = this.sSHPublicKeys;
    return {
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
      if (sSHPublicKeys != null) 'SSHPublicKeys': sSHPublicKeys,
    };
  }
}

class ListServerCertificateTagsResponse {
  /// The list of tags that are currently attached to the IAM server certificate.
  /// Each tag consists of a key name and an associated value. If no tags are
  /// attached to the specified resource, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListServerCertificateTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListServerCertificateTagsResponse.fromXml(_s.XmlElement elem) {
    return ListServerCertificateTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListServerCertificatesResponse({
    required this.serverCertificateMetadataList,
    this.isTruncated,
    this.marker,
  });
  factory ListServerCertificatesResponse.fromXml(_s.XmlElement elem) {
    return ListServerCertificatesResponse(
      serverCertificateMetadataList: _s
          .extractXmlChild(elem, 'ServerCertificateMetadataList')!
          .findElements('member')
          .map(ServerCertificateMetadata.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final serverCertificateMetadataList = this.serverCertificateMetadataList;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'ServerCertificateMetadataList': serverCertificateMetadataList,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListServiceSpecificCredentialsResponse {
  /// A list of structures that each contain details about a service-specific
  /// credential.
  final List<ServiceSpecificCredentialMetadata>? serviceSpecificCredentials;

  ListServiceSpecificCredentialsResponse({
    this.serviceSpecificCredentials,
  });
  factory ListServiceSpecificCredentialsResponse.fromXml(_s.XmlElement elem) {
    return ListServiceSpecificCredentialsResponse(
      serviceSpecificCredentials: _s
          .extractXmlChild(elem, 'ServiceSpecificCredentials')
          ?.let((elem) => elem
              .findElements('member')
              .map(ServiceSpecificCredentialMetadata.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSpecificCredentials = this.serviceSpecificCredentials;
    return {
      if (serviceSpecificCredentials != null)
        'ServiceSpecificCredentials': serviceSpecificCredentials,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListSigningCertificatesResponse({
    required this.certificates,
    this.isTruncated,
    this.marker,
  });
  factory ListSigningCertificatesResponse.fromXml(_s.XmlElement elem) {
    return ListSigningCertificatesResponse(
      certificates: _s
          .extractXmlChild(elem, 'Certificates')!
          .findElements('member')
          .map(SigningCertificate.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final certificates = this.certificates;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Certificates': certificates,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListUserPoliciesResponse({
    required this.policyNames,
    this.isTruncated,
    this.marker,
  });
  factory ListUserPoliciesResponse.fromXml(_s.XmlElement elem) {
    return ListUserPoliciesResponse(
      policyNames: _s.extractXmlStringListValues(
          _s.extractXmlChild(elem, 'PolicyNames')!, 'member'),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final policyNames = this.policyNames;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'PolicyNames': policyNames,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

class ListUserTagsResponse {
  /// The list of tags that are currently attached to the user. Each tag consists
  /// of a key name and an associated value. If no tags are attached to the
  /// specified resource, the response contains an empty list.
  final List<Tag> tags;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListUserTagsResponse({
    required this.tags,
    this.isTruncated,
    this.marker,
  });
  factory ListUserTagsResponse.fromXml(_s.XmlElement elem) {
    return ListUserTagsResponse(
      tags: _s
          .extractXmlChild(elem, 'Tags')!
          .findElements('member')
          .map(Tag.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Tags': tags,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListUsersResponse({
    required this.users,
    this.isTruncated,
    this.marker,
  });
  factory ListUsersResponse.fromXml(_s.XmlElement elem) {
    return ListUsersResponse(
      users: _s
          .extractXmlChild(elem, 'Users')!
          .findElements('member')
          .map(User.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final users = this.users;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'Users': users,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
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
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

  ListVirtualMFADevicesResponse({
    required this.virtualMFADevices,
    this.isTruncated,
    this.marker,
  });
  factory ListVirtualMFADevicesResponse.fromXml(_s.XmlElement elem) {
    return ListVirtualMFADevicesResponse(
      virtualMFADevices: _s
          .extractXmlChild(elem, 'VirtualMFADevices')!
          .findElements('member')
          .map(VirtualMFADevice.fromXml)
          .toList(),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualMFADevices = this.virtualMFADevices;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      'VirtualMFADevices': virtualMFADevices,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains the user name and password create date for a user.
///
/// This data type is used as a response element in the
/// <a>CreateLoginProfile</a> and <a>GetLoginProfile</a> operations.
class LoginProfile {
  /// The date when the password for the user was created.
  final DateTime createDate;

  /// The name of the user, which can be used for signing in to the Amazon Web
  /// Services Management Console.
  final String userName;

  /// Specifies whether the user is required to set a new password on next
  /// sign-in.
  final bool? passwordResetRequired;

  LoginProfile({
    required this.createDate,
    required this.userName,
    this.passwordResetRequired,
  });
  factory LoginProfile.fromXml(_s.XmlElement elem) {
    return LoginProfile(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate')!,
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
      passwordResetRequired:
          _s.extractXmlBoolValue(elem, 'PasswordResetRequired'),
    );
  }

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final userName = this.userName;
    final passwordResetRequired = this.passwordResetRequired;
    return {
      'CreateDate': iso8601ToJson(createDate),
      'UserName': userName,
      if (passwordResetRequired != null)
        'PasswordResetRequired': passwordResetRequired,
    };
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
    required this.enableDate,
    required this.serialNumber,
    required this.userName,
  });
  factory MFADevice.fromXml(_s.XmlElement elem) {
    return MFADevice(
      enableDate: _s.extractXmlDateTimeValue(elem, 'EnableDate')!,
      serialNumber: _s.extractXmlStringValue(elem, 'SerialNumber')!,
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final enableDate = this.enableDate;
    final serialNumber = this.serialNumber;
    final userName = this.userName;
    return {
      'EnableDate': iso8601ToJson(enableDate),
      'SerialNumber': serialNumber,
      'UserName': userName,
    };
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
/// policies and inline policies</a> in the <i>IAM User Guide</i>.
class ManagedPolicyDetail {
  final String? arn;

  /// The number of principal entities (users, groups, and roles) that the policy
  /// is attached to.
  final int? attachmentCount;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was created.
  final DateTime? createDate;

  /// The identifier for the version of the policy that is set as the default
  /// (operative) version.
  ///
  /// For more information about policy versions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-versions.html">Versioning
  /// for managed policies</a> in the <i>IAM User Guide</i>.
  final String? defaultVersionId;

  /// A friendly description of the policy.
  final String? description;

  /// Specifies whether the policy can be attached to an IAM user, group, or role.
  final bool? isAttachable;

  /// The path to the policy.
  ///
  /// For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? path;

  /// The number of entities (users and roles) for which the policy is used as the
  /// permissions boundary.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
  final int? permissionsBoundaryUsageCount;

  /// The stable and unique string identifying the policy.
  ///
  /// For more information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? policyId;

  /// The friendly name (not ARN) identifying the policy.
  final String? policyName;

  /// A list containing information about the versions of the policy.
  final List<PolicyVersion>? policyVersionList;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was last updated.
  ///
  /// When a policy has only one version, this field contains the date and time
  /// when the policy was created. When a policy has more than one version, this
  /// field contains the date and time when the most recent policy version was
  /// created.
  final DateTime? updateDate;

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
          (elem) =>
              elem.findElements('member').map(PolicyVersion.fromXml).toList()),
      updateDate: _s.extractXmlDateTimeValue(elem, 'UpdateDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachmentCount = this.attachmentCount;
    final createDate = this.createDate;
    final defaultVersionId = this.defaultVersionId;
    final description = this.description;
    final isAttachable = this.isAttachable;
    final path = this.path;
    final permissionsBoundaryUsageCount = this.permissionsBoundaryUsageCount;
    final policyId = this.policyId;
    final policyName = this.policyName;
    final policyVersionList = this.policyVersionList;
    final updateDate = this.updateDate;
    return {
      if (arn != null) 'Arn': arn,
      if (attachmentCount != null) 'AttachmentCount': attachmentCount,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (defaultVersionId != null) 'DefaultVersionId': defaultVersionId,
      if (description != null) 'Description': description,
      if (isAttachable != null) 'IsAttachable': isAttachable,
      if (path != null) 'Path': path,
      if (permissionsBoundaryUsageCount != null)
        'PermissionsBoundaryUsageCount': permissionsBoundaryUsageCount,
      if (policyId != null) 'PolicyId': policyId,
      if (policyName != null) 'PolicyName': policyName,
      if (policyVersionList != null) 'PolicyVersionList': policyVersionList,
      if (updateDate != null) 'UpdateDate': iso8601ToJson(updateDate),
    };
  }
}

/// Contains the Amazon Resource Name (ARN) for an IAM OpenID Connect provider.
class OpenIDConnectProviderListEntry {
  final String? arn;

  OpenIDConnectProviderListEntry({
    this.arn,
  });
  factory OpenIDConnectProviderListEntry.fromXml(_s.XmlElement elem) {
    return OpenIDConnectProviderListEntry(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// Contains information about the effect that Organizations has on a policy
/// simulation.
class OrganizationsDecisionDetail {
  /// Specifies whether the simulated operation is allowed by the Organizations
  /// service control policies that impact the simulated user's account.
  final bool? allowedByOrganizations;

  OrganizationsDecisionDetail({
    this.allowedByOrganizations,
  });
  factory OrganizationsDecisionDetail.fromXml(_s.XmlElement elem) {
    return OrganizationsDecisionDetail(
      allowedByOrganizations:
          _s.extractXmlBoolValue(elem, 'AllowedByOrganizations'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedByOrganizations = this.allowedByOrganizations;
    return {
      if (allowedByOrganizations != null)
        'AllowedByOrganizations': allowedByOrganizations,
    };
  }
}

/// Contains information about the account password policy.
///
/// This data type is used as a response element in the
/// <a>GetAccountPasswordPolicy</a> operation.
class PasswordPolicy {
  /// Specifies whether IAM users are allowed to change their own password. Gives
  /// IAM users permissions to <code>iam:ChangePassword</code> for only their user
  /// and to the <code>iam:GetAccountPasswordPolicy</code> action. This option
  /// does not attach a permissions policy to each user, rather the permissions
  /// are applied at the account-level for all users by IAM.
  final bool? allowUsersToChangePassword;

  /// Indicates whether passwords in the account expire. Returns true if
  /// <code>MaxPasswordAge</code> contains a value greater than 0. Returns false
  /// if MaxPasswordAge is 0 or not present.
  final bool? expirePasswords;

  /// Specifies whether IAM users are prevented from setting a new password via
  /// the Amazon Web Services Management Console after their password has expired.
  /// The IAM user cannot access the console until an administrator resets the
  /// password. IAM users with <code>iam:ChangePassword</code> permission and
  /// active access keys can reset their own expired console password using the
  /// CLI or API.
  final bool? hardExpiry;

  /// The number of days that an IAM user password is valid.
  final int? maxPasswordAge;

  /// Minimum length to require for IAM user passwords.
  final int? minimumPasswordLength;

  /// Specifies the number of previous passwords that IAM users are prevented from
  /// reusing.
  final int? passwordReusePrevention;

  /// Specifies whether IAM user passwords must contain at least one lowercase
  /// character (a to z).
  final bool? requireLowercaseCharacters;

  /// Specifies whether IAM user passwords must contain at least one numeric
  /// character (0 to 9).
  final bool? requireNumbers;

  /// Specifies whether IAM user passwords must contain at least one of the
  /// following symbols:
  ///
  /// ! @ # $ % ^ &amp; * ( ) _ + - = [ ] { } | '
  final bool? requireSymbols;

  /// Specifies whether IAM user passwords must contain at least one uppercase
  /// character (A to Z).
  final bool? requireUppercaseCharacters;

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

  Map<String, dynamic> toJson() {
    final allowUsersToChangePassword = this.allowUsersToChangePassword;
    final expirePasswords = this.expirePasswords;
    final hardExpiry = this.hardExpiry;
    final maxPasswordAge = this.maxPasswordAge;
    final minimumPasswordLength = this.minimumPasswordLength;
    final passwordReusePrevention = this.passwordReusePrevention;
    final requireLowercaseCharacters = this.requireLowercaseCharacters;
    final requireNumbers = this.requireNumbers;
    final requireSymbols = this.requireSymbols;
    final requireUppercaseCharacters = this.requireUppercaseCharacters;
    return {
      if (allowUsersToChangePassword != null)
        'AllowUsersToChangePassword': allowUsersToChangePassword,
      if (expirePasswords != null) 'ExpirePasswords': expirePasswords,
      if (hardExpiry != null) 'HardExpiry': hardExpiry,
      if (maxPasswordAge != null) 'MaxPasswordAge': maxPasswordAge,
      if (minimumPasswordLength != null)
        'MinimumPasswordLength': minimumPasswordLength,
      if (passwordReusePrevention != null)
        'PasswordReusePrevention': passwordReusePrevention,
      if (requireLowercaseCharacters != null)
        'RequireLowercaseCharacters': requireLowercaseCharacters,
      if (requireNumbers != null) 'RequireNumbers': requireNumbers,
      if (requireSymbols != null) 'RequireSymbols': requireSymbols,
      if (requireUppercaseCharacters != null)
        'RequireUppercaseCharacters': requireUppercaseCharacters,
    };
  }
}

enum PermissionsBoundaryAttachmentType {
  permissionsBoundaryPolicy,
}

extension PermissionsBoundaryAttachmentTypeValueExtension
    on PermissionsBoundaryAttachmentType {
  String toValue() {
    switch (this) {
      case PermissionsBoundaryAttachmentType.permissionsBoundaryPolicy:
        return 'PermissionsBoundaryPolicy';
    }
  }
}

extension PermissionsBoundaryAttachmentTypeFromString on String {
  PermissionsBoundaryAttachmentType toPermissionsBoundaryAttachmentType() {
    switch (this) {
      case 'PermissionsBoundaryPolicy':
        return PermissionsBoundaryAttachmentType.permissionsBoundaryPolicy;
    }
    throw Exception(
        '$this is not known in enum PermissionsBoundaryAttachmentType');
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
  final bool? allowedByPermissionsBoundary;

  PermissionsBoundaryDecisionDetail({
    this.allowedByPermissionsBoundary,
  });
  factory PermissionsBoundaryDecisionDetail.fromXml(_s.XmlElement elem) {
    return PermissionsBoundaryDecisionDetail(
      allowedByPermissionsBoundary:
          _s.extractXmlBoolValue(elem, 'AllowedByPermissionsBoundary'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedByPermissionsBoundary = this.allowedByPermissionsBoundary;
    return {
      if (allowedByPermissionsBoundary != null)
        'AllowedByPermissionsBoundary': allowedByPermissionsBoundary,
    };
  }
}

/// Contains information about a managed policy.
///
/// This data type is used as a response element in the <a>CreatePolicy</a>,
/// <a>GetPolicy</a>, and <a>ListPolicies</a> operations.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// policies and inline policies</a> in the <i>IAM User Guide</i>.
class Policy {
  final String? arn;

  /// The number of entities (users, groups, and roles) that the policy is
  /// attached to.
  final int? attachmentCount;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was created.
  final DateTime? createDate;

  /// The identifier for the version of the policy that is set as the default
  /// version.
  final String? defaultVersionId;

  /// A friendly description of the policy.
  ///
  /// This element is included in the response to the <a>GetPolicy</a> operation.
  /// It is not included in the response to the <a>ListPolicies</a> operation.
  final String? description;

  /// Specifies whether the policy can be attached to an IAM user, group, or role.
  final bool? isAttachable;

  /// The path to the policy.
  ///
  /// For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? path;

  /// The number of entities (users and roles) for which the policy is used to set
  /// the permissions boundary.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
  final int? permissionsBoundaryUsageCount;

  /// The stable and unique string identifying the policy.
  ///
  /// For more information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? policyId;

  /// The friendly name (not ARN) identifying the policy.
  final String? policyName;

  /// A list of tags that are attached to the instance profile. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy was last updated.
  ///
  /// When a policy has only one version, this field contains the date and time
  /// when the policy was created. When a policy has more than one version, this
  /// field contains the date and time when the most recent policy version was
  /// created.
  final DateTime? updateDate;

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
    this.tags,
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
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
      updateDate: _s.extractXmlDateTimeValue(elem, 'UpdateDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachmentCount = this.attachmentCount;
    final createDate = this.createDate;
    final defaultVersionId = this.defaultVersionId;
    final description = this.description;
    final isAttachable = this.isAttachable;
    final path = this.path;
    final permissionsBoundaryUsageCount = this.permissionsBoundaryUsageCount;
    final policyId = this.policyId;
    final policyName = this.policyName;
    final tags = this.tags;
    final updateDate = this.updateDate;
    return {
      if (arn != null) 'Arn': arn,
      if (attachmentCount != null) 'AttachmentCount': attachmentCount,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (defaultVersionId != null) 'DefaultVersionId': defaultVersionId,
      if (description != null) 'Description': description,
      if (isAttachable != null) 'IsAttachable': isAttachable,
      if (path != null) 'Path': path,
      if (permissionsBoundaryUsageCount != null)
        'PermissionsBoundaryUsageCount': permissionsBoundaryUsageCount,
      if (policyId != null) 'PolicyId': policyId,
      if (policyName != null) 'PolicyName': policyName,
      if (tags != null) 'Tags': tags,
      if (updateDate != null) 'UpdateDate': iso8601ToJson(updateDate),
    };
  }
}

/// Contains information about an IAM policy, including the policy document.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class PolicyDetail {
  /// The policy document.
  final String? policyDocument;

  /// The name of the policy.
  final String? policyName;

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

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    return {
      if (policyDocument != null) 'PolicyDocument': policyDocument,
      if (policyName != null) 'PolicyName': policyName,
    };
  }
}

enum PolicyEvaluationDecisionType {
  allowed,
  explicitDeny,
  implicitDeny,
}

extension PolicyEvaluationDecisionTypeValueExtension
    on PolicyEvaluationDecisionType {
  String toValue() {
    switch (this) {
      case PolicyEvaluationDecisionType.allowed:
        return 'allowed';
      case PolicyEvaluationDecisionType.explicitDeny:
        return 'explicitDeny';
      case PolicyEvaluationDecisionType.implicitDeny:
        return 'implicitDeny';
    }
  }
}

extension PolicyEvaluationDecisionTypeFromString on String {
  PolicyEvaluationDecisionType toPolicyEvaluationDecisionType() {
    switch (this) {
      case 'allowed':
        return PolicyEvaluationDecisionType.allowed;
      case 'explicitDeny':
        return PolicyEvaluationDecisionType.explicitDeny;
      case 'implicitDeny':
        return PolicyEvaluationDecisionType.implicitDeny;
    }
    throw Exception('$this is not known in enum PolicyEvaluationDecisionType');
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
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  final PolicyType policyType;

  /// The name of the entity (user or role) to which the inline policy is
  /// attached.
  ///
  /// This field is null for managed policies. For more information about these
  /// policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  final String? entityName;

  /// The type of entity (user or role) that used the policy to access the service
  /// to which the inline policy is attached.
  ///
  /// This field is null for managed policies. For more information about these
  /// policy types, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vs-inline.html">Managed
  /// policies and inline policies</a> in the <i>IAM User Guide</i>.
  final PolicyOwnerEntityType? entityType;
  final String? policyArn;

  PolicyGrantingServiceAccess({
    required this.policyName,
    required this.policyType,
    this.entityName,
    this.entityType,
    this.policyArn,
  });
  factory PolicyGrantingServiceAccess.fromXml(_s.XmlElement elem) {
    return PolicyGrantingServiceAccess(
      policyName: _s.extractXmlStringValue(elem, 'PolicyName')!,
      policyType: _s.extractXmlStringValue(elem, 'PolicyType')!.toPolicyType(),
      entityName: _s.extractXmlStringValue(elem, 'EntityName'),
      entityType: _s
          .extractXmlStringValue(elem, 'EntityType')
          ?.toPolicyOwnerEntityType(),
      policyArn: _s.extractXmlStringValue(elem, 'PolicyArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final policyType = this.policyType;
    final entityName = this.entityName;
    final entityType = this.entityType;
    final policyArn = this.policyArn;
    return {
      'PolicyName': policyName,
      'PolicyType': policyType.toValue(),
      if (entityName != null) 'EntityName': entityName,
      if (entityType != null) 'EntityType': entityType.toValue(),
      if (policyArn != null) 'PolicyArn': policyArn,
    };
  }
}

/// Contains information about a group that a managed policy is attached to.
///
/// This data type is used as a response element in the
/// <a>ListEntitiesForPolicy</a> operation.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// policies and inline policies</a> in the <i>IAM User Guide</i>.
class PolicyGroup {
  /// The stable and unique string identifying the group. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? groupId;

  /// The name (friendly name, not ARN) identifying the group.
  final String? groupName;

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

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final groupName = this.groupName;
    return {
      if (groupId != null) 'GroupId': groupId,
      if (groupName != null) 'GroupName': groupName,
    };
  }
}

/// Contains information about a role that a managed policy is attached to.
///
/// This data type is used as a response element in the
/// <a>ListEntitiesForPolicy</a> operation.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// policies and inline policies</a> in the <i>IAM User Guide</i>.
class PolicyRole {
  /// The stable and unique string identifying the role. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? roleId;

  /// The name (friendly name, not ARN) identifying the role.
  final String? roleName;

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

  Map<String, dynamic> toJson() {
    final roleId = this.roleId;
    final roleName = this.roleName;
    return {
      if (roleId != null) 'RoleId': roleId,
      if (roleName != null) 'RoleName': roleName,
    };
  }
}

enum PolicySourceType {
  user,
  group,
  role,
  awsManaged,
  userManaged,
  resource,
  none,
}

extension PolicySourceTypeValueExtension on PolicySourceType {
  String toValue() {
    switch (this) {
      case PolicySourceType.user:
        return 'user';
      case PolicySourceType.group:
        return 'group';
      case PolicySourceType.role:
        return 'role';
      case PolicySourceType.awsManaged:
        return 'aws-managed';
      case PolicySourceType.userManaged:
        return 'user-managed';
      case PolicySourceType.resource:
        return 'resource';
      case PolicySourceType.none:
        return 'none';
    }
  }
}

extension PolicySourceTypeFromString on String {
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
    throw Exception('$this is not known in enum PolicySourceType');
  }
}

/// The policy usage type that indicates whether the policy is used as a
/// permissions policy or as the permissions boundary for an entity.
///
/// For more information about permissions boundaries, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
/// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
enum PolicyUsageType {
  permissionsPolicy,
  permissionsBoundary,
}

extension PolicyUsageTypeValueExtension on PolicyUsageType {
  String toValue() {
    switch (this) {
      case PolicyUsageType.permissionsPolicy:
        return 'PermissionsPolicy';
      case PolicyUsageType.permissionsBoundary:
        return 'PermissionsBoundary';
    }
  }
}

extension PolicyUsageTypeFromString on String {
  PolicyUsageType toPolicyUsageType() {
    switch (this) {
      case 'PermissionsPolicy':
        return PolicyUsageType.permissionsPolicy;
      case 'PermissionsBoundary':
        return PolicyUsageType.permissionsBoundary;
    }
    throw Exception('$this is not known in enum PolicyUsageType');
  }
}

/// Contains information about a user that a managed policy is attached to.
///
/// This data type is used as a response element in the
/// <a>ListEntitiesForPolicy</a> operation.
///
/// For more information about managed policies, refer to <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/policies-managed-vs-inline.html">Managed
/// policies and inline policies</a> in the <i>IAM User Guide</i>.
class PolicyUser {
  /// The stable and unique string identifying the user. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? userId;

  /// The name (friendly name, not ARN) identifying the user.
  final String? userName;

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

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final userName = this.userName;
    return {
      if (userId != null) 'UserId': userId,
      if (userName != null) 'UserName': userName,
    };
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
/// policies and inline policies</a> in the <i>IAM User Guide</i>.
class PolicyVersion {
  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the policy version was created.
  final DateTime? createDate;

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
  final String? document;

  /// Specifies whether the policy version is set as the policy's default version.
  final bool? isDefaultVersion;

  /// The identifier for the policy version.
  ///
  /// Policy version identifiers always begin with <code>v</code> (always
  /// lowercase). When a policy is created, the first policy version is
  /// <code>v1</code>.
  final String? versionId;

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

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final document = this.document;
    final isDefaultVersion = this.isDefaultVersion;
    final versionId = this.versionId;
    return {
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (document != null) 'Document': document,
      if (isDefaultVersion != null) 'IsDefaultVersion': isDefaultVersion,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// Contains the row and column of a location of a <code>Statement</code>
/// element in a policy document.
///
/// This data type is used as a member of the <code> <a>Statement</a> </code>
/// type.
class Position {
  /// The column in the line containing the specified position in the document.
  final int? column;

  /// The line containing the specified position in the document.
  final int? line;

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

  Map<String, dynamic> toJson() {
    final column = this.column;
    final line = this.line;
    return {
      if (column != null) 'Column': column,
      if (line != null) 'Line': line,
    };
  }
}

enum ReportFormatType {
  textCsv,
}

extension ReportFormatTypeValueExtension on ReportFormatType {
  String toValue() {
    switch (this) {
      case ReportFormatType.textCsv:
        return 'text/csv';
    }
  }
}

extension ReportFormatTypeFromString on String {
  ReportFormatType toReportFormatType() {
    switch (this) {
      case 'text/csv':
        return ReportFormatType.textCsv;
    }
    throw Exception('$this is not known in enum ReportFormatType');
  }
}

enum ReportStateType {
  started,
  inprogress,
  complete,
}

extension ReportStateTypeValueExtension on ReportStateType {
  String toValue() {
    switch (this) {
      case ReportStateType.started:
        return 'STARTED';
      case ReportStateType.inprogress:
        return 'INPROGRESS';
      case ReportStateType.complete:
        return 'COMPLETE';
    }
  }
}

extension ReportStateTypeFromString on String {
  ReportStateType toReportStateType() {
    switch (this) {
      case 'STARTED':
        return ReportStateType.started;
      case 'INPROGRESS':
        return ReportStateType.inprogress;
      case 'COMPLETE':
        return ReportStateType.complete;
    }
    throw Exception('$this is not known in enum ReportStateType');
  }
}

class ResetServiceSpecificCredentialResponse {
  /// A structure with details about the updated service-specific credential,
  /// including the new password.
  /// <important>
  /// This is the <b>only</b> time that you can access the password. You cannot
  /// recover the password later, but you can reset it again.
  /// </important>
  final ServiceSpecificCredential? serviceSpecificCredential;

  ResetServiceSpecificCredentialResponse({
    this.serviceSpecificCredential,
  });
  factory ResetServiceSpecificCredentialResponse.fromXml(_s.XmlElement elem) {
    return ResetServiceSpecificCredentialResponse(
      serviceSpecificCredential: _s
          .extractXmlChild(elem, 'ServiceSpecificCredential')
          ?.let(ServiceSpecificCredential.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSpecificCredential = this.serviceSpecificCredential;
    return {
      if (serviceSpecificCredential != null)
        'ServiceSpecificCredential': serviceSpecificCredential,
    };
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
  final Map<String, PolicyEvaluationDecisionType>? evalDecisionDetails;

  /// A list of the statements in the input policies that determine the result for
  /// this part of the simulation. Remember that even if multiple statements allow
  /// the operation on the resource, if <i>any</i> statement denies that
  /// operation, then the explicit deny overrides any allow. In addition, the deny
  /// statement is the only entry included in the result.
  final List<Statement>? matchedStatements;

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
  final List<String>? missingContextValues;

  /// Contains information about the effect that a permissions boundary has on a
  /// policy simulation when that boundary is applied to an IAM entity.
  final PermissionsBoundaryDecisionDetail? permissionsBoundaryDecisionDetail;

  ResourceSpecificResult({
    required this.evalResourceDecision,
    required this.evalResourceName,
    this.evalDecisionDetails,
    this.matchedStatements,
    this.missingContextValues,
    this.permissionsBoundaryDecisionDetail,
  });
  factory ResourceSpecificResult.fromXml(_s.XmlElement elem) {
    return ResourceSpecificResult(
      evalResourceDecision: _s
          .extractXmlStringValue(elem, 'EvalResourceDecision')!
          .toPolicyEvaluationDecisionType(),
      evalResourceName: _s.extractXmlStringValue(elem, 'EvalResourceName')!,
      evalDecisionDetails: Map.fromEntries(
        elem.getElement('EvalDecisionDetails')?.findElements('entry').map(
                  (c) => MapEntry(
                    _s.extractXmlStringValue(c, 'key')!,
                    _s
                        .extractXmlStringValue(c, 'value')!
                        .toPolicyEvaluationDecisionType(),
                  ),
                ) ??
            {},
      ),
      matchedStatements: _s.extractXmlChild(elem, 'MatchedStatements')?.let(
          (elem) =>
              elem.findElements('member').map(Statement.fromXml).toList()),
      missingContextValues: _s
          .extractXmlChild(elem, 'MissingContextValues')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      permissionsBoundaryDecisionDetail: _s
          .extractXmlChild(elem, 'PermissionsBoundaryDecisionDetail')
          ?.let(PermissionsBoundaryDecisionDetail.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final evalResourceDecision = this.evalResourceDecision;
    final evalResourceName = this.evalResourceName;
    final evalDecisionDetails = this.evalDecisionDetails;
    final matchedStatements = this.matchedStatements;
    final missingContextValues = this.missingContextValues;
    final permissionsBoundaryDecisionDetail =
        this.permissionsBoundaryDecisionDetail;
    return {
      'EvalResourceDecision': evalResourceDecision.toValue(),
      'EvalResourceName': evalResourceName,
      if (evalDecisionDetails != null)
        'EvalDecisionDetails':
            evalDecisionDetails.map((k, e) => MapEntry(k, e.toValue())),
      if (matchedStatements != null) 'MatchedStatements': matchedStatements,
      if (missingContextValues != null)
        'MissingContextValues': missingContextValues,
      if (permissionsBoundaryDecisionDetail != null)
        'PermissionsBoundaryDecisionDetail': permissionsBoundaryDecisionDetail,
    };
  }
}

/// Contains information about an IAM role. This structure is returned as a
/// response element in several API operations that interact with roles.
class Role {
  /// The Amazon Resource Name (ARN) specifying the role. For more information
  /// about ARNs and how to use them in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i> guide.
  final String arn;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the role was created.
  final DateTime createDate;

  /// The path to the role. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The stable and unique string identifying the role. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String roleId;

  /// The friendly name that identifies the role.
  final String roleName;

  /// The policy that grants an entity permission to assume the role.
  final String? assumeRolePolicyDocument;

  /// A description of the role that you provide.
  final String? description;

  /// The maximum session duration (in seconds) for the specified role. Anyone who
  /// uses the CLI, or API to assume the role can specify the duration using the
  /// optional <code>DurationSeconds</code> API parameter or
  /// <code>duration-seconds</code> CLI parameter.
  final int? maxSessionDuration;

  /// The ARN of the policy used to set the permissions boundary for the role.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary? permissionsBoundary;

  /// Contains information about the last time that an IAM role was used. This
  /// includes the date and time and the Region in which the role was last used.
  /// Activity is only reported for the trailing 400 days. This period can be
  /// shorter if your Region began supporting these features within the last year.
  /// The role might have been used more than 400 days ago. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
  /// where data is tracked</a> in the <i>IAM user Guide</i>.
  final RoleLastUsed? roleLastUsed;

  /// A list of tags that are attached to the role. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  Role({
    required this.arn,
    required this.createDate,
    required this.path,
    required this.roleId,
    required this.roleName,
    this.assumeRolePolicyDocument,
    this.description,
    this.maxSessionDuration,
    this.permissionsBoundary,
    this.roleLastUsed,
    this.tags,
  });
  factory Role.fromXml(_s.XmlElement elem) {
    return Role(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate')!,
      path: _s.extractXmlStringValue(elem, 'Path')!,
      roleId: _s.extractXmlStringValue(elem, 'RoleId')!,
      roleName: _s.extractXmlStringValue(elem, 'RoleName')!,
      assumeRolePolicyDocument:
          _s.extractXmlStringValue(elem, 'AssumeRolePolicyDocument'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      maxSessionDuration: _s.extractXmlIntValue(elem, 'MaxSessionDuration'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let(AttachedPermissionsBoundary.fromXml),
      roleLastUsed:
          _s.extractXmlChild(elem, 'RoleLastUsed')?.let(RoleLastUsed.fromXml),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final path = this.path;
    final roleId = this.roleId;
    final roleName = this.roleName;
    final assumeRolePolicyDocument = this.assumeRolePolicyDocument;
    final description = this.description;
    final maxSessionDuration = this.maxSessionDuration;
    final permissionsBoundary = this.permissionsBoundary;
    final roleLastUsed = this.roleLastUsed;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreateDate': iso8601ToJson(createDate),
      'Path': path,
      'RoleId': roleId,
      'RoleName': roleName,
      if (assumeRolePolicyDocument != null)
        'AssumeRolePolicyDocument': assumeRolePolicyDocument,
      if (description != null) 'Description': description,
      if (maxSessionDuration != null) 'MaxSessionDuration': maxSessionDuration,
      if (permissionsBoundary != null)
        'PermissionsBoundary': permissionsBoundary,
      if (roleLastUsed != null) 'RoleLastUsed': roleLastUsed,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information about an IAM role, including all of the role's
/// policies.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class RoleDetail {
  final String? arn;

  /// The trust policy that grants permission to assume the role.
  final String? assumeRolePolicyDocument;

  /// A list of managed policies attached to the role. These policies are the
  /// role's access (permissions) policies.
  final List<AttachedPolicy>? attachedManagedPolicies;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the role was created.
  final DateTime? createDate;

  /// A list of instance profiles that contain this role.
  final List<InstanceProfile>? instanceProfileList;

  /// The path to the role. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? path;

  /// The ARN of the policy used to set the permissions boundary for the role.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary? permissionsBoundary;

  /// The stable and unique string identifying the role. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? roleId;

  /// Contains information about the last time that an IAM role was used. This
  /// includes the date and time and the Region in which the role was last used.
  /// Activity is only reported for the trailing 400 days. This period can be
  /// shorter if your Region began supporting these features within the last year.
  /// The role might have been used more than 400 days ago. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
  /// where data is tracked</a> in the <i>IAM User Guide</i>.
  final RoleLastUsed? roleLastUsed;

  /// The friendly name that identifies the role.
  final String? roleName;

  /// A list of inline policies embedded in the role. These policies are the
  /// role's access (permissions) policies.
  final List<PolicyDetail>? rolePolicyList;

  /// A list of tags that are attached to the role. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

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
          ?.let((elem) =>
              elem.findElements('member').map(AttachedPolicy.fromXml).toList()),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      instanceProfileList: _s.extractXmlChild(elem, 'InstanceProfileList')?.let(
          (elem) => elem
              .findElements('member')
              .map(InstanceProfile.fromXml)
              .toList()),
      path: _s.extractXmlStringValue(elem, 'Path'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let(AttachedPermissionsBoundary.fromXml),
      roleId: _s.extractXmlStringValue(elem, 'RoleId'),
      roleLastUsed:
          _s.extractXmlChild(elem, 'RoleLastUsed')?.let(RoleLastUsed.fromXml),
      roleName: _s.extractXmlStringValue(elem, 'RoleName'),
      rolePolicyList: _s.extractXmlChild(elem, 'RolePolicyList')?.let((elem) =>
          elem.findElements('member').map(PolicyDetail.fromXml).toList()),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final assumeRolePolicyDocument = this.assumeRolePolicyDocument;
    final attachedManagedPolicies = this.attachedManagedPolicies;
    final createDate = this.createDate;
    final instanceProfileList = this.instanceProfileList;
    final path = this.path;
    final permissionsBoundary = this.permissionsBoundary;
    final roleId = this.roleId;
    final roleLastUsed = this.roleLastUsed;
    final roleName = this.roleName;
    final rolePolicyList = this.rolePolicyList;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (assumeRolePolicyDocument != null)
        'AssumeRolePolicyDocument': assumeRolePolicyDocument,
      if (attachedManagedPolicies != null)
        'AttachedManagedPolicies': attachedManagedPolicies,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (instanceProfileList != null)
        'InstanceProfileList': instanceProfileList,
      if (path != null) 'Path': path,
      if (permissionsBoundary != null)
        'PermissionsBoundary': permissionsBoundary,
      if (roleId != null) 'RoleId': roleId,
      if (roleLastUsed != null) 'RoleLastUsed': roleLastUsed,
      if (roleName != null) 'RoleName': roleName,
      if (rolePolicyList != null) 'RolePolicyList': rolePolicyList,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information about the last time that an IAM role was used. This
/// includes the date and time and the Region in which the role was last used.
/// Activity is only reported for the trailing 400 days. This period can be
/// shorter if your Region began supporting these features within the last year.
/// The role might have been used more than 400 days ago. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#access-advisor_tracking-period">Regions
/// where data is tracked</a> in the <i>IAM user Guide</i>.
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
  /// where data is tracked</a> in the <i>IAM User Guide</i>.
  final DateTime? lastUsedDate;

  /// The name of the Amazon Web Services Region in which the role was last used.
  final String? region;

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

  Map<String, dynamic> toJson() {
    final lastUsedDate = this.lastUsedDate;
    final region = this.region;
    return {
      if (lastUsedDate != null) 'LastUsedDate': iso8601ToJson(lastUsedDate),
      if (region != null) 'Region': region,
    };
  }
}

/// An object that contains details about how a service-linked role is used, if
/// that information is returned by the service.
///
/// This data type is used as a response element in the
/// <a>GetServiceLinkedRoleDeletionStatus</a> operation.
class RoleUsageType {
  /// The name of the Region where the service-linked role is being used.
  final String? region;

  /// The name of the resource that is using the service-linked role.
  final List<String>? resources;

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

  Map<String, dynamic> toJson() {
    final region = this.region;
    final resources = this.resources;
    return {
      if (region != null) 'Region': region,
      if (resources != null) 'Resources': resources,
    };
  }
}

/// Contains the list of SAML providers for this account.
class SAMLProviderListEntry {
  /// The Amazon Resource Name (ARN) of the SAML provider.
  final String? arn;

  /// The date and time when the SAML provider was created.
  final DateTime? createDate;

  /// The expiration date and time for the SAML provider.
  final DateTime? validUntil;

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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final validUntil = this.validUntil;
    return {
      if (arn != null) 'Arn': arn,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (validUntil != null) 'ValidUntil': iso8601ToJson(validUntil),
    };
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
  /// be used for authentication with an CodeCommit repository.
  /// <code>Inactive</code> means that the key cannot be used.
  final StatusType status;

  /// The name of the IAM user associated with the SSH public key.
  final String userName;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the SSH public key was uploaded.
  final DateTime? uploadDate;

  SSHPublicKey({
    required this.fingerprint,
    required this.sSHPublicKeyBody,
    required this.sSHPublicKeyId,
    required this.status,
    required this.userName,
    this.uploadDate,
  });
  factory SSHPublicKey.fromXml(_s.XmlElement elem) {
    return SSHPublicKey(
      fingerprint: _s.extractXmlStringValue(elem, 'Fingerprint')!,
      sSHPublicKeyBody: _s.extractXmlStringValue(elem, 'SSHPublicKeyBody')!,
      sSHPublicKeyId: _s.extractXmlStringValue(elem, 'SSHPublicKeyId')!,
      status: _s.extractXmlStringValue(elem, 'Status')!.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final fingerprint = this.fingerprint;
    final sSHPublicKeyBody = this.sSHPublicKeyBody;
    final sSHPublicKeyId = this.sSHPublicKeyId;
    final status = this.status;
    final userName = this.userName;
    final uploadDate = this.uploadDate;
    return {
      'Fingerprint': fingerprint,
      'SSHPublicKeyBody': sSHPublicKeyBody,
      'SSHPublicKeyId': sSHPublicKeyId,
      'Status': status.toValue(),
      'UserName': userName,
      if (uploadDate != null) 'UploadDate': iso8601ToJson(uploadDate),
    };
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
  /// be used for authentication with an CodeCommit repository.
  /// <code>Inactive</code> means that the key cannot be used.
  final StatusType status;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the SSH public key was uploaded.
  final DateTime uploadDate;

  /// The name of the IAM user associated with the SSH public key.
  final String userName;

  SSHPublicKeyMetadata({
    required this.sSHPublicKeyId,
    required this.status,
    required this.uploadDate,
    required this.userName,
  });
  factory SSHPublicKeyMetadata.fromXml(_s.XmlElement elem) {
    return SSHPublicKeyMetadata(
      sSHPublicKeyId: _s.extractXmlStringValue(elem, 'SSHPublicKeyId')!,
      status: _s.extractXmlStringValue(elem, 'Status')!.toStatusType(),
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate')!,
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final sSHPublicKeyId = this.sSHPublicKeyId;
    final status = this.status;
    final uploadDate = this.uploadDate;
    final userName = this.userName;
    return {
      'SSHPublicKeyId': sSHPublicKeyId,
      'Status': status.toValue(),
      'UploadDate': iso8601ToJson(uploadDate),
      'UserName': userName,
    };
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
  final String? certificateChain;

  /// A list of tags that are attached to the server certificate. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  ServerCertificate({
    required this.certificateBody,
    required this.serverCertificateMetadata,
    this.certificateChain,
    this.tags,
  });
  factory ServerCertificate.fromXml(_s.XmlElement elem) {
    return ServerCertificate(
      certificateBody: _s.extractXmlStringValue(elem, 'CertificateBody')!,
      serverCertificateMetadata: ServerCertificateMetadata.fromXml(
          _s.extractXmlChild(elem, 'ServerCertificateMetadata')!),
      certificateChain: _s.extractXmlStringValue(elem, 'CertificateChain'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateBody = this.certificateBody;
    final serverCertificateMetadata = this.serverCertificateMetadata;
    final certificateChain = this.certificateChain;
    final tags = this.tags;
    return {
      'CertificateBody': certificateBody,
      'ServerCertificateMetadata': serverCertificateMetadata,
      if (certificateChain != null) 'CertificateChain': certificateChain,
      if (tags != null) 'Tags': tags,
    };
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The path to the server certificate. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String path;

  /// The stable and unique string identifying the server certificate. For more
  /// information about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String serverCertificateId;

  /// The name that identifies the server certificate.
  final String serverCertificateName;

  /// The date on which the certificate is set to expire.
  final DateTime? expiration;

  /// The date when the server certificate was uploaded.
  final DateTime? uploadDate;

  ServerCertificateMetadata({
    required this.arn,
    required this.path,
    required this.serverCertificateId,
    required this.serverCertificateName,
    this.expiration,
    this.uploadDate,
  });
  factory ServerCertificateMetadata.fromXml(_s.XmlElement elem) {
    return ServerCertificateMetadata(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      path: _s.extractXmlStringValue(elem, 'Path')!,
      serverCertificateId:
          _s.extractXmlStringValue(elem, 'ServerCertificateId')!,
      serverCertificateName:
          _s.extractXmlStringValue(elem, 'ServerCertificateName')!,
      expiration: _s.extractXmlDateTimeValue(elem, 'Expiration'),
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final path = this.path;
    final serverCertificateId = this.serverCertificateId;
    final serverCertificateName = this.serverCertificateName;
    final expiration = this.expiration;
    final uploadDate = this.uploadDate;
    return {
      'Arn': arn,
      'Path': path,
      'ServerCertificateId': serverCertificateId,
      'ServerCertificateName': serverCertificateName,
      if (expiration != null) 'Expiration': iso8601ToJson(expiration),
      if (uploadDate != null) 'UploadDate': iso8601ToJson(uploadDate),
    };
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
  /// To learn the service namespace of a service, see <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Actions,
  /// resources, and condition keys for Amazon Web Services services</a> in the
  /// <i>Service Authorization Reference</i>. Choose the name of the service to
  /// view details for that service. In the first paragraph, find the service
  /// prefix. For example, <code>(service prefix: a4b)</code>. For more
  /// information about service namespaces, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">Amazon
  /// Web Services Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String serviceNamespace;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when an authenticated entity most recently attempted
  /// to access the service. Amazon Web Services does not report unauthenticated
  /// requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final DateTime? lastAuthenticated;

  /// The ARN of the authenticated entity (user or role) that last attempted to
  /// access the service. Amazon Web Services does not report unauthenticated
  /// requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final String? lastAuthenticatedEntity;

  /// The Region from which the authenticated entity (user or role) last attempted
  /// to access the service. Amazon Web Services does not report unauthenticated
  /// requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final String? lastAuthenticatedRegion;

  /// The total number of authenticated principals (root user, IAM users, or IAM
  /// roles) that have attempted to access the service.
  ///
  /// This field is null if no principals attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final int? totalAuthenticatedEntities;

  /// An object that contains details about the most recent attempt to access a
  /// tracked action within the service.
  ///
  /// This field is null if there no tracked actions or if the principal did not
  /// use the tracked actions within the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>. This field is also null if the report was generated at the
  /// service level and not the action level. For more information, see the
  /// <code>Granularity</code> field in <a>GenerateServiceLastAccessedDetails</a>.
  final List<TrackedActionLastAccessed>? trackedActionsLastAccessed;

  ServiceLastAccessed({
    required this.serviceName,
    required this.serviceNamespace,
    this.lastAuthenticated,
    this.lastAuthenticatedEntity,
    this.lastAuthenticatedRegion,
    this.totalAuthenticatedEntities,
    this.trackedActionsLastAccessed,
  });
  factory ServiceLastAccessed.fromXml(_s.XmlElement elem) {
    return ServiceLastAccessed(
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName')!,
      serviceNamespace: _s.extractXmlStringValue(elem, 'ServiceNamespace')!,
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
              .map(TrackedActionLastAccessed.fromXml)
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final serviceNamespace = this.serviceNamespace;
    final lastAuthenticated = this.lastAuthenticated;
    final lastAuthenticatedEntity = this.lastAuthenticatedEntity;
    final lastAuthenticatedRegion = this.lastAuthenticatedRegion;
    final totalAuthenticatedEntities = this.totalAuthenticatedEntities;
    final trackedActionsLastAccessed = this.trackedActionsLastAccessed;
    return {
      'ServiceName': serviceName,
      'ServiceNamespace': serviceNamespace,
      if (lastAuthenticated != null)
        'LastAuthenticated': iso8601ToJson(lastAuthenticated),
      if (lastAuthenticatedEntity != null)
        'LastAuthenticatedEntity': lastAuthenticatedEntity,
      if (lastAuthenticatedRegion != null)
        'LastAuthenticatedRegion': lastAuthenticatedRegion,
      if (totalAuthenticatedEntities != null)
        'TotalAuthenticatedEntities': totalAuthenticatedEntities,
      if (trackedActionsLastAccessed != null)
        'TrackedActionsLastAccessed': trackedActionsLastAccessed,
    };
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
  /// the Amazon Web Services account, as in <code>jane-at-123456789012</code>,
  /// for example. This value cannot be configured by the user.
  final String serviceUserName;

  /// The status of the service-specific credential. <code>Active</code> means
  /// that the key is valid for API calls, while <code>Inactive</code> means it is
  /// not.
  final StatusType status;

  /// The name of the IAM user associated with the service-specific credential.
  final String userName;

  ServiceSpecificCredential({
    required this.createDate,
    required this.serviceName,
    required this.servicePassword,
    required this.serviceSpecificCredentialId,
    required this.serviceUserName,
    required this.status,
    required this.userName,
  });
  factory ServiceSpecificCredential.fromXml(_s.XmlElement elem) {
    return ServiceSpecificCredential(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate')!,
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName')!,
      servicePassword: _s.extractXmlStringValue(elem, 'ServicePassword')!,
      serviceSpecificCredentialId:
          _s.extractXmlStringValue(elem, 'ServiceSpecificCredentialId')!,
      serviceUserName: _s.extractXmlStringValue(elem, 'ServiceUserName')!,
      status: _s.extractXmlStringValue(elem, 'Status')!.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final serviceName = this.serviceName;
    final servicePassword = this.servicePassword;
    final serviceSpecificCredentialId = this.serviceSpecificCredentialId;
    final serviceUserName = this.serviceUserName;
    final status = this.status;
    final userName = this.userName;
    return {
      'CreateDate': iso8601ToJson(createDate),
      'ServiceName': serviceName,
      'ServicePassword': servicePassword,
      'ServiceSpecificCredentialId': serviceSpecificCredentialId,
      'ServiceUserName': serviceUserName,
      'Status': status.toValue(),
      'UserName': userName,
    };
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
    required this.createDate,
    required this.serviceName,
    required this.serviceSpecificCredentialId,
    required this.serviceUserName,
    required this.status,
    required this.userName,
  });
  factory ServiceSpecificCredentialMetadata.fromXml(_s.XmlElement elem) {
    return ServiceSpecificCredentialMetadata(
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate')!,
      serviceName: _s.extractXmlStringValue(elem, 'ServiceName')!,
      serviceSpecificCredentialId:
          _s.extractXmlStringValue(elem, 'ServiceSpecificCredentialId')!,
      serviceUserName: _s.extractXmlStringValue(elem, 'ServiceUserName')!,
      status: _s.extractXmlStringValue(elem, 'Status')!.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
    );
  }

  Map<String, dynamic> toJson() {
    final createDate = this.createDate;
    final serviceName = this.serviceName;
    final serviceSpecificCredentialId = this.serviceSpecificCredentialId;
    final serviceUserName = this.serviceUserName;
    final status = this.status;
    final userName = this.userName;
    return {
      'CreateDate': iso8601ToJson(createDate),
      'ServiceName': serviceName,
      'ServiceSpecificCredentialId': serviceSpecificCredentialId,
      'ServiceUserName': serviceUserName,
      'Status': status.toValue(),
      'UserName': userName,
    };
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
  final DateTime? uploadDate;

  SigningCertificate({
    required this.certificateBody,
    required this.certificateId,
    required this.status,
    required this.userName,
    this.uploadDate,
  });
  factory SigningCertificate.fromXml(_s.XmlElement elem) {
    return SigningCertificate(
      certificateBody: _s.extractXmlStringValue(elem, 'CertificateBody')!,
      certificateId: _s.extractXmlStringValue(elem, 'CertificateId')!,
      status: _s.extractXmlStringValue(elem, 'Status')!.toStatusType(),
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
      uploadDate: _s.extractXmlDateTimeValue(elem, 'UploadDate'),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateBody = this.certificateBody;
    final certificateId = this.certificateId;
    final status = this.status;
    final userName = this.userName;
    final uploadDate = this.uploadDate;
    return {
      'CertificateBody': certificateBody,
      'CertificateId': certificateId,
      'Status': status.toValue(),
      'UserName': userName,
      if (uploadDate != null) 'UploadDate': iso8601ToJson(uploadDate),
    };
  }
}

/// Contains the response to a successful <a>SimulatePrincipalPolicy</a> or
/// <a>SimulateCustomPolicy</a> request.
class SimulatePolicyResponse {
  /// The results of the simulation.
  final List<EvaluationResult>? evaluationResults;

  /// A flag that indicates whether there are more items to return. If your
  /// results were truncated, you can make a subsequent pagination request using
  /// the <code>Marker</code> request parameter to retrieve more items. Note that
  /// IAM might return fewer than the <code>MaxItems</code> number of results even
  /// when there are more results available. We recommend that you check
  /// <code>IsTruncated</code> after every call to ensure that you receive all
  /// your results.
  final bool? isTruncated;

  /// When <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value to use for the <code>Marker</code> parameter in a
  /// subsequent pagination request.
  final String? marker;

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
              .map(EvaluationResult.fromXml)
              .toList()),
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationResults = this.evaluationResults;
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    return {
      if (evaluationResults != null) 'EvaluationResults': evaluationResults,
      if (isTruncated != null) 'IsTruncated': isTruncated,
      if (marker != null) 'Marker': marker,
    };
  }
}

/// Contains a reference to a <code>Statement</code> element in a policy
/// document that determines the result of the simulation.
///
/// This data type is used by the <code>MatchedStatements</code> member of the
/// <code> <a>EvaluationResult</a> </code> type.
class Statement {
  /// The row and column of the end of a <code>Statement</code> in an IAM policy.
  final Position? endPosition;

  /// The identifier of the policy that was provided as an input.
  final String? sourcePolicyId;

  /// The type of the policy.
  final PolicySourceType? sourcePolicyType;

  /// The row and column of the beginning of the <code>Statement</code> in an IAM
  /// policy.
  final Position? startPosition;

  Statement({
    this.endPosition,
    this.sourcePolicyId,
    this.sourcePolicyType,
    this.startPosition,
  });
  factory Statement.fromXml(_s.XmlElement elem) {
    return Statement(
      endPosition:
          _s.extractXmlChild(elem, 'EndPosition')?.let(Position.fromXml),
      sourcePolicyId: _s.extractXmlStringValue(elem, 'SourcePolicyId'),
      sourcePolicyType: _s
          .extractXmlStringValue(elem, 'SourcePolicyType')
          ?.toPolicySourceType(),
      startPosition:
          _s.extractXmlChild(elem, 'StartPosition')?.let(Position.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final endPosition = this.endPosition;
    final sourcePolicyId = this.sourcePolicyId;
    final sourcePolicyType = this.sourcePolicyType;
    final startPosition = this.startPosition;
    return {
      if (endPosition != null) 'EndPosition': endPosition,
      if (sourcePolicyId != null) 'SourcePolicyId': sourcePolicyId,
      if (sourcePolicyType != null)
        'SourcePolicyType': sourcePolicyType.toValue(),
      if (startPosition != null) 'StartPosition': startPosition,
    };
  }
}

/// A structure that represents user-provided metadata that can be associated
/// with an IAM resource. For more information about tagging, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
/// IAM resources</a> in the <i>IAM User Guide</i>.
class Tag {
  /// The key name that can be used to look up or retrieve the associated value.
  /// For example, <code>Department</code> or <code>Cost Center</code> are common
  /// choices.
  final String key;

  /// The value associated with this tag. For example, tags with a key name of
  /// <code>Department</code> could have values such as <code>Human
  /// Resources</code>, <code>Accounting</code>, and <code>Support</code>. Tags
  /// with a key name of <code>Cost Center</code> might have values that consist
  /// of the number associated with the different cost centers in your company.
  /// Typically, many resources have tags with the same key name but with
  /// different values.
  /// <note>
  /// Amazon Web Services always interprets the tag <code>Value</code> as a single
  /// string. If you need to store an array, you can store comma-separated values
  /// in the string. However, you must interpret the value in your code.
  /// </note>
  final String value;

  Tag({
    required this.key,
    required this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value')!,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// Contains details about the most recent attempt to access an action within
/// the service.
///
/// This data type is used as a response element in the
/// <a>GetServiceLastAccessedDetails</a> operation.
class TrackedActionLastAccessed {
  /// The name of the tracked action to which access was attempted. Tracked
  /// actions are actions that report activity to IAM.
  final String? actionName;
  final String? lastAccessedEntity;

  /// The Region from which the authenticated entity (user or role) last attempted
  /// to access the tracked action. Amazon Web Services does not report
  /// unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final String? lastAccessedRegion;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when an authenticated entity most recently attempted
  /// to access the tracked service. Amazon Web Services does not report
  /// unauthenticated requests.
  ///
  /// This field is null if no IAM entities attempted to access the service within
  /// the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_access-advisor.html#service-last-accessed-reporting-period">tracking
  /// period</a>.
  final DateTime? lastAccessedTime;

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

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final lastAccessedEntity = this.lastAccessedEntity;
    final lastAccessedRegion = this.lastAccessedRegion;
    final lastAccessedTime = this.lastAccessedTime;
    return {
      if (actionName != null) 'ActionName': actionName,
      if (lastAccessedEntity != null) 'LastAccessedEntity': lastAccessedEntity,
      if (lastAccessedRegion != null) 'LastAccessedRegion': lastAccessedRegion,
      if (lastAccessedTime != null)
        'LastAccessedTime': iso8601ToJson(lastAccessedTime),
    };
  }
}

class UpdateRoleDescriptionResponse {
  /// A structure that contains details about the modified role.
  final Role? role;

  UpdateRoleDescriptionResponse({
    this.role,
  });
  factory UpdateRoleDescriptionResponse.fromXml(_s.XmlElement elem) {
    return UpdateRoleDescriptionResponse(
      role: _s.extractXmlChild(elem, 'Role')?.let(Role.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      if (role != null) 'Role': role,
    };
  }
}

class UpdateRoleResponse {
  UpdateRoleResponse();
  factory UpdateRoleResponse.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return UpdateRoleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the response to a successful <a>UpdateSAMLProvider</a> request.
class UpdateSAMLProviderResponse {
  /// The Amazon Resource Name (ARN) of the SAML provider that was updated.
  final String? sAMLProviderArn;

  UpdateSAMLProviderResponse({
    this.sAMLProviderArn,
  });
  factory UpdateSAMLProviderResponse.fromXml(_s.XmlElement elem) {
    return UpdateSAMLProviderResponse(
      sAMLProviderArn: _s.extractXmlStringValue(elem, 'SAMLProviderArn'),
    );
  }

  Map<String, dynamic> toJson() {
    final sAMLProviderArn = this.sAMLProviderArn;
    return {
      if (sAMLProviderArn != null) 'SAMLProviderArn': sAMLProviderArn,
    };
  }
}

/// Contains the response to a successful <a>UploadSSHPublicKey</a> request.
class UploadSSHPublicKeyResponse {
  /// Contains information about the SSH public key.
  final SSHPublicKey? sSHPublicKey;

  UploadSSHPublicKeyResponse({
    this.sSHPublicKey,
  });
  factory UploadSSHPublicKeyResponse.fromXml(_s.XmlElement elem) {
    return UploadSSHPublicKeyResponse(
      sSHPublicKey:
          _s.extractXmlChild(elem, 'SSHPublicKey')?.let(SSHPublicKey.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final sSHPublicKey = this.sSHPublicKey;
    return {
      if (sSHPublicKey != null) 'SSHPublicKey': sSHPublicKey,
    };
  }
}

/// Contains the response to a successful <a>UploadServerCertificate</a>
/// request.
class UploadServerCertificateResponse {
  /// The meta information of the uploaded server certificate without its
  /// certificate body, certificate chain, and private key.
  final ServerCertificateMetadata? serverCertificateMetadata;

  /// A list of tags that are attached to the new IAM server certificate. The
  /// returned list of tags is sorted by tag key. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  UploadServerCertificateResponse({
    this.serverCertificateMetadata,
    this.tags,
  });
  factory UploadServerCertificateResponse.fromXml(_s.XmlElement elem) {
    return UploadServerCertificateResponse(
      serverCertificateMetadata: _s
          .extractXmlChild(elem, 'ServerCertificateMetadata')
          ?.let(ServerCertificateMetadata.fromXml),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final serverCertificateMetadata = this.serverCertificateMetadata;
    final tags = this.tags;
    return {
      if (serverCertificateMetadata != null)
        'ServerCertificateMetadata': serverCertificateMetadata,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains the response to a successful <a>UploadSigningCertificate</a>
/// request.
class UploadSigningCertificateResponse {
  /// Information about the certificate.
  final SigningCertificate certificate;

  UploadSigningCertificateResponse({
    required this.certificate,
  });
  factory UploadSigningCertificateResponse.fromXml(_s.XmlElement elem) {
    return UploadSigningCertificateResponse(
      certificate:
          SigningCertificate.fromXml(_s.extractXmlChild(elem, 'Certificate')!),
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    return {
      'Certificate': certificate,
    };
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
  /// identifiers</a> in the <i>IAM User Guide</i>.
  ///
  /// The ARN of the policy used to set the permissions boundary for the user.
  final String path;

  /// The stable and unique string identifying the user. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String userId;

  /// The friendly name identifying the user.
  final String userName;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the user's password was last used to sign in to
  /// an Amazon Web Services website. For a list of Amazon Web Services websites
  /// that capture a user's last sign-in time, see the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/credential-reports.html">Credential
  /// reports</a> topic in the <i>IAM User Guide</i>. If a password is used more
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
  final DateTime? passwordLastUsed;

  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary? permissionsBoundary;

  /// A list of tags that are associated with the user. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  User({
    required this.arn,
    required this.createDate,
    required this.path,
    required this.userId,
    required this.userName,
    this.passwordLastUsed,
    this.permissionsBoundary,
    this.tags,
  });
  factory User.fromXml(_s.XmlElement elem) {
    return User(
      arn: _s.extractXmlStringValue(elem, 'Arn')!,
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate')!,
      path: _s.extractXmlStringValue(elem, 'Path')!,
      userId: _s.extractXmlStringValue(elem, 'UserId')!,
      userName: _s.extractXmlStringValue(elem, 'UserName')!,
      passwordLastUsed: _s.extractXmlDateTimeValue(elem, 'PasswordLastUsed'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let(AttachedPermissionsBoundary.fromXml),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createDate = this.createDate;
    final path = this.path;
    final userId = this.userId;
    final userName = this.userName;
    final passwordLastUsed = this.passwordLastUsed;
    final permissionsBoundary = this.permissionsBoundary;
    final tags = this.tags;
    return {
      'Arn': arn,
      'CreateDate': iso8601ToJson(createDate),
      'Path': path,
      'UserId': userId,
      'UserName': userName,
      if (passwordLastUsed != null)
        'PasswordLastUsed': iso8601ToJson(passwordLastUsed),
      if (permissionsBoundary != null)
        'PermissionsBoundary': permissionsBoundary,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information about an IAM user, including all the user's policies
/// and all the IAM groups the user is in.
///
/// This data type is used as a response element in the
/// <a>GetAccountAuthorizationDetails</a> operation.
class UserDetail {
  final String? arn;

  /// A list of the managed policies attached to the user.
  final List<AttachedPolicy>? attachedManagedPolicies;

  /// The date and time, in <a href="http://www.iso.org/iso/iso8601">ISO 8601
  /// date-time format</a>, when the user was created.
  final DateTime? createDate;

  /// A list of IAM groups that the user is in.
  final List<String>? groupList;

  /// The path to the user. For more information about paths, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? path;

  /// The ARN of the policy used to set the permissions boundary for the user.
  ///
  /// For more information about permissions boundaries, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html">Permissions
  /// boundaries for IAM identities </a> in the <i>IAM User Guide</i>.
  final AttachedPermissionsBoundary? permissionsBoundary;

  /// A list of tags that are associated with the user. For more information about
  /// tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  /// The stable and unique string identifying the user. For more information
  /// about IDs, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html">IAM
  /// identifiers</a> in the <i>IAM User Guide</i>.
  final String? userId;

  /// The friendly name identifying the user.
  final String? userName;

  /// A list of the inline policies embedded in the user.
  final List<PolicyDetail>? userPolicyList;

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
          ?.let((elem) =>
              elem.findElements('member').map(AttachedPolicy.fromXml).toList()),
      createDate: _s.extractXmlDateTimeValue(elem, 'CreateDate'),
      groupList: _s
          .extractXmlChild(elem, 'GroupList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'member')),
      path: _s.extractXmlStringValue(elem, 'Path'),
      permissionsBoundary: _s
          .extractXmlChild(elem, 'PermissionsBoundary')
          ?.let(AttachedPermissionsBoundary.fromXml),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
      userId: _s.extractXmlStringValue(elem, 'UserId'),
      userName: _s.extractXmlStringValue(elem, 'UserName'),
      userPolicyList: _s.extractXmlChild(elem, 'UserPolicyList')?.let((elem) =>
          elem.findElements('member').map(PolicyDetail.fromXml).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachedManagedPolicies = this.attachedManagedPolicies;
    final createDate = this.createDate;
    final groupList = this.groupList;
    final path = this.path;
    final permissionsBoundary = this.permissionsBoundary;
    final tags = this.tags;
    final userId = this.userId;
    final userName = this.userName;
    final userPolicyList = this.userPolicyList;
    return {
      if (arn != null) 'Arn': arn,
      if (attachedManagedPolicies != null)
        'AttachedManagedPolicies': attachedManagedPolicies,
      if (createDate != null) 'CreateDate': iso8601ToJson(createDate),
      if (groupList != null) 'GroupList': groupList,
      if (path != null) 'Path': path,
      if (permissionsBoundary != null)
        'PermissionsBoundary': permissionsBoundary,
      if (tags != null) 'Tags': tags,
      if (userId != null) 'UserId': userId,
      if (userName != null) 'UserName': userName,
      if (userPolicyList != null) 'UserPolicyList': userPolicyList,
    };
  }
}

/// Contains information about a virtual MFA device.
class VirtualMFADevice {
  /// The serial number associated with <code>VirtualMFADevice</code>.
  final String serialNumber;

  /// The base32 seed defined as specified in <a
  /// href="https://tools.ietf.org/html/rfc3548.txt">RFC3548</a>. The
  /// <code>Base32StringSeed</code> is base32-encoded.
  final Uint8List? base32StringSeed;

  /// The date and time on which the virtual MFA device was enabled.
  final DateTime? enableDate;

  /// A QR code PNG image that encodes
  /// <code>otpauth://totp/$virtualMFADeviceName@$AccountName?secret=$Base32String</code>
  /// where <code>$virtualMFADeviceName</code> is one of the create call
  /// arguments. <code>AccountName</code> is the user name if set (otherwise, the
  /// account ID otherwise), and <code>Base32String</code> is the seed in base32
  /// format. The <code>Base32String</code> value is base64-encoded.
  final Uint8List? qRCodePNG;

  /// A list of tags that are attached to the virtual MFA device. For more
  /// information about tagging, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html">Tagging
  /// IAM resources</a> in the <i>IAM User Guide</i>.
  final List<Tag>? tags;

  /// The IAM user associated with this virtual MFA device.
  final User? user;

  VirtualMFADevice({
    required this.serialNumber,
    this.base32StringSeed,
    this.enableDate,
    this.qRCodePNG,
    this.tags,
    this.user,
  });
  factory VirtualMFADevice.fromXml(_s.XmlElement elem) {
    return VirtualMFADevice(
      serialNumber: _s.extractXmlStringValue(elem, 'SerialNumber')!,
      base32StringSeed: _s.extractXmlUint8ListValue(elem, 'Base32StringSeed'),
      enableDate: _s.extractXmlDateTimeValue(elem, 'EnableDate'),
      qRCodePNG: _s.extractXmlUint8ListValue(elem, 'QRCodePNG'),
      tags: _s.extractXmlChild(elem, 'Tags')?.let(
          (elem) => elem.findElements('member').map(Tag.fromXml).toList()),
      user: _s.extractXmlChild(elem, 'User')?.let(User.fromXml),
    );
  }

  Map<String, dynamic> toJson() {
    final serialNumber = this.serialNumber;
    final base32StringSeed = this.base32StringSeed;
    final enableDate = this.enableDate;
    final qRCodePNG = this.qRCodePNG;
    final tags = this.tags;
    final user = this.user;
    return {
      'SerialNumber': serialNumber,
      if (base32StringSeed != null)
        'Base32StringSeed': base64Encode(base32StringSeed),
      if (enableDate != null) 'EnableDate': iso8601ToJson(enableDate),
      if (qRCodePNG != null) 'QRCodePNG': base64Encode(qRCodePNG),
      if (tags != null) 'Tags': tags,
      if (user != null) 'User': user,
    };
  }
}

enum AssignmentStatusType {
  assigned,
  unassigned,
  any,
}

extension AssignmentStatusTypeValueExtension on AssignmentStatusType {
  String toValue() {
    switch (this) {
      case AssignmentStatusType.assigned:
        return 'Assigned';
      case AssignmentStatusType.unassigned:
        return 'Unassigned';
      case AssignmentStatusType.any:
        return 'Any';
    }
  }
}

extension AssignmentStatusTypeFromString on String {
  AssignmentStatusType toAssignmentStatusType() {
    switch (this) {
      case 'Assigned':
        return AssignmentStatusType.assigned;
      case 'Unassigned':
        return AssignmentStatusType.unassigned;
      case 'Any':
        return AssignmentStatusType.any;
    }
    throw Exception('$this is not known in enum AssignmentStatusType');
  }
}

enum EncodingType {
  ssh,
  pem,
}

extension EncodingTypeValueExtension on EncodingType {
  String toValue() {
    switch (this) {
      case EncodingType.ssh:
        return 'SSH';
      case EncodingType.pem:
        return 'PEM';
    }
  }
}

extension EncodingTypeFromString on String {
  EncodingType toEncodingType() {
    switch (this) {
      case 'SSH':
        return EncodingType.ssh;
      case 'PEM':
        return EncodingType.pem;
    }
    throw Exception('$this is not known in enum EncodingType');
  }
}

enum GlobalEndpointTokenVersion {
  v1Token,
  v2Token,
}

extension GlobalEndpointTokenVersionValueExtension
    on GlobalEndpointTokenVersion {
  String toValue() {
    switch (this) {
      case GlobalEndpointTokenVersion.v1Token:
        return 'v1Token';
      case GlobalEndpointTokenVersion.v2Token:
        return 'v2Token';
    }
  }
}

extension GlobalEndpointTokenVersionFromString on String {
  GlobalEndpointTokenVersion toGlobalEndpointTokenVersion() {
    switch (this) {
      case 'v1Token':
        return GlobalEndpointTokenVersion.v1Token;
      case 'v2Token':
        return GlobalEndpointTokenVersion.v2Token;
    }
    throw Exception('$this is not known in enum GlobalEndpointTokenVersion');
  }
}

enum JobStatusType {
  inProgress,
  completed,
  failed,
}

extension JobStatusTypeValueExtension on JobStatusType {
  String toValue() {
    switch (this) {
      case JobStatusType.inProgress:
        return 'IN_PROGRESS';
      case JobStatusType.completed:
        return 'COMPLETED';
      case JobStatusType.failed:
        return 'FAILED';
    }
  }
}

extension JobStatusTypeFromString on String {
  JobStatusType toJobStatusType() {
    switch (this) {
      case 'IN_PROGRESS':
        return JobStatusType.inProgress;
      case 'COMPLETED':
        return JobStatusType.completed;
      case 'FAILED':
        return JobStatusType.failed;
    }
    throw Exception('$this is not known in enum JobStatusType');
  }
}

enum PolicyOwnerEntityType {
  user,
  role,
  group,
}

extension PolicyOwnerEntityTypeValueExtension on PolicyOwnerEntityType {
  String toValue() {
    switch (this) {
      case PolicyOwnerEntityType.user:
        return 'USER';
      case PolicyOwnerEntityType.role:
        return 'ROLE';
      case PolicyOwnerEntityType.group:
        return 'GROUP';
    }
  }
}

extension PolicyOwnerEntityTypeFromString on String {
  PolicyOwnerEntityType toPolicyOwnerEntityType() {
    switch (this) {
      case 'USER':
        return PolicyOwnerEntityType.user;
      case 'ROLE':
        return PolicyOwnerEntityType.role;
      case 'GROUP':
        return PolicyOwnerEntityType.group;
    }
    throw Exception('$this is not known in enum PolicyOwnerEntityType');
  }
}

enum PolicyScopeType {
  all,
  aws,
  local,
}

extension PolicyScopeTypeValueExtension on PolicyScopeType {
  String toValue() {
    switch (this) {
      case PolicyScopeType.all:
        return 'All';
      case PolicyScopeType.aws:
        return 'AWS';
      case PolicyScopeType.local:
        return 'Local';
    }
  }
}

extension PolicyScopeTypeFromString on String {
  PolicyScopeType toPolicyScopeType() {
    switch (this) {
      case 'All':
        return PolicyScopeType.all;
      case 'AWS':
        return PolicyScopeType.aws;
      case 'Local':
        return PolicyScopeType.local;
    }
    throw Exception('$this is not known in enum PolicyScopeType');
  }
}

enum PolicyType {
  inline,
  managed,
}

extension PolicyTypeValueExtension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.inline:
        return 'INLINE';
      case PolicyType.managed:
        return 'MANAGED';
    }
  }
}

extension PolicyTypeFromString on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'INLINE':
        return PolicyType.inline;
      case 'MANAGED':
        return PolicyType.managed;
    }
    throw Exception('$this is not known in enum PolicyType');
  }
}

enum SortKeyType {
  serviceNamespaceAscending,
  serviceNamespaceDescending,
  lastAuthenticatedTimeAscending,
  lastAuthenticatedTimeDescending,
}

extension SortKeyTypeValueExtension on SortKeyType {
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
  }
}

extension SortKeyTypeFromString on String {
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
    throw Exception('$this is not known in enum SortKeyType');
  }
}

enum StatusType {
  active,
  inactive,
}

extension StatusTypeValueExtension on StatusType {
  String toValue() {
    switch (this) {
      case StatusType.active:
        return 'Active';
      case StatusType.inactive:
        return 'Inactive';
    }
  }
}

extension StatusTypeFromString on String {
  StatusType toStatusType() {
    switch (this) {
      case 'Active':
        return StatusType.active;
      case 'Inactive':
        return StatusType.inactive;
    }
    throw Exception('$this is not known in enum StatusType');
  }
}

enum SummaryKeyType {
  users,
  usersQuota,
  groups,
  groupsQuota,
  serverCertificates,
  serverCertificatesQuota,
  userPolicySizeQuota,
  groupPolicySizeQuota,
  groupsPerUserQuota,
  signingCertificatesPerUserQuota,
  accessKeysPerUserQuota,
  mFADevices,
  mFADevicesInUse,
  accountMFAEnabled,
  accountAccessKeysPresent,
  accountSigningCertificatesPresent,
  attachedPoliciesPerGroupQuota,
  attachedPoliciesPerRoleQuota,
  attachedPoliciesPerUserQuota,
  policies,
  policiesQuota,
  policySizeQuota,
  policyVersionsInUse,
  policyVersionsInUseQuota,
  versionsPerPolicyQuota,
  globalEndpointTokenVersion,
}

extension SummaryKeyTypeValueExtension on SummaryKeyType {
  String toValue() {
    switch (this) {
      case SummaryKeyType.users:
        return 'Users';
      case SummaryKeyType.usersQuota:
        return 'UsersQuota';
      case SummaryKeyType.groups:
        return 'Groups';
      case SummaryKeyType.groupsQuota:
        return 'GroupsQuota';
      case SummaryKeyType.serverCertificates:
        return 'ServerCertificates';
      case SummaryKeyType.serverCertificatesQuota:
        return 'ServerCertificatesQuota';
      case SummaryKeyType.userPolicySizeQuota:
        return 'UserPolicySizeQuota';
      case SummaryKeyType.groupPolicySizeQuota:
        return 'GroupPolicySizeQuota';
      case SummaryKeyType.groupsPerUserQuota:
        return 'GroupsPerUserQuota';
      case SummaryKeyType.signingCertificatesPerUserQuota:
        return 'SigningCertificatesPerUserQuota';
      case SummaryKeyType.accessKeysPerUserQuota:
        return 'AccessKeysPerUserQuota';
      case SummaryKeyType.mFADevices:
        return 'MFADevices';
      case SummaryKeyType.mFADevicesInUse:
        return 'MFADevicesInUse';
      case SummaryKeyType.accountMFAEnabled:
        return 'AccountMFAEnabled';
      case SummaryKeyType.accountAccessKeysPresent:
        return 'AccountAccessKeysPresent';
      case SummaryKeyType.accountSigningCertificatesPresent:
        return 'AccountSigningCertificatesPresent';
      case SummaryKeyType.attachedPoliciesPerGroupQuota:
        return 'AttachedPoliciesPerGroupQuota';
      case SummaryKeyType.attachedPoliciesPerRoleQuota:
        return 'AttachedPoliciesPerRoleQuota';
      case SummaryKeyType.attachedPoliciesPerUserQuota:
        return 'AttachedPoliciesPerUserQuota';
      case SummaryKeyType.policies:
        return 'Policies';
      case SummaryKeyType.policiesQuota:
        return 'PoliciesQuota';
      case SummaryKeyType.policySizeQuota:
        return 'PolicySizeQuota';
      case SummaryKeyType.policyVersionsInUse:
        return 'PolicyVersionsInUse';
      case SummaryKeyType.policyVersionsInUseQuota:
        return 'PolicyVersionsInUseQuota';
      case SummaryKeyType.versionsPerPolicyQuota:
        return 'VersionsPerPolicyQuota';
      case SummaryKeyType.globalEndpointTokenVersion:
        return 'GlobalEndpointTokenVersion';
    }
  }
}

extension SummaryKeyTypeFromString on String {
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
    throw Exception('$this is not known in enum SummaryKeyType');
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class CredentialReportExpiredException extends _s.GenericAwsException {
  CredentialReportExpiredException({String? type, String? message})
      : super(
            type: type,
            code: 'CredentialReportExpiredException',
            message: message);
}

class CredentialReportNotPresentException extends _s.GenericAwsException {
  CredentialReportNotPresentException({String? type, String? message})
      : super(
            type: type,
            code: 'CredentialReportNotPresentException',
            message: message);
}

class CredentialReportNotReadyException extends _s.GenericAwsException {
  CredentialReportNotReadyException({String? type, String? message})
      : super(
            type: type,
            code: 'CredentialReportNotReadyException',
            message: message);
}

class DeleteConflictException extends _s.GenericAwsException {
  DeleteConflictException({String? type, String? message})
      : super(type: type, code: 'DeleteConflictException', message: message);
}

class DuplicateCertificateException extends _s.GenericAwsException {
  DuplicateCertificateException({String? type, String? message})
      : super(
            type: type,
            code: 'DuplicateCertificateException',
            message: message);
}

class DuplicateSSHPublicKeyException extends _s.GenericAwsException {
  DuplicateSSHPublicKeyException({String? type, String? message})
      : super(
            type: type,
            code: 'DuplicateSSHPublicKeyException',
            message: message);
}

class EntityAlreadyExistsException extends _s.GenericAwsException {
  EntityAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'EntityAlreadyExistsException', message: message);
}

class EntityTemporarilyUnmodifiableException extends _s.GenericAwsException {
  EntityTemporarilyUnmodifiableException({String? type, String? message})
      : super(
            type: type,
            code: 'EntityTemporarilyUnmodifiableException',
            message: message);
}

class InvalidAuthenticationCodeException extends _s.GenericAwsException {
  InvalidAuthenticationCodeException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidAuthenticationCodeException',
            message: message);
}

class InvalidCertificateException extends _s.GenericAwsException {
  InvalidCertificateException({String? type, String? message})
      : super(
            type: type, code: 'InvalidCertificateException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidPublicKeyException extends _s.GenericAwsException {
  InvalidPublicKeyException({String? type, String? message})
      : super(type: type, code: 'InvalidPublicKeyException', message: message);
}

class InvalidUserTypeException extends _s.GenericAwsException {
  InvalidUserTypeException({String? type, String? message})
      : super(type: type, code: 'InvalidUserTypeException', message: message);
}

class KeyPairMismatchException extends _s.GenericAwsException {
  KeyPairMismatchException({String? type, String? message})
      : super(type: type, code: 'KeyPairMismatchException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedCertificateException extends _s.GenericAwsException {
  MalformedCertificateException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedCertificateException',
            message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class NoSuchEntityException extends _s.GenericAwsException {
  NoSuchEntityException({String? type, String? message})
      : super(type: type, code: 'NoSuchEntityException', message: message);
}

class OpenIdIdpCommunicationErrorException extends _s.GenericAwsException {
  OpenIdIdpCommunicationErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'OpenIdIdpCommunicationErrorException',
            message: message);
}

class PasswordPolicyViolationException extends _s.GenericAwsException {
  PasswordPolicyViolationException({String? type, String? message})
      : super(
            type: type,
            code: 'PasswordPolicyViolationException',
            message: message);
}

class PolicyEvaluationException extends _s.GenericAwsException {
  PolicyEvaluationException({String? type, String? message})
      : super(type: type, code: 'PolicyEvaluationException', message: message);
}

class PolicyNotAttachableException extends _s.GenericAwsException {
  PolicyNotAttachableException({String? type, String? message})
      : super(
            type: type, code: 'PolicyNotAttachableException', message: message);
}

class ReportGenerationLimitExceededException extends _s.GenericAwsException {
  ReportGenerationLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ReportGenerationLimitExceededException',
            message: message);
}

class ServiceFailureException extends _s.GenericAwsException {
  ServiceFailureException({String? type, String? message})
      : super(type: type, code: 'ServiceFailureException', message: message);
}

class ServiceNotSupportedException extends _s.GenericAwsException {
  ServiceNotSupportedException({String? type, String? message})
      : super(
            type: type, code: 'ServiceNotSupportedException', message: message);
}

class UnmodifiableEntityException extends _s.GenericAwsException {
  UnmodifiableEntityException({String? type, String? message})
      : super(
            type: type, code: 'UnmodifiableEntityException', message: message);
}

class UnrecognizedPublicKeyEncodingException extends _s.GenericAwsException {
  UnrecognizedPublicKeyEncodingException({String? type, String? message})
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
  'OpenIdIdpCommunicationErrorException': (type, message) =>
      OpenIdIdpCommunicationErrorException(type: type, message: message),
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
