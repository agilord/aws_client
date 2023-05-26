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

/// Operations for Amazon Web Services Account Management
class Account {
  final _s.RestJsonProtocol _protocol;
  Account({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'account',
            signingName: 'account',
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

  /// Deletes the specified alternate contact from an Amazon Web Services
  /// account.
  ///
  /// For complete details about how to use the alternate contact operations,
  /// see <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact.html">Access
  /// or updating the alternate contacts</a>.
  /// <note>
  /// Before you can update the alternate contact information for an Amazon Web
  /// Services account that is managed by Organizations, you must first enable
  /// integration between Amazon Web Services Account Management and
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/using-orgs-trusted-access.html">Enabling
  /// trusted access for Amazon Web Services Account Management</a>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [alternateContactType] :
  /// Specifies which of the alternate contacts to delete.
  ///
  /// Parameter [accountId] :
  /// Specifies the 12 digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation.
  ///
  /// If you do not specify this parameter, it defaults to the Amazon Web
  /// Services account of the identity used to call the operation.
  ///
  /// To use this parameter, the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account, and the
  /// specified account ID must be a member account in the same organization.
  /// The organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>; it
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, then don't specify this parameter, and call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<void> deleteAlternateContact({
    required AlternateContactType alternateContactType,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'AlternateContactType': alternateContactType.toValue(),
      if (accountId != null) 'AccountId': accountId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteAlternateContact',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables (opts-out) a particular Region for an account.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [regionName] :
  /// Specifies the Region-code for a given Region name (for example,
  /// <code>af-south-1</code>). When you disable a Region, Amazon Web Services
  /// performs actions to deactivate that Region in your account, such as
  /// destroying IAM resources in the Region. This process takes a few minutes
  /// for most accounts, but this can take several hours. You cannot enable the
  /// Region until the disabling process is fully completed.
  ///
  /// Parameter [accountId] :
  /// Specifies the 12-digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation. If you
  /// don't specify this parameter, it defaults to the Amazon Web Services
  /// account of the identity used to call the operation. To use this parameter,
  /// the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account. The specified
  /// account ID must also be a member account in the same organization. The
  /// organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>. It
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, don't specify this parameter. Instead, call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<void> disableRegion({
    required String regionName,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'RegionName': regionName,
      if (accountId != null) 'AccountId': accountId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disableRegion',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables (opts-in) a particular Region for an account.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [regionName] :
  /// Specifies the Region-code for a given Region name (for example,
  /// <code>af-south-1</code>). When you enable a Region, Amazon Web Services
  /// performs actions to prepare your account in that Region, such as
  /// distributing your IAM resources to the Region. This process takes a few
  /// minutes for most accounts, but it can take several hours. You cannot use
  /// the Region until this process is complete. Furthermore, you cannot disable
  /// the Region until the enabling process is fully completed.
  ///
  /// Parameter [accountId] :
  /// Specifies the 12-digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation. If you
  /// don't specify this parameter, it defaults to the Amazon Web Services
  /// account of the identity used to call the operation. To use this parameter,
  /// the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account. The specified
  /// account ID must also be a member account in the same organization. The
  /// organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>. It
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, don't specify this parameter. Instead, call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<void> enableRegion({
    required String regionName,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'RegionName': regionName,
      if (accountId != null) 'AccountId': accountId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/enableRegion',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the specified alternate contact attached to an Amazon Web
  /// Services account.
  ///
  /// For complete details about how to use the alternate contact operations,
  /// see <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact.html">Access
  /// or updating the alternate contacts</a>.
  /// <note>
  /// Before you can update the alternate contact information for an Amazon Web
  /// Services account that is managed by Organizations, you must first enable
  /// integration between Amazon Web Services Account Management and
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/using-orgs-trusted-access.html">Enabling
  /// trusted access for Amazon Web Services Account Management</a>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [alternateContactType] :
  /// Specifies which alternate contact you want to retrieve.
  ///
  /// Parameter [accountId] :
  /// Specifies the 12 digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation.
  ///
  /// If you do not specify this parameter, it defaults to the Amazon Web
  /// Services account of the identity used to call the operation.
  ///
  /// To use this parameter, the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account, and the
  /// specified account ID must be a member account in the same organization.
  /// The organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>; it
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, then don't specify this parameter, and call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<GetAlternateContactResponse> getAlternateContact({
    required AlternateContactType alternateContactType,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'AlternateContactType': alternateContactType.toValue(),
      if (accountId != null) 'AccountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getAlternateContact',
      exceptionFnMap: _exceptionFns,
    );
    return GetAlternateContactResponse.fromJson(response);
  }

