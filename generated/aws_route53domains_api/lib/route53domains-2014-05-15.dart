// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon Route 53 API actions let you register domain names and perform
/// related operations.
class Route53Domains {
  final _s.JsonProtocol _protocol;
  Route53Domains({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53domains',
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

  /// Accepts the transfer of a domain from another Amazon Web Services account
  /// to the currentAmazon Web Services account. You initiate a transfer between
  /// Amazon Web Services accounts using <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>.
  ///
  /// If you use the CLI command at <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/route53domains/accept-domain-transfer-from-another-aws-account.html">accept-domain-transfer-from-another-aws-account</a>,
  /// use JSON format as input instead of text because otherwise CLI will throw
  /// an error from domain transfer input that includes single quotes.
  ///
  /// Use either <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// to determine whether the operation succeeded. <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// provides additional information, for example, <code>Domain Transfer from
  /// Aws Account 111122223333 has been cancelled</code>.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [DomainLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that was specified when another Amazon Web Services
  /// account submitted a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>
  /// request.
  ///
  /// Parameter [password] :
  /// The password that was returned by the <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>
  /// request.
  Future<AcceptDomainTransferFromAnotherAwsAccountResponse>
      acceptDomainTransferFromAnotherAwsAccount({
    required String domainName,
    required String password,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53Domains_v20140515.AcceptDomainTransferFromAnotherAwsAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'Password': password,
      },
    );

    return AcceptDomainTransferFromAnotherAwsAccountResponse.fromJson(
        jsonResponse.body);
  }

  /// Creates a delegation signer (DS) record in the registry zone for this
  /// domain name.
  ///
  /// Note that creating DS record at the registry impacts DNSSEC validation of
  /// your DNS records. This action may render your domain name unavailable on
  /// the internet if the steps are completed in the wrong order, or with
  /// incorrect timing. For more information about DNSSEC signing, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring-dnssec.html">Configuring
  /// DNSSEC signing</a> in the <i>Route 53 developer guide</i>.
  ///
  /// May throw [DuplicateRequest].
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [TLDRulesViolation].
  /// May throw [UnsupportedTLD].
  /// May throw [DnssecLimitExceeded].
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [signingAttributes] :
  /// The information about a key, including the algorithm, public key-value,
  /// and flags.
  Future<AssociateDelegationSignerToDomainResponse>
      associateDelegationSignerToDomain({
    required String domainName,
    required DnssecSigningAttributes signingAttributes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53Domains_v20140515.AssociateDelegationSignerToDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'SigningAttributes': signingAttributes,
      },
    );

    return AssociateDelegationSignerToDomainResponse.fromJson(
        jsonResponse.body);
  }

  /// Cancels the transfer of a domain from the current Amazon Web Services
  /// account to another Amazon Web Services account. You initiate a transfer
  /// betweenAmazon Web Services accounts using <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>.
  /// <important>
  /// You must cancel the transfer before the other Amazon Web Services account
  /// accepts the transfer using <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>.
  /// </important>
  /// Use either <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// to determine whether the operation succeeded. <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// provides additional information, for example, <code>Domain Transfer from
  /// Aws Account 111122223333 has been cancelled</code>.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain for which you want to cancel the transfer to
  /// another Amazon Web Services account.
  Future<CancelDomainTransferToAnotherAwsAccountResponse>
      cancelDomainTransferToAnotherAwsAccount({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53Domains_v20140515.CancelDomainTransferToAnotherAwsAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return CancelDomainTransferToAnotherAwsAccountResponse.fromJson(
        jsonResponse.body);
  }

  /// This operation checks the availability of one domain name. Note that if
  /// the availability status of a domain is pending, you must submit another
  /// request to determine the availability of the domain name.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to get availability for. The
  /// top-level domain (TLD), such as .com, must be a TLD that Route 53
  /// supports. For a list of supported TLDs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// The domain name can contain only the following characters:
  ///
  /// <ul>
  /// <li>
  /// Letters a through z. Domain names are not case sensitive.
  /// </li>
  /// <li>
  /// Numbers 0 through 9.
  /// </li>
  /// <li>
  /// Hyphen (-). You can't specify a hyphen at the beginning or end of a label.
  /// </li>
  /// <li>
  /// Period (.) to separate the labels in the name, such as the <code>.</code>
  /// in <code>example.com</code>.
  /// </li>
  /// </ul>
  /// Internationalized domain names are not supported for some top-level
  /// domains. To determine whether the TLD that you want to use supports
  /// internationalized domain names, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns">Formatting
  /// Internationalized Domain Names</a>.
  ///
  /// Parameter [idnLangCode] :
  /// Reserved for future use.
  Future<CheckDomainAvailabilityResponse> checkDomainAvailability({
    required String domainName,
    String? idnLangCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.CheckDomainAvailability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        if (idnLangCode != null) 'IdnLangCode': idnLangCode,
      },
    );

    return CheckDomainAvailabilityResponse.fromJson(jsonResponse.body);
  }

  /// Checks whether a domain name can be transferred to Amazon Route 53.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to transfer to Route 53. The
  /// top-level domain (TLD), such as .com, must be a TLD that Route 53
  /// supports. For a list of supported TLDs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// The domain name can contain only the following characters:
  ///
  /// <ul>
  /// <li>
  /// Letters a through z. Domain names are not case sensitive.
  /// </li>
  /// <li>
  /// Numbers 0 through 9.
  /// </li>
  /// <li>
  /// Hyphen (-). You can't specify a hyphen at the beginning or end of a label.
  /// </li>
  /// <li>
  /// Period (.) to separate the labels in the name, such as the <code>.</code>
  /// in <code>example.com</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [authCode] :
  /// If the registrar for the top-level domain (TLD) requires an authorization
  /// code to transfer the domain, the code that you got from the current
  /// registrar for the domain.
  Future<CheckDomainTransferabilityResponse> checkDomainTransferability({
    required String domainName,
    String? authCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.CheckDomainTransferability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        if (authCode != null) 'AuthCode': authCode,
      },
    );

