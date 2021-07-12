// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Amazon WorkMail is a secure, managed business email and calendaring service
/// with support for existing desktop and mobile email clients. You can access
/// your email, contacts, and calendars using Microsoft Outlook, your browser,
/// or other native iOS and Android email applications. You can integrate
/// WorkMail with your existing corporate directory and control both the keys
/// that encrypt your data and the location in which your data is stored.
///
/// The WorkMail API is designed for the following scenarios:
///
/// <ul>
/// <li>
/// Listing and describing organizations
/// </li>
/// </ul>
/// <ul>
/// <li>
/// Managing users
/// </li>
/// </ul>
/// <ul>
/// <li>
/// Managing groups
/// </li>
/// </ul>
/// <ul>
/// <li>
/// Managing resources
/// </li>
/// </ul>
/// All WorkMail API operations are Amazon-authenticated and certificate-signed.
/// They not only require the use of the AWS SDK, but also allow for the
/// exclusive use of AWS Identity and Access Management users and roles to help
/// facilitate access, trust, and permission policies. By creating a role and
/// allowing an IAM user to access the WorkMail site, the IAM user gains full
/// administrative visibility into the entire WorkMail organization (or as set
/// in the IAM policy). This includes, but is not limited to, the ability to
/// create, update, and delete users, groups, and resources. This allows
/// developers to perform the scenarios listed above, as well as give users the
/// ability to grant access on a selective basis using the IAM model.
class WorkMail {
  final _s.JsonProtocol _protocol;
  WorkMail({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workmail',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds a member (user or group) to the resource's set of delegates.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The member (user or group) to associate to the resource.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the resource exists.
  ///
  /// Parameter [resourceId] :
  /// The resource for which members (users or groups) are associated.
  Future<void> associateDelegateToResource({
    required String entityId,
    required String organizationId,
    required String resourceId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.AssociateDelegateToResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );
  }

  /// Adds a member (user or group) to the group's set.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [groupId] :
  /// The group to which the member (user or group) is associated.
  ///
  /// Parameter [memberId] :
  /// The member (user or group) to associate to the group.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the group exists.
  Future<void> associateMemberToGroup({
    required String groupId,
    required String memberId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.AssociateMemberToGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'MemberId': memberId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Cancels a mailbox export job.
  /// <note>
  /// If the mailbox export job is near completion, it might not be possible to
  /// cancel it.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [jobId] :
  /// The job ID.
  ///
  /// Parameter [organizationId] :
  /// The organization ID.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the client request.
  Future<void> cancelMailboxExportJob({
    required String jobId,
    required String organizationId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CancelMailboxExportJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        'OrganizationId': organizationId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Adds an alias to the set of a given member (user or group) of Amazon
  /// WorkMail.
  ///
  /// May throw [EmailAddressInUseException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [alias] :
  /// The alias to add to the member set.
  ///
  /// Parameter [entityId] :
  /// The member (user or group) to which this alias is added.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the member (user or group) exists.
  Future<void> createAlias({
    required String alias,
    required String entityId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(alias, 'alias');
    _s.validateStringLength(
      'alias',
      alias,
      1,
      254,
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateAlias'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Alias': alias,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Creates a group that can be used in Amazon WorkMail by calling the
  /// <a>RegisterToWorkMail</a> operation.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ReservedNameException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [name] :
  /// The name of the group.
  ///
  /// Parameter [organizationId] :
  /// The organization under which the group is to be created.
  Future<CreateGroupResponse> createGroup({
    required String name,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'OrganizationId': organizationId,
      },
    );

    return CreateGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new mobile device access rule for the specified Amazon WorkMail
  /// organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [effect] :
  /// The effect of the rule when it matches. Allowed values are
  /// <code>ALLOW</code> or <code>DENY</code>.
  ///
  /// Parameter [name] :
  /// The rule name.
  ///
  /// Parameter [organizationId] :
  /// The Amazon WorkMail organization under which the rule will be created.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the client request.
  ///
  /// Parameter [description] :
  /// The rule description.
  ///
  /// Parameter [deviceModels] :
  /// Device models that the rule will match.
  ///
  /// Parameter [deviceOperatingSystems] :
  /// Device operating systems that the rule will match.
  ///
  /// Parameter [deviceTypes] :
  /// Device types that the rule will match.
  ///
  /// Parameter [deviceUserAgents] :
  /// Device user agents that the rule will match.
  ///
  /// Parameter [notDeviceModels] :
  /// Device models that the rule <b>will not</b> match. All other device models
  /// will match.
  ///
  /// Parameter [notDeviceOperatingSystems] :
  /// Device operating systems that the rule <b>will not</b> match. All other
  /// device operating systems will match.
  ///
  /// Parameter [notDeviceTypes] :
  /// Device types that the rule <b>will not</b> match. All other device types
  /// will match.
  ///
  /// Parameter [notDeviceUserAgents] :
  /// Device user agents that the rule <b>will not</b> match. All other device
  /// user agents will match.
  Future<CreateMobileDeviceAccessRuleResponse> createMobileDeviceAccessRule({
    required MobileDeviceAccessRuleEffect effect,
    required String name,
    required String organizationId,
    String? clientToken,
    String? description,
    List<String>? deviceModels,
    List<String>? deviceOperatingSystems,
    List<String>? deviceTypes,
    List<String>? deviceUserAgents,
    List<String>? notDeviceModels,
    List<String>? notDeviceOperatingSystems,
    List<String>? notDeviceTypes,
    List<String>? notDeviceUserAgents,
  }) async {
    ArgumentError.checkNotNull(effect, 'effect');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateMobileDeviceAccessRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Effect': effect.toValue(),
        'Name': name,
        'OrganizationId': organizationId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (deviceModels != null) 'DeviceModels': deviceModels,
        if (deviceOperatingSystems != null)
          'DeviceOperatingSystems': deviceOperatingSystems,
        if (deviceTypes != null) 'DeviceTypes': deviceTypes,
        if (deviceUserAgents != null) 'DeviceUserAgents': deviceUserAgents,
        if (notDeviceModels != null) 'NotDeviceModels': notDeviceModels,
        if (notDeviceOperatingSystems != null)
          'NotDeviceOperatingSystems': notDeviceOperatingSystems,
        if (notDeviceTypes != null) 'NotDeviceTypes': notDeviceTypes,
        if (notDeviceUserAgents != null)
          'NotDeviceUserAgents': notDeviceUserAgents,
      },
    );

    return CreateMobileDeviceAccessRuleResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon WorkMail organization. Optionally, you can choose to
  /// associate an existing AWS Directory Service directory with your
  /// organization. If an AWS Directory Service directory ID is specified, the
  /// organization alias must match the directory alias. If you choose not to
  /// associate an existing directory with your organization, then we create a
  /// new Amazon WorkMail directory for you. For more information, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/add_new_organization.html">Adding
  /// an organization</a> in the <i>Amazon WorkMail Administrator Guide</i>.
  ///
  /// You can associate multiple email domains with an organization, then set
  /// your default email domain from the Amazon WorkMail console. You can also
  /// associate a domain that is managed in an Amazon Route 53 public hosted
  /// zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html">Adding
  /// a domain</a> and <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/default_domain.html">Choosing
  /// the default domain</a> in the <i>Amazon WorkMail Administrator Guide</i>.
  ///
  /// Optionally, you can use a customer managed master key from AWS Key
  /// Management Service (AWS KMS) to encrypt email for your organization. If
  /// you don't associate an AWS KMS key, Amazon WorkMail creates a default AWS
  /// managed master key for you.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [DirectoryInUseException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [NameAvailabilityException].
  ///
  /// Parameter [alias] :
  /// The organization alias.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token associated with the request.
  ///
  /// Parameter [directoryId] :
  /// The AWS Directory Service directory ID.
  ///
  /// Parameter [domains] :
  /// The email domains to associate with the organization.
  ///
  /// Parameter [enableInteroperability] :
  /// When <code>true</code>, allows organization interoperability between
  /// Amazon WorkMail and Microsoft Exchange. Can only be set to
  /// <code>true</code> if an AD Connector directory ID is included in the
  /// request.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of a customer managed master key from AWS
  /// KMS.
  Future<CreateOrganizationResponse> createOrganization({
    required String alias,
    String? clientToken,
    String? directoryId,
    List<Domain>? domains,
    bool? enableInteroperability,
    String? kmsKeyArn,
  }) async {
    ArgumentError.checkNotNull(alias, 'alias');
    _s.validateStringLength(
      'alias',
      alias,
      1,
      62,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    _s.validateStringLength(
      'directoryId',
      directoryId,
      12,
      12,
    );
    _s.validateStringLength(
      'kmsKeyArn',
      kmsKeyArn,
      20,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Alias': alias,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (directoryId != null) 'DirectoryId': directoryId,
        if (domains != null) 'Domains': domains,
        if (enableInteroperability != null)
          'EnableInteroperability': enableInteroperability,
        if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      },
    );

    return CreateOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon WorkMail resource.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ReservedNameException].
  ///
  /// Parameter [name] :
  /// The name of the new resource.
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// created.
  ///
  /// Parameter [type] :
  /// The type of the new resource. The available types are
  /// <code>equipment</code> and <code>room</code>.
  Future<CreateResourceResponse> createResource({
    required String name,
    required String organizationId,
    required ResourceType type,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      20,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'OrganizationId': organizationId,
        'Type': type.toValue(),
      },
    );

    return CreateResourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a user who can be used in Amazon WorkMail by calling the
  /// <a>RegisterToWorkMail</a> operation.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPasswordException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ReservedNameException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [displayName] :
  /// The display name for the new user.
  ///
  /// Parameter [name] :
  /// The name for the new user. WorkMail directory user names have a maximum
  /// length of 64. All others have a maximum length of 20.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization for which the user is created.
  ///
  /// Parameter [password] :
  /// The password for the new user.
  Future<CreateUserResponse> createUser({
    required String displayName,
    required String name,
    required String organizationId,
    required String password,
  }) async {
    ArgumentError.checkNotNull(displayName, 'displayName');
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DisplayName': displayName,
        'Name': name,
        'OrganizationId': organizationId,
        'Password': password,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an access control rule for the specified WorkMail organization.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [name] :
  /// The name of the access control rule.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization.
  Future<void> deleteAccessControlRule({
    required String name,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteAccessControlRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Remove one or more specified aliases from a set of aliases for a given
  /// user.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [alias] :
  /// The aliases to be removed from the user's set of aliases. Duplicate
  /// entries in the list are collapsed into single entries (the list is
  /// transformed into a set).
  ///
  /// Parameter [entityId] :
  /// The identifier for the member (user or group) from which to have the
  /// aliases removed.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user exists.
  Future<void> deleteAlias({
    required String alias,
    required String entityId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(alias, 'alias');
    _s.validateStringLength(
      'alias',
      alias,
      1,
      254,
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteAlias'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Alias': alias,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Deletes a group from Amazon WorkMail.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group to be deleted.
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the group.
  Future<void> deleteGroup({
    required String groupId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Deletes permissions granted to a member (user or group).
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier of the member (user or group) that owns the mailbox.
  ///
  /// Parameter [granteeId] :
  /// The identifier of the member (user or group) for which to delete granted
  /// permissions.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization under which the member (user or group)
  /// exists.
  Future<void> deleteMailboxPermissions({
    required String entityId,
    required String granteeId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(granteeId, 'granteeId');
    _s.validateStringLength(
      'granteeId',
      granteeId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteMailboxPermissions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'GranteeId': granteeId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Deletes a mobile device access rule for the specified Amazon WorkMail
  /// organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [mobileDeviceAccessRuleId] :
  /// The identifier of the rule to be deleted.
  ///
  /// Parameter [organizationId] :
  /// The Amazon WorkMail organization under which the rule will be deleted.
  Future<void> deleteMobileDeviceAccessRule({
    required String mobileDeviceAccessRuleId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(
        mobileDeviceAccessRuleId, 'mobileDeviceAccessRuleId');
    _s.validateStringLength(
      'mobileDeviceAccessRuleId',
      mobileDeviceAccessRuleId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteMobileDeviceAccessRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MobileDeviceAccessRuleId': mobileDeviceAccessRuleId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Deletes an Amazon WorkMail organization and all underlying AWS resources
  /// managed by Amazon WorkMail as part of the organization. You can choose
  /// whether to delete the associated directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/remove_organization.html">Removing
  /// an organization</a> in the <i>Amazon WorkMail Administrator Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [deleteDirectory] :
  /// If true, deletes the AWS Directory Service directory associated with the
  /// organization.
  ///
  /// Parameter [organizationId] :
  /// The organization ID.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token associated with the request.
  Future<DeleteOrganizationResponse> deleteOrganization({
    required bool deleteDirectory,
    required String organizationId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(deleteDirectory, 'deleteDirectory');
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeleteDirectory': deleteDirectory,
        'OrganizationId': organizationId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified resource.
  ///
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization from which the resource is
  /// deleted.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be deleted.
  Future<void> deleteResource({
    required String organizationId,
    required String resourceId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );
  }

  /// Deletes the specified retention policy from the specified organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [id] :
  /// The retention policy ID.
  ///
  /// Parameter [organizationId] :
  /// The organization ID.
  Future<void> deleteRetentionPolicy({
    required String id,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteRetentionPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Deletes a user from Amazon WorkMail and all subsequent systems. Before you
  /// can delete a user, the user state must be <code>DISABLED</code>. Use the
  /// <a>DescribeUser</a> action to confirm the user state.
  ///
  /// Deleting a user is permanent and cannot be undone. WorkMail archives user
  /// mailboxes for 30 days before they are permanently removed.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the user to be deleted.
  ///
  /// Parameter [userId] :
  /// The identifier of the user to be deleted.
  Future<void> deleteUser({
    required String organizationId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteUser'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );
  }

  /// Mark a user, group, or resource as no longer used in Amazon WorkMail. This
  /// action disassociates the mailbox and schedules it for clean-up. WorkMail
  /// keeps mailboxes for 30 days before they are permanently removed. The
  /// functionality in the console is <i>Disable</i>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the member (user or group) to be updated.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the Amazon WorkMail entity
  /// exists.
  Future<void> deregisterFromWorkMail({
    required String entityId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeregisterFromWorkMail'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Returns the data available for the group.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [groupId] :
  /// The identifier for the group to be described.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  Future<DescribeGroupResponse> describeGroup({
    required String groupId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'OrganizationId': organizationId,
      },
    );

    return DescribeGroupResponse.fromJson(jsonResponse.body);
  }

  /// Describes the current status of a mailbox export job.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [jobId] :
  /// The mailbox export job ID.
  ///
  /// Parameter [organizationId] :
  /// The organization ID.
  Future<DescribeMailboxExportJobResponse> describeMailboxExportJob({
    required String jobId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeMailboxExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        'OrganizationId': organizationId,
      },
    );

    return DescribeMailboxExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Provides more information regarding a given organization based on its
  /// identifier.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization to be described.
  Future<DescribeOrganizationResponse> describeOrganization({
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
      },
    );

    return DescribeOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Returns the data available for the resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// described.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be described.
  Future<DescribeResourceResponse> describeResource({
    required String organizationId,
    required String resourceId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );

    return DescribeResourceResponse.fromJson(jsonResponse.body);
  }

  /// Provides information regarding the user.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user exists.
  ///
  /// Parameter [userId] :
  /// The identifier for the user to be described.
  Future<DescribeUserResponse> describeUser({
    required String organizationId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return DescribeUserResponse.fromJson(jsonResponse.body);
  }

  /// Removes a member from the resource's set of delegates.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the member (user, group) to be removed from the
  /// resource's delegates.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the resource exists.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource from which delegates' set members are
  /// removed.
  Future<void> disassociateDelegateFromResource({
    required String entityId,
    required String organizationId,
    required String resourceId,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DisassociateDelegateFromResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
      },
    );
  }

  /// Removes a member from a group.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [groupId] :
  /// The identifier for the group from which members are removed.
  ///
  /// Parameter [memberId] :
  /// The identifier for the member to be removed to the group.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  Future<void> disassociateMemberFromGroup({
    required String groupId,
    required String memberId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DisassociateMemberFromGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'MemberId': memberId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Gets the effects of an organization's access control rules as they apply
  /// to a specified IPv4 address, access protocol action, or user ID.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [action] :
  /// The access protocol action. Valid values include <code>ActiveSync</code>,
  /// <code>AutoDiscover</code>, <code>EWS</code>, <code>IMAP</code>,
  /// <code>SMTP</code>, <code>WindowsOutlook</code>, and <code>WebMail</code>.
  ///
  /// Parameter [ipAddress] :
  /// The IPv4 address.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<GetAccessControlEffectResponse> getAccessControlEffect({
    required String action,
    required String ipAddress,
    required String organizationId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    _s.validateStringLength(
      'action',
      action,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ipAddress, 'ipAddress');
    _s.validateStringLength(
      'ipAddress',
      ipAddress,
      1,
      15,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetAccessControlEffect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action,
        'IpAddress': ipAddress,
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return GetAccessControlEffectResponse.fromJson(jsonResponse.body);
  }

  /// Gets the default retention policy details for the specified organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [organizationId] :
  /// The organization ID.
  Future<GetDefaultRetentionPolicyResponse> getDefaultRetentionPolicy({
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetDefaultRetentionPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
      },
    );

    return GetDefaultRetentionPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Requests a user's mailbox details for a specified organization and user.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization that contains the user whose mailbox
  /// details are being requested.
  ///
  /// Parameter [userId] :
  /// The identifier for the user whose mailbox details are being requested.
  Future<GetMailboxDetailsResponse> getMailboxDetails({
    required String organizationId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetMailboxDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return GetMailboxDetailsResponse.fromJson(jsonResponse.body);
  }

  /// Simulates the effect of the mobile device access rules for the given
  /// attributes of a sample access event. Use this method to test the effects
  /// of the current set of mobile device access rules for the Amazon WorkMail
  /// organization for a particular user's attributes.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The Amazon WorkMail organization to simulate the access effect for.
  ///
  /// Parameter [deviceModel] :
  /// Device model the simulated user will report.
  ///
  /// Parameter [deviceOperatingSystem] :
  /// Device operating system the simulated user will report.
  ///
  /// Parameter [deviceType] :
  /// Device type the simulated user will report.
  ///
  /// Parameter [deviceUserAgent] :
  /// Device user agent the simulated user will report.
  Future<GetMobileDeviceAccessEffectResponse> getMobileDeviceAccessEffect({
    required String organizationId,
    String? deviceModel,
    String? deviceOperatingSystem,
    String? deviceType,
    String? deviceUserAgent,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateStringLength(
      'deviceModel',
      deviceModel,
      1,
      256,
    );
    _s.validateStringLength(
      'deviceOperatingSystem',
      deviceOperatingSystem,
      1,
      256,
    );
    _s.validateStringLength(
      'deviceType',
      deviceType,
      1,
      256,
    );
    _s.validateStringLength(
      'deviceUserAgent',
      deviceUserAgent,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetMobileDeviceAccessEffect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        if (deviceModel != null) 'DeviceModel': deviceModel,
        if (deviceOperatingSystem != null)
          'DeviceOperatingSystem': deviceOperatingSystem,
        if (deviceType != null) 'DeviceType': deviceType,
        if (deviceUserAgent != null) 'DeviceUserAgent': deviceUserAgent,
      },
    );

    return GetMobileDeviceAccessEffectResponse.fromJson(jsonResponse.body);
  }

  /// Lists the access control rules for the specified organization.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization.
  Future<ListAccessControlRulesResponse> listAccessControlRules({
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListAccessControlRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
      },
    );

    return ListAccessControlRulesResponse.fromJson(jsonResponse.body);
  }

  /// Creates a paginated call to list the aliases associated with a given
  /// entity.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the entity for which to list the aliases.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the entity exists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListAliasesResponse> listAliases({
    required String entityId,
    required String organizationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAliasesResponse.fromJson(jsonResponse.body);
  }

  /// Returns an overview of the members of a group. Users and groups can be
  /// members of a group.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [groupId] :
  /// The identifier for the group to which the members (users or groups) are
  /// associated.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListGroupMembersResponse> listGroupMembers({
    required String groupId,
    required String organizationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    _s.validateStringLength(
      'groupId',
      groupId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListGroupMembers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'OrganizationId': organizationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupMembersResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the organization's groups.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the groups exist.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListGroupsResponse> listGroups({
    required String organizationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the mailbox export jobs started for the specified organization
  /// within the last seven days.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The organization ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  Future<ListMailboxExportJobsResponse> listMailboxExportJobs({
    required String organizationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListMailboxExportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListMailboxExportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the mailbox permissions associated with a user, group, or resource
  /// mailbox.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier of the user, group, or resource for which to list mailbox
  /// permissions.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization under which the user, group, or
  /// resource exists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListMailboxPermissionsResponse> listMailboxPermissions({
    required String entityId,
    required String organizationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListMailboxPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'OrganizationId': organizationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListMailboxPermissionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the mobile device access rules for the specified Amazon WorkMail
  /// organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The Amazon WorkMail organization for which to list the rules.
  Future<ListMobileDeviceAccessRulesResponse> listMobileDeviceAccessRules({
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListMobileDeviceAccessRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
      },
    );

    return ListMobileDeviceAccessRulesResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the customer's organizations.
  ///
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListOrganizationsResponse> listOrganizations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListOrganizations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListOrganizationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the delegates associated with a resource. Users and groups can be
  /// resource delegates and answer requests on behalf of the resource.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization that contains the resource for which
  /// delegates are listed.
  ///
  /// Parameter [resourceId] :
  /// The identifier for the resource whose delegates are listed.
  ///
  /// Parameter [maxResults] :
  /// The number of maximum results in a page.
  ///
  /// Parameter [nextToken] :
  /// The token used to paginate through the delegates associated with a
  /// resource.
  Future<ListResourceDelegatesResponse> listResourceDelegates({
    required String organizationId,
    required String resourceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      12,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListResourceDelegates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourceDelegatesResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the organization's resources.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the resources exist.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListResourcesResponse> listResources({
    required String organizationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListResources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags applied to an Amazon WorkMail organization resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Returns summaries of the organization's users.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the users exist.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListUsersResponse> listUsers({
    required String organizationId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUsersResponse.fromJson(jsonResponse.body);
  }

  /// Adds a new access control rule for the specified organization. The rule
  /// allows or denies access to the organization for the specified IPv4
  /// addresses, access protocol actions, and user IDs. Adding a new rule with
  /// the same name as an existing rule replaces the older rule.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [EntityNotFoundException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [description] :
  /// The rule description.
  ///
  /// Parameter [effect] :
  /// The rule effect.
  ///
  /// Parameter [name] :
  /// The rule name.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization.
  ///
  /// Parameter [actions] :
  /// Access protocol actions to include in the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  ///
  /// Parameter [ipRanges] :
  /// IPv4 CIDR ranges to include in the rule.
  ///
  /// Parameter [notActions] :
  /// Access protocol actions to exclude from the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  ///
  /// Parameter [notIpRanges] :
  /// IPv4 CIDR ranges to exclude from the rule.
  ///
  /// Parameter [notUserIds] :
  /// User IDs to exclude from the rule.
  ///
  /// Parameter [userIds] :
  /// User IDs to include in the rule.
  Future<void> putAccessControlRule({
    required String description,
    required AccessControlRuleEffect effect,
    required String name,
    required String organizationId,
    List<String>? actions,
    List<String>? ipRanges,
    List<String>? notActions,
    List<String>? notIpRanges,
    List<String>? notUserIds,
    List<String>? userIds,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(effect, 'effect');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutAccessControlRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'Effect': effect.toValue(),
        'Name': name,
        'OrganizationId': organizationId,
        if (actions != null) 'Actions': actions,
        if (ipRanges != null) 'IpRanges': ipRanges,
        if (notActions != null) 'NotActions': notActions,
        if (notIpRanges != null) 'NotIpRanges': notIpRanges,
        if (notUserIds != null) 'NotUserIds': notUserIds,
        if (userIds != null) 'UserIds': userIds,
      },
    );
  }

  /// Sets permissions for a user, group, or resource. This replaces any
  /// pre-existing permissions.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier of the user, group, or resource for which to update mailbox
  /// permissions.
  ///
  /// Parameter [granteeId] :
  /// The identifier of the user, group, or resource to which to grant the
  /// permissions.
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization under which the user, group, or
  /// resource exists.
  ///
  /// Parameter [permissionValues] :
  /// The permissions granted to the grantee. SEND_AS allows the grantee to send
  /// email as the owner of the mailbox (the grantee is not mentioned on these
  /// emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the
  /// owner of the mailbox (the grantee is not mentioned as the physical sender
  /// of these emails). FULL_ACCESS allows the grantee full access to the
  /// mailbox, irrespective of other folder-level permissions set on the
  /// mailbox.
  Future<void> putMailboxPermissions({
    required String entityId,
    required String granteeId,
    required String organizationId,
    required List<PermissionType> permissionValues,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(granteeId, 'granteeId');
    _s.validateStringLength(
      'granteeId',
      granteeId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(permissionValues, 'permissionValues');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutMailboxPermissions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'GranteeId': granteeId,
        'OrganizationId': organizationId,
        'PermissionValues': permissionValues.map((e) => e.toValue()).toList(),
      },
    );
  }

  /// Puts a retention policy to the specified organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [folderConfigurations] :
  /// The retention policy folder configurations.
  ///
  /// Parameter [name] :
  /// The retention policy name.
  ///
  /// Parameter [organizationId] :
  /// The organization ID.
  ///
  /// Parameter [description] :
  /// The retention policy description.
  ///
  /// Parameter [id] :
  /// The retention policy ID.
  Future<void> putRetentionPolicy({
    required List<FolderConfiguration> folderConfigurations,
    required String name,
    required String organizationId,
    String? description,
    String? id,
  }) async {
    ArgumentError.checkNotNull(folderConfigurations, 'folderConfigurations');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'id',
      id,
      1,
      64,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutRetentionPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FolderConfigurations': folderConfigurations,
        'Name': name,
        'OrganizationId': organizationId,
        if (description != null) 'Description': description,
        if (id != null) 'Id': id,
      },
    );
  }

  /// Registers an existing and disabled user, group, or resource for Amazon
  /// WorkMail use by associating a mailbox and calendaring capabilities. It
  /// performs no change if the user, group, or resource is enabled and fails if
  /// the user, group, or resource is deleted. This operation results in the
  /// accumulation of costs. For more information, see <a
  /// href="https://aws.amazon.com/workmail/pricing">Pricing</a>. The equivalent
  /// console functionality for this operation is <i>Enable</i>.
  ///
  /// Users can either be created by calling the <a>CreateUser</a> API operation
  /// or they can be synchronized from your directory. For more information, see
  /// <a>DeregisterFromWorkMail</a>.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EmailAddressInUseException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [EntityAlreadyRegisteredException].
  /// May throw [InvalidParameterException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [email] :
  /// The email for the user, group, or resource to be updated.
  ///
  /// Parameter [entityId] :
  /// The identifier for the user, group, or resource to be updated.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user, group, or
  /// resource exists.
  Future<void> registerToWorkMail({
    required String email,
    required String entityId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(email, 'email');
    _s.validateStringLength(
      'email',
      email,
      1,
      254,
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.RegisterToWorkMail'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Email': email,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Allows the administrator to reset the password for a user.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidPasswordException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization that contains the user for which the
  /// password is reset.
  ///
  /// Parameter [password] :
  /// The new password for the user.
  ///
  /// Parameter [userId] :
  /// The identifier of the user for whom the password is reset.
  Future<void> resetPassword({
    required String organizationId,
    required String password,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
    _s.validateStringLength(
      'password',
      password,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ResetPassword'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'Password': password,
        'UserId': userId,
      },
    );
  }

  /// Starts a mailbox export job to export MIME-format email messages and
  /// calendar items from the specified mailbox to the specified Amazon Simple
  /// Storage Service (Amazon S3) bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/mail-export.html">Exporting
  /// mailbox content</a> in the <i>Amazon WorkMail Administrator Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [entityId] :
  /// The identifier of the user or resource associated with the mailbox.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service
  /// (AWS KMS) key that encrypts the exported mailbox content.
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the AWS Identity and Access Management (IAM) role that grants
  /// write permission to the S3 bucket.
  ///
  /// Parameter [s3BucketName] :
  /// The name of the S3 bucket.
  ///
  /// Parameter [s3Prefix] :
  /// The S3 bucket prefix.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the client request.
  ///
  /// Parameter [description] :
  /// The mailbox export job description.
  Future<StartMailboxExportJobResponse> startMailboxExportJob({
    required String entityId,
    required String kmsKeyArn,
    required String organizationId,
    required String roleArn,
    required String s3BucketName,
    required String s3Prefix,
    String? clientToken,
    String? description,
  }) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(kmsKeyArn, 'kmsKeyArn');
    _s.validateStringLength(
      'kmsKeyArn',
      kmsKeyArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3BucketName, 's3BucketName');
    _s.validateStringLength(
      's3BucketName',
      s3BucketName,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3Prefix, 's3Prefix');
    _s.validateStringLength(
      's3Prefix',
      s3Prefix,
      1,
      1023,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      128,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1023,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.StartMailboxExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityId': entityId,
        'KmsKeyArn': kmsKeyArn,
        'OrganizationId': organizationId,
        'RoleArn': roleArn,
        'S3BucketName': s3BucketName,
        'S3Prefix': s3Prefix,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
      },
    );

    return StartMailboxExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Applies the specified tags to the specified Amazon WorkMail organization
  /// resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Untags the specified tags from the specified Amazon WorkMail organization
  /// resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates a user's current mailbox quota for a specified organization and
  /// user.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  ///
  /// Parameter [mailboxQuota] :
  /// The updated mailbox quota, in MB, for the specified user.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization that contains the user for whom to
  /// update the mailbox quota.
  ///
  /// Parameter [userId] :
  /// The identifer for the user for whom to update the mailbox quota.
  Future<void> updateMailboxQuota({
    required int mailboxQuota,
    required String organizationId,
    required String userId,
  }) async {
    ArgumentError.checkNotNull(mailboxQuota, 'mailboxQuota');
    _s.validateNumRange(
      'mailboxQuota',
      mailboxQuota,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      12,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateMailboxQuota'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MailboxQuota': mailboxQuota,
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );
  }

  /// Updates a mobile device access rule for the specified Amazon WorkMail
  /// organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [EntityNotFoundException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [effect] :
  /// The effect of the rule when it matches. Allowed values are
  /// <code>ALLOW</code> or <code>DENY</code>.
  ///
  /// Parameter [mobileDeviceAccessRuleId] :
  /// The identifier of the rule to be updated.
  ///
  /// Parameter [name] :
  /// The updated rule name.
  ///
  /// Parameter [organizationId] :
  /// The Amazon WorkMail organization under which the rule will be updated.
  ///
  /// Parameter [description] :
  /// The updated rule description.
  ///
  /// Parameter [deviceModels] :
  /// Device models that the updated rule will match.
  ///
  /// Parameter [deviceOperatingSystems] :
  /// Device operating systems that the updated rule will match.
  ///
  /// Parameter [deviceTypes] :
  /// Device types that the updated rule will match.
  ///
  /// Parameter [deviceUserAgents] :
  /// User agents that the updated rule will match.
  ///
  /// Parameter [notDeviceModels] :
  /// Device models that the updated rule <b>will not</b> match. All other
  /// device models will match.
  ///
  /// Parameter [notDeviceOperatingSystems] :
  /// Device operating systems that the updated rule <b>will not</b> match. All
  /// other device operating systems will match.
  ///
  /// Parameter [notDeviceTypes] :
  /// Device types that the updated rule <b>will not</b> match. All other device
  /// types will match.
  ///
  /// Parameter [notDeviceUserAgents] :
  /// User agents that the updated rule <b>will not</b> match. All other user
  /// agents will match.
  Future<void> updateMobileDeviceAccessRule({
    required MobileDeviceAccessRuleEffect effect,
    required String mobileDeviceAccessRuleId,
    required String name,
    required String organizationId,
    String? description,
    List<String>? deviceModels,
    List<String>? deviceOperatingSystems,
    List<String>? deviceTypes,
    List<String>? deviceUserAgents,
    List<String>? notDeviceModels,
    List<String>? notDeviceOperatingSystems,
    List<String>? notDeviceTypes,
    List<String>? notDeviceUserAgents,
  }) async {
    ArgumentError.checkNotNull(effect, 'effect');
    ArgumentError.checkNotNull(
        mobileDeviceAccessRuleId, 'mobileDeviceAccessRuleId');
    _s.validateStringLength(
      'mobileDeviceAccessRuleId',
      mobileDeviceAccessRuleId,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateMobileDeviceAccessRule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Effect': effect.toValue(),
        'MobileDeviceAccessRuleId': mobileDeviceAccessRuleId,
        'Name': name,
        'OrganizationId': organizationId,
        if (description != null) 'Description': description,
        if (deviceModels != null) 'DeviceModels': deviceModels,
        if (deviceOperatingSystems != null)
          'DeviceOperatingSystems': deviceOperatingSystems,
        if (deviceTypes != null) 'DeviceTypes': deviceTypes,
        if (deviceUserAgents != null) 'DeviceUserAgents': deviceUserAgents,
        if (notDeviceModels != null) 'NotDeviceModels': notDeviceModels,
        if (notDeviceOperatingSystems != null)
          'NotDeviceOperatingSystems': notDeviceOperatingSystems,
        if (notDeviceTypes != null) 'NotDeviceTypes': notDeviceTypes,
        if (notDeviceUserAgents != null)
          'NotDeviceUserAgents': notDeviceUserAgents,
      },
    );
  }

  /// Updates the primary email for a user, group, or resource. The current
  /// email is moved into the list of aliases (or swapped between an existing
  /// alias and the current primary email), and the email provided in the input
  /// is promoted as the primary.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EmailAddressInUseException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [email] :
  /// The value of the email to be updated as primary.
  ///
  /// Parameter [entityId] :
  /// The user, group, or resource to update.
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the user, group, or resource to update.
  Future<void> updatePrimaryEmailAddress({
    required String email,
    required String entityId,
    required String organizationId,
  }) async {
    ArgumentError.checkNotNull(email, 'email');
    _s.validateStringLength(
      'email',
      email,
      1,
      254,
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      12,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdatePrimaryEmailAddress'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Email': email,
        'EntityId': entityId,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Updates data for the resource. To have the latest information, it must be
  /// preceded by a <a>DescribeResource</a> call. The dataset in the request
  /// should be the one expected when performing another
  /// <code>DescribeResource</code> call.
  ///
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidConfigurationException].
  /// May throw [EmailAddressInUseException].
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [NameAvailabilityException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// updated.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be updated.
  ///
  /// Parameter [bookingOptions] :
  /// The resource's booking options to be updated.
  ///
  /// Parameter [name] :
  /// The name of the resource to be updated.
  Future<void> updateResource({
    required String organizationId,
    required String resourceId,
    BookingOptions? bookingOptions,
    String? name,
  }) async {
    ArgumentError.checkNotNull(organizationId, 'organizationId');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      34,
      34,
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      34,
      34,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        'ResourceId': resourceId,
        if (bookingOptions != null) 'BookingOptions': bookingOptions,
        if (name != null) 'Name': name,
      },
    );
  }
}

/// A rule that controls access to an Amazon WorkMail organization.
class AccessControlRule {
  /// Access protocol actions to include in the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  final List<String>? actions;

  /// The date that the rule was created.
  final DateTime? dateCreated;

  /// The date that the rule was modified.
  final DateTime? dateModified;

  /// The rule description.
  final String? description;

  /// The rule effect.
  final AccessControlRuleEffect? effect;

  /// IPv4 CIDR ranges to include in the rule.
  final List<String>? ipRanges;

  /// The rule name.
  final String? name;

  /// Access protocol actions to exclude from the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  final List<String>? notActions;

  /// IPv4 CIDR ranges to exclude from the rule.
  final List<String>? notIpRanges;

  /// User IDs to exclude from the rule.
  final List<String>? notUserIds;

  /// User IDs to include in the rule.
  final List<String>? userIds;

  AccessControlRule({
    this.actions,
    this.dateCreated,
    this.dateModified,
    this.description,
    this.effect,
    this.ipRanges,
    this.name,
    this.notActions,
    this.notIpRanges,
    this.notUserIds,
    this.userIds,
  });

  factory AccessControlRule.fromJson(Map<String, dynamic> json) {
    return AccessControlRule(
      actions: (json['Actions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      description: json['Description'] as String?,
      effect: (json['Effect'] as String?)?.toAccessControlRuleEffect(),
      ipRanges: (json['IpRanges'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      notActions: (json['NotActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notIpRanges: (json['NotIpRanges'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notUserIds: (json['NotUserIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      userIds: (json['UserIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final description = this.description;
    final effect = this.effect;
    final ipRanges = this.ipRanges;
    final name = this.name;
    final notActions = this.notActions;
    final notIpRanges = this.notIpRanges;
    final notUserIds = this.notUserIds;
    final userIds = this.userIds;
    return {
      if (actions != null) 'Actions': actions,
      if (dateCreated != null) 'DateCreated': unixTimestampToJson(dateCreated),
      if (dateModified != null)
        'DateModified': unixTimestampToJson(dateModified),
      if (description != null) 'Description': description,
      if (effect != null) 'Effect': effect.toValue(),
      if (ipRanges != null) 'IpRanges': ipRanges,
      if (name != null) 'Name': name,
      if (notActions != null) 'NotActions': notActions,
      if (notIpRanges != null) 'NotIpRanges': notIpRanges,
      if (notUserIds != null) 'NotUserIds': notUserIds,
      if (userIds != null) 'UserIds': userIds,
    };
  }
}

enum AccessControlRuleEffect {
  allow,
  deny,
}

extension on AccessControlRuleEffect {
  String toValue() {
    switch (this) {
      case AccessControlRuleEffect.allow:
        return 'ALLOW';
      case AccessControlRuleEffect.deny:
        return 'DENY';
    }
  }
}

extension on String {
  AccessControlRuleEffect toAccessControlRuleEffect() {
    switch (this) {
      case 'ALLOW':
        return AccessControlRuleEffect.allow;
      case 'DENY':
        return AccessControlRuleEffect.deny;
    }
    throw Exception('$this is not known in enum AccessControlRuleEffect');
  }
}

class AssociateDelegateToResourceResponse {
  AssociateDelegateToResourceResponse();

  factory AssociateDelegateToResourceResponse.fromJson(Map<String, dynamic> _) {
    return AssociateDelegateToResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateMemberToGroupResponse {
  AssociateMemberToGroupResponse();

  factory AssociateMemberToGroupResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// At least one delegate must be associated to the resource to disable
/// automatic replies from the resource.
class BookingOptions {
  /// The resource's ability to automatically reply to requests. If disabled,
  /// delegates must be associated to the resource.
  final bool? autoAcceptRequests;

  /// The resource's ability to automatically decline any conflicting requests.
  final bool? autoDeclineConflictingRequests;

  /// The resource's ability to automatically decline any recurring requests.
  final bool? autoDeclineRecurringRequests;

  BookingOptions({
    this.autoAcceptRequests,
    this.autoDeclineConflictingRequests,
    this.autoDeclineRecurringRequests,
  });

  factory BookingOptions.fromJson(Map<String, dynamic> json) {
    return BookingOptions(
      autoAcceptRequests: json['AutoAcceptRequests'] as bool?,
      autoDeclineConflictingRequests:
          json['AutoDeclineConflictingRequests'] as bool?,
      autoDeclineRecurringRequests:
          json['AutoDeclineRecurringRequests'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoAcceptRequests = this.autoAcceptRequests;
    final autoDeclineConflictingRequests = this.autoDeclineConflictingRequests;
    final autoDeclineRecurringRequests = this.autoDeclineRecurringRequests;
    return {
      if (autoAcceptRequests != null) 'AutoAcceptRequests': autoAcceptRequests,
      if (autoDeclineConflictingRequests != null)
        'AutoDeclineConflictingRequests': autoDeclineConflictingRequests,
      if (autoDeclineRecurringRequests != null)
        'AutoDeclineRecurringRequests': autoDeclineRecurringRequests,
    };
  }
}

class CancelMailboxExportJobResponse {
  CancelMailboxExportJobResponse();

  factory CancelMailboxExportJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelMailboxExportJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateAliasResponse {
  CreateAliasResponse();

  factory CreateAliasResponse.fromJson(Map<String, dynamic> _) {
    return CreateAliasResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateGroupResponse {
  /// The identifier of the group.
  final String? groupId;

  CreateGroupResponse({
    this.groupId,
  });

  factory CreateGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateGroupResponse(
      groupId: json['GroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    return {
      if (groupId != null) 'GroupId': groupId,
    };
  }
}

class CreateMobileDeviceAccessRuleResponse {
  /// The identifier for the newly created mobile device access rule.
  final String? mobileDeviceAccessRuleId;

  CreateMobileDeviceAccessRuleResponse({
    this.mobileDeviceAccessRuleId,
  });

  factory CreateMobileDeviceAccessRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMobileDeviceAccessRuleResponse(
      mobileDeviceAccessRuleId: json['MobileDeviceAccessRuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mobileDeviceAccessRuleId = this.mobileDeviceAccessRuleId;
    return {
      if (mobileDeviceAccessRuleId != null)
        'MobileDeviceAccessRuleId': mobileDeviceAccessRuleId,
    };
  }
}

class CreateOrganizationResponse {
  /// The organization ID.
  final String? organizationId;

  CreateOrganizationResponse({
    this.organizationId,
  });

  factory CreateOrganizationResponse.fromJson(Map<String, dynamic> json) {
    return CreateOrganizationResponse(
      organizationId: json['OrganizationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationId = this.organizationId;
    return {
      if (organizationId != null) 'OrganizationId': organizationId,
    };
  }
}

class CreateResourceResponse {
  /// The identifier of the new resource.
  final String? resourceId;

  CreateResourceResponse({
    this.resourceId,
  });

  factory CreateResourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourceResponse(
      resourceId: json['ResourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    return {
      if (resourceId != null) 'ResourceId': resourceId,
    };
  }
}

class CreateUserResponse {
  /// The identifier for the new user.
  final String? userId;

  CreateUserResponse({
    this.userId,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      if (userId != null) 'UserId': userId,
    };
  }
}

/// The name of the attribute, which is one of the values defined in the
/// UserAttribute enumeration.
class Delegate {
  /// The identifier for the user or group associated as the resource's delegate.
  final String id;

  /// The type of the delegate: user or group.
  final MemberType type;

  Delegate({
    required this.id,
    required this.type,
  });

  factory Delegate.fromJson(Map<String, dynamic> json) {
    return Delegate(
      id: json['Id'] as String,
      type: (json['Type'] as String).toMemberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'Id': id,
      'Type': type.toValue(),
    };
  }
}

class DeleteAccessControlRuleResponse {
  DeleteAccessControlRuleResponse();

  factory DeleteAccessControlRuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessControlRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAliasResponse {
  DeleteAliasResponse();

  factory DeleteAliasResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAliasResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGroupResponse {
  DeleteGroupResponse();

  factory DeleteGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMailboxPermissionsResponse {
  DeleteMailboxPermissionsResponse();

  factory DeleteMailboxPermissionsResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMailboxPermissionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMobileDeviceAccessRuleResponse {
  DeleteMobileDeviceAccessRuleResponse();

  factory DeleteMobileDeviceAccessRuleResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteMobileDeviceAccessRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteOrganizationResponse {
  /// The organization ID.
  final String? organizationId;

  /// The state of the organization.
  final String? state;

  DeleteOrganizationResponse({
    this.organizationId,
    this.state,
  });

  factory DeleteOrganizationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteOrganizationResponse(
      organizationId: json['OrganizationId'] as String?,
      state: json['State'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationId = this.organizationId;
    final state = this.state;
    return {
      if (organizationId != null) 'OrganizationId': organizationId,
      if (state != null) 'State': state,
    };
  }
}

class DeleteResourceResponse {
  DeleteResourceResponse();

  factory DeleteResourceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRetentionPolicyResponse {
  DeleteRetentionPolicyResponse();

  factory DeleteRetentionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRetentionPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteUserResponse {
  DeleteUserResponse();

  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterFromWorkMailResponse {
  DeregisterFromWorkMailResponse();

  factory DeregisterFromWorkMailResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterFromWorkMailResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeGroupResponse {
  /// The date and time when a user was deregistered from WorkMail, in UNIX epoch
  /// time format.
  final DateTime? disabledDate;

  /// The email of the described group.
  final String? email;

  /// The date and time when a user was registered to WorkMail, in UNIX epoch time
  /// format.
  final DateTime? enabledDate;

  /// The identifier of the described group.
  final String? groupId;

  /// The name of the described group.
  final String? name;

  /// The state of the user: enabled (registered to Amazon WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  final EntityState? state;

  DescribeGroupResponse({
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.groupId,
    this.name,
    this.state,
  });

  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGroupResponse(
      disabledDate: timeStampFromJson(json['DisabledDate']),
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      groupId: json['GroupId'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledDate = this.disabledDate;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final groupId = this.groupId;
    final name = this.name;
    final state = this.state;
    return {
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (groupId != null) 'GroupId': groupId,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DescribeMailboxExportJobResponse {
  /// The mailbox export job description.
  final String? description;

  /// The mailbox export job end timestamp.
  final DateTime? endTime;

  /// The identifier of the user or resource associated with the mailbox.
  final String? entityId;

  /// Error information for failed mailbox export jobs.
  final String? errorInfo;

  /// The estimated progress of the mailbox export job, in percentage points.
  final int? estimatedProgress;

  /// The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service
  /// (AWS KMS) key that encrypts the exported mailbox content.
  final String? kmsKeyArn;

  /// The ARN of the AWS Identity and Access Management (IAM) role that grants
  /// write permission to the Amazon Simple Storage Service (Amazon S3) bucket.
  final String? roleArn;

  /// The name of the S3 bucket.
  final String? s3BucketName;

  /// The path to the S3 bucket and file that the mailbox export job is exporting
  /// to.
  final String? s3Path;

  /// The S3 bucket prefix.
  final String? s3Prefix;

  /// The mailbox export job start timestamp.
  final DateTime? startTime;

  /// The state of the mailbox export job.
  final MailboxExportJobState? state;

  DescribeMailboxExportJobResponse({
    this.description,
    this.endTime,
    this.entityId,
    this.errorInfo,
    this.estimatedProgress,
    this.kmsKeyArn,
    this.roleArn,
    this.s3BucketName,
    this.s3Path,
    this.s3Prefix,
    this.startTime,
    this.state,
  });

  factory DescribeMailboxExportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMailboxExportJobResponse(
      description: json['Description'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      entityId: json['EntityId'] as String?,
      errorInfo: json['ErrorInfo'] as String?,
      estimatedProgress: json['EstimatedProgress'] as int?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      roleArn: json['RoleArn'] as String?,
      s3BucketName: json['S3BucketName'] as String?,
      s3Path: json['S3Path'] as String?,
      s3Prefix: json['S3Prefix'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.toMailboxExportJobState(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final endTime = this.endTime;
    final entityId = this.entityId;
    final errorInfo = this.errorInfo;
    final estimatedProgress = this.estimatedProgress;
    final kmsKeyArn = this.kmsKeyArn;
    final roleArn = this.roleArn;
    final s3BucketName = this.s3BucketName;
    final s3Path = this.s3Path;
    final s3Prefix = this.s3Prefix;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (description != null) 'Description': description,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (entityId != null) 'EntityId': entityId,
      if (errorInfo != null) 'ErrorInfo': errorInfo,
      if (estimatedProgress != null) 'EstimatedProgress': estimatedProgress,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (roleArn != null) 'RoleArn': roleArn,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3Path != null) 'S3Path': s3Path,
      if (s3Prefix != null) 'S3Prefix': s3Prefix,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DescribeOrganizationResponse {
  /// The Amazon Resource Name (ARN) of the organization.
  final String? arn;

  /// The alias for an organization.
  final String? alias;

  /// The date at which the organization became usable in the WorkMail context, in
  /// UNIX epoch time format.
  final DateTime? completedDate;

  /// The default mail domain associated with the organization.
  final String? defaultMailDomain;

  /// The identifier for the directory associated with an Amazon WorkMail
  /// organization.
  final String? directoryId;

  /// The type of directory associated with the WorkMail organization.
  final String? directoryType;

  /// (Optional) The error message indicating if unexpected behavior was
  /// encountered with regards to the organization.
  final String? errorMessage;

  /// The identifier of an organization.
  final String? organizationId;

  /// The state of an organization.
  final String? state;

  DescribeOrganizationResponse({
    this.arn,
    this.alias,
    this.completedDate,
    this.defaultMailDomain,
    this.directoryId,
    this.directoryType,
    this.errorMessage,
    this.organizationId,
    this.state,
  });

  factory DescribeOrganizationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeOrganizationResponse(
      arn: json['ARN'] as String?,
      alias: json['Alias'] as String?,
      completedDate: timeStampFromJson(json['CompletedDate']),
      defaultMailDomain: json['DefaultMailDomain'] as String?,
      directoryId: json['DirectoryId'] as String?,
      directoryType: json['DirectoryType'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      organizationId: json['OrganizationId'] as String?,
      state: json['State'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final alias = this.alias;
    final completedDate = this.completedDate;
    final defaultMailDomain = this.defaultMailDomain;
    final directoryId = this.directoryId;
    final directoryType = this.directoryType;
    final errorMessage = this.errorMessage;
    final organizationId = this.organizationId;
    final state = this.state;
    return {
      if (arn != null) 'ARN': arn,
      if (alias != null) 'Alias': alias,
      if (completedDate != null)
        'CompletedDate': unixTimestampToJson(completedDate),
      if (defaultMailDomain != null) 'DefaultMailDomain': defaultMailDomain,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (directoryType != null) 'DirectoryType': directoryType,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (organizationId != null) 'OrganizationId': organizationId,
      if (state != null) 'State': state,
    };
  }
}

class DescribeResourceResponse {
  /// The booking options for the described resource.
  final BookingOptions? bookingOptions;

  /// The date and time when a resource was disabled from WorkMail, in UNIX epoch
  /// time format.
  final DateTime? disabledDate;

  /// The email of the described resource.
  final String? email;

  /// The date and time when a resource was enabled for WorkMail, in UNIX epoch
  /// time format.
  final DateTime? enabledDate;

  /// The name of the described resource.
  final String? name;

  /// The identifier of the described resource.
  final String? resourceId;

  /// The state of the resource: enabled (registered to Amazon WorkMail), disabled
  /// (deregistered or never registered to WorkMail), or deleted.
  final EntityState? state;

  /// The type of the described resource.
  final ResourceType? type;

  DescribeResourceResponse({
    this.bookingOptions,
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.name,
    this.resourceId,
    this.state,
    this.type,
  });

  factory DescribeResourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResourceResponse(
      bookingOptions: json['BookingOptions'] != null
          ? BookingOptions.fromJson(
              json['BookingOptions'] as Map<String, dynamic>)
          : null,
      disabledDate: timeStampFromJson(json['DisabledDate']),
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      name: json['Name'] as String?,
      resourceId: json['ResourceId'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
      type: (json['Type'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final bookingOptions = this.bookingOptions;
    final disabledDate = this.disabledDate;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final name = this.name;
    final resourceId = this.resourceId;
    final state = this.state;
    final type = this.type;
    return {
      if (bookingOptions != null) 'BookingOptions': bookingOptions,
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (name != null) 'Name': name,
      if (resourceId != null) 'ResourceId': resourceId,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class DescribeUserResponse {
  /// The date and time at which the user was disabled for Amazon WorkMail usage,
  /// in UNIX epoch time format.
  final DateTime? disabledDate;

  /// The display name of the user.
  final String? displayName;

  /// The email of the user.
  final String? email;

  /// The date and time at which the user was enabled for Amazon WorkMail usage,
  /// in UNIX epoch time format.
  final DateTime? enabledDate;

  /// The name for the user.
  final String? name;

  /// The state of a user: enabled (registered to Amazon WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  final EntityState? state;

  /// The identifier for the described user.
  final String? userId;

  /// In certain cases, other entities are modeled as users. If interoperability
  /// is enabled, resources are imported into Amazon WorkMail as users. Because
  /// different WorkMail organizations rely on different directory types,
  /// administrators can distinguish between an unregistered user (account is
  /// disabled and has a user role) and the directory administrators. The values
  /// are USER, RESOURCE, and SYSTEM_USER.
  final UserRole? userRole;

  DescribeUserResponse({
    this.disabledDate,
    this.displayName,
    this.email,
    this.enabledDate,
    this.name,
    this.state,
    this.userId,
    this.userRole,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      disabledDate: timeStampFromJson(json['DisabledDate']),
      displayName: json['DisplayName'] as String?,
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
      userId: json['UserId'] as String?,
      userRole: (json['UserRole'] as String?)?.toUserRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledDate = this.disabledDate;
    final displayName = this.displayName;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final name = this.name;
    final state = this.state;
    final userId = this.userId;
    final userRole = this.userRole;
    return {
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (displayName != null) 'DisplayName': displayName,
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (userId != null) 'UserId': userId,
      if (userRole != null) 'UserRole': userRole.toValue(),
    };
  }
}

class DisassociateDelegateFromResourceResponse {
  DisassociateDelegateFromResourceResponse();

  factory DisassociateDelegateFromResourceResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateDelegateFromResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMemberFromGroupResponse {
  DisassociateMemberFromGroupResponse();

  factory DisassociateMemberFromGroupResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The domain to associate with an Amazon WorkMail organization.
///
/// When you configure a domain hosted in Amazon Route 53 (Route 53), all
/// recommended DNS records are added to the organization when you create it.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html">Adding
/// a domain</a> in the <i>Amazon WorkMail Administrator Guide</i>.
class Domain {
  /// The fully qualified domain name.
  final String? domainName;

  /// The hosted zone ID for a domain hosted in Route 53. Required when
  /// configuring a domain hosted in Route 53.
  final String? hostedZoneId;

  Domain({
    this.domainName,
    this.hostedZoneId,
  });

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      domainName: json['DomainName'] as String?,
      hostedZoneId: json['HostedZoneId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final hostedZoneId = this.hostedZoneId;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
    };
  }
}

enum EntityState {
  enabled,
  disabled,
  deleted,
}

extension on EntityState {
  String toValue() {
    switch (this) {
      case EntityState.enabled:
        return 'ENABLED';
      case EntityState.disabled:
        return 'DISABLED';
      case EntityState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  EntityState toEntityState() {
    switch (this) {
      case 'ENABLED':
        return EntityState.enabled;
      case 'DISABLED':
        return EntityState.disabled;
      case 'DELETED':
        return EntityState.deleted;
    }
    throw Exception('$this is not known in enum EntityState');
  }
}

/// The configuration applied to an organization's folders by its retention
/// policy.
class FolderConfiguration {
  /// The action to take on the folder contents at the end of the folder
  /// configuration period.
  final RetentionAction action;

  /// The folder name.
  final FolderName name;

  /// The period of time at which the folder configuration action is applied.
  final int? period;

  FolderConfiguration({
    required this.action,
    required this.name,
    this.period,
  });

  factory FolderConfiguration.fromJson(Map<String, dynamic> json) {
    return FolderConfiguration(
      action: (json['Action'] as String).toRetentionAction(),
      name: (json['Name'] as String).toFolderName(),
      period: json['Period'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final period = this.period;
    return {
      'Action': action.toValue(),
      'Name': name.toValue(),
      if (period != null) 'Period': period,
    };
  }
}

enum FolderName {
  inbox,
  deletedItems,
  sentItems,
  drafts,
  junkEmail,
}

extension on FolderName {
  String toValue() {
    switch (this) {
      case FolderName.inbox:
        return 'INBOX';
      case FolderName.deletedItems:
        return 'DELETED_ITEMS';
      case FolderName.sentItems:
        return 'SENT_ITEMS';
      case FolderName.drafts:
        return 'DRAFTS';
      case FolderName.junkEmail:
        return 'JUNK_EMAIL';
    }
  }
}

extension on String {
  FolderName toFolderName() {
    switch (this) {
      case 'INBOX':
        return FolderName.inbox;
      case 'DELETED_ITEMS':
        return FolderName.deletedItems;
      case 'SENT_ITEMS':
        return FolderName.sentItems;
      case 'DRAFTS':
        return FolderName.drafts;
      case 'JUNK_EMAIL':
        return FolderName.junkEmail;
    }
    throw Exception('$this is not known in enum FolderName');
  }
}

class GetAccessControlEffectResponse {
  /// The rule effect.
  final AccessControlRuleEffect? effect;

  /// The rules that match the given parameters, resulting in an effect.
  final List<String>? matchedRules;

  GetAccessControlEffectResponse({
    this.effect,
    this.matchedRules,
  });

  factory GetAccessControlEffectResponse.fromJson(Map<String, dynamic> json) {
    return GetAccessControlEffectResponse(
      effect: (json['Effect'] as String?)?.toAccessControlRuleEffect(),
      matchedRules: (json['MatchedRules'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final matchedRules = this.matchedRules;
    return {
      if (effect != null) 'Effect': effect.toValue(),
      if (matchedRules != null) 'MatchedRules': matchedRules,
    };
  }
}

class GetDefaultRetentionPolicyResponse {
  /// The retention policy description.
  final String? description;

  /// The retention policy folder configurations.
  final List<FolderConfiguration>? folderConfigurations;

  /// The retention policy ID.
  final String? id;

  /// The retention policy name.
  final String? name;

  GetDefaultRetentionPolicyResponse({
    this.description,
    this.folderConfigurations,
    this.id,
    this.name,
  });

  factory GetDefaultRetentionPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDefaultRetentionPolicyResponse(
      description: json['Description'] as String?,
      folderConfigurations: (json['FolderConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => FolderConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final folderConfigurations = this.folderConfigurations;
    final id = this.id;
    final name = this.name;
    return {
      if (description != null) 'Description': description,
      if (folderConfigurations != null)
        'FolderConfigurations': folderConfigurations,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

class GetMailboxDetailsResponse {
  /// The maximum allowed mailbox size, in MB, for the specified user.
  final int? mailboxQuota;

  /// The current mailbox size, in MB, for the specified user.
  final double? mailboxSize;

  GetMailboxDetailsResponse({
    this.mailboxQuota,
    this.mailboxSize,
  });

  factory GetMailboxDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetMailboxDetailsResponse(
      mailboxQuota: json['MailboxQuota'] as int?,
      mailboxSize: json['MailboxSize'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final mailboxQuota = this.mailboxQuota;
    final mailboxSize = this.mailboxSize;
    return {
      if (mailboxQuota != null) 'MailboxQuota': mailboxQuota,
      if (mailboxSize != null) 'MailboxSize': mailboxSize,
    };
  }
}

class GetMobileDeviceAccessEffectResponse {
  /// The effect of the simulated access, <code>ALLOW</code> or <code>DENY</code>,
  /// after evaluating mobile device access rules in the Amazon WorkMail
  /// organization for the simulated user parameters.
  final MobileDeviceAccessRuleEffect? effect;

  /// A list of the rules which matched the simulated user input and produced the
  /// effect.
  final List<MobileDeviceAccessMatchedRule>? matchedRules;

  GetMobileDeviceAccessEffectResponse({
    this.effect,
    this.matchedRules,
  });

  factory GetMobileDeviceAccessEffectResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMobileDeviceAccessEffectResponse(
      effect: (json['Effect'] as String?)?.toMobileDeviceAccessRuleEffect(),
      matchedRules: (json['MatchedRules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MobileDeviceAccessMatchedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final matchedRules = this.matchedRules;
    return {
      if (effect != null) 'Effect': effect.toValue(),
      if (matchedRules != null) 'MatchedRules': matchedRules,
    };
  }
}

/// The representation of an Amazon WorkMail group.
class Group {
  /// The date indicating when the group was disabled from Amazon WorkMail use.
  final DateTime? disabledDate;

  /// The email of the group.
  final String? email;

  /// The date indicating when the group was enabled for Amazon WorkMail use.
  final DateTime? enabledDate;

  /// The identifier of the group.
  final String? id;

  /// The name of the group.
  final String? name;

  /// The state of the group, which can be ENABLED, DISABLED, or DELETED.
  final EntityState? state;

  Group({
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      disabledDate: timeStampFromJson(json['DisabledDate']),
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledDate = this.disabledDate;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    return {
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class ListAccessControlRulesResponse {
  /// The access control rules.
  final List<AccessControlRule>? rules;

  ListAccessControlRulesResponse({
    this.rules,
  });

  factory ListAccessControlRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessControlRulesResponse(
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => AccessControlRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

class ListAliasesResponse {
  /// The entity's paginated aliases.
  final List<String>? aliases;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String? nextToken;

  ListAliasesResponse({
    this.aliases,
    this.nextToken,
  });

  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListAliasesResponse(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final nextToken = this.nextToken;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGroupMembersResponse {
  /// The members associated to the group.
  final List<Member>? members;

  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  final String? nextToken;

  ListGroupMembersResponse({
    this.members,
    this.nextToken,
  });

  factory ListGroupMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupMembersResponse(
      members: (json['Members'] as List?)
          ?.whereNotNull()
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'Members': members,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGroupsResponse {
  /// The overview of groups for an organization.
  final List<Group>? groups;

  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String? nextToken;

  ListGroupsResponse({
    this.groups,
    this.nextToken,
  });

  factory ListGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupsResponse(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final nextToken = this.nextToken;
    return {
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMailboxExportJobsResponse {
  /// The mailbox export job details.
  final List<MailboxExportJob>? jobs;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListMailboxExportJobsResponse({
    this.jobs,
    this.nextToken,
  });

  factory ListMailboxExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListMailboxExportJobsResponse(
      jobs: (json['Jobs'] as List?)
          ?.whereNotNull()
          .map((e) => MailboxExportJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'Jobs': jobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMailboxPermissionsResponse {
  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String? nextToken;

  /// One page of the user, group, or resource mailbox permissions.
  final List<Permission>? permissions;

  ListMailboxPermissionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListMailboxPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListMailboxPermissionsResponse(
      nextToken: json['NextToken'] as String?,
      permissions: (json['Permissions'] as List?)
          ?.whereNotNull()
          .map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (permissions != null) 'Permissions': permissions,
    };
  }
}

class ListMobileDeviceAccessRulesResponse {
  /// The list of mobile device access rules that exist under the specified Amazon
  /// WorkMail organization.
  final List<MobileDeviceAccessRule>? rules;

  ListMobileDeviceAccessRulesResponse({
    this.rules,
  });

  factory ListMobileDeviceAccessRulesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMobileDeviceAccessRulesResponse(
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map(
              (e) => MobileDeviceAccessRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      if (rules != null) 'Rules': rules,
    };
  }
}

class ListOrganizationsResponse {
  /// The token to use to retrieve the next page of results. The value is "null"
  /// when there are no more results to return.
  final String? nextToken;

  /// The overview of owned organizations presented as a list of organization
  /// summaries.
  final List<OrganizationSummary>? organizationSummaries;

  ListOrganizationsResponse({
    this.nextToken,
    this.organizationSummaries,
  });

  factory ListOrganizationsResponse.fromJson(Map<String, dynamic> json) {
    return ListOrganizationsResponse(
      nextToken: json['NextToken'] as String?,
      organizationSummaries: (json['OrganizationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => OrganizationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationSummaries = this.organizationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationSummaries != null)
        'OrganizationSummaries': organizationSummaries,
    };
  }
}

class ListResourceDelegatesResponse {
  /// One page of the resource's delegates.
  final List<Delegate>? delegates;

  /// The token used to paginate through the delegates associated with a resource.
  /// While results are still available, it has an associated value. When the last
  /// page is reached, the token is empty.
  final String? nextToken;

  ListResourceDelegatesResponse({
    this.delegates,
    this.nextToken,
  });

  factory ListResourceDelegatesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceDelegatesResponse(
      delegates: (json['Delegates'] as List?)
          ?.whereNotNull()
          .map((e) => Delegate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final delegates = this.delegates;
    final nextToken = this.nextToken;
    return {
      if (delegates != null) 'Delegates': delegates,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListResourcesResponse {
  /// The token used to paginate through all the organization's resources. While
  /// results are still available, it has an associated value. When the last page
  /// is reached, the token is empty.
  final String? nextToken;

  /// One page of the organization's resource representation.
  final List<Resource>? resources;

  ListResourcesResponse({
    this.nextToken,
    this.resources,
  });

  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesResponse(
      nextToken: json['NextToken'] as String?,
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resources != null) 'Resources': resources,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tag key-value pairs.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListUsersResponse {
  /// The token to use to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String? nextToken;

  /// The overview of users for an organization.
  final List<User>? users;

  ListUsersResponse({
    this.nextToken,
    this.users,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      nextToken: json['NextToken'] as String?,
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (users != null) 'Users': users,
    };
  }
}

/// The details of a mailbox export job, including the user or resource ID
/// associated with the mailbox and the S3 bucket that the mailbox contents are
/// exported to.
class MailboxExportJob {
  /// The mailbox export job description.
  final String? description;

  /// The mailbox export job end timestamp.
  final DateTime? endTime;

  /// The identifier of the user or resource associated with the mailbox.
  final String? entityId;

  /// The estimated progress of the mailbox export job, in percentage points.
  final int? estimatedProgress;

  /// The identifier of the mailbox export job.
  final String? jobId;

  /// The name of the S3 bucket.
  final String? s3BucketName;

  /// The path to the S3 bucket and file that the mailbox export job exports to.
  final String? s3Path;

  /// The mailbox export job start timestamp.
  final DateTime? startTime;

  /// The state of the mailbox export job.
  final MailboxExportJobState? state;

  MailboxExportJob({
    this.description,
    this.endTime,
    this.entityId,
    this.estimatedProgress,
    this.jobId,
    this.s3BucketName,
    this.s3Path,
    this.startTime,
    this.state,
  });

  factory MailboxExportJob.fromJson(Map<String, dynamic> json) {
    return MailboxExportJob(
      description: json['Description'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      entityId: json['EntityId'] as String?,
      estimatedProgress: json['EstimatedProgress'] as int?,
      jobId: json['JobId'] as String?,
      s3BucketName: json['S3BucketName'] as String?,
      s3Path: json['S3Path'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.toMailboxExportJobState(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final endTime = this.endTime;
    final entityId = this.entityId;
    final estimatedProgress = this.estimatedProgress;
    final jobId = this.jobId;
    final s3BucketName = this.s3BucketName;
    final s3Path = this.s3Path;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (description != null) 'Description': description,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (entityId != null) 'EntityId': entityId,
      if (estimatedProgress != null) 'EstimatedProgress': estimatedProgress,
      if (jobId != null) 'JobId': jobId,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3Path != null) 'S3Path': s3Path,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum MailboxExportJobState {
  running,
  completed,
  failed,
  cancelled,
}

extension on MailboxExportJobState {
  String toValue() {
    switch (this) {
      case MailboxExportJobState.running:
        return 'RUNNING';
      case MailboxExportJobState.completed:
        return 'COMPLETED';
      case MailboxExportJobState.failed:
        return 'FAILED';
      case MailboxExportJobState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension on String {
  MailboxExportJobState toMailboxExportJobState() {
    switch (this) {
      case 'RUNNING':
        return MailboxExportJobState.running;
      case 'COMPLETED':
        return MailboxExportJobState.completed;
      case 'FAILED':
        return MailboxExportJobState.failed;
      case 'CANCELLED':
        return MailboxExportJobState.cancelled;
    }
    throw Exception('$this is not known in enum MailboxExportJobState');
  }
}

/// The representation of a user or group.
class Member {
  /// The date indicating when the member was disabled from Amazon WorkMail use.
  final DateTime? disabledDate;

  /// The date indicating when the member was enabled for Amazon WorkMail use.
  final DateTime? enabledDate;

  /// The identifier of the member.
  final String? id;

  /// The name of the member.
  final String? name;

  /// The state of the member, which can be ENABLED, DISABLED, or DELETED.
  final EntityState? state;

  /// A member can be a user or group.
  final MemberType? type;

  Member({
    this.disabledDate,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
    this.type,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      disabledDate: timeStampFromJson(json['DisabledDate']),
      enabledDate: timeStampFromJson(json['EnabledDate']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
      type: (json['Type'] as String?)?.toMemberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledDate = this.disabledDate;
    final enabledDate = this.enabledDate;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final type = this.type;
    return {
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum MemberType {
  group,
  user,
}

extension on MemberType {
  String toValue() {
    switch (this) {
      case MemberType.group:
        return 'GROUP';
      case MemberType.user:
        return 'USER';
    }
  }
}

extension on String {
  MemberType toMemberType() {
    switch (this) {
      case 'GROUP':
        return MemberType.group;
      case 'USER':
        return MemberType.user;
    }
    throw Exception('$this is not known in enum MemberType');
  }
}

/// The rule that a simulated user matches.
class MobileDeviceAccessMatchedRule {
  /// Identifier of the rule that a simulated user matches.
  final String? mobileDeviceAccessRuleId;

  /// Name of a rule that a simulated user matches.
  final String? name;

  MobileDeviceAccessMatchedRule({
    this.mobileDeviceAccessRuleId,
    this.name,
  });

  factory MobileDeviceAccessMatchedRule.fromJson(Map<String, dynamic> json) {
    return MobileDeviceAccessMatchedRule(
      mobileDeviceAccessRuleId: json['MobileDeviceAccessRuleId'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mobileDeviceAccessRuleId = this.mobileDeviceAccessRuleId;
    final name = this.name;
    return {
      if (mobileDeviceAccessRuleId != null)
        'MobileDeviceAccessRuleId': mobileDeviceAccessRuleId,
      if (name != null) 'Name': name,
    };
  }
}

/// A rule that controls access to mobile devices for an Amazon WorkMail group.
class MobileDeviceAccessRule {
  /// The date and time at which an access rule was created.
  final DateTime? dateCreated;

  /// The date and time at which an access rule was modified.
  final DateTime? dateModified;

  /// The description of a mobile access rule.
  final String? description;

  /// Device models that a rule will match.
  final List<String>? deviceModels;

  /// Device operating systems that a rule will match.
  final List<String>? deviceOperatingSystems;

  /// Device types that a rule will match.
  final List<String>? deviceTypes;

  /// Device user agents that a rule will match.
  final List<String>? deviceUserAgents;

  /// The effect of the rule when it matches. Allowed values are
  /// <code>ALLOW</code> or <code>DENY</code>.
  final MobileDeviceAccessRuleEffect? effect;

  /// The ID assigned to a mobile access rule.
  final String? mobileDeviceAccessRuleId;

  /// The name of a mobile access rule.
  final String? name;

  /// Device models that a rule <b>will not</b> match. All other device models
  /// will match.
  final List<String>? notDeviceModels;

  /// Device operating systems that a rule <b>will not</b> match. All other device
  /// types will match.
  final List<String>? notDeviceOperatingSystems;

  /// Device types that a rule <b>will not</b> match. All other device types will
  /// match.
  final List<String>? notDeviceTypes;

  /// Device user agents that a rule <b>will not</b> match. All other device user
  /// agents will match.
  final List<String>? notDeviceUserAgents;

  MobileDeviceAccessRule({
    this.dateCreated,
    this.dateModified,
    this.description,
    this.deviceModels,
    this.deviceOperatingSystems,
    this.deviceTypes,
    this.deviceUserAgents,
    this.effect,
    this.mobileDeviceAccessRuleId,
    this.name,
    this.notDeviceModels,
    this.notDeviceOperatingSystems,
    this.notDeviceTypes,
    this.notDeviceUserAgents,
  });

  factory MobileDeviceAccessRule.fromJson(Map<String, dynamic> json) {
    return MobileDeviceAccessRule(
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      description: json['Description'] as String?,
      deviceModels: (json['DeviceModels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      deviceOperatingSystems: (json['DeviceOperatingSystems'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      deviceTypes: (json['DeviceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      deviceUserAgents: (json['DeviceUserAgents'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      effect: (json['Effect'] as String?)?.toMobileDeviceAccessRuleEffect(),
      mobileDeviceAccessRuleId: json['MobileDeviceAccessRuleId'] as String?,
      name: json['Name'] as String?,
      notDeviceModels: (json['NotDeviceModels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notDeviceOperatingSystems: (json['NotDeviceOperatingSystems'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notDeviceTypes: (json['NotDeviceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notDeviceUserAgents: (json['NotDeviceUserAgents'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final description = this.description;
    final deviceModels = this.deviceModels;
    final deviceOperatingSystems = this.deviceOperatingSystems;
    final deviceTypes = this.deviceTypes;
    final deviceUserAgents = this.deviceUserAgents;
    final effect = this.effect;
    final mobileDeviceAccessRuleId = this.mobileDeviceAccessRuleId;
    final name = this.name;
    final notDeviceModels = this.notDeviceModels;
    final notDeviceOperatingSystems = this.notDeviceOperatingSystems;
    final notDeviceTypes = this.notDeviceTypes;
    final notDeviceUserAgents = this.notDeviceUserAgents;
    return {
      if (dateCreated != null) 'DateCreated': unixTimestampToJson(dateCreated),
      if (dateModified != null)
        'DateModified': unixTimestampToJson(dateModified),
      if (description != null) 'Description': description,
      if (deviceModels != null) 'DeviceModels': deviceModels,
      if (deviceOperatingSystems != null)
        'DeviceOperatingSystems': deviceOperatingSystems,
      if (deviceTypes != null) 'DeviceTypes': deviceTypes,
      if (deviceUserAgents != null) 'DeviceUserAgents': deviceUserAgents,
      if (effect != null) 'Effect': effect.toValue(),
      if (mobileDeviceAccessRuleId != null)
        'MobileDeviceAccessRuleId': mobileDeviceAccessRuleId,
      if (name != null) 'Name': name,
      if (notDeviceModels != null) 'NotDeviceModels': notDeviceModels,
      if (notDeviceOperatingSystems != null)
        'NotDeviceOperatingSystems': notDeviceOperatingSystems,
      if (notDeviceTypes != null) 'NotDeviceTypes': notDeviceTypes,
      if (notDeviceUserAgents != null)
        'NotDeviceUserAgents': notDeviceUserAgents,
    };
  }
}

enum MobileDeviceAccessRuleEffect {
  allow,
  deny,
}

extension on MobileDeviceAccessRuleEffect {
  String toValue() {
    switch (this) {
      case MobileDeviceAccessRuleEffect.allow:
        return 'ALLOW';
      case MobileDeviceAccessRuleEffect.deny:
        return 'DENY';
    }
  }
}

extension on String {
  MobileDeviceAccessRuleEffect toMobileDeviceAccessRuleEffect() {
    switch (this) {
      case 'ALLOW':
        return MobileDeviceAccessRuleEffect.allow;
      case 'DENY':
        return MobileDeviceAccessRuleEffect.deny;
    }
    throw Exception('$this is not known in enum MobileDeviceAccessRuleEffect');
  }
}

/// The representation of an organization.
class OrganizationSummary {
  /// The alias associated with the organization.
  final String? alias;

  /// The default email domain associated with the organization.
  final String? defaultMailDomain;

  /// The error message associated with the organization. It is only present if
  /// unexpected behavior has occurred with regards to the organization. It
  /// provides insight or solutions regarding unexpected behavior.
  final String? errorMessage;

  /// The identifier associated with the organization.
  final String? organizationId;

  /// The state associated with the organization.
  final String? state;

  OrganizationSummary({
    this.alias,
    this.defaultMailDomain,
    this.errorMessage,
    this.organizationId,
    this.state,
  });

  factory OrganizationSummary.fromJson(Map<String, dynamic> json) {
    return OrganizationSummary(
      alias: json['Alias'] as String?,
      defaultMailDomain: json['DefaultMailDomain'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      organizationId: json['OrganizationId'] as String?,
      state: json['State'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final defaultMailDomain = this.defaultMailDomain;
    final errorMessage = this.errorMessage;
    final organizationId = this.organizationId;
    final state = this.state;
    return {
      if (alias != null) 'Alias': alias,
      if (defaultMailDomain != null) 'DefaultMailDomain': defaultMailDomain,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (organizationId != null) 'OrganizationId': organizationId,
      if (state != null) 'State': state,
    };
  }
}

/// Permission granted to a user, group, or resource to access a certain aspect
/// of another user, group, or resource mailbox.
class Permission {
  /// The identifier of the user, group, or resource to which the permissions are
  /// granted.
  final String granteeId;

  /// The type of user, group, or resource referred to in GranteeId.
  final MemberType granteeType;

  /// The permissions granted to the grantee. SEND_AS allows the grantee to send
  /// email as the owner of the mailbox (the grantee is not mentioned on these
  /// emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the
  /// owner of the mailbox (the grantee is not mentioned as the physical sender of
  /// these emails). FULL_ACCESS allows the grantee full access to the mailbox,
  /// irrespective of other folder-level permissions set on the mailbox.
  final List<PermissionType> permissionValues;

  Permission({
    required this.granteeId,
    required this.granteeType,
    required this.permissionValues,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      granteeId: json['GranteeId'] as String,
      granteeType: (json['GranteeType'] as String).toMemberType(),
      permissionValues: (json['PermissionValues'] as List)
          .whereNotNull()
          .map((e) => (e as String).toPermissionType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final granteeId = this.granteeId;
    final granteeType = this.granteeType;
    final permissionValues = this.permissionValues;
    return {
      'GranteeId': granteeId,
      'GranteeType': granteeType.toValue(),
      'PermissionValues': permissionValues.map((e) => e.toValue()).toList(),
    };
  }
}

enum PermissionType {
  fullAccess,
  sendAs,
  sendOnBehalf,
}

extension on PermissionType {
  String toValue() {
    switch (this) {
      case PermissionType.fullAccess:
        return 'FULL_ACCESS';
      case PermissionType.sendAs:
        return 'SEND_AS';
      case PermissionType.sendOnBehalf:
        return 'SEND_ON_BEHALF';
    }
  }
}

extension on String {
  PermissionType toPermissionType() {
    switch (this) {
      case 'FULL_ACCESS':
        return PermissionType.fullAccess;
      case 'SEND_AS':
        return PermissionType.sendAs;
      case 'SEND_ON_BEHALF':
        return PermissionType.sendOnBehalf;
    }
    throw Exception('$this is not known in enum PermissionType');
  }
}

class PutAccessControlRuleResponse {
  PutAccessControlRuleResponse();

  factory PutAccessControlRuleResponse.fromJson(Map<String, dynamic> _) {
    return PutAccessControlRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutMailboxPermissionsResponse {
  PutMailboxPermissionsResponse();

  factory PutMailboxPermissionsResponse.fromJson(Map<String, dynamic> _) {
    return PutMailboxPermissionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutRetentionPolicyResponse {
  PutRetentionPolicyResponse();

  factory PutRetentionPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutRetentionPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RegisterToWorkMailResponse {
  RegisterToWorkMailResponse();

  factory RegisterToWorkMailResponse.fromJson(Map<String, dynamic> _) {
    return RegisterToWorkMailResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ResetPasswordResponse {
  ResetPasswordResponse();

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> _) {
    return ResetPasswordResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The representation of a resource.
class Resource {
  /// The date indicating when the resource was disabled from Amazon WorkMail use.
  final DateTime? disabledDate;

  /// The email of the resource.
  final String? email;

  /// The date indicating when the resource was enabled for Amazon WorkMail use.
  final DateTime? enabledDate;

  /// The identifier of the resource.
  final String? id;

  /// The name of the resource.
  final String? name;

  /// The state of the resource, which can be ENABLED, DISABLED, or DELETED.
  final EntityState? state;

  /// The type of the resource: equipment or room.
  final ResourceType? type;

  Resource({
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
    this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      disabledDate: timeStampFromJson(json['DisabledDate']),
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
      type: (json['Type'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledDate = this.disabledDate;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final type = this.type;
    return {
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ResourceType {
  room,
  equipment,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.room:
        return 'ROOM';
      case ResourceType.equipment:
        return 'EQUIPMENT';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'ROOM':
        return ResourceType.room;
      case 'EQUIPMENT':
        return ResourceType.equipment;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

enum RetentionAction {
  none,
  delete,
  permanentlyDelete,
}

extension on RetentionAction {
  String toValue() {
    switch (this) {
      case RetentionAction.none:
        return 'NONE';
      case RetentionAction.delete:
        return 'DELETE';
      case RetentionAction.permanentlyDelete:
        return 'PERMANENTLY_DELETE';
    }
  }
}

extension on String {
  RetentionAction toRetentionAction() {
    switch (this) {
      case 'NONE':
        return RetentionAction.none;
      case 'DELETE':
        return RetentionAction.delete;
      case 'PERMANENTLY_DELETE':
        return RetentionAction.permanentlyDelete;
    }
    throw Exception('$this is not known in enum RetentionAction');
  }
}

class StartMailboxExportJobResponse {
  /// The job ID.
  final String? jobId;

  StartMailboxExportJobResponse({
    this.jobId,
  });

  factory StartMailboxExportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartMailboxExportJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

/// Describes a tag applied to a resource.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMailboxQuotaResponse {
  UpdateMailboxQuotaResponse();

  factory UpdateMailboxQuotaResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMailboxQuotaResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMobileDeviceAccessRuleResponse {
  UpdateMobileDeviceAccessRuleResponse();

  factory UpdateMobileDeviceAccessRuleResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateMobileDeviceAccessRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdatePrimaryEmailAddressResponse {
  UpdatePrimaryEmailAddressResponse();

  factory UpdatePrimaryEmailAddressResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePrimaryEmailAddressResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResourceResponse {
  UpdateResourceResponse();

  factory UpdateResourceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The representation of an Amazon WorkMail user.
class User {
  /// The date indicating when the user was disabled from Amazon WorkMail use.
  final DateTime? disabledDate;

  /// The display name of the user.
  final String? displayName;

  /// The email of the user.
  final String? email;

  /// The date indicating when the user was enabled for Amazon WorkMail use.
  final DateTime? enabledDate;

  /// The identifier of the user.
  final String? id;

  /// The name of the user.
  final String? name;

  /// The state of the user, which can be ENABLED, DISABLED, or DELETED.
  final EntityState? state;

  /// The role of the user.
  final UserRole? userRole;

  User({
    this.disabledDate,
    this.displayName,
    this.email,
    this.enabledDate,
    this.id,
    this.name,
    this.state,
    this.userRole,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      disabledDate: timeStampFromJson(json['DisabledDate']),
      displayName: json['DisplayName'] as String?,
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
      userRole: (json['UserRole'] as String?)?.toUserRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledDate = this.disabledDate;
    final displayName = this.displayName;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final userRole = this.userRole;
    return {
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (displayName != null) 'DisplayName': displayName,
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (userRole != null) 'UserRole': userRole.toValue(),
    };
  }
}

enum UserRole {
  user,
  resource,
  systemUser,
}

extension on UserRole {
  String toValue() {
    switch (this) {
      case UserRole.user:
        return 'USER';
      case UserRole.resource:
        return 'RESOURCE';
      case UserRole.systemUser:
        return 'SYSTEM_USER';
    }
  }
}

extension on String {
  UserRole toUserRole() {
    switch (this) {
      case 'USER':
        return UserRole.user;
      case 'RESOURCE':
        return UserRole.resource;
      case 'SYSTEM_USER':
        return UserRole.systemUser;
    }
    throw Exception('$this is not known in enum UserRole');
  }
}

class DirectoryInUseException extends _s.GenericAwsException {
  DirectoryInUseException({String? type, String? message})
      : super(type: type, code: 'DirectoryInUseException', message: message);
}

class DirectoryServiceAuthenticationFailedException
    extends _s.GenericAwsException {
  DirectoryServiceAuthenticationFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryServiceAuthenticationFailedException',
            message: message);
}

class DirectoryUnavailableException extends _s.GenericAwsException {
  DirectoryUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'DirectoryUnavailableException',
            message: message);
}

class EmailAddressInUseException extends _s.GenericAwsException {
  EmailAddressInUseException({String? type, String? message})
      : super(type: type, code: 'EmailAddressInUseException', message: message);
}

class EntityAlreadyRegisteredException extends _s.GenericAwsException {
  EntityAlreadyRegisteredException({String? type, String? message})
      : super(
            type: type,
            code: 'EntityAlreadyRegisteredException',
            message: message);
}

class EntityNotFoundException extends _s.GenericAwsException {
  EntityNotFoundException({String? type, String? message})
      : super(type: type, code: 'EntityNotFoundException', message: message);
}

class EntityStateException extends _s.GenericAwsException {
  EntityStateException({String? type, String? message})
      : super(type: type, code: 'EntityStateException', message: message);
}

class InvalidConfigurationException extends _s.GenericAwsException {
  InvalidConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidConfigurationException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidPasswordException extends _s.GenericAwsException {
  InvalidPasswordException({String? type, String? message})
      : super(type: type, code: 'InvalidPasswordException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MailDomainNotFoundException extends _s.GenericAwsException {
  MailDomainNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'MailDomainNotFoundException', message: message);
}

class MailDomainStateException extends _s.GenericAwsException {
  MailDomainStateException({String? type, String? message})
      : super(type: type, code: 'MailDomainStateException', message: message);
}

class NameAvailabilityException extends _s.GenericAwsException {
  NameAvailabilityException({String? type, String? message})
      : super(type: type, code: 'NameAvailabilityException', message: message);
}

class OrganizationNotFoundException extends _s.GenericAwsException {
  OrganizationNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'OrganizationNotFoundException',
            message: message);
}

class OrganizationStateException extends _s.GenericAwsException {
  OrganizationStateException({String? type, String? message})
      : super(type: type, code: 'OrganizationStateException', message: message);
}

class ReservedNameException extends _s.GenericAwsException {
  ReservedNameException({String? type, String? message})
      : super(type: type, code: 'ReservedNameException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DirectoryInUseException': (type, message) =>
      DirectoryInUseException(type: type, message: message),
  'DirectoryServiceAuthenticationFailedException': (type, message) =>
      DirectoryServiceAuthenticationFailedException(
          type: type, message: message),
  'DirectoryUnavailableException': (type, message) =>
      DirectoryUnavailableException(type: type, message: message),
  'EmailAddressInUseException': (type, message) =>
      EmailAddressInUseException(type: type, message: message),
  'EntityAlreadyRegisteredException': (type, message) =>
      EntityAlreadyRegisteredException(type: type, message: message),
  'EntityNotFoundException': (type, message) =>
      EntityNotFoundException(type: type, message: message),
  'EntityStateException': (type, message) =>
      EntityStateException(type: type, message: message),
  'InvalidConfigurationException': (type, message) =>
      InvalidConfigurationException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPasswordException': (type, message) =>
      InvalidPasswordException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MailDomainNotFoundException': (type, message) =>
      MailDomainNotFoundException(type: type, message: message),
  'MailDomainStateException': (type, message) =>
      MailDomainStateException(type: type, message: message),
  'NameAvailabilityException': (type, message) =>
      NameAvailabilityException(type: type, message: message),
  'OrganizationNotFoundException': (type, message) =>
      OrganizationNotFoundException(type: type, message: message),
  'OrganizationStateException': (type, message) =>
      OrganizationStateException(type: type, message: message),
  'ReservedNameException': (type, message) =>
      ReservedNameException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
