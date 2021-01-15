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

part '2016-11-28.g.dart';

class Organizations {
  final _s.JsonProtocol _protocol;
  Organizations({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'organizations',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Sends a response to the originator of a handshake agreeing to the action
  /// proposed by the handshake request.
  ///
  /// This operation can be called only by the following principals when they
  /// also have the relevant IAM permissions:
  ///
  /// <ul>
  /// <li>
  /// <b>Invitation to join</b> or <b>Approve all features request</b>
  /// handshakes: only a principal from the member account.
  ///
  /// The user who calls the API for an invitation to join must have the
  /// <code>organizations:AcceptHandshake</code> permission. If you enabled all
  /// features in the organization, the user must also have the
  /// <code>iam:CreateServiceLinkedRole</code> permission so that AWS
  /// Organizations can create the required service-linked role named
  /// <code>AWSServiceRoleForOrganizations</code>. For more information, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integration_services.html#orgs_integration_service-linked-roles">AWS
  /// Organizations and Service-Linked Roles</a> in the <i>AWS Organizations
  /// User Guide</i>.
  /// </li>
  /// <li>
  /// <b>Enable all features final confirmation</b> handshake: only a principal
  /// from the management account.
  ///
  /// For more information about invitations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_invites.html">Inviting
  /// an AWS Account to Join Your Organization</a> in the <i>AWS Organizations
  /// User Guide.</i> For more information about requests to enable all features
  /// in the organization, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling
  /// All Features in Your Organization</a> in the <i>AWS Organizations User
  /// Guide.</i>
  /// </li>
  /// </ul>
  /// After you accept a handshake, it continues to appear in the results of
  /// relevant APIs for only 30 days. After that, it's deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [HandshakeConstraintViolationException].
  /// May throw [HandshakeNotFoundException].
  /// May throw [InvalidHandshakeTransitionException].
  /// May throw [HandshakeAlreadyInStateException].
  /// May throw [InvalidInputException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [AccessDeniedForDependencyException].
  ///
  /// Parameter [handshakeId] :
  /// The unique identifier (ID) of the handshake that you want to accept.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for
  /// handshake ID string requires "h-" followed by from 8 to 32 lowercase
  /// letters or digits.
  Future<AcceptHandshakeResponse> acceptHandshake({
    @_s.required String handshakeId,
  }) async {
    ArgumentError.checkNotNull(handshakeId, 'handshakeId');
    _s.validateStringLength(
      'handshakeId',
      handshakeId,
      0,
      34,
      isRequired: true,
    );
    _s.validateStringPattern(
      'handshakeId',
      handshakeId,
      r'''^h-[0-9a-z]{8,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.AcceptHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HandshakeId': handshakeId,
      },
    );

    return AcceptHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Attaches a policy to a root, an organizational unit (OU), or an individual
  /// account. How the policy affects accounts depends on the type of policy.
  /// Refer to the <i>AWS Organizations User Guide</i> for information about
  /// each policy type:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">AISERVICES_OPT_OUT_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a>
  /// </li>
  /// </ul>
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [DuplicatePolicyAttachmentException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotFoundException].
  /// May throw [PolicyTypeNotEnabledException].
  /// May throw [ServiceException].
  /// May throw [TargetNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  /// May throw [PolicyChangesInProgressException].
  ///
  /// Parameter [policyId] :
  /// The unique identifier (ID) of the policy that you want to attach to the
  /// target. You can get the ID for the policy by calling the
  /// <a>ListPolicies</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// policy ID string requires "p-" followed by from 8 to 128 lowercase or
  /// uppercase letters, digits, or the underscore character (_).
  ///
  /// Parameter [targetId] :
  /// The unique identifier (ID) of the root, OU, or account that you want to
  /// attach the policy to. You can get the ID by calling the <a>ListRoots</a>,
  /// <a>ListOrganizationalUnitsForParent</a>, or <a>ListAccounts</a>
  /// operations.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// target ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Account</b> - A string that consists of exactly 12 digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  Future<void> attachPolicy({
    @_s.required String policyId,
    @_s.required String targetId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^p-[0-9a-zA-Z_]{8,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetId, 'targetId');
    _s.validateStringLength(
      'targetId',
      targetId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetId',
      targetId,
      r'''^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.AttachPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
        'TargetId': targetId,
      },
    );
  }

  /// Cancels a handshake. Canceling a handshake sets the handshake state to
  /// <code>CANCELED</code>.
  ///
  /// This operation can be called only from the account that originated the
  /// handshake. The recipient of the handshake can't cancel it, but can use
  /// <a>DeclineHandshake</a> instead. After a handshake is canceled, the
  /// recipient can no longer respond to that handshake.
  ///
  /// After you cancel a handshake, it continues to appear in the results of
  /// relevant APIs for only 30 days. After that, it's deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [HandshakeNotFoundException].
  /// May throw [InvalidHandshakeTransitionException].
  /// May throw [HandshakeAlreadyInStateException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [handshakeId] :
  /// The unique identifier (ID) of the handshake that you want to cancel. You
  /// can get the ID from the <a>ListHandshakesForOrganization</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for
  /// handshake ID string requires "h-" followed by from 8 to 32 lowercase
  /// letters or digits.
  Future<CancelHandshakeResponse> cancelHandshake({
    @_s.required String handshakeId,
  }) async {
    ArgumentError.checkNotNull(handshakeId, 'handshakeId');
    _s.validateStringLength(
      'handshakeId',
      handshakeId,
      0,
      34,
      isRequired: true,
    );
    _s.validateStringPattern(
      'handshakeId',
      handshakeId,
      r'''^h-[0-9a-z]{8,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.CancelHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HandshakeId': handshakeId,
      },
    );

    return CancelHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Creates an AWS account that is automatically a member of the organization
  /// whose credentials made the request. This is an asynchronous request that
  /// AWS performs in the background. Because <code>CreateAccount</code>
  /// operates asynchronously, it can return a successful completion message
  /// even though account initialization might still be in progress. You might
  /// need to wait a few minutes before you can successfully access the account.
  /// To check the status of the request, do one of the following:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>Id</code> member of the <code>CreateAccountStatus</code>
  /// response element from this operation to provide as a parameter to the
  /// <a>DescribeCreateAccountStatus</a> operation.
  /// </li>
  /// <li>
  /// Check the AWS CloudTrail log for the <code>CreateAccountResult</code>
  /// event. For information on using AWS CloudTrail with AWS Organizations, see
  /// <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring
  /// the Activity in Your Organization</a> in the <i>AWS Organizations User
  /// Guide.</i>
  /// </li>
  /// </ul>
  /// The user who calls the API to create an account must have the
  /// <code>organizations:CreateAccount</code> permission. If you enabled all
  /// features in the organization, AWS Organizations creates the required
  /// service-linked role named <code>AWSServiceRoleForOrganizations</code>. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs">AWS
  /// Organizations and Service-Linked Roles</a> in the <i>AWS Organizations
  /// User Guide</i>.
  ///
  /// If the request includes tags, then the requester must have the
  /// <code>organizations:TagResource</code> permission.
  ///
  /// AWS Organizations preconfigures the new member account with a role (named
  /// <code>OrganizationAccountAccessRole</code> by default) that grants users
  /// in the management account administrator permissions in the new member
  /// account. Principals in the management account can assume the role. AWS
  /// Organizations clones the company name and address information for the new
  /// account from the organization's management account.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// For more information about creating accounts, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html">Creating
  /// an AWS Account in Your Organization</a> in the <i>AWS Organizations User
  /// Guide.</i>
  /// <important>
  /// <ul>
  /// <li>
  /// When you create an account in an organization using the AWS Organizations
  /// console, API, or CLI commands, the information required for the account to
  /// operate as a standalone account, such as a payment method and signing the
  /// end user license agreement (EULA) is <i>not</i> automatically collected.
  /// If you must remove an account from your organization later, you can do so
  /// only after you provide the missing information. Follow the steps at <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info">
  /// To leave an organization as a member account</a> in the <i>AWS
  /// Organizations User Guide</i>.
  /// </li>
  /// <li>
  /// If you get an exception that indicates that you exceeded your account
  /// limits for the organization, contact <a
  /// href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.
  /// </li>
  /// <li>
  /// If you get an exception that indicates that the operation failed because
  /// your organization is still initializing, wait one hour and then try again.
  /// If the error persists, contact <a
  /// href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.
  /// </li>
  /// <li>
  /// Using <code>CreateAccount</code> to create multiple temporary accounts
  /// isn't recommended. You can only close an account from the Billing and Cost
  /// Management Console, and you must be signed in as the root user. For
  /// information on the requirements and process for closing an account, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html">Closing
  /// an AWS Account</a> in the <i>AWS Organizations User Guide</i>.
  /// </li>
  /// </ul> </important> <note>
  /// When you create a member account with this operation, you can choose
  /// whether to create the account with the <b>IAM User and Role Access to
  /// Billing Information</b> switch enabled. If you enable it, IAM users and
  /// roles that have appropriate permissions can view billing information for
  /// the account. If you disable it, only the account root user can access
  /// billing information. For information about how to disable this switch for
  /// an account, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html">Granting
  /// Access to Your Billing Information and Tools</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [FinalizingOrganizationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [accountName] :
  /// The friendly name of the member account.
  ///
  /// Parameter [email] :
  /// The email address of the owner to assign to the new member account. This
  /// email address must not already be associated with another AWS account. You
  /// must use a valid email address to complete account creation. You can't
  /// access the root user of the account or remove an account that was created
  /// with an invalid email address.
  ///
  /// Parameter [iamUserAccessToBilling] :
  /// If set to <code>ALLOW</code>, the new account enables IAM users to access
  /// account billing information <i>if</i> they have the required permissions.
  /// If set to <code>DENY</code>, only the root user of the new account can
  /// access account billing information. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate">Activating
  /// Access to the Billing and Cost Management Console</a> in the <i>AWS
  /// Billing and Cost Management User Guide</i>.
  ///
  /// If you don't specify this parameter, the value defaults to
  /// <code>ALLOW</code>, and IAM users and roles with the required permissions
  /// can access billing information for the new account.
  ///
  /// Parameter [roleName] :
  /// (Optional)
  ///
  /// The name of an IAM role that AWS Organizations automatically preconfigures
  /// in the new member account. This role trusts the management account,
  /// allowing users in the management account to assume the role, as permitted
  /// by the management account administrator. The role has administrator
  /// permissions in the new member account.
  ///
  /// If you don't specify this parameter, the role name defaults to
  /// <code>OrganizationAccountAccessRole</code>.
  ///
  /// For more information about how to use this role to access the member
  /// account, see the following links:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role">Accessing
  /// and Administering the Member Accounts in Your Organization</a> in the
  /// <i>AWS Organizations User Guide</i>
  /// </li>
  /// <li>
  /// Steps 2 and 3 in <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html">Tutorial:
  /// Delegate Access Across AWS Accounts Using IAM Roles</a> in the <i>IAM User
  /// Guide</i>
  /// </li>
  /// </ul>
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter. The pattern can include uppercase
  /// letters, lowercase letters, digits with no spaces, and any of the
  /// following characters: =,.@-
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the newly created account. For
  /// each tag in the list, you must specify both a tag key and a value. You can
  /// set the value to an empty string, but you can't set it to
  /// <code>null</code>. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html">Tagging
  /// AWS Organizations resources</a> in the AWS Organizations User Guide.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags for an account, then the entire request fails and the account is not
  /// created.
  /// </note>
  Future<CreateAccountResponse> createAccount({
    @_s.required String accountName,
    @_s.required String email,
    IAMUserAccessToBilling iamUserAccessToBilling,
    String roleName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(accountName, 'accountName');
    _s.validateStringLength(
      'accountName',
      accountName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountName',
      accountName,
      r'''[\u0020-\u007E]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(email, 'email');
    _s.validateStringLength(
      'email',
      email,
      6,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'email',
      email,
      r'''[^\s@]+@[^\s@]+\.[^\s@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'roleName',
      roleName,
      0,
      64,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]{1,64}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.CreateAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountName': accountName,
        'Email': email,
        if (iamUserAccessToBilling != null)
          'IamUserAccessToBilling': iamUserAccessToBilling.toValue(),
        if (roleName != null) 'RoleName': roleName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAccountResponse.fromJson(jsonResponse.body);
  }

  /// This action is available if all of the following are true:
  ///
  /// <ul>
  /// <li>
  /// You're authorized to create accounts in the AWS GovCloud (US) Region. For
  /// more information on the AWS GovCloud (US) Region, see the <a
  /// href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/welcome.html">
  /// <i>AWS GovCloud User Guide</i>.</a>
  /// </li>
  /// <li>
  /// You already have an account in the AWS GovCloud (US) Region that is paired
  /// with a management account of an organization in the commercial Region.
  /// </li>
  /// <li>
  /// You call this action from the management account of your organization in
  /// the commercial Region.
  /// </li>
  /// <li>
  /// You have the <code>organizations:CreateGovCloudAccount</code> permission.
  /// </li>
  /// </ul>
  /// AWS Organizations automatically creates the required service-linked role
  /// named <code>AWSServiceRoleForOrganizations</code>. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs">AWS
  /// Organizations and Service-Linked Roles</a> in the <i>AWS Organizations
  /// User Guide.</i>
  ///
  /// AWS automatically enables AWS CloudTrail for AWS GovCloud (US) accounts,
  /// but you should also do the following:
  ///
  /// <ul>
  /// <li>
  /// Verify that AWS CloudTrail is enabled to store logs.
  /// </li>
  /// <li>
  /// Create an S3 bucket for AWS CloudTrail log storage.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/verifying-cloudtrail.html">Verifying
  /// AWS CloudTrail Is Enabled</a> in the <i>AWS GovCloud User Guide</i>.
  /// </li>
  /// </ul>
  /// If the request includes tags, then the requester must have the
  /// <code>organizations:TagResource</code> permission. The tags are attached
  /// to the commercial account associated with the GovCloud account, rather
  /// than the GovCloud account itself. To add tags to the GovCloud account,
  /// call the <a>TagResource</a> operation in the GovCloud Region after the new
  /// GovCloud account exists.
  ///
  /// You call this action from the management account of your organization in
  /// the commercial Region to create a standalone AWS account in the AWS
  /// GovCloud (US) Region. After the account is created, the management account
  /// of an organization in the AWS GovCloud (US) Region can invite it to that
  /// organization. For more information on inviting standalone accounts in the
  /// AWS GovCloud (US) to join an organization, see <a
  /// href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html">AWS
  /// Organizations</a> in the <i>AWS GovCloud User Guide.</i>
  ///
  /// Calling <code>CreateGovCloudAccount</code> is an asynchronous request that
  /// AWS performs in the background. Because <code>CreateGovCloudAccount</code>
  /// operates asynchronously, it can return a successful completion message
  /// even though account initialization might still be in progress. You might
  /// need to wait a few minutes before you can successfully access the account.
  /// To check the status of the request, do one of the following:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>OperationId</code> response element from this operation to
  /// provide as a parameter to the <a>DescribeCreateAccountStatus</a>
  /// operation.
  /// </li>
  /// <li>
  /// Check the AWS CloudTrail log for the <code>CreateAccountResult</code>
  /// event. For information on using AWS CloudTrail with Organizations, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring
  /// the Activity in Your Organization</a> in the <i>AWS Organizations User
  /// Guide.</i>
  /// </li>
  /// </ul> <p/>
  /// When you call the <code>CreateGovCloudAccount</code> action, you create
  /// two accounts: a standalone account in the AWS GovCloud (US) Region and an
  /// associated account in the commercial Region for billing and support
  /// purposes. The account in the commercial Region is automatically a member
  /// of the organization whose credentials made the request. Both accounts are
  /// associated with the same email address.
  ///
  /// A role is created in the new account in the commercial Region that allows
  /// the management account in the organization in the commercial Region to
  /// assume it. An AWS GovCloud (US) account is then created and associated
  /// with the commercial account that you just created. A role is also created
  /// in the new AWS GovCloud (US) account that can be assumed by the AWS
  /// GovCloud (US) account that is associated with the management account of
  /// the commercial organization. For more information and to view a diagram
  /// that explains how account access works, see <a
  /// href="http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html">AWS
  /// Organizations</a> in the <i>AWS GovCloud User Guide.</i>
  ///
  /// For more information about creating accounts, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html">Creating
  /// an AWS Account in Your Organization</a> in the <i>AWS Organizations User
  /// Guide.</i>
  /// <important>
  /// <ul>
  /// <li>
  /// When you create an account in an organization using the AWS Organizations
  /// console, API, or CLI commands, the information required for the account to
  /// operate as a standalone account is <i>not</i> automatically collected.
  /// This includes a payment method and signing the end user license agreement
  /// (EULA). If you must remove an account from your organization later, you
  /// can do so only after you provide the missing information. Follow the steps
  /// at <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info">
  /// To leave an organization as a member account</a> in the <i>AWS
  /// Organizations User Guide.</i>
  /// </li>
  /// <li>
  /// If you get an exception that indicates that you exceeded your account
  /// limits for the organization, contact <a
  /// href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.
  /// </li>
  /// <li>
  /// If you get an exception that indicates that the operation failed because
  /// your organization is still initializing, wait one hour and then try again.
  /// If the error persists, contact <a
  /// href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.
  /// </li>
  /// <li>
  /// Using <code>CreateGovCloudAccount</code> to create multiple temporary
  /// accounts isn't recommended. You can only close an account from the AWS
  /// Billing and Cost Management console, and you must be signed in as the root
  /// user. For information on the requirements and process for closing an
  /// account, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html">Closing
  /// an AWS Account</a> in the <i>AWS Organizations User Guide</i>.
  /// </li>
  /// </ul> </important> <note>
  /// When you create a member account with this operation, you can choose
  /// whether to create the account with the <b>IAM User and Role Access to
  /// Billing Information</b> switch enabled. If you enable it, IAM users and
  /// roles that have appropriate permissions can view billing information for
  /// the account. If you disable it, only the account root user can access
  /// billing information. For information about how to disable this switch for
  /// an account, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html">Granting
  /// Access to Your Billing Information and Tools</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [FinalizingOrganizationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [accountName] :
  /// The friendly name of the member account.
  ///
  /// Parameter [email] :
  /// The email address of the owner to assign to the new member account in the
  /// commercial Region. This email address must not already be associated with
  /// another AWS account. You must use a valid email address to complete
  /// account creation. You can't access the root user of the account or remove
  /// an account that was created with an invalid email address. Like all
  /// request parameters for <code>CreateGovCloudAccount</code>, the request for
  /// the email address for the AWS GovCloud (US) account originates from the
  /// commercial Region, not from the AWS GovCloud (US) Region.
  ///
  /// Parameter [iamUserAccessToBilling] :
  /// If set to <code>ALLOW</code>, the new linked account in the commercial
  /// Region enables IAM users to access account billing information <i>if</i>
  /// they have the required permissions. If set to <code>DENY</code>, only the
  /// root user of the new account can access account billing information. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate">Activating
  /// Access to the Billing and Cost Management Console</a> in the <i>AWS
  /// Billing and Cost Management User Guide.</i>
  ///
  /// If you don't specify this parameter, the value defaults to
  /// <code>ALLOW</code>, and IAM users and roles with the required permissions
  /// can access billing information for the new account.
  ///
  /// Parameter [roleName] :
  /// (Optional)
  ///
  /// The name of an IAM role that AWS Organizations automatically preconfigures
  /// in the new member accounts in both the AWS GovCloud (US) Region and in the
  /// commercial Region. This role trusts the management account, allowing users
  /// in the management account to assume the role, as permitted by the
  /// management account administrator. The role has administrator permissions
  /// in the new member account.
  ///
  /// If you don't specify this parameter, the role name defaults to
  /// <code>OrganizationAccountAccessRole</code>.
  ///
  /// For more information about how to use this role to access the member
  /// account, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role">Accessing
  /// and Administering the Member Accounts in Your Organization</a> in the
  /// <i>AWS Organizations User Guide</i> and steps 2 and 3 in <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html">Tutorial:
  /// Delegate Access Across AWS Accounts Using IAM Roles</a> in the <i>IAM User
  /// Guide.</i>
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter. The pattern can include uppercase
  /// letters, lowercase letters, digits with no spaces, and any of the
  /// following characters: =,.@-
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the newly created account. These
  /// tags are attached to the commercial account associated with the GovCloud
  /// account, and not to the GovCloud account itself. To add tags to the actual
  /// GovCloud account, call the <a>TagResource</a> operation in the GovCloud
  /// region after the new GovCloud account exists.
  ///
  /// For each tag in the list, you must specify both a tag key and a value. You
  /// can set the value to an empty string, but you can't set it to
  /// <code>null</code>. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html">Tagging
  /// AWS Organizations resources</a> in the AWS Organizations User Guide.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags for an account, then the entire request fails and the account is not
  /// created.
  /// </note>
  Future<CreateGovCloudAccountResponse> createGovCloudAccount({
    @_s.required String accountName,
    @_s.required String email,
    IAMUserAccessToBilling iamUserAccessToBilling,
    String roleName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(accountName, 'accountName');
    _s.validateStringLength(
      'accountName',
      accountName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountName',
      accountName,
      r'''[\u0020-\u007E]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(email, 'email');
    _s.validateStringLength(
      'email',
      email,
      6,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'email',
      email,
      r'''[^\s@]+@[^\s@]+\.[^\s@]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'roleName',
      roleName,
      0,
      64,
    );
    _s.validateStringPattern(
      'roleName',
      roleName,
      r'''[\w+=,.@-]{1,64}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.CreateGovCloudAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountName': accountName,
        'Email': email,
        if (iamUserAccessToBilling != null)
          'IamUserAccessToBilling': iamUserAccessToBilling.toValue(),
        if (roleName != null) 'RoleName': roleName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateGovCloudAccountResponse.fromJson(jsonResponse.body);
  }

  /// Creates an AWS organization. The account whose user is calling the
  /// <code>CreateOrganization</code> operation automatically becomes the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">management
  /// account</a> of the new organization.
  ///
  /// This operation must be called using credentials from the account that is
  /// to become the new organization's management account. The principal must
  /// also have the relevant IAM permissions.
  ///
  /// By default (or if you set the <code>FeatureSet</code> parameter to
  /// <code>ALL</code>), the new organization is created with all features
  /// enabled and service control policies automatically enabled in the root. If
  /// you instead choose to create the organization supporting only the
  /// consolidated billing features by setting the <code>FeatureSet</code>
  /// parameter to <code>CONSOLIDATED_BILLING"</code>, no policy types are
  /// enabled by default, and you can't use organization policies
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AlreadyInOrganizationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [AccessDeniedForDependencyException].
  ///
  /// Parameter [featureSet] :
  /// Specifies the feature set supported by the new organization. Each feature
  /// set supports different levels of functionality.
  ///
  /// <ul>
  /// <li>
  /// <code>CONSOLIDATED_BILLING</code>: All member accounts have their bills
  /// consolidated to and paid by the management account. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-cb-only">Consolidated
  /// billing</a> in the <i>AWS Organizations User Guide.</i>
  ///
  /// The consolidated billing feature subset isn't available for organizations
  /// in the AWS GovCloud (US) Region.
  /// </li>
  /// <li>
  /// <code>ALL</code>: In addition to all the features supported by the
  /// consolidated billing feature set, the management account can also apply
  /// any policy type to any member account in the organization. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-all">All
  /// features</a> in the <i>AWS Organizations User Guide.</i>
  /// </li>
  /// </ul>
  Future<CreateOrganizationResponse> createOrganization({
    OrganizationFeatureSet featureSet,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.CreateOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (featureSet != null) 'FeatureSet': featureSet.toValue(),
      },
    );

    return CreateOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Creates an organizational unit (OU) within a root or parent OU. An OU is a
  /// container for accounts that enables you to organize your accounts to apply
  /// policies according to your business requirements. The number of levels
  /// deep that you can nest OUs is dependent upon the policy types enabled for
  /// that root. For service control policies, the limit is five.
  ///
  /// For more information about OUs, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html">Managing
  /// Organizational Units</a> in the <i>AWS Organizations User Guide.</i>
  ///
  /// If the request includes tags, then the requester must have the
  /// <code>organizations:TagResource</code> permission.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [DuplicateOrganizationalUnitException].
  /// May throw [InvalidInputException].
  /// May throw [ParentNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The friendly name to assign to the new OU.
  ///
  /// Parameter [parentId] :
  /// The unique identifier (ID) of the parent root or OU that you want to
  /// create the new OU in.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// parent ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the newly created OU. For each
  /// tag in the list, you must specify both a tag key and a value. You can set
  /// the value to an empty string, but you can't set it to <code>null</code>.
  /// For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html">Tagging
  /// AWS Organizations resources</a> in the AWS Organizations User Guide.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags for an OU, then the entire request fails and the OU is not created.
  /// </note>
  Future<CreateOrganizationalUnitResponse> createOrganizationalUnit({
    @_s.required String name,
    @_s.required String parentId,
    List<Tag> tags,
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
      r'''[\s\S]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parentId, 'parentId');
    _s.validateStringLength(
      'parentId',
      parentId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'parentId',
      parentId,
      r'''^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.CreateOrganizationalUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'ParentId': parentId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateOrganizationalUnitResponse.fromJson(jsonResponse.body);
  }

  /// Creates a policy of a specified type that you can attach to a root, an
  /// organizational unit (OU), or an individual AWS account.
  ///
  /// For more information about policies and their use, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html">Managing
  /// Organization Policies</a>.
  ///
  /// If the request includes tags, then the requester must have the
  /// <code>organizations:TagResource</code> permission.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [DuplicatePolicyException].
  /// May throw [InvalidInputException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [PolicyTypeNotAvailableForOrganizationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [content] :
  /// The policy text content to add to the new policy. The text that you supply
  /// must adhere to the rules of the policy type you specify in the
  /// <code>Type</code> parameter.
  ///
  /// Parameter [description] :
  /// An optional description to assign to the policy.
  ///
  /// Parameter [name] :
  /// The friendly name to assign to the policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter is a string of any of the characters in
  /// the ASCII character range.
  ///
  /// Parameter [type] :
  /// The type of policy to create. You can specify one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">AISERVICES_OPT_OUT_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the newly created policy. For
  /// each tag in the list, you must specify both a tag key and a value. You can
  /// set the value to an empty string, but you can't set it to
  /// <code>null</code>. For more information about tagging, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html">Tagging
  /// AWS Organizations resources</a> in the AWS Organizations User Guide.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags for a policy, then the entire request fails and the policy is not
  /// created.
  /// </note>
  Future<CreatePolicyResponse> createPolicy({
    @_s.required String content,
    @_s.required String description,
    @_s.required String name,
    @_s.required PolicyType type,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    _s.validateStringLength(
      'content',
      content,
      1,
      1000000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'content',
      content,
      r'''[\s\S]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
      isRequired: true,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\s\S]*''',
      isRequired: true,
    );
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
      r'''[\s\S]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.CreatePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Content': content,
        'Description': description,
        'Name': name,
        'Type': type?.toValue() ?? '',
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Declines a handshake request. This sets the handshake state to
  /// <code>DECLINED</code> and effectively deactivates the request.
  ///
  /// This operation can be called only from the account that received the
  /// handshake. The originator of the handshake can use <a>CancelHandshake</a>
  /// instead. The originator can't reactivate a declined request, but can
  /// reinitiate the process with a new handshake request.
  ///
  /// After you decline a handshake, it continues to appear in the results of
  /// relevant APIs for only 30 days. After that, it's deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [HandshakeNotFoundException].
  /// May throw [InvalidHandshakeTransitionException].
  /// May throw [HandshakeAlreadyInStateException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [handshakeId] :
  /// The unique identifier (ID) of the handshake that you want to decline. You
  /// can get the ID from the <a>ListHandshakesForAccount</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for
  /// handshake ID string requires "h-" followed by from 8 to 32 lowercase
  /// letters or digits.
  Future<DeclineHandshakeResponse> declineHandshake({
    @_s.required String handshakeId,
  }) async {
    ArgumentError.checkNotNull(handshakeId, 'handshakeId');
    _s.validateStringLength(
      'handshakeId',
      handshakeId,
      0,
      34,
      isRequired: true,
    );
    _s.validateStringPattern(
      'handshakeId',
      handshakeId,
      r'''^h-[0-9a-z]{8,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DeclineHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HandshakeId': handshakeId,
      },
    );

    return DeclineHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the organization. You can delete an organization only by using
  /// credentials from the management account. The organization must be empty of
  /// member accounts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidInputException].
  /// May throw [OrganizationNotEmptyException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<void> deleteOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DeleteOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Deletes an organizational unit (OU) from a root or another OU. You must
  /// first remove all accounts and child OUs from the OU that you want to
  /// delete.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidInputException].
  /// May throw [OrganizationalUnitNotEmptyException].
  /// May throw [OrganizationalUnitNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [organizationalUnitId] :
  /// The unique identifier (ID) of the organizational unit that you want to
  /// delete. You can get the ID from the
  /// <a>ListOrganizationalUnitsForParent</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// organizational unit ID string requires "ou-" followed by from 4 to 32
  /// lowercase letters or digits (the ID of the root that contains the OU).
  /// This string is followed by a second "-" dash and from 8 to 32 additional
  /// lowercase letters or digits.
  Future<void> deleteOrganizationalUnit({
    @_s.required String organizationalUnitId,
  }) async {
    ArgumentError.checkNotNull(organizationalUnitId, 'organizationalUnitId');
    _s.validateStringLength(
      'organizationalUnitId',
      organizationalUnitId,
      0,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationalUnitId',
      organizationalUnitId,
      r'''^ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DeleteOrganizationalUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationalUnitId': organizationalUnitId,
      },
    );
  }

  /// Deletes the specified policy from your organization. Before you perform
  /// this operation, you must first detach the policy from all organizational
  /// units (OUs), roots, and accounts.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyInUseException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [policyId] :
  /// The unique identifier (ID) of the policy that you want to delete. You can
  /// get the ID from the <a>ListPolicies</a> or <a>ListPoliciesForTarget</a>
  /// operations.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// policy ID string requires "p-" followed by from 8 to 128 lowercase or
  /// uppercase letters, digits, or the underscore character (_).
  Future<void> deletePolicy({
    @_s.required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^p-[0-9a-zA-Z_]{8,128}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DeletePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
      },
    );
  }

  /// Removes the specified member AWS account as a delegated administrator for
  /// the specified AWS service.
  /// <important>
  /// Deregistering a delegated administrator can have unintended impacts on the
  /// functionality of the enabled AWS service. See the documentation for the
  /// enabled service before you deregister a delegated administrator so that
  /// you understand any potential impacts.
  /// </important>
  /// You can run this action only for AWS services that support this feature.
  /// For a current list of services that support it, see the column <i>Supports
  /// Delegated Administrator</i> in the table at <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrated-services-list.html">AWS
  /// Services that you can use with AWS Organizations</a> in the <i>AWS
  /// Organizations User Guide.</i>
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  /// May throw [AccountNotRegisteredException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [accountId] :
  /// The account ID number of the member account in the organization that you
  /// want to deregister as a delegated administrator.
  ///
  /// Parameter [servicePrincipal] :
  /// The service principal name of an AWS service for which the account is a
  /// delegated administrator.
  ///
  /// Delegated administrator privileges are revoked for only the specified AWS
  /// service from the member account. If the specified service is the only
  /// service for which the member account is a delegated administrator, the
  /// operation also revokes Organizations read action permissions.
  Future<void> deregisterDelegatedAdministrator({
    @_s.required String accountId,
    @_s.required String servicePrincipal,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(servicePrincipal, 'servicePrincipal');
    _s.validateStringLength(
      'servicePrincipal',
      servicePrincipal,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'servicePrincipal',
      servicePrincipal,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSOrganizationsV20161128.DeregisterDelegatedAdministrator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ServicePrincipal': servicePrincipal,
      },
    );
  }

  /// Retrieves AWS Organizations-related information about the specified
  /// account.
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [accountId] :
  /// The unique identifier (ID) of the AWS account that you want information
  /// about. You can get the ID from the <a>ListAccounts</a> or
  /// <a>ListAccountsForParent</a> operations.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// account ID string requires exactly 12 digits.
  Future<DescribeAccountResponse> describeAccount({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DescribeAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
      },
    );

    return DescribeAccountResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the current status of an asynchronous request to create an
  /// account.
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [CreateAccountStatusNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [createAccountRequestId] :
  /// Specifies the <code>Id</code> value that uniquely identifies the
  /// <code>CreateAccount</code> request. You can get the value from the
  /// <code>CreateAccountStatus.Id</code> response in an earlier
  /// <a>CreateAccount</a> request, or from the <a>ListCreateAccountStatus</a>
  /// operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// create account request ID string requires "car-" followed by from 8 to 32
  /// lowercase letters or digits.
  Future<DescribeCreateAccountStatusResponse> describeCreateAccountStatus({
    @_s.required String createAccountRequestId,
  }) async {
    ArgumentError.checkNotNull(
        createAccountRequestId, 'createAccountRequestId');
    _s.validateStringLength(
      'createAccountRequestId',
      createAccountRequestId,
      0,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'createAccountRequestId',
      createAccountRequestId,
      r'''^car-[a-z0-9]{8,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DescribeCreateAccountStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreateAccountRequestId': createAccountRequestId,
      },
    );

    return DescribeCreateAccountStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns the contents of the effective policy for specified policy type and
  /// account. The effective policy is the aggregation of any policies of the
  /// specified type that the account inherits, plus any policy of that type
  /// that is directly attached to the account.
  ///
  /// This operation applies only to policy types <i>other</i> than service
  /// control policies (SCPs).
  ///
  /// For more information about policy inheritance, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies-inheritance.html">How
  /// Policy Inheritance Works</a> in the <i>AWS Organizations User Guide</i>.
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConstraintViolationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [TargetNotFoundException].
  /// May throw [EffectivePolicyNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [policyType] :
  /// The type of policy that you want information about. You can specify one of
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">AISERVICES_OPT_OUT_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetId] :
  /// When you're signed in as the management account, specify the ID of the
  /// account that you want details about. Specifying an organization root or
  /// organizational unit (OU) as the target is not supported.
  Future<DescribeEffectivePolicyResponse> describeEffectivePolicy({
    @_s.required EffectivePolicyType policyType,
    String targetId,
  }) async {
    ArgumentError.checkNotNull(policyType, 'policyType');
    _s.validateStringLength(
      'targetId',
      targetId,
      0,
      100,
    );
    _s.validateStringPattern(
      'targetId',
      targetId,
      r'''^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DescribeEffectivePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyType': policyType?.toValue() ?? '',
        if (targetId != null) 'TargetId': targetId,
      },
    );

    return DescribeEffectivePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a previously requested handshake. The
  /// handshake ID comes from the response to the original
  /// <a>InviteAccountToOrganization</a> operation that generated the handshake.
  ///
  /// You can access handshakes that are <code>ACCEPTED</code>,
  /// <code>DECLINED</code>, or <code>CANCELED</code> for only 30 days after
  /// they change to that state. They're then deleted and no longer accessible.
  ///
  /// This operation can be called from any account in the organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [HandshakeNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [handshakeId] :
  /// The unique identifier (ID) of the handshake that you want information
  /// about. You can get the ID from the original call to
  /// <a>InviteAccountToOrganization</a>, or from a call to
  /// <a>ListHandshakesForAccount</a> or <a>ListHandshakesForOrganization</a>.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for
  /// handshake ID string requires "h-" followed by from 8 to 32 lowercase
  /// letters or digits.
  Future<DescribeHandshakeResponse> describeHandshake({
    @_s.required String handshakeId,
  }) async {
    ArgumentError.checkNotNull(handshakeId, 'handshakeId');
    _s.validateStringLength(
      'handshakeId',
      handshakeId,
      0,
      34,
      isRequired: true,
    );
    _s.validateStringPattern(
      'handshakeId',
      handshakeId,
      r'''^h-[0-9a-z]{8,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DescribeHandshake'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HandshakeId': handshakeId,
      },
    );

    return DescribeHandshakeResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the organization that the user's account
  /// belongs to.
  ///
  /// This operation can be called from any account in the organization.
  /// <note>
  /// Even if a policy type is shown as available in the organization, you can
  /// disable it separately at the root level with <a>DisablePolicyType</a>. Use
  /// <a>ListRoots</a> to see the status of policy types for a specified root.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<DescribeOrganizationResponse> describeOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DescribeOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about an organizational unit (OU).
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [OrganizationalUnitNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [organizationalUnitId] :
  /// The unique identifier (ID) of the organizational unit that you want
  /// details about. You can get the ID from the
  /// <a>ListOrganizationalUnitsForParent</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// organizational unit ID string requires "ou-" followed by from 4 to 32
  /// lowercase letters or digits (the ID of the root that contains the OU).
  /// This string is followed by a second "-" dash and from 8 to 32 additional
  /// lowercase letters or digits.
  Future<DescribeOrganizationalUnitResponse> describeOrganizationalUnit({
    @_s.required String organizationalUnitId,
  }) async {
    ArgumentError.checkNotNull(organizationalUnitId, 'organizationalUnitId');
    _s.validateStringLength(
      'organizationalUnitId',
      organizationalUnitId,
      0,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationalUnitId',
      organizationalUnitId,
      r'''^ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DescribeOrganizationalUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationalUnitId': organizationalUnitId,
      },
    );

    return DescribeOrganizationalUnitResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a policy.
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [policyId] :
  /// The unique identifier (ID) of the policy that you want details about. You
  /// can get the ID from the <a>ListPolicies</a> or
  /// <a>ListPoliciesForTarget</a> operations.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// policy ID string requires "p-" followed by from 8 to 128 lowercase or
  /// uppercase letters, digits, or the underscore character (_).
  Future<DescribePolicyResponse> describePolicy({
    @_s.required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^p-[0-9a-zA-Z_]{8,128}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DescribePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
      },
    );

    return DescribePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Detaches a policy from a target root, organizational unit (OU), or
  /// account.
  /// <important>
  /// If the policy being detached is a service control policy (SCP), the
  /// changes to permissions for AWS Identity and Access Management (IAM) users
  /// and roles in affected accounts are immediate.
  /// </important>
  /// Every root, OU, and account must have at least one SCP attached. If you
  /// want to replace the default <code>FullAWSAccess</code> policy with an SCP
  /// that limits the permissions that can be delegated, you must attach the
  /// replacement SCP before you can remove the default SCP. This is the
  /// authorization strategy of an "<a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_allowlist">allow
  /// list</a>". If you instead attach a second SCP and leave the
  /// <code>FullAWSAccess</code> SCP still attached, and specify <code>"Effect":
  /// "Deny"</code> in the second SCP to override the <code>"Effect":
  /// "Allow"</code> in the <code>FullAWSAccess</code> policy (or any other
  /// attached SCP), you're using the authorization strategy of a "<a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_denylist">deny
  /// list</a>".
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotAttachedException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TargetNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  /// May throw [PolicyChangesInProgressException].
  ///
  /// Parameter [policyId] :
  /// The unique identifier (ID) of the policy you want to detach. You can get
  /// the ID from the <a>ListPolicies</a> or <a>ListPoliciesForTarget</a>
  /// operations.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// policy ID string requires "p-" followed by from 8 to 128 lowercase or
  /// uppercase letters, digits, or the underscore character (_).
  ///
  /// Parameter [targetId] :
  /// The unique identifier (ID) of the root, OU, or account that you want to
  /// detach the policy from. You can get the ID from the <a>ListRoots</a>,
  /// <a>ListOrganizationalUnitsForParent</a>, or <a>ListAccounts</a>
  /// operations.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// target ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Account</b> - A string that consists of exactly 12 digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  Future<void> detachPolicy({
    @_s.required String policyId,
    @_s.required String targetId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^p-[0-9a-zA-Z_]{8,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetId, 'targetId');
    _s.validateStringLength(
      'targetId',
      targetId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetId',
      targetId,
      r'''^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DetachPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
        'TargetId': targetId,
      },
    );
  }

  /// Disables the integration of an AWS service (the service that is specified
  /// by <code>ServicePrincipal</code>) with AWS Organizations. When you disable
  /// integration, the specified service no longer can create a <a
  /// href="http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">service-linked
  /// role</a> in <i>new</i> accounts in your organization. This means the
  /// service can't perform operations on your behalf on any new accounts in
  /// your organization. The service can still perform operations in older
  /// accounts until the service completes its clean-up from AWS Organizations.
  /// <p/> <important>
  /// We recommend that you disable integration between AWS Organizations and
  /// the specified AWS service by using the console or commands that are
  /// provided by the specified service. Doing so ensures that the other service
  /// is aware that it can clean up any resources that are required only for the
  /// integration. How the service cleans up its resources in the organization's
  /// accounts depends on that service. For more information, see the
  /// documentation for the other AWS service.
  /// </important>
  /// After you perform the <code>DisableAWSServiceAccess</code> operation, the
  /// specified service can no longer perform operations in your organization's
  /// accounts unless the operations are explicitly permitted by the IAM
  /// policies that are attached to your roles.
  ///
  /// For more information about integrating other services with AWS
  /// Organizations, including the list of services that work with
  /// Organizations, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating
  /// AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations
  /// User Guide.</i>
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [servicePrincipal] :
  /// The service principal name of the AWS service for which you want to
  /// disable integration with your organization. This is typically in the form
  /// of a URL, such as <code> <i>service-abbreviation</i>.amazonaws.com</code>.
  Future<void> disableAWSServiceAccess({
    @_s.required String servicePrincipal,
  }) async {
    ArgumentError.checkNotNull(servicePrincipal, 'servicePrincipal');
    _s.validateStringLength(
      'servicePrincipal',
      servicePrincipal,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'servicePrincipal',
      servicePrincipal,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DisableAWSServiceAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServicePrincipal': servicePrincipal,
      },
    );
  }

  /// Disables an organizational policy type in a root. A policy of a certain
  /// type can be attached to entities in a root only if that type is enabled in
  /// the root. After you perform this operation, you no longer can attach
  /// policies of the specified type to that root or to any organizational unit
  /// (OU) or account in that root. You can undo this by using the
  /// <a>EnablePolicyType</a> operation.
  ///
  /// This is an asynchronous request that AWS performs in the background. If
  /// you disable a policy type for a root, it still appears enabled for the
  /// organization if <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features</a> are enabled for the organization. AWS recommends that you
  /// first use <a>ListRoots</a> to see the status of policy types for a
  /// specified root, and then use this operation.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// To view the status of available policy types in the organization, use
  /// <a>DescribeOrganization</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyTypeNotEnabledException].
  /// May throw [RootNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  /// May throw [PolicyChangesInProgressException].
  ///
  /// Parameter [policyType] :
  /// The policy type that you want to disable in this root. You can specify one
  /// of the following values:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">AISERVICES_OPT_OUT_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [rootId] :
  /// The unique identifier (ID) of the root in which you want to disable a
  /// policy type. You can get the ID from the <a>ListRoots</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a root
  /// ID string requires "r-" followed by from 4 to 32 lowercase letters or
  /// digits.
  Future<DisablePolicyTypeResponse> disablePolicyType({
    @_s.required PolicyType policyType,
    @_s.required String rootId,
  }) async {
    ArgumentError.checkNotNull(policyType, 'policyType');
    ArgumentError.checkNotNull(rootId, 'rootId');
    _s.validateStringLength(
      'rootId',
      rootId,
      0,
      34,
      isRequired: true,
    );
    _s.validateStringPattern(
      'rootId',
      rootId,
      r'''^r-[0-9a-z]{4,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.DisablePolicyType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyType': policyType?.toValue() ?? '',
        'RootId': rootId,
      },
    );

    return DisablePolicyTypeResponse.fromJson(jsonResponse.body);
  }

  /// Enables the integration of an AWS service (the service that is specified
  /// by <code>ServicePrincipal</code>) with AWS Organizations. When you enable
  /// integration, you allow the specified service to create a <a
  /// href="http://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html">service-linked
  /// role</a> in all the accounts in your organization. This allows the service
  /// to perform operations on your behalf in your organization and its
  /// accounts.
  /// <important>
  /// We recommend that you enable integration between AWS Organizations and the
  /// specified AWS service by using the console or commands that are provided
  /// by the specified service. Doing so ensures that the service is aware that
  /// it can create the resources that are required for the integration. How the
  /// service creates those resources in the organization's accounts depends on
  /// that service. For more information, see the documentation for the other
  /// AWS service.
  /// </important>
  /// For more information about enabling services to integrate with AWS
  /// Organizations, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating
  /// AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations
  /// User Guide.</i>
  ///
  /// This operation can be called only from the organization's management
  /// account and only if the organization has <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">enabled
  /// all features</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [servicePrincipal] :
  /// The service principal name of the AWS service for which you want to enable
  /// integration with your organization. This is typically in the form of a
  /// URL, such as <code> <i>service-abbreviation</i>.amazonaws.com</code>.
  Future<void> enableAWSServiceAccess({
    @_s.required String servicePrincipal,
  }) async {
    ArgumentError.checkNotNull(servicePrincipal, 'servicePrincipal');
    _s.validateStringLength(
      'servicePrincipal',
      servicePrincipal,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'servicePrincipal',
      servicePrincipal,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.EnableAWSServiceAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServicePrincipal': servicePrincipal,
      },
    );
  }

  /// Enables all features in an organization. This enables the use of
  /// organization policies that can restrict the services and actions that can
  /// be called in each account. Until you enable all features, you have access
  /// only to consolidated billing, and you can't use any of the advanced
  /// account administration features that AWS Organizations supports. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling
  /// All Features in Your Organization</a> in the <i>AWS Organizations User
  /// Guide.</i>
  /// <important>
  /// This operation is required only for organizations that were created
  /// explicitly with only the consolidated billing features enabled. Calling
  /// this operation sends a handshake to every invited account in the
  /// organization. The feature set change can be finalized and the additional
  /// features enabled only after all administrators in the invited accounts
  /// approve the change by accepting the handshake.
  /// </important>
  /// After you enable all features, you can separately enable or disable
  /// individual policy types in a root using <a>EnablePolicyType</a> and
  /// <a>DisablePolicyType</a>. To see the status of policy types in a root, use
  /// <a>ListRoots</a>.
  ///
  /// After all invited member accounts accept the handshake, you finalize the
  /// feature set change by accepting the handshake that contains
  /// <code>"Action": "ENABLE_ALL_FEATURES"</code>. This completes the change.
  ///
  /// After you enable all features in your organization, the management account
  /// in the organization can apply policies on all member accounts. These
  /// policies can restrict what users and even administrators in those accounts
  /// can do. The management account can apply policies that prevent accounts
  /// from leaving the organization. Ensure that your account administrators are
  /// aware of this.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [HandshakeConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<EnableAllFeaturesResponse> enableAllFeatures() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.EnableAllFeatures'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return EnableAllFeaturesResponse.fromJson(jsonResponse.body);
  }

  /// Enables a policy type in a root. After you enable a policy type in a root,
  /// you can attach policies of that type to the root, any organizational unit
  /// (OU), or account in that root. You can undo this by using the
  /// <a>DisablePolicyType</a> operation.
  ///
  /// This is an asynchronous request that AWS performs in the background. AWS
  /// recommends that you first use <a>ListRoots</a> to see the status of policy
  /// types for a specified root, and then use this operation.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// You can enable a policy type in a root only if that policy type is
  /// available in the organization. To view the status of available policy
  /// types in the organization, use <a>DescribeOrganization</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyTypeAlreadyEnabledException].
  /// May throw [RootNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [PolicyTypeNotAvailableForOrganizationException].
  /// May throw [UnsupportedAPIEndpointException].
  /// May throw [PolicyChangesInProgressException].
  ///
  /// Parameter [policyType] :
  /// The policy type that you want to enable. You can specify one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">AISERVICES_OPT_OUT_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [rootId] :
  /// The unique identifier (ID) of the root in which you want to enable a
  /// policy type. You can get the ID from the <a>ListRoots</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a root
  /// ID string requires "r-" followed by from 4 to 32 lowercase letters or
  /// digits.
  Future<EnablePolicyTypeResponse> enablePolicyType({
    @_s.required PolicyType policyType,
    @_s.required String rootId,
  }) async {
    ArgumentError.checkNotNull(policyType, 'policyType');
    ArgumentError.checkNotNull(rootId, 'rootId');
    _s.validateStringLength(
      'rootId',
      rootId,
      0,
      34,
      isRequired: true,
    );
    _s.validateStringPattern(
      'rootId',
      rootId,
      r'''^r-[0-9a-z]{4,32}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.EnablePolicyType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyType': policyType?.toValue() ?? '',
        'RootId': rootId,
      },
    );

    return EnablePolicyTypeResponse.fromJson(jsonResponse.body);
  }

  /// Sends an invitation to another account to join your organization as a
  /// member account. AWS Organizations sends email on your behalf to the email
  /// address that is associated with the other account's owner. The invitation
  /// is implemented as a <a>Handshake</a> whose details are in the response.
  /// <important>
  /// <ul>
  /// <li>
  /// You can invite AWS accounts only from the same seller as the management
  /// account. For example, if your organization's management account was
  /// created by Amazon Internet Services Pvt. Ltd (AISPL), an AWS seller in
  /// India, you can invite only other AISPL accounts to your organization. You
  /// can't combine accounts from AISPL and AWS or from any other AWS seller.
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/useconsolidatedbilliing-India.html">Consolidated
  /// Billing in India</a>.
  /// </li>
  /// <li>
  /// If you receive an exception that indicates that you exceeded your account
  /// limits for the organization or that the operation failed because your
  /// organization is still initializing, wait one hour and then try again. If
  /// the error persists after an hour, contact <a
  /// href="https://console.aws.amazon.com/support/home#/">AWS Support</a>.
  /// </li>
  /// </ul> </important>
  /// If the request includes tags, then the requester must have the
  /// <code>organizations:TagResource</code> permission.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [AccountOwnerNotVerifiedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [HandshakeConstraintViolationException].
  /// May throw [DuplicateHandshakeException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [FinalizingOrganizationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [target] :
  /// The identifier (ID) of the AWS account that you want to invite to join
  /// your organization. This is a JSON object that contains the following
  /// elements:
  ///
  /// <code>{ "Type": "ACCOUNT", "Id": "&lt;<i> <b>account id number</b>
  /// </i>&gt;" }</code>
  ///
  /// If you use the AWS CLI, you can submit this as a single string, similar to
  /// the following example:
  ///
  /// <code>--target Id=123456789012,Type=ACCOUNT</code>
  ///
  /// If you specify <code>"Type": "ACCOUNT"</code>, you must provide the AWS
  /// account ID number as the <code>Id</code>. If you specify <code>"Type":
  /// "EMAIL"</code>, you must specify the email address that is associated with
  /// the account.
  ///
  /// <code>--target Id=diego@example.com,Type=EMAIL</code>
  ///
  /// Parameter [notes] :
  /// Additional information that you want to include in the generated email to
  /// the recipient account owner.
  ///
  /// Parameter [tags] :
  /// A list of tags that you want to attach to the account when it becomes a
  /// member of the organization. For each tag in the list, you must specify
  /// both a tag key and a value. You can set the value to an empty string, but
  /// you can't set it to <code>null</code>. For more information about tagging,
  /// see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html">Tagging
  /// AWS Organizations resources</a> in the AWS Organizations User Guide.
  /// <important>
  /// Any tags in the request are checked for compliance with any applicable tag
  /// policies when the request is made. The request is rejected if the tags in
  /// the request don't match the requirements of the policy at that time. Tag
  /// policy compliance is <i> <b>not</b> </i> checked again when the invitation
  /// is accepted and the tags are actually attached to the account. That means
  /// that if the tag policy changes between the invitation and the acceptance,
  /// then that tags could potentially be non-compliant.
  /// </important> <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags for an account, then the entire request fails and invitations are not
  /// sent.
  /// </note>
  Future<InviteAccountToOrganizationResponse> inviteAccountToOrganization({
    @_s.required HandshakeParty target,
    String notes,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(target, 'target');
    _s.validateStringLength(
      'notes',
      notes,
      0,
      1024,
    );
    _s.validateStringPattern(
      'notes',
      notes,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.InviteAccountToOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Target': target,
        if (notes != null) 'Notes': notes,
        if (tags != null) 'Tags': tags,
      },
    );

    return InviteAccountToOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Removes a member account from its parent organization. This version of the
  /// operation is performed by the account that wants to leave. To remove a
  /// member account as a user in the management account, use
  /// <a>RemoveAccountFromOrganization</a> instead.
  ///
  /// This operation can be called only from a member account in the
  /// organization.
  /// <important>
  /// <ul>
  /// <li>
  /// The management account in an organization with all features enabled can
  /// set service control policies (SCPs) that can restrict what administrators
  /// of member accounts can do. This includes preventing them from successfully
  /// calling <code>LeaveOrganization</code> and leaving the organization.
  /// </li>
  /// <li>
  /// You can leave an organization as a member account only if the account is
  /// configured with the information required to operate as a standalone
  /// account. When you create an account in an organization using the AWS
  /// Organizations console, API, or CLI commands, the information required of
  /// standalone accounts is <i>not</i> automatically collected. For each
  /// account that you want to make standalone, you must perform the following
  /// steps. If any of the steps are already completed for this account, that
  /// step doesn't appear.
  ///
  /// <ul>
  /// <li>
  /// Choose a support plan
  /// </li>
  /// <li>
  /// Provide and verify the required contact information
  /// </li>
  /// <li>
  /// Provide a current payment method
  /// </li>
  /// </ul>
  /// AWS uses the payment method to charge for any billable (not free tier) AWS
  /// activity that occurs while the account isn't attached to an organization.
  /// Follow the steps at <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info">
  /// To leave an organization when all required account information has not yet
  /// been provided</a> in the <i>AWS Organizations User Guide.</i>
  /// </li>
  /// <li>
  /// You can leave an organization only after you enable IAM user access to
  /// billing in your account. For more information, see <a
  /// href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate">Activating
  /// Access to the Billing and Cost Management Console</a> in the <i>AWS
  /// Billing and Cost Management User Guide.</i>
  /// </li>
  /// <li>
  /// After the account leaves the organization, all tags that were attached to
  /// the account object in the organization are deleted. AWS accounts outside
  /// of an organization do not support tags.
  /// </li>
  /// </ul> </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [MasterCannotLeaveOrganizationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<void> leaveOrganization() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.LeaveOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Returns a list of the AWS services that you enabled to integrate with your
  /// organization. After a service on this list creates the resources that it
  /// requires for the integration, it can perform operations on your
  /// organization and its accounts.
  ///
  /// For more information about integrating other services with AWS
  /// Organizations, including the list of services that currently work with
  /// Organizations, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html">Integrating
  /// AWS Organizations with Other AWS Services</a> in the <i>AWS Organizations
  /// User Guide.</i>
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListAWSServiceAccessForOrganizationResponse>
      listAWSServiceAccessForOrganization({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSOrganizationsV20161128.ListAWSServiceAccessForOrganization'
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

    return ListAWSServiceAccessForOrganizationResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all the accounts in the organization. To request only the accounts
  /// in a specified root or organizational unit (OU), use the
  /// <a>ListAccountsForParent</a> operation instead.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListAccountsResponse> listAccounts({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListAccounts'
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

    return ListAccountsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the accounts in an organization that are contained by the specified
  /// target root or organizational unit (OU). If you specify the root, you get
  /// a list of all the accounts that aren't in any OU. If you specify an OU,
  /// you get a list of all the accounts in only that OU and not in any child
  /// OUs. To get a list of all accounts in the organization, use the
  /// <a>ListAccounts</a> operation.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ParentNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [parentId] :
  /// The unique identifier (ID) for the parent root or organization unit (OU)
  /// whose accounts you want to list.
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListAccountsForParentResponse> listAccountsForParent({
    @_s.required String parentId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(parentId, 'parentId');
    _s.validateStringLength(
      'parentId',
      parentId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'parentId',
      parentId,
      r'''^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListAccountsForParent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParentId': parentId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAccountsForParentResponse.fromJson(jsonResponse.body);
  }

  /// Lists all of the organizational units (OUs) or accounts that are contained
  /// in the specified parent OU or root. This operation, along with
  /// <a>ListParents</a> enables you to traverse the tree structure that makes
  /// up this root.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ParentNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [childType] :
  /// Filters the output to include only the specified child type.
  ///
  /// Parameter [parentId] :
  /// The unique identifier (ID) for the parent root or OU whose children you
  /// want to list.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// parent ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListChildrenResponse> listChildren({
    @_s.required ChildType childType,
    @_s.required String parentId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(childType, 'childType');
    ArgumentError.checkNotNull(parentId, 'parentId');
    _s.validateStringLength(
      'parentId',
      parentId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'parentId',
      parentId,
      r'''^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListChildren'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChildType': childType?.toValue() ?? '',
        'ParentId': parentId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListChildrenResponse.fromJson(jsonResponse.body);
  }

  /// Lists the account creation requests that match the specified status that
  /// is currently being tracked for the organization.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  ///
  /// Parameter [states] :
  /// A list of one or more states that you want included in the response. If
  /// this parameter isn't present, all requests are included in the response.
  Future<ListCreateAccountStatusResponse> listCreateAccountStatus({
    int maxResults,
    String nextToken,
    List<CreateAccountState> states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListCreateAccountStatus'
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
        if (states != null)
          'States': states.map((e) => e?.toValue() ?? '').toList(),
      },
    );

    return ListCreateAccountStatusResponse.fromJson(jsonResponse.body);
  }

  /// Lists the AWS accounts that are designated as delegated administrators in
  /// this organization.
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  ///
  /// Parameter [servicePrincipal] :
  /// Specifies a service principal name. If specified, then the operation lists
  /// the delegated administrators only for the specified service.
  ///
  /// If you don't specify a service principal, the operation lists all
  /// delegated administrators for all services in your organization.
  Future<ListDelegatedAdministratorsResponse> listDelegatedAdministrators({
    int maxResults,
    String nextToken,
    String servicePrincipal,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    _s.validateStringLength(
      'servicePrincipal',
      servicePrincipal,
      1,
      128,
    );
    _s.validateStringPattern(
      'servicePrincipal',
      servicePrincipal,
      r'''[\w+=,.@-]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListDelegatedAdministrators'
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
        if (servicePrincipal != null) 'ServicePrincipal': servicePrincipal,
      },
    );

    return ListDelegatedAdministratorsResponse.fromJson(jsonResponse.body);
  }

  /// List the AWS services for which the specified account is a delegated
  /// administrator.
  ///
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  /// May throw [AccountNotRegisteredException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [accountId] :
  /// The account ID number of a delegated administrator account in the
  /// organization.
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListDelegatedServicesForAccountResponse>
      listDelegatedServicesForAccount({
    @_s.required String accountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSOrganizationsV20161128.ListDelegatedServicesForAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDelegatedServicesForAccountResponse.fromJson(jsonResponse.body);
  }

  /// Lists the current handshakes that are associated with the account of the
  /// requesting user.
  ///
  /// Handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or
  /// <code>CANCELED</code> appear in the results of this API for only 30 days
  /// after changing to that state. After that, they're deleted and no longer
  /// accessible.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called from any account in the organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [filter] :
  /// Filters the handshakes that you want included in the response. The default
  /// is all types. Use the <code>ActionType</code> element to limit the output
  /// to only a specified type, such as <code>INVITE</code>,
  /// <code>ENABLE_ALL_FEATURES</code>, or <code>APPROVE_ALL_FEATURES</code>.
  /// Alternatively, for the <code>ENABLE_ALL_FEATURES</code> handshake that
  /// generates a separate child handshake for each member account, you can
  /// specify <code>ParentHandshakeId</code> to see only the handshakes that
  /// were generated by that parent request.
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListHandshakesForAccountResponse> listHandshakesForAccount({
    HandshakeFilter filter,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListHandshakesForAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHandshakesForAccountResponse.fromJson(jsonResponse.body);
  }

  /// Lists the handshakes that are associated with the organization that the
  /// requesting user is part of. The <code>ListHandshakesForOrganization</code>
  /// operation returns a list of handshake structures. Each structure contains
  /// details and status about a handshake.
  ///
  /// Handshakes that are <code>ACCEPTED</code>, <code>DECLINED</code>, or
  /// <code>CANCELED</code> appear in the results of this API for only 30 days
  /// after changing to that state. After that, they're deleted and no longer
  /// accessible.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [filter] :
  /// A filter of the handshakes that you want included in the response. The
  /// default is all types. Use the <code>ActionType</code> element to limit the
  /// output to only a specified type, such as <code>INVITE</code>,
  /// <code>ENABLE-ALL-FEATURES</code>, or <code>APPROVE-ALL-FEATURES</code>.
  /// Alternatively, for the <code>ENABLE-ALL-FEATURES</code> handshake that
  /// generates a separate child handshake for each member account, you can
  /// specify the <code>ParentHandshakeId</code> to see only the handshakes that
  /// were generated by that parent request.
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListHandshakesForOrganizationResponse> listHandshakesForOrganization({
    HandshakeFilter filter,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListHandshakesForOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListHandshakesForOrganizationResponse.fromJson(jsonResponse.body);
  }

  /// Lists the organizational units (OUs) in a parent organizational unit or
  /// root.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ParentNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [parentId] :
  /// The unique identifier (ID) of the root or OU whose child OUs you want to
  /// list.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// parent ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListOrganizationalUnitsForParentResponse>
      listOrganizationalUnitsForParent({
    @_s.required String parentId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(parentId, 'parentId');
    _s.validateStringLength(
      'parentId',
      parentId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'parentId',
      parentId,
      r'''^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSOrganizationsV20161128.ListOrganizationalUnitsForParent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParentId': parentId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListOrganizationalUnitsForParentResponse.fromJson(jsonResponse.body);
  }

  /// Lists the root or organizational units (OUs) that serve as the immediate
  /// parent of the specified child OU or account. This operation, along with
  /// <a>ListChildren</a> enables you to traverse the tree structure that makes
  /// up this root.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  /// <note>
  /// In the current release, a child can have only a single parent.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ChildNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [childId] :
  /// The unique identifier (ID) of the OU or account whose parent containers
  /// you want to list. Don't specify a root.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// child ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Account</b> - A string that consists of exactly 12 digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that
  /// contains the OU). This string is followed by a second "-" dash and from 8
  /// to 32 additional lowercase letters or digits.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListParentsResponse> listParents({
    @_s.required String childId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(childId, 'childId');
    _s.validateStringLength(
      'childId',
      childId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'childId',
      childId,
      r'''^(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListParents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ChildId': childId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListParentsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of all policies in an organization of a specified type.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [filter] :
  /// Specifies the type of policy that you want to include in the response. You
  /// must specify one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">AISERVICES_OPT_OUT_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListPoliciesResponse> listPolicies({
    @_s.required PolicyType filter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(filter, 'filter');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filter': filter?.toValue() ?? '',
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the policies that are directly attached to the specified target
  /// root, organizational unit (OU), or account. You must specify the policy
  /// type that you want included in the returned list.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TargetNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [filter] :
  /// The type of policy that you want to include in the returned list. You must
  /// specify one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html">AISERVICES_OPT_OUT_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html">BACKUP_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html">SERVICE_CONTROL_POLICY</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html">TAG_POLICY</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [targetId] :
  /// The unique identifier (ID) of the root, organizational unit, or account
  /// whose policies you want to list.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// target ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Account</b> - A string that consists of exactly 12 digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListPoliciesForTargetResponse> listPoliciesForTarget({
    @_s.required PolicyType filter,
    @_s.required String targetId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(filter, 'filter');
    ArgumentError.checkNotNull(targetId, 'targetId');
    _s.validateStringLength(
      'targetId',
      targetId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetId',
      targetId,
      r'''^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListPoliciesForTarget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filter': filter?.toValue() ?? '',
        'TargetId': targetId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPoliciesForTargetResponse.fromJson(jsonResponse.body);
  }

  /// Lists the roots that are defined in the current organization.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  /// <note>
  /// Policy types can be enabled and disabled in roots. This is distinct from
  /// whether they're available in the organization. When you enable all
  /// features, you make policy types available for use in that organization.
  /// Individual policy types can then be enabled and disabled in a root. To see
  /// the availability of a policy type in an organization, use
  /// <a>DescribeOrganization</a>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListRootsResponse> listRoots({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListRoots'
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

    return ListRootsResponse.fromJson(jsonResponse.body);
  }

  /// Lists tags that are attached to the specified resource.
  ///
  /// You can attach tags to the following resources in AWS Organizations.
  ///
  /// <ul>
  /// <li>
  /// AWS account
  /// </li>
  /// <li>
  /// Organization root
  /// </li>
  /// <li>
  /// Organizational unit (OU)
  /// </li>
  /// <li>
  /// Policy (any type)
  /// </li>
  /// </ul>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [TargetNotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource with the tags to list.
  ///
  /// You can specify any of the following taggable resources.
  ///
  /// <ul>
  /// <li>
  /// AWS account – specify the account ID number.
  /// </li>
  /// <li>
  /// Organizational unit – specify the OU ID that begins with <code>ou-</code>
  /// and looks similar to: <code>ou-<i>1a2b-34uvwxyz</i> </code>
  /// </li>
  /// <li>
  /// Root – specify the root ID that begins with <code>r-</code> and looks
  /// similar to: <code>r-<i>1a2b</i> </code>
  /// </li>
  /// <li>
  /// Policy – specify the policy ID that begins with <code>p-</code> andlooks
  /// similar to: <code>p-<i>12abcdefg3</i> </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})|(^p-[0-9a-zA-Z_]{8,128})$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the roots, organizational units (OUs), and accounts that the
  /// specified policy is attached to.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter for a
  /// <code>null</code> value when calling a <code>List*</code> operation. These
  /// operations can occasionally return an empty set of results even when there
  /// are more results available. The <code>NextToken</code> response parameter
  /// value is <code>null</code> <i>only</i> when there are no more results to
  /// display.
  /// </note>
  /// This operation can be called only from the organization's management
  /// account or by a member account that is a delegated administrator for an
  /// AWS service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [InvalidInputException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [policyId] :
  /// The unique identifier (ID) of the policy whose attachments you want to
  /// know.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// policy ID string requires "p-" followed by from 8 to 128 lowercase or
  /// uppercase letters, digits, or the underscore character (_).
  ///
  /// Parameter [maxResults] :
  /// The total number of results that you want included on each page of the
  /// response. If you do not include this parameter, it defaults to a value
  /// that is specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (is not null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Organizations might return
  /// fewer results than the maximum even when there are more results available.
  /// You should check <code>NextToken</code> after every operation to ensure
  /// that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// The parameter for receiving additional results if you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListTargetsForPolicyResponse> listTargetsForPolicy({
    @_s.required String policyId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^p-[0-9a-zA-Z_]{8,128}$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      100000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.ListTargetsForPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTargetsForPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Moves an account from its current source parent root or organizational
  /// unit (OU) to the specified destination parent root or OU.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [SourceParentNotFoundException].
  /// May throw [DestinationParentNotFoundException].
  /// May throw [DuplicateAccountException].
  /// May throw [AccountNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ServiceException].
  ///
  /// Parameter [accountId] :
  /// The unique identifier (ID) of the account that you want to move.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// account ID string requires exactly 12 digits.
  ///
  /// Parameter [destinationParentId] :
  /// The unique identifier (ID) of the root or organizational unit that you
  /// want to move the account to.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// parent ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceParentId] :
  /// The unique identifier (ID) of the root or organizational unit that you
  /// want to move the account from.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// parent ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the
  /// OU is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  Future<void> moveAccount({
    @_s.required String accountId,
    @_s.required String destinationParentId,
    @_s.required String sourceParentId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(destinationParentId, 'destinationParentId');
    _s.validateStringLength(
      'destinationParentId',
      destinationParentId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'destinationParentId',
      destinationParentId,
      r'''^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceParentId, 'sourceParentId');
    _s.validateStringLength(
      'sourceParentId',
      sourceParentId,
      0,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'sourceParentId',
      sourceParentId,
      r'''^(r-[0-9a-z]{4,32})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.MoveAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'DestinationParentId': destinationParentId,
        'SourceParentId': sourceParentId,
      },
    );
  }

  /// Enables the specified member account to administer the Organizations
  /// features of the specified AWS service. It grants read-only access to AWS
  /// Organizations service data. The account still requires IAM permissions to
  /// access and administer the AWS service.
  ///
  /// You can run this action only for AWS services that support this feature.
  /// For a current list of services that support it, see the column <i>Supports
  /// Delegated Administrator</i> in the table at <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrated-services-list.html">AWS
  /// Services that you can use with AWS Organizations</a> in the <i>AWS
  /// Organizations User Guide.</i>
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AccountAlreadyRegisteredException].
  /// May throw [AccountNotFoundException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  /// May throw [UnsupportedAPIEndpointException].
  ///
  /// Parameter [accountId] :
  /// The account ID number of the member account in the organization to
  /// register as a delegated administrator.
  ///
  /// Parameter [servicePrincipal] :
  /// The service principal of the AWS service for which you want to make the
  /// member account a delegated administrator.
  Future<void> registerDelegatedAdministrator({
    @_s.required String accountId,
    @_s.required String servicePrincipal,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(servicePrincipal, 'servicePrincipal');
    _s.validateStringLength(
      'servicePrincipal',
      servicePrincipal,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'servicePrincipal',
      servicePrincipal,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.RegisterDelegatedAdministrator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'ServicePrincipal': servicePrincipal,
      },
    );
  }

  /// Removes the specified account from the organization.
  ///
  /// The removed account becomes a standalone account that isn't a member of
  /// any organization. It's no longer subject to any policies and is
  /// responsible for its own bill payments. The organization's management
  /// account is no longer charged for any expenses accrued by the member
  /// account after it's removed from the organization.
  ///
  /// This operation can be called only from the organization's management
  /// account. Member accounts can remove themselves with
  /// <a>LeaveOrganization</a> instead.
  /// <important>
  /// <ul>
  /// <li>
  /// You can remove an account from your organization only if the account is
  /// configured with the information required to operate as a standalone
  /// account. When you create an account in an organization using the AWS
  /// Organizations console, API, or CLI commands, the information required of
  /// standalone accounts is <i>not</i> automatically collected. For an account
  /// that you want to make standalone, you must choose a support plan, provide
  /// and verify the required contact information, and provide a current payment
  /// method. AWS uses the payment method to charge for any billable (not free
  /// tier) AWS activity that occurs while the account isn't attached to an
  /// organization. To remove an account that doesn't yet have this information,
  /// you must sign in as the member account and follow the steps at <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info">
  /// To leave an organization when all required account information has not yet
  /// been provided</a> in the <i>AWS Organizations User Guide.</i>
  /// </li>
  /// <li>
  /// After the account leaves the organization, all tags that were attached to
  /// the account object in the organization are deleted. AWS accounts outside
  /// of an organization do not support tags.
  /// </li>
  /// </ul> </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AccountNotFoundException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [MasterCannotLeaveOrganizationException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [accountId] :
  /// The unique identifier (ID) of the member account that you want to remove
  /// from the organization.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// account ID string requires exactly 12 digits.
  Future<void> removeAccountFromOrganization({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'accountId',
      accountId,
      0,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^\d{12}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.RemoveAccountFromOrganization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
      },
    );
  }

  /// Adds one or more tags to the specified resource.
  ///
  /// Currently, you can attach tags to the following resources in AWS
  /// Organizations.
  ///
  /// <ul>
  /// <li>
  /// AWS account
  /// </li>
  /// <li>
  /// Organization root
  /// </li>
  /// <li>
  /// Organizational unit (OU)
  /// </li>
  /// <li>
  /// Policy (any type)
  /// </li>
  /// </ul>
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [TargetNotFoundException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource to add a tag to.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the specified resource.
  ///
  /// You can specify any of the following taggable resources.
  ///
  /// <ul>
  /// <li>
  /// AWS account – specify the account ID number.
  /// </li>
  /// <li>
  /// Organizational unit – specify the OU ID that begins with <code>ou-</code>
  /// and looks similar to: <code>ou-<i>1a2b-34uvwxyz</i> </code>
  /// </li>
  /// <li>
  /// Root – specify the root ID that begins with <code>r-</code> and looks
  /// similar to: <code>r-<i>1a2b</i> </code>
  /// </li>
  /// <li>
  /// Policy – specify the policy ID that begins with <code>p-</code> andlooks
  /// similar to: <code>p-<i>12abcdefg3</i> </code>
  /// </li>
  /// </ul>
  /// For each tag in the list, you must specify both a tag key and a value. You
  /// can set the value to an empty string, but you can't set it to
  /// <code>null</code>.
  /// <note>
  /// If any one of the tags is invalid or if you exceed the allowed number of
  /// tags for an account user, then the entire request fails and the account is
  /// not created.
  /// </note>
  Future<void> tagResource({
    @_s.required String resourceId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})|(^p-[0-9a-zA-Z_]{8,128})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'Tags': tags,
      },
    );
  }

  /// Removes any tags with the specified keys from the specified resource.
  ///
  /// You can attach tags to the following resources in AWS Organizations.
  ///
  /// <ul>
  /// <li>
  /// AWS account
  /// </li>
  /// <li>
  /// Organization root
  /// </li>
  /// <li>
  /// Organizational unit (OU)
  /// </li>
  /// <li>
  /// Policy (any type)
  /// </li>
  /// </ul>
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [TargetNotFoundException].
  /// May throw [ConstraintViolationException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource to remove a tag from.
  ///
  /// You can specify any of the following taggable resources.
  ///
  /// <ul>
  /// <li>
  /// AWS account – specify the account ID number.
  /// </li>
  /// <li>
  /// Organizational unit – specify the OU ID that begins with <code>ou-</code>
  /// and looks similar to: <code>ou-<i>1a2b-34uvwxyz</i> </code>
  /// </li>
  /// <li>
  /// Root – specify the root ID that begins with <code>r-</code> and looks
  /// similar to: <code>r-<i>1a2b</i> </code>
  /// </li>
  /// <li>
  /// Policy – specify the policy ID that begins with <code>p-</code> andlooks
  /// similar to: <code>p-<i>12abcdefg3</i> </code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [tagKeys] :
  /// The list of keys for tags to remove from the specified resource.
  Future<void> untagResource({
    @_s.required String resourceId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''^(r-[0-9a-z]{4,32})|(\d{12})|(ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})|(^p-[0-9a-zA-Z_]{8,128})$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Renames the specified organizational unit (OU). The ID and ARN don't
  /// change. The child OUs and accounts remain in place, and any attached
  /// policies of the OU remain attached.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [DuplicateOrganizationalUnitException].
  /// May throw [InvalidInputException].
  /// May throw [OrganizationalUnitNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [organizationalUnitId] :
  /// The unique identifier (ID) of the OU that you want to rename. You can get
  /// the ID from the <a>ListOrganizationalUnitsForParent</a> operation.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// organizational unit ID string requires "ou-" followed by from 4 to 32
  /// lowercase letters or digits (the ID of the root that contains the OU).
  /// This string is followed by a second "-" dash and from 8 to 32 additional
  /// lowercase letters or digits.
  ///
  /// Parameter [name] :
  /// The new name that you want to assign to the OU.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter is a string of any of the characters in
  /// the ASCII character range.
  Future<UpdateOrganizationalUnitResponse> updateOrganizationalUnit({
    @_s.required String organizationalUnitId,
    String name,
  }) async {
    ArgumentError.checkNotNull(organizationalUnitId, 'organizationalUnitId');
    _s.validateStringLength(
      'organizationalUnitId',
      organizationalUnitId,
      0,
      68,
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationalUnitId',
      organizationalUnitId,
      r'''^ou-[0-9a-z]{4,32}-[a-z0-9]{8,32}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.UpdateOrganizationalUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationalUnitId': organizationalUnitId,
        if (name != null) 'Name': name,
      },
    );

    return UpdateOrganizationalUnitResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing policy with a new name, description, or content. If
  /// you don't supply any parameter, that value remains unchanged. You can't
  /// change a policy's type.
  ///
  /// This operation can be called only from the organization's management
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSOrganizationsNotInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [ConstraintViolationException].
  /// May throw [DuplicatePolicyException].
  /// May throw [InvalidInputException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedAPIEndpointException].
  /// May throw [PolicyChangesInProgressException].
  ///
  /// Parameter [policyId] :
  /// The unique identifier (ID) of the policy that you want to update.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a
  /// policy ID string requires "p-" followed by from 8 to 128 lowercase or
  /// uppercase letters, digits, or the underscore character (_).
  ///
  /// Parameter [content] :
  /// If provided, the new content for the policy. The text must be correctly
  /// formatted JSON that complies with the syntax for the policy's type. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_scp-syntax.html">Service
  /// Control Policy Syntax</a> in the <i>AWS Organizations User Guide.</i>
  ///
  /// Parameter [description] :
  /// If provided, the new description for the policy.
  ///
  /// Parameter [name] :
  /// If provided, the new name for the policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is
  /// used to validate this parameter is a string of any of the characters in
  /// the ASCII character range.
  Future<UpdatePolicyResponse> updatePolicy({
    @_s.required String policyId,
    String content,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      130,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''^p-[0-9a-zA-Z_]{8,128}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'content',
      content,
      1,
      1000000,
    );
    _s.validateStringPattern(
      'content',
      content,
      r'''[\s\S]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\s\S]*''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\s\S]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSOrganizationsV20161128.UpdatePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyId': policyId,
        if (content != null) 'Content': content,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
      },
    );

    return UpdatePolicyResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptHandshakeResponse {
  /// A structure that contains details about the accepted handshake.
  @_s.JsonKey(name: 'Handshake')
  final Handshake handshake;

  AcceptHandshakeResponse({
    this.handshake,
  });
  factory AcceptHandshakeResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptHandshakeResponseFromJson(json);
}

/// Contains information about an AWS account that is a member of an
/// organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Account {
  /// The Amazon Resource Name (ARN) of the account.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The email address associated with the AWS account.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for this
  /// parameter is a string of characters that represents a standard internet
  /// email address.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The unique identifier (ID) of the account.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// account ID string requires exactly 12 digits.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The method by which the account joined the organization.
  @_s.JsonKey(name: 'JoinedMethod')
  final AccountJoinedMethod joinedMethod;

  /// The date the account became a part of the organization.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'JoinedTimestamp')
  final DateTime joinedTimestamp;

  /// The friendly name of the account.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used
  /// to validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of the account in the organization.
  @_s.JsonKey(name: 'Status')
  final AccountStatus status;

  Account({
    this.arn,
    this.email,
    this.id,
    this.joinedMethod,
    this.joinedTimestamp,
    this.name,
    this.status,
  });
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

enum AccountJoinedMethod {
  @_s.JsonValue('INVITED')
  invited,
  @_s.JsonValue('CREATED')
  created,
}

enum AccountStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('SUSPENDED')
  suspended,
}

enum ActionType {
  @_s.JsonValue('INVITE')
  invite,
  @_s.JsonValue('ENABLE_ALL_FEATURES')
  enableAllFeatures,
  @_s.JsonValue('APPROVE_ALL_FEATURES')
  approveAllFeatures,
  @_s.JsonValue('ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE')
  addOrganizationsServiceLinkedRole,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelHandshakeResponse {
  /// A structure that contains details about the handshake that you canceled.
  @_s.JsonKey(name: 'Handshake')
  final Handshake handshake;

  CancelHandshakeResponse({
    this.handshake,
  });
  factory CancelHandshakeResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelHandshakeResponseFromJson(json);
}

/// Contains a list of child entities, either OUs or accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Child {
  /// The unique identifier (ID) of this child entity.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a child
  /// ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Account</b> - A string that consists of exactly 12 digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that
  /// contains the OU). This string is followed by a second "-" dash and from 8 to
  /// 32 additional lowercase letters or digits.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of this child entity.
  @_s.JsonKey(name: 'Type')
  final ChildType type;

  Child({
    this.id,
    this.type,
  });
  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
}

enum ChildType {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('ORGANIZATIONAL_UNIT')
  organizationalUnit,
}

extension on ChildType {
  String toValue() {
    switch (this) {
      case ChildType.account:
        return 'ACCOUNT';
      case ChildType.organizationalUnit:
        return 'ORGANIZATIONAL_UNIT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum CreateAccountFailureReason {
  @_s.JsonValue('ACCOUNT_LIMIT_EXCEEDED')
  accountLimitExceeded,
  @_s.JsonValue('EMAIL_ALREADY_EXISTS')
  emailAlreadyExists,
  @_s.JsonValue('INVALID_ADDRESS')
  invalidAddress,
  @_s.JsonValue('INVALID_EMAIL')
  invalidEmail,
  @_s.JsonValue('CONCURRENT_ACCOUNT_MODIFICATION')
  concurrentAccountModification,
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
  @_s.JsonValue('GOVCLOUD_ACCOUNT_ALREADY_EXISTS')
  govcloudAccountAlreadyExists,
  @_s.JsonValue('MISSING_BUSINESS_VALIDATION')
  missingBusinessValidation,
  @_s.JsonValue('MISSING_PAYMENT_INSTRUMENT')
  missingPaymentInstrument,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAccountResponse {
  /// A structure that contains details about the request to create an account.
  /// This response structure might not be fully populated when you first receive
  /// it because account creation is an asynchronous process. You can pass the
  /// returned <code>CreateAccountStatus</code> ID as a parameter to
  /// <a>DescribeCreateAccountStatus</a> to get status about the progress of the
  /// request at later times. You can also check the AWS CloudTrail log for the
  /// <code>CreateAccountResult</code> event. For more information, see <a
  /// href="http://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html">Monitoring
  /// the Activity in Your Organization</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'CreateAccountStatus')
  final CreateAccountStatus createAccountStatus;

  CreateAccountResponse({
    this.createAccountStatus,
  });
  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResponseFromJson(json);
}

enum CreateAccountState {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

extension on CreateAccountState {
  String toValue() {
    switch (this) {
      case CreateAccountState.inProgress:
        return 'IN_PROGRESS';
      case CreateAccountState.succeeded:
        return 'SUCCEEDED';
      case CreateAccountState.failed:
        return 'FAILED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the status about a <a>CreateAccount</a> or
/// <a>CreateGovCloudAccount</a> request to create an AWS account or an AWS
/// GovCloud (US) account in an organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAccountStatus {
  /// If the account was created successfully, the unique identifier (ID) of the
  /// new account.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// account ID string requires exactly 12 digits.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The account name given to the account when it was created.
  @_s.JsonKey(name: 'AccountName')
  final String accountName;

  /// The date and time that the account was created and the request completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletedTimestamp')
  final DateTime completedTimestamp;

  /// If the request failed, a description of the reason for the failure.
  ///
  /// <ul>
  /// <li>
  /// ACCOUNT_LIMIT_EXCEEDED: The account could not be created because you have
  /// reached the limit on the number of accounts in your organization.
  /// </li>
  /// <li>
  /// CONCURRENT_ACCOUNT_MODIFICATION: You already submitted a request with the
  /// same information.
  /// </li>
  /// <li>
  /// EMAIL_ALREADY_EXISTS: The account could not be created because another AWS
  /// account with that email address already exists.
  /// </li>
  /// <li>
  /// GOVCLOUD_ACCOUNT_ALREADY_EXISTS: The account in the AWS GovCloud (US) Region
  /// could not be created because this Region already includes an account with
  /// that email address.
  /// </li>
  /// <li>
  /// INVALID_ADDRESS: The account could not be created because the address you
  /// provided is not valid.
  /// </li>
  /// <li>
  /// INVALID_EMAIL: The account could not be created because the email address
  /// you provided is not valid.
  /// </li>
  /// <li>
  /// INTERNAL_FAILURE: The account could not be created because of an internal
  /// failure. Try again later. If the problem persists, contact Customer Support.
  /// </li>
  /// <li>
  /// MISSING_BUSINESS_VALIDATION: The AWS account that owns your organization has
  /// not received Business Validation.
  /// </li>
  /// <li>
  /// MISSING_PAYMENT_INSTRUMENT: You must configure the management account with a
  /// valid payment method, such as a credit card.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FailureReason')
  final CreateAccountFailureReason failureReason;

  /// If the account was created successfully, the unique identifier (ID) of the
  /// new account in the AWS GovCloud (US) Region.
  @_s.JsonKey(name: 'GovCloudAccountId')
  final String govCloudAccountId;

  /// The unique identifier (ID) that references this request. You get this value
  /// from the response of the initial <a>CreateAccount</a> request to create the
  /// account.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a create
  /// account request ID string requires "car-" followed by from 8 to 32 lowercase
  /// letters or digits.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time that the request was made for the account creation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RequestedTimestamp')
  final DateTime requestedTimestamp;

  /// The status of the request.
  @_s.JsonKey(name: 'State')
  final CreateAccountState state;

  CreateAccountStatus({
    this.accountId,
    this.accountName,
    this.completedTimestamp,
    this.failureReason,
    this.govCloudAccountId,
    this.id,
    this.requestedTimestamp,
    this.state,
  });
  factory CreateAccountStatus.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountStatusFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGovCloudAccountResponse {
  @_s.JsonKey(name: 'CreateAccountStatus')
  final CreateAccountStatus createAccountStatus;

  CreateGovCloudAccountResponse({
    this.createAccountStatus,
  });
  factory CreateGovCloudAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGovCloudAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOrganizationResponse {
  /// A structure that contains details about the newly created organization.
  @_s.JsonKey(name: 'Organization')
  final Organization organization;

  CreateOrganizationResponse({
    this.organization,
  });
  factory CreateOrganizationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOrganizationalUnitResponse {
  /// A structure that contains details about the newly created OU.
  @_s.JsonKey(name: 'OrganizationalUnit')
  final OrganizationalUnit organizationalUnit;

  CreateOrganizationalUnitResponse({
    this.organizationalUnit,
  });
  factory CreateOrganizationalUnitResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateOrganizationalUnitResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePolicyResponse {
  /// A structure that contains details about the newly created policy.
  @_s.JsonKey(name: 'Policy')
  final Policy policy;

  CreatePolicyResponse({
    this.policy,
  });
  factory CreatePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeclineHandshakeResponse {
  /// A structure that contains details about the declined handshake. The state is
  /// updated to show the value <code>DECLINED</code>.
  @_s.JsonKey(name: 'Handshake')
  final Handshake handshake;

  DeclineHandshakeResponse({
    this.handshake,
  });
  factory DeclineHandshakeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeclineHandshakeResponseFromJson(json);
}

/// Contains information about the delegated administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DelegatedAdministrator {
  /// The Amazon Resource Name (ARN) of the delegated administrator's account.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date when the account was made a delegated administrator.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DelegationEnabledDate')
  final DateTime delegationEnabledDate;

  /// The email address that is associated with the delegated administrator's AWS
  /// account.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The unique identifier (ID) of the delegated administrator's account.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The method by which the delegated administrator's account joined the
  /// organization.
  @_s.JsonKey(name: 'JoinedMethod')
  final AccountJoinedMethod joinedMethod;

  /// The date when the delegated administrator's account became a part of the
  /// organization.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'JoinedTimestamp')
  final DateTime joinedTimestamp;

  /// The friendly name of the delegated administrator's account.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of the delegated administrator's account in the organization.
  @_s.JsonKey(name: 'Status')
  final AccountStatus status;

  DelegatedAdministrator({
    this.arn,
    this.delegationEnabledDate,
    this.email,
    this.id,
    this.joinedMethod,
    this.joinedTimestamp,
    this.name,
    this.status,
  });
  factory DelegatedAdministrator.fromJson(Map<String, dynamic> json) =>
      _$DelegatedAdministratorFromJson(json);
}

/// Contains information about the AWS service for which the account is a
/// delegated administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DelegatedService {
  /// The date that the account became a delegated administrator for this service.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DelegationEnabledDate')
  final DateTime delegationEnabledDate;

  /// The name of a service that can request an operation for the specified
  /// service. This is typically in the form of a URL, such as: <code>
  /// <i>servicename</i>.amazonaws.com</code>.
  @_s.JsonKey(name: 'ServicePrincipal')
  final String servicePrincipal;

  DelegatedService({
    this.delegationEnabledDate,
    this.servicePrincipal,
  });
  factory DelegatedService.fromJson(Map<String, dynamic> json) =>
      _$DelegatedServiceFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountResponse {
  /// A structure that contains information about the requested account.
  @_s.JsonKey(name: 'Account')
  final Account account;

  DescribeAccountResponse({
    this.account,
  });
  factory DescribeAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCreateAccountStatusResponse {
  /// A structure that contains the current status of an account creation request.
  @_s.JsonKey(name: 'CreateAccountStatus')
  final CreateAccountStatus createAccountStatus;

  DescribeCreateAccountStatusResponse({
    this.createAccountStatus,
  });
  factory DescribeCreateAccountStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCreateAccountStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEffectivePolicyResponse {
  /// The contents of the effective policy.
  @_s.JsonKey(name: 'EffectivePolicy')
  final EffectivePolicy effectivePolicy;

  DescribeEffectivePolicyResponse({
    this.effectivePolicy,
  });
  factory DescribeEffectivePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEffectivePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHandshakeResponse {
  /// A structure that contains information about the specified handshake.
  @_s.JsonKey(name: 'Handshake')
  final Handshake handshake;

  DescribeHandshakeResponse({
    this.handshake,
  });
  factory DescribeHandshakeResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeHandshakeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationResponse {
  /// A structure that contains information about the organization.
  /// <important>
  /// The <code>AvailablePolicyTypes</code> part of the response is deprecated,
  /// and you shouldn't use it in your apps. It doesn't include any policy type
  /// supported by Organizations other than SCPs. To determine which policy types
  /// are enabled in your organization, use the <code> <a>ListRoots</a> </code>
  /// operation.
  /// </important>
  @_s.JsonKey(name: 'Organization')
  final Organization organization;

  DescribeOrganizationResponse({
    this.organization,
  });
  factory DescribeOrganizationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationalUnitResponse {
  /// A structure that contains details about the specified OU.
  @_s.JsonKey(name: 'OrganizationalUnit')
  final OrganizationalUnit organizationalUnit;

  DescribeOrganizationalUnitResponse({
    this.organizationalUnit,
  });
  factory DescribeOrganizationalUnitResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationalUnitResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePolicyResponse {
  /// A structure that contains details about the specified policy.
  @_s.JsonKey(name: 'Policy')
  final Policy policy;

  DescribePolicyResponse({
    this.policy,
  });
  factory DescribePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisablePolicyTypeResponse {
  /// A structure that shows the root with the updated list of enabled policy
  /// types.
  @_s.JsonKey(name: 'Root')
  final Root root;

  DisablePolicyTypeResponse({
    this.root,
  });
  factory DisablePolicyTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$DisablePolicyTypeResponseFromJson(json);
}

/// Contains rules to be applied to the affected accounts. The effective policy
/// is the aggregation of any policies the account inherits, plus any policy
/// directly attached to the account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EffectivePolicy {
  /// The time of the last update to this policy.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The text content of the policy.
  @_s.JsonKey(name: 'PolicyContent')
  final String policyContent;

  /// The policy type.
  @_s.JsonKey(name: 'PolicyType')
  final EffectivePolicyType policyType;

  /// The account ID of the policy target.
  @_s.JsonKey(name: 'TargetId')
  final String targetId;

  EffectivePolicy({
    this.lastUpdatedTimestamp,
    this.policyContent,
    this.policyType,
    this.targetId,
  });
  factory EffectivePolicy.fromJson(Map<String, dynamic> json) =>
      _$EffectivePolicyFromJson(json);
}

enum EffectivePolicyType {
  @_s.JsonValue('TAG_POLICY')
  tagPolicy,
  @_s.JsonValue('BACKUP_POLICY')
  backupPolicy,
  @_s.JsonValue('AISERVICES_OPT_OUT_POLICY')
  aiservicesOptOutPolicy,
}

extension on EffectivePolicyType {
  String toValue() {
    switch (this) {
      case EffectivePolicyType.tagPolicy:
        return 'TAG_POLICY';
      case EffectivePolicyType.backupPolicy:
        return 'BACKUP_POLICY';
      case EffectivePolicyType.aiservicesOptOutPolicy:
        return 'AISERVICES_OPT_OUT_POLICY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableAllFeaturesResponse {
  /// A structure that contains details about the handshake created to support
  /// this request to enable all features in the organization.
  @_s.JsonKey(name: 'Handshake')
  final Handshake handshake;

  EnableAllFeaturesResponse({
    this.handshake,
  });
  factory EnableAllFeaturesResponse.fromJson(Map<String, dynamic> json) =>
      _$EnableAllFeaturesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnablePolicyTypeResponse {
  /// A structure that shows the root with the updated list of enabled policy
  /// types.
  @_s.JsonKey(name: 'Root')
  final Root root;

  EnablePolicyTypeResponse({
    this.root,
  });
  factory EnablePolicyTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$EnablePolicyTypeResponseFromJson(json);
}

/// A structure that contains details of a service principal that represents an
/// AWS service that is enabled to integrate with AWS Organizations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnabledServicePrincipal {
  /// The date that the service principal was enabled for integration with AWS
  /// Organizations.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DateEnabled')
  final DateTime dateEnabled;

  /// The name of the service principal. This is typically in the form of a URL,
  /// such as: <code> <i>servicename</i>.amazonaws.com</code>.
  @_s.JsonKey(name: 'ServicePrincipal')
  final String servicePrincipal;

  EnabledServicePrincipal({
    this.dateEnabled,
    this.servicePrincipal,
  });
  factory EnabledServicePrincipal.fromJson(Map<String, dynamic> json) =>
      _$EnabledServicePrincipalFromJson(json);
}

/// Contains information that must be exchanged to securely establish a
/// relationship between two accounts (an <i>originator</i> and a
/// <i>recipient</i>). For example, when a management account (the originator)
/// invites another account (the recipient) to join its organization, the two
/// accounts exchange information as a series of handshake requests and
/// responses.
///
/// <b>Note:</b> Handshakes that are CANCELED, ACCEPTED, or DECLINED show up in
/// lists for only 30 days after entering that state After that they are
/// deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Handshake {
  /// The type of handshake, indicating what action occurs when the recipient
  /// accepts the handshake. The following handshake types are supported:
  ///
  /// <ul>
  /// <li>
  /// <b>INVITE</b>: This type of handshake represents a request to join an
  /// organization. It is always sent from the management account to only
  /// non-member accounts.
  /// </li>
  /// <li>
  /// <b>ENABLE_ALL_FEATURES</b>: This type of handshake represents a request to
  /// enable all features in an organization. It is always sent from the
  /// management account to only <i>invited</i> member accounts. Created accounts
  /// do not receive this because those accounts were created by the
  /// organization's management account and approval is inferred.
  /// </li>
  /// <li>
  /// <b>APPROVE_ALL_FEATURES</b>: This type of handshake is sent from the
  /// Organizations service when all member accounts have approved the
  /// <code>ENABLE_ALL_FEATURES</code> invitation. It is sent only to the
  /// management account and signals the master that it can finalize the process
  /// to enable all features.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Action')
  final ActionType action;

  /// The Amazon Resource Name (ARN) of a handshake.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time that the handshake expires. If the recipient of the
  /// handshake request fails to respond before the specified date and time, the
  /// handshake becomes inactive and is no longer valid.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationTimestamp')
  final DateTime expirationTimestamp;

  /// The unique identifier (ID) of a handshake. The originating account creates
  /// the ID when it initiates the handshake.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for
  /// handshake ID string requires "h-" followed by from 8 to 32 lowercase letters
  /// or digits.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information about the two accounts that are participating in the handshake.
  @_s.JsonKey(name: 'Parties')
  final List<HandshakeParty> parties;

  /// The date and time that the handshake request was made.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RequestedTimestamp')
  final DateTime requestedTimestamp;

  /// Additional information that is needed to process the handshake.
  @_s.JsonKey(name: 'Resources')
  final List<HandshakeResource> resources;

  /// The current state of the handshake. Use the state to trace the flow of the
  /// handshake through the process from its creation to its acceptance. The
  /// meaning of each of the valid values is as follows:
  ///
  /// <ul>
  /// <li>
  /// <b>REQUESTED</b>: This handshake was sent to multiple recipients (applicable
  /// to only some handshake types) and not all recipients have responded yet. The
  /// request stays in this state until all recipients respond.
  /// </li>
  /// <li>
  /// <b>OPEN</b>: This handshake was sent to multiple recipients (applicable to
  /// only some policy types) and all recipients have responded, allowing the
  /// originator to complete the handshake action.
  /// </li>
  /// <li>
  /// <b>CANCELED</b>: This handshake is no longer active because it was canceled
  /// by the originating account.
  /// </li>
  /// <li>
  /// <b>ACCEPTED</b>: This handshake is complete because it has been accepted by
  /// the recipient.
  /// </li>
  /// <li>
  /// <b>DECLINED</b>: This handshake is no longer active because it was declined
  /// by the recipient account.
  /// </li>
  /// <li>
  /// <b>EXPIRED</b>: This handshake is no longer active because the originator
  /// did not receive a response of any kind from the recipient before the
  /// expiration time (15 days).
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'State')
  final HandshakeState state;

  Handshake({
    this.action,
    this.arn,
    this.expirationTimestamp,
    this.id,
    this.parties,
    this.requestedTimestamp,
    this.resources,
    this.state,
  });
  factory Handshake.fromJson(Map<String, dynamic> json) =>
      _$HandshakeFromJson(json);
}

/// Specifies the criteria that are used to select the handshakes for the
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HandshakeFilter {
  /// Specifies the type of handshake action.
  ///
  /// If you specify <code>ActionType</code>, you cannot also specify
  /// <code>ParentHandshakeId</code>.
  @_s.JsonKey(name: 'ActionType')
  final ActionType actionType;

  /// Specifies the parent handshake. Only used for handshake types that are a
  /// child of another type.
  ///
  /// If you specify <code>ParentHandshakeId</code>, you cannot also specify
  /// <code>ActionType</code>.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for
  /// handshake ID string requires "h-" followed by from 8 to 32 lowercase letters
  /// or digits.
  @_s.JsonKey(name: 'ParentHandshakeId')
  final String parentHandshakeId;

  HandshakeFilter({
    this.actionType,
    this.parentHandshakeId,
  });
  Map<String, dynamic> toJson() => _$HandshakeFilterToJson(this);
}

/// Identifies a participant in a handshake.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HandshakeParty {
  /// The unique identifier (ID) for the party.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for
  /// handshake ID string requires "h-" followed by from 8 to 32 lowercase letters
  /// or digits.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of party.
  @_s.JsonKey(name: 'Type')
  final HandshakePartyType type;

  HandshakeParty({
    @_s.required this.id,
    @_s.required this.type,
  });
  factory HandshakeParty.fromJson(Map<String, dynamic> json) =>
      _$HandshakePartyFromJson(json);

  Map<String, dynamic> toJson() => _$HandshakePartyToJson(this);
}

enum HandshakePartyType {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('ORGANIZATION')
  organization,
  @_s.JsonValue('EMAIL')
  email,
}

/// Contains additional data that is needed to process a handshake.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HandshakeResource {
  /// When needed, contains an additional array of <code>HandshakeResource</code>
  /// objects.
  @_s.JsonKey(name: 'Resources')
  final List<HandshakeResource> resources;

  /// The type of information being passed, specifying how the value is to be
  /// interpreted by the other party:
  ///
  /// <ul>
  /// <li>
  /// <code>ACCOUNT</code> - Specifies an AWS account ID number.
  /// </li>
  /// <li>
  /// <code>ORGANIZATION</code> - Specifies an organization ID number.
  /// </li>
  /// <li>
  /// <code>EMAIL</code> - Specifies the email address that is associated with the
  /// account that receives the handshake.
  /// </li>
  /// <li>
  /// <code>OWNER_EMAIL</code> - Specifies the email address associated with the
  /// management account. Included as information about an organization.
  /// </li>
  /// <li>
  /// <code>OWNER_NAME</code> - Specifies the name associated with the management
  /// account. Included as information about an organization.
  /// </li>
  /// <li>
  /// <code>NOTES</code> - Additional text provided by the handshake initiator and
  /// intended for the recipient to read.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final HandshakeResourceType type;

  /// The information that is passed to the other party in the handshake. The
  /// format of the value string must match the requirements of the specified
  /// type.
  @_s.JsonKey(name: 'Value')
  final String value;

  HandshakeResource({
    this.resources,
    this.type,
    this.value,
  });
  factory HandshakeResource.fromJson(Map<String, dynamic> json) =>
      _$HandshakeResourceFromJson(json);
}

enum HandshakeResourceType {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('ORGANIZATION')
  organization,
  @_s.JsonValue('ORGANIZATION_FEATURE_SET')
  organizationFeatureSet,
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('MASTER_EMAIL')
  masterEmail,
  @_s.JsonValue('MASTER_NAME')
  masterName,
  @_s.JsonValue('NOTES')
  notes,
  @_s.JsonValue('PARENT_HANDSHAKE')
  parentHandshake,
}

enum HandshakeState {
  @_s.JsonValue('REQUESTED')
  requested,
  @_s.JsonValue('OPEN')
  open,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('ACCEPTED')
  accepted,
  @_s.JsonValue('DECLINED')
  declined,
  @_s.JsonValue('EXPIRED')
  expired,
}

enum IAMUserAccessToBilling {
  @_s.JsonValue('ALLOW')
  allow,
  @_s.JsonValue('DENY')
  deny,
}

extension on IAMUserAccessToBilling {
  String toValue() {
    switch (this) {
      case IAMUserAccessToBilling.allow:
        return 'ALLOW';
      case IAMUserAccessToBilling.deny:
        return 'DENY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InviteAccountToOrganizationResponse {
  /// A structure that contains details about the handshake that is created to
  /// support this invitation request.
  @_s.JsonKey(name: 'Handshake')
  final Handshake handshake;

  InviteAccountToOrganizationResponse({
    this.handshake,
  });
  factory InviteAccountToOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$InviteAccountToOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAWSServiceAccessForOrganizationResponse {
  /// A list of the service principals for the services that are enabled to
  /// integrate with your organization. Each principal is a structure that
  /// includes the name and the date that it was enabled for integration with AWS
  /// Organizations.
  @_s.JsonKey(name: 'EnabledServicePrincipals')
  final List<EnabledServicePrincipal> enabledServicePrincipals;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAWSServiceAccessForOrganizationResponse({
    this.enabledServicePrincipals,
    this.nextToken,
  });
  factory ListAWSServiceAccessForOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAWSServiceAccessForOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountsForParentResponse {
  /// A list of the accounts in the specified root or OU.
  @_s.JsonKey(name: 'Accounts')
  final List<Account> accounts;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountsForParentResponse({
    this.accounts,
    this.nextToken,
  });
  factory ListAccountsForParentResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccountsForParentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountsResponse {
  /// A list of objects in the organization.
  @_s.JsonKey(name: 'Accounts')
  final List<Account> accounts;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountsResponse({
    this.accounts,
    this.nextToken,
  });
  factory ListAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChildrenResponse {
  /// The list of children of the specified parent container.
  @_s.JsonKey(name: 'Children')
  final List<Child> children;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChildrenResponse({
    this.children,
    this.nextToken,
  });
  factory ListChildrenResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChildrenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCreateAccountStatusResponse {
  /// A list of objects with details about the requests. Certain elements, such as
  /// the accountId number, are present in the output only after the account has
  /// been successfully created.
  @_s.JsonKey(name: 'CreateAccountStatuses')
  final List<CreateAccountStatus> createAccountStatuses;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCreateAccountStatusResponse({
    this.createAccountStatuses,
    this.nextToken,
  });
  factory ListCreateAccountStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCreateAccountStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDelegatedAdministratorsResponse {
  /// The list of delegated administrators in your organization.
  @_s.JsonKey(name: 'DelegatedAdministrators')
  final List<DelegatedAdministrator> delegatedAdministrators;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDelegatedAdministratorsResponse({
    this.delegatedAdministrators,
    this.nextToken,
  });
  factory ListDelegatedAdministratorsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDelegatedAdministratorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDelegatedServicesForAccountResponse {
  /// The services for which the account is a delegated administrator.
  @_s.JsonKey(name: 'DelegatedServices')
  final List<DelegatedService> delegatedServices;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDelegatedServicesForAccountResponse({
    this.delegatedServices,
    this.nextToken,
  });
  factory ListDelegatedServicesForAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDelegatedServicesForAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHandshakesForAccountResponse {
  /// A list of <a>Handshake</a> objects with details about each of the handshakes
  /// that is associated with the specified account.
  @_s.JsonKey(name: 'Handshakes')
  final List<Handshake> handshakes;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHandshakesForAccountResponse({
    this.handshakes,
    this.nextToken,
  });
  factory ListHandshakesForAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListHandshakesForAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHandshakesForOrganizationResponse {
  /// A list of <a>Handshake</a> objects with details about each of the handshakes
  /// that are associated with an organization.
  @_s.JsonKey(name: 'Handshakes')
  final List<Handshake> handshakes;

  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHandshakesForOrganizationResponse({
    this.handshakes,
    this.nextToken,
  });
  factory ListHandshakesForOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListHandshakesForOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOrganizationalUnitsForParentResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the OUs in the specified root or parent OU.
  @_s.JsonKey(name: 'OrganizationalUnits')
  final List<OrganizationalUnit> organizationalUnits;

  ListOrganizationalUnitsForParentResponse({
    this.nextToken,
    this.organizationalUnits,
  });
  factory ListOrganizationalUnitsForParentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListOrganizationalUnitsForParentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListParentsResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of parents for the specified child account or OU.
  @_s.JsonKey(name: 'Parents')
  final List<Parent> parents;

  ListParentsResponse({
    this.nextToken,
    this.parents,
  });
  factory ListParentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListParentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPoliciesForTargetResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of policies that match the criteria in the request.
  @_s.JsonKey(name: 'Policies')
  final List<PolicySummary> policies;

  ListPoliciesForTargetResponse({
    this.nextToken,
    this.policies,
  });
  factory ListPoliciesForTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPoliciesForTargetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPoliciesResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of policies that match the filter criteria in the request. The output
  /// list doesn't include the policy contents. To see the content for a policy,
  /// see <a>DescribePolicy</a>.
  @_s.JsonKey(name: 'Policies')
  final List<PolicySummary> policies;

  ListPoliciesResponse({
    this.nextToken,
    this.policies,
  });
  factory ListPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRootsResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of roots that are defined in an organization.
  @_s.JsonKey(name: 'Roots')
  final List<Root> roots;

  ListRootsResponse({
    this.nextToken,
    this.roots,
  });
  factory ListRootsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRootsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The tags that are assigned to the resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTargetsForPolicyResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of structures, each of which contains details about one of the
  /// entities to which the specified policy is attached.
  @_s.JsonKey(name: 'Targets')
  final List<PolicyTargetSummary> targets;

  ListTargetsForPolicyResponse({
    this.nextToken,
    this.targets,
  });
  factory ListTargetsForPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTargetsForPolicyResponseFromJson(json);
}

/// Contains details about an organization. An organization is a collection of
/// accounts that are centrally managed together using consolidated billing,
/// organized hierarchically with organizational units (OUs), and controlled
/// with policies .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Organization {
  /// The Amazon Resource Name (ARN) of an organization.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// <important>
  /// Do not use. This field is deprecated and doesn't provide complete
  /// information about the policies in your organization.
  /// </important>
  /// To determine the policies that are enabled and available for use in your
  /// organization, use the <a>ListRoots</a> operation instead.
  @_s.JsonKey(name: 'AvailablePolicyTypes')
  final List<PolicyTypeSummary> availablePolicyTypes;

  /// Specifies the functionality that currently is available to the organization.
  /// If set to "ALL", then all features are enabled and policies can be applied
  /// to accounts in the organization. If set to "CONSOLIDATED_BILLING", then only
  /// consolidated billing functionality is available. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">Enabling
  /// All Features in Your Organization</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'FeatureSet')
  final OrganizationFeatureSet featureSet;

  /// The unique identifier (ID) of an organization.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// organization ID string requires "o-" followed by from 10 to 32 lowercase
  /// letters or digits.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The Amazon Resource Name (ARN) of the account that is designated as the
  /// management account for the organization.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'MasterAccountArn')
  final String masterAccountArn;

  /// The email address that is associated with the AWS account that is designated
  /// as the management account for the organization.
  @_s.JsonKey(name: 'MasterAccountEmail')
  final String masterAccountEmail;

  /// The unique identifier (ID) of the management account of an organization.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// account ID string requires exactly 12 digits.
  @_s.JsonKey(name: 'MasterAccountId')
  final String masterAccountId;

  Organization({
    this.arn,
    this.availablePolicyTypes,
    this.featureSet,
    this.id,
    this.masterAccountArn,
    this.masterAccountEmail,
    this.masterAccountId,
  });
  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}

enum OrganizationFeatureSet {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('CONSOLIDATED_BILLING')
  consolidatedBilling,
}

extension on OrganizationFeatureSet {
  String toValue() {
    switch (this) {
      case OrganizationFeatureSet.all:
        return 'ALL';
      case OrganizationFeatureSet.consolidatedBilling:
        return 'CONSOLIDATED_BILLING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains details about an organizational unit (OU). An OU is a container of
/// AWS accounts within a root of an organization. Policies that are attached to
/// an OU apply to all accounts contained in that OU and in any child OUs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationalUnit {
  /// The Amazon Resource Name (ARN) of this OU.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The unique identifier (ID) associated with this OU.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for an
  /// organizational unit ID string requires "ou-" followed by from 4 to 32
  /// lowercase letters or digits (the ID of the root that contains the OU). This
  /// string is followed by a second "-" dash and from 8 to 32 additional
  /// lowercase letters or digits.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The friendly name of this OU.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used
  /// to validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  @_s.JsonKey(name: 'Name')
  final String name;

  OrganizationalUnit({
    this.arn,
    this.id,
    this.name,
  });
  factory OrganizationalUnit.fromJson(Map<String, dynamic> json) =>
      _$OrganizationalUnitFromJson(json);
}

/// Contains information about either a root or an organizational unit (OU) that
/// can contain OUs or accounts in an organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Parent {
  /// The unique identifier (ID) of the parent entity.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a parent
  /// ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the OU
  /// is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of the parent entity.
  @_s.JsonKey(name: 'Type')
  final ParentType type;

  Parent({
    this.id,
    this.type,
  });
  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
}

enum ParentType {
  @_s.JsonValue('ROOT')
  root,
  @_s.JsonValue('ORGANIZATIONAL_UNIT')
  organizationalUnit,
}

/// Contains rules to be applied to the affected accounts. Policies can be
/// attached directly to accounts, or to roots and OUs to affect all accounts in
/// those hierarchies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Policy {
  /// The text content of the policy.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// A structure that contains additional details about the policy.
  @_s.JsonKey(name: 'PolicySummary')
  final PolicySummary policySummary;

  Policy({
    this.content,
    this.policySummary,
  });
  factory Policy.fromJson(Map<String, dynamic> json) => _$PolicyFromJson(json);
}

/// Contains information about a policy, but does not include the content. To
/// see the content of a policy, see <a>DescribePolicy</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicySummary {
  /// The Amazon Resource Name (ARN) of the policy.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// A boolean value that indicates whether the specified policy is an AWS
  /// managed policy. If true, then you can attach the policy to roots, OUs, or
  /// accounts, but you cannot edit it.
  @_s.JsonKey(name: 'AwsManaged')
  final bool awsManaged;

  /// The description of the policy.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier (ID) of the policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a policy
  /// ID string requires "p-" followed by from 8 to 128 lowercase or uppercase
  /// letters, digits, or the underscore character (_).
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The friendly name of the policy.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used
  /// to validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of policy.
  @_s.JsonKey(name: 'Type')
  final PolicyType type;

  PolicySummary({
    this.arn,
    this.awsManaged,
    this.description,
    this.id,
    this.name,
    this.type,
  });
  factory PolicySummary.fromJson(Map<String, dynamic> json) =>
      _$PolicySummaryFromJson(json);
}

/// Contains information about a root, OU, or account that a policy is attached
/// to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyTargetSummary {
  /// The Amazon Resource Name (ARN) of the policy target.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The friendly name of the policy target.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used
  /// to validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier (ID) of the policy target.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a target
  /// ID string requires one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Root</b> - A string that begins with "r-" followed by from 4 to 32
  /// lowercase letters or digits.
  /// </li>
  /// <li>
  /// <b>Account</b> - A string that consists of exactly 12 digits.
  /// </li>
  /// <li>
  /// <b>Organizational unit (OU)</b> - A string that begins with "ou-" followed
  /// by from 4 to 32 lowercase letters or digits (the ID of the root that the OU
  /// is in). This string is followed by a second "-" dash and from 8 to 32
  /// additional lowercase letters or digits.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TargetId')
  final String targetId;

  /// The type of the policy target.
  @_s.JsonKey(name: 'Type')
  final TargetType type;

  PolicyTargetSummary({
    this.arn,
    this.name,
    this.targetId,
    this.type,
  });
  factory PolicyTargetSummary.fromJson(Map<String, dynamic> json) =>
      _$PolicyTargetSummaryFromJson(json);
}

enum PolicyType {
  @_s.JsonValue('SERVICE_CONTROL_POLICY')
  serviceControlPolicy,
  @_s.JsonValue('TAG_POLICY')
  tagPolicy,
  @_s.JsonValue('BACKUP_POLICY')
  backupPolicy,
  @_s.JsonValue('AISERVICES_OPT_OUT_POLICY')
  aiservicesOptOutPolicy,
}

extension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.serviceControlPolicy:
        return 'SERVICE_CONTROL_POLICY';
      case PolicyType.tagPolicy:
        return 'TAG_POLICY';
      case PolicyType.backupPolicy:
        return 'BACKUP_POLICY';
      case PolicyType.aiservicesOptOutPolicy:
        return 'AISERVICES_OPT_OUT_POLICY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PolicyTypeStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('PENDING_ENABLE')
  pendingEnable,
  @_s.JsonValue('PENDING_DISABLE')
  pendingDisable,
}

/// Contains information about a policy type and its status in the associated
/// root.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyTypeSummary {
  /// The status of the policy type as it relates to the associated root. To
  /// attach a policy of the specified type to a root or to an OU or account in
  /// that root, it must be available in the organization and enabled for that
  /// root.
  @_s.JsonKey(name: 'Status')
  final PolicyTypeStatus status;

  /// The name of the policy type.
  @_s.JsonKey(name: 'Type')
  final PolicyType type;

  PolicyTypeSummary({
    this.status,
    this.type,
  });
  factory PolicyTypeSummary.fromJson(Map<String, dynamic> json) =>
      _$PolicyTypeSummaryFromJson(json);
}

/// Contains details about a root. A root is a top-level parent node in the
/// hierarchy of an organization that can contain organizational units (OUs) and
/// accounts. The root contains every AWS account in the organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Root {
  /// The Amazon Resource Name (ARN) of the root.
  ///
  /// For more information about ARNs in Organizations, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_permissions.html#orgs-permissions-arns">ARN
  /// Formats Supported by Organizations</a> in the <i>AWS Organizations User
  /// Guide</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The unique identifier (ID) for the root.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> for a root
  /// ID string requires "r-" followed by from 4 to 32 lowercase letters or
  /// digits.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The friendly name of the root.
  ///
  /// The <a href="http://wikipedia.org/wiki/regex">regex pattern</a> that is used
  /// to validate this parameter is a string of any of the characters in the ASCII
  /// character range.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The types of policies that are currently enabled for the root and therefore
  /// can be attached to the root or to its OUs or accounts.
  /// <note>
  /// Even if a policy type is shown as available in the organization, you can
  /// separately enable and disable them at the root level by using
  /// <a>EnablePolicyType</a> and <a>DisablePolicyType</a>. Use
  /// <a>DescribeOrganization</a> to see the availability of the policy types in
  /// that organization.
  /// </note>
  @_s.JsonKey(name: 'PolicyTypes')
  final List<PolicyTypeSummary> policyTypes;

  Root({
    this.arn,
    this.id,
    this.name,
    this.policyTypes,
  });
  factory Root.fromJson(Map<String, dynamic> json) => _$RootFromJson(json);
}

/// A custom key-value pair associated with a resource within your organization.
///
/// You can attach tags to any of the following organization resources.
///
/// <ul>
/// <li>
/// AWS account
/// </li>
/// <li>
/// Organizational unit (OU)
/// </li>
/// <li>
/// Organization root
/// </li>
/// <li>
/// Policy
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key identifier, or name, of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The string value that's associated with the key of the tag. You can set the
  /// value of a tag to an empty string, but you can't set the value of a tag to
  /// null.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

enum TargetType {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('ORGANIZATIONAL_UNIT')
  organizationalUnit,
  @_s.JsonValue('ROOT')
  root,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateOrganizationalUnitResponse {
  /// A structure that contains the details about the specified OU, including its
  /// new name.
  @_s.JsonKey(name: 'OrganizationalUnit')
  final OrganizationalUnit organizationalUnit;

  UpdateOrganizationalUnitResponse({
    this.organizationalUnit,
  });
  factory UpdateOrganizationalUnitResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOrganizationalUnitResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePolicyResponse {
  /// A structure that contains details about the updated policy, showing the
  /// requested changes.
  @_s.JsonKey(name: 'Policy')
  final Policy policy;

  UpdatePolicyResponse({
    this.policy,
  });
  factory UpdatePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePolicyResponseFromJson(json);
}

class AWSOrganizationsNotInUseException extends _s.GenericAwsException {
  AWSOrganizationsNotInUseException({String type, String message})
      : super(
            type: type,
            code: 'AWSOrganizationsNotInUseException',
            message: message);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccessDeniedForDependencyException extends _s.GenericAwsException {
  AccessDeniedForDependencyException({String type, String message})
      : super(
            type: type,
            code: 'AccessDeniedForDependencyException',
            message: message);
}

class AccountAlreadyRegisteredException extends _s.GenericAwsException {
  AccountAlreadyRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'AccountAlreadyRegisteredException',
            message: message);
}

class AccountNotFoundException extends _s.GenericAwsException {
  AccountNotFoundException({String type, String message})
      : super(type: type, code: 'AccountNotFoundException', message: message);
}

class AccountNotRegisteredException extends _s.GenericAwsException {
  AccountNotRegisteredException({String type, String message})
      : super(
            type: type,
            code: 'AccountNotRegisteredException',
            message: message);
}

class AccountOwnerNotVerifiedException extends _s.GenericAwsException {
  AccountOwnerNotVerifiedException({String type, String message})
      : super(
            type: type,
            code: 'AccountOwnerNotVerifiedException',
            message: message);
}

class AlreadyInOrganizationException extends _s.GenericAwsException {
  AlreadyInOrganizationException({String type, String message})
      : super(
            type: type,
            code: 'AlreadyInOrganizationException',
            message: message);
}

class ChildNotFoundException extends _s.GenericAwsException {
  ChildNotFoundException({String type, String message})
      : super(type: type, code: 'ChildNotFoundException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConstraintViolationException extends _s.GenericAwsException {
  ConstraintViolationException({String type, String message})
      : super(
            type: type, code: 'ConstraintViolationException', message: message);
}

class CreateAccountStatusNotFoundException extends _s.GenericAwsException {
  CreateAccountStatusNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'CreateAccountStatusNotFoundException',
            message: message);
}

class DestinationParentNotFoundException extends _s.GenericAwsException {
  DestinationParentNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'DestinationParentNotFoundException',
            message: message);
}

class DuplicateAccountException extends _s.GenericAwsException {
  DuplicateAccountException({String type, String message})
      : super(type: type, code: 'DuplicateAccountException', message: message);
}

class DuplicateHandshakeException extends _s.GenericAwsException {
  DuplicateHandshakeException({String type, String message})
      : super(
            type: type, code: 'DuplicateHandshakeException', message: message);
}

class DuplicateOrganizationalUnitException extends _s.GenericAwsException {
  DuplicateOrganizationalUnitException({String type, String message})
      : super(
            type: type,
            code: 'DuplicateOrganizationalUnitException',
            message: message);
}

class DuplicatePolicyAttachmentException extends _s.GenericAwsException {
  DuplicatePolicyAttachmentException({String type, String message})
      : super(
            type: type,
            code: 'DuplicatePolicyAttachmentException',
            message: message);
}

class DuplicatePolicyException extends _s.GenericAwsException {
  DuplicatePolicyException({String type, String message})
      : super(type: type, code: 'DuplicatePolicyException', message: message);
}

class EffectivePolicyNotFoundException extends _s.GenericAwsException {
  EffectivePolicyNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'EffectivePolicyNotFoundException',
            message: message);
}

class FinalizingOrganizationException extends _s.GenericAwsException {
  FinalizingOrganizationException({String type, String message})
      : super(
            type: type,
            code: 'FinalizingOrganizationException',
            message: message);
}

class HandshakeAlreadyInStateException extends _s.GenericAwsException {
  HandshakeAlreadyInStateException({String type, String message})
      : super(
            type: type,
            code: 'HandshakeAlreadyInStateException',
            message: message);
}

class HandshakeConstraintViolationException extends _s.GenericAwsException {
  HandshakeConstraintViolationException({String type, String message})
      : super(
            type: type,
            code: 'HandshakeConstraintViolationException',
            message: message);
}

class HandshakeNotFoundException extends _s.GenericAwsException {
  HandshakeNotFoundException({String type, String message})
      : super(type: type, code: 'HandshakeNotFoundException', message: message);
}

class InvalidHandshakeTransitionException extends _s.GenericAwsException {
  InvalidHandshakeTransitionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidHandshakeTransitionException',
            message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String type, String message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class MasterCannotLeaveOrganizationException extends _s.GenericAwsException {
  MasterCannotLeaveOrganizationException({String type, String message})
      : super(
            type: type,
            code: 'MasterCannotLeaveOrganizationException',
            message: message);
}

class OrganizationNotEmptyException extends _s.GenericAwsException {
  OrganizationNotEmptyException({String type, String message})
      : super(
            type: type,
            code: 'OrganizationNotEmptyException',
            message: message);
}

class OrganizationalUnitNotEmptyException extends _s.GenericAwsException {
  OrganizationalUnitNotEmptyException({String type, String message})
      : super(
            type: type,
            code: 'OrganizationalUnitNotEmptyException',
            message: message);
}

class OrganizationalUnitNotFoundException extends _s.GenericAwsException {
  OrganizationalUnitNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'OrganizationalUnitNotFoundException',
            message: message);
}

class ParentNotFoundException extends _s.GenericAwsException {
  ParentNotFoundException({String type, String message})
      : super(type: type, code: 'ParentNotFoundException', message: message);
}

class PolicyChangesInProgressException extends _s.GenericAwsException {
  PolicyChangesInProgressException({String type, String message})
      : super(
            type: type,
            code: 'PolicyChangesInProgressException',
            message: message);
}

class PolicyInUseException extends _s.GenericAwsException {
  PolicyInUseException({String type, String message})
      : super(type: type, code: 'PolicyInUseException', message: message);
}

class PolicyNotAttachedException extends _s.GenericAwsException {
  PolicyNotAttachedException({String type, String message})
      : super(type: type, code: 'PolicyNotAttachedException', message: message);
}

class PolicyNotFoundException extends _s.GenericAwsException {
  PolicyNotFoundException({String type, String message})
      : super(type: type, code: 'PolicyNotFoundException', message: message);
}

class PolicyTypeAlreadyEnabledException extends _s.GenericAwsException {
  PolicyTypeAlreadyEnabledException({String type, String message})
      : super(
            type: type,
            code: 'PolicyTypeAlreadyEnabledException',
            message: message);
}

class PolicyTypeNotAvailableForOrganizationException
    extends _s.GenericAwsException {
  PolicyTypeNotAvailableForOrganizationException({String type, String message})
      : super(
            type: type,
            code: 'PolicyTypeNotAvailableForOrganizationException',
            message: message);
}

class PolicyTypeNotEnabledException extends _s.GenericAwsException {
  PolicyTypeNotEnabledException({String type, String message})
      : super(
            type: type,
            code: 'PolicyTypeNotEnabledException',
            message: message);
}

class RootNotFoundException extends _s.GenericAwsException {
  RootNotFoundException({String type, String message})
      : super(type: type, code: 'RootNotFoundException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String type, String message})
      : super(type: type, code: 'ServiceException', message: message);
}

class SourceParentNotFoundException extends _s.GenericAwsException {
  SourceParentNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'SourceParentNotFoundException',
            message: message);
}

class TargetNotFoundException extends _s.GenericAwsException {
  TargetNotFoundException({String type, String message})
      : super(type: type, code: 'TargetNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnsupportedAPIEndpointException extends _s.GenericAwsException {
  UnsupportedAPIEndpointException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedAPIEndpointException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AWSOrganizationsNotInUseException': (type, message) =>
      AWSOrganizationsNotInUseException(type: type, message: message),
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AccessDeniedForDependencyException': (type, message) =>
      AccessDeniedForDependencyException(type: type, message: message),
  'AccountAlreadyRegisteredException': (type, message) =>
      AccountAlreadyRegisteredException(type: type, message: message),
  'AccountNotFoundException': (type, message) =>
      AccountNotFoundException(type: type, message: message),
  'AccountNotRegisteredException': (type, message) =>
      AccountNotRegisteredException(type: type, message: message),
  'AccountOwnerNotVerifiedException': (type, message) =>
      AccountOwnerNotVerifiedException(type: type, message: message),
  'AlreadyInOrganizationException': (type, message) =>
      AlreadyInOrganizationException(type: type, message: message),
  'ChildNotFoundException': (type, message) =>
      ChildNotFoundException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConstraintViolationException': (type, message) =>
      ConstraintViolationException(type: type, message: message),
  'CreateAccountStatusNotFoundException': (type, message) =>
      CreateAccountStatusNotFoundException(type: type, message: message),
  'DestinationParentNotFoundException': (type, message) =>
      DestinationParentNotFoundException(type: type, message: message),
  'DuplicateAccountException': (type, message) =>
      DuplicateAccountException(type: type, message: message),
  'DuplicateHandshakeException': (type, message) =>
      DuplicateHandshakeException(type: type, message: message),
  'DuplicateOrganizationalUnitException': (type, message) =>
      DuplicateOrganizationalUnitException(type: type, message: message),
  'DuplicatePolicyAttachmentException': (type, message) =>
      DuplicatePolicyAttachmentException(type: type, message: message),
  'DuplicatePolicyException': (type, message) =>
      DuplicatePolicyException(type: type, message: message),
  'EffectivePolicyNotFoundException': (type, message) =>
      EffectivePolicyNotFoundException(type: type, message: message),
  'FinalizingOrganizationException': (type, message) =>
      FinalizingOrganizationException(type: type, message: message),
  'HandshakeAlreadyInStateException': (type, message) =>
      HandshakeAlreadyInStateException(type: type, message: message),
  'HandshakeConstraintViolationException': (type, message) =>
      HandshakeConstraintViolationException(type: type, message: message),
  'HandshakeNotFoundException': (type, message) =>
      HandshakeNotFoundException(type: type, message: message),
  'InvalidHandshakeTransitionException': (type, message) =>
      InvalidHandshakeTransitionException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
  'MasterCannotLeaveOrganizationException': (type, message) =>
      MasterCannotLeaveOrganizationException(type: type, message: message),
  'OrganizationNotEmptyException': (type, message) =>
      OrganizationNotEmptyException(type: type, message: message),
  'OrganizationalUnitNotEmptyException': (type, message) =>
      OrganizationalUnitNotEmptyException(type: type, message: message),
  'OrganizationalUnitNotFoundException': (type, message) =>
      OrganizationalUnitNotFoundException(type: type, message: message),
  'ParentNotFoundException': (type, message) =>
      ParentNotFoundException(type: type, message: message),
  'PolicyChangesInProgressException': (type, message) =>
      PolicyChangesInProgressException(type: type, message: message),
  'PolicyInUseException': (type, message) =>
      PolicyInUseException(type: type, message: message),
  'PolicyNotAttachedException': (type, message) =>
      PolicyNotAttachedException(type: type, message: message),
  'PolicyNotFoundException': (type, message) =>
      PolicyNotFoundException(type: type, message: message),
  'PolicyTypeAlreadyEnabledException': (type, message) =>
      PolicyTypeAlreadyEnabledException(type: type, message: message),
  'PolicyTypeNotAvailableForOrganizationException': (type, message) =>
      PolicyTypeNotAvailableForOrganizationException(
          type: type, message: message),
  'PolicyTypeNotEnabledException': (type, message) =>
      PolicyTypeNotEnabledException(type: type, message: message),
  'RootNotFoundException': (type, message) =>
      RootNotFoundException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'SourceParentNotFoundException': (type, message) =>
      SourceParentNotFoundException(type: type, message: message),
  'TargetNotFoundException': (type, message) =>
      TargetNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnsupportedAPIEndpointException': (type, message) =>
      UnsupportedAPIEndpointException(type: type, message: message),
};