    return CheckDomainTransferabilityResponse.fromJson(jsonResponse.body);
  }

  /// This operation deletes the specified domain. This action is permanent. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-delete.html">Deleting
  /// a domain name registration</a>.
  ///
  /// To transfer the domain registration to another registrar, use the transfer
  /// process that’s provided by the registrar to which you want to transfer the
  /// registration. Otherwise, the following apply:
  /// <ol>
  /// <li>
  /// You can’t get a refund for the cost of a deleted domain registration.
  /// </li>
  /// <li>
  /// The registry for the top-level domain might hold the domain name for a
  /// brief time before releasing it for other users to register (varies by
  /// registry).
  /// </li>
  /// <li>
  /// When the registration has been deleted, we'll send you a confirmation to
  /// the registrant contact. The email will come from
  /// <code>noreply@domainnameverification.net</code> or
  /// <code>noreply@registrar.amazon.com</code>.
  /// </li> </ol>
  ///
  /// May throw [InvalidInput].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// Name of the domain to be deleted.
  Future<DeleteDomainResponse> deleteDomain({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.DeleteDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return DeleteDomainResponse.fromJson(jsonResponse.body);
  }

  /// This operation deletes the specified tags for a domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The domain for which you want to delete one or more tags.
  ///
  /// Parameter [tagsToDelete] :
  /// A list of tag keys to delete.
  Future<void> deleteTagsForDomain({
    required String domainName,
    required List<String> tagsToDelete,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.DeleteTagsForDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'TagsToDelete': tagsToDelete,
      },
    );
  }

  /// This operation disables automatic renewal of domain registration for the
  /// specified domain.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to disable automatic renewal for.
  Future<void> disableDomainAutoRenew({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.DisableDomainAutoRenew'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );
  }

  /// This operation removes the transfer lock on the domain (specifically the
  /// <code>clientTransferProhibited</code> status) to allow domain transfers.
  /// We recommend you refrain from performing this action unless you intend to
  /// transfer the domain to a different registrar. Successful submission
  /// returns an operation ID that you can use to track the progress and
  /// completion of the action. If the request is not completed successfully,
  /// the domain registrant will be notified by email.
  ///
  /// May throw [InvalidInput].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to remove the transfer lock for.
  Future<DisableDomainTransferLockResponse> disableDomainTransferLock({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.DisableDomainTransferLock'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return DisableDomainTransferLockResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a delegation signer (DS) record in the registry zone for this
  /// domain name.
  ///
  /// May throw [DuplicateRequest].
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [TLDRulesViolation].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// Name of the domain.
  ///
  /// Parameter [id] :
  /// An internal identification number assigned to each DS record after it’s
  /// created. You can retrieve it as part of DNSSEC information returned by <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetDomainDetail.html">GetDomainDetail</a>.
  Future<DisassociateDelegationSignerFromDomainResponse>
      disassociateDelegationSignerFromDomain({
    required String domainName,
    required String id,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53Domains_v20140515.DisassociateDelegationSignerFromDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'Id': id,
      },
    );

    return DisassociateDelegationSignerFromDomainResponse.fromJson(
        jsonResponse.body);
  }

  /// This operation configures Amazon Route 53 to automatically renew the
  /// specified domain before the domain registration expires. The cost of
  /// renewing your domain registration is billed to your Amazon Web Services
  /// account.
  ///
  /// The period during which you can renew a domain name varies by TLD. For a
  /// list of TLDs and their renewal policies, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// That You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>. Route 53 requires that you renew before the end of
  /// the renewal period so we can complete processing before the deadline.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  /// May throw [TLDRulesViolation].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to enable automatic renewal for.
  Future<void> enableDomainAutoRenew({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.EnableDomainAutoRenew'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );
  }

  /// This operation sets the transfer lock on the domain (specifically the
  /// <code>clientTransferProhibited</code> status) to prevent domain transfers.
  /// Successful submission returns an operation ID that you can use to track
  /// the progress and completion of the action. If the request is not completed
  /// successfully, the domain registrant will be notified by email.
  ///
  /// May throw [InvalidInput].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to set the transfer lock for.
  Future<EnableDomainTransferLockResponse> enableDomainTransferLock({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.EnableDomainTransferLock'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return EnableDomainTransferLockResponse.fromJson(jsonResponse.body);
  }

  /// For operations that require confirmation that the email address for the
  /// registrant contact is valid, such as registering a new domain, this
  /// operation returns information about whether the registrant contact has
  /// responded.
  ///
  /// If you want us to resend the email, use the
  /// <code>ResendContactReachabilityEmail</code> operation.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain for which you want to know whether the registrant
  /// contact has confirmed that the email address is valid.
  Future<GetContactReachabilityStatusResponse> getContactReachabilityStatus({
    String? domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.GetContactReachabilityStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (domainName != null) 'domainName': domainName,
      },
    );

    return GetContactReachabilityStatusResponse.fromJson(jsonResponse.body);
  }

  /// This operation returns detailed information about a specified domain that
  /// is associated with the current Amazon Web Services account. Contact
  /// information for the domain is also returned as part of the output.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to get detailed information about.
  Future<GetDomainDetailResponse> getDomainDetail({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.GetDomainDetail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return GetDomainDetailResponse.fromJson(jsonResponse.body);
  }

  /// The GetDomainSuggestions operation returns a list of suggested domain
  /// names.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// A domain name that you want to use as the basis for a list of possible
  /// domain names. The top-level domain (TLD), such as .com, must be a TLD that
  /// Route 53 supports. For a list of supported TLDs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// The domain name can contain only the following characters:
  ///
  /// <ul>
  /// <li>
  /// Letters a through z. Domain names are not case sensitive.
  /// </li>
  /// <li>
  /// Numbers 0 through 9.
  /// </li>
  /// <li>
  /// Hyphen (-). You can't specify a hyphen at the beginning or end of a label.
  /// </li>
  /// <li>
  /// Period (.) to separate the labels in the name, such as the <code>.</code>
  /// in <code>example.com</code>.
  /// </li>
  /// </ul>
  /// Internationalized domain names are not supported for some top-level
  /// domains. To determine whether the TLD that you want to use supports
  /// internationalized domain names, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a>.
  ///
  /// Parameter [onlyAvailable] :
  /// If <code>OnlyAvailable</code> is <code>true</code>, Route 53 returns only
  /// domain names that are available. If <code>OnlyAvailable</code> is
  /// <code>false</code>, Route 53 returns domain names without checking whether
  /// they're available to be registered. To determine whether the domain is
  /// available, you can call <code>checkDomainAvailability</code> for each
  /// suggestion.
  ///
  /// Parameter [suggestionCount] :
  /// The number of suggested domain names that you want Route 53 to return.
  /// Specify a value between 1 and 50.
  Future<GetDomainSuggestionsResponse> getDomainSuggestions({
    required String domainName,
    required bool onlyAvailable,
    required int suggestionCount,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.GetDomainSuggestions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'OnlyAvailable': onlyAvailable,
        'SuggestionCount': suggestionCount,
      },
    );

    return GetDomainSuggestionsResponse.fromJson(jsonResponse.body);
  }

  /// This operation returns the current status of an operation that is not
  /// completed.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [operationId] :
  /// The identifier for the operation for which you want to get the status.
  /// Route 53 returned the identifier in the response to the original request.
  Future<GetOperationDetailResponse> getOperationDetail({
    required String operationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.GetOperationDetail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OperationId': operationId,
      },
    );

    return GetOperationDetailResponse.fromJson(jsonResponse.body);
  }

  /// This operation returns all the domain names registered with Amazon Route
  /// 53 for the current Amazon Web Services account if no filtering conditions
  /// are used.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [filterConditions] :
  /// A complex type that contains information about the filters applied during
  /// the <code>ListDomains</code> request. The filter conditions can include
  /// domain name and domain expiration.
  ///
  /// Parameter [marker] :
  /// For an initial request for a list of domains, omit this element. If the
  /// number of domains that are associated with the current Amazon Web Services
  /// account is greater than the value that you specified for
  /// <code>MaxItems</code>, you can use <code>Marker</code> to return
  /// additional domains. Get the value of <code>NextPageMarker</code> from the
  /// previous response, and submit another request that includes the value of
  /// <code>NextPageMarker</code> in the <code>Marker</code> element.
  ///
  /// Constraints: The marker must match the value specified in the previous
  /// request.
  ///
  /// Parameter [maxItems] :
  /// Number of domains to be returned.
  ///
  /// Default: 20
  ///
  /// Parameter [sortCondition] :
  /// A complex type that contains information about the requested ordering of
  /// domains in the returned list.
  Future<ListDomainsResponse> listDomains({
    List<FilterCondition>? filterConditions,
    String? marker,
    int? maxItems,
    SortCondition? sortCondition,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.ListDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filterConditions != null) 'FilterConditions': filterConditions,
        if (marker != null) 'Marker': marker,
        if (maxItems != null) 'MaxItems': maxItems,
        if (sortCondition != null) 'SortCondition': sortCondition,
      },
    );

    return ListDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about all of the operations that return an operation
  /// ID and that have ever been performed on domains that were registered by
  /// the current account.
  ///
  /// This command runs only in the us-east-1 Region.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [marker] :
  /// For an initial request for a list of operations, omit this element. If the
  /// number of operations that are not yet complete is greater than the value
  /// that you specified for <code>MaxItems</code>, you can use
  /// <code>Marker</code> to return additional operations. Get the value of
  /// <code>NextPageMarker</code> from the previous response, and submit another
  /// request that includes the value of <code>NextPageMarker</code> in the
  /// <code>Marker</code> element.
  ///
  /// Parameter [maxItems] :
  /// Number of domains to be returned.
  ///
  /// Default: 20
  ///
  /// Parameter [sortBy] :
  /// The sort type for returned values.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for returned values, either ascending or descending.
  ///
  /// Parameter [status] :
  /// The status of the operations.
  ///
  /// Parameter [submittedSince] :
  /// An optional parameter that lets you get information about all the
  /// operations that you submitted after a specified date and time. Specify the
  /// date and time in Unix time format and Coordinated Universal time (UTC).
  ///
  /// Parameter [type] :
  /// An arrays of the domains operation types.
  Future<ListOperationsResponse> listOperations({
    String? marker,
    int? maxItems,
    ListOperationsSortAttributeName? sortBy,
    SortOrder? sortOrder,
    List<OperationStatus>? status,
    DateTime? submittedSince,
    List<OperationType>? type,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.ListOperations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (marker != null) 'Marker': marker,
        if (maxItems != null) 'MaxItems': maxItems,
        if (sortBy != null) 'SortBy': sortBy.value,
        if (sortOrder != null) 'SortOrder': sortOrder.value,
        if (status != null) 'Status': status.map((e) => e.value).toList(),
        if (submittedSince != null)
          'SubmittedSince': unixTimestampToJson(submittedSince),
        if (type != null) 'Type': type.map((e) => e.value).toList(),
      },
    );

    return ListOperationsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the following prices for either all the TLDs supported by Route 53,
  /// or the specified TLD:
  ///
  /// <ul>
  /// <li>
  /// Registration
  /// </li>
  /// <li>
  /// Transfer
  /// </li>
  /// <li>
  /// Owner change
  /// </li>
  /// <li>
  /// Domain renewal
  /// </li>
  /// <li>
  /// Domain restoration
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [marker] :
  /// For an initial request for a list of prices, omit this element. If the
  /// number of prices that are not yet complete is greater than the value that
  /// you specified for <code>MaxItems</code>, you can use <code>Marker</code>
  /// to return additional prices. Get the value of <code>NextPageMarker</code>
  /// from the previous response, and submit another request that includes the
  /// value of <code>NextPageMarker</code> in the <code>Marker</code> element.
  ///
  /// Used only for all TLDs. If you specify a TLD, don't specify a
  /// <code>Marker</code>.
  ///
  /// Parameter [maxItems] :
  /// Number of <code>Prices</code> to be returned.
  ///
  /// Used only for all TLDs. If you specify a TLD, don't specify a
  /// <code>MaxItems</code>.
  ///
  /// Parameter [tld] :
  /// The TLD for which you want to receive the pricing information. For
  /// example. <code>.net</code>.
  ///
  /// If a <code>Tld</code> value is not provided, a list of prices for all TLDs
  /// supported by Route 53 is returned.
  Future<ListPricesResponse> listPrices({
    String? marker,
    int? maxItems,
    String? tld,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.ListPrices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (marker != null) 'Marker': marker,
        if (maxItems != null) 'MaxItems': maxItems,
        if (tld != null) 'Tld': tld,
      },
    );

    return ListPricesResponse.fromJson(jsonResponse.body);
  }

  /// This operation returns all of the tags that are associated with the
  /// specified domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The domain for which you want to get a list of tags.
  Future<ListTagsForDomainResponse> listTagsForDomain({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.ListTagsForDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return ListTagsForDomainResponse.fromJson(jsonResponse.body);
  }

  /// Moves a domain from Amazon Web Services to another registrar.
  ///
  /// Supported actions:
  ///
  /// <ul>
  /// <li>
  /// Changes the IPS tags of a .uk domain, and pushes it to transit. Transit
  /// means that the domain is ready to be transferred to another registrar.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// Name of the domain.
  ///
  /// Parameter [target] :
  /// New IPS tag for the domain.
  Future<void> pushDomain({
    required String domainName,
    required String target,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.PushDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'Target': target,
      },
    );
  }

  /// This operation registers a domain. For some top-level domains (TLDs), this
  /// operation requires extra parameters.
  ///
  /// When you register a domain, Amazon Route 53 does the following:
  ///
  /// <ul>
  /// <li>
  /// Creates a Route 53 hosted zone that has the same name as the domain. Route
  /// 53 assigns four name servers to your hosted zone and automatically updates
  /// your domain registration with the names of these name servers.
  /// </li>
  /// <li>
  /// Enables auto renew, so your domain registration will renew automatically
  /// each year. We'll notify you in advance of the renewal date so you can
  /// choose whether to renew the registration.
  /// </li>
  /// <li>
  /// Optionally enables privacy protection, so WHOIS queries return contact for
  /// the registrar or the phrase "REDACTED FOR PRIVACY", or "On behalf of
  /// &lt;domain name&gt; owner." If you don't enable privacy protection, WHOIS
  /// queries return the information that you entered for the administrative,
  /// registrant, and technical contacts.
  /// <note>
  /// While some domains may allow different privacy settings per contact, we
  /// recommend specifying the same privacy setting for all contacts.
  /// </note> </li>
  /// <li>
  /// If registration is successful, returns an operation ID that you can use to
  /// track the progress and completion of the action. If the request is not
  /// completed successfully, the domain registrant is notified by email.
  /// </li>
  /// <li>
  /// Charges your Amazon Web Services account an amount based on the top-level
  /// domain. For more information, see <a
  /// href="http://aws.amazon.com/route53/pricing/">Amazon Route 53 Pricing</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [DomainLimitExceeded].
  /// May throw [OperationLimitExceeded].
  ///
  /// Parameter [adminContact] :
  /// Provides detailed contact information. For information about the values
  /// that you specify for each element, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html">ContactDetail</a>.
  ///
  /// Parameter [domainName] :
  /// The domain name that you want to register. The top-level domain (TLD),
  /// such as .com, must be a TLD that Route 53 supports. For a list of
  /// supported TLDs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// The domain name can contain only the following characters:
  ///
  /// <ul>
  /// <li>
  /// Letters a through z. Domain names are not case sensitive.
  /// </li>
  /// <li>
  /// Numbers 0 through 9.
  /// </li>
  /// <li>
  /// Hyphen (-). You can't specify a hyphen at the beginning or end of a label.
  /// </li>
  /// <li>
  /// Period (.) to separate the labels in the name, such as the <code>.</code>
  /// in <code>example.com</code>.
  /// </li>
  /// </ul>
  /// Internationalized domain names are not supported for some top-level
  /// domains. To determine whether the TLD that you want to use supports
  /// internationalized domain names, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html#domain-name-format-idns">Formatting
  /// Internationalized Domain Names</a>.
  ///
  /// Parameter [durationInYears] :
  /// The number of years that you want to register the domain for. Domains are
  /// registered for a minimum of one year. The maximum period depends on the
  /// top-level domain. For the range of valid values for your domain, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// Default: 1
  ///
  /// Parameter [registrantContact] :
  /// Provides detailed contact information. For information about the values
  /// that you specify for each element, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html">ContactDetail</a>.
  ///
  /// Parameter [techContact] :
  /// Provides detailed contact information. For information about the values
  /// that you specify for each element, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html">ContactDetail</a>.
  ///
  /// Parameter [autoRenew] :
  /// Indicates whether the domain will be automatically renewed
  /// (<code>true</code>) or not (<code>false</code>). Auto renewal only takes
  /// effect after the account is charged.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [billingContact] :
  /// Provides detailed contact information. For information about the values
  /// that you specify for each element, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ContactDetail.html">ContactDetail</a>.
  ///
  /// Parameter [idnLangCode] :
  /// Reserved for future use.
  ///
  /// Parameter [privacyProtectAdminContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the admin contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectBillingContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the billing contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  ///
  /// Parameter [privacyProtectRegistrantContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the registrant contact (the domain
  /// owner).
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectTechContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the technical contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  /// Default: <code>true</code>
  Future<RegisterDomainResponse> registerDomain({
    required ContactDetail adminContact,
    required String domainName,
    required int durationInYears,
    required ContactDetail registrantContact,
    required ContactDetail techContact,
    bool? autoRenew,
    ContactDetail? billingContact,
    String? idnLangCode,
    bool? privacyProtectAdminContact,
    bool? privacyProtectBillingContact,
    bool? privacyProtectRegistrantContact,
    bool? privacyProtectTechContact,
  }) async {
    _s.validateNumRange(
      'durationInYears',
      durationInYears,
      1,
      10,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.RegisterDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AdminContact': adminContact,
        'DomainName': domainName,
        'DurationInYears': durationInYears,
        'RegistrantContact': registrantContact,
        'TechContact': techContact,
        if (autoRenew != null) 'AutoRenew': autoRenew,
        if (billingContact != null) 'BillingContact': billingContact,
        if (idnLangCode != null) 'IdnLangCode': idnLangCode,
        if (privacyProtectAdminContact != null)
          'PrivacyProtectAdminContact': privacyProtectAdminContact,
        if (privacyProtectBillingContact != null)
          'PrivacyProtectBillingContact': privacyProtectBillingContact,
        if (privacyProtectRegistrantContact != null)
          'PrivacyProtectRegistrantContact': privacyProtectRegistrantContact,
        if (privacyProtectTechContact != null)
          'PrivacyProtectTechContact': privacyProtectTechContact,
      },
    );

    return RegisterDomainResponse.fromJson(jsonResponse.body);
  }

  /// Rejects the transfer of a domain from another Amazon Web Services account
  /// to the current Amazon Web Services account. You initiate a transfer
  /// betweenAmazon Web Services accounts using <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>.
  ///
  /// Use either <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// to determine whether the operation succeeded. <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// provides additional information, for example, <code>Domain Transfer from
  /// Aws Account 111122223333 has been cancelled</code>.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that was specified when another Amazon Web Services
  /// account submitted a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>
  /// request.
  Future<RejectDomainTransferFromAnotherAwsAccountResponse>
      rejectDomainTransferFromAnotherAwsAccount({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53Domains_v20140515.RejectDomainTransferFromAnotherAwsAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return RejectDomainTransferFromAnotherAwsAccountResponse.fromJson(
        jsonResponse.body);
  }

  /// This operation renews a domain for the specified number of years. The cost
  /// of renewing your domain is billed to your Amazon Web Services account.
  ///
  /// We recommend that you renew your domain several weeks before the
  /// expiration date. Some TLD registries delete domains before the expiration
  /// date if you haven't renewed far enough in advance. For more information
  /// about renewing domain registration, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-renew.html">Renewing
  /// Registration for a Domain</a> in the <i>Amazon Route 53 Developer
  /// Guide</i>.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [OperationLimitExceeded].
  ///
  /// Parameter [currentExpiryYear] :
  /// The year when the registration for the domain is set to expire. This value
  /// must match the current expiration date for the domain.
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to renew.
  ///
  /// Parameter [durationInYears] :
  /// The number of years that you want to renew the domain for. The maximum
  /// number of years depends on the top-level domain. For the range of valid
  /// values for your domain, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// Default: 1
  Future<RenewDomainResponse> renewDomain({
    required int currentExpiryYear,
    required String domainName,
    int? durationInYears,
  }) async {
    _s.validateNumRange(
      'durationInYears',
      durationInYears,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.RenewDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CurrentExpiryYear': currentExpiryYear,
        'DomainName': domainName,
        if (durationInYears != null) 'DurationInYears': durationInYears,
      },
    );

    return RenewDomainResponse.fromJson(jsonResponse.body);
  }

  /// For operations that require confirmation that the email address for the
  /// registrant contact is valid, such as registering a new domain, this
  /// operation resends the confirmation email to the current email address for
  /// the registrant contact.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain for which you want Route 53 to resend a
  /// confirmation email to the registrant contact.
  Future<ResendContactReachabilityEmailResponse>
      resendContactReachabilityEmail({
    String? domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.ResendContactReachabilityEmail'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (domainName != null) 'domainName': domainName,
      },
    );

    return ResendContactReachabilityEmailResponse.fromJson(jsonResponse.body);
  }

  /// Resend the form of authorization email for this operation.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [operationId] :
  /// Operation ID.
  Future<void> resendOperationAuthorization({
    required String operationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.ResendOperationAuthorization'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OperationId': operationId,
      },
    );
  }

  /// This operation returns the authorization code for the domain. To transfer
  /// a domain to another registrar, you provide this value to the new
  /// registrar.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to get an authorization code for.
  Future<RetrieveDomainAuthCodeResponse> retrieveDomainAuthCode({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.RetrieveDomainAuthCode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
      },
    );

    return RetrieveDomainAuthCodeResponse.fromJson(jsonResponse.body);
  }

  /// Transfers a domain from another registrar to Amazon Route 53.
  ///
  /// For more information about transferring domains, see the following topics:
  ///
  /// <ul>
  /// <li>
  /// For transfer requirements, a detailed procedure, and information about
  /// viewing the status of a domain that you're transferring to Route 53, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html">Transferring
  /// Registration for a Domain to Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// For information about how to transfer a domain from one Amazon Web
  /// Services account to another, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>.
  /// </li>
  /// <li>
  /// For information about how to transfer a domain to another domain
  /// registrar, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-from-route-53.html">Transferring
  /// a Domain from Amazon Route 53 to Another Registrar</a> in the <i>Amazon
  /// Route 53 Developer Guide</i>.
  /// </li>
  /// </ul> <important>
  /// During the transfer of any country code top-level domains (ccTLDs) to
  /// Route 53, except for .cc and .tv, updates to the owner contact are ignored
  /// and the owner contact data from the registry is used. You can update the
  /// owner contact after the transfer is complete. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_UpdateDomainContact.html">UpdateDomainContact</a>.
  /// </important>
  /// If the registrar for your domain is also the DNS service provider for the
  /// domain, we highly recommend that you transfer your DNS service to Route 53
  /// or to another DNS service provider before you transfer your registration.
  /// Some registrars provide free DNS service when you purchase a domain
  /// registration. When you transfer the registration, the previous registrar
  /// will not renew your domain registration and could end your DNS service at
  /// any time.
  /// <important>
  /// If the registrar for your domain is also the DNS service provider for the
  /// domain and you don't transfer DNS service to another provider, your
  /// website, email, and the web applications associated with the domain might
  /// become unavailable.
  /// </important>
  /// If the transfer is successful, this method returns an operation ID that
  /// you can use to track the progress and completion of the action. If the
  /// transfer doesn't complete successfully, the domain registrant will be
  /// notified by email.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [DomainLimitExceeded].
  /// May throw [OperationLimitExceeded].
  ///
  /// Parameter [adminContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to transfer to Route 53. The
  /// top-level domain (TLD), such as .com, must be a TLD that Route 53
  /// supports. For a list of supported TLDs, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
  ///
  /// The domain name can contain only the following characters:
  ///
  /// <ul>
  /// <li>
  /// Letters a through z. Domain names are not case sensitive.
  /// </li>
  /// <li>
  /// Numbers 0 through 9.
  /// </li>
  /// <li>
  /// Hyphen (-). You can't specify a hyphen at the beginning or end of a label.
  /// </li>
  /// <li>
  /// Period (.) to separate the labels in the name, such as the <code>.</code>
  /// in <code>example.com</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [durationInYears] :
  /// The number of years that you want to register the domain for. Domains are
  /// registered for a minimum of one year. The maximum period depends on the
  /// top-level domain.
  ///
  /// Default: 1
  ///
  /// Parameter [registrantContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [techContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [authCode] :
  /// The authorization code for the domain. You get this value from the current
  /// registrar.
  ///
  /// Parameter [autoRenew] :
  /// Indicates whether the domain will be automatically renewed (true) or not
  /// (false). Auto renewal only takes effect after the account is charged.
  ///
  /// Default: true
  ///
  /// Parameter [billingContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [idnLangCode] :
  /// Reserved for future use.
  ///
  /// Parameter [nameservers] :
  /// Contains details for the host and glue IP addresses.
  ///
  /// Parameter [privacyProtectAdminContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information for the registrar, the phrase "REDACTED FOR PRIVACY", or "On
  /// behalf of &lt;domain name&gt; owner.".
  /// <note>
  /// While some domains may allow different privacy settings per contact, we
  /// recommend specifying the same privacy setting for all contacts.
  /// </note>
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectBillingContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the billing contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  ///
  /// Parameter [privacyProtectRegistrantContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the registrant contact (domain owner).
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectTechContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the technical contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  /// Default: <code>true</code>
  Future<TransferDomainResponse> transferDomain({
    required ContactDetail adminContact,
    required String domainName,
    required int durationInYears,
    required ContactDetail registrantContact,
    required ContactDetail techContact,
    String? authCode,
    bool? autoRenew,
    ContactDetail? billingContact,
    String? idnLangCode,
    List<Nameserver>? nameservers,
    bool? privacyProtectAdminContact,
    bool? privacyProtectBillingContact,
    bool? privacyProtectRegistrantContact,
    bool? privacyProtectTechContact,
  }) async {
    _s.validateNumRange(
      'durationInYears',
      durationInYears,
      1,
      10,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.TransferDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AdminContact': adminContact,
        'DomainName': domainName,
        'DurationInYears': durationInYears,
        'RegistrantContact': registrantContact,
        'TechContact': techContact,
        if (authCode != null) 'AuthCode': authCode,
        if (autoRenew != null) 'AutoRenew': autoRenew,
        if (billingContact != null) 'BillingContact': billingContact,
        if (idnLangCode != null) 'IdnLangCode': idnLangCode,
        if (nameservers != null) 'Nameservers': nameservers,
        if (privacyProtectAdminContact != null)
          'PrivacyProtectAdminContact': privacyProtectAdminContact,
        if (privacyProtectBillingContact != null)
          'PrivacyProtectBillingContact': privacyProtectBillingContact,
        if (privacyProtectRegistrantContact != null)
          'PrivacyProtectRegistrantContact': privacyProtectRegistrantContact,
        if (privacyProtectTechContact != null)
          'PrivacyProtectTechContact': privacyProtectTechContact,
      },
    );

    return TransferDomainResponse.fromJson(jsonResponse.body);
  }

  /// Transfers a domain from the current Amazon Web Services account to another
  /// Amazon Web Services account. Note the following:
  ///
  /// <ul>
  /// <li>
  /// The Amazon Web Services account that you're transferring the domain to
  /// must accept the transfer. If the other account doesn't accept the transfer
  /// within 3 days, we cancel the transfer. See <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>.
  /// </li>
  /// <li>
  /// You can cancel the transfer before the other account accepts it. See <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_CancelDomainTransferToAnotherAwsAccount.html">CancelDomainTransferToAnotherAwsAccount</a>.
  /// </li>
  /// <li>
  /// The other account can reject the transfer. See <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_RejectDomainTransferFromAnotherAwsAccount.html">RejectDomainTransferFromAnotherAwsAccount</a>.
  /// </li>
  /// </ul> <important>
  /// When you transfer a domain from one Amazon Web Services account to
  /// another, Route 53 doesn't transfer the hosted zone that is associated with
  /// the domain. DNS resolution isn't affected if the domain and the hosted
  /// zone are owned by separate accounts, so transferring the hosted zone is
  /// optional. For information about transferring the hosted zone to another
  /// Amazon Web Services account, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html">Migrating
  /// a Hosted Zone to a Different Amazon Web Services Account</a> in the
  /// <i>Amazon Route 53 Developer Guide</i>.
  /// </important>
  /// Use either <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html">ListOperations</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// to determine whether the operation succeeded. <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// provides additional information, for example, <code>Domain Transfer from
  /// Aws Account 111122223333 has been cancelled</code>.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [DuplicateRequest].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [accountId] :
  /// The account ID of the Amazon Web Services account that you want to
  /// transfer the domain to, for example, <code>111122223333</code>.
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to transfer from the current Amazon
  /// Web Services account to another account.
  Future<TransferDomainToAnotherAwsAccountResponse>
      transferDomainToAnotherAwsAccount({
    required String accountId,
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Route53Domains_v20140515.TransferDomainToAnotherAwsAccount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountId': accountId,
        'DomainName': domainName,
      },
    );

    return TransferDomainToAnotherAwsAccountResponse.fromJson(
        jsonResponse.body);
  }

  /// This operation updates the contact information for a particular domain.
  /// You must specify information for at least one contact: registrant,
  /// administrator, or technical.
  ///
  /// If the update is successful, this method returns an operation ID that you
  /// can use to track the progress and completion of the operation. If the
  /// request is not completed successfully, the domain registrant will be
  /// notified by email.
  ///
  /// May throw [InvalidInput].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to update contact information for.
  ///
  /// Parameter [adminContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [billingContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [consent] :
  /// Customer's consent for the owner change request. Required if the domain is
  /// not free (consent price is more than $0.00).
  ///
  /// Parameter [registrantContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [techContact] :
  /// Provides detailed contact information.
  Future<UpdateDomainContactResponse> updateDomainContact({
    required String domainName,
    ContactDetail? adminContact,
    ContactDetail? billingContact,
    Consent? consent,
    ContactDetail? registrantContact,
    ContactDetail? techContact,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.UpdateDomainContact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        if (adminContact != null) 'AdminContact': adminContact,
        if (billingContact != null) 'BillingContact': billingContact,
        if (consent != null) 'Consent': consent,
        if (registrantContact != null) 'RegistrantContact': registrantContact,
        if (techContact != null) 'TechContact': techContact,
      },
    );

    return UpdateDomainContactResponse.fromJson(jsonResponse.body);
  }

  /// This operation updates the specified domain contact's privacy setting.
  /// When privacy protection is enabled, your contact information is replaced
  /// with contact information for the registrar or with the phrase "REDACTED
  /// FOR PRIVACY", or "On behalf of &lt;domain name&gt; owner."
  /// <note>
  /// While some domains may allow different privacy settings per contact, we
  /// recommend specifying the same privacy setting for all contacts.
  /// </note>
  /// This operation affects only the contact information for the specified
  /// contact type (administrative, registrant, or technical). If the request
  /// succeeds, Amazon Route 53 returns an operation ID that you can use with <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>
  /// to track the progress and completion of the action. If the request doesn't
  /// complete successfully, the domain registrant will be notified by email.
  /// <important>
  /// By disabling the privacy service via API, you consent to the publication
  /// of the contact information provided for this domain via the public WHOIS
  /// database. You certify that you are the registrant of this domain name and
  /// have the authority to make this decision. You may withdraw your consent at
  /// any time by enabling privacy protection using either
  /// <code>UpdateDomainContactPrivacy</code> or the Route 53 console. Enabling
  /// privacy protection removes the contact information provided for this
  /// domain from the WHOIS database. For more information on our privacy
  /// practices, see <a
  /// href="https://aws.amazon.com/privacy/">https://aws.amazon.com/privacy/</a>.
  /// </important>
  ///
  /// May throw [InvalidInput].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to update the privacy setting for.
  ///
  /// Parameter [adminPrivacy] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the admin contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  ///
  /// Parameter [billingPrivacy] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the billing contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  ///
  /// Parameter [registrantPrivacy] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the registrant contact (domain owner).
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  ///
  /// Parameter [techPrivacy] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If you specify <code>false</code>, WHOIS queries return the
  /// information that you entered for the technical contact.
  /// <note>
  /// You must specify the same privacy setting for the administrative, billing,
  /// registrant, and technical contacts.
  /// </note>
  Future<UpdateDomainContactPrivacyResponse> updateDomainContactPrivacy({
    required String domainName,
    bool? adminPrivacy,
    bool? billingPrivacy,
    bool? registrantPrivacy,
    bool? techPrivacy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.UpdateDomainContactPrivacy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        if (adminPrivacy != null) 'AdminPrivacy': adminPrivacy,
        if (billingPrivacy != null) 'BillingPrivacy': billingPrivacy,
        if (registrantPrivacy != null) 'RegistrantPrivacy': registrantPrivacy,
        if (techPrivacy != null) 'TechPrivacy': techPrivacy,
      },
    );

    return UpdateDomainContactPrivacyResponse.fromJson(jsonResponse.body);
  }

  /// This operation replaces the current set of name servers for the domain
  /// with the specified set of name servers. If you use Amazon Route 53 as your
  /// DNS service, specify the four name servers in the delegation set for the
  /// hosted zone for the domain.
  ///
  /// If successful, this operation returns an operation ID that you can use to
  /// track the progress and completion of the action. If the request is not
  /// completed successfully, the domain registrant will be notified by email.
  ///
  /// May throw [InvalidInput].
  /// May throw [DuplicateRequest].
  /// May throw [TLDRulesViolation].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to change name servers for.
  ///
  /// Parameter [nameservers] :
  /// A list of new name servers for the domain.
  ///
  /// Parameter [fIAuthKey] :
  /// The authorization key for .fi domains
  Future<UpdateDomainNameserversResponse> updateDomainNameservers({
    required String domainName,
    required List<Nameserver> nameservers,
    String? fIAuthKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.UpdateDomainNameservers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        'Nameservers': nameservers,
        if (fIAuthKey != null) 'FIAuthKey': fIAuthKey,
      },
    );

    return UpdateDomainNameserversResponse.fromJson(jsonResponse.body);
  }

  /// This operation adds or updates tags for a specified domain.
  ///
  /// All tag operations are eventually consistent; subsequent operations might
  /// not immediately represent all issued operations.
  ///
  /// May throw [InvalidInput].
  /// May throw [OperationLimitExceeded].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The domain for which you want to add or update tags.
  ///
  /// Parameter [tagsToUpdate] :
  /// A list of the tag keys and values that you want to add or update. If you
  /// specify a key that already exists, the corresponding value will be
  /// replaced.
  Future<void> updateTagsForDomain({
    required String domainName,
    List<Tag>? tagsToUpdate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.UpdateTagsForDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        if (tagsToUpdate != null) 'TagsToUpdate': tagsToUpdate,
      },
    );
  }

  /// Returns all the domain-related billing records for the current Amazon Web
  /// Services account for a specified period
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [end] :
  /// The end date and time for the time period for which you want a list of
  /// billing records. Specify the date and time in Unix time format and
  /// Coordinated Universal time (UTC).
  ///
  /// Parameter [marker] :
  /// For an initial request for a list of billing records, omit this element.
  /// If the number of billing records that are associated with the current
  /// Amazon Web Services account during the specified period is greater than
  /// the value that you specified for <code>MaxItems</code>, you can use
  /// <code>Marker</code> to return additional billing records. Get the value of
  /// <code>NextPageMarker</code> from the previous response, and submit another
  /// request that includes the value of <code>NextPageMarker</code> in the
  /// <code>Marker</code> element.
  ///
  /// Constraints: The marker must match the value of
  /// <code>NextPageMarker</code> that was returned in the previous response.
  ///
  /// Parameter [maxItems] :
  /// The number of billing records to be returned.
  ///
  /// Default: 20
  ///
  /// Parameter [start] :
  /// The beginning date and time for the time period for which you want a list
  /// of billing records. Specify the date and time in Unix time format and
  /// Coordinated Universal time (UTC).
  Future<ViewBillingResponse> viewBilling({
    DateTime? end,
    String? marker,
    int? maxItems,
    DateTime? start,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Route53Domains_v20140515.ViewBilling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (end != null) 'End': unixTimestampToJson(end),
        if (marker != null) 'Marker': marker,
        if (maxItems != null) 'MaxItems': maxItems,
        if (start != null) 'Start': unixTimestampToJson(start),
      },
    );

    return ViewBillingResponse.fromJson(jsonResponse.body);
  }
}