  /// Retrieves the primary contact information of an Amazon Web Services
  /// account.
  ///
  /// For complete details about how to use the primary contact operations, see
  /// <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact.html">Update
  /// the primary and alternate contact information</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountId] :
  /// Specifies the 12-digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation. If you
  /// don't specify this parameter, it defaults to the Amazon Web Services
  /// account of the identity used to call the operation. To use this parameter,
  /// the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account. The specified
  /// account ID must also be a member account in the same organization. The
  /// organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>. It
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, don't specify this parameter. Instead, call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<GetContactInformationResponse> getContactInformation({
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      if (accountId != null) 'AccountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getContactInformation',
      exceptionFnMap: _exceptionFns,
    );
    return GetContactInformationResponse.fromJson(response);
  }

  /// Retrieves the opt-in status of a particular Region.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [regionName] :
  /// Specifies the Region-code for a given Region name (for example,
  /// <code>af-south-1</code>). This function will return the status of whatever
  /// Region you pass into this parameter.
  ///
  /// Parameter [accountId] :
  /// Specifies the 12-digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation. If you
  /// don't specify this parameter, it defaults to the Amazon Web Services
  /// account of the identity used to call the operation. To use this parameter,
  /// the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account. The specified
  /// account ID must also be a member account in the same organization. The
  /// organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>. It
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, don't specify this parameter. Instead, call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<GetRegionOptStatusResponse> getRegionOptStatus({
    required String regionName,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'RegionName': regionName,
      if (accountId != null) 'AccountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getRegionOptStatus',
      exceptionFnMap: _exceptionFns,
    );
    return GetRegionOptStatusResponse.fromJson(response);
  }

  /// Lists all the Regions for a given account and their respective opt-in
  /// statuses. Optionally, this list can be filtered by the
  /// <code>region-opt-status-contains</code> parameter.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountId] :
  /// Specifies the 12-digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation. If you
  /// don't specify this parameter, it defaults to the Amazon Web Services
  /// account of the identity used to call the operation. To use this parameter,
  /// the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account. The specified
  /// account ID must also be a member account in the same organization. The
  /// organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>. It
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, don't specify this parameter. Instead, call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return in the command’s output. If the total
  /// number of items available is more than the value specified, a
  /// <code>NextToken</code> is provided in the command’s output. To resume
  /// pagination, provide the <code>NextToken</code> value in the
  /// <code>starting-token</code> argument of a subsequent command. Do not use
  /// the <code>NextToken</code> response element directly outside of the Amazon
  /// Web Services CLI. For usage examples, see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/pagination.html">Pagination</a>
  /// in the <i>Amazon Web Services Command Line Interface User Guide</i>.
  ///
  /// Parameter [nextToken] :
  /// A token used to specify where to start paginating. This is the
  /// <code>NextToken</code> from a previously truncated response. For usage
  /// examples, see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/pagination.html">Pagination</a>
  /// in the <i>Amazon Web Services Command Line Interface User Guide</i>.
  ///
  /// Parameter [regionOptStatusContains] :
  /// A list of Region statuses (Enabling, Enabled, Disabling, Disabled,
  /// Enabled_by_default) to use to filter the list of Regions for a given
  /// account. For example, passing in a value of ENABLING will only return a
  /// list of Regions with a Region status of ENABLING.
  Future<ListRegionsResponse> listRegions({
    String? accountId,
    int? maxResults,
    String? nextToken,
    List<RegionOptStatus>? regionOptStatusContains,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (accountId != null) 'AccountId': accountId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (regionOptStatusContains != null)
        'RegionOptStatusContains':
            regionOptStatusContains.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listRegions',
      exceptionFnMap: _exceptionFns,
    );
    return ListRegionsResponse.fromJson(response);
  }

  /// Modifies the specified alternate contact attached to an Amazon Web
  /// Services account.
  ///
  /// For complete details about how to use the alternate contact operations,
  /// see <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact.html">Access
  /// or updating the alternate contacts</a>.
  /// <note>
  /// Before you can update the alternate contact information for an Amazon Web
  /// Services account that is managed by Organizations, you must first enable
  /// integration between Amazon Web Services Account Management and
  /// Organizations. For more information, see <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/using-orgs-trusted-access.html">Enabling
  /// trusted access for Amazon Web Services Account Management</a>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [alternateContactType] :
  /// Specifies which alternate contact you want to create or update.
  ///
  /// Parameter [emailAddress] :
  /// Specifies an email address for the alternate contact.
  ///
  /// Parameter [name] :
  /// Specifies a name for the alternate contact.
  ///
  /// Parameter [phoneNumber] :
  /// Specifies a phone number for the alternate contact.
  ///
  /// Parameter [title] :
  /// Specifies a title for the alternate contact.
  ///
  /// Parameter [accountId] :
  /// Specifies the 12 digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation.
  ///
  /// If you do not specify this parameter, it defaults to the Amazon Web
  /// Services account of the identity used to call the operation.
  ///
  /// To use this parameter, the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account, and the
  /// specified account ID must be a member account in the same organization.
  /// The organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>; it
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, then don't specify this parameter, and call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<void> putAlternateContact({
    required AlternateContactType alternateContactType,
    required String emailAddress,
    required String name,
    required String phoneNumber,
    required String title,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'AlternateContactType': alternateContactType.toValue(),
      'EmailAddress': emailAddress,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Title': title,
      if (accountId != null) 'AccountId': accountId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/putAlternateContact',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the primary contact information of an Amazon Web Services account.
  ///
  /// For complete details about how to use the primary contact operations, see
  /// <a
  /// href="https://docs.aws.amazon.com/accounts/latest/reference/manage-acct-update-contact.html">Update
  /// the primary and alternate contact information</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [contactInformation] :
  /// Contains the details of the primary contact information associated with an
  /// Amazon Web Services account.
  ///
  /// Parameter [accountId] :
  /// Specifies the 12-digit account ID number of the Amazon Web Services
  /// account that you want to access or modify with this operation. If you
  /// don't specify this parameter, it defaults to the Amazon Web Services
  /// account of the identity used to call the operation. To use this parameter,
  /// the caller must be an identity in the <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account">organization's
  /// management account</a> or a delegated administrator account. The specified
  /// account ID must also be a member account in the same organization. The
  /// organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html">all
  /// features enabled</a>, and the organization must have <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-trusted-access.html">trusted
  /// access</a> enabled for the Account Management service, and optionally a <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/using-orgs-delegated-admin.html">delegated
  /// admin</a> account assigned.
  /// <note>
  /// The management account can't specify its own <code>AccountId</code>. It
  /// must call the operation in standalone context by not including the
  /// <code>AccountId</code> parameter.
  /// </note>
  /// To call this operation on an account that is not a member of an
  /// organization, don't specify this parameter. Instead, call the operation
  /// using an identity belonging to the account whose contacts you wish to
  /// retrieve or modify.
  Future<void> putContactInformation({
    required ContactInformation contactInformation,
    String? accountId,
  }) async {
    final $payload = <String, dynamic>{
      'ContactInformation': contactInformation,
      if (accountId != null) 'AccountId': accountId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/putContactInformation',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// A structure that contains the details of an alternate contact associated
/// with an Amazon Web Services account
class AlternateContact {
  /// The type of alternate contact.
  final AlternateContactType? alternateContactType;

  /// The email address associated with this alternate contact.
  final String? emailAddress;

  /// The name associated with this alternate contact.
  final String? name;

  /// The phone number associated with this alternate contact.
  final String? phoneNumber;

  /// The title associated with this alternate contact.
  final String? title;

  AlternateContact({
    this.alternateContactType,
    this.emailAddress,
    this.name,
    this.phoneNumber,
    this.title,
  });

  factory AlternateContact.fromJson(Map<String, dynamic> json) {
    return AlternateContact(
      alternateContactType:
          (json['AlternateContactType'] as String?)?.toAlternateContactType(),
      emailAddress: json['EmailAddress'] as String?,
      name: json['Name'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alternateContactType = this.alternateContactType;
    final emailAddress = this.emailAddress;
    final name = this.name;
    final phoneNumber = this.phoneNumber;
    final title = this.title;
    return {
      if (alternateContactType != null)
        'AlternateContactType': alternateContactType.toValue(),
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (name != null) 'Name': name,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (title != null) 'Title': title,
    };
  }
}

enum AlternateContactType {
  billing,
  operations,
  security,
}

extension AlternateContactTypeValueExtension on AlternateContactType {
  String toValue() {
    switch (this) {
      case AlternateContactType.billing:
        return 'BILLING';
      case AlternateContactType.operations:
        return 'OPERATIONS';
      case AlternateContactType.security:
        return 'SECURITY';
    }
  }
}

extension AlternateContactTypeFromString on String {
  AlternateContactType toAlternateContactType() {
    switch (this) {
      case 'BILLING':
        return AlternateContactType.billing;
      case 'OPERATIONS':
        return AlternateContactType.operations;
      case 'SECURITY':
        return AlternateContactType.security;
    }
    throw Exception('$this is not known in enum AlternateContactType');
  }
}

/// Contains the details of the primary contact information associated with an
/// Amazon Web Services account.
class ContactInformation {
  /// The first line of the primary contact address.
  final String addressLine1;

  /// The city of the primary contact address.
  final String city;

  /// The ISO-3166 two-letter country code for the primary contact address.
  final String countryCode;

  /// The full name of the primary contact address.
  final String fullName;

  /// The phone number of the primary contact information. The number will be
  /// validated and, in some countries, checked for activation.
  final String phoneNumber;

  /// The postal code of the primary contact address.
  final String postalCode;

  /// The second line of the primary contact address, if any.
  final String? addressLine2;

  /// The third line of the primary contact address, if any.
  final String? addressLine3;

  /// The name of the company associated with the primary contact information, if
  /// any.
  final String? companyName;

  /// The district or county of the primary contact address, if any.
  final String? districtOrCounty;

  /// The state or region of the primary contact address. This field is required
  /// in selected countries.
  final String? stateOrRegion;

  /// The URL of the website associated with the primary contact information, if
  /// any.
  final String? websiteUrl;

  ContactInformation({
    required this.addressLine1,
    required this.city,
    required this.countryCode,
    required this.fullName,
    required this.phoneNumber,
    required this.postalCode,
    this.addressLine2,
    this.addressLine3,
    this.companyName,
    this.districtOrCounty,
    this.stateOrRegion,
    this.websiteUrl,
  });

  factory ContactInformation.fromJson(Map<String, dynamic> json) {
    return ContactInformation(
      addressLine1: json['AddressLine1'] as String,
      city: json['City'] as String,
      countryCode: json['CountryCode'] as String,
      fullName: json['FullName'] as String,
      phoneNumber: json['PhoneNumber'] as String,
      postalCode: json['PostalCode'] as String,
      addressLine2: json['AddressLine2'] as String?,
      addressLine3: json['AddressLine3'] as String?,
      companyName: json['CompanyName'] as String?,
      districtOrCounty: json['DistrictOrCounty'] as String?,
      stateOrRegion: json['StateOrRegion'] as String?,
      websiteUrl: json['WebsiteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressLine1 = this.addressLine1;
    final city = this.city;
    final countryCode = this.countryCode;
    final fullName = this.fullName;
    final phoneNumber = this.phoneNumber;
    final postalCode = this.postalCode;
    final addressLine2 = this.addressLine2;
    final addressLine3 = this.addressLine3;
    final companyName = this.companyName;
    final districtOrCounty = this.districtOrCounty;
    final stateOrRegion = this.stateOrRegion;
    final websiteUrl = this.websiteUrl;
    return {
      'AddressLine1': addressLine1,
      'City': city,
      'CountryCode': countryCode,
      'FullName': fullName,
      'PhoneNumber': phoneNumber,
      'PostalCode': postalCode,
      if (addressLine2 != null) 'AddressLine2': addressLine2,
      if (addressLine3 != null) 'AddressLine3': addressLine3,
      if (companyName != null) 'CompanyName': companyName,
      if (districtOrCounty != null) 'DistrictOrCounty': districtOrCounty,
      if (stateOrRegion != null) 'StateOrRegion': stateOrRegion,
      if (websiteUrl != null) 'WebsiteUrl': websiteUrl,
    };
  }
}

class GetAlternateContactResponse {
  /// A structure that contains the details for the specified alternate contact.
  final AlternateContact? alternateContact;

  GetAlternateContactResponse({
    this.alternateContact,
  });

  factory GetAlternateContactResponse.fromJson(Map<String, dynamic> json) {
    return GetAlternateContactResponse(
      alternateContact: json['AlternateContact'] != null
          ? AlternateContact.fromJson(
              json['AlternateContact'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alternateContact = this.alternateContact;
    return {
      if (alternateContact != null) 'AlternateContact': alternateContact,
    };
  }
}

class GetContactInformationResponse {
  /// Contains the details of the primary contact information associated with an
  /// Amazon Web Services account.
  final ContactInformation? contactInformation;

  GetContactInformationResponse({
    this.contactInformation,
  });

  factory GetContactInformationResponse.fromJson(Map<String, dynamic> json) {
    return GetContactInformationResponse(
      contactInformation: json['ContactInformation'] != null
          ? ContactInformation.fromJson(
              json['ContactInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contactInformation = this.contactInformation;
    return {
      if (contactInformation != null) 'ContactInformation': contactInformation,
    };
  }
}

class GetRegionOptStatusResponse {
  /// The Region code that was passed in.
  final String? regionName;

  /// One of the potential statuses a Region can undergo (Enabled, Enabling,
  /// Disabled, Disabling, Enabled_By_Default).
  final RegionOptStatus? regionOptStatus;

  GetRegionOptStatusResponse({
    this.regionName,
    this.regionOptStatus,
  });

  factory GetRegionOptStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetRegionOptStatusResponse(
      regionName: json['RegionName'] as String?,
      regionOptStatus:
          (json['RegionOptStatus'] as String?)?.toRegionOptStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final regionOptStatus = this.regionOptStatus;
    return {
      if (regionName != null) 'RegionName': regionName,
      if (regionOptStatus != null) 'RegionOptStatus': regionOptStatus.toValue(),
    };
  }
}

class ListRegionsResponse {
  /// If there is more data to be returned, this will be populated. It should be
  /// passed into the <code>next-token</code> request parameter of
  /// <code>list-regions</code>.
  final String? nextToken;

  /// This is a list of Regions for a given account, or if the filtered parameter
  /// was used, a list of Regions that match the filter criteria set in the
  /// <code>filter</code> parameter.
  final List<Region>? regions;

  ListRegionsResponse({
    this.nextToken,
    this.regions,
  });

  factory ListRegionsResponse.fromJson(Map<String, dynamic> json) {
    return ListRegionsResponse(
      nextToken: json['NextToken'] as String?,
      regions: (json['Regions'] as List?)
          ?.whereNotNull()
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final regions = this.regions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (regions != null) 'Regions': regions,
    };
  }
}

/// This is a structure that expresses the Region for a given account,
/// consisting of a name and opt-in status.
class Region {
  /// The Region code of a given Region (for example, <code>us-east-1</code>).
  final String? regionName;

  /// One of potential statuses a Region can undergo (Enabled, Enabling, Disabled,
  /// Disabling, Enabled_By_Default).
  final RegionOptStatus? regionOptStatus;

  Region({
    this.regionName,
    this.regionOptStatus,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      regionName: json['RegionName'] as String?,
      regionOptStatus:
          (json['RegionOptStatus'] as String?)?.toRegionOptStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final regionName = this.regionName;
    final regionOptStatus = this.regionOptStatus;
    return {
      if (regionName != null) 'RegionName': regionName,
      if (regionOptStatus != null) 'RegionOptStatus': regionOptStatus.toValue(),
    };
  }
}

enum RegionOptStatus {
  enabled,
  enabling,
  disabling,
  disabled,
  enabledByDefault,
}

extension RegionOptStatusValueExtension on RegionOptStatus {
  String toValue() {
    switch (this) {
      case RegionOptStatus.enabled:
        return 'ENABLED';
      case RegionOptStatus.enabling:
        return 'ENABLING';
      case RegionOptStatus.disabling:
        return 'DISABLING';
      case RegionOptStatus.disabled:
        return 'DISABLED';
      case RegionOptStatus.enabledByDefault:
        return 'ENABLED_BY_DEFAULT';
    }
  }
}

extension RegionOptStatusFromString on String {
  RegionOptStatus toRegionOptStatus() {
    switch (this) {
      case 'ENABLED':
        return RegionOptStatus.enabled;
      case 'ENABLING':
        return RegionOptStatus.enabling;
      case 'DISABLING':
        return RegionOptStatus.disabling;
      case 'DISABLED':
        return RegionOptStatus.disabled;
      case 'ENABLED_BY_DEFAULT':
        return RegionOptStatus.enabledByDefault;
    }
    throw Exception('$this is not known in enum RegionOptStatus');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
