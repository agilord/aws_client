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

/// WorkMail is a secure, managed business email and calendaring service with
/// support for existing desktop and mobile email clients. You can access your
/// email, contacts, and calendars using Microsoft Outlook, your browser, or
/// other native iOS and Android email applications. You can integrate WorkMail
/// with your existing corporate directory and control both the keys that
/// encrypt your data and the location in which your data is stored.
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
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'workmail',
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

  /// Adds a member (user or group) to the resource's set of delegates.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [entityId] :
  /// The member (user or group) to associate to the resource.
  ///
  /// The entity ID can accept <i>UserId or GroupID</i>, <i>Username or
  /// Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Entity: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The organization under which the resource exists.
  ///
  /// Parameter [resourceId] :
  /// The resource for which members (users or groups) are associated.
  ///
  /// The identifier can accept <i>ResourceId</i>, <i>Resourcename</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Resource ID: r-0123456789a0123456789b0123456789
  /// </li>
  /// <li>
  /// Email address: resource@domain.tld
  /// </li>
  /// <li>
  /// Resource name: resource
  /// </li>
  /// </ul>
  Future<void> associateDelegateToResource({
    required String entityId,
    required String organizationId,
    required String resourceId,
  }) async {
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
  /// The identifier can accept <i>GroupId</i>, <i>Groupname</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Group ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: group@domain.tld
  /// </li>
  /// <li>
  /// Group name: group
  /// </li>
  /// </ul>
  ///
  /// Parameter [memberId] :
  /// The member (user or group) to associate to the group.
  ///
  /// The member ID can accept <i>UserID or GroupId</i>, <i>Username or
  /// Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Member: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: member@domain.tld
  /// </li>
  /// <li>
  /// Member name: member
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The organization under which the group exists.
  Future<void> associateMemberToGroup({
    required String groupId,
    required String memberId,
    required String organizationId,
  }) async {
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

  /// Assumes an impersonation role for the given WorkMail organization. This
  /// method returns an authentication token you can use to make impersonated
  /// calls.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [impersonationRoleId] :
  /// The impersonation role ID to assume.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization under which the impersonation role will be
  /// assumed.
  Future<AssumeImpersonationRoleResponse> assumeImpersonationRole({
    required String impersonationRoleId,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.AssumeImpersonationRole'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImpersonationRoleId': impersonationRoleId,
        'OrganizationId': organizationId,
      },
    );

    return AssumeImpersonationRoleResponse.fromJson(jsonResponse.body);
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

  /// Adds an alias to the set of a given member (user or group) of WorkMail.
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

  /// Creates an <code>AvailabilityConfiguration</code> for the given WorkMail
  /// organization and domain.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [NameAvailabilityException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [domainName] :
  /// The domain to which the provider applies.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which the
  /// <code>AvailabilityConfiguration</code> will be created.
  ///
  /// Parameter [clientToken] :
  /// An idempotent token that ensures that an API request is executed only
  /// once.
  ///
  /// Parameter [ewsProvider] :
  /// Exchange Web Services (EWS) availability provider definition. The request
  /// must contain exactly one provider definition, either
  /// <code>EwsProvider</code> or <code>LambdaProvider</code>.
  ///
  /// Parameter [lambdaProvider] :
  /// Lambda availability provider definition. The request must contain exactly
  /// one provider definition, either <code>EwsProvider</code> or
  /// <code>LambdaProvider</code>.
  Future<void> createAvailabilityConfiguration({
    required String domainName,
    required String organizationId,
    String? clientToken,
    EwsAvailabilityProvider? ewsProvider,
    LambdaAvailabilityProvider? lambdaProvider,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateAvailabilityConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OrganizationId': organizationId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (ewsProvider != null) 'EwsProvider': ewsProvider,
        if (lambdaProvider != null) 'LambdaProvider': lambdaProvider,
      },
    );
  }

  /// Creates a group that can be used in WorkMail by calling the
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
  ///
  /// Parameter [hiddenFromGlobalAddressList] :
  /// If this parameter is enabled, the group will be hidden from the address
  /// book.
  Future<CreateGroupResponse> createGroup({
    required String name,
    required String organizationId,
    bool? hiddenFromGlobalAddressList,
  }) async {
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
        if (hiddenFromGlobalAddressList != null)
          'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
      },
    );

    return CreateGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates an impersonation role for the given WorkMail organization.
  ///
  /// <i>Idempotency</i> ensures that an API request completes no more than one
  /// time. With an idempotent request, if the original request completes
  /// successfully, any subsequent retries also complete successfully without
  /// performing any further actions.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the new impersonation role.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization to create the new impersonation role within.
  ///
  /// Parameter [rules] :
  /// The list of rules for the impersonation role.
  ///
  /// Parameter [type] :
  /// The impersonation role's type. The available impersonation role types are
  /// <code>READ_ONLY</code> or <code>FULL_ACCESS</code>.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the client request.
  ///
  /// Parameter [description] :
  /// The description of the new impersonation role.
  Future<CreateImpersonationRoleResponse> createImpersonationRole({
    required String name,
    required String organizationId,
    required List<ImpersonationRule> rules,
    required ImpersonationRoleType type,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.CreateImpersonationRole'
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
        'Rules': rules,
        'Type': type.toValue(),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
      },
    );

    return CreateImpersonationRoleResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new mobile device access rule for the specified WorkMail
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
  /// The WorkMail organization under which the rule will be created.
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

  /// Creates a new WorkMail organization. Optionally, you can choose to
  /// associate an existing AWS Directory Service directory with your
  /// organization. If an AWS Directory Service directory ID is specified, the
  /// organization alias must match the directory alias. If you choose not to
  /// associate an existing directory with your organization, then we create a
  /// new WorkMail directory for you. For more information, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/add_new_organization.html">Adding
  /// an organization</a> in the <i>WorkMail Administrator Guide</i>.
  ///
  /// You can associate multiple email domains with an organization, then choose
  /// your default email domain from the WorkMail console. You can also
  /// associate a domain that is managed in an Amazon Route 53 public hosted
  /// zone. For more information, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html">Adding
  /// a domain</a> and <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/default_domain.html">Choosing
  /// the default domain</a> in the <i>WorkMail Administrator Guide</i>.
  ///
  /// Optionally, you can use a customer managed key from AWS Key Management
  /// Service (AWS KMS) to encrypt email for your organization. If you don't
  /// associate an AWS KMS key, WorkMail creates a default, AWS managed key for
  /// you.
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
  /// WorkMail and Microsoft Exchange. If <code>true</code>, you must include a
  /// AD Connector directory ID in the request.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of a customer managed key from AWS KMS.
  Future<CreateOrganizationResponse> createOrganization({
    required String alias,
    String? clientToken,
    String? directoryId,
    List<Domain>? domains,
    bool? enableInteroperability,
    String? kmsKeyArn,
  }) async {
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

  /// Creates a new WorkMail resource.
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
  /// The name of the new resource.
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// created.
  ///
  /// Parameter [type] :
  /// The type of the new resource. The available types are
  /// <code>equipment</code> and <code>room</code>.
  ///
  /// Parameter [description] :
  /// Resource description.
  ///
  /// Parameter [hiddenFromGlobalAddressList] :
  /// If this parameter is enabled, the resource will be hidden from the address
  /// book.
  Future<CreateResourceResponse> createResource({
    required String name,
    required String organizationId,
    required ResourceType type,
    String? description,
    bool? hiddenFromGlobalAddressList,
  }) async {
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
        if (description != null) 'Description': description,
        if (hiddenFromGlobalAddressList != null)
          'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
      },
    );

    return CreateResourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a user who can be used in WorkMail by calling the
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
  /// Parameter [firstName] :
  /// The first name of the new user.
  ///
  /// Parameter [hiddenFromGlobalAddressList] :
  /// If this parameter is enabled, the user will be hidden from the address
  /// book.
  ///
  /// Parameter [lastName] :
  /// The last name of the new user.
  ///
  /// Parameter [password] :
  /// The password for the new user.
  ///
  /// Parameter [role] :
  /// The role of the new user.
  ///
  /// You cannot pass <i>SYSTEM_USER</i> or <i>RESOURCE</i> role in a single
  /// request. When a user role is not selected, the default role of <i>USER</i>
  /// is selected.
  Future<CreateUserResponse> createUser({
    required String displayName,
    required String name,
    required String organizationId,
    String? firstName,
    bool? hiddenFromGlobalAddressList,
    String? lastName,
    String? password,
    UserRole? role,
  }) async {
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
        if (firstName != null) 'FirstName': firstName,
        if (hiddenFromGlobalAddressList != null)
          'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
        if (lastName != null) 'LastName': lastName,
        if (password != null) 'Password': password,
        if (role != null) 'Role': role.toValue(),
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an access control rule for the specified WorkMail organization.
  /// <note>
  /// Deleting already deleted and non-existing rules does not produce an error.
  /// In those cases, the service sends back an HTTP 200 response with an empty
  /// HTTP body.
  /// </note>
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

  /// Deletes the <code>AvailabilityConfiguration</code> for the given WorkMail
  /// organization and domain.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [domainName] :
  /// The domain for which the <code>AvailabilityConfiguration</code> will be
  /// deleted.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which the
  /// <code>AvailabilityConfiguration</code> will be deleted.
  Future<void> deleteAvailabilityConfiguration({
    required String domainName,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteAvailabilityConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Deletes the email monitoring configuration for a specified organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization from which the email monitoring configuration
  /// is deleted.
  Future<void> deleteEmailMonitoringConfiguration({
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteEmailMonitoringConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
      },
    );
  }

  /// Deletes a group from WorkMail.
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
  /// The identifier can be the <i>GroupId</i>, or <i>Groupname</i>. The
  /// following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Group ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Group name: group
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the group.
  Future<void> deleteGroup({
    required String groupId,
    required String organizationId,
  }) async {
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

  /// Deletes an impersonation role for the given WorkMail organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [impersonationRoleId] :
  /// The ID of the impersonation role to delete.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization from which to delete the impersonation role.
  Future<void> deleteImpersonationRole({
    required String impersonationRoleId,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteImpersonationRole'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImpersonationRoleId': impersonationRoleId,
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
  /// The identifier of the entity that owns the mailbox.
  ///
  /// The identifier can be <i>UserId or Group Id</i>, <i>Username or
  /// Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012,
  /// r-0123456789a0123456789b0123456789, or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [granteeId] :
  /// The identifier of the entity for which to delete granted permissions.
  ///
  /// The identifier can be <i>UserId, ResourceID, or Group Id</i>, <i>Username
  /// or Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Grantee ID:
  /// 12345678-1234-1234-1234-123456789012,r-0123456789a0123456789b0123456789,
  /// or S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: grantee@domain.tld
  /// </li>
  /// <li>
  /// Grantee name: grantee
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier of the organization under which the member (user or group)
  /// exists.
  Future<void> deleteMailboxPermissions({
    required String entityId,
    required String granteeId,
    required String organizationId,
  }) async {
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

  /// Deletes the mobile device access override for the given WorkMail
  /// organization, user, and device.
  /// <note>
  /// Deleting already deleted and non-existing overrides does not produce an
  /// error. In those cases, the service sends back an HTTP 200 response with an
  /// empty HTTP body.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [deviceId] :
  /// The mobile device for which you delete the override. <code>DeviceId</code>
  /// is case insensitive.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which the access override will be deleted.
  ///
  /// Parameter [userId] :
  /// The WorkMail user for which you want to delete the override. Accepts the
  /// following types of user identities:
  ///
  /// <ul>
  /// <li>
  /// User ID: <code>12345678-1234-1234-1234-123456789012</code> or
  /// <code>S-1-1-12-1234567890-123456789-123456789-1234</code>
  /// </li>
  /// <li>
  /// Email address: <code>user@domain.tld</code>
  /// </li>
  /// <li>
  /// User name: <code>user</code>
  /// </li>
  /// </ul>
  Future<void> deleteMobileDeviceAccessOverride({
    required String deviceId,
    required String organizationId,
    required String userId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeleteMobileDeviceAccessOverride'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceId': deviceId,
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );
  }

  /// Deletes a mobile device access rule for the specified WorkMail
  /// organization.
  /// <note>
  /// Deleting already deleted and non-existing rules does not produce an error.
  /// In those cases, the service sends back an HTTP 200 response with an empty
  /// HTTP body.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [mobileDeviceAccessRuleId] :
  /// The identifier of the rule to be deleted.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization under which the rule will be deleted.
  Future<void> deleteMobileDeviceAccessRule({
    required String mobileDeviceAccessRuleId,
    required String organizationId,
  }) async {
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

  /// Deletes an WorkMail organization and all underlying AWS resources managed
  /// by WorkMail as part of the organization. You can choose whether to delete
  /// the associated directory. For more information, see <a
  /// href="https://docs.aws.amazon.com/workmail/latest/adminguide/remove_organization.html">Removing
  /// an organization</a> in the <i>WorkMail Administrator Guide</i>.
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
  ///
  /// Parameter [forceDelete] :
  /// Deletes a WorkMail organization even if the organization has enabled
  /// users.
  Future<DeleteOrganizationResponse> deleteOrganization({
    required bool deleteDirectory,
    required String organizationId,
    String? clientToken,
    bool? forceDelete,
  }) async {
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
        if (forceDelete != null) 'ForceDelete': forceDelete,
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
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization from which the resource is
  /// deleted.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be deleted.
  ///
  /// The identifier can accept <i>ResourceId</i>, or <i>Resourcename</i>. The
  /// following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Resource ID: r-0123456789a0123456789b0123456789
  /// </li>
  /// <li>
  /// Resource name: resource
  /// </li>
  /// </ul>
  Future<void> deleteResource({
    required String organizationId,
    required String resourceId,
  }) async {
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

  /// Deletes a user from WorkMail and all subsequent systems. Before you can
  /// delete a user, the user state must be <code>DISABLED</code>. Use the
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
  ///
  /// The identifier can be the <i>UserId</i> or <i>Username</i>. The following
  /// identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// User ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// User name: user
  /// </li>
  /// </ul>
  Future<void> deleteUser({
    required String organizationId,
    required String userId,
  }) async {
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

  /// Mark a user, group, or resource as no longer used in WorkMail. This action
  /// disassociates the mailbox and schedules it for clean-up. WorkMail keeps
  /// mailboxes for 30 days before they are permanently removed. The
  /// functionality in the console is <i>Disable</i>.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the member to be updated.
  ///
  /// The identifier can be <i>UserId, ResourceId, or Group Id</i>, <i>Username,
  /// Resourcename, or Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012,
  /// r-0123456789a0123456789b0123456789, or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the WorkMail entity
  /// exists.
  Future<void> deregisterFromWorkMail({
    required String entityId,
    required String organizationId,
  }) async {
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

  /// Removes a domain from WorkMail, stops email routing to WorkMail, and
  /// removes the authorization allowing WorkMail use. SES keeps the domain
  /// because other applications may use it. You must first remove any email
  /// address used by WorkMail entities before you remove the domain.
  ///
  /// May throw [MailDomainInUseException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidCustomSesConfigurationException].
  ///
  /// Parameter [domainName] :
  /// The domain to deregister in WorkMail and SES.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which the domain will be deregistered.
  Future<void> deregisterMailDomain({
    required String domainName,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DeregisterMailDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Describes the current email monitoring configuration for a specified
  /// organization.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization for which the email monitoring configuration is
  /// described.
  Future<DescribeEmailMonitoringConfigurationResponse>
      describeEmailMonitoringConfiguration({
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeEmailMonitoringConfiguration'
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

    return DescribeEmailMonitoringConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns basic details about an entity in WorkMail.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [email] :
  /// The email under which the entity exists.
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the entity exists.
  Future<DescribeEntityResponse> describeEntity({
    required String email,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeEntity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Email': email,
        'OrganizationId': organizationId,
      },
    );

    return DescribeEntityResponse.fromJson(jsonResponse.body);
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
  /// The identifier can accept <i>GroupId</i>, <i>Groupname</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Group ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: group@domain.tld
  /// </li>
  /// <li>
  /// Group name: group
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  Future<DescribeGroupResponse> describeGroup({
    required String groupId,
    required String organizationId,
  }) async {
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

  /// Lists the settings in a DMARC policy for a specified organization.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// Lists the ID of the given organization.
  Future<DescribeInboundDmarcSettingsResponse> describeInboundDmarcSettings({
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.DescribeInboundDmarcSettings'
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

    return DescribeInboundDmarcSettingsResponse.fromJson(jsonResponse.body);
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
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// described.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be described.
  ///
  /// The identifier can accept <i>ResourceId</i>, <i>Resourcename</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Resource ID: r-0123456789a0123456789b0123456789
  /// </li>
  /// <li>
  /// Email address: resource@domain.tld
  /// </li>
  /// <li>
  /// Resource name: resource
  /// </li>
  /// </ul>
  Future<DescribeResourceResponse> describeResource({
    required String organizationId,
    required String resourceId,
  }) async {
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
  ///
  /// The identifier can be the <i>UserId</i>, <i>Username</i>, or <i>email</i>.
  /// The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// User ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: user@domain.tld
  /// </li>
  /// <li>
  /// User name: user
  /// </li>
  /// </ul> <p/>
  Future<DescribeUserResponse> describeUser({
    required String organizationId,
    required String userId,
  }) async {
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
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the member (user, group) to be removed from the
  /// resource's delegates.
  ///
  /// The entity ID can accept <i>UserId or GroupID</i>, <i>Username or
  /// Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Entity: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the resource exists.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource from which delegates' set members are
  /// removed.
  ///
  /// The identifier can accept <i>ResourceId</i>, <i>Resourcename</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Resource ID: r-0123456789a0123456789b0123456789
  /// </li>
  /// <li>
  /// Email address: resource@domain.tld
  /// </li>
  /// <li>
  /// Resource name: resource
  /// </li>
  /// </ul>
  Future<void> disassociateDelegateFromResource({
    required String entityId,
    required String organizationId,
    required String resourceId,
  }) async {
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
  /// The identifier can accept <i>GroupId</i>, <i>Groupname</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Group ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: group@domain.tld
  /// </li>
  /// <li>
  /// Group name: group
  /// </li>
  /// </ul>
  ///
  /// Parameter [memberId] :
  /// The identifier for the member to be removed from the group.
  ///
  /// The member ID can accept <i>UserID or GroupId</i>, <i>Username or
  /// Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Member ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: member@domain.tld
  /// </li>
  /// <li>
  /// Member name: member
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  Future<void> disassociateMemberFromGroup({
    required String groupId,
    required String memberId,
    required String organizationId,
  }) async {
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
  /// to a specified IPv4 address, access protocol action, and user ID or
  /// impersonation role ID. You must provide either the user ID or
  /// impersonation role ID. Impersonation role ID can only be used with Action
  /// EWS.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNotFoundException].
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
  /// Parameter [impersonationRoleId] :
  /// The impersonation role ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<GetAccessControlEffectResponse> getAccessControlEffect({
    required String action,
    required String ipAddress,
    required String organizationId,
    String? impersonationRoleId,
    String? userId,
  }) async {
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
        if (impersonationRoleId != null)
          'ImpersonationRoleId': impersonationRoleId,
        if (userId != null) 'UserId': userId,
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

  /// Gets the impersonation role details for the given WorkMail organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [impersonationRoleId] :
  /// The impersonation role ID to retrieve.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization from which to retrieve the impersonation role.
  Future<GetImpersonationRoleResponse> getImpersonationRole({
    required String impersonationRoleId,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetImpersonationRole'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImpersonationRoleId': impersonationRoleId,
        'OrganizationId': organizationId,
      },
    );

    return GetImpersonationRoleResponse.fromJson(jsonResponse.body);
  }

  /// Tests whether the given impersonation role can impersonate a target user.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  ///
  /// Parameter [impersonationRoleId] :
  /// The impersonation role ID to test.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization where the impersonation role is defined.
  ///
  /// Parameter [targetUser] :
  /// The WorkMail organization user chosen to test the impersonation role. The
  /// following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// User ID: <code>12345678-1234-1234-1234-123456789012</code> or
  /// <code>S-1-1-12-1234567890-123456789-123456789-1234</code>
  /// </li>
  /// <li>
  /// Email address: <code>user@domain.tld</code>
  /// </li>
  /// <li>
  /// User name: <code>user</code>
  /// </li>
  /// </ul>
  Future<GetImpersonationRoleEffectResponse> getImpersonationRoleEffect({
    required String impersonationRoleId,
    required String organizationId,
    required String targetUser,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetImpersonationRoleEffect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImpersonationRoleId': impersonationRoleId,
        'OrganizationId': organizationId,
        'TargetUser': targetUser,
      },
    );

    return GetImpersonationRoleEffectResponse.fromJson(jsonResponse.body);
  }

  /// Gets details for a mail domain, including domain records required to
  /// configure your domain with recommended security.
  ///
  /// May throw [MailDomainNotFoundException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [domainName] :
  /// The domain from which you want to retrieve details.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which the domain is retrieved.
  Future<GetMailDomainResponse> getMailDomain({
    required String domainName,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetMailDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OrganizationId': organizationId,
      },
    );

    return GetMailDomainResponse.fromJson(jsonResponse.body);
  }

  /// Requests a user's mailbox details for a specified organization and user.
  ///
  /// May throw [InvalidParameterException].
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
  ///
  /// The identifier can be the <i>UserId</i>, <i>Username</i>, or <i>email</i>.
  /// The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// User ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: user@domain.tld
  /// </li>
  /// <li>
  /// User name: user
  /// </li>
  /// </ul>
  Future<GetMailboxDetailsResponse> getMailboxDetails({
    required String organizationId,
    required String userId,
  }) async {
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
  /// of the current set of mobile device access rules for the WorkMail
  /// organization for a particular user's attributes.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization to simulate the access effect for.
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

  /// Gets the mobile device access override for the given WorkMail
  /// organization, user, and device.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deviceId] :
  /// The mobile device to which the override applies. <code>DeviceId</code> is
  /// case insensitive.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization to which you want to apply the override.
  ///
  /// Parameter [userId] :
  /// Identifies the WorkMail user for the override. Accepts the following types
  /// of user identities:
  ///
  /// <ul>
  /// <li>
  /// User ID: <code>12345678-1234-1234-1234-123456789012</code> or
  /// <code>S-1-1-12-1234567890-123456789-123456789-1234</code>
  /// </li>
  /// <li>
  /// Email address: <code>user@domain.tld</code>
  /// </li>
  /// <li>
  /// User name: <code>user</code>
  /// </li>
  /// </ul>
  Future<GetMobileDeviceAccessOverrideResponse> getMobileDeviceAccessOverride({
    required String deviceId,
    required String organizationId,
    required String userId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.GetMobileDeviceAccessOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceId': deviceId,
        'OrganizationId': organizationId,
        'UserId': userId,
      },
    );

    return GetMobileDeviceAccessOverrideResponse.fromJson(jsonResponse.body);
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// List all the <code>AvailabilityConfiguration</code>'s for the given
  /// WorkMail organization.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which the
  /// <code>AvailabilityConfiguration</code>'s will be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not require a token.
  Future<ListAvailabilityConfigurationsResponse>
      listAvailabilityConfigurations({
    required String organizationId,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListAvailabilityConfigurations'
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

    return ListAvailabilityConfigurationsResponse.fromJson(jsonResponse.body);
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
  /// The identifier can accept <i>GroupId</i>, <i>Groupname</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Group ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: group@domain.tld
  /// </li>
  /// <li>
  /// Group name: group
  /// </li>
  /// </ul>
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// Parameter [filters] :
  /// Limit the search results based on the filter criteria. Only one filter per
  /// request is supported.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListGroupsResponse> listGroups({
    required String organizationId,
    ListGroupsFilters? filters,
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns all the groups to which an entity belongs.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [entityId] :
  /// The identifier for the entity.
  ///
  /// The entity ID can accept <i>UserId or GroupID</i>, <i>Username or
  /// Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the entity exists.
  ///
  /// Parameter [filters] :
  /// Limit the search results based on the filter criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListGroupsForEntityResponse> listGroupsForEntity({
    required String entityId,
    required String organizationId,
    ListGroupsForEntityFilters? filters,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListGroupsForEntity'
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupsForEntityResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the impersonation roles for the given WorkMail organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization to which the listed impersonation roles belong.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results. The first call
  /// doesn't require a token.
  Future<ListImpersonationRolesResponse> listImpersonationRoles({
    required String organizationId,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListImpersonationRoles'
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

    return ListImpersonationRolesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the mail domains in a given WorkMail organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which to list domains.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not require a token.
  Future<ListMailDomainsResponse> listMailDomains({
    required String organizationId,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListMailDomains'
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

    return ListMailDomainsResponse.fromJson(jsonResponse.body);
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// The identifier of the user, or resource for which to list mailbox
  /// permissions.
  ///
  /// The entity ID can accept <i>UserId or ResourceId</i>, <i>Username or
  /// Resourcename</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012, or
  /// r-0123456789a0123456789b0123456789
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Lists all the mobile device access overrides for any given combination of
  /// WorkMail organization, user, or device.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization under which to list mobile device access
  /// overrides.
  ///
  /// Parameter [deviceId] :
  /// The mobile device to which the access override applies.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not require a token.
  ///
  /// Parameter [userId] :
  /// The WorkMail user under which you list the mobile device access overrides.
  /// Accepts the following types of user identities:
  ///
  /// <ul>
  /// <li>
  /// User ID: <code>12345678-1234-1234-1234-123456789012</code> or
  /// <code>S-1-1-12-1234567890-123456789-123456789-1234</code>
  /// </li>
  /// <li>
  /// Email address: <code>user@domain.tld</code>
  /// </li>
  /// <li>
  /// User name: <code>user</code>
  /// </li>
  /// </ul>
  Future<ListMobileDeviceAccessOverridesResponse>
      listMobileDeviceAccessOverrides({
    required String organizationId,
    String? deviceId,
    int? maxResults,
    String? nextToken,
    String? userId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.ListMobileDeviceAccessOverrides'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        if (deviceId != null) 'DeviceId': deviceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (userId != null) 'UserId': userId,
      },
    );

    return ListMobileDeviceAccessOverridesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the mobile device access rules for the specified WorkMail
  /// organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which to list the rules.
  Future<ListMobileDeviceAccessRulesResponse> listMobileDeviceAccessRules({
    required String organizationId,
  }) async {
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
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization that contains the resource for which
  /// delegates are listed.
  ///
  /// Parameter [resourceId] :
  /// The identifier for the resource whose delegates are listed.
  ///
  /// The identifier can accept <i>ResourceId</i>, <i>Resourcename</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Resource ID: r-0123456789a0123456789b0123456789
  /// </li>
  /// <li>
  /// Email address: resource@domain.tld
  /// </li>
  /// <li>
  /// Resource name: resource
  /// </li>
  /// </ul>
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the resources exist.
  ///
  /// Parameter [filters] :
  /// Limit the resource search results based on the filter criteria. You can
  /// only use one filter per request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListResourcesResponse> listResources({
    required String organizationId,
    ListResourcesFilters? filters,
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListResourcesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags applied to an WorkMail organization resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
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
  /// Parameter [filters] :
  /// Limit the user search results based on the filter criteria. You can only
  /// use one filter per request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. The first call does
  /// not contain any tokens.
  Future<ListUsersResponse> listUsers({
    required String organizationId,
    ListUsersFilters? filters,
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
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListUsersResponse.fromJson(jsonResponse.body);
  }

  /// Adds a new access control rule for the specified organization. The rule
  /// allows or denies access to the organization for the specified IPv4
  /// addresses, access protocol actions, user IDs and impersonation IDs. Adding
  /// a new rule with the same name as an existing rule replaces the older rule.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [EntityNotFoundException].
  /// May throw [ResourceNotFoundException].
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
  /// Parameter [impersonationRoleIds] :
  /// Impersonation role IDs to include in the rule.
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
  /// Parameter [notImpersonationRoleIds] :
  /// Impersonation role IDs to exclude from the rule.
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
    List<String>? impersonationRoleIds,
    List<String>? ipRanges,
    List<String>? notActions,
    List<String>? notImpersonationRoleIds,
    List<String>? notIpRanges,
    List<String>? notUserIds,
    List<String>? userIds,
  }) async {
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
        if (impersonationRoleIds != null)
          'ImpersonationRoleIds': impersonationRoleIds,
        if (ipRanges != null) 'IpRanges': ipRanges,
        if (notActions != null) 'NotActions': notActions,
        if (notImpersonationRoleIds != null)
          'NotImpersonationRoleIds': notImpersonationRoleIds,
        if (notIpRanges != null) 'NotIpRanges': notIpRanges,
        if (notUserIds != null) 'NotUserIds': notUserIds,
        if (userIds != null) 'UserIds': userIds,
      },
    );
  }

  /// Creates or updates the email monitoring configuration for a specified
  /// organization.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [logGroupArn] :
  /// The Amazon Resource Name (ARN) of the CloudWatch Log group associated with
  /// the email monitoring configuration.
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization for which the email monitoring configuration is
  /// set.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM Role associated with the email
  /// monitoring configuration.
  Future<void> putEmailMonitoringConfiguration({
    required String logGroupArn,
    required String organizationId,
    required String roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutEmailMonitoringConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LogGroupArn': logGroupArn,
        'OrganizationId': organizationId,
        'RoleArn': roleArn,
      },
    );
  }

  /// Enables or disables a DMARC policy for a given organization.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  ///
  /// Parameter [enforced] :
  /// Enforces or suspends a policy after it's applied.
  ///
  /// Parameter [organizationId] :
  /// The ID of the organization that you are applying the DMARC policy to.
  Future<void> putInboundDmarcSettings({
    required bool enforced,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutInboundDmarcSettings'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Enforced': enforced,
        'OrganizationId': organizationId,
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
  /// The identifier of the user or resource for which to update mailbox
  /// permissions.
  ///
  /// The identifier can be <i>UserId, ResourceID, or Group Id</i>, <i>Username,
  /// Resourcename, or Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012,
  /// r-0123456789a0123456789b0123456789, or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [granteeId] :
  /// The identifier of the user, group, or resource to which to grant the
  /// permissions.
  ///
  /// The identifier can be <i>UserId, ResourceID, or Group Id</i>, <i>Username,
  /// Resourcename, or Groupname</i>, or <i>email</i>.
  ///
  /// <ul>
  /// <li>
  /// Grantee ID: 12345678-1234-1234-1234-123456789012,
  /// r-0123456789a0123456789b0123456789, or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: grantee@domain.tld
  /// </li>
  /// <li>
  /// Grantee name: grantee
  /// </li>
  /// </ul>
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

  /// Creates or updates a mobile device access override for the given WorkMail
  /// organization, user, and device.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  ///
  /// Parameter [deviceId] :
  /// The mobile device for which you create the override. <code>DeviceId</code>
  /// is case insensitive.
  ///
  /// Parameter [effect] :
  /// The effect of the override, <code>ALLOW</code> or <code>DENY</code>.
  ///
  /// Parameter [organizationId] :
  /// Identifies the WorkMail organization for which you create the override.
  ///
  /// Parameter [userId] :
  /// The WorkMail user for which you create the override. Accepts the following
  /// types of user identities:
  ///
  /// <ul>
  /// <li>
  /// User ID: <code>12345678-1234-1234-1234-123456789012</code> or
  /// <code>S-1-1-12-1234567890-123456789-123456789-1234</code>
  /// </li>
  /// <li>
  /// Email address: <code>user@domain.tld</code>
  /// </li>
  /// <li>
  /// User name: <code>user</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the override.
  Future<void> putMobileDeviceAccessOverride({
    required String deviceId,
    required MobileDeviceAccessRuleEffect effect,
    required String organizationId,
    required String userId,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.PutMobileDeviceAccessOverride'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceId': deviceId,
        'Effect': effect.toValue(),
        'OrganizationId': organizationId,
        'UserId': userId,
        if (description != null) 'Description': description,
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

  /// Registers a new domain in WorkMail and SES, and configures it for use by
  /// WorkMail. Emails received by SES for this domain are routed to the
  /// specified WorkMail organization, and WorkMail has permanent permission to
  /// use the specified domain for sending your users' emails.
  ///
  /// May throw [MailDomainInUseException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [domainName] :
  /// The name of the mail domain to create in WorkMail and SES.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization under which you're creating the domain.
  ///
  /// Parameter [clientToken] :
  /// Idempotency token used when retrying requests.
  Future<void> registerMailDomain({
    required String domainName,
    required String organizationId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.RegisterMailDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OrganizationId': organizationId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );
  }

  /// Registers an existing and disabled user, group, or resource for WorkMail
  /// use by associating a mailbox and calendaring capabilities. It performs no
  /// change if the user, group, or resource is enabled and fails if the user,
  /// group, or resource is deleted. This operation results in the accumulation
  /// of costs. For more information, see <a
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
  /// The identifier can accept <i>UserId, ResourceId, or GroupId</i>, or
  /// <i>Username, Resourcename, or Groupname</i>. The following identity
  /// formats are available:
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012,
  /// r-0123456789a0123456789b0123456789, or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user, group, or
  /// resource exists.
  Future<void> registerToWorkMail({
    required String email,
    required String entityId,
    required String organizationId,
  }) async {
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
  /// mailbox content</a> in the <i>WorkMail Administrator Guide</i>.
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
  /// The identifier can accept <i>UserId or ResourceId</i>, <i>Username or
  /// Resourcename</i>, or <i>email</i>. The following identity formats are
  /// available:
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012,
  /// r-0123456789a0123456789b0123456789 , or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
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

  /// Applies the specified tags to the specified WorkMailorganization resource.
  ///
  /// May throw [InvalidParameterException].
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

  /// Performs a test on an availability provider to ensure that access is
  /// allowed. For EWS, it verifies the provided credentials can be used to
  /// successfully log in. For Lambda, it verifies that the Lambda function can
  /// be invoked and that the resource access policy was configured to deny
  /// anonymous access. An anonymous invocation is one done without providing
  /// either a <code>SourceArn</code> or <code>SourceAccount</code> header.
  /// <note>
  /// The request must contain either one provider definition
  /// (<code>EwsProvider</code> or <code>LambdaProvider</code>) or the
  /// <code>DomainName</code> parameter. If the <code>DomainName</code>
  /// parameter is provided, the configuration stored under the
  /// <code>DomainName</code> will be tested.
  /// </note>
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization where the availability provider will be tested.
  ///
  /// Parameter [domainName] :
  /// The domain to which the provider applies. If this field is provided, a
  /// stored availability provider associated to this domain name will be
  /// tested.
  Future<TestAvailabilityConfigurationResponse> testAvailabilityConfiguration({
    required String organizationId,
    String? domainName,
    EwsAvailabilityProvider? ewsProvider,
    LambdaAvailabilityProvider? lambdaProvider,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.TestAvailabilityConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationId': organizationId,
        if (domainName != null) 'DomainName': domainName,
        if (ewsProvider != null) 'EwsProvider': ewsProvider,
        if (lambdaProvider != null) 'LambdaProvider': lambdaProvider,
      },
    );

    return TestAvailabilityConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Untags the specified tags from the specified WorkMail organization
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

  /// Updates an existing <code>AvailabilityConfiguration</code> for the given
  /// WorkMail organization and domain.
  ///
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [domainName] :
  /// The domain to which the provider applies the availability configuration.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which the
  /// <code>AvailabilityConfiguration</code> will be updated.
  ///
  /// Parameter [ewsProvider] :
  /// The EWS availability provider definition. The request must contain exactly
  /// one provider definition, either <code>EwsProvider</code> or
  /// <code>LambdaProvider</code>. The previously stored provider will be
  /// overridden by the one provided.
  ///
  /// Parameter [lambdaProvider] :
  /// The Lambda availability provider definition. The request must contain
  /// exactly one provider definition, either <code>EwsProvider</code> or
  /// <code>LambdaProvider</code>. The previously stored provider will be
  /// overridden by the one provided.
  Future<void> updateAvailabilityConfiguration({
    required String domainName,
    required String organizationId,
    EwsAvailabilityProvider? ewsProvider,
    LambdaAvailabilityProvider? lambdaProvider,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateAvailabilityConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OrganizationId': organizationId,
        if (ewsProvider != null) 'EwsProvider': ewsProvider,
        if (lambdaProvider != null) 'LambdaProvider': lambdaProvider,
      },
    );
  }

  /// Updates the default mail domain for an organization. The default mail
  /// domain is used by the WorkMail AWS Console to suggest an email address
  /// when enabling a mail user. You can only have one default domain.
  ///
  /// May throw [MailDomainNotFoundException].
  /// May throw [MailDomainStateException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [domainName] :
  /// The domain name that will become the default domain.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization for which to list domains.
  Future<void> updateDefaultMailDomain({
    required String domainName,
    required String organizationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateDefaultMailDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OrganizationId': organizationId,
      },
    );
  }

  /// Updates attibutes in a group.
  ///
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [groupId] :
  /// The identifier for the group to be updated.
  ///
  /// The identifier can accept <i>GroupId</i>, <i>Groupname</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Group ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: group@domain.tld
  /// </li>
  /// <li>
  /// Group name: group
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the group exists.
  ///
  /// Parameter [hiddenFromGlobalAddressList] :
  /// If enabled, the group is hidden from the global address list.
  Future<void> updateGroup({
    required String groupId,
    required String organizationId,
    bool? hiddenFromGlobalAddressList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateGroup'
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
        if (hiddenFromGlobalAddressList != null)
          'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
      },
    );
  }

  /// Updates an impersonation role for the given WorkMail organization.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [EntityNotFoundException].
  /// May throw [EntityStateException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [impersonationRoleId] :
  /// The ID of the impersonation role to update.
  ///
  /// Parameter [name] :
  /// The updated impersonation role name.
  ///
  /// Parameter [organizationId] :
  /// The WorkMail organization that contains the impersonation role to update.
  ///
  /// Parameter [rules] :
  /// The updated list of rules.
  ///
  /// Parameter [type] :
  /// The updated impersonation role type.
  ///
  /// Parameter [description] :
  /// The updated impersonation role description.
  Future<void> updateImpersonationRole({
    required String impersonationRoleId,
    required String name,
    required String organizationId,
    required List<ImpersonationRule> rules,
    required ImpersonationRoleType type,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateImpersonationRole'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ImpersonationRoleId': impersonationRoleId,
        'Name': name,
        'OrganizationId': organizationId,
        'Rules': rules,
        'Type': type.toValue(),
        if (description != null) 'Description': description,
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
  ///
  /// The identifier can be the <i>UserId</i>, <i>Username</i>, or <i>email</i>.
  /// The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// User ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: user@domain.tld
  /// </li>
  /// <li>
  /// User name: user
  /// </li>
  /// </ul>
  Future<void> updateMailboxQuota({
    required int mailboxQuota,
    required String organizationId,
    required String userId,
  }) async {
    _s.validateNumRange(
      'mailboxQuota',
      mailboxQuota,
      1,
      1152921504606846976,
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

  /// Updates a mobile device access rule for the specified WorkMail
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
  /// The WorkMail organization under which the rule will be updated.
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
  /// The identifier can accept <i>UseriD, ResourceId, or GroupId</i>,
  /// <i>Username, Resourcename, or Groupname</i>, or <i>email</i>. The
  /// following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Entity ID: 12345678-1234-1234-1234-123456789012,
  /// r-0123456789a0123456789b0123456789, or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: entity@domain.tld
  /// </li>
  /// <li>
  /// Entity name: entity
  /// </li>
  /// </ul>
  ///
  /// Parameter [organizationId] :
  /// The organization that contains the user, group, or resource to update.
  Future<void> updatePrimaryEmailAddress({
    required String email,
    required String entityId,
    required String organizationId,
  }) async {
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
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [organizationId] :
  /// The identifier associated with the organization for which the resource is
  /// updated.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource to be updated.
  ///
  /// The identifier can accept <i>ResourceId</i>, <i>Resourcename</i>, or
  /// <i>email</i>. The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// Resource ID: r-0123456789a0123456789b0123456789
  /// </li>
  /// <li>
  /// Email address: resource@domain.tld
  /// </li>
  /// <li>
  /// Resource name: resource
  /// </li>
  /// </ul>
  ///
  /// Parameter [bookingOptions] :
  /// The resource's booking options to be updated.
  ///
  /// Parameter [description] :
  /// Updates the resource description.
  ///
  /// Parameter [hiddenFromGlobalAddressList] :
  /// If enabled, the resource is hidden from the global address list.
  ///
  /// Parameter [name] :
  /// The name of the resource to be updated.
  ///
  /// Parameter [type] :
  /// Updates the resource type.
  Future<void> updateResource({
    required String organizationId,
    required String resourceId,
    BookingOptions? bookingOptions,
    String? description,
    bool? hiddenFromGlobalAddressList,
    String? name,
    ResourceType? type,
  }) async {
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
        if (description != null) 'Description': description,
        if (hiddenFromGlobalAddressList != null)
          'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
        if (name != null) 'Name': name,
        if (type != null) 'Type': type.toValue(),
      },
    );
  }

  /// Updates data for the user. To have the latest information, it must be
  /// preceded by a <a>DescribeUser</a> call. The dataset in the request should
  /// be the one expected when performing another <code>DescribeUser</code>
  /// call.
  ///
  /// May throw [DirectoryServiceAuthenticationFailedException].
  /// May throw [DirectoryUnavailableException].
  /// May throw [EntityNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [OrganizationNotFoundException].
  /// May throw [OrganizationStateException].
  /// May throw [UnsupportedOperationException].
  /// May throw [EntityStateException].
  ///
  /// Parameter [organizationId] :
  /// The identifier for the organization under which the user exists.
  ///
  /// Parameter [userId] :
  /// The identifier for the user to be updated.
  ///
  /// The identifier can be the <i>UserId</i>, <i>Username</i>, or <i>email</i>.
  /// The following identity formats are available:
  ///
  /// <ul>
  /// <li>
  /// User ID: 12345678-1234-1234-1234-123456789012 or
  /// S-1-1-12-1234567890-123456789-123456789-1234
  /// </li>
  /// <li>
  /// Email address: user@domain.tld
  /// </li>
  /// <li>
  /// User name: user
  /// </li>
  /// </ul>
  ///
  /// Parameter [city] :
  /// Updates the user's city.
  ///
  /// Parameter [company] :
  /// Updates the user's company.
  ///
  /// Parameter [country] :
  /// Updates the user's country.
  ///
  /// Parameter [department] :
  /// Updates the user's department.
  ///
  /// Parameter [displayName] :
  /// Updates the display name of the user.
  ///
  /// Parameter [firstName] :
  /// Updates the user's first name.
  ///
  /// Parameter [hiddenFromGlobalAddressList] :
  /// If enabled, the user is hidden from the global address list.
  ///
  /// Parameter [initials] :
  /// Updates the user's initials.
  ///
  /// Parameter [jobTitle] :
  /// Updates the user's job title.
  ///
  /// Parameter [lastName] :
  /// Updates the user's last name.
  ///
  /// Parameter [office] :
  /// Updates the user's office.
  ///
  /// Parameter [role] :
  /// Updates the user role.
  ///
  /// You cannot pass <i>SYSTEM_USER</i> or <i>RESOURCE</i>.
  ///
  /// Parameter [street] :
  /// Updates the user's street address.
  ///
  /// Parameter [telephone] :
  /// Updates the user's contact details.
  ///
  /// Parameter [zipCode] :
  /// Updates the user's zipcode.
  Future<void> updateUser({
    required String organizationId,
    required String userId,
    String? city,
    String? company,
    String? country,
    String? department,
    String? displayName,
    String? firstName,
    bool? hiddenFromGlobalAddressList,
    String? initials,
    String? jobTitle,
    String? lastName,
    String? office,
    UserRole? role,
    String? street,
    String? telephone,
    String? zipCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'WorkMailService.UpdateUser'
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
        if (city != null) 'City': city,
        if (company != null) 'Company': company,
        if (country != null) 'Country': country,
        if (department != null) 'Department': department,
        if (displayName != null) 'DisplayName': displayName,
        if (firstName != null) 'FirstName': firstName,
        if (hiddenFromGlobalAddressList != null)
          'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
        if (initials != null) 'Initials': initials,
        if (jobTitle != null) 'JobTitle': jobTitle,
        if (lastName != null) 'LastName': lastName,
        if (office != null) 'Office': office,
        if (role != null) 'Role': role.toValue(),
        if (street != null) 'Street': street,
        if (telephone != null) 'Telephone': telephone,
        if (zipCode != null) 'ZipCode': zipCode,
      },
    );
  }
}

/// A rule that controls access to an WorkMail organization.
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

  /// Impersonation role IDs to include in the rule.
  final List<String>? impersonationRoleIds;

  /// IPv4 CIDR ranges to include in the rule.
  final List<String>? ipRanges;

  /// The rule name.
  final String? name;

  /// Access protocol actions to exclude from the rule. Valid values include
  /// <code>ActiveSync</code>, <code>AutoDiscover</code>, <code>EWS</code>,
  /// <code>IMAP</code>, <code>SMTP</code>, <code>WindowsOutlook</code>, and
  /// <code>WebMail</code>.
  final List<String>? notActions;

  /// Impersonation role IDs to exclude from the rule.
  final List<String>? notImpersonationRoleIds;

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
    this.impersonationRoleIds,
    this.ipRanges,
    this.name,
    this.notActions,
    this.notImpersonationRoleIds,
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
      impersonationRoleIds: (json['ImpersonationRoleIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ipRanges: (json['IpRanges'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      notActions: (json['NotActions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notImpersonationRoleIds: (json['NotImpersonationRoleIds'] as List?)
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
    final impersonationRoleIds = this.impersonationRoleIds;
    final ipRanges = this.ipRanges;
    final name = this.name;
    final notActions = this.notActions;
    final notImpersonationRoleIds = this.notImpersonationRoleIds;
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
      if (impersonationRoleIds != null)
        'ImpersonationRoleIds': impersonationRoleIds,
      if (ipRanges != null) 'IpRanges': ipRanges,
      if (name != null) 'Name': name,
      if (notActions != null) 'NotActions': notActions,
      if (notImpersonationRoleIds != null)
        'NotImpersonationRoleIds': notImpersonationRoleIds,
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

extension AccessControlRuleEffectValueExtension on AccessControlRuleEffect {
  String toValue() {
    switch (this) {
      case AccessControlRuleEffect.allow:
        return 'ALLOW';
      case AccessControlRuleEffect.deny:
        return 'DENY';
    }
  }
}

extension AccessControlRuleEffectFromString on String {
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

enum AccessEffect {
  allow,
  deny,
}

extension AccessEffectValueExtension on AccessEffect {
  String toValue() {
    switch (this) {
      case AccessEffect.allow:
        return 'ALLOW';
      case AccessEffect.deny:
        return 'DENY';
    }
  }
}

extension AccessEffectFromString on String {
  AccessEffect toAccessEffect() {
    switch (this) {
      case 'ALLOW':
        return AccessEffect.allow;
      case 'DENY':
        return AccessEffect.deny;
    }
    throw Exception('$this is not known in enum AccessEffect');
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

class AssumeImpersonationRoleResponse {
  /// The authentication token's validity, in seconds.
  final int? expiresIn;

  /// The authentication token for the impersonation role.
  final String? token;

  AssumeImpersonationRoleResponse({
    this.expiresIn,
    this.token,
  });

  factory AssumeImpersonationRoleResponse.fromJson(Map<String, dynamic> json) {
    return AssumeImpersonationRoleResponse(
      expiresIn: json['ExpiresIn'] as int?,
      token: json['Token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiresIn = this.expiresIn;
    final token = this.token;
    return {
      if (expiresIn != null) 'ExpiresIn': expiresIn,
      if (token != null) 'Token': token,
    };
  }
}

/// List all the <code>AvailabilityConfiguration</code>'s for the given WorkMail
/// organization.
class AvailabilityConfiguration {
  /// The date and time at which the availability configuration was created.
  final DateTime? dateCreated;

  /// The date and time at which the availability configuration was last modified.
  final DateTime? dateModified;

  /// Displays the domain to which the provider applies.
  final String? domainName;

  /// If <code>ProviderType</code> is <code>EWS</code>, then this field contains
  /// <code>RedactedEwsAvailabilityProvider</code>. Otherwise, it is not required.
  final RedactedEwsAvailabilityProvider? ewsProvider;

  /// If ProviderType is <code>LAMBDA</code> then this field contains
  /// <code>LambdaAvailabilityProvider</code>. Otherwise, it is not required.
  final LambdaAvailabilityProvider? lambdaProvider;

  /// Displays the provider type that applies to this domain.
  final AvailabilityProviderType? providerType;

  AvailabilityConfiguration({
    this.dateCreated,
    this.dateModified,
    this.domainName,
    this.ewsProvider,
    this.lambdaProvider,
    this.providerType,
  });

  factory AvailabilityConfiguration.fromJson(Map<String, dynamic> json) {
    return AvailabilityConfiguration(
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      domainName: json['DomainName'] as String?,
      ewsProvider: json['EwsProvider'] != null
          ? RedactedEwsAvailabilityProvider.fromJson(
              json['EwsProvider'] as Map<String, dynamic>)
          : null,
      lambdaProvider: json['LambdaProvider'] != null
          ? LambdaAvailabilityProvider.fromJson(
              json['LambdaProvider'] as Map<String, dynamic>)
          : null,
      providerType:
          (json['ProviderType'] as String?)?.toAvailabilityProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final domainName = this.domainName;
    final ewsProvider = this.ewsProvider;
    final lambdaProvider = this.lambdaProvider;
    final providerType = this.providerType;
    return {
      if (dateCreated != null) 'DateCreated': unixTimestampToJson(dateCreated),
      if (dateModified != null)
        'DateModified': unixTimestampToJson(dateModified),
      if (domainName != null) 'DomainName': domainName,
      if (ewsProvider != null) 'EwsProvider': ewsProvider,
      if (lambdaProvider != null) 'LambdaProvider': lambdaProvider,
      if (providerType != null) 'ProviderType': providerType.toValue(),
    };
  }
}

enum AvailabilityProviderType {
  ews,
  lambda,
}

extension AvailabilityProviderTypeValueExtension on AvailabilityProviderType {
  String toValue() {
    switch (this) {
      case AvailabilityProviderType.ews:
        return 'EWS';
      case AvailabilityProviderType.lambda:
        return 'LAMBDA';
    }
  }
}

extension AvailabilityProviderTypeFromString on String {
  AvailabilityProviderType toAvailabilityProviderType() {
    switch (this) {
      case 'EWS':
        return AvailabilityProviderType.ews;
      case 'LAMBDA':
        return AvailabilityProviderType.lambda;
    }
    throw Exception('$this is not known in enum AvailabilityProviderType');
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

class CreateAvailabilityConfigurationResponse {
  CreateAvailabilityConfigurationResponse();

  factory CreateAvailabilityConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateAvailabilityConfigurationResponse();
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

class CreateImpersonationRoleResponse {
  /// The new impersonation role ID.
  final String? impersonationRoleId;

  CreateImpersonationRoleResponse({
    this.impersonationRoleId,
  });

  factory CreateImpersonationRoleResponse.fromJson(Map<String, dynamic> json) {
    return CreateImpersonationRoleResponse(
      impersonationRoleId: json['ImpersonationRoleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final impersonationRoleId = this.impersonationRoleId;
    return {
      if (impersonationRoleId != null)
        'ImpersonationRoleId': impersonationRoleId,
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

class DeleteAvailabilityConfigurationResponse {
  DeleteAvailabilityConfigurationResponse();

  factory DeleteAvailabilityConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAvailabilityConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEmailMonitoringConfigurationResponse {
  DeleteEmailMonitoringConfigurationResponse();

  factory DeleteEmailMonitoringConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteEmailMonitoringConfigurationResponse();
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

class DeleteImpersonationRoleResponse {
  DeleteImpersonationRoleResponse();

  factory DeleteImpersonationRoleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteImpersonationRoleResponse();
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

class DeleteMobileDeviceAccessOverrideResponse {
  DeleteMobileDeviceAccessOverrideResponse();

  factory DeleteMobileDeviceAccessOverrideResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteMobileDeviceAccessOverrideResponse();
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

class DeregisterMailDomainResponse {
  DeregisterMailDomainResponse();

  factory DeregisterMailDomainResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterMailDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeEmailMonitoringConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the CloudWatch Log group associated with
  /// the email monitoring configuration.
  final String? logGroupArn;

  /// The Amazon Resource Name (ARN) of the IAM Role associated with the email
  /// monitoring configuration.
  final String? roleArn;

  DescribeEmailMonitoringConfigurationResponse({
    this.logGroupArn,
    this.roleArn,
  });

  factory DescribeEmailMonitoringConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEmailMonitoringConfigurationResponse(
      logGroupArn: json['LogGroupArn'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupArn = this.logGroupArn;
    final roleArn = this.roleArn;
    return {
      if (logGroupArn != null) 'LogGroupArn': logGroupArn,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

class DescribeEntityResponse {
  /// The entity ID under which the entity exists.
  final String? entityId;

  /// Username, GroupName, or ResourceName based on entity type.
  final String? name;

  /// Entity type.
  final EntityType? type;

  DescribeEntityResponse({
    this.entityId,
    this.name,
    this.type,
  });

  factory DescribeEntityResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEntityResponse(
      entityId: json['EntityId'] as String?,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.toEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final name = this.name;
    final type = this.type;
    return {
      if (entityId != null) 'EntityId': entityId,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
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

  /// If the value is set to <i>true</i>, the group is hidden from the address
  /// book.
  final bool? hiddenFromGlobalAddressList;

  /// The name of the described group.
  final String? name;

  /// The state of the user: enabled (registered to WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  final EntityState? state;

  DescribeGroupResponse({
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.groupId,
    this.hiddenFromGlobalAddressList,
    this.name,
    this.state,
  });

  factory DescribeGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGroupResponse(
      disabledDate: timeStampFromJson(json['DisabledDate']),
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      groupId: json['GroupId'] as String?,
      hiddenFromGlobalAddressList: json['HiddenFromGlobalAddressList'] as bool?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabledDate = this.disabledDate;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final groupId = this.groupId;
    final hiddenFromGlobalAddressList = this.hiddenFromGlobalAddressList;
    final name = this.name;
    final state = this.state;
    return {
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (groupId != null) 'GroupId': groupId,
      if (hiddenFromGlobalAddressList != null)
        'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DescribeInboundDmarcSettingsResponse {
  /// Lists the enforcement setting of the applied policy.
  final bool? enforced;

  DescribeInboundDmarcSettingsResponse({
    this.enforced,
  });

  factory DescribeInboundDmarcSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInboundDmarcSettingsResponse(
      enforced: json['Enforced'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enforced = this.enforced;
    return {
      if (enforced != null) 'Enforced': enforced,
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

  /// The identifier for the directory associated with an WorkMail organization.
  final String? directoryId;

  /// The type of directory associated with the WorkMail organization.
  final String? directoryType;

  /// (Optional) The error message indicating if unexpected behavior was
  /// encountered with regards to the organization.
  final String? errorMessage;

  /// Indicates if interoperability is enabled for this organization.
  final bool? interoperabilityEnabled;

  /// The user ID of the migration admin if migration is enabled for the
  /// organization.
  final String? migrationAdmin;

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
    this.interoperabilityEnabled,
    this.migrationAdmin,
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
      interoperabilityEnabled: json['InteroperabilityEnabled'] as bool?,
      migrationAdmin: json['MigrationAdmin'] as String?,
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
    final interoperabilityEnabled = this.interoperabilityEnabled;
    final migrationAdmin = this.migrationAdmin;
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
      if (interoperabilityEnabled != null)
        'InteroperabilityEnabled': interoperabilityEnabled,
      if (migrationAdmin != null) 'MigrationAdmin': migrationAdmin,
      if (organizationId != null) 'OrganizationId': organizationId,
      if (state != null) 'State': state,
    };
  }
}

class DescribeResourceResponse {
  /// The booking options for the described resource.
  final BookingOptions? bookingOptions;

  /// Description of the resource.
  final String? description;

  /// The date and time when a resource was disabled from WorkMail, in UNIX epoch
  /// time format.
  final DateTime? disabledDate;

  /// The email of the described resource.
  final String? email;

  /// The date and time when a resource was enabled for WorkMail, in UNIX epoch
  /// time format.
  final DateTime? enabledDate;

  /// If enabled, the resource is hidden from the global address list.
  final bool? hiddenFromGlobalAddressList;

  /// The name of the described resource.
  final String? name;

  /// The identifier of the described resource.
  final String? resourceId;

  /// The state of the resource: enabled (registered to WorkMail), disabled
  /// (deregistered or never registered to WorkMail), or deleted.
  final EntityState? state;

  /// The type of the described resource.
  final ResourceType? type;

  DescribeResourceResponse({
    this.bookingOptions,
    this.description,
    this.disabledDate,
    this.email,
    this.enabledDate,
    this.hiddenFromGlobalAddressList,
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
      description: json['Description'] as String?,
      disabledDate: timeStampFromJson(json['DisabledDate']),
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      hiddenFromGlobalAddressList: json['HiddenFromGlobalAddressList'] as bool?,
      name: json['Name'] as String?,
      resourceId: json['ResourceId'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
      type: (json['Type'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final bookingOptions = this.bookingOptions;
    final description = this.description;
    final disabledDate = this.disabledDate;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final hiddenFromGlobalAddressList = this.hiddenFromGlobalAddressList;
    final name = this.name;
    final resourceId = this.resourceId;
    final state = this.state;
    final type = this.type;
    return {
      if (bookingOptions != null) 'BookingOptions': bookingOptions,
      if (description != null) 'Description': description,
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (hiddenFromGlobalAddressList != null)
        'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
      if (name != null) 'Name': name,
      if (resourceId != null) 'ResourceId': resourceId,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class DescribeUserResponse {
  /// City where the user is located.
  final String? city;

  /// Company of the user.
  final String? company;

  /// Country where the user is located.
  final String? country;

  /// Department of the user.
  final String? department;

  /// The date and time at which the user was disabled for WorkMail usage, in UNIX
  /// epoch time format.
  final DateTime? disabledDate;

  /// The display name of the user.
  final String? displayName;

  /// The email of the user.
  final String? email;

  /// The date and time at which the user was enabled for WorkMailusage, in UNIX
  /// epoch time format.
  final DateTime? enabledDate;

  /// First name of the user.
  final String? firstName;

  /// If enabled, the user is hidden from the global address list.
  final bool? hiddenFromGlobalAddressList;

  /// Initials of the user.
  final String? initials;

  /// Job title of the user.
  final String? jobTitle;

  /// Last name of the user.
  final String? lastName;

  /// The date when the mailbox was removed for the user.
  final DateTime? mailboxDeprovisionedDate;

  /// The date when the mailbox was created for the user.
  final DateTime? mailboxProvisionedDate;

  /// The name for the user.
  final String? name;

  /// Office where the user is located.
  final String? office;

  /// The state of a user: enabled (registered to WorkMail) or disabled
  /// (deregistered or never registered to WorkMail).
  final EntityState? state;

  /// Street where the user is located.
  final String? street;

  /// User's contact number.
  final String? telephone;

  /// The identifier for the described user.
  final String? userId;

  /// In certain cases, other entities are modeled as users. If interoperability
  /// is enabled, resources are imported into WorkMail as users. Because different
  /// WorkMail organizations rely on different directory types, administrators can
  /// distinguish between an unregistered user (account is disabled and has a user
  /// role) and the directory administrators. The values are USER, RESOURCE,
  /// SYSTEM_USER, and REMOTE_USER.
  final UserRole? userRole;

  /// Zip code of the user.
  final String? zipCode;

  DescribeUserResponse({
    this.city,
    this.company,
    this.country,
    this.department,
    this.disabledDate,
    this.displayName,
    this.email,
    this.enabledDate,
    this.firstName,
    this.hiddenFromGlobalAddressList,
    this.initials,
    this.jobTitle,
    this.lastName,
    this.mailboxDeprovisionedDate,
    this.mailboxProvisionedDate,
    this.name,
    this.office,
    this.state,
    this.street,
    this.telephone,
    this.userId,
    this.userRole,
    this.zipCode,
  });

  factory DescribeUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeUserResponse(
      city: json['City'] as String?,
      company: json['Company'] as String?,
      country: json['Country'] as String?,
      department: json['Department'] as String?,
      disabledDate: timeStampFromJson(json['DisabledDate']),
      displayName: json['DisplayName'] as String?,
      email: json['Email'] as String?,
      enabledDate: timeStampFromJson(json['EnabledDate']),
      firstName: json['FirstName'] as String?,
      hiddenFromGlobalAddressList: json['HiddenFromGlobalAddressList'] as bool?,
      initials: json['Initials'] as String?,
      jobTitle: json['JobTitle'] as String?,
      lastName: json['LastName'] as String?,
      mailboxDeprovisionedDate:
          timeStampFromJson(json['MailboxDeprovisionedDate']),
      mailboxProvisionedDate: timeStampFromJson(json['MailboxProvisionedDate']),
      name: json['Name'] as String?,
      office: json['Office'] as String?,
      state: (json['State'] as String?)?.toEntityState(),
      street: json['Street'] as String?,
      telephone: json['Telephone'] as String?,
      userId: json['UserId'] as String?,
      userRole: (json['UserRole'] as String?)?.toUserRole(),
      zipCode: json['ZipCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final company = this.company;
    final country = this.country;
    final department = this.department;
    final disabledDate = this.disabledDate;
    final displayName = this.displayName;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final firstName = this.firstName;
    final hiddenFromGlobalAddressList = this.hiddenFromGlobalAddressList;
    final initials = this.initials;
    final jobTitle = this.jobTitle;
    final lastName = this.lastName;
    final mailboxDeprovisionedDate = this.mailboxDeprovisionedDate;
    final mailboxProvisionedDate = this.mailboxProvisionedDate;
    final name = this.name;
    final office = this.office;
    final state = this.state;
    final street = this.street;
    final telephone = this.telephone;
    final userId = this.userId;
    final userRole = this.userRole;
    final zipCode = this.zipCode;
    return {
      if (city != null) 'City': city,
      if (company != null) 'Company': company,
      if (country != null) 'Country': country,
      if (department != null) 'Department': department,
      if (disabledDate != null)
        'DisabledDate': unixTimestampToJson(disabledDate),
      if (displayName != null) 'DisplayName': displayName,
      if (email != null) 'Email': email,
      if (enabledDate != null) 'EnabledDate': unixTimestampToJson(enabledDate),
      if (firstName != null) 'FirstName': firstName,
      if (hiddenFromGlobalAddressList != null)
        'HiddenFromGlobalAddressList': hiddenFromGlobalAddressList,
      if (initials != null) 'Initials': initials,
      if (jobTitle != null) 'JobTitle': jobTitle,
      if (lastName != null) 'LastName': lastName,
      if (mailboxDeprovisionedDate != null)
        'MailboxDeprovisionedDate':
            unixTimestampToJson(mailboxDeprovisionedDate),
      if (mailboxProvisionedDate != null)
        'MailboxProvisionedDate': unixTimestampToJson(mailboxProvisionedDate),
      if (name != null) 'Name': name,
      if (office != null) 'Office': office,
      if (state != null) 'State': state.toValue(),
      if (street != null) 'Street': street,
      if (telephone != null) 'Telephone': telephone,
      if (userId != null) 'UserId': userId,
      if (userRole != null) 'UserRole': userRole.toValue(),
      if (zipCode != null) 'ZipCode': zipCode,
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

/// A DNS record uploaded to your DNS provider.
class DnsRecord {
  /// The DNS hostname.- For example, <code>domain.example.com</code>.
  final String? hostname;

  /// The RFC 1035 record type. Possible values: <code>CNAME</code>,
  /// <code>A</code>, <code>MX</code>.
  final String? type;

  /// The value returned by the DNS for a query to that hostname and record type.
  final String? value;

  DnsRecord({
    this.hostname,
    this.type,
    this.value,
  });

  factory DnsRecord.fromJson(Map<String, dynamic> json) {
    return DnsRecord(
      hostname: json['Hostname'] as String?,
      type: json['Type'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final type = this.type;
    final value = this.value;
    return {
      if (hostname != null) 'Hostname': hostname,
      if (type != null) 'Type': type,
      if (value != null) 'Value': value,
    };
  }
}

enum DnsRecordVerificationStatus {
  pending,
  verified,
  failed,
}

extension DnsRecordVerificationStatusValueExtension
    on DnsRecordVerificationStatus {
  String toValue() {
    switch (this) {
      case DnsRecordVerificationStatus.pending:
        return 'PENDING';
      case DnsRecordVerificationStatus.verified:
        return 'VERIFIED';
      case DnsRecordVerificationStatus.failed:
        return 'FAILED';
    }
  }
}

extension DnsRecordVerificationStatusFromString on String {
  DnsRecordVerificationStatus toDnsRecordVerificationStatus() {
    switch (this) {
      case 'PENDING':
        return DnsRecordVerificationStatus.pending;
      case 'VERIFIED':
        return DnsRecordVerificationStatus.verified;
      case 'FAILED':
        return DnsRecordVerificationStatus.failed;
    }
    throw Exception('$this is not known in enum DnsRecordVerificationStatus');
  }
}

/// The domain to associate with an WorkMail organization.
///
/// When you configure a domain hosted in Amazon Route 53 (Route 53), all
/// recommended DNS records are added to the organization when you create it.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html">Adding
/// a domain</a> in the <i>WorkMail Administrator Guide</i>.
class Domain {
  /// The fully qualified domain name.
  final String domainName;

  /// The hosted zone ID for a domain hosted in Route 53. Required when
  /// configuring a domain hosted in Route 53.
  final String? hostedZoneId;

  Domain({
    required this.domainName,
    this.hostedZoneId,
  });

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final hostedZoneId = this.hostedZoneId;
    return {
      'DomainName': domainName,
      if (hostedZoneId != null) 'HostedZoneId': hostedZoneId,
    };
  }
}

enum EntityState {
  enabled,
  disabled,
  deleted,
}

extension EntityStateValueExtension on EntityState {
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

extension EntityStateFromString on String {
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

enum EntityType {
  group,
  user,
  resource,
}

extension EntityTypeValueExtension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.group:
        return 'GROUP';
      case EntityType.user:
        return 'USER';
      case EntityType.resource:
        return 'RESOURCE';
    }
  }
}

extension EntityTypeFromString on String {
  EntityType toEntityType() {
    switch (this) {
      case 'GROUP':
        return EntityType.group;
      case 'USER':
        return EntityType.user;
      case 'RESOURCE':
        return EntityType.resource;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

/// Describes an EWS based availability provider. This is only used as input to
/// the service.
class EwsAvailabilityProvider {
  /// The endpoint of the remote EWS server.
  final String ewsEndpoint;

  /// The password used to authenticate the remote EWS server.
  final String ewsPassword;

  /// The username used to authenticate the remote EWS server.
  final String ewsUsername;

  EwsAvailabilityProvider({
    required this.ewsEndpoint,
    required this.ewsPassword,
    required this.ewsUsername,
  });

  Map<String, dynamic> toJson() {
    final ewsEndpoint = this.ewsEndpoint;
    final ewsPassword = this.ewsPassword;
    final ewsUsername = this.ewsUsername;
    return {
      'EwsEndpoint': ewsEndpoint,
      'EwsPassword': ewsPassword,
      'EwsUsername': ewsUsername,
    };
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

  /// The number of days for which the folder-configuration action applies.
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

extension FolderNameValueExtension on FolderName {
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

extension FolderNameFromString on String {
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

class GetImpersonationRoleEffectResponse {
  /// <code/>Effect of the impersonation role on the target user based on its
  /// rules. Available effects are <code>ALLOW</code> or <code>DENY</code>.
  final AccessEffect? effect;

  /// A list of the rules that match the input and produce the configured effect.
  final List<ImpersonationMatchedRule>? matchedRules;

  /// The impersonation role type.
  final ImpersonationRoleType? type;

  GetImpersonationRoleEffectResponse({
    this.effect,
    this.matchedRules,
    this.type,
  });

  factory GetImpersonationRoleEffectResponse.fromJson(
      Map<String, dynamic> json) {
    return GetImpersonationRoleEffectResponse(
      effect: (json['Effect'] as String?)?.toAccessEffect(),
      matchedRules: (json['MatchedRules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ImpersonationMatchedRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toImpersonationRoleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final matchedRules = this.matchedRules;
    final type = this.type;
    return {
      if (effect != null) 'Effect': effect.toValue(),
      if (matchedRules != null) 'MatchedRules': matchedRules,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class GetImpersonationRoleResponse {
  /// The date when the impersonation role was created.
  final DateTime? dateCreated;

  /// The date when the impersonation role was last modified.
  final DateTime? dateModified;

  /// The impersonation role description.
  final String? description;

  /// The impersonation role ID.
  final String? impersonationRoleId;

  /// The impersonation role name.
  final String? name;

  /// The list of rules for the given impersonation role.
  final List<ImpersonationRule>? rules;

  /// The impersonation role type.
  final ImpersonationRoleType? type;

  GetImpersonationRoleResponse({
    this.dateCreated,
    this.dateModified,
    this.description,
    this.impersonationRoleId,
    this.name,
    this.rules,
    this.type,
  });

  factory GetImpersonationRoleResponse.fromJson(Map<String, dynamic> json) {
    return GetImpersonationRoleResponse(
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      description: json['Description'] as String?,
      impersonationRoleId: json['ImpersonationRoleId'] as String?,
      name: json['Name'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => ImpersonationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toImpersonationRoleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final description = this.description;
    final impersonationRoleId = this.impersonationRoleId;
    final name = this.name;
    final rules = this.rules;
    final type = this.type;
    return {
      if (dateCreated != null) 'DateCreated': unixTimestampToJson(dateCreated),
      if (dateModified != null)
        'DateModified': unixTimestampToJson(dateModified),
      if (description != null) 'Description': description,
      if (impersonationRoleId != null)
        'ImpersonationRoleId': impersonationRoleId,
      if (name != null) 'Name': name,
      if (rules != null) 'Rules': rules,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class GetMailDomainResponse {
  /// Indicates the status of a DKIM verification.
  final DnsRecordVerificationStatus? dkimVerificationStatus;

  /// Specifies whether the domain is the default domain for your organization.
  final bool? isDefault;

  /// Specifies whether the domain is a test domain provided by WorkMail, or a
  /// custom domain.
  final bool? isTestDomain;

  /// Indicates the status of the domain ownership verification.
  final DnsRecordVerificationStatus? ownershipVerificationStatus;

  /// A list of the DNS records that WorkMail recommends adding in your DNS
  /// provider for the best user experience. The records configure your domain
  /// with DMARC, SPF, DKIM, and direct incoming email traffic to SES. See admin
  /// guide for more details.
  final List<DnsRecord>? records;

  GetMailDomainResponse({
    this.dkimVerificationStatus,
    this.isDefault,
    this.isTestDomain,
    this.ownershipVerificationStatus,
    this.records,
  });

  factory GetMailDomainResponse.fromJson(Map<String, dynamic> json) {
    return GetMailDomainResponse(
      dkimVerificationStatus: (json['DkimVerificationStatus'] as String?)
          ?.toDnsRecordVerificationStatus(),
      isDefault: json['IsDefault'] as bool?,
      isTestDomain: json['IsTestDomain'] as bool?,
      ownershipVerificationStatus:
          (json['OwnershipVerificationStatus'] as String?)
              ?.toDnsRecordVerificationStatus(),
      records: (json['Records'] as List?)
          ?.whereNotNull()
          .map((e) => DnsRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dkimVerificationStatus = this.dkimVerificationStatus;
    final isDefault = this.isDefault;
    final isTestDomain = this.isTestDomain;
    final ownershipVerificationStatus = this.ownershipVerificationStatus;
    final records = this.records;
    return {
      if (dkimVerificationStatus != null)
        'DkimVerificationStatus': dkimVerificationStatus.toValue(),
      if (isDefault != null) 'IsDefault': isDefault,
      if (isTestDomain != null) 'IsTestDomain': isTestDomain,
      if (ownershipVerificationStatus != null)
        'OwnershipVerificationStatus': ownershipVerificationStatus.toValue(),
      if (records != null) 'Records': records,
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
  /// after evaluating mobile device access rules in the WorkMail organization for
  /// the simulated user parameters.
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

class GetMobileDeviceAccessOverrideResponse {
  /// The date the override was first created.
  final DateTime? dateCreated;

  /// The date the description was last modified.
  final DateTime? dateModified;

  /// A description of the override.
  final String? description;

  /// The device to which the access override applies.
  final String? deviceId;

  /// The effect of the override, <code>ALLOW</code> or <code>DENY</code>.
  final MobileDeviceAccessRuleEffect? effect;

  /// The WorkMail user to which the access override applies.
  final String? userId;

  GetMobileDeviceAccessOverrideResponse({
    this.dateCreated,
    this.dateModified,
    this.description,
    this.deviceId,
    this.effect,
    this.userId,
  });

  factory GetMobileDeviceAccessOverrideResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMobileDeviceAccessOverrideResponse(
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      description: json['Description'] as String?,
      deviceId: json['DeviceId'] as String?,
      effect: (json['Effect'] as String?)?.toMobileDeviceAccessRuleEffect(),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final description = this.description;
    final deviceId = this.deviceId;
    final effect = this.effect;
    final userId = this.userId;
    return {
      if (dateCreated != null) 'DateCreated': unixTimestampToJson(dateCreated),
      if (dateModified != null)
        'DateModified': unixTimestampToJson(dateModified),
      if (description != null) 'Description': description,
      if (deviceId != null) 'DeviceId': deviceId,
      if (effect != null) 'Effect': effect.toValue(),
      if (userId != null) 'UserId': userId,
    };
  }
}

/// The representation of an WorkMail group.
class Group {
  /// The date indicating when the group was disabled from WorkMail use.
  final DateTime? disabledDate;

  /// The email of the group.
  final String? email;

  /// The date indicating when the group was enabled for WorkMail use.
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

/// The identifier that contains the Group ID and name of a group.
class GroupIdentifier {
  /// Group ID that matched the group.
  final String? groupId;

  /// Group name that matched the group.
  final String? groupName;

  GroupIdentifier({
    this.groupId,
    this.groupName,
  });

  factory GroupIdentifier.fromJson(Map<String, dynamic> json) {
    return GroupIdentifier(
      groupId: json['GroupId'] as String?,
      groupName: json['GroupName'] as String?,
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

/// The impersonation rule that matched the input.
class ImpersonationMatchedRule {
  /// The ID of the rule that matched the input
  final String? impersonationRuleId;

  /// The name of the rule that matched the input.
  final String? name;

  ImpersonationMatchedRule({
    this.impersonationRuleId,
    this.name,
  });

  factory ImpersonationMatchedRule.fromJson(Map<String, dynamic> json) {
    return ImpersonationMatchedRule(
      impersonationRuleId: json['ImpersonationRuleId'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final impersonationRuleId = this.impersonationRuleId;
    final name = this.name;
    return {
      if (impersonationRuleId != null)
        'ImpersonationRuleId': impersonationRuleId,
      if (name != null) 'Name': name,
    };
  }
}

/// An impersonation role for the given WorkMail organization.
class ImpersonationRole {
  /// The date when the impersonation role was created.
  final DateTime? dateCreated;

  /// The date when the impersonation role was last modified.
  final DateTime? dateModified;

  /// The identifier of the impersonation role.
  final String? impersonationRoleId;

  /// The impersonation role name.
  final String? name;

  /// The impersonation role type.
  final ImpersonationRoleType? type;

  ImpersonationRole({
    this.dateCreated,
    this.dateModified,
    this.impersonationRoleId,
    this.name,
    this.type,
  });

  factory ImpersonationRole.fromJson(Map<String, dynamic> json) {
    return ImpersonationRole(
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      impersonationRoleId: json['ImpersonationRoleId'] as String?,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.toImpersonationRoleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final impersonationRoleId = this.impersonationRoleId;
    final name = this.name;
    final type = this.type;
    return {
      if (dateCreated != null) 'DateCreated': unixTimestampToJson(dateCreated),
      if (dateModified != null)
        'DateModified': unixTimestampToJson(dateModified),
      if (impersonationRoleId != null)
        'ImpersonationRoleId': impersonationRoleId,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ImpersonationRoleType {
  fullAccess,
  readOnly,
}

extension ImpersonationRoleTypeValueExtension on ImpersonationRoleType {
  String toValue() {
    switch (this) {
      case ImpersonationRoleType.fullAccess:
        return 'FULL_ACCESS';
      case ImpersonationRoleType.readOnly:
        return 'READ_ONLY';
    }
  }
}

extension ImpersonationRoleTypeFromString on String {
  ImpersonationRoleType toImpersonationRoleType() {
    switch (this) {
      case 'FULL_ACCESS':
        return ImpersonationRoleType.fullAccess;
      case 'READ_ONLY':
        return ImpersonationRoleType.readOnly;
    }
    throw Exception('$this is not known in enum ImpersonationRoleType');
  }
}

/// The rules for the given impersonation role.
class ImpersonationRule {
  /// The effect of the rule when it matches the input. Allowed effect values are
  /// <code>ALLOW</code> or <code>DENY</code>.
  final AccessEffect effect;

  /// The identifier of the rule.
  final String impersonationRuleId;

  /// The rule description.
  final String? description;

  /// The rule name.
  final String? name;

  /// A list of user IDs that don't match the rule.
  final List<String>? notTargetUsers;

  /// A list of user IDs that match the rule.
  final List<String>? targetUsers;

  ImpersonationRule({
    required this.effect,
    required this.impersonationRuleId,
    this.description,
    this.name,
    this.notTargetUsers,
    this.targetUsers,
  });

  factory ImpersonationRule.fromJson(Map<String, dynamic> json) {
    return ImpersonationRule(
      effect: (json['Effect'] as String).toAccessEffect(),
      impersonationRuleId: json['ImpersonationRuleId'] as String,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      notTargetUsers: (json['NotTargetUsers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      targetUsers: (json['TargetUsers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final impersonationRuleId = this.impersonationRuleId;
    final description = this.description;
    final name = this.name;
    final notTargetUsers = this.notTargetUsers;
    final targetUsers = this.targetUsers;
    return {
      'Effect': effect.toValue(),
      'ImpersonationRuleId': impersonationRuleId,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (notTargetUsers != null) 'NotTargetUsers': notTargetUsers,
      if (targetUsers != null) 'TargetUsers': targetUsers,
    };
  }
}

/// Describes a Lambda based availability provider.
class LambdaAvailabilityProvider {
  /// The Amazon Resource Name (ARN) of the Lambda that acts as the availability
  /// provider.
  final String lambdaArn;

  LambdaAvailabilityProvider({
    required this.lambdaArn,
  });

  factory LambdaAvailabilityProvider.fromJson(Map<String, dynamic> json) {
    return LambdaAvailabilityProvider(
      lambdaArn: json['LambdaArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      'LambdaArn': lambdaArn,
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

class ListAvailabilityConfigurationsResponse {
  /// The list of <code>AvailabilityConfiguration</code>'s that exist for the
  /// specified WorkMail organization.
  final List<AvailabilityConfiguration>? availabilityConfigurations;

  /// The token to use to retrieve the next page of results. The value is
  /// <code>null</code> when there are no further results to return.
  final String? nextToken;

  ListAvailabilityConfigurationsResponse({
    this.availabilityConfigurations,
    this.nextToken,
  });

  factory ListAvailabilityConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailabilityConfigurationsResponse(
      availabilityConfigurations: (json['AvailabilityConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AvailabilityConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityConfigurations = this.availabilityConfigurations;
    final nextToken = this.nextToken;
    return {
      if (availabilityConfigurations != null)
        'AvailabilityConfigurations': availabilityConfigurations,
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

/// Filtering options for <i>ListGroups</i> operation. This is only used as
/// input to Operation.
class ListGroupsFilters {
  /// Filters only groups with the provided name prefix.
  final String? namePrefix;

  /// Filters only groups with the provided primary email prefix.
  final String? primaryEmailPrefix;

  /// Filters only groups with the provided state.
  final EntityState? state;

  ListGroupsFilters({
    this.namePrefix,
    this.primaryEmailPrefix,
    this.state,
  });

  Map<String, dynamic> toJson() {
    final namePrefix = this.namePrefix;
    final primaryEmailPrefix = this.primaryEmailPrefix;
    final state = this.state;
    return {
      if (namePrefix != null) 'NamePrefix': namePrefix,
      if (primaryEmailPrefix != null) 'PrimaryEmailPrefix': primaryEmailPrefix,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// Filtering options for <i>ListGroupsForEntity</i> operation. This is only
/// used as input to Operation.
class ListGroupsForEntityFilters {
  /// Filters only group names that start with the provided name prefix.
  final String? groupNamePrefix;

  ListGroupsForEntityFilters({
    this.groupNamePrefix,
  });

  Map<String, dynamic> toJson() {
    final groupNamePrefix = this.groupNamePrefix;
    return {
      if (groupNamePrefix != null) 'GroupNamePrefix': groupNamePrefix,
    };
  }
}

class ListGroupsForEntityResponse {
  /// The overview of groups in an organization.
  final List<GroupIdentifier>? groups;

  /// The token to use to retrieve the next page of results. This value is `null`
  /// when there are no more results to return.
  final String? nextToken;

  ListGroupsForEntityResponse({
    this.groups,
    this.nextToken,
  });

  factory ListGroupsForEntityResponse.fromJson(Map<String, dynamic> json) {
    return ListGroupsForEntityResponse(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => GroupIdentifier.fromJson(e as Map<String, dynamic>))
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

class ListImpersonationRolesResponse {
  /// The token to retrieve the next page of results. The value is
  /// <code>null</code> when there are no results to return.
  final String? nextToken;

  /// The list of impersonation roles under the given WorkMail organization.
  final List<ImpersonationRole>? roles;

  ListImpersonationRolesResponse({
    this.nextToken,
    this.roles,
  });

  factory ListImpersonationRolesResponse.fromJson(Map<String, dynamic> json) {
    return ListImpersonationRolesResponse(
      nextToken: json['NextToken'] as String?,
      roles: (json['Roles'] as List?)
          ?.whereNotNull()
          .map((e) => ImpersonationRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final roles = this.roles;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (roles != null) 'Roles': roles,
    };
  }
}

class ListMailDomainsResponse {
  /// The list of mail domain summaries, specifying domains that exist in the
  /// specified WorkMail organization, along with the information about whether
  /// the domain is or isn't the default.
  final List<MailDomainSummary>? mailDomains;

  /// The token to use to retrieve the next page of results. The value becomes
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListMailDomainsResponse({
    this.mailDomains,
    this.nextToken,
  });

  factory ListMailDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListMailDomainsResponse(
      mailDomains: (json['MailDomains'] as List?)
          ?.whereNotNull()
          .map((e) => MailDomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mailDomains = this.mailDomains;
    final nextToken = this.nextToken;
    return {
      if (mailDomains != null) 'MailDomains': mailDomains,
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

class ListMobileDeviceAccessOverridesResponse {
  /// The token to use to retrieve the next page of results. The value is “null”
  /// when there are no more results to return.
  final String? nextToken;

  /// The list of mobile device access overrides that exist for the specified
  /// WorkMail organization and user.
  final List<MobileDeviceAccessOverride>? overrides;

  ListMobileDeviceAccessOverridesResponse({
    this.nextToken,
    this.overrides,
  });

  factory ListMobileDeviceAccessOverridesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMobileDeviceAccessOverridesResponse(
      nextToken: json['NextToken'] as String?,
      overrides: (json['Overrides'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MobileDeviceAccessOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final overrides = this.overrides;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (overrides != null) 'Overrides': overrides,
    };
  }
}

class ListMobileDeviceAccessRulesResponse {
  /// The list of mobile device access rules that exist under the specified
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

/// Filtering options for <i>ListResources</i> operation. This is only used as
/// input to Operation.
class ListResourcesFilters {
  /// Filters only resource that start with the entered name prefix .
  final String? namePrefix;

  /// Filters only resource with the provided primary email prefix.
  final String? primaryEmailPrefix;

  /// Filters only resource with the provided state.
  final EntityState? state;

  ListResourcesFilters({
    this.namePrefix,
    this.primaryEmailPrefix,
    this.state,
  });

  Map<String, dynamic> toJson() {
    final namePrefix = this.namePrefix;
    final primaryEmailPrefix = this.primaryEmailPrefix;
    final state = this.state;
    return {
      if (namePrefix != null) 'NamePrefix': namePrefix,
      if (primaryEmailPrefix != null) 'PrimaryEmailPrefix': primaryEmailPrefix,
      if (state != null) 'State': state.toValue(),
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

/// Filtering options for <i>ListUsers</i> operation. This is only used as input
/// to Operation.
class ListUsersFilters {
  /// Filters only users with the provided display name prefix.
  final String? displayNamePrefix;

  /// Filters only users with the provided email prefix.
  final String? primaryEmailPrefix;

  /// Filters only users with the provided state.
  final EntityState? state;

  /// Filters only users with the provided username prefix.
  final String? usernamePrefix;

  ListUsersFilters({
    this.displayNamePrefix,
    this.primaryEmailPrefix,
    this.state,
    this.usernamePrefix,
  });

  Map<String, dynamic> toJson() {
    final displayNamePrefix = this.displayNamePrefix;
    final primaryEmailPrefix = this.primaryEmailPrefix;
    final state = this.state;
    final usernamePrefix = this.usernamePrefix;
    return {
      if (displayNamePrefix != null) 'DisplayNamePrefix': displayNamePrefix,
      if (primaryEmailPrefix != null) 'PrimaryEmailPrefix': primaryEmailPrefix,
      if (state != null) 'State': state.toValue(),
      if (usernamePrefix != null) 'UsernamePrefix': usernamePrefix,
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

/// The data for a given domain.
class MailDomainSummary {
  /// Whether the domain is default or not.
  final bool? defaultDomain;

  /// The domain name.
  final String? domainName;

  MailDomainSummary({
    this.defaultDomain,
    this.domainName,
  });

  factory MailDomainSummary.fromJson(Map<String, dynamic> json) {
    return MailDomainSummary(
      defaultDomain: json['DefaultDomain'] as bool?,
      domainName: json['DomainName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultDomain = this.defaultDomain;
    final domainName = this.domainName;
    return {
      if (defaultDomain != null) 'DefaultDomain': defaultDomain,
      if (domainName != null) 'DomainName': domainName,
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

extension MailboxExportJobStateValueExtension on MailboxExportJobState {
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

extension MailboxExportJobStateFromString on String {
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
  /// The date indicating when the member was disabled from WorkMail use.
  final DateTime? disabledDate;

  /// The date indicating when the member was enabled for WorkMail use.
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

extension MemberTypeValueExtension on MemberType {
  String toValue() {
    switch (this) {
      case MemberType.group:
        return 'GROUP';
      case MemberType.user:
        return 'USER';
    }
  }
}

extension MemberTypeFromString on String {
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

/// The override object.
class MobileDeviceAccessOverride {
  /// The date the override was first created.
  final DateTime? dateCreated;

  /// The date the override was last modified.
  final DateTime? dateModified;

  /// A description of the override.
  final String? description;

  /// The device to which the override applies.
  final String? deviceId;

  /// The effect of the override, <code>ALLOW</code> or <code>DENY</code>.
  final MobileDeviceAccessRuleEffect? effect;

  /// The WorkMail user to which the access override applies.
  final String? userId;

  MobileDeviceAccessOverride({
    this.dateCreated,
    this.dateModified,
    this.description,
    this.deviceId,
    this.effect,
    this.userId,
  });

  factory MobileDeviceAccessOverride.fromJson(Map<String, dynamic> json) {
    return MobileDeviceAccessOverride(
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      description: json['Description'] as String?,
      deviceId: json['DeviceId'] as String?,
      effect: (json['Effect'] as String?)?.toMobileDeviceAccessRuleEffect(),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final description = this.description;
    final deviceId = this.deviceId;
    final effect = this.effect;
    final userId = this.userId;
    return {
      if (dateCreated != null) 'DateCreated': unixTimestampToJson(dateCreated),
      if (dateModified != null)
        'DateModified': unixTimestampToJson(dateModified),
      if (description != null) 'Description': description,
      if (deviceId != null) 'DeviceId': deviceId,
      if (effect != null) 'Effect': effect.toValue(),
      if (userId != null) 'UserId': userId,
    };
  }
}

/// A rule that controls access to mobile devices for an WorkMail group.
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

extension MobileDeviceAccessRuleEffectValueExtension
    on MobileDeviceAccessRuleEffect {
  String toValue() {
    switch (this) {
      case MobileDeviceAccessRuleEffect.allow:
        return 'ALLOW';
      case MobileDeviceAccessRuleEffect.deny:
        return 'DENY';
    }
  }
}

extension MobileDeviceAccessRuleEffectFromString on String {
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

extension PermissionTypeValueExtension on PermissionType {
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

extension PermissionTypeFromString on String {
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

class PutEmailMonitoringConfigurationResponse {
  PutEmailMonitoringConfigurationResponse();

  factory PutEmailMonitoringConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutEmailMonitoringConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutInboundDmarcSettingsResponse {
  PutInboundDmarcSettingsResponse();

  factory PutInboundDmarcSettingsResponse.fromJson(Map<String, dynamic> _) {
    return PutInboundDmarcSettingsResponse();
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

class PutMobileDeviceAccessOverrideResponse {
  PutMobileDeviceAccessOverrideResponse();

  factory PutMobileDeviceAccessOverrideResponse.fromJson(
      Map<String, dynamic> _) {
    return PutMobileDeviceAccessOverrideResponse();
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

/// Describes an EWS based availability provider when returned from the service.
/// It does not contain the password of the endpoint.
class RedactedEwsAvailabilityProvider {
  /// The endpoint of the remote EWS server.
  final String? ewsEndpoint;

  /// The username used to authenticate the remote EWS server.
  final String? ewsUsername;

  RedactedEwsAvailabilityProvider({
    this.ewsEndpoint,
    this.ewsUsername,
  });

  factory RedactedEwsAvailabilityProvider.fromJson(Map<String, dynamic> json) {
    return RedactedEwsAvailabilityProvider(
      ewsEndpoint: json['EwsEndpoint'] as String?,
      ewsUsername: json['EwsUsername'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ewsEndpoint = this.ewsEndpoint;
    final ewsUsername = this.ewsUsername;
    return {
      if (ewsEndpoint != null) 'EwsEndpoint': ewsEndpoint,
      if (ewsUsername != null) 'EwsUsername': ewsUsername,
    };
  }
}

class RegisterMailDomainResponse {
  RegisterMailDomainResponse();

  factory RegisterMailDomainResponse.fromJson(Map<String, dynamic> _) {
    return RegisterMailDomainResponse();
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
  /// Resource description.
  final String? description;

  /// The date indicating when the resource was disabled from WorkMail use.
  final DateTime? disabledDate;

  /// The email of the resource.
  final String? email;

  /// The date indicating when the resource was enabled for WorkMail use.
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
    this.description,
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
      description: json['Description'] as String?,
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
    final description = this.description;
    final disabledDate = this.disabledDate;
    final email = this.email;
    final enabledDate = this.enabledDate;
    final id = this.id;
    final name = this.name;
    final state = this.state;
    final type = this.type;
    return {
      if (description != null) 'Description': description,
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

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.room:
        return 'ROOM';
      case ResourceType.equipment:
        return 'EQUIPMENT';
    }
  }
}

extension ResourceTypeFromString on String {
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

extension RetentionActionValueExtension on RetentionAction {
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

extension RetentionActionFromString on String {
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

class TestAvailabilityConfigurationResponse {
  /// String containing the reason for a failed test if <code>TestPassed</code> is
  /// false.
  final String? failureReason;

  /// Boolean indicating whether the test passed or failed.
  final bool? testPassed;

  TestAvailabilityConfigurationResponse({
    this.failureReason,
    this.testPassed,
  });

  factory TestAvailabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return TestAvailabilityConfigurationResponse(
      failureReason: json['FailureReason'] as String?,
      testPassed: json['TestPassed'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final testPassed = this.testPassed;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (testPassed != null) 'TestPassed': testPassed,
    };
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

class UpdateAvailabilityConfigurationResponse {
  UpdateAvailabilityConfigurationResponse();

  factory UpdateAvailabilityConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateAvailabilityConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDefaultMailDomainResponse {
  UpdateDefaultMailDomainResponse();

  factory UpdateDefaultMailDomainResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDefaultMailDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateGroupResponse {
  UpdateGroupResponse();

  factory UpdateGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateImpersonationRoleResponse {
  UpdateImpersonationRoleResponse();

  factory UpdateImpersonationRoleResponse.fromJson(Map<String, dynamic> _) {
    return UpdateImpersonationRoleResponse();
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

class UpdateUserResponse {
  UpdateUserResponse();

  factory UpdateUserResponse.fromJson(Map<String, dynamic> _) {
    return UpdateUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The representation of an WorkMail user.
class User {
  /// The date indicating when the user was disabled from WorkMail use.
  final DateTime? disabledDate;

  /// The display name of the user.
  final String? displayName;

  /// The email of the user.
  final String? email;

  /// The date indicating when the user was enabled for WorkMail use.
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
  remoteUser,
}

extension UserRoleValueExtension on UserRole {
  String toValue() {
    switch (this) {
      case UserRole.user:
        return 'USER';
      case UserRole.resource:
        return 'RESOURCE';
      case UserRole.systemUser:
        return 'SYSTEM_USER';
      case UserRole.remoteUser:
        return 'REMOTE_USER';
    }
  }
}

extension UserRoleFromString on String {
  UserRole toUserRole() {
    switch (this) {
      case 'USER':
        return UserRole.user;
      case 'RESOURCE':
        return UserRole.resource;
      case 'SYSTEM_USER':
        return UserRole.systemUser;
      case 'REMOTE_USER':
        return UserRole.remoteUser;
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

class InvalidCustomSesConfigurationException extends _s.GenericAwsException {
  InvalidCustomSesConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCustomSesConfigurationException',
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

class MailDomainInUseException extends _s.GenericAwsException {
  MailDomainInUseException({String? type, String? message})
      : super(type: type, code: 'MailDomainInUseException', message: message);
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
  'InvalidCustomSesConfigurationException': (type, message) =>
      InvalidCustomSesConfigurationException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidPasswordException': (type, message) =>
      InvalidPasswordException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MailDomainInUseException': (type, message) =>
      MailDomainInUseException(type: type, message: message),
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