/// The AcceptDomainTransferFromAnotherAwsAccount response includes the
/// following element.
class AcceptDomainTransferFromAnotherAwsAccountResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  AcceptDomainTransferFromAnotherAwsAccountResponse({
    this.operationId,
  });

  factory AcceptDomainTransferFromAnotherAwsAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return AcceptDomainTransferFromAnotherAwsAccountResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

class AssociateDelegationSignerToDomainResponse {
  /// The identifier for tracking the progress of the request. To query the
  /// operation status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  AssociateDelegationSignerToDomainResponse({
    this.operationId,
  });

  factory AssociateDelegationSignerToDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateDelegationSignerToDomainResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// Information for one billing record.
class BillingRecord {
  /// The date that the operation was billed, in Unix format.
  final DateTime? billDate;

  /// The name of the domain that the billing record applies to. If the domain
  /// name contains characters other than a-z, 0-9, and - (hyphen), such as an
  /// internationalized domain name, then this value is in Punycode. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html">DNS
  /// Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.
  final String? domainName;

  /// The ID of the invoice that is associated with the billing record.
  final String? invoiceId;

  /// The operation that you were charged for.
  final OperationType? operation;

  /// The price that you were charged for the operation, in US dollars.
  ///
  /// Example value: 12.0
  final double? price;

