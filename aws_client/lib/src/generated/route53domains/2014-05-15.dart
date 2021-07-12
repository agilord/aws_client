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

/// Amazon Route 53 API actions let you register domain names and perform
/// related operations.
class Route53Domains {
  final _s.JsonProtocol _protocol;
  Route53Domains({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53domains',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts the transfer of a domain from another AWS account to the current
  /// AWS account. You initiate a transfer between AWS accounts using <a
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
  /// May throw [DomainLimitExceeded].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that was specified when another AWS account
  /// submitted a <a
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(password, 'password');
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

  /// Cancels the transfer of a domain from the current AWS account to another
  /// AWS account. You initiate a transfer between AWS accounts using <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>.
  /// <important>
  /// You must cancel the transfer before the other AWS account accepts the
  /// transfer using <a
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
  ///
  /// Parameter [domainName] :
  /// The name of the domain for which you want to cancel the transfer to
  /// another AWS account.
  Future<CancelDomainTransferToAnotherAwsAccountResponse>
      cancelDomainTransferToAnotherAwsAccount({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'idnLangCode',
      idnLangCode,
      0,
      3,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'authCode',
      authCode,
      0,
      1024,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagsToDelete, 'tagsToDelete');
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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

  /// This operation configures Amazon Route 53 to automatically renew the
  /// specified domain before the domain registration expires. The cost of
  /// renewing your domain registration is billed to your AWS account.
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
    );
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
  /// is associated with the current AWS account. Contact information for the
  /// domain is also returned as part of the output.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to get detailed information about.
  Future<GetDomainDetailResponse> getDomainDetail({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(onlyAvailable, 'onlyAvailable');
    ArgumentError.checkNotNull(suggestionCount, 'suggestionCount');
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
    ArgumentError.checkNotNull(operationId, 'operationId');
    _s.validateStringLength(
      'operationId',
      operationId,
      0,
      255,
      isRequired: true,
    );
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
  /// 53 for the current AWS account.
  ///
  /// May throw [InvalidInput].
  ///
  /// Parameter [marker] :
  /// For an initial request for a list of domains, omit this element. If the
  /// number of domains that are associated with the current AWS account is
  /// greater than the value that you specified for <code>MaxItems</code>, you
  /// can use <code>Marker</code> to return additional domains. Get the value of
  /// <code>NextPageMarker</code> from the previous response, and submit another
  /// request that includes the value of <code>NextPageMarker</code> in the
  /// <code>Marker</code> element.
  ///
  /// Constraints: The marker must match the value specified in the previous
  /// request.
  ///
  /// Parameter [maxItems] :
  /// Number of domains to be returned.
  ///
  /// Default: 20
  Future<ListDomainsResponse> listDomains({
    String? marker,
    int? maxItems,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      4096,
    );
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
        if (marker != null) 'Marker': marker,
        if (maxItems != null) 'MaxItems': maxItems,
      },
    );

    return ListDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about all of the operations that return an operation
  /// ID and that have ever been performed on domains that were registered by
  /// the current account.
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
  /// Parameter [submittedSince] :
  /// An optional parameter that lets you get information about all the
  /// operations that you submitted after a specified date and time. Specify the
  /// date and time in Unix time format and Coordinated Universal time (UTC).
  Future<ListOperationsResponse> listOperations({
    String? marker,
    int? maxItems,
    DateTime? submittedSince,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      4096,
    );
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
        if (submittedSince != null)
          'SubmittedSince': unixTimestampToJson(submittedSince),
      },
    );

    return ListOperationsResponse.fromJson(jsonResponse.body);
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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

  /// This operation registers a domain. Domains are registered either by Amazon
  /// Registrar (for .com, .net, and .org domains) or by our registrar
  /// associate, Gandi (for all other domains). For some top-level domains
  /// (TLDs), this operation requires extra parameters.
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
  /// Enables autorenew, so your domain registration will renew automatically
  /// each year. We'll notify you in advance of the renewal date so you can
  /// choose whether to renew the registration.
  /// </li>
  /// <li>
  /// Optionally enables privacy protection, so WHOIS queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you don't
  /// enable privacy protection, WHOIS queries return the information that you
  /// entered for the registrant, admin, and tech contacts.
  /// </li>
  /// <li>
  /// If registration is successful, returns an operation ID that you can use to
  /// track the progress and completion of the action. If the request is not
  /// completed successfully, the domain registrant is notified by email.
  /// </li>
  /// <li>
  /// Charges your AWS account an amount based on the top-level domain. For more
  /// information, see <a href="http://aws.amazon.com/route53/pricing/">Amazon
  /// Route 53 Pricing</a>.
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
  /// (<code>true</code>) or not (<code>false</code>). Autorenewal only takes
  /// effect after the account is charged.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [idnLangCode] :
  /// Reserved for future use.
  ///
  /// Parameter [privacyProtectAdminContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the admin contact.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectRegistrantContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the registrant contact (the domain owner).
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectTechContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the technical contact.
  ///
  /// Default: <code>true</code>
  Future<RegisterDomainResponse> registerDomain({
    required ContactDetail adminContact,
    required String domainName,
    required int durationInYears,
    required ContactDetail registrantContact,
    required ContactDetail techContact,
    bool? autoRenew,
    String? idnLangCode,
    bool? privacyProtectAdminContact,
    bool? privacyProtectRegistrantContact,
    bool? privacyProtectTechContact,
  }) async {
    ArgumentError.checkNotNull(adminContact, 'adminContact');
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(durationInYears, 'durationInYears');
    _s.validateNumRange(
      'durationInYears',
      durationInYears,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(registrantContact, 'registrantContact');
    ArgumentError.checkNotNull(techContact, 'techContact');
    _s.validateStringLength(
      'idnLangCode',
      idnLangCode,
      0,
      3,
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
        if (idnLangCode != null) 'IdnLangCode': idnLangCode,
        if (privacyProtectAdminContact != null)
          'PrivacyProtectAdminContact': privacyProtectAdminContact,
        if (privacyProtectRegistrantContact != null)
          'PrivacyProtectRegistrantContact': privacyProtectRegistrantContact,
        if (privacyProtectTechContact != null)
          'PrivacyProtectTechContact': privacyProtectTechContact,
      },
    );

    return RegisterDomainResponse.fromJson(jsonResponse.body);
  }

  /// Rejects the transfer of a domain from another AWS account to the current
  /// AWS account. You initiate a transfer between AWS accounts using <a
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
  ///
  /// Parameter [domainName] :
  /// The name of the domain that was specified when another AWS account
  /// submitted a <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>
  /// request.
  Future<RejectDomainTransferFromAnotherAwsAccountResponse>
      rejectDomainTransferFromAnotherAwsAccount({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
  /// of renewing your domain is billed to your AWS account.
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
    ArgumentError.checkNotNull(currentExpiryYear, 'currentExpiryYear');
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
    );
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

  /// This operation returns the AuthCode for the domain. To transfer a domain
  /// to another registrar, you provide this value to the new registrar.
  ///
  /// May throw [InvalidInput].
  /// May throw [UnsupportedTLD].
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to get an authorization code for.
  Future<RetrieveDomainAuthCodeResponse> retrieveDomainAuthCode({
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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

  /// Transfers a domain from another registrar to Amazon Route 53. When the
  /// transfer is complete, the domain is registered either with Amazon
  /// Registrar (for .com, .net, and .org domains) or with our registrar
  /// associate, Gandi (for all other TLDs).
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
  /// For information about how to transfer a domain from one AWS account to
  /// another, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html">TransferDomainToAnotherAwsAccount</a>.
  /// </li>
  /// <li>
  /// For information about how to transfer a domain to another domain
  /// registrar, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-from-route-53.html">Transferring
  /// a Domain from Amazon Route 53 to Another Registrar</a> in the <i>Amazon
  /// Route 53 Developer Guide</i>.
  /// </li>
  /// </ul>
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
  /// (false). Autorenewal only takes effect after the account is charged.
  ///
  /// Default: true
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
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the admin contact.
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectRegistrantContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the registrant contact (domain owner).
  ///
  /// Default: <code>true</code>
  ///
  /// Parameter [privacyProtectTechContact] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the technical contact.
  ///
  /// Default: <code>true</code>
  Future<TransferDomainResponse> transferDomain({
    required ContactDetail adminContact,
    required String domainName,
    required int durationInYears,
    required ContactDetail registrantContact,
    required ContactDetail techContact,
    String? authCode,
    bool? autoRenew,
    String? idnLangCode,
    List<Nameserver>? nameservers,
    bool? privacyProtectAdminContact,
    bool? privacyProtectRegistrantContact,
    bool? privacyProtectTechContact,
  }) async {
    ArgumentError.checkNotNull(adminContact, 'adminContact');
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(durationInYears, 'durationInYears');
    _s.validateNumRange(
      'durationInYears',
      durationInYears,
      1,
      10,
      isRequired: true,
    );
    ArgumentError.checkNotNull(registrantContact, 'registrantContact');
    ArgumentError.checkNotNull(techContact, 'techContact');
    _s.validateStringLength(
      'authCode',
      authCode,
      0,
      1024,
    );
    _s.validateStringLength(
      'idnLangCode',
      idnLangCode,
      0,
      3,
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
        if (idnLangCode != null) 'IdnLangCode': idnLangCode,
        if (nameservers != null) 'Nameservers': nameservers,
        if (privacyProtectAdminContact != null)
          'PrivacyProtectAdminContact': privacyProtectAdminContact,
        if (privacyProtectRegistrantContact != null)
          'PrivacyProtectRegistrantContact': privacyProtectRegistrantContact,
        if (privacyProtectTechContact != null)
          'PrivacyProtectTechContact': privacyProtectTechContact,
      },
    );

    return TransferDomainResponse.fromJson(jsonResponse.body);
  }

  /// Transfers a domain from the current AWS account to another AWS account.
  /// Note the following:
  ///
  /// <ul>
  /// <li>
  /// The AWS account that you're transferring the domain to must accept the
  /// transfer. If the other account doesn't accept the transfer within 3 days,
  /// we cancel the transfer. See <a
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
  /// When you transfer a domain from one AWS account to another, Route 53
  /// doesn't transfer the hosted zone that is associated with the domain. DNS
  /// resolution isn't affected if the domain and the hosted zone are owned by
  /// separate accounts, so transferring the hosted zone is optional. For
  /// information about transferring the hosted zone to another AWS account, see
  /// <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html">Migrating
  /// a Hosted Zone to a Different AWS Account</a> in the <i>Amazon Route 53
  /// Developer Guide</i>.
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
  ///
  /// Parameter [accountId] :
  /// The account ID of the AWS account that you want to transfer the domain to,
  /// for example, <code>111122223333</code>.
  ///
  /// Parameter [domainName] :
  /// The name of the domain that you want to transfer from the current AWS
  /// account to another account.
  Future<TransferDomainToAnotherAwsAccountResponse>
      transferDomainToAnotherAwsAccount({
    required String accountId,
    required String domainName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
  /// can use to track the progress and completion of the action. If the request
  /// is not completed successfully, the domain registrant will be notified by
  /// email.
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
  /// Parameter [registrantContact] :
  /// Provides detailed contact information.
  ///
  /// Parameter [techContact] :
  /// Provides detailed contact information.
  Future<UpdateDomainContactResponse> updateDomainContact({
    required String domainName,
    ContactDetail? adminContact,
    ContactDetail? registrantContact,
    ContactDetail? techContact,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
        if (registrantContact != null) 'RegistrantContact': registrantContact,
        if (techContact != null) 'TechContact': techContact,
      },
    );

    return UpdateDomainContactResponse.fromJson(jsonResponse.body);
  }

  /// This operation updates the specified domain contact's privacy setting.
  /// When privacy protection is enabled, contact information such as email
  /// address is replaced either with contact information for Amazon Registrar
  /// (for .com, .net, and .org domains) or with contact information for our
  /// registrar associate, Gandi.
  ///
  /// This operation affects only the contact information for the specified
  /// contact type (registrant, administrator, or tech). If the request
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
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the admin contact.
  ///
  /// Parameter [registrantPrivacy] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the registrant contact (domain owner).
  ///
  /// Parameter [techPrivacy] :
  /// Whether you want to conceal contact information from WHOIS queries. If you
  /// specify <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If you specify
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the technical contact.
  Future<UpdateDomainContactPrivacyResponse> updateDomainContactPrivacy({
    required String domainName,
    bool? adminPrivacy,
    bool? registrantPrivacy,
    bool? techPrivacy,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(nameservers, 'nameservers');
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      255,
      isRequired: true,
    );
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

  /// Returns all the domain-related billing records for the current AWS account
  /// for a specified period
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
  /// If the number of billing records that are associated with the current AWS
  /// account during the specified period is greater than the value that you
  /// specified for <code>MaxItems</code>, you can use <code>Marker</code> to
  /// return additional billing records. Get the value of
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
    _s.validateStringLength(
      'marker',
      marker,
      0,
      4096,
    );
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

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
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
      operation: (json['Operation'] as String?)?.toOperationType(),
      price: json['Price'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final billDate = this.billDate;
    final domainName = this.domainName;
    final invoiceId = this.invoiceId;
    final operation = this.operation;
    final price = this.price;
    return {
      if (billDate != null) 'BillDate': unixTimestampToJson(billDate),
      if (domainName != null) 'DomainName': domainName,
      if (invoiceId != null) 'InvoiceId': invoiceId,
      if (operation != null) 'Operation': operation.toValue(),
      if (price != null) 'Price': price,
    };
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

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
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
  final DomainAvailability availability;

  CheckDomainAvailabilityResponse({
    required this.availability,
  });

  factory CheckDomainAvailabilityResponse.fromJson(Map<String, dynamic> json) {
    return CheckDomainAvailabilityResponse(
      availability: (json['Availability'] as String).toDomainAvailability(),
    );
  }

  Map<String, dynamic> toJson() {
    final availability = this.availability;
    return {
      'Availability': availability.toValue(),
    };
  }
}

/// The CheckDomainTransferability response includes the following elements.
class CheckDomainTransferabilityResponse {
  /// A complex type that contains information about whether the specified domain
  /// can be transferred to Route 53.
  final DomainTransferability transferability;

  CheckDomainTransferabilityResponse({
    required this.transferability,
  });

  factory CheckDomainTransferabilityResponse.fromJson(
      Map<String, dynamic> json) {
    return CheckDomainTransferabilityResponse(
      transferability: DomainTransferability.fromJson(
          json['Transferability'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final transferability = this.transferability;
    return {
      'Transferability': transferability,
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
  /// For .es domains, if you specify <code>PERSON</code>, you must specify
  /// <code>INDIVIDUAL</code> for the value of <code>ES_LEGAL_FORM</code>.
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
      contactType: (json['ContactType'] as String?)?.toContactType(),
      countryCode: (json['CountryCode'] as String?)?.toCountryCode(),
      email: json['Email'] as String?,
      extraParams: (json['ExtraParams'] as List?)
          ?.whereNotNull()
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
      if (contactType != null) 'ContactType': contactType.toValue(),
      if (countryCode != null) 'CountryCode': countryCode.toValue(),
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
  person,
  company,
  association,
  publicBody,
  reseller,
}

extension on ContactType {
  String toValue() {
    switch (this) {
      case ContactType.person:
        return 'PERSON';
      case ContactType.company:
        return 'COMPANY';
      case ContactType.association:
        return 'ASSOCIATION';
      case ContactType.publicBody:
        return 'PUBLIC_BODY';
      case ContactType.reseller:
        return 'RESELLER';
    }
  }
}

extension on String {
  ContactType toContactType() {
    switch (this) {
      case 'PERSON':
        return ContactType.person;
      case 'COMPANY':
        return ContactType.company;
      case 'ASSOCIATION':
        return ContactType.association;
      case 'PUBLIC_BODY':
        return ContactType.publicBody;
      case 'RESELLER':
        return ContactType.reseller;
    }
    throw Exception('$this is not known in enum ContactType');
  }
}

enum CountryCode {
  ad,
  ae,
  af,
  ag,
  ai,
  al,
  am,
  an,
  ao,
  aq,
  ar,
  as,
  at,
  au,
  aw,
  az,
  ba,
  bb,
  bd,
  be,
  bf,
  bg,
  bh,
  bi,
  bj,
  bl,
  bm,
  bn,
  bo,
  br,
  bs,
  bt,
  bw,
  by,
  bz,
  ca,
  cc,
  cd,
  cf,
  cg,
  ch,
  ci,
  ck,
  cl,
  cm,
  cn,
  co,
  cr,
  cu,
  cv,
  cx,
  cy,
  cz,
  de,
  dj,
  dk,
  dm,
  $do,
  dz,
  ec,
  ee,
  eg,
  er,
  es,
  et,
  fi,
  fj,
  fk,
  fm,
  fo,
  fr,
  ga,
  gb,
  gd,
  ge,
  gh,
  gi,
  gl,
  gm,
  gn,
  gq,
  gr,
  gt,
  gu,
  gw,
  gy,
  hk,
  hn,
  hr,
  ht,
  hu,
  id,
  ie,
  il,
  im,
  $in,
  iq,
  ir,
  $is,
  it,
  jm,
  jo,
  jp,
  ke,
  kg,
  kh,
  ki,
  km,
  kn,
  kp,
  kr,
  kw,
  ky,
  kz,
  la,
  lb,
  lc,
  li,
  lk,
  lr,
  ls,
  lt,
  lu,
  lv,
  ly,
  ma,
  mc,
  md,
  me,
  mf,
  mg,
  mh,
  mk,
  ml,
  mm,
  mn,
  mo,
  mp,
  mr,
  ms,
  mt,
  mu,
  mv,
  mw,
  mx,
  my,
  mz,
  na,
  nc,
  ne,
  ng,
  ni,
  nl,
  no,
  np,
  nr,
  nu,
  nz,
  om,
  pa,
  pe,
  pf,
  pg,
  ph,
  pk,
  pl,
  pm,
  pn,
  pr,
  pt,
  pw,
  py,
  qa,
  ro,
  rs,
  ru,
  rw,
  sa,
  sb,
  sc,
  sd,
  se,
  sg,
  sh,
  si,
  sk,
  sl,
  sm,
  sn,
  so,
  sr,
  st,
  sv,
  sy,
  sz,
  tc,
  td,
  tg,
  th,
  tj,
  tk,
  tl,
  tm,
  tn,
  to,
  tr,
  tt,
  tv,
  tw,
  tz,
  ua,
  ug,
  us,
  uy,
  uz,
  va,
  vc,
  ve,
  vg,
  vi,
  vn,
  vu,
  wf,
  ws,
  ye,
  yt,
  za,
  zm,
  zw,
}

extension on CountryCode {
  String toValue() {
    switch (this) {
      case CountryCode.ad:
        return 'AD';
      case CountryCode.ae:
        return 'AE';
      case CountryCode.af:
        return 'AF';
      case CountryCode.ag:
        return 'AG';
      case CountryCode.ai:
        return 'AI';
      case CountryCode.al:
        return 'AL';
      case CountryCode.am:
        return 'AM';
      case CountryCode.an:
        return 'AN';
      case CountryCode.ao:
        return 'AO';
      case CountryCode.aq:
        return 'AQ';
      case CountryCode.ar:
        return 'AR';
      case CountryCode.as:
        return 'AS';
      case CountryCode.at:
        return 'AT';
      case CountryCode.au:
        return 'AU';
      case CountryCode.aw:
        return 'AW';
      case CountryCode.az:
        return 'AZ';
      case CountryCode.ba:
        return 'BA';
      case CountryCode.bb:
        return 'BB';
      case CountryCode.bd:
        return 'BD';
      case CountryCode.be:
        return 'BE';
      case CountryCode.bf:
        return 'BF';
      case CountryCode.bg:
        return 'BG';
      case CountryCode.bh:
        return 'BH';
      case CountryCode.bi:
        return 'BI';
      case CountryCode.bj:
        return 'BJ';
      case CountryCode.bl:
        return 'BL';
      case CountryCode.bm:
        return 'BM';
      case CountryCode.bn:
        return 'BN';
      case CountryCode.bo:
        return 'BO';
      case CountryCode.br:
        return 'BR';
      case CountryCode.bs:
        return 'BS';
      case CountryCode.bt:
        return 'BT';
      case CountryCode.bw:
        return 'BW';
      case CountryCode.by:
        return 'BY';
      case CountryCode.bz:
        return 'BZ';
      case CountryCode.ca:
        return 'CA';
      case CountryCode.cc:
        return 'CC';
      case CountryCode.cd:
        return 'CD';
      case CountryCode.cf:
        return 'CF';
      case CountryCode.cg:
        return 'CG';
      case CountryCode.ch:
        return 'CH';
      case CountryCode.ci:
        return 'CI';
      case CountryCode.ck:
        return 'CK';
      case CountryCode.cl:
        return 'CL';
      case CountryCode.cm:
        return 'CM';
      case CountryCode.cn:
        return 'CN';
      case CountryCode.co:
        return 'CO';
      case CountryCode.cr:
        return 'CR';
      case CountryCode.cu:
        return 'CU';
      case CountryCode.cv:
        return 'CV';
      case CountryCode.cx:
        return 'CX';
      case CountryCode.cy:
        return 'CY';
      case CountryCode.cz:
        return 'CZ';
      case CountryCode.de:
        return 'DE';
      case CountryCode.dj:
        return 'DJ';
      case CountryCode.dk:
        return 'DK';
      case CountryCode.dm:
        return 'DM';
      case CountryCode.$do:
        return 'DO';
      case CountryCode.dz:
        return 'DZ';
      case CountryCode.ec:
        return 'EC';
      case CountryCode.ee:
        return 'EE';
      case CountryCode.eg:
        return 'EG';
      case CountryCode.er:
        return 'ER';
      case CountryCode.es:
        return 'ES';
      case CountryCode.et:
        return 'ET';
      case CountryCode.fi:
        return 'FI';
      case CountryCode.fj:
        return 'FJ';
      case CountryCode.fk:
        return 'FK';
      case CountryCode.fm:
        return 'FM';
      case CountryCode.fo:
        return 'FO';
      case CountryCode.fr:
        return 'FR';
      case CountryCode.ga:
        return 'GA';
      case CountryCode.gb:
        return 'GB';
      case CountryCode.gd:
        return 'GD';
      case CountryCode.ge:
        return 'GE';
      case CountryCode.gh:
        return 'GH';
      case CountryCode.gi:
        return 'GI';
      case CountryCode.gl:
        return 'GL';
      case CountryCode.gm:
        return 'GM';
      case CountryCode.gn:
        return 'GN';
      case CountryCode.gq:
        return 'GQ';
      case CountryCode.gr:
        return 'GR';
      case CountryCode.gt:
        return 'GT';
      case CountryCode.gu:
        return 'GU';
      case CountryCode.gw:
        return 'GW';
      case CountryCode.gy:
        return 'GY';
      case CountryCode.hk:
        return 'HK';
      case CountryCode.hn:
        return 'HN';
      case CountryCode.hr:
        return 'HR';
      case CountryCode.ht:
        return 'HT';
      case CountryCode.hu:
        return 'HU';
      case CountryCode.id:
        return 'ID';
      case CountryCode.ie:
        return 'IE';
      case CountryCode.il:
        return 'IL';
      case CountryCode.im:
        return 'IM';
      case CountryCode.$in:
        return 'IN';
      case CountryCode.iq:
        return 'IQ';
      case CountryCode.ir:
        return 'IR';
      case CountryCode.$is:
        return 'IS';
      case CountryCode.it:
        return 'IT';
      case CountryCode.jm:
        return 'JM';
      case CountryCode.jo:
        return 'JO';
      case CountryCode.jp:
        return 'JP';
      case CountryCode.ke:
        return 'KE';
      case CountryCode.kg:
        return 'KG';
      case CountryCode.kh:
        return 'KH';
      case CountryCode.ki:
        return 'KI';
      case CountryCode.km:
        return 'KM';
      case CountryCode.kn:
        return 'KN';
      case CountryCode.kp:
        return 'KP';
      case CountryCode.kr:
        return 'KR';
      case CountryCode.kw:
        return 'KW';
      case CountryCode.ky:
        return 'KY';
      case CountryCode.kz:
        return 'KZ';
      case CountryCode.la:
        return 'LA';
      case CountryCode.lb:
        return 'LB';
      case CountryCode.lc:
        return 'LC';
      case CountryCode.li:
        return 'LI';
      case CountryCode.lk:
        return 'LK';
      case CountryCode.lr:
        return 'LR';
      case CountryCode.ls:
        return 'LS';
      case CountryCode.lt:
        return 'LT';
      case CountryCode.lu:
        return 'LU';
      case CountryCode.lv:
        return 'LV';
      case CountryCode.ly:
        return 'LY';
      case CountryCode.ma:
        return 'MA';
      case CountryCode.mc:
        return 'MC';
      case CountryCode.md:
        return 'MD';
      case CountryCode.me:
        return 'ME';
      case CountryCode.mf:
        return 'MF';
      case CountryCode.mg:
        return 'MG';
      case CountryCode.mh:
        return 'MH';
      case CountryCode.mk:
        return 'MK';
      case CountryCode.ml:
        return 'ML';
      case CountryCode.mm:
        return 'MM';
      case CountryCode.mn:
        return 'MN';
      case CountryCode.mo:
        return 'MO';
      case CountryCode.mp:
        return 'MP';
      case CountryCode.mr:
        return 'MR';
      case CountryCode.ms:
        return 'MS';
      case CountryCode.mt:
        return 'MT';
      case CountryCode.mu:
        return 'MU';
      case CountryCode.mv:
        return 'MV';
      case CountryCode.mw:
        return 'MW';
      case CountryCode.mx:
        return 'MX';
      case CountryCode.my:
        return 'MY';
      case CountryCode.mz:
        return 'MZ';
      case CountryCode.na:
        return 'NA';
      case CountryCode.nc:
        return 'NC';
      case CountryCode.ne:
        return 'NE';
      case CountryCode.ng:
        return 'NG';
      case CountryCode.ni:
        return 'NI';
      case CountryCode.nl:
        return 'NL';
      case CountryCode.no:
        return 'NO';
      case CountryCode.np:
        return 'NP';
      case CountryCode.nr:
        return 'NR';
      case CountryCode.nu:
        return 'NU';
      case CountryCode.nz:
        return 'NZ';
      case CountryCode.om:
        return 'OM';
      case CountryCode.pa:
        return 'PA';
      case CountryCode.pe:
        return 'PE';
      case CountryCode.pf:
        return 'PF';
      case CountryCode.pg:
        return 'PG';
      case CountryCode.ph:
        return 'PH';
      case CountryCode.pk:
        return 'PK';
      case CountryCode.pl:
        return 'PL';
      case CountryCode.pm:
        return 'PM';
      case CountryCode.pn:
        return 'PN';
      case CountryCode.pr:
        return 'PR';
      case CountryCode.pt:
        return 'PT';
      case CountryCode.pw:
        return 'PW';
      case CountryCode.py:
        return 'PY';
      case CountryCode.qa:
        return 'QA';
      case CountryCode.ro:
        return 'RO';
      case CountryCode.rs:
        return 'RS';
      case CountryCode.ru:
        return 'RU';
      case CountryCode.rw:
        return 'RW';
      case CountryCode.sa:
        return 'SA';
      case CountryCode.sb:
        return 'SB';
      case CountryCode.sc:
        return 'SC';
      case CountryCode.sd:
        return 'SD';
      case CountryCode.se:
        return 'SE';
      case CountryCode.sg:
        return 'SG';
      case CountryCode.sh:
        return 'SH';
      case CountryCode.si:
        return 'SI';
      case CountryCode.sk:
        return 'SK';
      case CountryCode.sl:
        return 'SL';
      case CountryCode.sm:
        return 'SM';
      case CountryCode.sn:
        return 'SN';
      case CountryCode.so:
        return 'SO';
      case CountryCode.sr:
        return 'SR';
      case CountryCode.st:
        return 'ST';
      case CountryCode.sv:
        return 'SV';
      case CountryCode.sy:
        return 'SY';
      case CountryCode.sz:
        return 'SZ';
      case CountryCode.tc:
        return 'TC';
      case CountryCode.td:
        return 'TD';
      case CountryCode.tg:
        return 'TG';
      case CountryCode.th:
        return 'TH';
      case CountryCode.tj:
        return 'TJ';
      case CountryCode.tk:
        return 'TK';
      case CountryCode.tl:
        return 'TL';
      case CountryCode.tm:
        return 'TM';
      case CountryCode.tn:
        return 'TN';
      case CountryCode.to:
        return 'TO';
      case CountryCode.tr:
        return 'TR';
      case CountryCode.tt:
        return 'TT';
      case CountryCode.tv:
        return 'TV';
      case CountryCode.tw:
        return 'TW';
      case CountryCode.tz:
        return 'TZ';
      case CountryCode.ua:
        return 'UA';
      case CountryCode.ug:
        return 'UG';
      case CountryCode.us:
        return 'US';
      case CountryCode.uy:
        return 'UY';
      case CountryCode.uz:
        return 'UZ';
      case CountryCode.va:
        return 'VA';
      case CountryCode.vc:
        return 'VC';
      case CountryCode.ve:
        return 'VE';
      case CountryCode.vg:
        return 'VG';
      case CountryCode.vi:
        return 'VI';
      case CountryCode.vn:
        return 'VN';
      case CountryCode.vu:
        return 'VU';
      case CountryCode.wf:
        return 'WF';
      case CountryCode.ws:
        return 'WS';
      case CountryCode.ye:
        return 'YE';
      case CountryCode.yt:
        return 'YT';
      case CountryCode.za:
        return 'ZA';
      case CountryCode.zm:
        return 'ZM';
      case CountryCode.zw:
        return 'ZW';
    }
  }
}

extension on String {
  CountryCode toCountryCode() {
    switch (this) {
      case 'AD':
        return CountryCode.ad;
      case 'AE':
        return CountryCode.ae;
      case 'AF':
        return CountryCode.af;
      case 'AG':
        return CountryCode.ag;
      case 'AI':
        return CountryCode.ai;
      case 'AL':
        return CountryCode.al;
      case 'AM':
        return CountryCode.am;
      case 'AN':
        return CountryCode.an;
      case 'AO':
        return CountryCode.ao;
      case 'AQ':
        return CountryCode.aq;
      case 'AR':
        return CountryCode.ar;
      case 'AS':
        return CountryCode.as;
      case 'AT':
        return CountryCode.at;
      case 'AU':
        return CountryCode.au;
      case 'AW':
        return CountryCode.aw;
      case 'AZ':
        return CountryCode.az;
      case 'BA':
        return CountryCode.ba;
      case 'BB':
        return CountryCode.bb;
      case 'BD':
        return CountryCode.bd;
      case 'BE':
        return CountryCode.be;
      case 'BF':
        return CountryCode.bf;
      case 'BG':
        return CountryCode.bg;
      case 'BH':
        return CountryCode.bh;
      case 'BI':
        return CountryCode.bi;
      case 'BJ':
        return CountryCode.bj;
      case 'BL':
        return CountryCode.bl;
      case 'BM':
        return CountryCode.bm;
      case 'BN':
        return CountryCode.bn;
      case 'BO':
        return CountryCode.bo;
      case 'BR':
        return CountryCode.br;
      case 'BS':
        return CountryCode.bs;
      case 'BT':
        return CountryCode.bt;
      case 'BW':
        return CountryCode.bw;
      case 'BY':
        return CountryCode.by;
      case 'BZ':
        return CountryCode.bz;
      case 'CA':
        return CountryCode.ca;
      case 'CC':
        return CountryCode.cc;
      case 'CD':
        return CountryCode.cd;
      case 'CF':
        return CountryCode.cf;
      case 'CG':
        return CountryCode.cg;
      case 'CH':
        return CountryCode.ch;
      case 'CI':
        return CountryCode.ci;
      case 'CK':
        return CountryCode.ck;
      case 'CL':
        return CountryCode.cl;
      case 'CM':
        return CountryCode.cm;
      case 'CN':
        return CountryCode.cn;
      case 'CO':
        return CountryCode.co;
      case 'CR':
        return CountryCode.cr;
      case 'CU':
        return CountryCode.cu;
      case 'CV':
        return CountryCode.cv;
      case 'CX':
        return CountryCode.cx;
      case 'CY':
        return CountryCode.cy;
      case 'CZ':
        return CountryCode.cz;
      case 'DE':
        return CountryCode.de;
      case 'DJ':
        return CountryCode.dj;
      case 'DK':
        return CountryCode.dk;
      case 'DM':
        return CountryCode.dm;
      case 'DO':
        return CountryCode.$do;
      case 'DZ':
        return CountryCode.dz;
      case 'EC':
        return CountryCode.ec;
      case 'EE':
        return CountryCode.ee;
      case 'EG':
        return CountryCode.eg;
      case 'ER':
        return CountryCode.er;
      case 'ES':
        return CountryCode.es;
      case 'ET':
        return CountryCode.et;
      case 'FI':
        return CountryCode.fi;
      case 'FJ':
        return CountryCode.fj;
      case 'FK':
        return CountryCode.fk;
      case 'FM':
        return CountryCode.fm;
      case 'FO':
        return CountryCode.fo;
      case 'FR':
        return CountryCode.fr;
      case 'GA':
        return CountryCode.ga;
      case 'GB':
        return CountryCode.gb;
      case 'GD':
        return CountryCode.gd;
      case 'GE':
        return CountryCode.ge;
      case 'GH':
        return CountryCode.gh;
      case 'GI':
        return CountryCode.gi;
      case 'GL':
        return CountryCode.gl;
      case 'GM':
        return CountryCode.gm;
      case 'GN':
        return CountryCode.gn;
      case 'GQ':
        return CountryCode.gq;
      case 'GR':
        return CountryCode.gr;
      case 'GT':
        return CountryCode.gt;
      case 'GU':
        return CountryCode.gu;
      case 'GW':
        return CountryCode.gw;
      case 'GY':
        return CountryCode.gy;
      case 'HK':
        return CountryCode.hk;
      case 'HN':
        return CountryCode.hn;
      case 'HR':
        return CountryCode.hr;
      case 'HT':
        return CountryCode.ht;
      case 'HU':
        return CountryCode.hu;
      case 'ID':
        return CountryCode.id;
      case 'IE':
        return CountryCode.ie;
      case 'IL':
        return CountryCode.il;
      case 'IM':
        return CountryCode.im;
      case 'IN':
        return CountryCode.$in;
      case 'IQ':
        return CountryCode.iq;
      case 'IR':
        return CountryCode.ir;
      case 'IS':
        return CountryCode.$is;
      case 'IT':
        return CountryCode.it;
      case 'JM':
        return CountryCode.jm;
      case 'JO':
        return CountryCode.jo;
      case 'JP':
        return CountryCode.jp;
      case 'KE':
        return CountryCode.ke;
      case 'KG':
        return CountryCode.kg;
      case 'KH':
        return CountryCode.kh;
      case 'KI':
        return CountryCode.ki;
      case 'KM':
        return CountryCode.km;
      case 'KN':
        return CountryCode.kn;
      case 'KP':
        return CountryCode.kp;
      case 'KR':
        return CountryCode.kr;
      case 'KW':
        return CountryCode.kw;
      case 'KY':
        return CountryCode.ky;
      case 'KZ':
        return CountryCode.kz;
      case 'LA':
        return CountryCode.la;
      case 'LB':
        return CountryCode.lb;
      case 'LC':
        return CountryCode.lc;
      case 'LI':
        return CountryCode.li;
      case 'LK':
        return CountryCode.lk;
      case 'LR':
        return CountryCode.lr;
      case 'LS':
        return CountryCode.ls;
      case 'LT':
        return CountryCode.lt;
      case 'LU':
        return CountryCode.lu;
      case 'LV':
        return CountryCode.lv;
      case 'LY':
        return CountryCode.ly;
      case 'MA':
        return CountryCode.ma;
      case 'MC':
        return CountryCode.mc;
      case 'MD':
        return CountryCode.md;
      case 'ME':
        return CountryCode.me;
      case 'MF':
        return CountryCode.mf;
      case 'MG':
        return CountryCode.mg;
      case 'MH':
        return CountryCode.mh;
      case 'MK':
        return CountryCode.mk;
      case 'ML':
        return CountryCode.ml;
      case 'MM':
        return CountryCode.mm;
      case 'MN':
        return CountryCode.mn;
      case 'MO':
        return CountryCode.mo;
      case 'MP':
        return CountryCode.mp;
      case 'MR':
        return CountryCode.mr;
      case 'MS':
        return CountryCode.ms;
      case 'MT':
        return CountryCode.mt;
      case 'MU':
        return CountryCode.mu;
      case 'MV':
        return CountryCode.mv;
      case 'MW':
        return CountryCode.mw;
      case 'MX':
        return CountryCode.mx;
      case 'MY':
        return CountryCode.my;
      case 'MZ':
        return CountryCode.mz;
      case 'NA':
        return CountryCode.na;
      case 'NC':
        return CountryCode.nc;
      case 'NE':
        return CountryCode.ne;
      case 'NG':
        return CountryCode.ng;
      case 'NI':
        return CountryCode.ni;
      case 'NL':
        return CountryCode.nl;
      case 'NO':
        return CountryCode.no;
      case 'NP':
        return CountryCode.np;
      case 'NR':
        return CountryCode.nr;
      case 'NU':
        return CountryCode.nu;
      case 'NZ':
        return CountryCode.nz;
      case 'OM':
        return CountryCode.om;
      case 'PA':
        return CountryCode.pa;
      case 'PE':
        return CountryCode.pe;
      case 'PF':
        return CountryCode.pf;
      case 'PG':
        return CountryCode.pg;
      case 'PH':
        return CountryCode.ph;
      case 'PK':
        return CountryCode.pk;
      case 'PL':
        return CountryCode.pl;
      case 'PM':
        return CountryCode.pm;
      case 'PN':
        return CountryCode.pn;
      case 'PR':
        return CountryCode.pr;
      case 'PT':
        return CountryCode.pt;
      case 'PW':
        return CountryCode.pw;
      case 'PY':
        return CountryCode.py;
      case 'QA':
        return CountryCode.qa;
      case 'RO':
        return CountryCode.ro;
      case 'RS':
        return CountryCode.rs;
      case 'RU':
        return CountryCode.ru;
      case 'RW':
        return CountryCode.rw;
      case 'SA':
        return CountryCode.sa;
      case 'SB':
        return CountryCode.sb;
      case 'SC':
        return CountryCode.sc;
      case 'SD':
        return CountryCode.sd;
      case 'SE':
        return CountryCode.se;
      case 'SG':
        return CountryCode.sg;
      case 'SH':
        return CountryCode.sh;
      case 'SI':
        return CountryCode.si;
      case 'SK':
        return CountryCode.sk;
      case 'SL':
        return CountryCode.sl;
      case 'SM':
        return CountryCode.sm;
      case 'SN':
        return CountryCode.sn;
      case 'SO':
        return CountryCode.so;
      case 'SR':
        return CountryCode.sr;
      case 'ST':
        return CountryCode.st;
      case 'SV':
        return CountryCode.sv;
      case 'SY':
        return CountryCode.sy;
      case 'SZ':
        return CountryCode.sz;
      case 'TC':
        return CountryCode.tc;
      case 'TD':
        return CountryCode.td;
      case 'TG':
        return CountryCode.tg;
      case 'TH':
        return CountryCode.th;
      case 'TJ':
        return CountryCode.tj;
      case 'TK':
        return CountryCode.tk;
      case 'TL':
        return CountryCode.tl;
      case 'TM':
        return CountryCode.tm;
      case 'TN':
        return CountryCode.tn;
      case 'TO':
        return CountryCode.to;
      case 'TR':
        return CountryCode.tr;
      case 'TT':
        return CountryCode.tt;
      case 'TV':
        return CountryCode.tv;
      case 'TW':
        return CountryCode.tw;
      case 'TZ':
        return CountryCode.tz;
      case 'UA':
        return CountryCode.ua;
      case 'UG':
        return CountryCode.ug;
      case 'US':
        return CountryCode.us;
      case 'UY':
        return CountryCode.uy;
      case 'UZ':
        return CountryCode.uz;
      case 'VA':
        return CountryCode.va;
      case 'VC':
        return CountryCode.vc;
      case 'VE':
        return CountryCode.ve;
      case 'VG':
        return CountryCode.vg;
      case 'VI':
        return CountryCode.vi;
      case 'VN':
        return CountryCode.vn;
      case 'VU':
        return CountryCode.vu;
      case 'WF':
        return CountryCode.wf;
      case 'WS':
        return CountryCode.ws;
      case 'YE':
        return CountryCode.ye;
      case 'YT':
        return CountryCode.yt;
      case 'ZA':
        return CountryCode.za;
      case 'ZM':
        return CountryCode.zm;
      case 'ZW':
        return CountryCode.zw;
    }
    throw Exception('$this is not known in enum CountryCode');
  }
}

class DeleteTagsForDomainResponse {
  DeleteTagsForDomainResponse();

  factory DeleteTagsForDomainResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTagsForDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisableDomainAutoRenewResponse {
  DisableDomainAutoRenewResponse();

  factory DisableDomainAutoRenewResponse.fromJson(Map<String, dynamic> _) {
    return DisableDomainAutoRenewResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The DisableDomainTransferLock response includes the following element.
class DisableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String operationId;

  DisableDomainTransferLockResponse({
    required this.operationId,
  });

  factory DisableDomainTransferLockResponse.fromJson(
      Map<String, dynamic> json) {
    return DisableDomainTransferLockResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
  }
}

enum DomainAvailability {
  available,
  availableReserved,
  availablePreorder,
  unavailable,
  unavailablePremium,
  unavailableRestricted,
  reserved,
  dontKnow,
}

extension on DomainAvailability {
  String toValue() {
    switch (this) {
      case DomainAvailability.available:
        return 'AVAILABLE';
      case DomainAvailability.availableReserved:
        return 'AVAILABLE_RESERVED';
      case DomainAvailability.availablePreorder:
        return 'AVAILABLE_PREORDER';
      case DomainAvailability.unavailable:
        return 'UNAVAILABLE';
      case DomainAvailability.unavailablePremium:
        return 'UNAVAILABLE_PREMIUM';
      case DomainAvailability.unavailableRestricted:
        return 'UNAVAILABLE_RESTRICTED';
      case DomainAvailability.reserved:
        return 'RESERVED';
      case DomainAvailability.dontKnow:
        return 'DONT_KNOW';
    }
  }
}

extension on String {
  DomainAvailability toDomainAvailability() {
    switch (this) {
      case 'AVAILABLE':
        return DomainAvailability.available;
      case 'AVAILABLE_RESERVED':
        return DomainAvailability.availableReserved;
      case 'AVAILABLE_PREORDER':
        return DomainAvailability.availablePreorder;
      case 'UNAVAILABLE':
        return DomainAvailability.unavailable;
      case 'UNAVAILABLE_PREMIUM':
        return DomainAvailability.unavailablePremium;
      case 'UNAVAILABLE_RESTRICTED':
        return DomainAvailability.unavailableRestricted;
      case 'RESERVED':
        return DomainAvailability.reserved;
      case 'DONT_KNOW':
        return DomainAvailability.dontKnow;
    }
    throw Exception('$this is not known in enum DomainAvailability');
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

  Map<String, dynamic> toJson() {
    final availability = this.availability;
    final domainName = this.domainName;
    return {
      if (availability != null) 'Availability': availability,
      if (domainName != null) 'DomainName': domainName,
    };
  }
}

/// Summary information about one domain.
class DomainSummary {
  /// The name of the domain that the summary information applies to.
  final String domainName;

  /// Indicates whether the domain is automatically renewed upon expiration.
  final bool? autoRenew;

  /// Expiration date of the domain in Unix time format and Coordinated Universal
  /// Time (UTC).
  final DateTime? expiry;

  /// Indicates whether a domain is locked from unauthorized transfer to another
  /// party.
  final bool? transferLock;

  DomainSummary({
    required this.domainName,
    this.autoRenew,
    this.expiry,
    this.transferLock,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      domainName: json['DomainName'] as String,
      autoRenew: json['AutoRenew'] as bool?,
      expiry: timeStampFromJson(json['Expiry']),
      transferLock: json['TransferLock'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final autoRenew = this.autoRenew;
    final expiry = this.expiry;
    final transferLock = this.transferLock;
    return {
      'DomainName': domainName,
      if (autoRenew != null) 'AutoRenew': autoRenew,
      if (expiry != null) 'Expiry': unixTimestampToJson(expiry),
      if (transferLock != null) 'TransferLock': transferLock,
    };
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
      transferable: (json['Transferable'] as String?)?.toTransferable(),
    );
  }

  Map<String, dynamic> toJson() {
    final transferable = this.transferable;
    return {
      if (transferable != null) 'Transferable': transferable.toValue(),
    };
  }
}

class EnableDomainAutoRenewResponse {
  EnableDomainAutoRenewResponse();

  factory EnableDomainAutoRenewResponse.fromJson(Map<String, dynamic> _) {
    return EnableDomainAutoRenewResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The EnableDomainTransferLock response includes the following elements.
class EnableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To use this ID to query
  /// the operation status, use GetOperationDetail.
  final String operationId;

  EnableDomainTransferLockResponse({
    required this.operationId,
  });

  factory EnableDomainTransferLockResponse.fromJson(Map<String, dynamic> json) {
    return EnableDomainTransferLockResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
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
  /// Specify the applicable value:
  ///
  /// <ul>
  /// <li>
  /// <b>For contacts inside Spain:</b> Enter your passport ID.
  /// </li>
  /// <li>
  /// <b>For contacts outside of Spain:</b> Enter the VAT identification number
  /// for the company.
  /// <note>
  /// For .es domains, the value of <code>ContactType</code> must be
  /// <code>PERSON</code>.
  /// </note> </li>
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
  /// </ul> </dd> <dt>.fr</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>BIRTH_CITY</code>
  /// </li>
  /// <li>
  /// <code>BIRTH_COUNTRY</code>
  /// </li>
  /// <li>
  /// <code>BIRTH_DATE_IN_YYYY_MM_DD</code>
  /// </li>
  /// <li>
  /// <code>BIRTH_DEPARTMENT</code>: Specify the INSEE code that corresponds with
  /// the department where the contact was born. If the contact was born somewhere
  /// other than France or its overseas departments, specify <code>99</code>. For
  /// more information, including a list of departments and the corresponding
  /// INSEE numbers, see the Wikipedia entry <a
  /// href="https://en.wikipedia.org/wiki/Departments_of_France">Departments of
  /// France</a>.
  /// </li>
  /// <li>
  /// <code>BRAND_NUMBER</code>
  /// </li>
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
  /// </ul> </dd> <dt>.co.uk, .me.uk, and .org.uk</dt> <dd>
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
      name: (json['Name'] as String).toExtraParamName(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name.toValue(),
      'Value': value,
    };
  }
}

enum ExtraParamName {
  dunsNumber,
  brandNumber,
  birthDepartment,
  birthDateInYyyyMmDd,
  birthCountry,
  birthCity,
  documentNumber,
  auIdNumber,
  auIdType,
  caLegalType,
  caBusinessEntityType,
  caLegalRepresentative,
  caLegalRepresentativeCapacity,
  esIdentification,
  esIdentificationType,
  esLegalForm,
  fiBusinessNumber,
  fiIdNumber,
  fiNationality,
  fiOrganizationType,
  itNationality,
  itPin,
  itRegistrantEntityType,
  ruPassportData,
  seIdNumber,
  sgIdNumber,
  vatNumber,
  ukContactType,
  ukCompanyNumber,
}

extension on ExtraParamName {
  String toValue() {
    switch (this) {
      case ExtraParamName.dunsNumber:
        return 'DUNS_NUMBER';
      case ExtraParamName.brandNumber:
        return 'BRAND_NUMBER';
      case ExtraParamName.birthDepartment:
        return 'BIRTH_DEPARTMENT';
      case ExtraParamName.birthDateInYyyyMmDd:
        return 'BIRTH_DATE_IN_YYYY_MM_DD';
      case ExtraParamName.birthCountry:
        return 'BIRTH_COUNTRY';
      case ExtraParamName.birthCity:
        return 'BIRTH_CITY';
      case ExtraParamName.documentNumber:
        return 'DOCUMENT_NUMBER';
      case ExtraParamName.auIdNumber:
        return 'AU_ID_NUMBER';
      case ExtraParamName.auIdType:
        return 'AU_ID_TYPE';
      case ExtraParamName.caLegalType:
        return 'CA_LEGAL_TYPE';
      case ExtraParamName.caBusinessEntityType:
        return 'CA_BUSINESS_ENTITY_TYPE';
      case ExtraParamName.caLegalRepresentative:
        return 'CA_LEGAL_REPRESENTATIVE';
      case ExtraParamName.caLegalRepresentativeCapacity:
        return 'CA_LEGAL_REPRESENTATIVE_CAPACITY';
      case ExtraParamName.esIdentification:
        return 'ES_IDENTIFICATION';
      case ExtraParamName.esIdentificationType:
        return 'ES_IDENTIFICATION_TYPE';
      case ExtraParamName.esLegalForm:
        return 'ES_LEGAL_FORM';
      case ExtraParamName.fiBusinessNumber:
        return 'FI_BUSINESS_NUMBER';
      case ExtraParamName.fiIdNumber:
        return 'FI_ID_NUMBER';
      case ExtraParamName.fiNationality:
        return 'FI_NATIONALITY';
      case ExtraParamName.fiOrganizationType:
        return 'FI_ORGANIZATION_TYPE';
      case ExtraParamName.itNationality:
        return 'IT_NATIONALITY';
      case ExtraParamName.itPin:
        return 'IT_PIN';
      case ExtraParamName.itRegistrantEntityType:
        return 'IT_REGISTRANT_ENTITY_TYPE';
      case ExtraParamName.ruPassportData:
        return 'RU_PASSPORT_DATA';
      case ExtraParamName.seIdNumber:
        return 'SE_ID_NUMBER';
      case ExtraParamName.sgIdNumber:
        return 'SG_ID_NUMBER';
      case ExtraParamName.vatNumber:
        return 'VAT_NUMBER';
      case ExtraParamName.ukContactType:
        return 'UK_CONTACT_TYPE';
      case ExtraParamName.ukCompanyNumber:
        return 'UK_COMPANY_NUMBER';
    }
  }
}

extension on String {
  ExtraParamName toExtraParamName() {
    switch (this) {
      case 'DUNS_NUMBER':
        return ExtraParamName.dunsNumber;
      case 'BRAND_NUMBER':
        return ExtraParamName.brandNumber;
      case 'BIRTH_DEPARTMENT':
        return ExtraParamName.birthDepartment;
      case 'BIRTH_DATE_IN_YYYY_MM_DD':
        return ExtraParamName.birthDateInYyyyMmDd;
      case 'BIRTH_COUNTRY':
        return ExtraParamName.birthCountry;
      case 'BIRTH_CITY':
        return ExtraParamName.birthCity;
      case 'DOCUMENT_NUMBER':
        return ExtraParamName.documentNumber;
      case 'AU_ID_NUMBER':
        return ExtraParamName.auIdNumber;
      case 'AU_ID_TYPE':
        return ExtraParamName.auIdType;
      case 'CA_LEGAL_TYPE':
        return ExtraParamName.caLegalType;
      case 'CA_BUSINESS_ENTITY_TYPE':
        return ExtraParamName.caBusinessEntityType;
      case 'CA_LEGAL_REPRESENTATIVE':
        return ExtraParamName.caLegalRepresentative;
      case 'CA_LEGAL_REPRESENTATIVE_CAPACITY':
        return ExtraParamName.caLegalRepresentativeCapacity;
      case 'ES_IDENTIFICATION':
        return ExtraParamName.esIdentification;
      case 'ES_IDENTIFICATION_TYPE':
        return ExtraParamName.esIdentificationType;
      case 'ES_LEGAL_FORM':
        return ExtraParamName.esLegalForm;
      case 'FI_BUSINESS_NUMBER':
        return ExtraParamName.fiBusinessNumber;
      case 'FI_ID_NUMBER':
        return ExtraParamName.fiIdNumber;
      case 'FI_NATIONALITY':
        return ExtraParamName.fiNationality;
      case 'FI_ORGANIZATION_TYPE':
        return ExtraParamName.fiOrganizationType;
      case 'IT_NATIONALITY':
        return ExtraParamName.itNationality;
      case 'IT_PIN':
        return ExtraParamName.itPin;
      case 'IT_REGISTRANT_ENTITY_TYPE':
        return ExtraParamName.itRegistrantEntityType;
      case 'RU_PASSPORT_DATA':
        return ExtraParamName.ruPassportData;
      case 'SE_ID_NUMBER':
        return ExtraParamName.seIdNumber;
      case 'SG_ID_NUMBER':
        return ExtraParamName.sgIdNumber;
      case 'VAT_NUMBER':
        return ExtraParamName.vatNumber;
      case 'UK_CONTACT_TYPE':
        return ExtraParamName.ukContactType;
      case 'UK_COMPANY_NUMBER':
        return ExtraParamName.ukCompanyNumber;
    }
    throw Exception('$this is not known in enum ExtraParamName');
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
      status: (json['status'] as String?)?.toReachabilityStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final status = this.status;
    return {
      if (domainName != null) 'domainName': domainName,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The GetDomainDetail response includes the following elements.
class GetDomainDetailResponse {
  /// Provides details about the domain administrative contact.
  final ContactDetail adminContact;

  /// The name of a domain.
  final String domainName;

  /// The name of the domain.
  final List<Nameserver> nameservers;

  /// Provides details about the domain registrant.
  final ContactDetail registrantContact;

  /// Provides details about the domain technical contact.
  final ContactDetail techContact;

  /// Email address to contact to report incorrect contact information for a
  /// domain, to report that the domain is being used to send spam, to report that
  /// someone is cybersquatting on a domain name, or report some other type of
  /// abuse.
  final String? abuseContactEmail;

  /// Phone number for reporting abuse.
  final String? abuseContactPhone;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If the value is
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the admin contact.
  final bool? adminPrivacy;

  /// Specifies whether the domain registration is set to renew automatically.
  final bool? autoRenew;

  /// The date when the domain was created as found in the response to a WHOIS
  /// query. The date and time is in Unix time format and Coordinated Universal
  /// time (UTC).
  final DateTime? creationDate;

  /// Reserved for future use.
  final String? dnsSec;

  /// The date when the registration for the domain is set to expire. The date and
  /// time is in Unix time format and Coordinated Universal time (UTC).
  final DateTime? expirationDate;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If the value is
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the registrant contact (domain owner).
  final bool? registrantPrivacy;

  /// Name of the registrar of the domain as identified in the registry. Domains
  /// with a .com, .net, or .org TLD are registered by Amazon Registrar. All other
  /// domains are registered by our registrar associate, Gandi. The value for
  /// domains that are registered by Gandi is <code>"GANDI SAS"</code>.
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

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If the value is
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the technical contact.
  final bool? techPrivacy;

  /// The last updated date of the domain as found in the response to a WHOIS
  /// query. The date and time is in Unix time format and Coordinated Universal
  /// time (UTC).
  final DateTime? updatedDate;

  /// The fully qualified name of the WHOIS server that can answer the WHOIS query
  /// for the domain.
  final String? whoIsServer;

  GetDomainDetailResponse({
    required this.adminContact,
    required this.domainName,
    required this.nameservers,
    required this.registrantContact,
    required this.techContact,
    this.abuseContactEmail,
    this.abuseContactPhone,
    this.adminPrivacy,
    this.autoRenew,
    this.creationDate,
    this.dnsSec,
    this.expirationDate,
    this.registrantPrivacy,
    this.registrarName,
    this.registrarUrl,
    this.registryDomainId,
    this.reseller,
    this.statusList,
    this.techPrivacy,
    this.updatedDate,
    this.whoIsServer,
  });

  factory GetDomainDetailResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainDetailResponse(
      adminContact:
          ContactDetail.fromJson(json['AdminContact'] as Map<String, dynamic>),
      domainName: json['DomainName'] as String,
      nameservers: (json['Nameservers'] as List)
          .whereNotNull()
          .map((e) => Nameserver.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrantContact: ContactDetail.fromJson(
          json['RegistrantContact'] as Map<String, dynamic>),
      techContact:
          ContactDetail.fromJson(json['TechContact'] as Map<String, dynamic>),
      abuseContactEmail: json['AbuseContactEmail'] as String?,
      abuseContactPhone: json['AbuseContactPhone'] as String?,
      adminPrivacy: json['AdminPrivacy'] as bool?,
      autoRenew: json['AutoRenew'] as bool?,
      creationDate: timeStampFromJson(json['CreationDate']),
      dnsSec: json['DnsSec'] as String?,
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      registrantPrivacy: json['RegistrantPrivacy'] as bool?,
      registrarName: json['RegistrarName'] as String?,
      registrarUrl: json['RegistrarUrl'] as String?,
      registryDomainId: json['RegistryDomainId'] as String?,
      reseller: json['Reseller'] as String?,
      statusList: (json['StatusList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      techPrivacy: json['TechPrivacy'] as bool?,
      updatedDate: timeStampFromJson(json['UpdatedDate']),
      whoIsServer: json['WhoIsServer'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminContact = this.adminContact;
    final domainName = this.domainName;
    final nameservers = this.nameservers;
    final registrantContact = this.registrantContact;
    final techContact = this.techContact;
    final abuseContactEmail = this.abuseContactEmail;
    final abuseContactPhone = this.abuseContactPhone;
    final adminPrivacy = this.adminPrivacy;
    final autoRenew = this.autoRenew;
    final creationDate = this.creationDate;
    final dnsSec = this.dnsSec;
    final expirationDate = this.expirationDate;
    final registrantPrivacy = this.registrantPrivacy;
    final registrarName = this.registrarName;
    final registrarUrl = this.registrarUrl;
    final registryDomainId = this.registryDomainId;
    final reseller = this.reseller;
    final statusList = this.statusList;
    final techPrivacy = this.techPrivacy;
    final updatedDate = this.updatedDate;
    final whoIsServer = this.whoIsServer;
    return {
      'AdminContact': adminContact,
      'DomainName': domainName,
      'Nameservers': nameservers,
      'RegistrantContact': registrantContact,
      'TechContact': techContact,
      if (abuseContactEmail != null) 'AbuseContactEmail': abuseContactEmail,
      if (abuseContactPhone != null) 'AbuseContactPhone': abuseContactPhone,
      if (adminPrivacy != null) 'AdminPrivacy': adminPrivacy,
      if (autoRenew != null) 'AutoRenew': autoRenew,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (dnsSec != null) 'DnsSec': dnsSec,
      if (expirationDate != null)
        'ExpirationDate': unixTimestampToJson(expirationDate),
      if (registrantPrivacy != null) 'RegistrantPrivacy': registrantPrivacy,
      if (registrarName != null) 'RegistrarName': registrarName,
      if (registrarUrl != null) 'RegistrarUrl': registrarUrl,
      if (registryDomainId != null) 'RegistryDomainId': registryDomainId,
      if (reseller != null) 'Reseller': reseller,
      if (statusList != null) 'StatusList': statusList,
      if (techPrivacy != null) 'TechPrivacy': techPrivacy,
      if (updatedDate != null) 'UpdatedDate': unixTimestampToJson(updatedDate),
      if (whoIsServer != null) 'WhoIsServer': whoIsServer,
    };
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
          ?.whereNotNull()
          .map((e) => DomainSuggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final suggestionsList = this.suggestionsList;
    return {
      if (suggestionsList != null) 'SuggestionsList': suggestionsList,
    };
  }
}

/// The GetOperationDetail response includes the following elements.
class GetOperationDetailResponse {
  /// The name of a domain.
  final String? domainName;

  /// Detailed information on the status including possible errors.
  final String? message;

  /// The identifier for the operation.
  final String? operationId;

  /// The current status of the requested operation in the system.
  final OperationStatus? status;

  /// The date when the request was submitted.
  final DateTime? submittedDate;

  /// The type of operation that was requested.
  final OperationType? type;

  GetOperationDetailResponse({
    this.domainName,
    this.message,
    this.operationId,
    this.status,
    this.submittedDate,
    this.type,
  });

  factory GetOperationDetailResponse.fromJson(Map<String, dynamic> json) {
    return GetOperationDetailResponse(
      domainName: json['DomainName'] as String?,
      message: json['Message'] as String?,
      operationId: json['OperationId'] as String?,
      status: (json['Status'] as String?)?.toOperationStatus(),
      submittedDate: timeStampFromJson(json['SubmittedDate']),
      type: (json['Type'] as String?)?.toOperationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final message = this.message;
    final operationId = this.operationId;
    final status = this.status;
    final submittedDate = this.submittedDate;
    final type = this.type;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (message != null) 'Message': message,
      if (operationId != null) 'OperationId': operationId,
      if (status != null) 'Status': status.toValue(),
      if (submittedDate != null)
        'SubmittedDate': unixTimestampToJson(submittedDate),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The ListDomains response includes the following elements.
class ListDomainsResponse {
  /// A summary of domains.
  final List<DomainSummary> domains;

  /// If there are more domains than you specified for <code>MaxItems</code> in
  /// the request, submit another request and include the value of
  /// <code>NextPageMarker</code> in the value of <code>Marker</code>.
  final String? nextPageMarker;

  ListDomainsResponse({
    required this.domains,
    this.nextPageMarker,
  });

  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsResponse(
      domains: (json['Domains'] as List)
          .whereNotNull()
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageMarker: json['NextPageMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    final nextPageMarker = this.nextPageMarker;
    return {
      'Domains': domains,
      if (nextPageMarker != null) 'NextPageMarker': nextPageMarker,
    };
  }
}

/// The ListOperations response includes the following elements.
class ListOperationsResponse {
  /// Lists summaries of the operations.
  final List<OperationSummary> operations;

  /// If there are more operations than you specified for <code>MaxItems</code> in
  /// the request, submit another request and include the value of
  /// <code>NextPageMarker</code> in the value of <code>Marker</code>.
  final String? nextPageMarker;

  ListOperationsResponse({
    required this.operations,
    this.nextPageMarker,
  });

  factory ListOperationsResponse.fromJson(Map<String, dynamic> json) {
    return ListOperationsResponse(
      operations: (json['Operations'] as List)
          .whereNotNull()
          .map((e) => OperationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageMarker: json['NextPageMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    final nextPageMarker = this.nextPageMarker;
    return {
      'Operations': operations,
      if (nextPageMarker != null) 'NextPageMarker': nextPageMarker,
    };
  }
}

/// The ListTagsForDomain response includes the following elements.
class ListTagsForDomainResponse {
  /// A list of the tags that are associated with the specified domain.
  final List<Tag> tagList;

  ListTagsForDomainResponse({
    required this.tagList,
  });

  factory ListTagsForDomainResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForDomainResponse(
      tagList: (json['TagList'] as List)
          .whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      'TagList': tagList,
    };
  }
}

/// Nameserver includes the following elements.
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
      glueIps: (json['GlueIps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
  submitted,
  inProgress,
  error,
  successful,
  failed,
}

extension on OperationStatus {
  String toValue() {
    switch (this) {
      case OperationStatus.submitted:
        return 'SUBMITTED';
      case OperationStatus.inProgress:
        return 'IN_PROGRESS';
      case OperationStatus.error:
        return 'ERROR';
      case OperationStatus.successful:
        return 'SUCCESSFUL';
      case OperationStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  OperationStatus toOperationStatus() {
    switch (this) {
      case 'SUBMITTED':
        return OperationStatus.submitted;
      case 'IN_PROGRESS':
        return OperationStatus.inProgress;
      case 'ERROR':
        return OperationStatus.error;
      case 'SUCCESSFUL':
        return OperationStatus.successful;
      case 'FAILED':
        return OperationStatus.failed;
    }
    throw Exception('$this is not known in enum OperationStatus');
  }
}

/// OperationSummary includes the following elements.
class OperationSummary {
  /// Identifier returned to track the requested action.
  final String operationId;

  /// The current status of the requested operation in the system.
  final OperationStatus status;

  /// The date when the request was submitted.
  final DateTime submittedDate;

  /// Type of the action requested.
  final OperationType type;

  OperationSummary({
    required this.operationId,
    required this.status,
    required this.submittedDate,
    required this.type,
  });

  factory OperationSummary.fromJson(Map<String, dynamic> json) {
    return OperationSummary(
      operationId: json['OperationId'] as String,
      status: (json['Status'] as String).toOperationStatus(),
      submittedDate:
          nonNullableTimeStampFromJson(json['SubmittedDate'] as Object),
      type: (json['Type'] as String).toOperationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    final status = this.status;
    final submittedDate = this.submittedDate;
    final type = this.type;
    return {
      'OperationId': operationId,
      'Status': status.toValue(),
      'SubmittedDate': unixTimestampToJson(submittedDate),
      'Type': type.toValue(),
    };
  }
}

enum OperationType {
  registerDomain,
  deleteDomain,
  transferInDomain,
  updateDomainContact,
  updateNameserver,
  changePrivacyProtection,
  domainLock,
  enableAutorenew,
  disableAutorenew,
  addDnssec,
  removeDnssec,
  expireDomain,
  transferOutDomain,
  changeDomainOwner,
  renewDomain,
  pushDomain,
  internalTransferOutDomain,
  internalTransferInDomain,
}

extension on OperationType {
  String toValue() {
    switch (this) {
      case OperationType.registerDomain:
        return 'REGISTER_DOMAIN';
      case OperationType.deleteDomain:
        return 'DELETE_DOMAIN';
      case OperationType.transferInDomain:
        return 'TRANSFER_IN_DOMAIN';
      case OperationType.updateDomainContact:
        return 'UPDATE_DOMAIN_CONTACT';
      case OperationType.updateNameserver:
        return 'UPDATE_NAMESERVER';
      case OperationType.changePrivacyProtection:
        return 'CHANGE_PRIVACY_PROTECTION';
      case OperationType.domainLock:
        return 'DOMAIN_LOCK';
      case OperationType.enableAutorenew:
        return 'ENABLE_AUTORENEW';
      case OperationType.disableAutorenew:
        return 'DISABLE_AUTORENEW';
      case OperationType.addDnssec:
        return 'ADD_DNSSEC';
      case OperationType.removeDnssec:
        return 'REMOVE_DNSSEC';
      case OperationType.expireDomain:
        return 'EXPIRE_DOMAIN';
      case OperationType.transferOutDomain:
        return 'TRANSFER_OUT_DOMAIN';
      case OperationType.changeDomainOwner:
        return 'CHANGE_DOMAIN_OWNER';
      case OperationType.renewDomain:
        return 'RENEW_DOMAIN';
      case OperationType.pushDomain:
        return 'PUSH_DOMAIN';
      case OperationType.internalTransferOutDomain:
        return 'INTERNAL_TRANSFER_OUT_DOMAIN';
      case OperationType.internalTransferInDomain:
        return 'INTERNAL_TRANSFER_IN_DOMAIN';
    }
  }
}

extension on String {
  OperationType toOperationType() {
    switch (this) {
      case 'REGISTER_DOMAIN':
        return OperationType.registerDomain;
      case 'DELETE_DOMAIN':
        return OperationType.deleteDomain;
      case 'TRANSFER_IN_DOMAIN':
        return OperationType.transferInDomain;
      case 'UPDATE_DOMAIN_CONTACT':
        return OperationType.updateDomainContact;
      case 'UPDATE_NAMESERVER':
        return OperationType.updateNameserver;
      case 'CHANGE_PRIVACY_PROTECTION':
        return OperationType.changePrivacyProtection;
      case 'DOMAIN_LOCK':
        return OperationType.domainLock;
      case 'ENABLE_AUTORENEW':
        return OperationType.enableAutorenew;
      case 'DISABLE_AUTORENEW':
        return OperationType.disableAutorenew;
      case 'ADD_DNSSEC':
        return OperationType.addDnssec;
      case 'REMOVE_DNSSEC':
        return OperationType.removeDnssec;
      case 'EXPIRE_DOMAIN':
        return OperationType.expireDomain;
      case 'TRANSFER_OUT_DOMAIN':
        return OperationType.transferOutDomain;
      case 'CHANGE_DOMAIN_OWNER':
        return OperationType.changeDomainOwner;
      case 'RENEW_DOMAIN':
        return OperationType.renewDomain;
      case 'PUSH_DOMAIN':
        return OperationType.pushDomain;
      case 'INTERNAL_TRANSFER_OUT_DOMAIN':
        return OperationType.internalTransferOutDomain;
      case 'INTERNAL_TRANSFER_IN_DOMAIN':
        return OperationType.internalTransferInDomain;
    }
    throw Exception('$this is not known in enum OperationType');
  }
}

enum ReachabilityStatus {
  pending,
  done,
  expired,
}

extension on ReachabilityStatus {
  String toValue() {
    switch (this) {
      case ReachabilityStatus.pending:
        return 'PENDING';
      case ReachabilityStatus.done:
        return 'DONE';
      case ReachabilityStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension on String {
  ReachabilityStatus toReachabilityStatus() {
    switch (this) {
      case 'PENDING':
        return ReachabilityStatus.pending;
      case 'DONE':
        return ReachabilityStatus.done;
      case 'EXPIRED':
        return ReachabilityStatus.expired;
    }
    throw Exception('$this is not known in enum ReachabilityStatus');
  }
}

/// The RegisterDomain response includes the following element.
class RegisterDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String operationId;

  RegisterDomainResponse({
    required this.operationId,
  });

  factory RegisterDomainResponse.fromJson(Map<String, dynamic> json) {
    return RegisterDomainResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
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

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class RenewDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String operationId;

  RenewDomainResponse({
    required this.operationId,
  });

  factory RenewDomainResponse.fromJson(Map<String, dynamic> json) {
    return RenewDomainResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
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

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final emailAddress = this.emailAddress;
    final isAlreadyVerified = this.isAlreadyVerified;
    return {
      if (domainName != null) 'domainName': domainName,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (isAlreadyVerified != null) 'isAlreadyVerified': isAlreadyVerified,
    };
  }
}

/// The RetrieveDomainAuthCode response includes the following element.
class RetrieveDomainAuthCodeResponse {
  /// The authorization code for the domain.
  final String authCode;

  RetrieveDomainAuthCodeResponse({
    required this.authCode,
  });

  factory RetrieveDomainAuthCodeResponse.fromJson(Map<String, dynamic> json) {
    return RetrieveDomainAuthCodeResponse(
      authCode: json['AuthCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final authCode = this.authCode;
    return {
      'AuthCode': authCode,
    };
  }
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
  final String operationId;

  TransferDomainResponse({
    required this.operationId,
  });

  factory TransferDomainResponse.fromJson(Map<String, dynamic> json) {
    return TransferDomainResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
  }
}

/// The <code>TransferDomainToAnotherAwsAccount</code> response includes the
/// following elements.
class TransferDomainToAnotherAwsAccountResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String? operationId;

  /// To finish transferring a domain to another AWS account, the account that the
  /// domain is being transferred to must submit an <a
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

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    final password = this.password;
    return {
      if (operationId != null) 'OperationId': operationId,
      if (password != null) 'Password': password,
    };
  }
}

/// Whether the domain name can be transferred to Route 53.
/// <note>
/// You can transfer only domains that have a value of <code>TRANSFERABLE</code>
/// for <code>Transferable</code>.
/// </note>
/// Valid values:
/// <dl> <dt>TRANSFERABLE</dt> <dd>
/// The domain name can be transferred to Route 53.
/// </dd> <dt>UNTRANSFERRABLE</dt> <dd>
/// The domain name can't be transferred to Route 53.
/// </dd> <dt>DONT_KNOW</dt> <dd>
/// Reserved for future use.
/// </dd> </dl>
enum Transferable {
  transferable,
  untransferable,
  dontKnow,
}

extension on Transferable {
  String toValue() {
    switch (this) {
      case Transferable.transferable:
        return 'TRANSFERABLE';
      case Transferable.untransferable:
        return 'UNTRANSFERABLE';
      case Transferable.dontKnow:
        return 'DONT_KNOW';
    }
  }
}

extension on String {
  Transferable toTransferable() {
    switch (this) {
      case 'TRANSFERABLE':
        return Transferable.transferable;
      case 'UNTRANSFERABLE':
        return Transferable.untransferable;
      case 'DONT_KNOW':
        return Transferable.dontKnow;
    }
    throw Exception('$this is not known in enum Transferable');
  }
}

/// The UpdateDomainContactPrivacy response includes the following element.
class UpdateDomainContactPrivacyResponse {
  /// Identifier for tracking the progress of the request. To use this ID to query
  /// the operation status, use GetOperationDetail.
  final String operationId;

  UpdateDomainContactPrivacyResponse({
    required this.operationId,
  });

  factory UpdateDomainContactPrivacyResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDomainContactPrivacyResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
  }
}

/// The UpdateDomainContact response includes the following element.
class UpdateDomainContactResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String operationId;

  UpdateDomainContactResponse({
    required this.operationId,
  });

  factory UpdateDomainContactResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainContactResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
  }
}

/// The UpdateDomainNameservers response includes the following element.
class UpdateDomainNameserversResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  final String operationId;

  UpdateDomainNameserversResponse({
    required this.operationId,
  });

  factory UpdateDomainNameserversResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainNameserversResponse(
      operationId: json['OperationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      'OperationId': operationId,
    };
  }
}

class UpdateTagsForDomainResponse {
  UpdateTagsForDomainResponse();

  factory UpdateTagsForDomainResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTagsForDomainResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
          ?.whereNotNull()
          .map((e) => BillingRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageMarker: json['NextPageMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingRecords = this.billingRecords;
    final nextPageMarker = this.nextPageMarker;
    return {
      if (billingRecords != null) 'BillingRecords': billingRecords,
      if (nextPageMarker != null) 'NextPageMarker': nextPageMarker,
    };
  }
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
