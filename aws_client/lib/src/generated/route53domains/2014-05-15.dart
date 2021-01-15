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

part '2014-05-15.g.dart';

/// Amazon Route 53 API actions let you register domain names and perform
/// related operations.
class Route53Domains {
  final _s.JsonProtocol _protocol;
  Route53Domains({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String domainName,
    @_s.required String password,
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
    @_s.required String domainName,
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
    @_s.required String domainName,
    String idnLangCode,
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
    @_s.required String domainName,
    String authCode,
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
    @_s.required String domainName,
    @_s.required List<String> tagsToDelete,
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
    final jsonResponse = await _protocol.send(
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

    return DeleteTagsForDomainResponse.fromJson(jsonResponse.body);
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
    @_s.required String domainName,
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

    return DisableDomainAutoRenewResponse.fromJson(jsonResponse.body);
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
    @_s.required String domainName,
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
    @_s.required String domainName,
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

    return EnableDomainAutoRenewResponse.fromJson(jsonResponse.body);
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
    @_s.required String domainName,
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
    String domainName,
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
    @_s.required String domainName,
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
    @_s.required String domainName,
    @_s.required bool onlyAvailable,
    @_s.required int suggestionCount,
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
    @_s.required String operationId,
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
    String marker,
    int maxItems,
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
    String marker,
    int maxItems,
    DateTime submittedSince,
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
    @_s.required String domainName,
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
    @_s.required ContactDetail adminContact,
    @_s.required String domainName,
    @_s.required int durationInYears,
    @_s.required ContactDetail registrantContact,
    @_s.required ContactDetail techContact,
    bool autoRenew,
    String idnLangCode,
    bool privacyProtectAdminContact,
    bool privacyProtectRegistrantContact,
    bool privacyProtectTechContact,
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
    @_s.required String domainName,
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
    @_s.required int currentExpiryYear,
    @_s.required String domainName,
    int durationInYears,
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
    String domainName,
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
    @_s.required String domainName,
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
    @_s.required ContactDetail adminContact,
    @_s.required String domainName,
    @_s.required int durationInYears,
    @_s.required ContactDetail registrantContact,
    @_s.required ContactDetail techContact,
    String authCode,
    bool autoRenew,
    String idnLangCode,
    List<Nameserver> nameservers,
    bool privacyProtectAdminContact,
    bool privacyProtectRegistrantContact,
    bool privacyProtectTechContact,
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
    @_s.required String accountId,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''^(\d{12})$''',
      isRequired: true,
    );
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
    @_s.required String domainName,
    ContactDetail adminContact,
    ContactDetail registrantContact,
    ContactDetail techContact,
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
    @_s.required String domainName,
    bool adminPrivacy,
    bool registrantPrivacy,
    bool techPrivacy,
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
    @_s.required String domainName,
    @_s.required List<Nameserver> nameservers,
    String fIAuthKey,
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
    @_s.required String domainName,
    List<Tag> tagsToUpdate,
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
    final jsonResponse = await _protocol.send(
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

    return UpdateTagsForDomainResponse.fromJson(jsonResponse.body);
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
    DateTime end,
    String marker,
    int maxItems,
    DateTime start,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptDomainTransferFromAnotherAwsAccountResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  AcceptDomainTransferFromAnotherAwsAccountResponse({
    this.operationId,
  });
  factory AcceptDomainTransferFromAnotherAwsAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AcceptDomainTransferFromAnotherAwsAccountResponseFromJson(json);
}

/// Information for one billing record.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BillingRecord {
  /// The date that the operation was billed, in Unix format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'BillDate')
  final DateTime billDate;

  /// The name of the domain that the billing record applies to. If the domain
  /// name contains characters other than a-z, 0-9, and - (hyphen), such as an
  /// internationalized domain name, then this value is in Punycode. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DomainNameFormat.html">DNS
  /// Domain Name Format</a> in the <i>Amazon Route 53 Developer Guide</i>.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The ID of the invoice that is associated with the billing record.
  @_s.JsonKey(name: 'InvoiceId')
  final String invoiceId;

  /// The operation that you were charged for.
  @_s.JsonKey(name: 'Operation')
  final OperationType operation;

  /// The price that you were charged for the operation, in US dollars.
  ///
  /// Example value: 12.0
  @_s.JsonKey(name: 'Price')
  final double price;

  BillingRecord({
    this.billDate,
    this.domainName,
    this.invoiceId,
    this.operation,
    this.price,
  });
  factory BillingRecord.fromJson(Map<String, dynamic> json) =>
      _$BillingRecordFromJson(json);
}

/// The <code>CancelDomainTransferToAnotherAwsAccount</code> response includes
/// the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelDomainTransferToAnotherAwsAccountResponse {
  /// The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned
  /// to track the progress of the request. Because the transfer request was
  /// canceled, the value is no longer valid, and you can't use
  /// <code>GetOperationDetail</code> to query the operation status.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  CancelDomainTransferToAnotherAwsAccountResponse({
    this.operationId,
  });
  factory CancelDomainTransferToAnotherAwsAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelDomainTransferToAnotherAwsAccountResponseFromJson(json);
}

/// The CheckDomainAvailability response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'Availability')
  final DomainAvailability availability;

  CheckDomainAvailabilityResponse({
    @_s.required this.availability,
  });
  factory CheckDomainAvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckDomainAvailabilityResponseFromJson(json);
}

/// The CheckDomainTransferability response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CheckDomainTransferabilityResponse {
  /// A complex type that contains information about whether the specified domain
  /// can be transferred to Route 53.
  @_s.JsonKey(name: 'Transferability')
  final DomainTransferability transferability;

  CheckDomainTransferabilityResponse({
    @_s.required this.transferability,
  });
  factory CheckDomainTransferabilityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CheckDomainTransferabilityResponseFromJson(json);
}

/// ContactDetail includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContactDetail {
  /// First line of the contact's address.
  @_s.JsonKey(name: 'AddressLine1')
  final String addressLine1;

  /// Second line of contact's address, if any.
  @_s.JsonKey(name: 'AddressLine2')
  final String addressLine2;

  /// The city of the contact's address.
  @_s.JsonKey(name: 'City')
  final String city;

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
  @_s.JsonKey(name: 'ContactType')
  final ContactType contactType;

  /// Code for the country of the contact's address.
  @_s.JsonKey(name: 'CountryCode')
  final CountryCode countryCode;

  /// Email address of the contact.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// A list of name-value pairs for parameters required by certain top-level
  /// domains.
  @_s.JsonKey(name: 'ExtraParams')
  final List<ExtraParam> extraParams;

  /// Fax number of the contact.
  ///
  /// Constraints: Phone number must be specified in the format "+[country dialing
  /// code].[number including any area code]". For example, a US phone number
  /// might appear as <code>"+1.1234567890"</code>.
  @_s.JsonKey(name: 'Fax')
  final String fax;

  /// First name of contact.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// Last name of contact.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

  /// Name of the organization for contact types other than <code>PERSON</code>.
  @_s.JsonKey(name: 'OrganizationName')
  final String organizationName;

  /// The phone number of the contact.
  ///
  /// Constraints: Phone number must be specified in the format "+[country dialing
  /// code].[number including any area code&gt;]". For example, a US phone number
  /// might appear as <code>"+1.1234567890"</code>.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The state or province of the contact's city.
  @_s.JsonKey(name: 'State')
  final String state;

  /// The zip or postal code of the contact's address.
  @_s.JsonKey(name: 'ZipCode')
  final String zipCode;

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
  factory ContactDetail.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailToJson(this);
}

enum ContactType {
  @_s.JsonValue('PERSON')
  person,
  @_s.JsonValue('COMPANY')
  company,
  @_s.JsonValue('ASSOCIATION')
  association,
  @_s.JsonValue('PUBLIC_BODY')
  publicBody,
  @_s.JsonValue('RESELLER')
  reseller,
}

enum CountryCode {
  @_s.JsonValue('AD')
  ad,
  @_s.JsonValue('AE')
  ae,
  @_s.JsonValue('AF')
  af,
  @_s.JsonValue('AG')
  ag,
  @_s.JsonValue('AI')
  ai,
  @_s.JsonValue('AL')
  al,
  @_s.JsonValue('AM')
  am,
  @_s.JsonValue('AN')
  an,
  @_s.JsonValue('AO')
  ao,
  @_s.JsonValue('AQ')
  aq,
  @_s.JsonValue('AR')
  ar,
  @_s.JsonValue('AS')
  as,
  @_s.JsonValue('AT')
  at,
  @_s.JsonValue('AU')
  au,
  @_s.JsonValue('AW')
  aw,
  @_s.JsonValue('AZ')
  az,
  @_s.JsonValue('BA')
  ba,
  @_s.JsonValue('BB')
  bb,
  @_s.JsonValue('BD')
  bd,
  @_s.JsonValue('BE')
  be,
  @_s.JsonValue('BF')
  bf,
  @_s.JsonValue('BG')
  bg,
  @_s.JsonValue('BH')
  bh,
  @_s.JsonValue('BI')
  bi,
  @_s.JsonValue('BJ')
  bj,
  @_s.JsonValue('BL')
  bl,
  @_s.JsonValue('BM')
  bm,
  @_s.JsonValue('BN')
  bn,
  @_s.JsonValue('BO')
  bo,
  @_s.JsonValue('BR')
  br,
  @_s.JsonValue('BS')
  bs,
  @_s.JsonValue('BT')
  bt,
  @_s.JsonValue('BW')
  bw,
  @_s.JsonValue('BY')
  by,
  @_s.JsonValue('BZ')
  bz,
  @_s.JsonValue('CA')
  ca,
  @_s.JsonValue('CC')
  cc,
  @_s.JsonValue('CD')
  cd,
  @_s.JsonValue('CF')
  cf,
  @_s.JsonValue('CG')
  cg,
  @_s.JsonValue('CH')
  ch,
  @_s.JsonValue('CI')
  ci,
  @_s.JsonValue('CK')
  ck,
  @_s.JsonValue('CL')
  cl,
  @_s.JsonValue('CM')
  cm,
  @_s.JsonValue('CN')
  cn,
  @_s.JsonValue('CO')
  co,
  @_s.JsonValue('CR')
  cr,
  @_s.JsonValue('CU')
  cu,
  @_s.JsonValue('CV')
  cv,
  @_s.JsonValue('CX')
  cx,
  @_s.JsonValue('CY')
  cy,
  @_s.JsonValue('CZ')
  cz,
  @_s.JsonValue('DE')
  de,
  @_s.JsonValue('DJ')
  dj,
  @_s.JsonValue('DK')
  dk,
  @_s.JsonValue('DM')
  dm,
  @_s.JsonValue('DO')
  $do,
  @_s.JsonValue('DZ')
  dz,
  @_s.JsonValue('EC')
  ec,
  @_s.JsonValue('EE')
  ee,
  @_s.JsonValue('EG')
  eg,
  @_s.JsonValue('ER')
  er,
  @_s.JsonValue('ES')
  es,
  @_s.JsonValue('ET')
  et,
  @_s.JsonValue('FI')
  fi,
  @_s.JsonValue('FJ')
  fj,
  @_s.JsonValue('FK')
  fk,
  @_s.JsonValue('FM')
  fm,
  @_s.JsonValue('FO')
  fo,
  @_s.JsonValue('FR')
  fr,
  @_s.JsonValue('GA')
  ga,
  @_s.JsonValue('GB')
  gb,
  @_s.JsonValue('GD')
  gd,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('GH')
  gh,
  @_s.JsonValue('GI')
  gi,
  @_s.JsonValue('GL')
  gl,
  @_s.JsonValue('GM')
  gm,
  @_s.JsonValue('GN')
  gn,
  @_s.JsonValue('GQ')
  gq,
  @_s.JsonValue('GR')
  gr,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('GU')
  gu,
  @_s.JsonValue('GW')
  gw,
  @_s.JsonValue('GY')
  gy,
  @_s.JsonValue('HK')
  hk,
  @_s.JsonValue('HN')
  hn,
  @_s.JsonValue('HR')
  hr,
  @_s.JsonValue('HT')
  ht,
  @_s.JsonValue('HU')
  hu,
  @_s.JsonValue('ID')
  id,
  @_s.JsonValue('IE')
  ie,
  @_s.JsonValue('IL')
  il,
  @_s.JsonValue('IM')
  im,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('IQ')
  iq,
  @_s.JsonValue('IR')
  ir,
  @_s.JsonValue('IS')
  $is,
  @_s.JsonValue('IT')
  it,
  @_s.JsonValue('JM')
  jm,
  @_s.JsonValue('JO')
  jo,
  @_s.JsonValue('JP')
  jp,
  @_s.JsonValue('KE')
  ke,
  @_s.JsonValue('KG')
  kg,
  @_s.JsonValue('KH')
  kh,
  @_s.JsonValue('KI')
  ki,
  @_s.JsonValue('KM')
  km,
  @_s.JsonValue('KN')
  kn,
  @_s.JsonValue('KP')
  kp,
  @_s.JsonValue('KR')
  kr,
  @_s.JsonValue('KW')
  kw,
  @_s.JsonValue('KY')
  ky,
  @_s.JsonValue('KZ')
  kz,
  @_s.JsonValue('LA')
  la,
  @_s.JsonValue('LB')
  lb,
  @_s.JsonValue('LC')
  lc,
  @_s.JsonValue('LI')
  li,
  @_s.JsonValue('LK')
  lk,
  @_s.JsonValue('LR')
  lr,
  @_s.JsonValue('LS')
  ls,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('LU')
  lu,
  @_s.JsonValue('LV')
  lv,
  @_s.JsonValue('LY')
  ly,
  @_s.JsonValue('MA')
  ma,
  @_s.JsonValue('MC')
  mc,
  @_s.JsonValue('MD')
  md,
  @_s.JsonValue('ME')
  me,
  @_s.JsonValue('MF')
  mf,
  @_s.JsonValue('MG')
  mg,
  @_s.JsonValue('MH')
  mh,
  @_s.JsonValue('MK')
  mk,
  @_s.JsonValue('ML')
  ml,
  @_s.JsonValue('MM')
  mm,
  @_s.JsonValue('MN')
  mn,
  @_s.JsonValue('MO')
  mo,
  @_s.JsonValue('MP')
  mp,
  @_s.JsonValue('MR')
  mr,
  @_s.JsonValue('MS')
  ms,
  @_s.JsonValue('MT')
  mt,
  @_s.JsonValue('MU')
  mu,
  @_s.JsonValue('MV')
  mv,
  @_s.JsonValue('MW')
  mw,
  @_s.JsonValue('MX')
  mx,
  @_s.JsonValue('MY')
  my,
  @_s.JsonValue('MZ')
  mz,
  @_s.JsonValue('NA')
  na,
  @_s.JsonValue('NC')
  nc,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('NG')
  ng,
  @_s.JsonValue('NI')
  ni,
  @_s.JsonValue('NL')
  nl,
  @_s.JsonValue('NO')
  no,
  @_s.JsonValue('NP')
  np,
  @_s.JsonValue('NR')
  nr,
  @_s.JsonValue('NU')
  nu,
  @_s.JsonValue('NZ')
  nz,
  @_s.JsonValue('OM')
  om,
  @_s.JsonValue('PA')
  pa,
  @_s.JsonValue('PE')
  pe,
  @_s.JsonValue('PF')
  pf,
  @_s.JsonValue('PG')
  pg,
  @_s.JsonValue('PH')
  ph,
  @_s.JsonValue('PK')
  pk,
  @_s.JsonValue('PL')
  pl,
  @_s.JsonValue('PM')
  pm,
  @_s.JsonValue('PN')
  pn,
  @_s.JsonValue('PR')
  pr,
  @_s.JsonValue('PT')
  pt,
  @_s.JsonValue('PW')
  pw,
  @_s.JsonValue('PY')
  py,
  @_s.JsonValue('QA')
  qa,
  @_s.JsonValue('RO')
  ro,
  @_s.JsonValue('RS')
  rs,
  @_s.JsonValue('RU')
  ru,
  @_s.JsonValue('RW')
  rw,
  @_s.JsonValue('SA')
  sa,
  @_s.JsonValue('SB')
  sb,
  @_s.JsonValue('SC')
  sc,
  @_s.JsonValue('SD')
  sd,
  @_s.JsonValue('SE')
  se,
  @_s.JsonValue('SG')
  sg,
  @_s.JsonValue('SH')
  sh,
  @_s.JsonValue('SI')
  si,
  @_s.JsonValue('SK')
  sk,
  @_s.JsonValue('SL')
  sl,
  @_s.JsonValue('SM')
  sm,
  @_s.JsonValue('SN')
  sn,
  @_s.JsonValue('SO')
  so,
  @_s.JsonValue('SR')
  sr,
  @_s.JsonValue('ST')
  st,
  @_s.JsonValue('SV')
  sv,
  @_s.JsonValue('SY')
  sy,
  @_s.JsonValue('SZ')
  sz,
  @_s.JsonValue('TC')
  tc,
  @_s.JsonValue('TD')
  td,
  @_s.JsonValue('TG')
  tg,
  @_s.JsonValue('TH')
  th,
  @_s.JsonValue('TJ')
  tj,
  @_s.JsonValue('TK')
  tk,
  @_s.JsonValue('TL')
  tl,
  @_s.JsonValue('TM')
  tm,
  @_s.JsonValue('TN')
  tn,
  @_s.JsonValue('TO')
  to,
  @_s.JsonValue('TR')
  tr,
  @_s.JsonValue('TT')
  tt,
  @_s.JsonValue('TV')
  tv,
  @_s.JsonValue('TW')
  tw,
  @_s.JsonValue('TZ')
  tz,
  @_s.JsonValue('UA')
  ua,
  @_s.JsonValue('UG')
  ug,
  @_s.JsonValue('US')
  us,
  @_s.JsonValue('UY')
  uy,
  @_s.JsonValue('UZ')
  uz,
  @_s.JsonValue('VA')
  va,
  @_s.JsonValue('VC')
  vc,
  @_s.JsonValue('VE')
  ve,
  @_s.JsonValue('VG')
  vg,
  @_s.JsonValue('VI')
  vi,
  @_s.JsonValue('VN')
  vn,
  @_s.JsonValue('VU')
  vu,
  @_s.JsonValue('WF')
  wf,
  @_s.JsonValue('WS')
  ws,
  @_s.JsonValue('YE')
  ye,
  @_s.JsonValue('YT')
  yt,
  @_s.JsonValue('ZA')
  za,
  @_s.JsonValue('ZM')
  zm,
  @_s.JsonValue('ZW')
  zw,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTagsForDomainResponse {
  DeleteTagsForDomainResponse();
  factory DeleteTagsForDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTagsForDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableDomainAutoRenewResponse {
  DisableDomainAutoRenewResponse();
  factory DisableDomainAutoRenewResponse.fromJson(Map<String, dynamic> json) =>
      _$DisableDomainAutoRenewResponseFromJson(json);
}

/// The DisableDomainTransferLock response includes the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  DisableDomainTransferLockResponse({
    @_s.required this.operationId,
  });
  factory DisableDomainTransferLockResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisableDomainTransferLockResponseFromJson(json);
}

enum DomainAvailability {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('AVAILABLE_RESERVED')
  availableReserved,
  @_s.JsonValue('AVAILABLE_PREORDER')
  availablePreorder,
  @_s.JsonValue('UNAVAILABLE')
  unavailable,
  @_s.JsonValue('UNAVAILABLE_PREMIUM')
  unavailablePremium,
  @_s.JsonValue('UNAVAILABLE_RESTRICTED')
  unavailableRestricted,
  @_s.JsonValue('RESERVED')
  reserved,
  @_s.JsonValue('DONT_KNOW')
  dontKnow,
}

/// Information about one suggested domain name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'Availability')
  final String availability;

  /// A suggested domain name.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  DomainSuggestion({
    this.availability,
    this.domainName,
  });
  factory DomainSuggestion.fromJson(Map<String, dynamic> json) =>
      _$DomainSuggestionFromJson(json);
}

/// Summary information about one domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainSummary {
  /// The name of the domain that the summary information applies to.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// Indicates whether the domain is automatically renewed upon expiration.
  @_s.JsonKey(name: 'AutoRenew')
  final bool autoRenew;

  /// Expiration date of the domain in Unix time format and Coordinated Universal
  /// Time (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Expiry')
  final DateTime expiry;

  /// Indicates whether a domain is locked from unauthorized transfer to another
  /// party.
  @_s.JsonKey(name: 'TransferLock')
  final bool transferLock;

  DomainSummary({
    @_s.required this.domainName,
    this.autoRenew,
    this.expiry,
    this.transferLock,
  });
  factory DomainSummary.fromJson(Map<String, dynamic> json) =>
      _$DomainSummaryFromJson(json);
}

/// A complex type that contains information about whether the specified domain
/// can be transferred to Route 53.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainTransferability {
  @_s.JsonKey(name: 'Transferable')
  final Transferable transferable;

  DomainTransferability({
    this.transferable,
  });
  factory DomainTransferability.fromJson(Map<String, dynamic> json) =>
      _$DomainTransferabilityFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableDomainAutoRenewResponse {
  EnableDomainAutoRenewResponse();
  factory EnableDomainAutoRenewResponse.fromJson(Map<String, dynamic> json) =>
      _$EnableDomainAutoRenewResponseFromJson(json);
}

/// The EnableDomainTransferLock response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableDomainTransferLockResponse {
  /// Identifier for tracking the progress of the request. To use this ID to query
  /// the operation status, use GetOperationDetail.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  EnableDomainTransferLockResponse({
    @_s.required this.operationId,
  });
  factory EnableDomainTransferLockResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EnableDomainTransferLockResponseFromJson(json);
}

/// ExtraParam includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Name')
  final ExtraParamName name;

  /// The value that corresponds with the name of an extra parameter.
  @_s.JsonKey(name: 'Value')
  final String value;

  ExtraParam({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory ExtraParam.fromJson(Map<String, dynamic> json) =>
      _$ExtraParamFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraParamToJson(this);
}

enum ExtraParamName {
  @_s.JsonValue('DUNS_NUMBER')
  dunsNumber,
  @_s.JsonValue('BRAND_NUMBER')
  brandNumber,
  @_s.JsonValue('BIRTH_DEPARTMENT')
  birthDepartment,
  @_s.JsonValue('BIRTH_DATE_IN_YYYY_MM_DD')
  birthDateInYyyyMmDd,
  @_s.JsonValue('BIRTH_COUNTRY')
  birthCountry,
  @_s.JsonValue('BIRTH_CITY')
  birthCity,
  @_s.JsonValue('DOCUMENT_NUMBER')
  documentNumber,
  @_s.JsonValue('AU_ID_NUMBER')
  auIdNumber,
  @_s.JsonValue('AU_ID_TYPE')
  auIdType,
  @_s.JsonValue('CA_LEGAL_TYPE')
  caLegalType,
  @_s.JsonValue('CA_BUSINESS_ENTITY_TYPE')
  caBusinessEntityType,
  @_s.JsonValue('CA_LEGAL_REPRESENTATIVE')
  caLegalRepresentative,
  @_s.JsonValue('CA_LEGAL_REPRESENTATIVE_CAPACITY')
  caLegalRepresentativeCapacity,
  @_s.JsonValue('ES_IDENTIFICATION')
  esIdentification,
  @_s.JsonValue('ES_IDENTIFICATION_TYPE')
  esIdentificationType,
  @_s.JsonValue('ES_LEGAL_FORM')
  esLegalForm,
  @_s.JsonValue('FI_BUSINESS_NUMBER')
  fiBusinessNumber,
  @_s.JsonValue('FI_ID_NUMBER')
  fiIdNumber,
  @_s.JsonValue('FI_NATIONALITY')
  fiNationality,
  @_s.JsonValue('FI_ORGANIZATION_TYPE')
  fiOrganizationType,
  @_s.JsonValue('IT_NATIONALITY')
  itNationality,
  @_s.JsonValue('IT_PIN')
  itPin,
  @_s.JsonValue('IT_REGISTRANT_ENTITY_TYPE')
  itRegistrantEntityType,
  @_s.JsonValue('RU_PASSPORT_DATA')
  ruPassportData,
  @_s.JsonValue('SE_ID_NUMBER')
  seIdNumber,
  @_s.JsonValue('SG_ID_NUMBER')
  sgIdNumber,
  @_s.JsonValue('VAT_NUMBER')
  vatNumber,
  @_s.JsonValue('UK_CONTACT_TYPE')
  ukContactType,
  @_s.JsonValue('UK_COMPANY_NUMBER')
  ukCompanyNumber,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContactReachabilityStatusResponse {
  /// The domain name for which you requested the reachability status.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// Whether the registrant contact has responded. Values include the following:
  /// <dl> <dt>PENDING</dt> <dd>
  /// We sent the confirmation email and haven't received a response yet.
  /// </dd> <dt>DONE</dt> <dd>
  /// We sent the email and got confirmation from the registrant contact.
  /// </dd> <dt>EXPIRED</dt> <dd>
  /// The time limit expired before the registrant contact responded.
  /// </dd> </dl>
  @_s.JsonKey(name: 'status')
  final ReachabilityStatus status;

  GetContactReachabilityStatusResponse({
    this.domainName,
    this.status,
  });
  factory GetContactReachabilityStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetContactReachabilityStatusResponseFromJson(json);
}

/// The GetDomainDetail response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainDetailResponse {
  /// Provides details about the domain administrative contact.
  @_s.JsonKey(name: 'AdminContact')
  final ContactDetail adminContact;

  /// The name of a domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The name of the domain.
  @_s.JsonKey(name: 'Nameservers')
  final List<Nameserver> nameservers;

  /// Provides details about the domain registrant.
  @_s.JsonKey(name: 'RegistrantContact')
  final ContactDetail registrantContact;

  /// Provides details about the domain technical contact.
  @_s.JsonKey(name: 'TechContact')
  final ContactDetail techContact;

  /// Email address to contact to report incorrect contact information for a
  /// domain, to report that the domain is being used to send spam, to report that
  /// someone is cybersquatting on a domain name, or report some other type of
  /// abuse.
  @_s.JsonKey(name: 'AbuseContactEmail')
  final String abuseContactEmail;

  /// Phone number for reporting abuse.
  @_s.JsonKey(name: 'AbuseContactPhone')
  final String abuseContactPhone;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If the value is
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the admin contact.
  @_s.JsonKey(name: 'AdminPrivacy')
  final bool adminPrivacy;

  /// Specifies whether the domain registration is set to renew automatically.
  @_s.JsonKey(name: 'AutoRenew')
  final bool autoRenew;

  /// The date when the domain was created as found in the response to a WHOIS
  /// query. The date and time is in Unix time format and Coordinated Universal
  /// time (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// Reserved for future use.
  @_s.JsonKey(name: 'DnsSec')
  final String dnsSec;

  /// The date when the registration for the domain is set to expire. The date and
  /// time is in Unix time format and Coordinated Universal time (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationDate')
  final DateTime expirationDate;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If the value is
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the registrant contact (domain owner).
  @_s.JsonKey(name: 'RegistrantPrivacy')
  final bool registrantPrivacy;

  /// Name of the registrar of the domain as identified in the registry. Domains
  /// with a .com, .net, or .org TLD are registered by Amazon Registrar. All other
  /// domains are registered by our registrar associate, Gandi. The value for
  /// domains that are registered by Gandi is <code>"GANDI SAS"</code>.
  @_s.JsonKey(name: 'RegistrarName')
  final String registrarName;

  /// Web address of the registrar.
  @_s.JsonKey(name: 'RegistrarUrl')
  final String registrarUrl;

  /// Reserved for future use.
  @_s.JsonKey(name: 'RegistryDomainId')
  final String registryDomainId;

  /// Reseller of the domain. Domains registered or transferred using Route 53
  /// domains will have <code>"Amazon"</code> as the reseller.
  @_s.JsonKey(name: 'Reseller')
  final String reseller;

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
  @_s.JsonKey(name: 'StatusList')
  final List<String> statusList;

  /// Specifies whether contact information is concealed from WHOIS queries. If
  /// the value is <code>true</code>, WHOIS ("who is") queries return contact
  /// information either for Amazon Registrar (for .com, .net, and .org domains)
  /// or for our registrar associate, Gandi (for all other TLDs). If the value is
  /// <code>false</code>, WHOIS queries return the information that you entered
  /// for the technical contact.
  @_s.JsonKey(name: 'TechPrivacy')
  final bool techPrivacy;

  /// The last updated date of the domain as found in the response to a WHOIS
  /// query. The date and time is in Unix time format and Coordinated Universal
  /// time (UTC).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedDate')
  final DateTime updatedDate;

  /// The fully qualified name of the WHOIS server that can answer the WHOIS query
  /// for the domain.
  @_s.JsonKey(name: 'WhoIsServer')
  final String whoIsServer;

  GetDomainDetailResponse({
    @_s.required this.adminContact,
    @_s.required this.domainName,
    @_s.required this.nameservers,
    @_s.required this.registrantContact,
    @_s.required this.techContact,
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
  factory GetDomainDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDomainDetailResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainSuggestionsResponse {
  /// A list of possible domain names. If you specified <code>true</code> for
  /// <code>OnlyAvailable</code> in the request, the list contains only domains
  /// that are available for registration.
  @_s.JsonKey(name: 'SuggestionsList')
  final List<DomainSuggestion> suggestionsList;

  GetDomainSuggestionsResponse({
    this.suggestionsList,
  });
  factory GetDomainSuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDomainSuggestionsResponseFromJson(json);
}

/// The GetOperationDetail response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOperationDetailResponse {
  /// The name of a domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// Detailed information on the status including possible errors.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The identifier for the operation.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  /// The current status of the requested operation in the system.
  @_s.JsonKey(name: 'Status')
  final OperationStatus status;

  /// The date when the request was submitted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubmittedDate')
  final DateTime submittedDate;

  /// The type of operation that was requested.
  @_s.JsonKey(name: 'Type')
  final OperationType type;

  GetOperationDetailResponse({
    this.domainName,
    this.message,
    this.operationId,
    this.status,
    this.submittedDate,
    this.type,
  });
  factory GetOperationDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOperationDetailResponseFromJson(json);
}

/// The ListDomains response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainsResponse {
  /// A summary of domains.
  @_s.JsonKey(name: 'Domains')
  final List<DomainSummary> domains;

  /// If there are more domains than you specified for <code>MaxItems</code> in
  /// the request, submit another request and include the value of
  /// <code>NextPageMarker</code> in the value of <code>Marker</code>.
  @_s.JsonKey(name: 'NextPageMarker')
  final String nextPageMarker;

  ListDomainsResponse({
    @_s.required this.domains,
    this.nextPageMarker,
  });
  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDomainsResponseFromJson(json);
}

/// The ListOperations response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOperationsResponse {
  /// Lists summaries of the operations.
  @_s.JsonKey(name: 'Operations')
  final List<OperationSummary> operations;

  /// If there are more operations than you specified for <code>MaxItems</code> in
  /// the request, submit another request and include the value of
  /// <code>NextPageMarker</code> in the value of <code>Marker</code>.
  @_s.JsonKey(name: 'NextPageMarker')
  final String nextPageMarker;

  ListOperationsResponse({
    @_s.required this.operations,
    this.nextPageMarker,
  });
  factory ListOperationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOperationsResponseFromJson(json);
}

/// The ListTagsForDomain response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForDomainResponse {
  /// A list of the tags that are associated with the specified domain.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  ListTagsForDomainResponse({
    @_s.required this.tagList,
  });
  factory ListTagsForDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForDomainResponseFromJson(json);
}

/// Nameserver includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Nameserver {
  /// The fully qualified host name of the name server.
  ///
  /// Constraint: Maximum 255 characters
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Glue IP address of a name server entry. Glue IP addresses are required only
  /// when the name of the name server is a subdomain of the domain. For example,
  /// if your domain is example.com and the name server for the domain is
  /// ns.example.com, you need to specify the IP address for ns.example.com.
  ///
  /// Constraints: The list can contain only one IPv4 and one IPv6 address.
  @_s.JsonKey(name: 'GlueIps')
  final List<String> glueIps;

  Nameserver({
    @_s.required this.name,
    this.glueIps,
  });
  factory Nameserver.fromJson(Map<String, dynamic> json) =>
      _$NameserverFromJson(json);

  Map<String, dynamic> toJson() => _$NameserverToJson(this);
}

enum OperationStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('SUCCESSFUL')
  successful,
  @_s.JsonValue('FAILED')
  failed,
}

/// OperationSummary includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OperationSummary {
  /// Identifier returned to track the requested action.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  /// The current status of the requested operation in the system.
  @_s.JsonKey(name: 'Status')
  final OperationStatus status;

  /// The date when the request was submitted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubmittedDate')
  final DateTime submittedDate;

  /// Type of the action requested.
  @_s.JsonKey(name: 'Type')
  final OperationType type;

  OperationSummary({
    @_s.required this.operationId,
    @_s.required this.status,
    @_s.required this.submittedDate,
    @_s.required this.type,
  });
  factory OperationSummary.fromJson(Map<String, dynamic> json) =>
      _$OperationSummaryFromJson(json);
}

enum OperationType {
  @_s.JsonValue('REGISTER_DOMAIN')
  registerDomain,
  @_s.JsonValue('DELETE_DOMAIN')
  deleteDomain,
  @_s.JsonValue('TRANSFER_IN_DOMAIN')
  transferInDomain,
  @_s.JsonValue('UPDATE_DOMAIN_CONTACT')
  updateDomainContact,
  @_s.JsonValue('UPDATE_NAMESERVER')
  updateNameserver,
  @_s.JsonValue('CHANGE_PRIVACY_PROTECTION')
  changePrivacyProtection,
  @_s.JsonValue('DOMAIN_LOCK')
  domainLock,
  @_s.JsonValue('ENABLE_AUTORENEW')
  enableAutorenew,
  @_s.JsonValue('DISABLE_AUTORENEW')
  disableAutorenew,
  @_s.JsonValue('ADD_DNSSEC')
  addDnssec,
  @_s.JsonValue('REMOVE_DNSSEC')
  removeDnssec,
  @_s.JsonValue('EXPIRE_DOMAIN')
  expireDomain,
  @_s.JsonValue('TRANSFER_OUT_DOMAIN')
  transferOutDomain,
  @_s.JsonValue('CHANGE_DOMAIN_OWNER')
  changeDomainOwner,
  @_s.JsonValue('RENEW_DOMAIN')
  renewDomain,
  @_s.JsonValue('PUSH_DOMAIN')
  pushDomain,
  @_s.JsonValue('INTERNAL_TRANSFER_OUT_DOMAIN')
  internalTransferOutDomain,
  @_s.JsonValue('INTERNAL_TRANSFER_IN_DOMAIN')
  internalTransferInDomain,
}

enum ReachabilityStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('DONE')
  done,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// The RegisterDomain response includes the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  RegisterDomainResponse({
    @_s.required this.operationId,
  });
  factory RegisterDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDomainResponseFromJson(json);
}

/// The RejectDomainTransferFromAnotherAwsAccount response includes the
/// following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectDomainTransferFromAnotherAwsAccountResponse {
  /// The identifier that <code>TransferDomainToAnotherAwsAccount</code> returned
  /// to track the progress of the request. Because the transfer request was
  /// rejected, the value is no longer valid, and you can't use
  /// <code>GetOperationDetail</code> to query the operation status.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  RejectDomainTransferFromAnotherAwsAccountResponse({
    this.operationId,
  });
  factory RejectDomainTransferFromAnotherAwsAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RejectDomainTransferFromAnotherAwsAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RenewDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  RenewDomainResponse({
    @_s.required this.operationId,
  });
  factory RenewDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$RenewDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResendContactReachabilityEmailResponse {
  /// The domain name for which you requested a confirmation email.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The email address for the registrant contact at the time that we sent the
  /// verification email.
  @_s.JsonKey(name: 'emailAddress')
  final String emailAddress;

  /// <code>True</code> if the email address for the registrant contact has
  /// already been verified, and <code>false</code> otherwise. If the email
  /// address has already been verified, we don't send another confirmation email.
  @_s.JsonKey(name: 'isAlreadyVerified')
  final bool isAlreadyVerified;

  ResendContactReachabilityEmailResponse({
    this.domainName,
    this.emailAddress,
    this.isAlreadyVerified,
  });
  factory ResendContactReachabilityEmailResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ResendContactReachabilityEmailResponseFromJson(json);
}

/// The RetrieveDomainAuthCode response includes the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RetrieveDomainAuthCodeResponse {
  /// The authorization code for the domain.
  @_s.JsonKey(name: 'AuthCode')
  final String authCode;

  RetrieveDomainAuthCodeResponse({
    @_s.required this.authCode,
  });
  factory RetrieveDomainAuthCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$RetrieveDomainAuthCodeResponseFromJson(json);
}

/// Each tag includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key (name) of a tag.
  ///
  /// Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@"
  ///
  /// Constraints: Each key can be 1-128 characters long.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of a tag.
  ///
  /// Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@"
  ///
  /// Constraints: Each value can be 0-256 characters long.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The TransferDomain response includes the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransferDomainResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  TransferDomainResponse({
    @_s.required this.operationId,
  });
  factory TransferDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferDomainResponseFromJson(json);
}

/// The <code>TransferDomainToAnotherAwsAccount</code> response includes the
/// following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransferDomainToAnotherAwsAccountResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  /// To finish transferring a domain to another AWS account, the account that the
  /// domain is being transferred to must submit an <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html">AcceptDomainTransferFromAnotherAwsAccount</a>
  /// request. The request must include the value of the <code>Password</code>
  /// element that was returned in the
  /// <code>TransferDomainToAnotherAwsAccount</code> response.
  @_s.JsonKey(name: 'Password')
  final String password;

  TransferDomainToAnotherAwsAccountResponse({
    this.operationId,
    this.password,
  });
  factory TransferDomainToAnotherAwsAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TransferDomainToAnotherAwsAccountResponseFromJson(json);
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
  @_s.JsonValue('TRANSFERABLE')
  transferable,
  @_s.JsonValue('UNTRANSFERABLE')
  untransferable,
  @_s.JsonValue('DONT_KNOW')
  dontKnow,
}

/// The UpdateDomainContactPrivacy response includes the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainContactPrivacyResponse {
  /// Identifier for tracking the progress of the request. To use this ID to query
  /// the operation status, use GetOperationDetail.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  UpdateDomainContactPrivacyResponse({
    @_s.required this.operationId,
  });
  factory UpdateDomainContactPrivacyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDomainContactPrivacyResponseFromJson(json);
}

/// The UpdateDomainContact response includes the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainContactResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  UpdateDomainContactResponse({
    @_s.required this.operationId,
  });
  factory UpdateDomainContactResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainContactResponseFromJson(json);
}

/// The UpdateDomainNameservers response includes the following element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainNameserversResponse {
  /// Identifier for tracking the progress of the request. To query the operation
  /// status, use <a
  /// href="https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html">GetOperationDetail</a>.
  @_s.JsonKey(name: 'OperationId')
  final String operationId;

  UpdateDomainNameserversResponse({
    @_s.required this.operationId,
  });
  factory UpdateDomainNameserversResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainNameserversResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTagsForDomainResponse {
  UpdateTagsForDomainResponse();
  factory UpdateTagsForDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTagsForDomainResponseFromJson(json);
}

/// The ViewBilling response includes the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ViewBillingResponse {
  /// A summary of billing records.
  @_s.JsonKey(name: 'BillingRecords')
  final List<BillingRecord> billingRecords;

  /// If there are more billing records than you specified for
  /// <code>MaxItems</code> in the request, submit another request and include the
  /// value of <code>NextPageMarker</code> in the value of <code>Marker</code>.
  @_s.JsonKey(name: 'NextPageMarker')
  final String nextPageMarker;

  ViewBillingResponse({
    this.billingRecords,
    this.nextPageMarker,
  });
  factory ViewBillingResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewBillingResponseFromJson(json);
}

class DomainLimitExceeded extends _s.GenericAwsException {
  DomainLimitExceeded({String type, String message})
      : super(type: type, code: 'DomainLimitExceeded', message: message);
}

class DuplicateRequest extends _s.GenericAwsException {
  DuplicateRequest({String type, String message})
      : super(type: type, code: 'DuplicateRequest', message: message);
}

class InvalidInput extends _s.GenericAwsException {
  InvalidInput({String type, String message})
      : super(type: type, code: 'InvalidInput', message: message);
}

class OperationLimitExceeded extends _s.GenericAwsException {
  OperationLimitExceeded({String type, String message})
      : super(type: type, code: 'OperationLimitExceeded', message: message);
}

class TLDRulesViolation extends _s.GenericAwsException {
  TLDRulesViolation({String type, String message})
      : super(type: type, code: 'TLDRulesViolation', message: message);
}

class UnsupportedTLD extends _s.GenericAwsException {
  UnsupportedTLD({String type, String message})
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