  BillingRecord({
    this.billDate,
    this.domainName,
    this.invoiceId,
    this.operation,
    this.price,
  });

  factory BillingRecord.fromJson(Map<String, dynamic> json) {
    return BillingRecord(
      billDate: timeStampFromJson(json['BillDate']),
      domainName: json['DomainName'] as String?,
      invoiceId: json['InvoiceId'] as String?,
      operation: (json['Operation'] as String?)?.let(OperationType.fromString),
      price: json['Price'] as double?,
    );
  }
}

/// The <code>CancelDomainTransferToAnotherAwsAccount</code> response includes
/// the following element.
class CancelDomainTransferToAnotherAwsAccountResponse {
  /// The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned
  /// to track the progress of the request. Because the transfer request was
  /// canceled, the value is no longer valid, and you can't use
  /// <code>GetOperationDetail</code> to query the operation status.
  final String? operationId;

  CancelDomainTransferToAnotherAwsAccountResponse({
    this.operationId,
  });

  factory CancelDomainTransferToAnotherAwsAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return CancelDomainTransferToAnotherAwsAccountResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// The CheckDomainAvailability response includes the following elements.
class CheckDomainAvailabilityResponse {
  /// Whether the domain name is available for registering.
  /// <note>
  /// You can register only domains designated as <code>AVAILABLE</code>.
  /// </note>
  /// Valid values:
  /// <dl> <dt>AVAILABLE</dt> <dd>
  /// The domain name is available.
  /// </dd> <dt>AVAILABLE_RESERVED</dt> <dd>
  /// The domain name is reserved under specific conditions.
  /// </dd> <dt>AVAILABLE_PREORDER</dt> <dd>
  /// The domain name is available and can be preordered.
  /// </dd> <dt>DONT_KNOW</dt> <dd>
  /// The TLD registry didn't reply with a definitive answer about whether the
  /// domain name is available. Route 53 can return this response for a variety of
  /// reasons, for example, the registry is performing maintenance. Try again
  /// later.
  /// </dd> <dt>INVALID_NAME_FOR_TLD</dt> <dd>
  /// The TLD isn't valid. For example, it can contain characters that aren't
  /// allowed.
  /// </dd> <dt>PENDING</dt> <dd>
  /// The TLD registry didn't return a response in the expected amount of time.
  /// When the response is delayed, it usually takes just a few extra seconds. You
  /// can resubmit the request immediately.
  /// </dd> <dt>RESERVED</dt> <dd>
  /// The domain name has been reserved for another person or organization.
  /// </dd> <dt>UNAVAILABLE</dt> <dd>
  /// The domain name is not available.
  /// </dd> <dt>UNAVAILABLE_PREMIUM</dt> <dd>
  /// The domain name is not available.
  /// </dd> <dt>UNAVAILABLE_RESTRICTED</dt> <dd>
  /// The domain name is forbidden.
  /// </dd> </dl>
  final DomainAvailability? availability;

  CheckDomainAvailabilityResponse({
    this.availability,
  });

  factory CheckDomainAvailabilityResponse.fromJson(Map<String, dynamic> json) {
    return CheckDomainAvailabilityResponse(
      availability:
          (json['Availability'] as String?)?.let(DomainAvailability.fromString),
    );
  }
}

/// The CheckDomainTransferability response includes the following elements.
class CheckDomainTransferabilityResponse {
  /// Provides an explanation for when a domain can't be transferred.
  final String? message;

  /// A complex type that contains information about whether the specified domain
  /// can be transferred to Route 53.
  final DomainTransferability? transferability;

  CheckDomainTransferabilityResponse({
    this.message,
    this.transferability,
  });

