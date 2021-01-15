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

import '2011-06-15.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

part '2011-06-15.g.dart';

/// AWS Security Token Service (STS) enables you to request temporary,
/// limited-privilege credentials for AWS Identity and Access Management (IAM)
/// users or for users that you authenticate (federated users). This guide
/// provides descriptions of the STS API. For more information about using this
/// service, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html">Temporary
/// Security Credentials</a>.
class Sts {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Sts({
    String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sts',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Returns a set of temporary security credentials that you can use to access
  /// AWS resources that you might not normally have access to. These temporary
  /// credentials consist of an access key ID, a secret access key, and a
  /// security token. Typically, you use <code>AssumeRole</code> within your
  /// account or for cross-account access. For a comparison of
  /// <code>AssumeRole</code> with other API operations that produce temporary
  /// credentials, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html">Requesting
  /// Temporary Security Credentials</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison">Comparing
  /// the AWS STS API operations</a> in the <i>IAM User Guide</i>.
  /// <important>
  /// You cannot use AWS account root user credentials to call
  /// <code>AssumeRole</code>. You must use credentials for an IAM user or an
  /// IAM role to call <code>AssumeRole</code>.
  /// </important>
  /// For cross-account access, imagine that you own multiple accounts and need
  /// to access resources in each account. You could create long-term
  /// credentials in each account to access those resources. However, managing
  /// all those credentials and remembering which one can access which account
  /// can be time consuming. Instead, you can create one set of long-term
  /// credentials in one account. Then use temporary security credentials to
  /// access all the other accounts by assuming roles in those accounts. For
  /// more information about roles, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html">IAM
  /// Roles</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Session Duration</b>
  ///
  /// By default, the temporary security credentials created by
  /// <code>AssumeRole</code> last for one hour. However, you can use the
  /// optional <code>DurationSeconds</code> parameter to specify the duration of
  /// your session. You can provide a value from 900 seconds (15 minutes) up to
  /// the maximum session duration setting for the role. This setting can have a
  /// value from 1 hour to 12 hours. To learn how to view the maximum value for
  /// your role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View
  /// the Maximum Session Duration Setting for a Role</a> in the <i>IAM User
  /// Guide</i>. The maximum session duration limit applies when you use the
  /// <code>AssumeRole*</code> API operations or the <code>assume-role*</code>
  /// CLI commands. However the limit does not apply when you use those
  /// operations to create a console URL. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using
  /// IAM Roles</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Permissions</b>
  ///
  /// The temporary security credentials created by <code>AssumeRole</code> can
  /// be used to make API calls to any AWS service with the following exception:
  /// You cannot call the AWS STS <code>GetFederationToken</code> or
  /// <code>GetSessionToken</code> API operations.
  ///
  /// (Optional) You can pass inline or managed <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session
  /// policies</a> to this operation. You can pass a single JSON policy document
  /// to use as an inline session policy. You can also specify up to 10 managed
  /// policies to use as managed session policies. The plain text that you use
  /// for both inline and managed session policies can't exceed 2,048
  /// characters. Passing policies to this operation returns new temporary
  /// credentials. The resulting session's permissions are the intersection of
  /// the role's identity-based policy and the session policies. You can use the
  /// role's temporary credentials in subsequent AWS API calls to access
  /// resources in the account that owns the role. You cannot use session
  /// policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// To assume a role from a different account, your AWS account must be
  /// trusted by the role. The trust relationship is defined in the role's trust
  /// policy when the role is created. That trust policy states which accounts
  /// are allowed to delegate that access to users in the account.
  ///
  /// A user who wants to access a role in a different account must also have
  /// permissions that are delegated from the user account administrator. The
  /// administrator must attach a policy that allows the user to call
  /// <code>AssumeRole</code> for the ARN of the role in the other account. If
  /// the user is in the same account as the role, then you can do either of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Attach a policy to the user (identical to the previous user in a different
  /// account).
  /// </li>
  /// <li>
  /// Add the user as a principal directly in the role's trust policy.
  /// </li>
  /// </ul>
  /// In this case, the trust policy acts as an IAM resource-based policy. Users
  /// in the same account as the role do not need explicit permission to assume
  /// the role. For more information about trust policies and resource-based
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html">IAM
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Tags</b>
  ///
  /// (Optional) You can pass tag key-value pairs to your session. These tags
  /// are called session tags. For more information about session tags, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Passing
  /// Session Tags in STS</a> in the <i>IAM User Guide</i>.
  ///
  /// An administrator must grant you the permissions necessary to pass session
  /// tags. The administrator can also create granular permissions to allow you
  /// to pass only specific session tags. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html">Tutorial:
  /// Using Tags for Attribute-Based Access Control</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// You can set the session tags as transitive. Transitive tags persist during
  /// role chaining. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining">Chaining
  /// Roles with Session Tags</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Using MFA with AssumeRole</b>
  ///
  /// (Optional) You can include multi-factor authentication (MFA) information
  /// when you call <code>AssumeRole</code>. This is useful for cross-account
  /// scenarios to ensure that the user that assumes the role has been
  /// authenticated with an AWS MFA device. In that scenario, the trust policy
  /// of the role being assumed includes a condition that tests for MFA
  /// authentication. If the caller does not include valid MFA information, the
  /// request to assume the role is denied. The condition in a trust policy that
  /// tests for MFA authentication might look like the following example.
  ///
  /// <code>"Condition": {"Bool": {"aws:MultiFactorAuthPresent": true}}</code>
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/MFAProtectedAPI.html">Configuring
  /// MFA-Protected API Access</a> in the <i>IAM User Guide</i> guide.
  ///
  /// To use MFA with <code>AssumeRole</code>, you pass values for the
  /// <code>SerialNumber</code> and <code>TokenCode</code> parameters. The
  /// <code>SerialNumber</code> value identifies the user's hardware or virtual
  /// MFA device. The <code>TokenCode</code> is the time-based one-time password
  /// (TOTP) that the MFA device produces.
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [PackedPolicyTooLargeException].
  /// May throw [RegionDisabledException].
  /// May throw [ExpiredTokenException].
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role to assume.
  ///
  /// Parameter [roleSessionName] :
  /// An identifier for the assumed role session.
  ///
  /// Use the role session name to uniquely identify a session when the same
  /// role is assumed by different principals or for different reasons. In
  /// cross-account scenarios, the role session name is visible to, and can be
  /// logged by the account that owns the role. The role session name is also
  /// used in the ARN of the assumed role principal. This means that subsequent
  /// cross-account API requests that use the temporary security credentials
  /// will expose the role session name to the external account in their AWS
  /// CloudTrail logs.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// Parameter [durationSeconds] :
  /// The duration, in seconds, of the role session. The value can range from
  /// 900 seconds (15 minutes) up to the maximum session duration setting for
  /// the role. This setting can have a value from 1 hour to 12 hours. If you
  /// specify a value higher than this setting, the operation fails. For
  /// example, if you specify a session duration of 12 hours, but your
  /// administrator set the maximum session duration to 6 hours, your operation
  /// fails. To learn how to view the maximum value for your role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View
  /// the Maximum Session Duration Setting for a Role</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// By default, the value is set to <code>3600</code> seconds.
  /// <note>
  /// The <code>DurationSeconds</code> parameter is separate from the duration
  /// of a console session that you might request using the returned
  /// credentials. The request to the federation endpoint for a console sign-in
  /// token takes a <code>SessionDuration</code> parameter that specifies the
  /// maximum length of the console session. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating
  /// a URL that Enables Federated Users to Access the AWS Management
  /// Console</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// Parameter [externalId] :
  /// A unique identifier that might be required when you assume a role in
  /// another account. If the administrator of the account to which the role
  /// belongs provided you with an external ID, then provide that value in the
  /// <code>ExternalId</code> parameter. This value can be any string, such as a
  /// passphrase or account number. A cross-account role is usually set up to
  /// trust everyone in an account. Therefore, the administrator of the trusting
  /// account might send an external ID to the administrator of the trusted
  /// account. That way, only someone with the ID can assume the role, rather
  /// than everyone in the account. For more information about the external ID,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html">How
  /// to Use an External ID When Granting Access to Your AWS Resources to a
  /// Third Party</a> in the <i>IAM User Guide</i>.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [policy] :
  /// An IAM policy in JSON format that you want to use as an inline session
  /// policy.
  ///
  /// This parameter is optional. Passing policies to this operation returns new
  /// temporary credentials. The resulting session's permissions are the
  /// intersection of the role's identity-based policy and the session policies.
  /// You can use the role's temporary credentials in subsequent AWS API calls
  /// to access resources in the account that owns the role. You cannot use
  /// session policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// can't exceed 2,048 characters. The JSON policy characters can be any ASCII
  /// character from the space character to the end of the valid character list
  /// (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed
  /// (\u000A), and carriage return (\u000D) characters.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  ///
  /// Parameter [policyArns] :
  /// The Amazon Resource Names (ARNs) of the IAM managed policies that you want
  /// to use as managed session policies. The policies must exist in the same
  /// account as the role.
  ///
  /// This parameter is optional. You can provide up to 10 managed policy ARNs.
  /// However, the plain text that you use for both inline and managed session
  /// policies can't exceed 2,048 characters. For more information about ARNs,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General
  /// Reference.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [serialNumber] :
  /// The identification number of the MFA device that is associated with the
  /// user who is making the <code>AssumeRole</code> call. Specify this value if
  /// the trust policy of the role being assumed includes a condition that
  /// requires MFA authentication. The value is either the serial number for a
  /// hardware device (such as <code>GAHT12345678</code>) or an Amazon Resource
  /// Name (ARN) for a virtual device (such as
  /// <code>arn:aws:iam::123456789012:mfa/user</code>).
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// Parameter [tags] :
  /// A list of session tags that you want to pass. Each session tag consists of
  /// a key name and an associated value. For more information about session
  /// tags, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Tagging
  /// AWS STS Sessions</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. You can pass up to 50 session tags. The plain
  /// text session tag keys can’t exceed 128 characters, and the values can’t
  /// exceed 256 characters. For these and additional limits, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM
  /// and STS Character Limits</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  /// You can pass a session tag with the same key as a tag that is already
  /// attached to the role. When you do, session tags override a role tag with
  /// the same key.
  ///
  /// Tag key–value pairs are not case sensitive, but case is preserved. This
  /// means that you cannot have separate <code>Department</code> and
  /// <code>department</code> tag keys. Assume that the role has the
  /// <code>Department</code>=<code>Marketing</code> tag and you pass the
  /// <code>department</code>=<code>engineering</code> session tag.
  /// <code>Department</code> and <code>department</code> are not saved as
  /// separate tags, and the session tag passed in the request takes precedence
  /// over the role tag.
  ///
  /// Additionally, if you used temporary credentials to perform this operation,
  /// the new session inherits any transitive session tags from the calling
  /// session. If you pass a session tag with the same key as an inherited tag,
  /// the operation fails. To view the inherited tags for a session, see the AWS
  /// CloudTrail logs. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/session-tags.html#id_session-tags_ctlogs">Viewing
  /// Session Tags in CloudTrail</a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [tokenCode] :
  /// The value provided by the MFA device, if the trust policy of the role
  /// being assumed requires MFA (that is, if the policy includes a condition
  /// that tests for MFA). If the role being assumed requires MFA and if the
  /// <code>TokenCode</code> value is missing or expired, the
  /// <code>AssumeRole</code> call returns an "access denied" error.
  ///
  /// The format for this parameter, as described by its regex pattern, is a
  /// sequence of six numeric digits.
  ///
  /// Parameter [transitiveTagKeys] :
  /// A list of keys for session tags that you want to set as transitive. If you
  /// set a tag key as transitive, the corresponding key and value passes to
  /// subsequent sessions in a role chain. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining">Chaining
  /// Roles with Session Tags</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. When you set session tags as transitive, the
  /// session policy and session tags packed binary limit is not affected.
  ///
  /// If you choose not to specify a transitive tag key, then no tags are passed
  /// from this session to any subsequent sessions.
  Future<AssumeRoleResponse> assumeRole({
    @_s.required String roleArn,
    @_s.required String roleSessionName,
    int durationSeconds,
    String externalId,
    String policy,
    List<PolicyDescriptorType> policyArns,
    String serialNumber,
    List<Tag> tags,
    String tokenCode,
    List<String> transitiveTagKeys,
  }) async {
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleSessionName, 'roleSessionName');
    _s.validateStringLength(
      'roleSessionName',
      roleSessionName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleSessionName',
      roleSessionName,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    _s.validateStringLength(
      'externalId',
      externalId,
      2,
      1224,
    );
    _s.validateStringPattern(
      'externalId',
      externalId,
      r'''[\w+=,.@:\/-]*''',
    );
    _s.validateStringLength(
      'policy',
      policy,
      1,
      2048,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    _s.validateStringLength(
      'serialNumber',
      serialNumber,
      9,
      256,
    );
    _s.validateStringPattern(
      'serialNumber',
      serialNumber,
      r'''[\w+=/:,.@-]*''',
    );
    _s.validateStringLength(
      'tokenCode',
      tokenCode,
      6,
      6,
    );
    _s.validateStringPattern(
      'tokenCode',
      tokenCode,
      r'''[\d]*''',
    );
    final $request = <String, dynamic>{};
    $request['RoleArn'] = roleArn;
    $request['RoleSessionName'] = roleSessionName;
    durationSeconds?.also((arg) => $request['DurationSeconds'] = arg);
    externalId?.also((arg) => $request['ExternalId'] = arg);
    policy?.also((arg) => $request['Policy'] = arg);
    policyArns?.also((arg) => $request['PolicyArns'] = arg);
    serialNumber?.also((arg) => $request['SerialNumber'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    tokenCode?.also((arg) => $request['TokenCode'] = arg);
    transitiveTagKeys?.also((arg) => $request['TransitiveTagKeys'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AssumeRole',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AssumeRoleRequest'],
      shapes: shapes,
      resultWrapper: 'AssumeRoleResult',
    );
    return AssumeRoleResponse.fromXml($result);
  }

  /// Returns a set of temporary security credentials for users who have been
  /// authenticated via a SAML authentication response. This operation provides
  /// a mechanism for tying an enterprise identity store or directory to
  /// role-based AWS access without user-specific credentials or configuration.
  /// For a comparison of <code>AssumeRoleWithSAML</code> with the other API
  /// operations that produce temporary credentials, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html">Requesting
  /// Temporary Security Credentials</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison">Comparing
  /// the AWS STS API operations</a> in the <i>IAM User Guide</i>.
  ///
  /// The temporary security credentials returned by this operation consist of
  /// an access key ID, a secret access key, and a security token. Applications
  /// can use these temporary security credentials to sign calls to AWS
  /// services.
  ///
  /// <b>Session Duration</b>
  ///
  /// By default, the temporary security credentials created by
  /// <code>AssumeRoleWithSAML</code> last for one hour. However, you can use
  /// the optional <code>DurationSeconds</code> parameter to specify the
  /// duration of your session. Your role session lasts for the duration that
  /// you specify, or until the time specified in the SAML authentication
  /// response's <code>SessionNotOnOrAfter</code> value, whichever is shorter.
  /// You can provide a <code>DurationSeconds</code> value from 900 seconds (15
  /// minutes) up to the maximum session duration setting for the role. This
  /// setting can have a value from 1 hour to 12 hours. To learn how to view the
  /// maximum value for your role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View
  /// the Maximum Session Duration Setting for a Role</a> in the <i>IAM User
  /// Guide</i>. The maximum session duration limit applies when you use the
  /// <code>AssumeRole*</code> API operations or the <code>assume-role*</code>
  /// CLI commands. However the limit does not apply when you use those
  /// operations to create a console URL. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using
  /// IAM Roles</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Permissions</b>
  ///
  /// The temporary security credentials created by
  /// <code>AssumeRoleWithSAML</code> can be used to make API calls to any AWS
  /// service with the following exception: you cannot call the STS
  /// <code>GetFederationToken</code> or <code>GetSessionToken</code> API
  /// operations.
  ///
  /// (Optional) You can pass inline or managed <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session
  /// policies</a> to this operation. You can pass a single JSON policy document
  /// to use as an inline session policy. You can also specify up to 10 managed
  /// policies to use as managed session policies. The plain text that you use
  /// for both inline and managed session policies can't exceed 2,048
  /// characters. Passing policies to this operation returns new temporary
  /// credentials. The resulting session's permissions are the intersection of
  /// the role's identity-based policy and the session policies. You can use the
  /// role's temporary credentials in subsequent AWS API calls to access
  /// resources in the account that owns the role. You cannot use session
  /// policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// Calling <code>AssumeRoleWithSAML</code> does not require the use of AWS
  /// security credentials. The identity of the caller is validated by using
  /// keys in the metadata document that is uploaded for the SAML provider
  /// entity for your identity provider.
  /// <important>
  /// Calling <code>AssumeRoleWithSAML</code> can result in an entry in your AWS
  /// CloudTrail logs. The entry includes the value in the <code>NameID</code>
  /// element of the SAML assertion. We recommend that you use a
  /// <code>NameIDType</code> that is not associated with any personally
  /// identifiable information (PII). For example, you could instead use the
  /// persistent identifier
  /// (<code>urn:oasis:names:tc:SAML:2.0:nameid-format:persistent</code>).
  /// </important>
  /// <b>Tags</b>
  ///
  /// (Optional) You can configure your IdP to pass attributes into your SAML
  /// assertion as session tags. Each session tag consists of a key name and an
  /// associated value. For more information about session tags, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Passing
  /// Session Tags in STS</a> in the <i>IAM User Guide</i>.
  ///
  /// You can pass up to 50 session tags. The plain text session tag keys can’t
  /// exceed 128 characters and the values can’t exceed 256 characters. For
  /// these and additional limits, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM
  /// and STS Character Limits</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  /// You can pass a session tag with the same key as a tag that is attached to
  /// the role. When you do, session tags override the role's tags with the same
  /// key.
  ///
  /// An administrator must grant you the permissions necessary to pass session
  /// tags. The administrator can also create granular permissions to allow you
  /// to pass only specific session tags. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html">Tutorial:
  /// Using Tags for Attribute-Based Access Control</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// You can set the session tags as transitive. Transitive tags persist during
  /// role chaining. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining">Chaining
  /// Roles with Session Tags</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>SAML Configuration</b>
  ///
  /// Before your application can call <code>AssumeRoleWithSAML</code>, you must
  /// configure your SAML identity provider (IdP) to issue the claims required
  /// by AWS. Additionally, you must use AWS Identity and Access Management
  /// (IAM) to create a SAML provider entity in your AWS account that represents
  /// your identity provider. You must also create an IAM role that specifies
  /// this SAML provider in its trust policy.
  ///
  /// For more information, see the following resources:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html">About
  /// SAML 2.0-based Federation</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_saml.html">Creating
  /// SAML Identity Providers</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_saml_relying-party.html">Configuring
  /// a Relying Party and Claims</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_saml.html">Creating
  /// a Role for SAML 2.0 Federation</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [PackedPolicyTooLargeException].
  /// May throw [IDPRejectedClaimException].
  /// May throw [InvalidIdentityTokenException].
  /// May throw [ExpiredTokenException].
  /// May throw [RegionDisabledException].
  ///
  /// Parameter [principalArn] :
  /// The Amazon Resource Name (ARN) of the SAML provider in IAM that describes
  /// the IdP.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role that the caller is assuming.
  ///
  /// Parameter [sAMLAssertion] :
  /// The base-64 encoded SAML authentication response provided by the IdP.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/create-role-saml-IdP-tasks.html">Configuring
  /// a Relying Party and Adding Claims</a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [durationSeconds] :
  /// The duration, in seconds, of the role session. Your role session lasts for
  /// the duration that you specify for the <code>DurationSeconds</code>
  /// parameter, or until the time specified in the SAML authentication
  /// response's <code>SessionNotOnOrAfter</code> value, whichever is shorter.
  /// You can provide a <code>DurationSeconds</code> value from 900 seconds (15
  /// minutes) up to the maximum session duration setting for the role. This
  /// setting can have a value from 1 hour to 12 hours. If you specify a value
  /// higher than this setting, the operation fails. For example, if you specify
  /// a session duration of 12 hours, but your administrator set the maximum
  /// session duration to 6 hours, your operation fails. To learn how to view
  /// the maximum value for your role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View
  /// the Maximum Session Duration Setting for a Role</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// By default, the value is set to <code>3600</code> seconds.
  /// <note>
  /// The <code>DurationSeconds</code> parameter is separate from the duration
  /// of a console session that you might request using the returned
  /// credentials. The request to the federation endpoint for a console sign-in
  /// token takes a <code>SessionDuration</code> parameter that specifies the
  /// maximum length of the console session. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating
  /// a URL that Enables Federated Users to Access the AWS Management
  /// Console</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// Parameter [policy] :
  /// An IAM policy in JSON format that you want to use as an inline session
  /// policy.
  ///
  /// This parameter is optional. Passing policies to this operation returns new
  /// temporary credentials. The resulting session's permissions are the
  /// intersection of the role's identity-based policy and the session policies.
  /// You can use the role's temporary credentials in subsequent AWS API calls
  /// to access resources in the account that owns the role. You cannot use
  /// session policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// can't exceed 2,048 characters. The JSON policy characters can be any ASCII
  /// character from the space character to the end of the valid character list
  /// (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed
  /// (\u000A), and carriage return (\u000D) characters.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  ///
  /// Parameter [policyArns] :
  /// The Amazon Resource Names (ARNs) of the IAM managed policies that you want
  /// to use as managed session policies. The policies must exist in the same
  /// account as the role.
  ///
  /// This parameter is optional. You can provide up to 10 managed policy ARNs.
  /// However, the plain text that you use for both inline and managed session
  /// policies can't exceed 2,048 characters. For more information about ARNs,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General
  /// Reference.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  Future<AssumeRoleWithSAMLResponse> assumeRoleWithSAML({
    @_s.required String principalArn,
    @_s.required String roleArn,
    @_s.required String sAMLAssertion,
    int durationSeconds,
    String policy,
    List<PolicyDescriptorType> policyArns,
  }) async {
    ArgumentError.checkNotNull(principalArn, 'principalArn');
    _s.validateStringLength(
      'principalArn',
      principalArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'principalArn',
      principalArn,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]+''',
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
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sAMLAssertion, 'sAMLAssertion');
    _s.validateStringLength(
      'sAMLAssertion',
      sAMLAssertion,
      4,
      100000,
      isRequired: true,
    );
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    _s.validateStringLength(
      'policy',
      policy,
      1,
      2048,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    final $request = <String, dynamic>{};
    $request['PrincipalArn'] = principalArn;
    $request['RoleArn'] = roleArn;
    $request['SAMLAssertion'] = sAMLAssertion;
    durationSeconds?.also((arg) => $request['DurationSeconds'] = arg);
    policy?.also((arg) => $request['Policy'] = arg);
    policyArns?.also((arg) => $request['PolicyArns'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AssumeRoleWithSAML',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AssumeRoleWithSAMLRequest'],
      shapes: shapes,
      resultWrapper: 'AssumeRoleWithSAMLResult',
    );
    return AssumeRoleWithSAMLResponse.fromXml($result);
  }

  /// Returns a set of temporary security credentials for users who have been
  /// authenticated in a mobile or web application with a web identity provider.
  /// Example providers include Amazon Cognito, Login with Amazon, Facebook,
  /// Google, or any OpenID Connect-compatible identity provider.
  /// <note>
  /// For mobile applications, we recommend that you use Amazon Cognito. You can
  /// use Amazon Cognito with the <a href="http://aws.amazon.com/sdkforios/">AWS
  /// SDK for iOS Developer Guide</a> and the <a
  /// href="http://aws.amazon.com/sdkforandroid/">AWS SDK for Android Developer
  /// Guide</a> to uniquely identify a user. You can also supply the user with a
  /// consistent identity throughout the lifetime of an application.
  ///
  /// To learn more about Amazon Cognito, see <a
  /// href="https://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-auth.html#d0e840">Amazon
  /// Cognito Overview</a> in <i>AWS SDK for Android Developer Guide</i> and <a
  /// href="https://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-auth.html#d0e664">Amazon
  /// Cognito Overview</a> in the <i>AWS SDK for iOS Developer Guide</i>.
  /// </note>
  /// Calling <code>AssumeRoleWithWebIdentity</code> does not require the use of
  /// AWS security credentials. Therefore, you can distribute an application
  /// (for example, on mobile devices) that requests temporary security
  /// credentials without including long-term AWS credentials in the
  /// application. You also don't need to deploy server-based proxy services
  /// that use long-term AWS credentials. Instead, the identity of the caller is
  /// validated by using a token from the web identity provider. For a
  /// comparison of <code>AssumeRoleWithWebIdentity</code> with the other API
  /// operations that produce temporary credentials, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html">Requesting
  /// Temporary Security Credentials</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison">Comparing
  /// the AWS STS API operations</a> in the <i>IAM User Guide</i>.
  ///
  /// The temporary security credentials returned by this API consist of an
  /// access key ID, a secret access key, and a security token. Applications can
  /// use these temporary security credentials to sign calls to AWS service API
  /// operations.
  ///
  /// <b>Session Duration</b>
  ///
  /// By default, the temporary security credentials created by
  /// <code>AssumeRoleWithWebIdentity</code> last for one hour. However, you can
  /// use the optional <code>DurationSeconds</code> parameter to specify the
  /// duration of your session. You can provide a value from 900 seconds (15
  /// minutes) up to the maximum session duration setting for the role. This
  /// setting can have a value from 1 hour to 12 hours. To learn how to view the
  /// maximum value for your role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View
  /// the Maximum Session Duration Setting for a Role</a> in the <i>IAM User
  /// Guide</i>. The maximum session duration limit applies when you use the
  /// <code>AssumeRole*</code> API operations or the <code>assume-role*</code>
  /// CLI commands. However the limit does not apply when you use those
  /// operations to create a console URL. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using
  /// IAM Roles</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Permissions</b>
  ///
  /// The temporary security credentials created by
  /// <code>AssumeRoleWithWebIdentity</code> can be used to make API calls to
  /// any AWS service with the following exception: you cannot call the STS
  /// <code>GetFederationToken</code> or <code>GetSessionToken</code> API
  /// operations.
  ///
  /// (Optional) You can pass inline or managed <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session
  /// policies</a> to this operation. You can pass a single JSON policy document
  /// to use as an inline session policy. You can also specify up to 10 managed
  /// policies to use as managed session policies. The plain text that you use
  /// for both inline and managed session policies can't exceed 2,048
  /// characters. Passing policies to this operation returns new temporary
  /// credentials. The resulting session's permissions are the intersection of
  /// the role's identity-based policy and the session policies. You can use the
  /// role's temporary credentials in subsequent AWS API calls to access
  /// resources in the account that owns the role. You cannot use session
  /// policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Tags</b>
  ///
  /// (Optional) You can configure your IdP to pass attributes into your web
  /// identity token as session tags. Each session tag consists of a key name
  /// and an associated value. For more information about session tags, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Passing
  /// Session Tags in STS</a> in the <i>IAM User Guide</i>.
  ///
  /// You can pass up to 50 session tags. The plain text session tag keys can’t
  /// exceed 128 characters and the values can’t exceed 256 characters. For
  /// these and additional limits, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM
  /// and STS Character Limits</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  /// You can pass a session tag with the same key as a tag that is attached to
  /// the role. When you do, the session tag overrides the role tag with the
  /// same key.
  ///
  /// An administrator must grant you the permissions necessary to pass session
  /// tags. The administrator can also create granular permissions to allow you
  /// to pass only specific session tags. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html">Tutorial:
  /// Using Tags for Attribute-Based Access Control</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// You can set the session tags as transitive. Transitive tags persist during
  /// role chaining. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html#id_session-tags_role-chaining">Chaining
  /// Roles with Session Tags</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Identities</b>
  ///
  /// Before your application can call <code>AssumeRoleWithWebIdentity</code>,
  /// you must have an identity token from a supported identity provider and
  /// create a role that the application can assume. The role that your
  /// application assumes must trust the identity provider that is associated
  /// with the identity token. In other words, the identity provider must be
  /// specified in the role's trust policy.
  /// <important>
  /// Calling <code>AssumeRoleWithWebIdentity</code> can result in an entry in
  /// your AWS CloudTrail logs. The entry includes the <a
  /// href="http://openid.net/specs/openid-connect-core-1_0.html#Claims">Subject</a>
  /// of the provided Web Identity Token. We recommend that you avoid using any
  /// personally identifiable information (PII) in this field. For example, you
  /// could instead use a GUID or a pairwise identifier, as <a
  /// href="http://openid.net/specs/openid-connect-core-1_0.html#SubjectIDTypes">suggested
  /// in the OIDC specification</a>.
  /// </important>
  /// For more information about how to use web identity federation and the
  /// <code>AssumeRoleWithWebIdentity</code> API, see the following resources:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_oidc_manual.html">Using
  /// Web Identity Federation API Operations for Mobile Apps</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_assumerolewithwebidentity">Federation
  /// Through a Web-based Identity Provider</a>.
  /// </li>
  /// <li>
  /// <a
  /// href="https://aws.amazon.com/blogs/aws/the-aws-web-identity-federation-playground/">
  /// Web Identity Federation Playground</a>. Walk through the process of
  /// authenticating through Login with Amazon, Facebook, or Google, getting
  /// temporary security credentials, and then using those credentials to make a
  /// request to AWS.
  /// </li>
  /// <li>
  /// <a href="http://aws.amazon.com/sdkforios/">AWS SDK for iOS Developer
  /// Guide</a> and <a href="http://aws.amazon.com/sdkforandroid/">AWS SDK for
  /// Android Developer Guide</a>. These toolkits contain sample apps that show
  /// how to invoke the identity providers. The toolkits then show how to use
  /// the information from these providers to get and use temporary security
  /// credentials.
  /// </li>
  /// <li>
  /// <a
  /// href="http://aws.amazon.com/articles/web-identity-federation-with-mobile-applications">Web
  /// Identity Federation with Mobile Applications</a>. This article discusses
  /// web identity federation and shows an example of how to use web identity
  /// federation to get access to content in Amazon S3.
  /// </li>
  /// </ul>
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [PackedPolicyTooLargeException].
  /// May throw [IDPRejectedClaimException].
  /// May throw [IDPCommunicationErrorException].
  /// May throw [InvalidIdentityTokenException].
  /// May throw [ExpiredTokenException].
  /// May throw [RegionDisabledException].
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role that the caller is assuming.
  ///
  /// Parameter [roleSessionName] :
  /// An identifier for the assumed role session. Typically, you pass the name
  /// or identifier that is associated with the user who is using your
  /// application. That way, the temporary security credentials that your
  /// application will use are associated with that user. This session name is
  /// included as part of the ARN and assumed role ID in the
  /// <code>AssumedRoleUser</code> response element.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// Parameter [webIdentityToken] :
  /// The OAuth 2.0 access token or OpenID Connect ID token that is provided by
  /// the identity provider. Your application must get this token by
  /// authenticating the user who is using your application with a web identity
  /// provider before the application makes an
  /// <code>AssumeRoleWithWebIdentity</code> call.
  ///
  /// Parameter [durationSeconds] :
  /// The duration, in seconds, of the role session. The value can range from
  /// 900 seconds (15 minutes) up to the maximum session duration setting for
  /// the role. This setting can have a value from 1 hour to 12 hours. If you
  /// specify a value higher than this setting, the operation fails. For
  /// example, if you specify a session duration of 12 hours, but your
  /// administrator set the maximum session duration to 6 hours, your operation
  /// fails. To learn how to view the maximum value for your role, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html#id_roles_use_view-role-max-session">View
  /// the Maximum Session Duration Setting for a Role</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// By default, the value is set to <code>3600</code> seconds.
  /// <note>
  /// The <code>DurationSeconds</code> parameter is separate from the duration
  /// of a console session that you might request using the returned
  /// credentials. The request to the federation endpoint for a console sign-in
  /// token takes a <code>SessionDuration</code> parameter that specifies the
  /// maximum length of the console session. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-custom-url.html">Creating
  /// a URL that Enables Federated Users to Access the AWS Management
  /// Console</a> in the <i>IAM User Guide</i>.
  /// </note>
  ///
  /// Parameter [policy] :
  /// An IAM policy in JSON format that you want to use as an inline session
  /// policy.
  ///
  /// This parameter is optional. Passing policies to this operation returns new
  /// temporary credentials. The resulting session's permissions are the
  /// intersection of the role's identity-based policy and the session policies.
  /// You can use the role's temporary credentials in subsequent AWS API calls
  /// to access resources in the account that owns the role. You cannot use
  /// session policies to grant more permissions than those allowed by the
  /// identity-based policy of the role that is being assumed. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// can't exceed 2,048 characters. The JSON policy characters can be any ASCII
  /// character from the space character to the end of the valid character list
  /// (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed
  /// (\u000A), and carriage return (\u000D) characters.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  ///
  /// Parameter [policyArns] :
  /// The Amazon Resource Names (ARNs) of the IAM managed policies that you want
  /// to use as managed session policies. The policies must exist in the same
  /// account as the role.
  ///
  /// This parameter is optional. You can provide up to 10 managed policy ARNs.
  /// However, the plain text that you use for both inline and managed session
  /// policies can't exceed 2,048 characters. For more information about ARNs,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General
  /// Reference.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  /// Passing policies to this operation returns new temporary credentials. The
  /// resulting session's permissions are the intersection of the role's
  /// identity-based policy and the session policies. You can use the role's
  /// temporary credentials in subsequent AWS API calls to access resources in
  /// the account that owns the role. You cannot use session policies to grant
  /// more permissions than those allowed by the identity-based policy of the
  /// role that is being assumed. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// Parameter [providerId] :
  /// The fully qualified host component of the domain name of the identity
  /// provider.
  ///
  /// Specify this value only for OAuth 2.0 access tokens. Currently
  /// <code>www.amazon.com</code> and <code>graph.facebook.com</code> are the
  /// only supported identity providers for OAuth 2.0 access tokens. Do not
  /// include URL schemes and port numbers.
  ///
  /// Do not specify this value for OpenID Connect ID tokens.
  Future<AssumeRoleWithWebIdentityResponse> assumeRoleWithWebIdentity({
    @_s.required String roleArn,
    @_s.required String roleSessionName,
    @_s.required String webIdentityToken,
    int durationSeconds,
    String policy,
    List<PolicyDescriptorType> policyArns,
    String providerId,
  }) async {
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleSessionName, 'roleSessionName');
    _s.validateStringLength(
      'roleSessionName',
      roleSessionName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleSessionName',
      roleSessionName,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(webIdentityToken, 'webIdentityToken');
    _s.validateStringLength(
      'webIdentityToken',
      webIdentityToken,
      4,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      43200,
    );
    _s.validateStringLength(
      'policy',
      policy,
      1,
      2048,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    _s.validateStringLength(
      'providerId',
      providerId,
      4,
      2048,
    );
    final $request = <String, dynamic>{};
    $request['RoleArn'] = roleArn;
    $request['RoleSessionName'] = roleSessionName;
    $request['WebIdentityToken'] = webIdentityToken;
    durationSeconds?.also((arg) => $request['DurationSeconds'] = arg);
    policy?.also((arg) => $request['Policy'] = arg);
    policyArns?.also((arg) => $request['PolicyArns'] = arg);
    providerId?.also((arg) => $request['ProviderId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AssumeRoleWithWebIdentity',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AssumeRoleWithWebIdentityRequest'],
      shapes: shapes,
      resultWrapper: 'AssumeRoleWithWebIdentityResult',
    );
    return AssumeRoleWithWebIdentityResponse.fromXml($result);
  }

  /// Decodes additional information about the authorization status of a request
  /// from an encoded message returned in response to an AWS request.
  ///
  /// For example, if a user is not authorized to perform an operation that he
  /// or she has requested, the request returns a
  /// <code>Client.UnauthorizedOperation</code> response (an HTTP 403 response).
  /// Some AWS operations additionally return an encoded message that can
  /// provide details about this authorization failure.
  /// <note>
  /// Only certain AWS operations return an encoded authorization message. The
  /// documentation for an individual operation indicates whether that operation
  /// returns an encoded message in addition to returning an HTTP code.
  /// </note>
  /// The message is encoded because the details of the authorization status can
  /// constitute privileged information that the user who requested the
  /// operation should not see. To decode an authorization status message, a
  /// user must be granted permissions via an IAM policy to request the
  /// <code>DecodeAuthorizationMessage</code>
  /// (<code>sts:DecodeAuthorizationMessage</code>) action.
  ///
  /// The decoded message includes the following type of information:
  ///
  /// <ul>
  /// <li>
  /// Whether the request was denied due to an explicit deny or due to the
  /// absence of an explicit allow. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html#policy-eval-denyallow">Determining
  /// Whether a Request is Allowed or Denied</a> in the <i>IAM User Guide</i>.
  /// </li>
  /// <li>
  /// The principal who made the request.
  /// </li>
  /// <li>
  /// The requested action.
  /// </li>
  /// <li>
  /// The requested resource.
  /// </li>
  /// <li>
  /// The values of condition keys in the context of the user's request.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidAuthorizationMessageException].
  ///
  /// Parameter [encodedMessage] :
  /// The encoded message that was returned with the response.
  Future<DecodeAuthorizationMessageResponse> decodeAuthorizationMessage({
    @_s.required String encodedMessage,
  }) async {
    ArgumentError.checkNotNull(encodedMessage, 'encodedMessage');
    _s.validateStringLength(
      'encodedMessage',
      encodedMessage,
      1,
      10240,
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['EncodedMessage'] = encodedMessage;
    final $result = await _protocol.send(
      $request,
      action: 'DecodeAuthorizationMessage',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DecodeAuthorizationMessageRequest'],
      shapes: shapes,
      resultWrapper: 'DecodeAuthorizationMessageResult',
    );
    return DecodeAuthorizationMessageResponse.fromXml($result);
  }

  /// Returns the account identifier for the specified access key ID.
  ///
  /// Access keys consist of two parts: an access key ID (for example,
  /// <code>AKIAIOSFODNN7EXAMPLE</code>) and a secret access key (for example,
  /// <code>wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY</code>). For more
  /// information about access keys, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html">Managing
  /// Access Keys for IAM Users</a> in the <i>IAM User Guide</i>.
  ///
  /// When you pass an access key ID to this operation, it returns the ID of the
  /// AWS account to which the keys belong. Access key IDs beginning with
  /// <code>AKIA</code> are long-term credentials for an IAM user or the AWS
  /// account root user. Access key IDs beginning with <code>ASIA</code> are
  /// temporary credentials that are created using STS operations. If the
  /// account in the response belongs to you, you can sign in as the root user
  /// and review your root user access keys. Then, you can pull a <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_getting-report.html">credentials
  /// report</a> to learn which IAM user owns the keys. To learn who requested
  /// the temporary credentials for an <code>ASIA</code> access key, view the
  /// STS events in your <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/cloudtrail-integration.html">CloudTrail
  /// logs</a> in the <i>IAM User Guide</i>.
  ///
  /// This operation does not indicate the state of the access key. The key
  /// might be active, inactive, or deleted. Active keys might not have
  /// permissions to perform an operation. Providing a deleted access key might
  /// return an error that the key doesn't exist.
  ///
  /// Parameter [accessKeyId] :
  /// The identifier of an access key.
  ///
  /// This parameter allows (through its regex pattern) a string of characters
  /// that can consist of any upper- or lowercase letter or digit.
  Future<GetAccessKeyInfoResponse> getAccessKeyInfo({
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
      r'''[\w]*''',
      isRequired: true,
    );
    final $request = <String, dynamic>{};
    $request['AccessKeyId'] = accessKeyId;
    final $result = await _protocol.send(
      $request,
      action: 'GetAccessKeyInfo',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetAccessKeyInfoRequest'],
      shapes: shapes,
      resultWrapper: 'GetAccessKeyInfoResult',
    );
    return GetAccessKeyInfoResponse.fromXml($result);
  }

  /// Returns details about the IAM user or role whose credentials are used to
  /// call the operation.
  /// <note>
  /// No permissions are required to perform this operation. If an administrator
  /// adds a policy to your IAM user or role that explicitly denies access to
  /// the <code>sts:GetCallerIdentity</code> action, you can still perform this
  /// operation. Permissions are not required because the same information is
  /// returned when an IAM user or role is denied access. To view an example
  /// response, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_access-denied-delete-mfa">I
  /// Am Not Authorized to Perform: iam:DeleteVirtualMFADevice</a> in the <i>IAM
  /// User Guide</i>.
  /// </note>
  Future<GetCallerIdentityResponse> getCallerIdentity() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'GetCallerIdentity',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetCallerIdentityRequest'],
      shapes: shapes,
      resultWrapper: 'GetCallerIdentityResult',
    );
    return GetCallerIdentityResponse.fromXml($result);
  }

  /// Returns a set of temporary security credentials (consisting of an access
  /// key ID, a secret access key, and a security token) for a federated user. A
  /// typical use is in a proxy application that gets temporary security
  /// credentials on behalf of distributed applications inside a corporate
  /// network. You must call the <code>GetFederationToken</code> operation using
  /// the long-term security credentials of an IAM user. As a result, this call
  /// is appropriate in contexts where those credentials can be safely stored,
  /// usually in a server-based application. For a comparison of
  /// <code>GetFederationToken</code> with the other API operations that produce
  /// temporary credentials, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html">Requesting
  /// Temporary Security Credentials</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison">Comparing
  /// the AWS STS API operations</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// You can create a mobile-based or browser-based app that can authenticate
  /// users using a web identity provider like Login with Amazon, Facebook,
  /// Google, or an OpenID Connect-compatible identity provider. In this case,
  /// we recommend that you use <a href="http://aws.amazon.com/cognito/">Amazon
  /// Cognito</a> or <code>AssumeRoleWithWebIdentity</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_assumerolewithwebidentity">Federation
  /// Through a Web-based Identity Provider</a> in the <i>IAM User Guide</i>.
  /// </note>
  /// You can also call <code>GetFederationToken</code> using the security
  /// credentials of an AWS account root user, but we do not recommend it.
  /// Instead, we recommend that you create an IAM user for the purpose of the
  /// proxy application. Then attach a policy to the IAM user that limits
  /// federated users to only the actions and resources that they need to
  /// access. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html">IAM
  /// Best Practices</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Session duration</b>
  ///
  /// The temporary credentials are valid for the specified duration, from 900
  /// seconds (15 minutes) up to a maximum of 129,600 seconds (36 hours). The
  /// default session duration is 43,200 seconds (12 hours). Temporary
  /// credentials that are obtained by using AWS account root user credentials
  /// have a maximum duration of 3,600 seconds (1 hour).
  ///
  /// <b>Permissions</b>
  ///
  /// You can use the temporary credentials created by
  /// <code>GetFederationToken</code> in any AWS service except the following:
  ///
  /// <ul>
  /// <li>
  /// You cannot call any IAM operations using the AWS CLI or the AWS API.
  /// </li>
  /// <li>
  /// You cannot call any STS operations except <code>GetCallerIdentity</code>.
  /// </li>
  /// </ul>
  /// You must pass an inline or managed <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session
  /// policy</a> to this operation. You can pass a single JSON policy document
  /// to use as an inline session policy. You can also specify up to 10 managed
  /// policies to use as managed session policies. The plain text that you use
  /// for both inline and managed session policies can't exceed 2,048
  /// characters.
  ///
  /// Though the session policy parameters are optional, if you do not pass a
  /// policy, then the resulting federated user session has no permissions. When
  /// you pass session policies, the session permissions are the intersection of
  /// the IAM user policies and the session policies that you pass. This gives
  /// you a way to further restrict the permissions for a federated user. You
  /// cannot use session policies to grant more permissions than those that are
  /// defined in the permissions policy of the IAM user. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>. For information about using
  /// <code>GetFederationToken</code> to create temporary security credentials,
  /// see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_getfederationtoken">GetFederationToken—Federation
  /// Through a Custom Identity Broker</a>.
  ///
  /// You can use the credentials to access a resource that has a resource-based
  /// policy. If that policy specifically references the federated user session
  /// in the <code>Principal</code> element of the policy, the session has the
  /// permissions allowed by the policy. These permissions are granted in
  /// addition to the permissions granted by the session policies.
  ///
  /// <b>Tags</b>
  ///
  /// (Optional) You can pass tag key-value pairs to your session. These are
  /// called session tags. For more information about session tags, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Passing
  /// Session Tags in STS</a> in the <i>IAM User Guide</i>.
  ///
  /// An administrator must grant you the permissions necessary to pass session
  /// tags. The administrator can also create granular permissions to allow you
  /// to pass only specific session tags. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_attribute-based-access-control.html">Tutorial:
  /// Using Tags for Attribute-Based Access Control</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// Tag key–value pairs are not case sensitive, but case is preserved. This
  /// means that you cannot have separate <code>Department</code> and
  /// <code>department</code> tag keys. Assume that the user that you are
  /// federating has the <code>Department</code>=<code>Marketing</code> tag and
  /// you pass the <code>department</code>=<code>engineering</code> session tag.
  /// <code>Department</code> and <code>department</code> are not saved as
  /// separate tags, and the session tag passed in the request takes precedence
  /// over the user tag.
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [PackedPolicyTooLargeException].
  /// May throw [RegionDisabledException].
  ///
  /// Parameter [name] :
  /// The name of the federated user. The name is used as an identifier for the
  /// temporary security credentials (such as <code>Bob</code>). For example,
  /// you can reference the federated user name in a resource-based policy, such
  /// as in an Amazon S3 bucket policy.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@-
  ///
  /// Parameter [durationSeconds] :
  /// The duration, in seconds, that the session should last. Acceptable
  /// durations for federation sessions range from 900 seconds (15 minutes) to
  /// 129,600 seconds (36 hours), with 43,200 seconds (12 hours) as the default.
  /// Sessions obtained using AWS account root user credentials are restricted
  /// to a maximum of 3,600 seconds (one hour). If the specified duration is
  /// longer than one hour, the session obtained by using root user credentials
  /// defaults to one hour.
  ///
  /// Parameter [policy] :
  /// An IAM policy in JSON format that you want to use as an inline session
  /// policy.
  ///
  /// You must pass an inline or managed <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session
  /// policy</a> to this operation. You can pass a single JSON policy document
  /// to use as an inline session policy. You can also specify up to 10 managed
  /// policies to use as managed session policies.
  ///
  /// This parameter is optional. However, if you do not pass any session
  /// policies, then the resulting federated user session has no permissions.
  ///
  /// When you pass session policies, the session permissions are the
  /// intersection of the IAM user policies and the session policies that you
  /// pass. This gives you a way to further restrict the permissions for a
  /// federated user. You cannot use session policies to grant more permissions
  /// than those that are defined in the permissions policy of the IAM user. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// The resulting credentials can be used to access a resource that has a
  /// resource-based policy. If that policy specifically references the
  /// federated user session in the <code>Principal</code> element of the
  /// policy, the session has the permissions allowed by the policy. These
  /// permissions are granted in addition to the permissions that are granted by
  /// the session policies.
  ///
  /// The plain text that you use for both inline and managed session policies
  /// can't exceed 2,048 characters. The JSON policy characters can be any ASCII
  /// character from the space character to the end of the valid character list
  /// (\u0020 through \u00FF). It can also include the tab (\u0009), linefeed
  /// (\u000A), and carriage return (\u000D) characters.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  ///
  /// Parameter [policyArns] :
  /// The Amazon Resource Names (ARNs) of the IAM managed policies that you want
  /// to use as a managed session policy. The policies must exist in the same
  /// account as the IAM user that is requesting federated access.
  ///
  /// You must pass an inline or managed <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">session
  /// policy</a> to this operation. You can pass a single JSON policy document
  /// to use as an inline session policy. You can also specify up to 10 managed
  /// policies to use as managed session policies. The plain text that you use
  /// for both inline and managed session policies can't exceed 2,048
  /// characters. You can provide up to 10 managed policy ARNs. For more
  /// information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the AWS General
  /// Reference.
  ///
  /// This parameter is optional. However, if you do not pass any session
  /// policies, then the resulting federated user session has no permissions.
  ///
  /// When you pass session policies, the session permissions are the
  /// intersection of the IAM user policies and the session policies that you
  /// pass. This gives you a way to further restrict the permissions for a
  /// federated user. You cannot use session policies to grant more permissions
  /// than those that are defined in the permissions policy of the IAM user. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies_session">Session
  /// Policies</a> in the <i>IAM User Guide</i>.
  ///
  /// The resulting credentials can be used to access a resource that has a
  /// resource-based policy. If that policy specifically references the
  /// federated user session in the <code>Principal</code> element of the
  /// policy, the session has the permissions allowed by the policy. These
  /// permissions are granted in addition to the permissions that are granted by
  /// the session policies.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of session tags. Each session tag consists of a key name and an
  /// associated value. For more information about session tags, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Passing
  /// Session Tags in STS</a> in the <i>IAM User Guide</i>.
  ///
  /// This parameter is optional. You can pass up to 50 session tags. The plain
  /// text session tag keys can’t exceed 128 characters and the values can’t
  /// exceed 256 characters. For these and additional limits, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM
  /// and STS Character Limits</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// An AWS conversion compresses the passed session policies and session tags
  /// into a packed binary format that has a separate limit. Your request can
  /// fail for this limit even if your plain text meets the other requirements.
  /// The <code>PackedPolicySize</code> response element indicates by percentage
  /// how close the policies and tags for your request are to the upper size
  /// limit.
  /// </note>
  /// You can pass a session tag with the same key as a tag that is already
  /// attached to the user you are federating. When you do, session tags
  /// override a user tag with the same key.
  ///
  /// Tag key–value pairs are not case sensitive, but case is preserved. This
  /// means that you cannot have separate <code>Department</code> and
  /// <code>department</code> tag keys. Assume that the role has the
  /// <code>Department</code>=<code>Marketing</code> tag and you pass the
  /// <code>department</code>=<code>engineering</code> session tag.
  /// <code>Department</code> and <code>department</code> are not saved as
  /// separate tags, and the session tag passed in the request takes precedence
  /// over the role tag.
  Future<GetFederationTokenResponse> getFederationToken({
    @_s.required String name,
    int durationSeconds,
    String policy,
    List<PolicyDescriptorType> policyArns,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      2,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\w+=,.@-]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      129600,
    );
    _s.validateStringLength(
      'policy',
      policy,
      1,
      2048,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    final $request = <String, dynamic>{};
    $request['Name'] = name;
    durationSeconds?.also((arg) => $request['DurationSeconds'] = arg);
    policy?.also((arg) => $request['Policy'] = arg);
    policyArns?.also((arg) => $request['PolicyArns'] = arg);
    tags?.also((arg) => $request['Tags'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetFederationToken',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetFederationTokenRequest'],
      shapes: shapes,
      resultWrapper: 'GetFederationTokenResult',
    );
    return GetFederationTokenResponse.fromXml($result);
  }

  /// Returns a set of temporary credentials for an AWS account or IAM user. The
  /// credentials consist of an access key ID, a secret access key, and a
  /// security token. Typically, you use <code>GetSessionToken</code> if you
  /// want to use MFA to protect programmatic calls to specific AWS API
  /// operations like Amazon EC2 <code>StopInstances</code>. MFA-enabled IAM
  /// users would need to call <code>GetSessionToken</code> and submit an MFA
  /// code that is associated with their MFA device. Using the temporary
  /// security credentials that are returned from the call, IAM users can then
  /// make programmatic calls to API operations that require MFA authentication.
  /// If you do not supply a correct MFA code, then the API returns an access
  /// denied error. For a comparison of <code>GetSessionToken</code> with the
  /// other API operations that produce temporary credentials, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html">Requesting
  /// Temporary Security Credentials</a> and <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#stsapi_comparison">Comparing
  /// the AWS STS API operations</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Session Duration</b>
  ///
  /// The <code>GetSessionToken</code> operation must be called by using the
  /// long-term AWS security credentials of the AWS account root user or an IAM
  /// user. Credentials that are created by IAM users are valid for the duration
  /// that you specify. This duration can range from 900 seconds (15 minutes) up
  /// to a maximum of 129,600 seconds (36 hours), with a default of 43,200
  /// seconds (12 hours). Credentials based on account credentials can range
  /// from 900 seconds (15 minutes) up to 3,600 seconds (1 hour), with a default
  /// of 1 hour.
  ///
  /// <b>Permissions</b>
  ///
  /// The temporary security credentials created by <code>GetSessionToken</code>
  /// can be used to make API calls to any AWS service with the following
  /// exceptions:
  ///
  /// <ul>
  /// <li>
  /// You cannot call any IAM API operations unless MFA authentication
  /// information is included in the request.
  /// </li>
  /// <li>
  /// You cannot call any STS API <i>except</i> <code>AssumeRole</code> or
  /// <code>GetCallerIdentity</code>.
  /// </li>
  /// </ul> <note>
  /// We recommend that you do not call <code>GetSessionToken</code> with AWS
  /// account root user credentials. Instead, follow our <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#create-iam-users">best
  /// practices</a> by creating one or more IAM users, giving them the necessary
  /// permissions, and using IAM users for everyday interaction with AWS.
  /// </note>
  /// The credentials that are returned by <code>GetSessionToken</code> are
  /// based on permissions associated with the user whose credentials were used
  /// to call the operation. If <code>GetSessionToken</code> is called using AWS
  /// account root user credentials, the temporary credentials have root user
  /// permissions. Similarly, if <code>GetSessionToken</code> is called using
  /// the credentials of an IAM user, the temporary credentials have the same
  /// permissions as the IAM user.
  ///
  /// For more information about using <code>GetSessionToken</code> to create
  /// temporary credentials, go to <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_request.html#api_getsessiontoken">Temporary
  /// Credentials for Users in Untrusted Environments</a> in the <i>IAM User
  /// Guide</i>.
  ///
  /// May throw [RegionDisabledException].
  ///
  /// Parameter [durationSeconds] :
  /// The duration, in seconds, that the credentials should remain valid.
  /// Acceptable durations for IAM user sessions range from 900 seconds (15
  /// minutes) to 129,600 seconds (36 hours), with 43,200 seconds (12 hours) as
  /// the default. Sessions for AWS account owners are restricted to a maximum
  /// of 3,600 seconds (one hour). If the duration is longer than one hour, the
  /// session for AWS account owners defaults to one hour.
  ///
  /// Parameter [serialNumber] :
  /// The identification number of the MFA device that is associated with the
  /// IAM user who is making the <code>GetSessionToken</code> call. Specify this
  /// value if the IAM user has a policy that requires MFA authentication. The
  /// value is either the serial number for a hardware device (such as
  /// <code>GAHT12345678</code>) or an Amazon Resource Name (ARN) for a virtual
  /// device (such as <code>arn:aws:iam::123456789012:mfa/user</code>). You can
  /// find the device for an IAM user by going to the AWS Management Console and
  /// viewing the user's security credentials.
  ///
  /// The regex used to validate this parameter is a string of characters
  /// consisting of upper- and lower-case alphanumeric characters with no
  /// spaces. You can also include underscores or any of the following
  /// characters: =,.@:/-
  ///
  /// Parameter [tokenCode] :
  /// The value provided by the MFA device, if MFA is required. If any policy
  /// requires the IAM user to submit an MFA code, specify this value. If MFA
  /// authentication is required, the user must provide a code when requesting a
  /// set of temporary security credentials. A user who fails to provide the
  /// code receives an "access denied" response when requesting resources that
  /// require MFA authentication.
  ///
  /// The format for this parameter, as described by its regex pattern, is a
  /// sequence of six numeric digits.
  Future<GetSessionTokenResponse> getSessionToken({
    int durationSeconds,
    String serialNumber,
    String tokenCode,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      900,
      129600,
    );
    _s.validateStringLength(
      'serialNumber',
      serialNumber,
      9,
      256,
    );
    _s.validateStringPattern(
      'serialNumber',
      serialNumber,
      r'''[\w+=/:,.@-]*''',
    );
    _s.validateStringLength(
      'tokenCode',
      tokenCode,
      6,
      6,
    );
    _s.validateStringPattern(
      'tokenCode',
      tokenCode,
      r'''[\d]*''',
    );
    final $request = <String, dynamic>{};
    durationSeconds?.also((arg) => $request['DurationSeconds'] = arg);
    serialNumber?.also((arg) => $request['SerialNumber'] = arg);
    tokenCode?.also((arg) => $request['TokenCode'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'GetSessionToken',
      version: '2011-06-15',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['GetSessionTokenRequest'],
      shapes: shapes,
      resultWrapper: 'GetSessionTokenResult',
    );
    return GetSessionTokenResponse.fromXml($result);
  }
}

/// Contains the response to a successful <a>AssumeRole</a> request, including
/// temporary AWS credentials that can be used to make AWS requests.
class AssumeRoleResponse {
  /// The Amazon Resource Name (ARN) and the assumed role ID, which are
  /// identifiers that you can use to refer to the resulting temporary security
  /// credentials. For example, you can reference these credentials as a principal
  /// in a resource-based policy by using the ARN or assumed role ID. The ARN and
  /// ID include the <code>RoleSessionName</code> that you specified when you
  /// called <code>AssumeRole</code>.
  final AssumedRoleUser assumedRoleUser;

  /// The temporary security credentials, which include an access key ID, a secret
  /// access key, and a security (or session) token.
  /// <note>
  /// The size of the security token that STS API operations return is not fixed.
  /// We strongly recommend that you make no assumptions about the maximum size.
  /// </note>
  final Credentials credentials;

  /// A percentage value that indicates the packed size of the session policies
  /// and session tags combined passed in the request. The request fails if the
  /// packed size is greater than 100 percent, which means the policies and tags
  /// exceeded the allowed space.
  final int packedPolicySize;

  AssumeRoleResponse({
    this.assumedRoleUser,
    this.credentials,
    this.packedPolicySize,
  });
  factory AssumeRoleResponse.fromXml(_s.XmlElement elem) {
    return AssumeRoleResponse(
      assumedRoleUser: _s
          .extractXmlChild(elem, 'AssumedRoleUser')
          ?.let((e) => AssumedRoleUser.fromXml(e)),
      credentials: _s
          .extractXmlChild(elem, 'Credentials')
          ?.let((e) => Credentials.fromXml(e)),
      packedPolicySize: _s.extractXmlIntValue(elem, 'PackedPolicySize'),
    );
  }
}

/// Contains the response to a successful <a>AssumeRoleWithSAML</a> request,
/// including temporary AWS credentials that can be used to make AWS requests.
class AssumeRoleWithSAMLResponse {
  /// The identifiers for the temporary security credentials that the operation
  /// returns.
  final AssumedRoleUser assumedRoleUser;

  /// The value of the <code>Recipient</code> attribute of the
  /// <code>SubjectConfirmationData</code> element of the SAML assertion.
  final String audience;

  /// The temporary security credentials, which include an access key ID, a secret
  /// access key, and a security (or session) token.
  /// <note>
  /// The size of the security token that STS API operations return is not fixed.
  /// We strongly recommend that you make no assumptions about the maximum size.
  /// </note>
  final Credentials credentials;

  /// The value of the <code>Issuer</code> element of the SAML assertion.
  final String issuer;

  /// A hash value based on the concatenation of the <code>Issuer</code> response
  /// value, the AWS account ID, and the friendly name (the last part of the ARN)
  /// of the SAML provider in IAM. The combination of <code>NameQualifier</code>
  /// and <code>Subject</code> can be used to uniquely identify a federated user.
  ///
  /// The following pseudocode shows how the hash value is calculated:
  ///
  /// <code>BASE64 ( SHA1 ( "https://example.com/saml" + "123456789012" +
  /// "/MySAMLIdP" ) )</code>
  final String nameQualifier;

  /// A percentage value that indicates the packed size of the session policies
  /// and session tags combined passed in the request. The request fails if the
  /// packed size is greater than 100 percent, which means the policies and tags
  /// exceeded the allowed space.
  final int packedPolicySize;

  /// The value of the <code>NameID</code> element in the <code>Subject</code>
  /// element of the SAML assertion.
  final String subject;

  /// The format of the name ID, as defined by the <code>Format</code> attribute
  /// in the <code>NameID</code> element of the SAML assertion. Typical examples
  /// of the format are <code>transient</code> or <code>persistent</code>.
  ///
  /// If the format includes the prefix
  /// <code>urn:oasis:names:tc:SAML:2.0:nameid-format</code>, that prefix is
  /// removed. For example,
  /// <code>urn:oasis:names:tc:SAML:2.0:nameid-format:transient</code> is returned
  /// as <code>transient</code>. If the format includes any other prefix, the
  /// format is returned with no modifications.
  final String subjectType;

  AssumeRoleWithSAMLResponse({
    this.assumedRoleUser,
    this.audience,
    this.credentials,
    this.issuer,
    this.nameQualifier,
    this.packedPolicySize,
    this.subject,
    this.subjectType,
  });
  factory AssumeRoleWithSAMLResponse.fromXml(_s.XmlElement elem) {
    return AssumeRoleWithSAMLResponse(
      assumedRoleUser: _s
          .extractXmlChild(elem, 'AssumedRoleUser')
          ?.let((e) => AssumedRoleUser.fromXml(e)),
      audience: _s.extractXmlStringValue(elem, 'Audience'),
      credentials: _s
          .extractXmlChild(elem, 'Credentials')
          ?.let((e) => Credentials.fromXml(e)),
      issuer: _s.extractXmlStringValue(elem, 'Issuer'),
      nameQualifier: _s.extractXmlStringValue(elem, 'NameQualifier'),
      packedPolicySize: _s.extractXmlIntValue(elem, 'PackedPolicySize'),
      subject: _s.extractXmlStringValue(elem, 'Subject'),
      subjectType: _s.extractXmlStringValue(elem, 'SubjectType'),
    );
  }
}

/// Contains the response to a successful <a>AssumeRoleWithWebIdentity</a>
/// request, including temporary AWS credentials that can be used to make AWS
/// requests.
class AssumeRoleWithWebIdentityResponse {
  /// The Amazon Resource Name (ARN) and the assumed role ID, which are
  /// identifiers that you can use to refer to the resulting temporary security
  /// credentials. For example, you can reference these credentials as a principal
  /// in a resource-based policy by using the ARN or assumed role ID. The ARN and
  /// ID include the <code>RoleSessionName</code> that you specified when you
  /// called <code>AssumeRole</code>.
  final AssumedRoleUser assumedRoleUser;

  /// The intended audience (also known as client ID) of the web identity token.
  /// This is traditionally the client identifier issued to the application that
  /// requested the web identity token.
  final String audience;

  /// The temporary security credentials, which include an access key ID, a secret
  /// access key, and a security token.
  /// <note>
  /// The size of the security token that STS API operations return is not fixed.
  /// We strongly recommend that you make no assumptions about the maximum size.
  /// </note>
  final Credentials credentials;

  /// A percentage value that indicates the packed size of the session policies
  /// and session tags combined passed in the request. The request fails if the
  /// packed size is greater than 100 percent, which means the policies and tags
  /// exceeded the allowed space.
  final int packedPolicySize;

  /// The issuing authority of the web identity token presented. For OpenID
  /// Connect ID tokens, this contains the value of the <code>iss</code> field.
  /// For OAuth 2.0 access tokens, this contains the value of the
  /// <code>ProviderId</code> parameter that was passed in the
  /// <code>AssumeRoleWithWebIdentity</code> request.
  final String provider;

  /// The unique user identifier that is returned by the identity provider. This
  /// identifier is associated with the <code>WebIdentityToken</code> that was
  /// submitted with the <code>AssumeRoleWithWebIdentity</code> call. The
  /// identifier is typically unique to the user and the application that acquired
  /// the <code>WebIdentityToken</code> (pairwise identifier). For OpenID Connect
  /// ID tokens, this field contains the value returned by the identity provider
  /// as the token's <code>sub</code> (Subject) claim.
  final String subjectFromWebIdentityToken;

  AssumeRoleWithWebIdentityResponse({
    this.assumedRoleUser,
    this.audience,
    this.credentials,
    this.packedPolicySize,
    this.provider,
    this.subjectFromWebIdentityToken,
  });
  factory AssumeRoleWithWebIdentityResponse.fromXml(_s.XmlElement elem) {
    return AssumeRoleWithWebIdentityResponse(
      assumedRoleUser: _s
          .extractXmlChild(elem, 'AssumedRoleUser')
          ?.let((e) => AssumedRoleUser.fromXml(e)),
      audience: _s.extractXmlStringValue(elem, 'Audience'),
      credentials: _s
          .extractXmlChild(elem, 'Credentials')
          ?.let((e) => Credentials.fromXml(e)),
      packedPolicySize: _s.extractXmlIntValue(elem, 'PackedPolicySize'),
      provider: _s.extractXmlStringValue(elem, 'Provider'),
      subjectFromWebIdentityToken:
          _s.extractXmlStringValue(elem, 'SubjectFromWebIdentityToken'),
    );
  }
}

/// The identifiers for the temporary security credentials that the operation
/// returns.
class AssumedRoleUser {
  /// The ARN of the temporary security credentials that are returned from the
  /// <a>AssumeRole</a> action. For more information about ARNs and how to use
  /// them in policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// A unique identifier that contains the role ID and the role session name of
  /// the role that is being assumed. The role ID is generated by AWS when the
  /// role is created.
  final String assumedRoleId;

  AssumedRoleUser({
    @_s.required this.arn,
    @_s.required this.assumedRoleId,
  });
  factory AssumedRoleUser.fromXml(_s.XmlElement elem) {
    return AssumedRoleUser(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      assumedRoleId: _s.extractXmlStringValue(elem, 'AssumedRoleId'),
    );
  }
}

/// AWS credentials for API authentication.
class Credentials {
  /// The access key ID that identifies the temporary security credentials.
  final String accessKeyId;

  /// The date on which the current credentials expire.
  final DateTime expiration;

  /// The secret access key that can be used to sign requests.
  final String secretAccessKey;

  /// The token that users must pass to the service API to use the temporary
  /// credentials.
  final String sessionToken;

  Credentials({
    @_s.required this.accessKeyId,
    @_s.required this.expiration,
    @_s.required this.secretAccessKey,
    @_s.required this.sessionToken,
  });
  factory Credentials.fromXml(_s.XmlElement elem) {
    return Credentials(
      accessKeyId: _s.extractXmlStringValue(elem, 'AccessKeyId'),
      expiration: _s.extractXmlDateTimeValue(elem, 'Expiration'),
      secretAccessKey: _s.extractXmlStringValue(elem, 'SecretAccessKey'),
      sessionToken: _s.extractXmlStringValue(elem, 'SessionToken'),
    );
  }
}

/// A document that contains additional information about the authorization
/// status of a request from an encoded message that is returned in response to
/// an AWS request.
class DecodeAuthorizationMessageResponse {
  /// An XML document that contains the decoded message.
  final String decodedMessage;

  DecodeAuthorizationMessageResponse({
    this.decodedMessage,
  });
  factory DecodeAuthorizationMessageResponse.fromXml(_s.XmlElement elem) {
    return DecodeAuthorizationMessageResponse(
      decodedMessage: _s.extractXmlStringValue(elem, 'DecodedMessage'),
    );
  }
}

/// Identifiers for the federated user that is associated with the credentials.
class FederatedUser {
  /// The ARN that specifies the federated user that is associated with the
  /// credentials. For more information about ARNs and how to use them in
  /// policies, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// Identifiers</a> in the <i>IAM User Guide</i>.
  final String arn;

  /// The string that identifies the federated user associated with the
  /// credentials, similar to the unique ID of an IAM user.
  final String federatedUserId;

  FederatedUser({
    @_s.required this.arn,
    @_s.required this.federatedUserId,
  });
  factory FederatedUser.fromXml(_s.XmlElement elem) {
    return FederatedUser(
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      federatedUserId: _s.extractXmlStringValue(elem, 'FederatedUserId'),
    );
  }
}

class GetAccessKeyInfoResponse {
  /// The number used to identify the AWS account.
  final String account;

  GetAccessKeyInfoResponse({
    this.account,
  });
  factory GetAccessKeyInfoResponse.fromXml(_s.XmlElement elem) {
    return GetAccessKeyInfoResponse(
      account: _s.extractXmlStringValue(elem, 'Account'),
    );
  }
}

/// Contains the response to a successful <a>GetCallerIdentity</a> request,
/// including information about the entity making the request.
class GetCallerIdentityResponse {
  /// The AWS account ID number of the account that owns or contains the calling
  /// entity.
  final String account;

  /// The AWS ARN associated with the calling entity.
  final String arn;

  /// The unique identifier of the calling entity. The exact value depends on the
  /// type of entity that is making the call. The values returned are those listed
  /// in the <b>aws:userid</b> column in the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_variables.html#principaltable">Principal
  /// table</a> found on the <b>Policy Variables</b> reference page in the <i>IAM
  /// User Guide</i>.
  final String userId;

  GetCallerIdentityResponse({
    this.account,
    this.arn,
    this.userId,
  });
  factory GetCallerIdentityResponse.fromXml(_s.XmlElement elem) {
    return GetCallerIdentityResponse(
      account: _s.extractXmlStringValue(elem, 'Account'),
      arn: _s.extractXmlStringValue(elem, 'Arn'),
      userId: _s.extractXmlStringValue(elem, 'UserId'),
    );
  }
}

/// Contains the response to a successful <a>GetFederationToken</a> request,
/// including temporary AWS credentials that can be used to make AWS requests.
class GetFederationTokenResponse {
  /// The temporary security credentials, which include an access key ID, a secret
  /// access key, and a security (or session) token.
  /// <note>
  /// The size of the security token that STS API operations return is not fixed.
  /// We strongly recommend that you make no assumptions about the maximum size.
  /// </note>
  final Credentials credentials;

  /// Identifiers for the federated user associated with the credentials (such as
  /// <code>arn:aws:sts::123456789012:federated-user/Bob</code> or
  /// <code>123456789012:Bob</code>). You can use the federated user's ARN in your
  /// resource-based policies, such as an Amazon S3 bucket policy.
  final FederatedUser federatedUser;

  /// A percentage value that indicates the packed size of the session policies
  /// and session tags combined passed in the request. The request fails if the
  /// packed size is greater than 100 percent, which means the policies and tags
  /// exceeded the allowed space.
  final int packedPolicySize;

  GetFederationTokenResponse({
    this.credentials,
    this.federatedUser,
    this.packedPolicySize,
  });
  factory GetFederationTokenResponse.fromXml(_s.XmlElement elem) {
    return GetFederationTokenResponse(
      credentials: _s
          .extractXmlChild(elem, 'Credentials')
          ?.let((e) => Credentials.fromXml(e)),
      federatedUser: _s
          .extractXmlChild(elem, 'FederatedUser')
          ?.let((e) => FederatedUser.fromXml(e)),
      packedPolicySize: _s.extractXmlIntValue(elem, 'PackedPolicySize'),
    );
  }
}

/// Contains the response to a successful <a>GetSessionToken</a> request,
/// including temporary AWS credentials that can be used to make AWS requests.
class GetSessionTokenResponse {
  /// The temporary security credentials, which include an access key ID, a secret
  /// access key, and a security (or session) token.
  /// <note>
  /// The size of the security token that STS API operations return is not fixed.
  /// We strongly recommend that you make no assumptions about the maximum size.
  /// </note>
  final Credentials credentials;

  GetSessionTokenResponse({
    this.credentials,
  });
  factory GetSessionTokenResponse.fromXml(_s.XmlElement elem) {
    return GetSessionTokenResponse(
      credentials: _s
          .extractXmlChild(elem, 'Credentials')
          ?.let((e) => Credentials.fromXml(e)),
    );
  }
}

/// A reference to the IAM managed policy that is passed as a session policy for
/// a role session or a federated user session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PolicyDescriptorType {
  /// The Amazon Resource Name (ARN) of the IAM managed policy to use as a session
  /// policy for the role. For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  @_s.JsonKey(name: 'arn')
  final String arn;

  PolicyDescriptorType({
    this.arn,
  });
  Map<String, dynamic> toJson() => _$PolicyDescriptorTypeToJson(this);
}

/// You can pass custom key-value pair attributes when you assume a role or
/// federate a user. These are called session tags. You can then use the session
/// tags to control access to resources. For more information, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_session-tags.html">Tagging
/// AWS STS Sessions</a> in the <i>IAM User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The key for a session tag.
  ///
  /// You can pass up to 50 session tags. The plain text session tag keys can’t
  /// exceed 128 characters. For these and additional limits, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM
  /// and STS Character Limits</a> in the <i>IAM User Guide</i>.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value for a session tag.
  ///
  /// You can pass up to 50 session tags. The plain text session tag values can’t
  /// exceed 256 characters. For these and additional limits, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-limits.html#reference_iam-limits-entity-length">IAM
  /// and STS Character Limits</a> in the <i>IAM User Guide</i>.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

class ExpiredTokenException extends _s.GenericAwsException {
  ExpiredTokenException({String type, String message})
      : super(type: type, code: 'ExpiredTokenException', message: message);
}

class IDPCommunicationErrorException extends _s.GenericAwsException {
  IDPCommunicationErrorException({String type, String message})
      : super(
            type: type,
            code: 'IDPCommunicationErrorException',
            message: message);
}

class IDPRejectedClaimException extends _s.GenericAwsException {
  IDPRejectedClaimException({String type, String message})
      : super(type: type, code: 'IDPRejectedClaimException', message: message);
}

class InvalidAuthorizationMessageException extends _s.GenericAwsException {
  InvalidAuthorizationMessageException({String type, String message})
      : super(
            type: type,
            code: 'InvalidAuthorizationMessageException',
            message: message);
}

class InvalidIdentityTokenException extends _s.GenericAwsException {
  InvalidIdentityTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidIdentityTokenException',
            message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String type, String message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class PackedPolicyTooLargeException extends _s.GenericAwsException {
  PackedPolicyTooLargeException({String type, String message})
      : super(
            type: type,
            code: 'PackedPolicyTooLargeException',
            message: message);
}

class RegionDisabledException extends _s.GenericAwsException {
  RegionDisabledException({String type, String message})
      : super(type: type, code: 'RegionDisabledException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ExpiredTokenException': (type, message) =>
      ExpiredTokenException(type: type, message: message),
  'IDPCommunicationErrorException': (type, message) =>
      IDPCommunicationErrorException(type: type, message: message),
  'IDPRejectedClaimException': (type, message) =>
      IDPRejectedClaimException(type: type, message: message),
  'InvalidAuthorizationMessageException': (type, message) =>
      InvalidAuthorizationMessageException(type: type, message: message),
  'InvalidIdentityTokenException': (type, message) =>
      InvalidIdentityTokenException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
  'PackedPolicyTooLargeException': (type, message) =>
      PackedPolicyTooLargeException(type: type, message: message),
  'RegionDisabledException': (type, message) =>
      RegionDisabledException(type: type, message: message),
};