  factory CheckDomainTransferabilityResponse.fromJson(
      Map<String, dynamic> json) {
    return CheckDomainTransferabilityResponse(
      message: json['Message'] as String?,
      transferability: json['Transferability'] != null
          ? DomainTransferability.fromJson(
              json['Transferability'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Customer's consent for the owner change request.
class Consent {
  /// Currency for the <code>MaxPrice</code>.
  final String currency;

  /// Maximum amount the customer agreed to accept.
  final double maxPrice;

  Consent({
    required this.currency,
    required this.maxPrice,
  });

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final maxPrice = this.maxPrice;
    return {
      'Currency': currency,
      'MaxPrice': maxPrice,
    };
  }
}

/// ContactDetail includes the following elements.
class ContactDetail {
  /// First line of the contact's address.
  final String? addressLine1;

  /// Second line of contact's address, if any.
  final String? addressLine2;

  /// The city of the contact's address.
  final String? city;

  /// Indicates whether the contact is a person, company, association, or public
  /// organization. Note the following:
  ///
  /// <ul>
  /// <li>
  /// If you specify a value other than <code>PERSON</code>, you must also specify
  /// a value for <code>OrganizationName</code>.
  /// </li>
  /// <li>
  /// For some TLDs, the privacy protection available depends on the value that
  /// you specify for <code>Contact Type</code>. For the privacy protection
  /// settings for your TLD, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html">Domains
  /// that You Can Register with Amazon Route 53</a> in the <i>Amazon Route 53
  /// Developer Guide</i>
  /// </li>
  /// <li>
  /// For .es domains, the value of <code>ContactType</code> must be
  /// <code>PERSON</code> for all three contacts.
  /// </li>
  /// </ul>
  final ContactType? contactType;

  /// Code for the country of the contact's address.
  final CountryCode? countryCode;

  /// Email address of the contact.
  final String? email;

  /// A list of name-value pairs for parameters required by certain top-level
  /// domains.
  final List<ExtraParam>? extraParams;

  /// Fax number of the contact.
  ///
  /// Constraints: Phone number must be specified in the format "+[country dialing
  /// code].[number including any area code]". For example, a US phone number
  /// might appear as <code>"+1.1234567890"</code>.
  final String? fax;

  /// First name of contact.
  final String? firstName;

  /// Last name of contact.
  final String? lastName;

  /// Name of the organization for contact types other than <code>PERSON</code>.
  final String? organizationName;

  /// The phone number of the contact.
  ///
  /// Constraints: Phone number must be specified in the format "+[country dialing
  /// code].[number including any area code&gt;]". For example, a US phone number
  /// might appear as <code>"+1.1234567890"</code>.
  final String? phoneNumber;

  /// The state or province of the contact's city.
  final String? state;

  /// The zip or postal code of the contact's address.
  final String? zipCode;

  ContactDetail({
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.contactType,
    this.countryCode,
    this.email,
    this.extraParams,
    this.fax,
    this.firstName,
    this.lastName,
    this.organizationName,
    this.phoneNumber,
    this.state,
    this.zipCode,
  });

  factory ContactDetail.fromJson(Map<String, dynamic> json) {
    return ContactDetail(
      addressLine1: json['AddressLine1'] as String?,
      addressLine2: json['AddressLine2'] as String?,
      city: json['City'] as String?,
      contactType:
          (json['ContactType'] as String?)?.let(ContactType.fromString),
      countryCode:
          (json['CountryCode'] as String?)?.let(CountryCode.fromString),
      email: json['Email'] as String?,
      extraParams: (json['ExtraParams'] as List?)
          ?.nonNulls
          .map((e) => ExtraParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      fax: json['Fax'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      organizationName: json['OrganizationName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      state: json['State'] as String?,
      zipCode: json['ZipCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressLine1 = this.addressLine1;
    final addressLine2 = this.addressLine2;
    final city = this.city;
    final contactType = this.contactType;
    final countryCode = this.countryCode;
    final email = this.email;
    final extraParams = this.extraParams;
    final fax = this.fax;
    final firstName = this.firstName;
    final lastName = this.lastName;
    final organizationName = this.organizationName;
    final phoneNumber = this.phoneNumber;
    final state = this.state;
    final zipCode = this.zipCode;
    return {
      if (addressLine1 != null) 'AddressLine1': addressLine1,
      if (addressLine2 != null) 'AddressLine2': addressLine2,
      if (city != null) 'City': city,
      if (contactType != null) 'ContactType': contactType.value,
      if (countryCode != null) 'CountryCode': countryCode.value,
      if (email != null) 'Email': email,
      if (extraParams != null) 'ExtraParams': extraParams,
      if (fax != null) 'Fax': fax,
      if (firstName != null) 'FirstName': firstName,
      if (lastName != null) 'LastName': lastName,
      if (organizationName != null) 'OrganizationName': organizationName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (state != null) 'State': state,
      if (zipCode != null) 'ZipCode': zipCode,
    };
  }
}

enum ContactType {
  person('PERSON'),
  company('COMPANY'),
  association('ASSOCIATION'),
  publicBody('PUBLIC_BODY'),
  reseller('RESELLER'),
  ;

  final String value;

  const ContactType(this.value);

  static ContactType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ContactType'));
}

enum CountryCode {
  ac('AC'),
  ad('AD'),
  ae('AE'),
  af('AF'),
  ag('AG'),
  ai('AI'),
  al('AL'),
  am('AM'),
  an('AN'),
  ao('AO'),
  aq('AQ'),
  ar('AR'),
  as('AS'),
  at('AT'),
  au('AU'),
  aw('AW'),
  ax('AX'),
  az('AZ'),
  ba('BA'),
  bb('BB'),
  bd('BD'),
  be('BE'),
  bf('BF'),
  bg('BG'),
  bh('BH'),
  bi('BI'),
  bj('BJ'),
  bl('BL'),
  bm('BM'),
  bn('BN'),
  bo('BO'),
  bq('BQ'),
  br('BR'),
  bs('BS'),
  bt('BT'),
  bv('BV'),
  bw('BW'),
  by('BY'),
  bz('BZ'),
  ca('CA'),
  cc('CC'),
  cd('CD'),
  cf('CF'),
  cg('CG'),
  ch('CH'),
  ci('CI'),
  ck('CK'),
  cl('CL'),
  cm('CM'),
  cn('CN'),
  co('CO'),
  cr('CR'),
  cu('CU'),
  cv('CV'),
  cw('CW'),
  cx('CX'),
  cy('CY'),
  cz('CZ'),
  de('DE'),
  dj('DJ'),
  dk('DK'),
  dm('DM'),
  $do('DO'),
  dz('DZ'),
  ec('EC'),
  ee('EE'),
  eg('EG'),
  eh('EH'),
  er('ER'),
  es('ES'),
  et('ET'),
  fi('FI'),
  fj('FJ'),
  fk('FK'),
  fm('FM'),
  fo('FO'),
  fr('FR'),
  ga('GA'),
  gb('GB'),
  gd('GD'),
  ge('GE'),
  gf('GF'),
  gg('GG'),
  gh('GH'),
  gi('GI'),
  gl('GL'),
  gm('GM'),
  gn('GN'),
  gp('GP'),
  gq('GQ'),
  gr('GR'),
  gs('GS'),
  gt('GT'),
  gu('GU'),
  gw('GW'),
  gy('GY'),
  hk('HK'),
  hm('HM'),
  hn('HN'),
  hr('HR'),
  ht('HT'),
  hu('HU'),
  id('ID'),
  ie('IE'),
  il('IL'),
  im('IM'),
  $in('IN'),
  io('IO'),
  iq('IQ'),
  ir('IR'),
  $is('IS'),
  it('IT'),
  je('JE'),
  jm('JM'),
  jo('JO'),
  jp('JP'),
  ke('KE'),
  kg('KG'),
  kh('KH'),
  ki('KI'),
  km('KM'),
  kn('KN'),
  kp('KP'),
  kr('KR'),
  kw('KW'),
  ky('KY'),
  kz('KZ'),
  la('LA'),
  lb('LB'),
  lc('LC'),
  li('LI'),
  lk('LK'),
  lr('LR'),
  ls('LS'),
  lt('LT'),
  lu('LU'),
  lv('LV'),
  ly('LY'),
  ma('MA'),
  mc('MC'),
  md('MD'),
  me('ME'),
  mf('MF'),
  mg('MG'),
  mh('MH'),
  mk('MK'),
  ml('ML'),
  mm('MM'),
  mn('MN'),
  mo('MO'),
  mp('MP'),
  mq('MQ'),
  mr('MR'),
  ms('MS'),
  mt('MT'),
  mu('MU'),
  mv('MV'),
  mw('MW'),
  mx('MX'),
  my('MY'),
  mz('MZ'),
  na('NA'),
  nc('NC'),
  ne('NE'),
  nf('NF'),
  ng('NG'),
  ni('NI'),
  nl('NL'),
  no('NO'),
  np('NP'),
  nr('NR'),
  nu('NU'),
  nz('NZ'),
  om('OM'),
  pa('PA'),
  pe('PE'),
  pf('PF'),
  pg('PG'),
  ph('PH'),
  pk('PK'),
  pl('PL'),
  pm('PM'),
  pn('PN'),
  pr('PR'),
  ps('PS'),
  pt('PT'),
  pw('PW'),
  py('PY'),
  qa('QA'),
  re('RE'),
  ro('RO'),
  rs('RS'),
  ru('RU'),
  rw('RW'),
  sa('SA'),
  sb('SB'),
  sc('SC'),
  sd('SD'),
  se('SE'),
  sg('SG'),
  sh('SH'),
  si('SI'),
  sj('SJ'),
  sk('SK'),
  sl('SL'),
  sm('SM'),
  sn('SN'),
  so('SO'),
  sr('SR'),
  ss('SS'),
  st('ST'),
  sv('SV'),
  sx('SX'),
  sy('SY'),
  sz('SZ'),
  tc('TC'),
  td('TD'),
  tf('TF'),
  tg('TG'),
  th('TH'),
  tj('TJ'),
  tk('TK'),
  tl('TL'),
  tm('TM'),
  tn('TN'),
  to('TO'),
  tp('TP'),
  tr('TR'),
  tt('TT'),
  tv('TV'),
  tw('TW'),
  tz('TZ'),
  ua('UA'),
  ug('UG'),
  us('US'),
  uy('UY'),
  uz('UZ'),
  va('VA'),
  vc('VC'),
  ve('VE'),
  vg('VG'),
  vi('VI'),
  vn('VN'),
  vu('VU'),
  wf('WF'),
  ws('WS'),
  ye('YE'),
  yt('YT'),
  za('ZA'),
  zm('ZM'),
  zw('ZW'),
  ;

  final String value;

  const CountryCode(this.value);

  static CountryCode fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum CountryCode'));
}

class DeleteDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  DeleteDomainResponse({
    this.operationId,
  });

  factory DeleteDomainResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDomainResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

class DeleteTagsForDomainResponse {
  DeleteTagsForDomainResponse();

  factory DeleteTagsForDomainResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTagsForDomainResponse();
  }
}

class DisableDomainAutoRenewResponse {
  DisableDomainAutoRenewResponse();

  factory DisableDomainAutoRenewResponse.fromJson(Map<String, dynamic> _) {
    return DisableDomainAutoRenewResponse();
  }
}

/// The DisableDomainTransferLock response includes the following element.
class DisableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  DisableDomainTransferLockResponse({
    this.operationId,
  });

  factory DisableDomainTransferLockResponse.fromJson(
      Map<String, dynamic> json) {
    return DisableDomainTransferLockResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

class DisassociateDelegationSignerFromDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  DisassociateDelegationSignerFromDomainResponse({
    this.operationId,
  });

  factory DisassociateDelegationSignerFromDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateDelegationSignerFromDomainResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// Information about the DNSSEC key.
///
/// You get this from your DNS provider and then give it to Route 53 (by using
/// <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AssociateDelegationSignerToDomain.html">AssociateDelegationSignerToDomain</a>)
/// to pass it to the registry to establish the chain of trust.
class DnssecKey {
  /// The number of the public key’s cryptographic algorithm according to an <a
  /// href="https://www.iana.org/assignments/dns-sec-alg-numbers/dns-sec-alg-numbers.xml">IANA</a>
  /// assignment.
  ///
  /// If Route 53 is your DNS service, set this to 13.
  ///
  /// For more information about enabling DNSSEC signing, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring-dnssec-enable-signing.html">Enabling
  /// DNSSEC signing and establishing a chain of trust</a>.
  final int? algorithm;

  /// The delegation signer digest.
  ///
  /// Digest is calculated from the public key provided using specified digest
  /// algorithm and this digest is the actual value returned from the registry
  /// nameservers as the value of DS records.
  final String? digest;

  /// The number of the DS digest algorithm according to an IANA assignment.
  ///
  /// For more information, see <a
  /// href="https://www.iana.org/assignments/ds-rr-types/ds-rr-types.xhtml">IANA</a>
  /// for DNSSEC Delegation Signer (DS) Resource Record (RR) Type Digest
  /// Algorithms.
  final int? digestType;

  /// Defines the type of key. It can be either a KSK (key-signing-key, value 257)
  /// or ZSK (zone-signing-key, value 256). Using KSK is always encouraged. Only
  /// use ZSK if your DNS provider isn't Route 53 and you don’t have KSK
  /// available.
  ///
  /// If you have KSK and ZSK keys, always use KSK to create a delegations signer
  /// (DS) record. If you have ZSK keys only – use ZSK to create a DS record.
  final int? flags;

  /// An ID assigned to each DS record created by <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AssociateDelegationSignerToDomain.html">AssociateDelegationSignerToDomain</a>.
  final String? id;

  /// A numeric identification of the DNSKEY record referred to by this DS record.
  final int? keyTag;

  /// The base64-encoded public key part of the key pair that is passed to the
  /// registry .
  final String? publicKey;

  DnssecKey({
    this.algorithm,
    this.digest,
    this.digestType,
    this.flags,
    this.id,
    this.keyTag,
    this.publicKey,
  });

  factory DnssecKey.fromJson(Map<String, dynamic> json) {
    return DnssecKey(
      algorithm: json['Algorithm'] as int?,
      digest: json['Digest'] as String?,
      digestType: json['DigestType'] as int?,
      flags: json['Flags'] as int?,
      id: json['Id'] as String?,
      keyTag: json['KeyTag'] as int?,
      publicKey: json['PublicKey'] as String?,
    );
  }
}

/// Information about a delegation signer (DS) record that was created in the
/// registry by <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AssociateDelegationSignerToDomain.html">AssociateDelegationSignerToDomain</a>.
class DnssecSigningAttributes {
  /// Algorithm which was used to generate the digest from the public key.
  final int? algorithm;

  /// Defines the type of key. It can be either a KSK (key-signing-key, value 257)
  /// or ZSK (zone-signing-key, value 256). Using KSK is always encouraged. Only
  /// use ZSK if your DNS provider isn't Route 53 and you don’t have KSK
  /// available.
  ///
  /// If you have KSK and ZSK keys, always use KSK to create a delegations signer
  /// (DS) record. If you have ZSK keys only – use ZSK to create a DS record.
  final int? flags;

  /// The base64-encoded public key part of the key pair that is passed to the
  /// registry.
  final String? publicKey;

  DnssecSigningAttributes({
    this.algorithm,
    this.flags,
    this.publicKey,
  });

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final flags = this.flags;
    final publicKey = this.publicKey;
    return {
      if (algorithm != null) 'Algorithm': algorithm,
      if (flags != null) 'Flags': flags,
      if (publicKey != null) 'PublicKey': publicKey,
    };
  }
}

enum DomainAvailability {
  available('AVAILABLE'),
  availableReserved('AVAILABLE_RESERVED'),
  availablePreorder('AVAILABLE_PREORDER'),
  unavailable('UNAVAILABLE'),
  unavailablePremium('UNAVAILABLE_PREMIUM'),
  unavailableRestricted('UNAVAILABLE_RESTRICTED'),
  reserved('RESERVED'),
  dontKnow('DONT_KNOW'),
  invalidNameForTld('INVALID_NAME_FOR_TLD'),
  pending('PENDING'),
  ;

  final String value;

  const DomainAvailability(this.value);

  static DomainAvailability fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DomainAvailability'));
}

/// Information about the domain price associated with a TLD.
class DomainPrice {
  /// The price for changing domain ownership.
  final PriceWithCurrency? changeOwnershipPrice;

  /// The name of the TLD for which the prices apply.
  final String? name;

  /// The price for domain registration with Route 53.
  final PriceWithCurrency? registrationPrice;

  /// The price for renewing domain registration with Route 53.
  final PriceWithCurrency? renewalPrice;

  /// The price for restoring the domain with Route 53.
  final PriceWithCurrency? restorationPrice;

  /// The price for transferring the domain registration to Route 53.
  final PriceWithCurrency? transferPrice;

  DomainPrice({
    this.changeOwnershipPrice,
    this.name,
    this.registrationPrice,
    this.renewalPrice,
    this.restorationPrice,
    this.transferPrice,
  });

  factory DomainPrice.fromJson(Map<String, dynamic> json) {
    return DomainPrice(
      changeOwnershipPrice: json['ChangeOwnershipPrice'] != null
          ? PriceWithCurrency.fromJson(
              json['ChangeOwnershipPrice'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      registrationPrice: json['RegistrationPrice'] != null
          ? PriceWithCurrency.fromJson(
              json['RegistrationPrice'] as Map<String, dynamic>)
          : null,
      renewalPrice: json['RenewalPrice'] != null
          ? PriceWithCurrency.fromJson(
              json['RenewalPrice'] as Map<String, dynamic>)
          : null,
      restorationPrice: json['RestorationPrice'] != null
          ? PriceWithCurrency.fromJson(
              json['RestorationPrice'] as Map<String, dynamic>)
          : null,
      transferPrice: json['TransferPrice'] != null
          ? PriceWithCurrency.fromJson(
              json['TransferPrice'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about one suggested domain name.
class DomainSuggestion {
  /// Whether the domain name is available for registering.
  /// <note>
  /// You can register only the domains that are designated as
  /// <code>AVAILABLE</code>.
  /// </note>
  /// Valid values:
  /// <dl> <dt>AVAILABLE</dt> <dd>
  /// The domain name is available.
  /// </dd> <dt>AVAILABLE_RESERVED</dt> <dd>
  /// The domain name is reserved under specific conditions.
  /// </dd> <dt>AVAILABLE_PREORDER</dt> <dd>
  /// The domain name is available and can be preordered.
  /// </dd> <dt>DONT_KNOW</dt> <dd>
  /// The TLD registry didn't reply with a definitive answer about whether the
  /// domain name is available. Route 53 can return this response for a variety of
  /// reasons, for example, the registry is performing maintenance. Try again
  /// later.
  /// </dd> <dt>PENDING</dt> <dd>
  /// The TLD registry didn't return a response in the expected amount of time.
  /// When the response is delayed, it usually takes just a few extra seconds. You
  /// can resubmit the request immediately.
  /// </dd> <dt>RESERVED</dt> <dd>
  /// The domain name has been reserved for another person or organization.
  /// </dd> <dt>UNAVAILABLE</dt> <dd>
  /// The domain name is not available.
  /// </dd> <dt>UNAVAILABLE_PREMIUM</dt> <dd>
  /// The domain name is not available.
  /// </dd> <dt>UNAVAILABLE_RESTRICTED</dt> <dd>
  /// The domain name is forbidden.
  /// </dd> </dl>
  final String? availability;

  /// A suggested domain name.
  final String? domainName;

  DomainSuggestion({
    this.availability,
    this.domainName,
  });

  factory DomainSuggestion.fromJson(Map<String, dynamic> json) {
    return DomainSuggestion(
      availability: json['Availability'] as String?,
      domainName: json['DomainName'] as String?,
    );
  }
}

/// Summary information about one domain.
class DomainSummary {
  /// Indicates whether the domain is automatically renewed upon expiration.
  final bool? autoRenew;

  /// The name of the domain that the summary information applies to.
  final String? domainName;

  /// Expiration date of the domain in Unix time format and Coordinated Universal
  /// Time (UTC).
  final DateTime? expiry;

  /// Indicates whether a domain is locked from unauthorized transfer to another
  /// party.
  final bool? transferLock;

  DomainSummary({
    this.autoRenew,
    this.domainName,
    this.expiry,
    this.transferLock,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      autoRenew: json['AutoRenew'] as bool?,
      domainName: json['DomainName'] as String?,
      expiry: timeStampFromJson(json['Expiry']),
      transferLock: json['TransferLock'] as bool?,
    );
  }
}

/// A complex type that contains information about whether the specified domain
/// can be transferred to Route 53.
class DomainTransferability {
  final Transferable? transferable;

  DomainTransferability({
    this.transferable,
  });

  factory DomainTransferability.fromJson(Map<String, dynamic> json) {
    return DomainTransferability(
      transferable:
          (json['Transferable'] as String?)?.let(Transferable.fromString),
    );
  }
}

class EnableDomainAutoRenewResponse {
  EnableDomainAutoRenewResponse();

  factory EnableDomainAutoRenewResponse.fromJson(Map<String, dynamic> _) {
    return EnableDomainAutoRenewResponse();
  }
}

/// The EnableDomainTransferLock response includes the following elements.
class EnableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To use this ID to query
  /// the operation status, use GetOperationDetail.
  final String? operationId;

  EnableDomainTransferLockResponse({
    this.operationId,
  });

  factory EnableDomainTransferLockResponse.fromJson(Map<String, dynamic> json) {
    return EnableDomainTransferLockResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// ExtraParam includes the following elements.
class ExtraParam {
  /// The name of an additional parameter that is required by a top-level domain.
  /// Here are the top-level domains that require additional parameters and the
  /// names of the parameters that they require:
  /// <dl> <dt>.com.au and .net.au</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>AU_ID_NUMBER</code>
  /// </li>
  /// <li>
  /// <code>AU_ID_TYPE</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ABN</code> (Australian business number)
  /// </li>
  /// <li>
  /// <code>ACN</code> (Australian company number)
  /// </li>
  /// <li>
  /// <code>TM</code> (Trademark number)
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>.ca</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>BRAND_NUMBER</code>
  /// </li>
  /// <li>
  /// <code>CA_BUSINESS_ENTITY_TYPE</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>BANK</code> (Bank)
  /// </li>
  /// <li>
  /// <code>COMMERCIAL_COMPANY</code> (Commercial company)
  /// </li>
  /// <li>
  /// <code>COMPANY</code> (Company)
  /// </li>
  /// <li>
  /// <code>COOPERATION</code> (Cooperation)
  /// </li>
  /// <li>
  /// <code>COOPERATIVE</code> (Cooperative)
  /// </li>
  /// <li>
  /// <code>COOPRIX</code> (Cooprix)
  /// </li>
  /// <li>
  /// <code>CORP</code> (Corporation)
  /// </li>
  /// <li>
  /// <code>CREDIT_UNION</code> (Credit union)
  /// </li>
  /// <li>
  /// <code>FOMIA</code> (Federation of mutual insurance associations)
  /// </li>
  /// <li>
  /// <code>INC</code> (Incorporated)
  /// </li>
  /// <li>
  /// <code>LTD</code> (Limited)
  /// </li>
  /// <li>
  /// <code>LTEE</code> (Limitée)
  /// </li>
  /// <li>
  /// <code>LLC</code> (Limited liability corporation)
  /// </li>
  /// <li>
  /// <code>LLP</code> (Limited liability partnership)
  /// </li>
  /// <li>
  /// <code>LTE</code> (Lte.)
  /// </li>
  /// <li>
  /// <code>MBA</code> (Mutual benefit association)
  /// </li>
  /// <li>
  /// <code>MIC</code> (Mutual insurance company)
  /// </li>
  /// <li>
  /// <code>NFP</code> (Not-for-profit corporation)
  /// </li>
  /// <li>
  /// <code>SA</code> (S.A.)
  /// </li>
  /// <li>
  /// <code>SAVINGS_COMPANY</code> (Savings company)
  /// </li>
  /// <li>
  /// <code>SAVINGS_UNION</code> (Savings union)
  /// </li>
  /// <li>
  /// <code>SARL</code> (Société à responsabilité limitée)
  /// </li>
  /// <li>
  /// <code>TRUST</code> (Trust)
  /// </li>
  /// <li>
  /// <code>ULC</code> (Unlimited liability corporation)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>CA_LEGAL_TYPE</code>
  ///
  /// When <code>ContactType</code> is <code>PERSON</code>, valid values include
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ABO</code> (Aboriginal Peoples indigenous to Canada)
  /// </li>
  /// <li>
  /// <code>CCT</code> (Canadian citizen)
  /// </li>
  /// <li>
  /// <code>LGR</code> (Legal Representative of a Canadian Citizen or Permanent
  /// Resident)
  /// </li>
  /// <li>
  /// <code>RES</code> (Permanent resident of Canada)
  /// </li>
  /// </ul>
  /// When <code>ContactType</code> is a value other than <code>PERSON</code>,
  /// valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ASS</code> (Canadian unincorporated association)
  /// </li>
  /// <li>
  /// <code>CCO</code> (Canadian corporation)
  /// </li>
  /// <li>
  /// <code>EDU</code> (Canadian educational institution)
  /// </li>
  /// <li>
  /// <code>GOV</code> (Government or government entity in Canada)
  /// </li>
  /// <li>
  /// <code>HOP</code> (Canadian Hospital)
  /// </li>
  /// <li>
  /// <code>INB</code> (Indian Band recognized by the Indian Act of Canada)
  /// </li>
  /// <li>
  /// <code>LAM</code> (Canadian Library, Archive, or Museum)
  /// </li>
  /// <li>
  /// <code>MAJ</code> (Her/His Majesty the Queen/King)
  /// </li>
  /// <li>
  /// <code>OMK</code> (Official mark registered in Canada)
  /// </li>
  /// <li>
  /// <code>PLT</code> (Canadian Political Party)
  /// </li>
  /// <li>
  /// <code>PRT</code> (Partnership Registered in Canada)
  /// </li>
  /// <li>
  /// <code>TDM</code> (Trademark registered in Canada)
  /// </li>
  /// <li>
  /// <code>TRD</code> (Canadian Trade Union)
  /// </li>
  /// <li>
  /// <code>TRS</code> (Trust established in Canada)
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>.es</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>ES_IDENTIFICATION</code>
  ///
  /// The value of <code>ES_IDENTIFICATION</code> depends on the following values:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>ES_LEGAL_FORM</code>
  /// </li>
  /// <li>
  /// The value of <code>ES_IDENTIFICATION_TYPE</code>
  /// </li>
  /// </ul>
  /// <b>If <code>ES_LEGAL_FORM</code> is any value other than
  /// <code>INDIVIDUAL</code>:</b>
  ///
  /// <ul>
  /// <li>
  /// Specify 1 letter + 8 numbers (CIF [Certificado de Identificación Fiscal])
  /// </li>
  /// <li>
  /// Example: B12345678
  /// </li>
  /// </ul>
  /// <b>If <code>ES_LEGAL_FORM</code> is <code>INDIVIDUAL</code>, the value that
  /// you specify for <code>ES_IDENTIFICATION</code> depends on the value of
  /// <code>ES_IDENTIFICATION_TYPE</code>:</b>
  ///
  /// <ul>
  /// <li>
  /// If <code>ES_IDENTIFICATION_TYPE</code> is <code>DNI_AND_NIF</code> (for
  /// Spanish contacts):
  ///
  /// <ul>
  /// <li>
  /// Specify 8 numbers + 1 letter (DNI [Documento Nacional de Identidad], NIF
  /// [Número de Identificación Fiscal])
  /// </li>
  /// <li>
  /// Example: 12345678M
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If <code>ES_IDENTIFICATION_TYPE</code> is <code>NIE</code> (for foreigners
  /// with legal residence):
  ///
  /// <ul>
  /// <li>
  /// Specify 1 letter + 7 numbers + 1 letter ( NIE [Número de Identidad de
  /// Extranjero])
  /// </li>
  /// <li>
  /// Example: Y1234567X
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If <code>ES_IDENTIFICATION_TYPE</code> is <code>OTHER</code> (for contacts
  /// outside of Spain):
  ///
  /// <ul>
  /// <li>
  /// Specify a passport number, drivers license number, or national identity card
  /// number
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <code>ES_IDENTIFICATION_TYPE</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>DNI_AND_NIF</code> (For Spanish contacts)
  /// </li>
  /// <li>
  /// <code>NIE</code> (For foreigners with legal residence)
  /// </li>
  /// <li>
  /// <code>OTHER</code> (For contacts outside of Spain)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ES_LEGAL_FORM</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ASSOCIATION</code>
  /// </li>
  /// <li>
  /// <code>CENTRAL_GOVERNMENT_BODY</code>
  /// </li>
  /// <li>
  /// <code>CIVIL_SOCIETY</code>
  /// </li>
  /// <li>
  /// <code>COMMUNITY_OF_OWNERS</code>
  /// </li>
  /// <li>
  /// <code>COMMUNITY_PROPERTY</code>
  /// </li>
  /// <li>
  /// <code>CONSULATE</code>
  /// </li>
  /// <li>
  /// <code>COOPERATIVE</code>
  /// </li>
  /// <li>
  /// <code>DESIGNATION_OF_ORIGIN_SUPERVISORY_COUNCIL</code>
  /// </li>
  /// <li>
  /// <code>ECONOMIC_INTEREST_GROUP</code>
  /// </li>
  /// <li>
  /// <code>EMBASSY</code>
  /// </li>
  /// <li>
  /// <code>ENTITY_MANAGING_NATURAL_AREAS</code>
  /// </li>
  /// <li>
  /// <code>FARM_PARTNERSHIP</code>
  /// </li>
  /// <li>
  /// <code>FOUNDATION</code>
  /// </li>
  /// <li>
  /// <code>GENERAL_AND_LIMITED_PARTNERSHIP</code>
  /// </li>
  /// <li>
  /// <code>GENERAL_PARTNERSHIP</code>
  /// </li>
  /// <li>
  /// <code>INDIVIDUAL</code>
  /// </li>
  /// <li>
  /// <code>LIMITED_COMPANY</code>
  /// </li>
  /// <li>
  /// <code>LOCAL_AUTHORITY</code>
  /// </li>
  /// <li>
  /// <code>LOCAL_PUBLIC_ENTITY</code>
  /// </li>
  /// <li>
  /// <code>MUTUAL_INSURANCE_COMPANY</code>
  /// </li>
  /// <li>
  /// <code>NATIONAL_PUBLIC_ENTITY</code>
  /// </li>
  /// <li>
  /// <code>ORDER_OR_RELIGIOUS_INSTITUTION</code>
  /// </li>
  /// <li>
  /// <code>OTHERS (Only for contacts outside of Spain)</code>
  /// </li>
  /// <li>
  /// <code>POLITICAL_PARTY</code>
  /// </li>
  /// <li>
  /// <code>PROFESSIONAL_ASSOCIATION</code>
  /// </li>
  /// <li>
  /// <code>PUBLIC_LAW_ASSOCIATION</code>
  /// </li>
  /// <li>
  /// <code>PUBLIC_LIMITED_COMPANY</code>
  /// </li>
  /// <li>
  /// <code>REGIONAL_GOVERNMENT_BODY</code>
  /// </li>
  /// <li>
  /// <code>REGIONAL_PUBLIC_ENTITY</code>
  /// </li>
  /// <li>
  /// <code>SAVINGS_BANK</code>
  /// </li>
  /// <li>
  /// <code>SPANISH_OFFICE</code>
  /// </li>
  /// <li>
  /// <code>SPORTS_ASSOCIATION</code>
  /// </li>
  /// <li>
  /// <code>SPORTS_FEDERATION</code>
  /// </li>
  /// <li>
  /// <code>SPORTS_LIMITED_COMPANY</code>
  /// </li>
  /// <li>
  /// <code>TEMPORARY_ALLIANCE_OF_ENTERPRISES</code>
  /// </li>
  /// <li>
  /// <code>TRADE_UNION</code>
  /// </li>
  /// <li>
  /// <code>WORKER_OWNED_COMPANY</code>
  /// </li>
  /// <li>
  /// <code>WORKER_OWNED_LIMITED_COMPANY</code>
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>.eu</dt> <dd>
  /// <ul>
  /// <li>
  /// <code> EU_COUNTRY_OF_CITIZENSHIP</code>
  /// </li>
  /// </ul> </dd> <dt>.fi</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>BIRTH_DATE_IN_YYYY_MM_DD</code>
  /// </li>
  /// <li>
  /// <code>FI_BUSINESS_NUMBER</code>
  /// </li>
  /// <li>
  /// <code>FI_ID_NUMBER</code>
  /// </li>
  /// <li>
  /// <code>FI_NATIONALITY</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>FINNISH</code>
  /// </li>
  /// <li>
  /// <code>NOT_FINNISH</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>FI_ORGANIZATION_TYPE</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPANY</code>
  /// </li>
  /// <li>
  /// <code>CORPORATION</code>
  /// </li>
  /// <li>
  /// <code>GOVERNMENT</code>
  /// </li>
  /// <li>
  /// <code>INSTITUTION</code>
  /// </li>
  /// <li>
  /// <code>POLITICAL_PARTY</code>
  /// </li>
  /// <li>
  /// <code>PUBLIC_COMMUNITY</code>
  /// </li>
  /// <li>
  /// <code>TOWNSHIP</code>
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>.it</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>IT_NATIONALITY</code>
  /// </li>
  /// <li>
  /// <code>IT_PIN</code>
  /// </li>
  /// <li>
  /// <code>IT_REGISTRANT_ENTITY_TYPE</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>FOREIGNERS</code>
  /// </li>
  /// <li>
  /// <code>FREELANCE_WORKERS</code> (Freelance workers and professionals)
  /// </li>
  /// <li>
  /// <code>ITALIAN_COMPANIES</code> (Italian companies and one-person companies)
  /// </li>
  /// <li>
  /// <code>NON_PROFIT_ORGANIZATIONS</code>
  /// </li>
  /// <li>
  /// <code>OTHER_SUBJECTS</code>
  /// </li>
  /// <li>
  /// <code>PUBLIC_ORGANIZATIONS</code>
  /// </li>
  /// </ul> </li>
  /// </ul> </dd> <dt>.ru</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>BIRTH_DATE_IN_YYYY_MM_DD</code>
  /// </li>
  /// <li>
  /// <code>RU_PASSPORT_DATA</code>
  /// </li>
  /// </ul> </dd> <dt>.se</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>BIRTH_COUNTRY</code>
  /// </li>
  /// <li>
  /// <code>SE_ID_NUMBER</code>
  /// </li>
  /// </ul> </dd> <dt>.sg</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>SG_ID_NUMBER</code>
  /// </li>
  /// </ul> </dd> <dt>.uk, .co.uk, .me.uk, and .org.uk</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>UK_CONTACT_TYPE</code>
  ///
  /// Valid values include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CRC</code> (UK Corporation by Royal Charter)
  /// </li>
  /// <li>
  /// <code>FCORP</code> (Non-UK Corporation)
  /// </li>
  /// <li>
  /// <code>FIND</code> (Non-UK Individual, representing self)
  /// </li>
  /// <li>
  /// <code>FOTHER</code> (Non-UK Entity that does not fit into any other
  /// category)
  /// </li>
  /// <li>
  /// <code>GOV</code> (UK Government Body)
  /// </li>
  /// <li>
  /// <code>IND</code> (UK Individual (representing self))
  /// </li>
  /// <li>
  /// <code>IP</code> (UK Industrial/Provident Registered Company)
  /// </li>
  /// <li>
  /// <code>LLP</code> (UK Limited Liability Partnership)
  /// </li>
  /// <li>
  /// <code>LTD</code> (UK Limited Company)
  /// </li>
  /// <li>
  /// <code>OTHER</code> (UK Entity that does not fit into any other category)
  /// </li>
  /// <li>
  /// <code>PLC</code> (UK Public Limited Company)
  /// </li>
  /// <li>
  /// <code>PTNR</code> (UK Partnership)
  /// </li>
  /// <li>
  /// <code>RCHAR</code> (UK Registered Charity)
  /// </li>
  /// <li>
  /// <code>SCH</code> (UK School)
  /// </li>
  /// <li>
  /// <code>STAT</code> (UK Statutory Body)
  /// </li>
  /// <li>
  /// <code>STRA</code> (UK Sole Trader)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UK_COMPANY_NUMBER</code>
  /// </li>
  /// </ul> </dd> </dl>
  /// In addition, many TLDs require a <code>VAT_NUMBER</code>.
  final ExtraParamName name;

  /// The value that corresponds with the name of an extra parameter.
  final String value;

  ExtraParam({
    required this.name,
    required this.value,
  });

  factory ExtraParam.fromJson(Map<String, dynamic> json) {
    return ExtraParam(
      name: ExtraParamName.fromString((json['Name'] as String)),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name.value,
      'Value': value,
    };
  }
}

enum ExtraParamName {
  dunsNumber('DUNS_NUMBER'),
  brandNumber('BRAND_NUMBER'),
  birthDepartment('BIRTH_DEPARTMENT'),
  birthDateInYyyyMmDd('BIRTH_DATE_IN_YYYY_MM_DD'),
  birthCountry('BIRTH_COUNTRY'),
  birthCity('BIRTH_CITY'),
  documentNumber('DOCUMENT_NUMBER'),
  auIdNumber('AU_ID_NUMBER'),
  auIdType('AU_ID_TYPE'),
  caLegalType('CA_LEGAL_TYPE'),
  caBusinessEntityType('CA_BUSINESS_ENTITY_TYPE'),
  caLegalRepresentative('CA_LEGAL_REPRESENTATIVE'),
  caLegalRepresentativeCapacity('CA_LEGAL_REPRESENTATIVE_CAPACITY'),
  esIdentification('ES_IDENTIFICATION'),
  esIdentificationType('ES_IDENTIFICATION_TYPE'),
  esLegalForm('ES_LEGAL_FORM'),
  fiBusinessNumber('FI_BUSINESS_NUMBER'),
  fiIdNumber('FI_ID_NUMBER'),
  fiNationality('FI_NATIONALITY'),
  fiOrganizationType('FI_ORGANIZATION_TYPE'),
  itNationality('IT_NATIONALITY'),
  itPin('IT_PIN'),
  itRegistrantEntityType('IT_REGISTRANT_ENTITY_TYPE'),
  ruPassportData('RU_PASSPORT_DATA'),
  seIdNumber('SE_ID_NUMBER'),
  sgIdNumber('SG_ID_NUMBER'),
  vatNumber('VAT_NUMBER'),
  ukContactType('UK_CONTACT_TYPE'),
  ukCompanyNumber('UK_COMPANY_NUMBER'),
  euCountryOfCitizenship('EU_COUNTRY_OF_CITIZENSHIP'),
  auPriorityToken('AU_PRIORITY_TOKEN'),
  ;

  final String value;

  const ExtraParamName(this.value);

  static ExtraParamName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ExtraParamName'));
}

/// Information for the filtering of a list of domains returned by <a
/// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains__ListDomains.html">ListDomains</a>.
class FilterCondition {
  /// Name of the field which should be used for filtering the list of domains.
  final ListDomainsAttributeName name;

  /// The operator values for filtering domain names. The values can be:
  ///
  /// <ul>
  /// <li>
  /// <code>LE</code>: Less than, or equal to
  /// </li>
  /// <li>
  /// <code>GE</code>: Greater than, or equal to
  /// </li>
  /// <li>
  /// <code>BEGINS_WITH</code>: Begins with
  /// </li>
  /// </ul>
  final Operator operator;

  /// An array of strings presenting values to compare. Only 1 item in the list is
  /// currently supported.
  final List<String> values;

  FilterCondition({
    required this.name,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      'Name': name.value,
      'Operator': operator.value,
      'Values': values,
    };
  }
}

class GetContactReachabilityStatusResponse {
  /// The domain name for which you requested the reachability status.
  final String? domainName;

  /// Whether the registrant contact has responded. Values include the following:
  /// <dl> <dt>PENDING</dt> <dd>
  /// We sent the confirmation email and haven't received a response yet.
  /// </dd> <dt>DONE</dt> <dd>
  /// We sent the email and got confirmation from the registrant contact.
  /// </dd> <dt>EXPIRED</dt> <dd>
  /// The time limit expired before the registrant contact responded.
  /// </dd> </dl>
  final ReachabilityStatus? status;

  GetContactReachabilityStatusResponse({
    this.domainName,
    this.status,
  });

  factory GetContactReachabilityStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetContactReachabilityStatusResponse(
      domainName: json['domainName'] as String?,
      status: (json['status'] as String?)?.let(ReachabilityStatus.fromString),
    );
  }
}

/// The GetDomainDetail response includes the following elements.
class GetDomainDetailResponse {
  /// Email address to contact to report incorrect contact information for a
  /// domain, to report that the domain is being used to send spam, to report that
  /// someone is cybersquatting on a domain name, or report some other type of
  /// abuse.
  final String? abuseContactEmail;

  /// Phone number for reporting abuse.
  final String? abuseContactPhone;

  /// Provides details about the domain administrative contact.
  final ContactDetail? adminContact;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If the value is <code>false</code>, WHOIS queries return the
  /// information that you entered for the admin contact.
  final bool? adminPrivacy;

  /// Specifies whether the domain registration is set to renew automatically.
  final bool? autoRenew;

  /// Provides details about the domain billing contact.
  final ContactDetail? billingContact;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If the value is <code>false</code>, WHOIS queries return the
  /// information that you entered for the billing contact.
  final bool? billingPrivacy;

  /// The date when the domain was created as found in the response to a WHOIS
  /// query. The date and time is in Unix time format and Coordinated Universal
  /// time (UTC).
  final DateTime? creationDate;

  /// Deprecated.
  final String? dnsSec;

  /// A complex type that contains information about the DNSSEC configuration.
  final List<DnssecKey>? dnssecKeys;

  /// The name of a domain.
  final String? domainName;

  /// The date when the registration for the domain is set to expire. The date and
  /// time is in Unix time format and Coordinated Universal time (UTC).
  final DateTime? expirationDate;

  /// The name servers of the domain.
  final List<Nameserver>? nameservers;

  /// Provides details about the domain registrant.
  final ContactDetail? registrantContact;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If the value is <code>false</code>, WHOIS queries return the
  /// information that you entered for the registrant contact (domain owner).
  final bool? registrantPrivacy;

  /// Name of the registrar of the domain as identified in the registry.
  final String? registrarName;

  /// Web address of the registrar.
  final String? registrarUrl;

  /// Reserved for future use.
  final String? registryDomainId;

  /// Reseller of the domain. Domains registered or transferred using Route 53
  /// domains will have <code>"Amazon"</code> as the reseller.
  final String? reseller;

  /// An array of domain name status codes, also known as Extensible Provisioning
  /// Protocol (EPP) status codes.
  ///
  /// ICANN, the organization that maintains a central database of domain names,
  /// has developed a set of domain name status codes that tell you the status of
  /// a variety of operations on a domain name, for example, registering a domain
  /// name, transferring a domain name to another registrar, renewing the
  /// registration for a domain name, and so on. All registrars use this same set
  /// of status codes.
  ///
  /// For a current list of domain name status codes and an explanation of what
  /// each code means, go to the <a href="https://www.icann.org/">ICANN
  /// website</a> and search for <code>epp status codes</code>. (Search on the
  /// ICANN website; web searches sometimes return an old version of the
  /// document.)
  final List<String>? statusList;

  /// Provides details about the domain technical contact.
  final ContactDetail? techContact;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar or for our registrar associate,
  /// Gandi. If the value is <code>false</code>, WHOIS queries return the
  /// information that you entered for the technical contact.
  final bool? techPrivacy;

  /// The last updated date of the domain as found in the response to a WHOIS
  /// query. The date and time is in Unix time format and Coordinated Universal
  /// time (UTC).
  final DateTime? updatedDate;

  /// The fully qualified name of the WHOIS server that can answer the WHOIS query
  /// for the domain.
  final String? whoIsServer;

  GetDomainDetailResponse({
    this.abuseContactEmail,
    this.abuseContactPhone,
    this.adminContact,
    this.adminPrivacy,
    this.autoRenew,
    this.billingContact,
    this.billingPrivacy,
    this.creationDate,
    this.dnsSec,
    this.dnssecKeys,
    this.domainName,
    this.expirationDate,
    this.nameservers,
    this.registrantContact,
    this.registrantPrivacy,
    this.registrarName,
    this.registrarUrl,
    this.registryDomainId,
    this.reseller,
    this.statusList,
    this.techContact,
    this.techPrivacy,
    this.updatedDate,
    this.whoIsServer,
  });

  factory GetDomainDetailResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainDetailResponse(
      abuseContactEmail: json['AbuseContactEmail'] as String?,
      abuseContactPhone: json['AbuseContactPhone'] as String?,
      adminContact: json['AdminContact'] != null
          ? ContactDetail.fromJson(json['AdminContact'] as Map<String, dynamic>)
          : null,
      adminPrivacy: json['AdminPrivacy'] as bool?,
      autoRenew: json['AutoRenew'] as bool?,
      billingContact: json['BillingContact'] != null
          ? ContactDetail.fromJson(
              json['BillingContact'] as Map<String, dynamic>)
          : null,
      billingPrivacy: json['BillingPrivacy'] as bool?,
      creationDate: timeStampFromJson(json['CreationDate']),
      dnsSec: json['DnsSec'] as String?,
      dnssecKeys: (json['DnssecKeys'] as List?)
          ?.nonNulls
          .map((e) => DnssecKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      domainName: json['DomainName'] as String?,
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      nameservers: (json['Nameservers'] as List?)
          ?.nonNulls
          .map((e) => Nameserver.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrantContact: json['RegistrantContact'] != null
          ? ContactDetail.fromJson(
              json['RegistrantContact'] as Map<String, dynamic>)
          : null,
      registrantPrivacy: json['RegistrantPrivacy'] as bool?,
      registrarName: json['RegistrarName'] as String?,
      registrarUrl: json['RegistrarUrl'] as String?,
      registryDomainId: json['RegistryDomainId'] as String?,
      reseller: json['Reseller'] as String?,
      statusList: (json['StatusList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      techContact: json['TechContact'] != null
          ? ContactDetail.fromJson(json['TechContact'] as Map<String, dynamic>)
          : null,
      techPrivacy: json['TechPrivacy'] as bool?,
      updatedDate: timeStampFromJson(json['UpdatedDate']),
      whoIsServer: json['WhoIsServer'] as String?,
    );
  }
}

class GetDomainSuggestionsResponse {
  /// A list of possible domain names. If you specified <code>true</code> for
  /// <code>OnlyAvailable</code> in the request, the list contains only domains
  /// that are available for registration.
  final List<DomainSuggestion>? suggestionsList;

  GetDomainSuggestionsResponse({
    this.suggestionsList,
  });

  factory GetDomainSuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainSuggestionsResponse(
      suggestionsList: (json['SuggestionsList'] as List?)
          ?.nonNulls
          .map((e) => DomainSuggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The GetOperationDetail response includes the following elements.
class GetOperationDetailResponse {
  /// The name of a domain.
  final String? domainName;

  /// The date when the operation was last updated.
  final DateTime? lastUpdatedDate;

  /// Detailed information on the status including possible errors.
  final String? message;

  /// The identifier for the operation.
  final String? operationId;

  /// The current status of the requested operation in the system.
  final OperationStatus? status;

  /// Lists any outstanding operations that require customer action. Valid values
  /// are:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING_ACCEPTANCE</code>: The operation is waiting for acceptance
  /// from the account that is receiving the domain.
  /// </li>
  /// <li>
  /// <code>PENDING_CUSTOMER_ACTION</code>: The operation is waiting for customer
  /// action, for example, returning an email.
  /// </li>
  /// <li>
  /// <code>PENDING_AUTHORIZATION</code>: The operation is waiting for the form of
  /// authorization. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ResendOperationAuthorization.html">ResendOperationAuthorization</a>.
  /// </li>
  /// <li>
  /// <code>PENDING_PAYMENT_VERIFICATION</code>: The operation is waiting for the
  /// payment method to validate.
  /// </li>
  /// <li>
  /// <code>PENDING_SUPPORT_CASE</code>: The operation includes a support case and
  /// is waiting for its resolution.
  /// </li>
  /// </ul>
  final StatusFlag? statusFlag;

  /// The date when the request was submitted.
  final DateTime? submittedDate;

  /// The type of operation that was requested.
  final OperationType? type;

  GetOperationDetailResponse({
    this.domainName,
    this.lastUpdatedDate,
    this.message,
    this.operationId,
    this.status,
    this.statusFlag,
    this.submittedDate,
    this.type,
  });

  factory GetOperationDetailResponse.fromJson(Map<String, dynamic> json) {
    return GetOperationDetailResponse(
      domainName: json['DomainName'] as String?,
      lastUpdatedDate: timeStampFromJson(json['LastUpdatedDate']),
      message: json['Message'] as String?,
      operationId: json['OperationId'] as String?,
      status: (json['Status'] as String?)?.let(OperationStatus.fromString),
      statusFlag: (json['StatusFlag'] as String?)?.let(StatusFlag.fromString),
      submittedDate: timeStampFromJson(json['SubmittedDate']),
      type: (json['Type'] as String?)?.let(OperationType.fromString),
    );
  }
}

enum ListDomainsAttributeName {
  domainName('DomainName'),
  expiry('Expiry'),
  ;

  final String value;

  const ListDomainsAttributeName(this.value);

  static ListDomainsAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ListDomainsAttributeName'));
}

/// The ListDomains response includes the following elements.
class ListDomainsResponse {
  /// A list of domains.
  final List<DomainSummary>? domains;

  /// If there are more domains than you specified for <code>MaxItems</code> in
  /// the request, submit another request and include the value of
  /// <code>NextPageMarker</code> in the value of <code>Marker</code>.
  final String? nextPageMarker;

  ListDomainsResponse({
    this.domains,
    this.nextPageMarker,
  });

  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsResponse(
      domains: (json['Domains'] as List?)
          ?.nonNulls
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageMarker: json['NextPageMarker'] as String?,
    );
  }
}

/// The ListOperations response includes the following elements.
class ListOperationsResponse {
  /// If there are more operations than you specified for <code>MaxItems</code> in
  /// the request, submit another request and include the value of
  /// <code>NextPageMarker</code> in the value of <code>Marker</code>.
  final String? nextPageMarker;

  /// Lists summaries of the operations.
  final List<OperationSummary>? operations;

  ListOperationsResponse({
    this.nextPageMarker,
    this.operations,
  });

  factory ListOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListOperationsResponse(
      nextPageMarker: json['NextPageMarker'] as String?,
      operations: (json['Operations'] as List?)
          ?.nonNulls
          .map((e) => OperationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum ListOperationsSortAttributeName {
  submittedDate('SubmittedDate'),
  ;

  final String value;

  const ListOperationsSortAttributeName(this.value);

  static ListOperationsSortAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ListOperationsSortAttributeName'));
}

class ListPricesResponse {
  /// If there are more prices than you specified for <code>MaxItems</code> in the
  /// request, submit another request and include the value of
  /// <code>NextPageMarker</code> in the value of <code>Marker</code>.
  ///
  /// Used only for all TLDs. If you specify a TLD, don't specify a
  /// <code>NextPageMarker</code>.
  final String? nextPageMarker;

  /// A complex type that includes all the pricing information. If you specify a
  /// TLD, this array contains only the pricing for that TLD.
  final List<DomainPrice>? prices;

  ListPricesResponse({
    this.nextPageMarker,
    this.prices,
  });

  factory ListPricesResponse.fromJson(Map<String, dynamic> json) {
    return ListPricesResponse(
      nextPageMarker: json['NextPageMarker'] as String?,
      prices: (json['Prices'] as List?)
          ?.nonNulls
          .map((e) => DomainPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The ListTagsForDomain response includes the following elements.
class ListTagsForDomainResponse {
  /// A list of the tags that are associated with the specified domain.
  final List<Tag>? tagList;

  ListTagsForDomainResponse({
    this.tagList,
  });

  factory ListTagsForDomainResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForDomainResponse(
      tagList: (json['TagList'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Name server includes the following elements.
class Nameserver {
  /// The fully qualified host name of the name server.
  ///
  /// Constraint: Maximum 255 characters
  final String name;

  /// Glue IP address of a name server entry. Glue IP addresses are required only
  /// when the name of the name server is a subdomain of the domain. For example,
  /// if your domain is example.com and the name server for the domain is
  /// ns.example.com, you need to specify the IP address for ns.example.com.
  ///
  /// Constraints: The list can contain only one IPv4 and one IPv6 address.
  final List<String>? glueIps;

  Nameserver({
    required this.name,
    this.glueIps,
  });

  factory Nameserver.fromJson(Map<String, dynamic> json) {
    return Nameserver(
      name: json['Name'] as String,
      glueIps:
          (json['GlueIps'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final glueIps = this.glueIps;
    return {
      'Name': name,
      if (glueIps != null) 'GlueIps': glueIps,
    };
  }
}

enum OperationStatus {
  submitted('SUBMITTED'),
  inProgress('IN_PROGRESS'),
  error('ERROR'),
  successful('SUCCESSFUL'),
  failed('FAILED'),
  ;

  final String value;

  const OperationStatus(this.value);

  static OperationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OperationStatus'));
}

/// OperationSummary includes the following elements.
class OperationSummary {
  /// Name of the domain.
  final String? domainName;

  /// The date when the last change was made in Unix time format and Coordinated
  /// Universal Time (UTC).
  final DateTime? lastUpdatedDate;

  /// Message about the operation.
  final String? message;

  /// Identifier returned to track the requested action.
  final String? operationId;

  /// The current status of the requested operation in the system.
  final OperationStatus? status;

  /// Automatically checks whether there are no outstanding operations on domains
  /// that need customer attention.
  ///
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING_ACCEPTANCE</code>: The operation is waiting for acceptance
  /// from the account that is receiving the domain.
  /// </li>
  /// <li>
  /// <code>PENDING_CUSTOMER_ACTION</code>: The operation is waiting for customer
  /// action, for example, returning an email.
  /// </li>
  /// <li>
  /// <code>PENDING_AUTHORIZATION</code>: The operation is waiting for the form of
  /// authorization. For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ResendOperationAuthorization.html">ResendOperationAuthorization</a>.
  /// </li>
  /// <li>
  /// <code>PENDING_PAYMENT_VERIFICATION</code>: The operation is waiting for the
  /// payment method to validate.
  /// </li>
  /// <li>
  /// <code>PENDING_SUPPORT_CASE</code>: The operation includes a support case and
  /// is waiting for its resolution.
  /// </li>
  /// </ul>
  final StatusFlag? statusFlag;

  /// The date when the request was submitted.
  final DateTime? submittedDate;

  /// Type of the action requested.
  final OperationType? type;

  OperationSummary({
    this.domainName,
    this.lastUpdatedDate,
    this.message,
    this.operationId,
    this.status,
    this.statusFlag,
    this.submittedDate,
    this.type,
  });

  factory OperationSummary.fromJson(Map<String, dynamic> json) {
    return OperationSummary(
      domainName: json['DomainName'] as String?,
      lastUpdatedDate: timeStampFromJson(json['LastUpdatedDate']),
      message: json['Message'] as String?,
      operationId: json['OperationId'] as String?,
      status: (json['Status'] as String?)?.let(OperationStatus.fromString),
      statusFlag: (json['StatusFlag'] as String?)?.let(StatusFlag.fromString),
      submittedDate: timeStampFromJson(json['SubmittedDate']),
      type: (json['Type'] as String?)?.let(OperationType.fromString),
    );
  }
}

enum OperationType {
  registerDomain('REGISTER_DOMAIN'),
  deleteDomain('DELETE_DOMAIN'),
  transferInDomain('TRANSFER_IN_DOMAIN'),
  updateDomainContact('UPDATE_DOMAIN_CONTACT'),
  updateNameserver('UPDATE_NAMESERVER'),
  changePrivacyProtection('CHANGE_PRIVACY_PROTECTION'),
  domainLock('DOMAIN_LOCK'),
  enableAutorenew('ENABLE_AUTORENEW'),
  disableAutorenew('DISABLE_AUTORENEW'),
  addDnssec('ADD_DNSSEC'),
  removeDnssec('REMOVE_DNSSEC'),
  expireDomain('EXPIRE_DOMAIN'),
  transferOutDomain('TRANSFER_OUT_DOMAIN'),
  changeDomainOwner('CHANGE_DOMAIN_OWNER'),
  renewDomain('RENEW_DOMAIN'),
  pushDomain('PUSH_DOMAIN'),
  internalTransferOutDomain('INTERNAL_TRANSFER_OUT_DOMAIN'),
  internalTransferInDomain('INTERNAL_TRANSFER_IN_DOMAIN'),
  releaseToGandi('RELEASE_TO_GANDI'),
  transferOnRenew('TRANSFER_ON_RENEW'),
  ;

  final String value;

  const OperationType(this.value);

  static OperationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OperationType'));
}

enum Operator {
  le('LE'),
  ge('GE'),
  beginsWith('BEGINS_WITH'),
  ;

  final String value;

  const Operator(this.value);

  static Operator fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Operator'));
}

/// Currency-specific price information.
class PriceWithCurrency {
  /// The currency specifier.
  final String currency;

  /// The price of a domain, in a specific currency.
  final double price;

  PriceWithCurrency({
    required this.currency,
    required this.price,
  });

  factory PriceWithCurrency.fromJson(Map<String, dynamic> json) {
    return PriceWithCurrency(
      currency: json['Currency'] as String,
      price: json['Price'] as double,
    );
  }
}

enum ReachabilityStatus {
  pending('PENDING'),
  done('DONE'),
  expired('EXPIRED'),
  ;

  final String value;

  const ReachabilityStatus(this.value);

  static ReachabilityStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ReachabilityStatus'));
}

/// The RegisterDomain response includes the following element.
class RegisterDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  RegisterDomainResponse({
    this.operationId,
  });

  factory RegisterDomainResponse.fromJson(Map<String, dynamic> json) {
    return RegisterDomainResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// The RejectDomainTransferFromAnotherAwsAccount response includes the
/// following element.
class RejectDomainTransferFromAnotherAwsAccountResponse {
  /// The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned
  /// to track the progress of the request. Because the transfer request was
  /// rejected, the value is no longer valid, and you can't use
  /// <code>GetOperationDetail</code> to query the operation status.
  final String? operationId;

  RejectDomainTransferFromAnotherAwsAccountResponse({
    this.operationId,
  });

  factory RejectDomainTransferFromAnotherAwsAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return RejectDomainTransferFromAnotherAwsAccountResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

class RenewDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  RenewDomainResponse({
    this.operationId,
  });

  factory RenewDomainResponse.fromJson(Map<String, dynamic> json) {
    return RenewDomainResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

class ResendContactReachabilityEmailResponse {
  /// The domain name for which you requested a confirmation email.
  final String? domainName;

  /// The email address for the registrant contact at the time that we sent the
  /// verification email.
  final String? emailAddress;

  /// <code>True</code> if the email address for the registrant contact has
  /// already been verified, and <code>false</code> otherwise. If the email
  /// address has already been verified, we don't send another confirmation email.
  final bool? isAlreadyVerified;

  ResendContactReachabilityEmailResponse({
    this.domainName,
    this.emailAddress,
    this.isAlreadyVerified,
  });

  factory ResendContactReachabilityEmailResponse.fromJson(
      Map<String, dynamic> json) {
    return ResendContactReachabilityEmailResponse(
      domainName: json['domainName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      isAlreadyVerified: json['isAlreadyVerified'] as bool?,
    );
  }
}

/// The RetrieveDomainAuthCode response includes the following element.
class RetrieveDomainAuthCodeResponse {
  /// The authorization code for the domain.
  final String? authCode;

  RetrieveDomainAuthCodeResponse({
    this.authCode,
  });

  factory RetrieveDomainAuthCodeResponse.fromJson(Map<String, dynamic> json) {
    return RetrieveDomainAuthCodeResponse(
      authCode: json['AuthCode'] as String?,
    );
  }
}

/// Information for sorting a list of domains.
class SortCondition {
  /// Field to be used for sorting the list of domains. It can be either the name
  /// or the expiration for a domain. Note that if <code>filterCondition</code> is
  /// used in the same <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains__ListDomains.html">ListDomains</a>
  /// call, the field used for sorting has to be the same as the field used for
  /// filtering.
  final ListDomainsAttributeName name;

  /// The sort order for a list of domains. Either ascending (ASC) or descending
  /// (DES).
  final SortOrder sortOrder;

  SortCondition({
    required this.name,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sortOrder = this.sortOrder;
    return {
      'Name': name.value,
      'SortOrder': sortOrder.value,
    };
  }
}

enum SortOrder {
  asc('ASC'),
  desc('DESC'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
}

enum StatusFlag {
  pendingAcceptance('PENDING_ACCEPTANCE'),
  pendingCustomerAction('PENDING_CUSTOMER_ACTION'),
  pendingAuthorization('PENDING_AUTHORIZATION'),
  pendingPaymentVerification('PENDING_PAYMENT_VERIFICATION'),
  pendingSupportCase('PENDING_SUPPORT_CASE'),
  ;

  final String value;

  const StatusFlag(this.value);

  static StatusFlag fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum StatusFlag'));
}

/// Each tag includes the following elements.
class Tag {
  /// The key (name) of a tag.
  ///
  /// Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@"
  ///
  /// Constraints: Each key can be 1-128 characters long.
  final String? key;

  /// The value of a tag.
  ///
  /// Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@"
  ///
  /// Constraints: Each value can be 0-256 characters long.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

/// The TransferDomain response includes the following element.
class TransferDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  TransferDomainResponse({
    this.operationId,
  });

  factory TransferDomainResponse.fromJson(Map<String, dynamic> json) {
    return TransferDomainResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// The <code>TransferDomainToAnotherAwsAccount</code> response includes the
/// following elements.
class TransferDomainToAnotherAwsAccountResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  /// To finish transferring a domain to another Amazon Web Services account, the
  /// account that the domain is being transferred to must submit an <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>
  /// request. The request must include the value of the <code>Password</code>
  /// element that was returned in the
  /// <code>TransferDomainToAnotherAwsAccount</code> response.
  final String? password;

  TransferDomainToAnotherAwsAccountResponse({
    this.operationId,
    this.password,
  });

  factory TransferDomainToAnotherAwsAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return TransferDomainToAnotherAwsAccountResponse(
      operationId: json['OperationId'] as String?,
      password: json['Password'] as String?,
    );
  }
}

/// Whether the domain name can be transferred to Route 53.
/// <note>
/// You can transfer only domains that have a value of <code>TRANSFERABLE</code>
/// or <code>Transferable</code>.
/// </note>
/// Valid values:
/// <dl> <dt>TRANSFERABLE</dt> <dd>
/// The domain name can be transferred to Route 53.
/// </dd> <dt>UNTRANSFERRABLE</dt> <dd>
/// The domain name can't be transferred to Route 53.
/// </dd> <dt>DONT_KNOW</dt> <dd>
/// Reserved for future use.
/// </dd> <dt>DOMAIN_IN_OWN_ACCOUNT</dt> <dd>
/// The domain already exists in the current Amazon Web Services account.
/// </dd> <dt>DOMAIN_IN_ANOTHER_ACCOUNT</dt> <dd>
/// The domain exists in another Amazon Web Services account.
/// </dd> <dt>PREMIUM_DOMAIN</dt> <dd>
/// Premium domain transfer is not supported.
/// </dd> </dl>
enum Transferable {
  transferable('TRANSFERABLE'),
  untransferable('UNTRANSFERABLE'),
  dontKnow('DONT_KNOW'),
  domainInOwnAccount('DOMAIN_IN_OWN_ACCOUNT'),
  domainInAnotherAccount('DOMAIN_IN_ANOTHER_ACCOUNT'),
  premiumDomain('PREMIUM_DOMAIN'),
  ;

  final String value;

  const Transferable(this.value);

  static Transferable fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum Transferable'));
}

/// The UpdateDomainContactPrivacy response includes the following element.
class UpdateDomainContactPrivacyResponse {
  /// Identifier for tracking the progress of the request. To use this ID to query
  /// the operation status, use GetOperationDetail.
  final String? operationId;

  UpdateDomainContactPrivacyResponse({
    this.operationId,
  });

  factory UpdateDomainContactPrivacyResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDomainContactPrivacyResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// The UpdateDomainContact response includes the following element.
class UpdateDomainContactResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  UpdateDomainContactResponse({
    this.operationId,
  });

  factory UpdateDomainContactResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainContactResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

/// The UpdateDomainNameservers response includes the following element.
class UpdateDomainNameserversResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  UpdateDomainNameserversResponse({
    this.operationId,
  });

  factory UpdateDomainNameserversResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainNameserversResponse(
      operationId: json['OperationId'] as String?,
    );
  }
}

class UpdateTagsForDomainResponse {
  UpdateTagsForDomainResponse();

  factory UpdateTagsForDomainResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTagsForDomainResponse();
  }
}

/// The ViewBilling response includes the following elements.
class ViewBillingResponse {
  /// A summary of billing records.
  final List<BillingRecord>? billingRecords;

  /// If there are more billing records than you specified for
  /// <code>MaxItems</code> in the request, submit another request and include the
  /// value of <code>NextPageMarker</code> in the value of <code>Marker</code>.
  final String? nextPageMarker;

  ViewBillingResponse({
    this.billingRecords,
    this.nextPageMarker,
  });

  factory ViewBillingResponse.fromJson(Map<String, dynamic> json) {
    return ViewBillingResponse(
      billingRecords: (json['BillingRecords'] as List?)
          ?.nonNulls
          .map((e) => BillingRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageMarker: json['NextPageMarker'] as String?,
    );
  }
}

class DnssecLimitExceeded extends _s.GenericAwsException {
  DnssecLimitExceeded({String? type, String? message})
      : super(type: type, code: 'DnssecLimitExceeded', message: message);
}

class DomainLimitExceeded extends _s.GenericAwsException {
  DomainLimitExceeded({String? type, String? message})
      : super(type: type, code: 'DomainLimitExceeded', message: message);
}

class DuplicateRequest extends _s.GenericAwsException {
  DuplicateRequest({String? type, String? message})
      : super(type: type, code: 'DuplicateRequest', message: message);
}

class InvalidInput extends _s.GenericAwsException {
  InvalidInput({String? type, String? message})
      : super(type: type, code: 'InvalidInput', message: message);
}

class OperationLimitExceeded extends _s.GenericAwsException {
  OperationLimitExceeded({String? type, String? message})
      : super(type: type, code: 'OperationLimitExceeded', message: message);
}

class TLDRulesViolation extends _s.GenericAwsException {
  TLDRulesViolation({String? type, String? message})
      : super(type: type, code: 'TLDRulesViolation', message: message);
}

class UnsupportedTLD extends _s.GenericAwsException {
  UnsupportedTLD({String? type, String? message})
      : super(type: type, code: 'UnsupportedTLD', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DnssecLimitExceeded': (type, message) =>
      DnssecLimitExceeded(type: type, message: message),
  'DomainLimitExceeded': (type, message) =>
      DomainLimitExceeded(type: type, message: message),
  'DuplicateRequest': (type, message) =>
      DuplicateRequest(type: type, message: message),
  'InvalidInput': (type, message) => InvalidInput(type: type, message: message),
  'OperationLimitExceeded': (type, message) =>
      OperationLimitExceeded(type: type, message: message),
  'TLDRulesViolation': (type, message) =>
      TLDRulesViolation(type: type, message: message),
  'UnsupportedTLD': (type, message) =>
      UnsupportedTLD(type: type, message: message),
};
