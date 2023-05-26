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

/// You can use Certificate Manager (ACM) to manage SSL/TLS certificates for
/// your Amazon Web Services-based websites and applications. For more
/// information about using ACM, see the <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/">Certificate Manager
/// User Guide</a>.
class Acm {
  final _s.JsonProtocol _protocol;
  Acm({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'acm',
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

  /// Adds one or more tags to an ACM certificate. Tags are labels that you can
  /// use to identify and organize your Amazon Web Services resources. Each tag
  /// consists of a <code>key</code> and an optional <code>value</code>. You
  /// specify the certificate on input by its Amazon Resource Name (ARN). You
  /// specify the tag by using a key-value pair.
  ///
  /// You can apply a tag to just one certificate if you want to identify a
  /// specific characteristic of that certificate, or you can apply the same tag
  /// to multiple certificates if you want to filter for a common relationship
  /// among those certificates. Similarly, you can apply the same tag to
  /// multiple resources if you want to specify a relationship among those
  /// resources. For example, you can add the same tag to an ACM certificate and
  /// an Elastic Load Balancing load balancer to indicate that they are both
  /// used by the same website. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/tags.html">Tagging
  /// ACM certificates</a>.
  ///
  /// To remove one or more tags, use the <a>RemoveTagsFromCertificate</a>
  /// action. To view all of the tags that have been applied to the certificate,
  /// use the <a>ListTagsForCertificate</a> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidTagException].
  /// May throw [TooManyTagsException].
  /// May throw [TagPolicyException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the ACM certificate to which the tag is to
  /// be applied. This must be of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pair that defines the tag. The tag value is optional.
  Future<void> addTagsToCertificate({
    required String certificateArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.AddTagsToCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
        'Tags': tags,
      },
    );
  }

  /// Deletes a certificate and its associated private key. If this action
  /// succeeds, the certificate no longer appears in the list that can be
  /// displayed by calling the <a>ListCertificates</a> action or be retrieved by
  /// calling the <a>GetCertificate</a> action. The certificate will not be
  /// available for use by Amazon Web Services services integrated with ACM.
  /// <note>
  /// You cannot delete an ACM certificate that is being used by another Amazon
  /// Web Services service. To delete a certificate that is in use, the
  /// certificate association must first be removed.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the ACM certificate to be deleted. This
  /// must be of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  Future<void> deleteCertificate({
    required String certificateArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.DeleteCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
      },
    );
  }

  /// Returns detailed metadata about the specified ACM certificate.
  ///
  /// If you have just created a certificate using the
  /// <code>RequestCertificate</code> action, there is a delay of several
  /// seconds before you can retrieve information about it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateArn] :
  /// The Amazon Resource Name (ARN) of the ACM certificate. The ARN must have
  /// the following form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  Future<DescribeCertificateResponse> describeCertificate({
    required String certificateArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.DescribeCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
      },
    );

    return DescribeCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Exports a private certificate issued by a private certificate authority
  /// (CA) for use anywhere. The exported file contains the certificate, the
  /// certificate chain, and the encrypted private 2048-bit RSA key associated
  /// with the public key that is embedded in the certificate. For security, you
  /// must assign a passphrase for the private key when exporting it.
  ///
  /// For information about exporting and formatting a certificate using the ACM
  /// console or CLI, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-export-private.html">Export
  /// a Private Certificate</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestInProgressException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateArn] :
  /// An Amazon Resource Name (ARN) of the issued certificate. This must be of
  /// the form:
  ///
  /// <code>arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// Parameter [passphrase] :
  /// Passphrase to associate with the encrypted exported private key.
  /// <note>
  /// When creating your passphrase, you can use any ASCII character except #,
  /// $, or %.
  /// </note>
  /// If you want to later decrypt the private key, you must have the
  /// passphrase. You can use the following OpenSSL command to decrypt a private
  /// key. After entering the command, you are prompted for the passphrase.
  ///
  /// <code>openssl rsa -in encrypted_key.pem -out decrypted_key.pem</code>
  Future<ExportCertificateResponse> exportCertificate({
    required String certificateArn,
    required Uint8List passphrase,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.ExportCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
        'Passphrase': base64Encode(passphrase),
      },
    );

    return ExportCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Returns the account configuration options associated with an Amazon Web
  /// Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetAccountConfigurationResponse> getAccountConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.GetAccountConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAccountConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an Amazon-issued certificate and its certificate chain. The
  /// chain consists of the certificate of the issuing CA and the intermediate
  /// certificates of any other subordinate CAs. All of the certificates are
  /// base64 encoded. You can use <a
  /// href="https://wiki.openssl.org/index.php/Command_Line_Utilities">OpenSSL</a>
  /// to decode the certificates and inspect individual fields.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestInProgressException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateArn] :
  /// String that contains a certificate ARN in the following format:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  Future<GetCertificateResponse> getCertificate({
    required String certificateArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.GetCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
      },
    );

    return GetCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Imports a certificate into Certificate Manager (ACM) to use with services
  /// that are integrated with ACM. Note that <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html">integrated
  /// services</a> allow only certificate types and keys they support to be
  /// associated with their resources. Further, their support differs depending
  /// on whether the certificate is imported into IAM or into ACM. For more
  /// information, see the documentation for each service. For more information
  /// about importing certificates into ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// Certificates</a> in the <i>Certificate Manager User Guide</i>.
  /// <note>
  /// ACM does not provide <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> for certificates that you import.
  /// </note>
  /// Note the following guidelines when importing third party certificates:
  ///
  /// <ul>
  /// <li>
  /// You must enter the private key that matches the certificate you are
  /// importing.
  /// </li>
  /// <li>
  /// The private key must be unencrypted. You cannot import a private key that
  /// is protected by a password or a passphrase.
  /// </li>
  /// <li>
  /// The private key must be no larger than 5 KB (5,120 bytes).
  /// </li>
  /// <li>
  /// If the certificate you are importing is not self-signed, you must enter
  /// its certificate chain.
  /// </li>
  /// <li>
  /// If a certificate chain is included, the issuer must be the subject of one
  /// of the certificates in the chain.
  /// </li>
  /// <li>
  /// The certificate, private key, and certificate chain must be PEM-encoded.
  /// </li>
  /// <li>
  /// The current time must be between the <code>Not Before</code> and <code>Not
  /// After</code> certificate fields.
  /// </li>
  /// <li>
  /// The <code>Issuer</code> field must not be empty.
  /// </li>
  /// <li>
  /// The OCSP authority URL, if present, must not exceed 1000 characters.
  /// </li>
  /// <li>
  /// To import a new certificate, omit the <code>CertificateArn</code>
  /// argument. Include this argument only when you want to replace a previously
  /// imported certificate.
  /// </li>
  /// <li>
  /// When you import a certificate by using the CLI, you must specify the
  /// certificate, the certificate chain, and the private key by their file
  /// names preceded by <code>fileb://</code>. For example, you can specify a
  /// certificate saved in the <code>C:\temp</code> folder as
  /// <code>fileb://C:\temp\certificate_to_import.pem</code>. If you are making
  /// an HTTP or HTTPS Query request, include these arguments as BLOBs.
  /// </li>
  /// <li>
  /// When you import a certificate by using an SDK, you must specify the
  /// certificate, the certificate chain, and the private key files in the
  /// manner required by the programming language you're using.
  /// </li>
  /// <li>
  /// The cryptographic algorithm of an imported certificate must match the
  /// algorithm of the signing CA. For example, if the signing CA key type is
  /// RSA, then the certificate key type must also be RSA.
  /// </li>
  /// </ul>
  /// This operation returns the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the imported certificate.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidTagException].
  /// May throw [TooManyTagsException].
  /// May throw [TagPolicyException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificate] :
  /// The certificate to import.
  ///
  /// Parameter [privateKey] :
  /// The private key that matches the public key in the certificate.
  ///
  /// Parameter [certificateArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an imported certificate to replace. To import a
  /// new certificate, omit this field.
  ///
  /// Parameter [certificateChain] :
  /// The PEM encoded certificate chain.
  ///
  /// Parameter [tags] :
  /// One or more resource tags to associate with the imported certificate.
  ///
  /// Note: You cannot apply tags when reimporting a certificate.
  Future<ImportCertificateResponse> importCertificate({
    required Uint8List certificate,
    required Uint8List privateKey,
    String? certificateArn,
    Uint8List? certificateChain,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.ImportCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': base64Encode(certificate),
        'PrivateKey': base64Encode(privateKey),
        if (certificateArn != null) 'CertificateArn': certificateArn,
        if (certificateChain != null)
          'CertificateChain': base64Encode(certificateChain),
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of certificate ARNs and domain names. You can request
  /// that only certificates that match a specific status be listed. You can
  /// also filter by specific attributes of the certificate. Default filtering
  /// returns only <code>RSA_2048</code> certificates. For more information, see
  /// <a>Filters</a>.
  ///
  /// May throw [InvalidArgsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [certificateStatuses] :
  /// Filter the certificate list by status value.
  ///
  /// Parameter [includes] :
  /// Filter the certificate list. For more information, see the <a>Filters</a>
  /// structure.
  ///
  /// Parameter [maxItems] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response. If additional items exist beyond the
  /// number you specify, the <code>NextToken</code> element is sent in the
  /// response. Use this <code>NextToken</code> value in a subsequent request to
  /// retrieve additional items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter only when paginating results and only in a subsequent
  /// request after you receive a response with truncated results. Set it to the
  /// value of <code>NextToken</code> from the response you just received.
  ///
  /// Parameter [sortBy] :
  /// Specifies the field to sort results by. If you specify
  /// <code>SortBy</code>, you must also specify <code>SortOrder</code>.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the order of sorted results. If you specify
  /// <code>SortOrder</code>, you must also specify <code>SortBy</code>.
  Future<ListCertificatesResponse> listCertificates({
    List<CertificateStatus>? certificateStatuses,
    Filters? includes,
    int? maxItems,
    String? nextToken,
    SortBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.ListCertificates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (certificateStatuses != null)
          'CertificateStatuses':
              certificateStatuses.map((e) => e.toValue()).toList(),
        if (includes != null) 'Includes': includes,
        if (maxItems != null) 'MaxItems': maxItems,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.toValue(),
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return ListCertificatesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags that have been applied to the ACM certificate. Use the
  /// certificate's Amazon Resource Name (ARN) to specify the certificate. To
  /// add a tag to an ACM certificate, use the <a>AddTagsToCertificate</a>
  /// action. To delete a tag, use the <a>RemoveTagsFromCertificate</a> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the ACM certificate for which you want to
  /// list the tags. This must have the following form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  Future<ListTagsForCertificateResponse> listTagsForCertificate({
    required String certificateArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.ListTagsForCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
      },
    );

    return ListTagsForCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Adds or modifies account-level configurations in ACM.
  ///
  /// The supported configuration option is <code>DaysBeforeExpiry</code>. This
  /// option specifies the number of days prior to certificate expiration when
  /// ACM starts generating <code>EventBridge</code> events. ACM sends one event
  /// per day per certificate until the certificate expires. By default,
  /// accounts receive events starting 45 days before certificate expiration.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [idempotencyToken] :
  /// Customer-chosen string used to distinguish between calls to
  /// <code>PutAccountConfiguration</code>. Idempotency tokens time out after
  /// one hour. If you call <code>PutAccountConfiguration</code> multiple times
  /// with the same unexpired idempotency token, ACM treats it as the same
  /// request and returns the original result. If you change the idempotency
  /// token for each call, ACM treats each call as a new request.
  ///
  /// Parameter [expiryEvents] :
  /// Specifies expiration events associated with an account.
  Future<void> putAccountConfiguration({
    required String idempotencyToken,
    ExpiryEventsConfiguration? expiryEvents,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.PutAccountConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IdempotencyToken': idempotencyToken,
        if (expiryEvents != null) 'ExpiryEvents': expiryEvents,
      },
    );
  }

  /// Remove one or more tags from an ACM certificate. A tag consists of a
  /// key-value pair. If you do not specify the value portion of the tag when
  /// calling this function, the tag will be removed regardless of value. If you
  /// specify a value, the tag is removed only if it is associated with the
  /// specified value.
  ///
  /// To add tags to a certificate, use the <a>AddTagsToCertificate</a> action.
  /// To view all of the tags that have been applied to a specific ACM
  /// certificate, use the <a>ListTagsForCertificate</a> action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidTagException].
  /// May throw [TagPolicyException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the ACM Certificate with one or more tags
  /// that you want to remove. This must be of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pair that defines the tag to remove.
  Future<void> removeTagsFromCertificate({
    required String certificateArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.RemoveTagsFromCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
        'Tags': tags,
      },
    );
  }

  /// Renews an eligible ACM certificate. At this time, only exported private
  /// certificates can be renewed with this operation. In order to renew your
  /// Amazon Web Services Private CA certificates with ACM, you must first <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaPermissions.html">grant
  /// the ACM service principal permission to do so</a>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/manual-renewal.html">Testing
  /// Managed Renewal</a> in the ACM User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the ACM certificate to be renewed. This
  /// must be of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  Future<void> renewCertificate({
    required String certificateArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.RenewCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
      },
    );
  }

  /// Requests an ACM certificate for use with other Amazon Web Services
  /// services. To request an ACM certificate, you must specify a fully
  /// qualified domain name (FQDN) in the <code>DomainName</code> parameter. You
  /// can also specify additional FQDNs in the
  /// <code>SubjectAlternativeNames</code> parameter.
  ///
  /// If you are requesting a private certificate, domain validation is not
  /// required. If you are requesting a public certificate, each domain name
  /// that you specify must be validated to verify that you own or control the
  /// domain. You can use <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html">DNS
  /// validation</a> or <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html">email
  /// validation</a>. We recommend that you use DNS validation. ACM issues
  /// public certificates after receiving approval from the domain owner.
  /// <note>
  /// ACM behavior differs from the <a
  /// href="https://datatracker.ietf.org/doc/html/rfc6125#appendix-B.2">RFC
  /// 6125</a> specification of the certificate validation process. ACM first
  /// checks for a Subject Alternative Name, and, if it finds one, ignores the
  /// common name (CN).
  /// </note>
  /// After successful completion of the <code>RequestCertificate</code> action,
  /// there is a delay of several seconds before you can retrieve information
  /// about the new certificate.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidDomainValidationOptionsException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidTagException].
  /// May throw [TooManyTagsException].
  /// May throw [TagPolicyException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [domainName] :
  /// Fully qualified domain name (FQDN), such as www.example.com, that you want
  /// to secure with an ACM certificate. Use an asterisk (*) to create a
  /// wildcard certificate that protects several sites in the same domain. For
  /// example, *.example.com protects www.example.com, site.example.com, and
  /// images.example.com.
  ///
  /// In compliance with <a
  /// href="https://datatracker.ietf.org/doc/html/rfc5280">RFC 5280</a>, the
  /// length of the domain name (technically, the Common Name) that you provide
  /// cannot exceed 64 octets (characters), including periods. To add a longer
  /// domain name, specify it in the Subject Alternative Name field, which
  /// supports names up to 253 octets in length.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the private certificate authority (CA)
  /// that will be used to issue the certificate. If you do not provide an ARN
  /// and you are trying to request a private certificate, ACM will attempt to
  /// issue a public certificate. For more information about private CAs, see
  /// the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaWelcome.html">Amazon
  /// Web Services Private Certificate Authority</a> user guide. The ARN must
  /// have the following form:
  ///
  /// <code>arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012</code>
  ///
  /// Parameter [domainValidationOptions] :
  /// The domain name that you want ACM to use to send you emails so that you
  /// can validate domain ownership.
  ///
  /// Parameter [idempotencyToken] :
  /// Customer chosen string that can be used to distinguish between calls to
  /// <code>RequestCertificate</code>. Idempotency tokens time out after one
  /// hour. Therefore, if you call <code>RequestCertificate</code> multiple
  /// times with the same idempotency token within one hour, ACM recognizes that
  /// you are requesting only one certificate and will issue only one. If you
  /// change the idempotency token for each call, ACM recognizes that you are
  /// requesting multiple certificates.
  ///
  /// Parameter [keyAlgorithm] :
  /// Specifies the algorithm of the public and private key pair that your
  /// certificate uses to encrypt data. RSA is the default key algorithm for ACM
  /// certificates. Elliptic Curve Digital Signature Algorithm (ECDSA) keys are
  /// smaller, offering security comparable to RSA keys but with greater
  /// computing efficiency. However, ECDSA is not supported by all network
  /// clients. Some AWS services may require RSA keys, or only support ECDSA
  /// keys of a particular size, while others allow the use of either RSA and
  /// ECDSA keys to ensure that compatibility is not broken. Check the
  /// requirements for the AWS service where you plan to deploy your
  /// certificate.
  ///
  /// Default: RSA_2048
  ///
  /// Parameter [options] :
  /// Currently, you can use this parameter to specify whether to add the
  /// certificate to a certificate transparency log. Certificate transparency
  /// makes it possible to detect SSL/TLS certificates that have been mistakenly
  /// or maliciously issued. Certificates that have not been logged typically
  /// produce an error message in a browser. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency">Opting
  /// Out of Certificate Transparency Logging</a>.
  ///
  /// Parameter [subjectAlternativeNames] :
  /// Additional FQDNs to be included in the Subject Alternative Name extension
  /// of the ACM certificate. For example, add the name www.example.net to a
  /// certificate for which the <code>DomainName</code> field is www.example.com
  /// if users can reach your site by using either name. The maximum number of
  /// domain names that you can add to an ACM certificate is 100. However, the
  /// initial quota is 10 domain names. If you need more than 10 names, you must
  /// request a quota increase. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html">Quotas</a>.
  ///
  /// The maximum length of a SAN DNS name is 253 octets. The name is made up of
  /// multiple labels separated by periods. No label can be longer than 63
  /// octets. Consider the following examples:
  ///
  /// <ul>
  /// <li>
  /// <code>(63 octets).(63 octets).(63 octets).(61 octets)</code> is legal
  /// because the total length is 253 octets (63+1+63+1+63+1+61) and no label
  /// exceeds 63 octets.
  /// </li>
  /// <li>
  /// <code>(64 octets).(63 octets).(63 octets).(61 octets)</code> is not legal
  /// because the total length exceeds 253 octets (64+1+63+1+63+1+61) and the
  /// first label exceeds 63 octets.
  /// </li>
  /// <li>
  /// <code>(63 octets).(63 octets).(63 octets).(62 octets)</code> is not legal
  /// because the total length of the DNS name (63+1+63+1+63+1+62) exceeds 253
  /// octets.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// One or more resource tags to associate with the certificate.
  ///
  /// Parameter [validationMethod] :
  /// The method you want to use if you are requesting a public certificate to
  /// validate that you own or control domain. You can <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html">validate
  /// with DNS</a> or <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html">validate
  /// with email</a>. We recommend that you use DNS validation.
  Future<RequestCertificateResponse> requestCertificate({
    required String domainName,
    String? certificateAuthorityArn,
    List<DomainValidationOption>? domainValidationOptions,
    String? idempotencyToken,
    KeyAlgorithm? keyAlgorithm,
    CertificateOptions? options,
    List<String>? subjectAlternativeNames,
    List<Tag>? tags,
    ValidationMethod? validationMethod,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.RequestCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainName': domainName,
        if (certificateAuthorityArn != null)
          'CertificateAuthorityArn': certificateAuthorityArn,
        if (domainValidationOptions != null)
          'DomainValidationOptions': domainValidationOptions,
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
        if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.toValue(),
        if (options != null) 'Options': options,
        if (subjectAlternativeNames != null)
          'SubjectAlternativeNames': subjectAlternativeNames,
        if (tags != null) 'Tags': tags,
        if (validationMethod != null)
          'ValidationMethod': validationMethod.toValue(),
      },
    );

    return RequestCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Resends the email that requests domain ownership validation. The domain
  /// owner or an authorized representative must approve the ACM certificate
  /// before it can be issued. The certificate can be approved by clicking a
  /// link in the mail to navigate to the Amazon certificate approval website
  /// and then clicking <b>I Approve</b>. However, the validation email can be
  /// blocked by spam filters. Therefore, if you do not receive the original
  /// mail, you can request that the mail be resent within 72 hours of
  /// requesting the ACM certificate. If more than 72 hours have elapsed since
  /// your original request or since your last attempt to resend validation
  /// mail, you must request a new certificate. For more information about
  /// setting up your contact email addresses, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/setup-email.html">Configure
  /// Email for your Domain</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidDomainValidationOptionsException].
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the requested certificate. The certificate
  /// ARN is generated and returned by the <a>RequestCertificate</a> action as
  /// soon as the request is made. By default, using this parameter causes email
  /// to be sent to all top-level domains you specified in the certificate
  /// request. The ARN must be of the form:
  ///
  /// <code>arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// Parameter [domain] :
  /// The fully qualified domain name (FQDN) of the certificate that needs to be
  /// validated.
  ///
  /// Parameter [validationDomain] :
  /// The base validation domain that will act as the suffix of the email
  /// addresses that are used to send the emails. This must be the same as the
  /// <code>Domain</code> value or a superdomain of the <code>Domain</code>
  /// value. For example, if you requested a certificate for
  /// <code>site.subdomain.example.com</code> and specify a
  /// <b>ValidationDomain</b> of <code>subdomain.example.com</code>, ACM sends
  /// email to the domain registrant, technical contact, and administrative
  /// contact in WHOIS and the following five addresses:
  ///
  /// <ul>
  /// <li>
  /// admin@subdomain.example.com
  /// </li>
  /// <li>
  /// administrator@subdomain.example.com
  /// </li>
  /// <li>
  /// hostmaster@subdomain.example.com
  /// </li>
  /// <li>
  /// postmaster@subdomain.example.com
  /// </li>
  /// <li>
  /// webmaster@subdomain.example.com
  /// </li>
  /// </ul>
  Future<void> resendValidationEmail({
    required String certificateArn,
    required String domain,
    required String validationDomain,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.ResendValidationEmail'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
        'Domain': domain,
        'ValidationDomain': validationDomain,
      },
    );
  }

  /// Updates a certificate. Currently, you can use this function to specify
  /// whether to opt in to or out of recording your certificate in a certificate
  /// transparency log. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency">
  /// Opting Out of Certificate Transparency Logging</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateArn] :
  /// ARN of the requested certificate to update. This must be of the form:
  ///
  /// <code>arn:aws:acm:us-east-1:<i>account</i>:certificate/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [options] :
  /// Use to update the options for your certificate. Currently, you can specify
  /// whether to add your certificate to a transparency log. Certificate
  /// transparency makes it possible to detect SSL/TLS certificates that have
  /// been mistakenly or maliciously issued. Certificates that have not been
  /// logged typically produce an error message in a browser.
  Future<void> updateCertificateOptions({
    required String certificateArn,
    required CertificateOptions options,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.UpdateCertificateOptions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
        'Options': options,
      },
    );
  }
}

/// Contains metadata about an ACM certificate. This structure is returned in
/// the response to a <a>DescribeCertificate</a> request.
class CertificateDetail {
  /// The Amazon Resource Name (ARN) of the certificate. For more information
  /// about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? certificateArn;

  /// The Amazon Resource Name (ARN) of the private certificate authority (CA)
  /// that issued the certificate. This has the following format:
  ///
  /// <code>arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012</code>
  final String? certificateAuthorityArn;

  /// The time at which the certificate was requested.
  final DateTime? createdAt;

  /// The fully qualified domain name for the certificate, such as www.example.com
  /// or example.com.
  final String? domainName;

  /// Contains information about the initial validation of each domain name that
  /// occurs as a result of the <a>RequestCertificate</a> request. This field
  /// exists only when the certificate type is <code>AMAZON_ISSUED</code>.
  final List<DomainValidation>? domainValidationOptions;

  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be used
  /// and consists of a name and an object identifier (OID).
  final List<ExtendedKeyUsage>? extendedKeyUsages;

  /// The reason the certificate request failed. This value exists only when the
  /// certificate status is <code>FAILED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting.html#troubleshooting-failed">Certificate
  /// Request Failed</a> in the <i>Certificate Manager User Guide</i>.
  final FailureReason? failureReason;

  /// The date and time when the certificate was imported. This value exists only
  /// when the certificate type is <code>IMPORTED</code>.
  final DateTime? importedAt;

  /// A list of ARNs for the Amazon Web Services resources that are using the
  /// certificate. A certificate can be used by multiple Amazon Web Services
  /// resources.
  final List<String>? inUseBy;

  /// The time at which the certificate was issued. This value exists only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  final DateTime? issuedAt;

  /// The name of the certificate authority that issued and signed the
  /// certificate.
  final String? issuer;

  /// The algorithm that was used to generate the public-private key pair.
  final KeyAlgorithm? keyAlgorithm;

  /// A list of Key Usage X.509 v3 extension objects. Each object is a string
  /// value that identifies the purpose of the public key contained in the
  /// certificate. Possible extension values include DIGITAL_SIGNATURE,
  /// KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
  final List<KeyUsage>? keyUsages;

  /// The time after which the certificate is not valid.
  final DateTime? notAfter;

  /// The time before which the certificate is not valid.
  final DateTime? notBefore;

  /// Value that specifies whether to add the certificate to a transparency log.
  /// Certificate transparency makes it possible to detect SSL certificates that
  /// have been mistakenly or maliciously issued. A browser might respond to
  /// certificate that has not been logged by showing an error message. The logs
  /// are cryptographically secure.
  final CertificateOptions? options;

  /// Specifies whether the certificate is eligible for renewal. At this time,
  /// only exported private certificates can be renewed with the
  /// <a>RenewCertificate</a> command.
  final RenewalEligibility? renewalEligibility;

  /// Contains information about the status of ACM's <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> for the certificate. This field exists only when the certificate
  /// type is <code>AMAZON_ISSUED</code>.
  final RenewalSummary? renewalSummary;

  /// The reason the certificate was revoked. This value exists only when the
  /// certificate status is <code>REVOKED</code>.
  final RevocationReason? revocationReason;

  /// The time at which the certificate was revoked. This value exists only when
  /// the certificate status is <code>REVOKED</code>.
  final DateTime? revokedAt;

  /// The serial number of the certificate.
  final String? serial;

  /// The algorithm that was used to sign the certificate.
  final String? signatureAlgorithm;

  /// The status of the certificate.
  ///
  /// A certificate enters status PENDING_VALIDATION upon being requested, unless
  /// it fails for any of the reasons given in the troubleshooting topic <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting-failed.html">Certificate
  /// request fails</a>. ACM makes repeated attempts to validate a certificate for
  /// 72 hours and then times out. If a certificate shows status FAILED or
  /// VALIDATION_TIMED_OUT, delete the request, correct the issue with <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html">DNS
  /// validation</a> or <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html">Email
  /// validation</a>, and try again. If validation succeeds, the certificate
  /// enters status ISSUED.
  final CertificateStatus? status;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  final String? subject;

  /// One or more domain names (subject alternative names) included in the
  /// certificate. This list contains the domain names that are bound to the
  /// public key that is contained in the certificate. The subject alternative
  /// names include the canonical domain name (CN) of the certificate and
  /// additional domain names that can be used to connect to the website.
  final List<String>? subjectAlternativeNames;

  /// The source of the certificate. For certificates provided by ACM, this value
  /// is <code>AMAZON_ISSUED</code>. For certificates that you imported with
  /// <a>ImportCertificate</a>, this value is <code>IMPORTED</code>. ACM does not
  /// provide <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> for imported certificates. For more information about the
  /// differences between certificates that you import and those that ACM
  /// provides, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// Certificates</a> in the <i>Certificate Manager User Guide</i>.
  final CertificateType? type;

  CertificateDetail({
    this.certificateArn,
    this.certificateAuthorityArn,
    this.createdAt,
    this.domainName,
    this.domainValidationOptions,
    this.extendedKeyUsages,
    this.failureReason,
    this.importedAt,
    this.inUseBy,
    this.issuedAt,
    this.issuer,
    this.keyAlgorithm,
    this.keyUsages,
    this.notAfter,
    this.notBefore,
    this.options,
    this.renewalEligibility,
    this.renewalSummary,
    this.revocationReason,
    this.revokedAt,
    this.serial,
    this.signatureAlgorithm,
    this.status,
    this.subject,
    this.subjectAlternativeNames,
    this.type,
  });

  factory CertificateDetail.fromJson(Map<String, dynamic> json) {
    return CertificateDetail(
      certificateArn: json['CertificateArn'] as String?,
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      domainName: json['DomainName'] as String?,
      domainValidationOptions: (json['DomainValidationOptions'] as List?)
          ?.whereNotNull()
          .map((e) => DomainValidation.fromJson(e as Map<String, dynamic>))
          .toList(),
      extendedKeyUsages: (json['ExtendedKeyUsages'] as List?)
          ?.whereNotNull()
          .map((e) => ExtendedKeyUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureReason: (json['FailureReason'] as String?)?.toFailureReason(),
      importedAt: timeStampFromJson(json['ImportedAt']),
      inUseBy: (json['InUseBy'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      issuedAt: timeStampFromJson(json['IssuedAt']),
      issuer: json['Issuer'] as String?,
      keyAlgorithm: (json['KeyAlgorithm'] as String?)?.toKeyAlgorithm(),
      keyUsages: (json['KeyUsages'] as List?)
          ?.whereNotNull()
          .map((e) => KeyUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
      notAfter: timeStampFromJson(json['NotAfter']),
      notBefore: timeStampFromJson(json['NotBefore']),
      options: json['Options'] != null
          ? CertificateOptions.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      renewalEligibility:
          (json['RenewalEligibility'] as String?)?.toRenewalEligibility(),
      renewalSummary: json['RenewalSummary'] != null
          ? RenewalSummary.fromJson(
              json['RenewalSummary'] as Map<String, dynamic>)
          : null,
      revocationReason:
          (json['RevocationReason'] as String?)?.toRevocationReason(),
      revokedAt: timeStampFromJson(json['RevokedAt']),
      serial: json['Serial'] as String?,
      signatureAlgorithm: json['SignatureAlgorithm'] as String?,
      status: (json['Status'] as String?)?.toCertificateStatus(),
      subject: json['Subject'] as String?,
      subjectAlternativeNames: (json['SubjectAlternativeNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['Type'] as String?)?.toCertificateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final domainValidationOptions = this.domainValidationOptions;
    final extendedKeyUsages = this.extendedKeyUsages;
    final failureReason = this.failureReason;
    final importedAt = this.importedAt;
    final inUseBy = this.inUseBy;
    final issuedAt = this.issuedAt;
    final issuer = this.issuer;
    final keyAlgorithm = this.keyAlgorithm;
    final keyUsages = this.keyUsages;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final options = this.options;
    final renewalEligibility = this.renewalEligibility;
    final renewalSummary = this.renewalSummary;
    final revocationReason = this.revocationReason;
    final revokedAt = this.revokedAt;
    final serial = this.serial;
    final signatureAlgorithm = this.signatureAlgorithm;
    final status = this.status;
    final subject = this.subject;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    final type = this.type;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (domainName != null) 'DomainName': domainName,
      if (domainValidationOptions != null)
        'DomainValidationOptions': domainValidationOptions,
      if (extendedKeyUsages != null) 'ExtendedKeyUsages': extendedKeyUsages,
      if (failureReason != null) 'FailureReason': failureReason.toValue(),
      if (importedAt != null) 'ImportedAt': unixTimestampToJson(importedAt),
      if (inUseBy != null) 'InUseBy': inUseBy,
      if (issuedAt != null) 'IssuedAt': unixTimestampToJson(issuedAt),
      if (issuer != null) 'Issuer': issuer,
      if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.toValue(),
      if (keyUsages != null) 'KeyUsages': keyUsages,
      if (notAfter != null) 'NotAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'NotBefore': unixTimestampToJson(notBefore),
      if (options != null) 'Options': options,
      if (renewalEligibility != null)
        'RenewalEligibility': renewalEligibility.toValue(),
      if (renewalSummary != null) 'RenewalSummary': renewalSummary,
      if (revocationReason != null)
        'RevocationReason': revocationReason.toValue(),
      if (revokedAt != null) 'RevokedAt': unixTimestampToJson(revokedAt),
      if (serial != null) 'Serial': serial,
      if (signatureAlgorithm != null) 'SignatureAlgorithm': signatureAlgorithm,
      if (status != null) 'Status': status.toValue(),
      if (subject != null) 'Subject': subject,
      if (subjectAlternativeNames != null)
        'SubjectAlternativeNames': subjectAlternativeNames,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Structure that contains options for your certificate. Currently, you can use
/// this only to specify whether to opt in to or out of certificate transparency
/// logging. Some browsers require that public certificates issued for your
/// domain be recorded in a log. Certificates that are not logged typically
/// generate a browser error. Transparency makes it possible for you to detect
/// SSL/TLS certificates that have been mistakenly or maliciously issued for
/// your domain. For general information, see <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency">Certificate
/// Transparency Logging</a>.
class CertificateOptions {
  /// You can opt out of certificate transparency logging by specifying the
  /// <code>DISABLED</code> option. Opt in by specifying <code>ENABLED</code>.
  final CertificateTransparencyLoggingPreference?
      certificateTransparencyLoggingPreference;

  CertificateOptions({
    this.certificateTransparencyLoggingPreference,
  });

  factory CertificateOptions.fromJson(Map<String, dynamic> json) {
    return CertificateOptions(
      certificateTransparencyLoggingPreference:
          (json['CertificateTransparencyLoggingPreference'] as String?)
              ?.toCertificateTransparencyLoggingPreference(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateTransparencyLoggingPreference =
        this.certificateTransparencyLoggingPreference;
    return {
      if (certificateTransparencyLoggingPreference != null)
        'CertificateTransparencyLoggingPreference':
            certificateTransparencyLoggingPreference.toValue(),
    };
  }
}

enum CertificateStatus {
  pendingValidation,
  issued,
  inactive,
  expired,
  validationTimedOut,
  revoked,
  failed,
}

extension CertificateStatusValueExtension on CertificateStatus {
  String toValue() {
    switch (this) {
      case CertificateStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case CertificateStatus.issued:
        return 'ISSUED';
      case CertificateStatus.inactive:
        return 'INACTIVE';
      case CertificateStatus.expired:
        return 'EXPIRED';
      case CertificateStatus.validationTimedOut:
        return 'VALIDATION_TIMED_OUT';
      case CertificateStatus.revoked:
        return 'REVOKED';
      case CertificateStatus.failed:
        return 'FAILED';
    }
  }
}

extension CertificateStatusFromString on String {
  CertificateStatus toCertificateStatus() {
    switch (this) {
      case 'PENDING_VALIDATION':
        return CertificateStatus.pendingValidation;
      case 'ISSUED':
        return CertificateStatus.issued;
      case 'INACTIVE':
        return CertificateStatus.inactive;
      case 'EXPIRED':
        return CertificateStatus.expired;
      case 'VALIDATION_TIMED_OUT':
        return CertificateStatus.validationTimedOut;
      case 'REVOKED':
        return CertificateStatus.revoked;
      case 'FAILED':
        return CertificateStatus.failed;
    }
    throw Exception('$this is not known in enum CertificateStatus');
  }
}

/// This structure is returned in the response object of <a>ListCertificates</a>
/// action.
class CertificateSummary {
  /// Amazon Resource Name (ARN) of the certificate. This is of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a>.
  final String? certificateArn;

  /// The time at which the certificate was requested.
  final DateTime? createdAt;

  /// Fully qualified domain name (FQDN), such as www.example.com or example.com,
  /// for the certificate.
  final String? domainName;

  /// Indicates whether the certificate has been exported. This value exists only
  /// when the certificate type is <code>PRIVATE</code>.
  final bool? exported;

  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be used
  /// and consists of a name and an object identifier (OID).
  final List<ExtendedKeyUsageName>? extendedKeyUsages;

  /// When called by <a
  /// href="https://docs.aws.amazon.com/acm/latestAPIReference/API_ListCertificates.html">ListCertificates</a>,
  /// indicates whether the full list of subject alternative names has been
  /// included in the response. If false, the response includes all of the subject
  /// alternative names included in the certificate. If true, the response only
  /// includes the first 100 subject alternative names included in the
  /// certificate. To display the full list of subject alternative names, use <a
  /// href="https://docs.aws.amazon.com/acm/latestAPIReference/API_DescribeCertificate.html">DescribeCertificate</a>.
  final bool? hasAdditionalSubjectAlternativeNames;

  /// The date and time when the certificate was imported. This value exists only
  /// when the certificate type is <code>IMPORTED</code>.
  final DateTime? importedAt;

  /// Indicates whether the certificate is currently in use by any Amazon Web
  /// Services resources.
  final bool? inUse;

  /// The time at which the certificate was issued. This value exists only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  final DateTime? issuedAt;

  /// The algorithm that was used to generate the public-private key pair.
  final KeyAlgorithm? keyAlgorithm;

  /// A list of Key Usage X.509 v3 extension objects. Each object is a string
  /// value that identifies the purpose of the public key contained in the
  /// certificate. Possible extension values include DIGITAL_SIGNATURE,
  /// KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
  final List<KeyUsageName>? keyUsages;

  /// The time after which the certificate is not valid.
  final DateTime? notAfter;

  /// The time before which the certificate is not valid.
  final DateTime? notBefore;

  /// Specifies whether the certificate is eligible for renewal. At this time,
  /// only exported private certificates can be renewed with the
  /// <a>RenewCertificate</a> command.
  final RenewalEligibility? renewalEligibility;

  /// The time at which the certificate was revoked. This value exists only when
  /// the certificate status is <code>REVOKED</code>.
  final DateTime? revokedAt;

  /// The status of the certificate.
  ///
  /// A certificate enters status PENDING_VALIDATION upon being requested, unless
  /// it fails for any of the reasons given in the troubleshooting topic <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting-failed.html">Certificate
  /// request fails</a>. ACM makes repeated attempts to validate a certificate for
  /// 72 hours and then times out. If a certificate shows status FAILED or
  /// VALIDATION_TIMED_OUT, delete the request, correct the issue with <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/dns-validation.html">DNS
  /// validation</a> or <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/email-validation.html">Email
  /// validation</a>, and try again. If validation succeeds, the certificate
  /// enters status ISSUED.
  final CertificateStatus? status;

  /// One or more domain names (subject alternative names) included in the
  /// certificate. This list contains the domain names that are bound to the
  /// public key that is contained in the certificate. The subject alternative
  /// names include the canonical domain name (CN) of the certificate and
  /// additional domain names that can be used to connect to the website.
  ///
  /// When called by <a
  /// href="https://docs.aws.amazon.com/acm/latestAPIReference/API_ListCertificates.html">ListCertificates</a>,
  /// this parameter will only return the first 100 subject alternative names
  /// included in the certificate. To display the full list of subject alternative
  /// names, use <a
  /// href="https://docs.aws.amazon.com/acm/latestAPIReference/API_DescribeCertificate.html">DescribeCertificate</a>.
  final List<String>? subjectAlternativeNameSummaries;

  /// The source of the certificate. For certificates provided by ACM, this value
  /// is <code>AMAZON_ISSUED</code>. For certificates that you imported with
  /// <a>ImportCertificate</a>, this value is <code>IMPORTED</code>. ACM does not
  /// provide <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> for imported certificates. For more information about the
  /// differences between certificates that you import and those that ACM
  /// provides, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// Certificates</a> in the <i>Certificate Manager User Guide</i>.
  final CertificateType? type;

  CertificateSummary({
    this.certificateArn,
    this.createdAt,
    this.domainName,
    this.exported,
    this.extendedKeyUsages,
    this.hasAdditionalSubjectAlternativeNames,
    this.importedAt,
    this.inUse,
    this.issuedAt,
    this.keyAlgorithm,
    this.keyUsages,
    this.notAfter,
    this.notBefore,
    this.renewalEligibility,
    this.revokedAt,
    this.status,
    this.subjectAlternativeNameSummaries,
    this.type,
  });

  factory CertificateSummary.fromJson(Map<String, dynamic> json) {
    return CertificateSummary(
      certificateArn: json['CertificateArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      domainName: json['DomainName'] as String?,
      exported: json['Exported'] as bool?,
      extendedKeyUsages: (json['ExtendedKeyUsages'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toExtendedKeyUsageName())
          .toList(),
      hasAdditionalSubjectAlternativeNames:
          json['HasAdditionalSubjectAlternativeNames'] as bool?,
      importedAt: timeStampFromJson(json['ImportedAt']),
      inUse: json['InUse'] as bool?,
      issuedAt: timeStampFromJson(json['IssuedAt']),
      keyAlgorithm: (json['KeyAlgorithm'] as String?)?.toKeyAlgorithm(),
      keyUsages: (json['KeyUsages'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toKeyUsageName())
          .toList(),
      notAfter: timeStampFromJson(json['NotAfter']),
      notBefore: timeStampFromJson(json['NotBefore']),
      renewalEligibility:
          (json['RenewalEligibility'] as String?)?.toRenewalEligibility(),
      revokedAt: timeStampFromJson(json['RevokedAt']),
      status: (json['Status'] as String?)?.toCertificateStatus(),
      subjectAlternativeNameSummaries:
          (json['SubjectAlternativeNameSummaries'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      type: (json['Type'] as String?)?.toCertificateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final exported = this.exported;
    final extendedKeyUsages = this.extendedKeyUsages;
    final hasAdditionalSubjectAlternativeNames =
        this.hasAdditionalSubjectAlternativeNames;
    final importedAt = this.importedAt;
    final inUse = this.inUse;
    final issuedAt = this.issuedAt;
    final keyAlgorithm = this.keyAlgorithm;
    final keyUsages = this.keyUsages;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final renewalEligibility = this.renewalEligibility;
    final revokedAt = this.revokedAt;
    final status = this.status;
    final subjectAlternativeNameSummaries =
        this.subjectAlternativeNameSummaries;
    final type = this.type;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (domainName != null) 'DomainName': domainName,
      if (exported != null) 'Exported': exported,
      if (extendedKeyUsages != null)
        'ExtendedKeyUsages': extendedKeyUsages.map((e) => e.toValue()).toList(),
      if (hasAdditionalSubjectAlternativeNames != null)
        'HasAdditionalSubjectAlternativeNames':
            hasAdditionalSubjectAlternativeNames,
      if (importedAt != null) 'ImportedAt': unixTimestampToJson(importedAt),
      if (inUse != null) 'InUse': inUse,
      if (issuedAt != null) 'IssuedAt': unixTimestampToJson(issuedAt),
      if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.toValue(),
      if (keyUsages != null)
        'KeyUsages': keyUsages.map((e) => e.toValue()).toList(),
      if (notAfter != null) 'NotAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'NotBefore': unixTimestampToJson(notBefore),
      if (renewalEligibility != null)
        'RenewalEligibility': renewalEligibility.toValue(),
      if (revokedAt != null) 'RevokedAt': unixTimestampToJson(revokedAt),
      if (status != null) 'Status': status.toValue(),
      if (subjectAlternativeNameSummaries != null)
        'SubjectAlternativeNameSummaries': subjectAlternativeNameSummaries,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum CertificateTransparencyLoggingPreference {
  enabled,
  disabled,
}

extension CertificateTransparencyLoggingPreferenceValueExtension
    on CertificateTransparencyLoggingPreference {
  String toValue() {
    switch (this) {
      case CertificateTransparencyLoggingPreference.enabled:
        return 'ENABLED';
      case CertificateTransparencyLoggingPreference.disabled:
        return 'DISABLED';
    }
  }
}

extension CertificateTransparencyLoggingPreferenceFromString on String {
  CertificateTransparencyLoggingPreference
      toCertificateTransparencyLoggingPreference() {
    switch (this) {
      case 'ENABLED':
        return CertificateTransparencyLoggingPreference.enabled;
      case 'DISABLED':
        return CertificateTransparencyLoggingPreference.disabled;
    }
    throw Exception(
        '$this is not known in enum CertificateTransparencyLoggingPreference');
  }
}

enum CertificateType {
  imported,
  amazonIssued,
  private,
}

extension CertificateTypeValueExtension on CertificateType {
  String toValue() {
    switch (this) {
      case CertificateType.imported:
        return 'IMPORTED';
      case CertificateType.amazonIssued:
        return 'AMAZON_ISSUED';
      case CertificateType.private:
        return 'PRIVATE';
    }
  }
}

extension CertificateTypeFromString on String {
  CertificateType toCertificateType() {
    switch (this) {
      case 'IMPORTED':
        return CertificateType.imported;
      case 'AMAZON_ISSUED':
        return CertificateType.amazonIssued;
      case 'PRIVATE':
        return CertificateType.private;
    }
    throw Exception('$this is not known in enum CertificateType');
  }
}

class DescribeCertificateResponse {
  /// Metadata about an ACM certificate.
  final CertificateDetail? certificate;

  DescribeCertificateResponse({
    this.certificate,
  });

  factory DescribeCertificateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCertificateResponse(
      certificate: json['Certificate'] != null
          ? CertificateDetail.fromJson(
              json['Certificate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    return {
      if (certificate != null) 'Certificate': certificate,
    };
  }
}

enum DomainStatus {
  pendingValidation,
  success,
  failed,
}

extension DomainStatusValueExtension on DomainStatus {
  String toValue() {
    switch (this) {
      case DomainStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case DomainStatus.success:
        return 'SUCCESS';
      case DomainStatus.failed:
        return 'FAILED';
    }
  }
}

extension DomainStatusFromString on String {
  DomainStatus toDomainStatus() {
    switch (this) {
      case 'PENDING_VALIDATION':
        return DomainStatus.pendingValidation;
      case 'SUCCESS':
        return DomainStatus.success;
      case 'FAILED':
        return DomainStatus.failed;
    }
    throw Exception('$this is not known in enum DomainStatus');
  }
}

/// Contains information about the validation of each domain name in the
/// certificate.
class DomainValidation {
  /// A fully qualified domain name (FQDN) in the certificate. For example,
  /// <code>www.example.com</code> or <code>example.com</code>.
  final String domainName;

  /// Contains the CNAME record that you add to your DNS database for domain
  /// validation. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html">Use
  /// DNS to Validate Domain Ownership</a>.
  ///
  /// Note: The CNAME information that you need does not include the name of your
  /// domain. If you include&#x2028; your domain name in the DNS database CNAME
  /// record, validation fails.&#x2028; For example, if the name is
  /// "_a79865eb4cd1a6ab990a45779b4e0b96.yourdomain.com", only
  /// "_a79865eb4cd1a6ab990a45779b4e0b96" must be used.
  final ResourceRecord? resourceRecord;

  /// The domain name that ACM used to send domain validation emails.
  final String? validationDomain;

  /// A list of email addresses that ACM used to send domain validation emails.
  final List<String>? validationEmails;

  /// Specifies the domain validation method.
  final ValidationMethod? validationMethod;

  /// The validation status of the domain name. This can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING_VALIDATION</code>
  /// </li>
  /// <li>
  /// <code/>SUCCESS
  /// </li>
  /// <li>
  /// <code/>FAILED
  /// </li>
  /// </ul>
  final DomainStatus? validationStatus;

  DomainValidation({
    required this.domainName,
    this.resourceRecord,
    this.validationDomain,
    this.validationEmails,
    this.validationMethod,
    this.validationStatus,
  });

  factory DomainValidation.fromJson(Map<String, dynamic> json) {
    return DomainValidation(
      domainName: json['DomainName'] as String,
      resourceRecord: json['ResourceRecord'] != null
          ? ResourceRecord.fromJson(
              json['ResourceRecord'] as Map<String, dynamic>)
          : null,
      validationDomain: json['ValidationDomain'] as String?,
      validationEmails: (json['ValidationEmails'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      validationMethod:
          (json['ValidationMethod'] as String?)?.toValidationMethod(),
      validationStatus: (json['ValidationStatus'] as String?)?.toDomainStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final resourceRecord = this.resourceRecord;
    final validationDomain = this.validationDomain;
    final validationEmails = this.validationEmails;
    final validationMethod = this.validationMethod;
    final validationStatus = this.validationStatus;
    return {
      'DomainName': domainName,
      if (resourceRecord != null) 'ResourceRecord': resourceRecord,
      if (validationDomain != null) 'ValidationDomain': validationDomain,
      if (validationEmails != null) 'ValidationEmails': validationEmails,
      if (validationMethod != null)
        'ValidationMethod': validationMethod.toValue(),
      if (validationStatus != null)
        'ValidationStatus': validationStatus.toValue(),
    };
  }
}

/// Contains information about the domain names that you want ACM to use to send
/// you emails that enable you to validate domain ownership.
class DomainValidationOption {
  /// A fully qualified domain name (FQDN) in the certificate request.
  final String domainName;

  /// The domain name that you want ACM to use to send you validation emails. This
  /// domain name is the suffix of the email addresses that you want ACM to use.
  /// This must be the same as the <code>DomainName</code> value or a superdomain
  /// of the <code>DomainName</code> value. For example, if you request a
  /// certificate for <code>testing.example.com</code>, you can specify
  /// <code>example.com</code> for this value. In that case, ACM sends domain
  /// validation emails to the following five addresses:
  ///
  /// <ul>
  /// <li>
  /// admin@example.com
  /// </li>
  /// <li>
  /// administrator@example.com
  /// </li>
  /// <li>
  /// hostmaster@example.com
  /// </li>
  /// <li>
  /// postmaster@example.com
  /// </li>
  /// <li>
  /// webmaster@example.com
  /// </li>
  /// </ul>
  final String validationDomain;

  DomainValidationOption({
    required this.domainName,
    required this.validationDomain,
  });

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final validationDomain = this.validationDomain;
    return {
      'DomainName': domainName,
      'ValidationDomain': validationDomain,
    };
  }
}

/// Object containing expiration events options associated with an Amazon Web
/// Services account.
class ExpiryEventsConfiguration {
  /// Specifies the number of days prior to certificate expiration when ACM starts
  /// generating <code>EventBridge</code> events. ACM sends one event per day per
  /// certificate until the certificate expires. By default, accounts receive
  /// events starting 45 days before certificate expiration.
  final int? daysBeforeExpiry;

  ExpiryEventsConfiguration({
    this.daysBeforeExpiry,
  });

  factory ExpiryEventsConfiguration.fromJson(Map<String, dynamic> json) {
    return ExpiryEventsConfiguration(
      daysBeforeExpiry: json['DaysBeforeExpiry'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final daysBeforeExpiry = this.daysBeforeExpiry;
    return {
      if (daysBeforeExpiry != null) 'DaysBeforeExpiry': daysBeforeExpiry,
    };
  }
}

class ExportCertificateResponse {
  /// The base64 PEM-encoded certificate.
  final String? certificate;

  /// The base64 PEM-encoded certificate chain. This does not include the
  /// certificate that you are exporting.
  final String? certificateChain;

  /// The encrypted private key associated with the public key in the certificate.
  /// The key is output in PKCS #8 format and is base64 PEM-encoded.
  final String? privateKey;

  ExportCertificateResponse({
    this.certificate,
    this.certificateChain,
    this.privateKey,
  });

  factory ExportCertificateResponse.fromJson(Map<String, dynamic> json) {
    return ExportCertificateResponse(
      certificate: json['Certificate'] as String?,
      certificateChain: json['CertificateChain'] as String?,
      privateKey: json['PrivateKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    final certificateChain = this.certificateChain;
    final privateKey = this.privateKey;
    return {
      if (certificate != null) 'Certificate': certificate,
      if (certificateChain != null) 'CertificateChain': certificateChain,
      if (privateKey != null) 'PrivateKey': privateKey,
    };
  }
}

/// The Extended Key Usage X.509 v3 extension defines one or more purposes for
/// which the public key can be used. This is in addition to or in place of the
/// basic purposes specified by the Key Usage extension.
class ExtendedKeyUsage {
  /// The name of an Extended Key Usage value.
  final ExtendedKeyUsageName? name;

  /// An object identifier (OID) for the extension value. OIDs are strings of
  /// numbers separated by periods. The following OIDs are defined in RFC 3280 and
  /// RFC 5280.
  ///
  /// <ul>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.1 (TLS_WEB_SERVER_AUTHENTICATION)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.2 (TLS_WEB_CLIENT_AUTHENTICATION)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.3 (CODE_SIGNING)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.4 (EMAIL_PROTECTION)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.8 (TIME_STAMPING)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.9 (OCSP_SIGNING)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.5 (IPSEC_END_SYSTEM)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.6 (IPSEC_TUNNEL)</code>
  /// </li>
  /// <li>
  /// <code>1.3.6.1.5.5.7.3.7 (IPSEC_USER)</code>
  /// </li>
  /// </ul>
  final String? oid;

  ExtendedKeyUsage({
    this.name,
    this.oid,
  });

  factory ExtendedKeyUsage.fromJson(Map<String, dynamic> json) {
    return ExtendedKeyUsage(
      name: (json['Name'] as String?)?.toExtendedKeyUsageName(),
      oid: json['OID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final oid = this.oid;
    return {
      if (name != null) 'Name': name.toValue(),
      if (oid != null) 'OID': oid,
    };
  }
}

enum ExtendedKeyUsageName {
  tlsWebServerAuthentication,
  tlsWebClientAuthentication,
  codeSigning,
  emailProtection,
  timeStamping,
  ocspSigning,
  ipsecEndSystem,
  ipsecTunnel,
  ipsecUser,
  any,
  none,
  custom,
}

extension ExtendedKeyUsageNameValueExtension on ExtendedKeyUsageName {
  String toValue() {
    switch (this) {
      case ExtendedKeyUsageName.tlsWebServerAuthentication:
        return 'TLS_WEB_SERVER_AUTHENTICATION';
      case ExtendedKeyUsageName.tlsWebClientAuthentication:
        return 'TLS_WEB_CLIENT_AUTHENTICATION';
      case ExtendedKeyUsageName.codeSigning:
        return 'CODE_SIGNING';
      case ExtendedKeyUsageName.emailProtection:
        return 'EMAIL_PROTECTION';
      case ExtendedKeyUsageName.timeStamping:
        return 'TIME_STAMPING';
      case ExtendedKeyUsageName.ocspSigning:
        return 'OCSP_SIGNING';
      case ExtendedKeyUsageName.ipsecEndSystem:
        return 'IPSEC_END_SYSTEM';
      case ExtendedKeyUsageName.ipsecTunnel:
        return 'IPSEC_TUNNEL';
      case ExtendedKeyUsageName.ipsecUser:
        return 'IPSEC_USER';
      case ExtendedKeyUsageName.any:
        return 'ANY';
      case ExtendedKeyUsageName.none:
        return 'NONE';
      case ExtendedKeyUsageName.custom:
        return 'CUSTOM';
    }
  }
}

extension ExtendedKeyUsageNameFromString on String {
  ExtendedKeyUsageName toExtendedKeyUsageName() {
    switch (this) {
      case 'TLS_WEB_SERVER_AUTHENTICATION':
        return ExtendedKeyUsageName.tlsWebServerAuthentication;
      case 'TLS_WEB_CLIENT_AUTHENTICATION':
        return ExtendedKeyUsageName.tlsWebClientAuthentication;
      case 'CODE_SIGNING':
        return ExtendedKeyUsageName.codeSigning;
      case 'EMAIL_PROTECTION':
        return ExtendedKeyUsageName.emailProtection;
      case 'TIME_STAMPING':
        return ExtendedKeyUsageName.timeStamping;
      case 'OCSP_SIGNING':
        return ExtendedKeyUsageName.ocspSigning;
      case 'IPSEC_END_SYSTEM':
        return ExtendedKeyUsageName.ipsecEndSystem;
      case 'IPSEC_TUNNEL':
        return ExtendedKeyUsageName.ipsecTunnel;
      case 'IPSEC_USER':
        return ExtendedKeyUsageName.ipsecUser;
      case 'ANY':
        return ExtendedKeyUsageName.any;
      case 'NONE':
        return ExtendedKeyUsageName.none;
      case 'CUSTOM':
        return ExtendedKeyUsageName.custom;
    }
    throw Exception('$this is not known in enum ExtendedKeyUsageName');
  }
}

enum FailureReason {
  noAvailableContacts,
  additionalVerificationRequired,
  domainNotAllowed,
  invalidPublicDomain,
  domainValidationDenied,
  caaError,
  pcaLimitExceeded,
  pcaInvalidArn,
  pcaInvalidState,
  pcaRequestFailed,
  pcaNameConstraintsValidation,
  pcaResourceNotFound,
  pcaInvalidArgs,
  pcaInvalidDuration,
  pcaAccessDenied,
  slrNotFound,
  other,
}

extension FailureReasonValueExtension on FailureReason {
  String toValue() {
    switch (this) {
      case FailureReason.noAvailableContacts:
        return 'NO_AVAILABLE_CONTACTS';
      case FailureReason.additionalVerificationRequired:
        return 'ADDITIONAL_VERIFICATION_REQUIRED';
      case FailureReason.domainNotAllowed:
        return 'DOMAIN_NOT_ALLOWED';
      case FailureReason.invalidPublicDomain:
        return 'INVALID_PUBLIC_DOMAIN';
      case FailureReason.domainValidationDenied:
        return 'DOMAIN_VALIDATION_DENIED';
      case FailureReason.caaError:
        return 'CAA_ERROR';
      case FailureReason.pcaLimitExceeded:
        return 'PCA_LIMIT_EXCEEDED';
      case FailureReason.pcaInvalidArn:
        return 'PCA_INVALID_ARN';
      case FailureReason.pcaInvalidState:
        return 'PCA_INVALID_STATE';
      case FailureReason.pcaRequestFailed:
        return 'PCA_REQUEST_FAILED';
      case FailureReason.pcaNameConstraintsValidation:
        return 'PCA_NAME_CONSTRAINTS_VALIDATION';
      case FailureReason.pcaResourceNotFound:
        return 'PCA_RESOURCE_NOT_FOUND';
      case FailureReason.pcaInvalidArgs:
        return 'PCA_INVALID_ARGS';
      case FailureReason.pcaInvalidDuration:
        return 'PCA_INVALID_DURATION';
      case FailureReason.pcaAccessDenied:
        return 'PCA_ACCESS_DENIED';
      case FailureReason.slrNotFound:
        return 'SLR_NOT_FOUND';
      case FailureReason.other:
        return 'OTHER';
    }
  }
}

extension FailureReasonFromString on String {
  FailureReason toFailureReason() {
    switch (this) {
      case 'NO_AVAILABLE_CONTACTS':
        return FailureReason.noAvailableContacts;
      case 'ADDITIONAL_VERIFICATION_REQUIRED':
        return FailureReason.additionalVerificationRequired;
      case 'DOMAIN_NOT_ALLOWED':
        return FailureReason.domainNotAllowed;
      case 'INVALID_PUBLIC_DOMAIN':
        return FailureReason.invalidPublicDomain;
      case 'DOMAIN_VALIDATION_DENIED':
        return FailureReason.domainValidationDenied;
      case 'CAA_ERROR':
        return FailureReason.caaError;
      case 'PCA_LIMIT_EXCEEDED':
        return FailureReason.pcaLimitExceeded;
      case 'PCA_INVALID_ARN':
        return FailureReason.pcaInvalidArn;
      case 'PCA_INVALID_STATE':
        return FailureReason.pcaInvalidState;
      case 'PCA_REQUEST_FAILED':
        return FailureReason.pcaRequestFailed;
      case 'PCA_NAME_CONSTRAINTS_VALIDATION':
        return FailureReason.pcaNameConstraintsValidation;
      case 'PCA_RESOURCE_NOT_FOUND':
        return FailureReason.pcaResourceNotFound;
      case 'PCA_INVALID_ARGS':
        return FailureReason.pcaInvalidArgs;
      case 'PCA_INVALID_DURATION':
        return FailureReason.pcaInvalidDuration;
      case 'PCA_ACCESS_DENIED':
        return FailureReason.pcaAccessDenied;
      case 'SLR_NOT_FOUND':
        return FailureReason.slrNotFound;
      case 'OTHER':
        return FailureReason.other;
    }
    throw Exception('$this is not known in enum FailureReason');
  }
}

/// This structure can be used in the <a>ListCertificates</a> action to filter
/// the output of the certificate list.
class Filters {
  /// Specify one or more <a>ExtendedKeyUsage</a> extension values.
  final List<ExtendedKeyUsageName>? extendedKeyUsage;

  /// Specify one or more algorithms that can be used to generate key pairs.
  ///
  /// Default filtering returns only <code>RSA_1024</code> and
  /// <code>RSA_2048</code> certificates that have at least one domain. To return
  /// other certificate types, provide the desired type signatures in a
  /// comma-separated list. For example, <code>"keyTypes":
  /// ["RSA_2048","RSA_4096"]</code> returns both <code>RSA_2048</code> and
  /// <code>RSA_4096</code> certificates.
  final List<KeyAlgorithm>? keyTypes;

  /// Specify one or more <a>KeyUsage</a> extension values.
  final List<KeyUsageName>? keyUsage;

  Filters({
    this.extendedKeyUsage,
    this.keyTypes,
    this.keyUsage,
  });

  Map<String, dynamic> toJson() {
    final extendedKeyUsage = this.extendedKeyUsage;
    final keyTypes = this.keyTypes;
    final keyUsage = this.keyUsage;
    return {
      if (extendedKeyUsage != null)
        'extendedKeyUsage': extendedKeyUsage.map((e) => e.toValue()).toList(),
      if (keyTypes != null)
        'keyTypes': keyTypes.map((e) => e.toValue()).toList(),
      if (keyUsage != null)
        'keyUsage': keyUsage.map((e) => e.toValue()).toList(),
    };
  }
}

class GetAccountConfigurationResponse {
  /// Expiration events configuration options associated with the Amazon Web
  /// Services account.
  final ExpiryEventsConfiguration? expiryEvents;

  GetAccountConfigurationResponse({
    this.expiryEvents,
  });

  factory GetAccountConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountConfigurationResponse(
      expiryEvents: json['ExpiryEvents'] != null
          ? ExpiryEventsConfiguration.fromJson(
              json['ExpiryEvents'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final expiryEvents = this.expiryEvents;
    return {
      if (expiryEvents != null) 'ExpiryEvents': expiryEvents,
    };
  }
}

class GetCertificateResponse {
  /// The ACM-issued certificate corresponding to the ARN specified as input.
  final String? certificate;

  /// Certificates forming the requested certificate's chain of trust. The chain
  /// consists of the certificate of the issuing CA and the intermediate
  /// certificates of any other subordinate CAs.
  final String? certificateChain;

  GetCertificateResponse({
    this.certificate,
    this.certificateChain,
  });

  factory GetCertificateResponse.fromJson(Map<String, dynamic> json) {
    return GetCertificateResponse(
      certificate: json['Certificate'] as String?,
      certificateChain: json['CertificateChain'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    final certificateChain = this.certificateChain;
    return {
      if (certificate != null) 'Certificate': certificate,
      if (certificateChain != null) 'CertificateChain': certificateChain,
    };
  }
}

class ImportCertificateResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the imported certificate.
  final String? certificateArn;

  ImportCertificateResponse({
    this.certificateArn,
  });

  factory ImportCertificateResponse.fromJson(Map<String, dynamic> json) {
    return ImportCertificateResponse(
      certificateArn: json['CertificateArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
    };
  }
}

enum KeyAlgorithm {
  rsa_1024,
  rsa_2048,
  rsa_3072,
  rsa_4096,
  ecPrime256v1,
  ecSecp384r1,
  ecSecp521r1,
}

extension KeyAlgorithmValueExtension on KeyAlgorithm {
  String toValue() {
    switch (this) {
      case KeyAlgorithm.rsa_1024:
        return 'RSA_1024';
      case KeyAlgorithm.rsa_2048:
        return 'RSA_2048';
      case KeyAlgorithm.rsa_3072:
        return 'RSA_3072';
      case KeyAlgorithm.rsa_4096:
        return 'RSA_4096';
      case KeyAlgorithm.ecPrime256v1:
        return 'EC_prime256v1';
      case KeyAlgorithm.ecSecp384r1:
        return 'EC_secp384r1';
      case KeyAlgorithm.ecSecp521r1:
        return 'EC_secp521r1';
    }
  }
}

extension KeyAlgorithmFromString on String {
  KeyAlgorithm toKeyAlgorithm() {
    switch (this) {
      case 'RSA_1024':
        return KeyAlgorithm.rsa_1024;
      case 'RSA_2048':
        return KeyAlgorithm.rsa_2048;
      case 'RSA_3072':
        return KeyAlgorithm.rsa_3072;
      case 'RSA_4096':
        return KeyAlgorithm.rsa_4096;
      case 'EC_prime256v1':
        return KeyAlgorithm.ecPrime256v1;
      case 'EC_secp384r1':
        return KeyAlgorithm.ecSecp384r1;
      case 'EC_secp521r1':
        return KeyAlgorithm.ecSecp521r1;
    }
    throw Exception('$this is not known in enum KeyAlgorithm');
  }
}

/// The Key Usage X.509 v3 extension defines the purpose of the public key
/// contained in the certificate.
class KeyUsage {
  /// A string value that contains a Key Usage extension name.
  final KeyUsageName? name;

  KeyUsage({
    this.name,
  });

  factory KeyUsage.fromJson(Map<String, dynamic> json) {
    return KeyUsage(
      name: (json['Name'] as String?)?.toKeyUsageName(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name.toValue(),
    };
  }
}

enum KeyUsageName {
  digitalSignature,
  nonRepudiation,
  keyEncipherment,
  dataEncipherment,
  keyAgreement,
  certificateSigning,
  crlSigning,
  encipherOnly,
  decipherOnly,
  any,
  custom,
}

extension KeyUsageNameValueExtension on KeyUsageName {
  String toValue() {
    switch (this) {
      case KeyUsageName.digitalSignature:
        return 'DIGITAL_SIGNATURE';
      case KeyUsageName.nonRepudiation:
        return 'NON_REPUDIATION';
      case KeyUsageName.keyEncipherment:
        return 'KEY_ENCIPHERMENT';
      case KeyUsageName.dataEncipherment:
        return 'DATA_ENCIPHERMENT';
      case KeyUsageName.keyAgreement:
        return 'KEY_AGREEMENT';
      case KeyUsageName.certificateSigning:
        return 'CERTIFICATE_SIGNING';
      case KeyUsageName.crlSigning:
        return 'CRL_SIGNING';
      case KeyUsageName.encipherOnly:
        return 'ENCIPHER_ONLY';
      case KeyUsageName.decipherOnly:
        return 'DECIPHER_ONLY';
      case KeyUsageName.any:
        return 'ANY';
      case KeyUsageName.custom:
        return 'CUSTOM';
    }
  }
}

extension KeyUsageNameFromString on String {
  KeyUsageName toKeyUsageName() {
    switch (this) {
      case 'DIGITAL_SIGNATURE':
        return KeyUsageName.digitalSignature;
      case 'NON_REPUDIATION':
        return KeyUsageName.nonRepudiation;
      case 'KEY_ENCIPHERMENT':
        return KeyUsageName.keyEncipherment;
      case 'DATA_ENCIPHERMENT':
        return KeyUsageName.dataEncipherment;
      case 'KEY_AGREEMENT':
        return KeyUsageName.keyAgreement;
      case 'CERTIFICATE_SIGNING':
        return KeyUsageName.certificateSigning;
      case 'CRL_SIGNING':
        return KeyUsageName.crlSigning;
      case 'ENCIPHER_ONLY':
        return KeyUsageName.encipherOnly;
      case 'DECIPHER_ONLY':
        return KeyUsageName.decipherOnly;
      case 'ANY':
        return KeyUsageName.any;
      case 'CUSTOM':
        return KeyUsageName.custom;
    }
    throw Exception('$this is not known in enum KeyUsageName');
  }
}

class ListCertificatesResponse {
  /// A list of ACM certificates.
  final List<CertificateSummary>? certificateSummaryList;

  /// When the list is truncated, this value is present and contains the value to
  /// use for the <code>NextToken</code> parameter in a subsequent pagination
  /// request.
  final String? nextToken;

  ListCertificatesResponse({
    this.certificateSummaryList,
    this.nextToken,
  });

  factory ListCertificatesResponse.fromJson(Map<String, dynamic> json) {
    return ListCertificatesResponse(
      certificateSummaryList: (json['CertificateSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateSummaryList = this.certificateSummaryList;
    final nextToken = this.nextToken;
    return {
      if (certificateSummaryList != null)
        'CertificateSummaryList': certificateSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForCertificateResponse {
  /// The key-value pairs that define the applied tags.
  final List<Tag>? tags;

  ListTagsForCertificateResponse({
    this.tags,
  });

  factory ListTagsForCertificateResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForCertificateResponse(
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

enum RecordType {
  cname,
}

extension RecordTypeValueExtension on RecordType {
  String toValue() {
    switch (this) {
      case RecordType.cname:
        return 'CNAME';
    }
  }
}

extension RecordTypeFromString on String {
  RecordType toRecordType() {
    switch (this) {
      case 'CNAME':
        return RecordType.cname;
    }
    throw Exception('$this is not known in enum RecordType');
  }
}

enum RenewalEligibility {
  eligible,
  ineligible,
}

extension RenewalEligibilityValueExtension on RenewalEligibility {
  String toValue() {
    switch (this) {
      case RenewalEligibility.eligible:
        return 'ELIGIBLE';
      case RenewalEligibility.ineligible:
        return 'INELIGIBLE';
    }
  }
}

extension RenewalEligibilityFromString on String {
  RenewalEligibility toRenewalEligibility() {
    switch (this) {
      case 'ELIGIBLE':
        return RenewalEligibility.eligible;
      case 'INELIGIBLE':
        return RenewalEligibility.ineligible;
    }
    throw Exception('$this is not known in enum RenewalEligibility');
  }
}

enum RenewalStatus {
  pendingAutoRenewal,
  pendingValidation,
  success,
  failed,
}

extension RenewalStatusValueExtension on RenewalStatus {
  String toValue() {
    switch (this) {
      case RenewalStatus.pendingAutoRenewal:
        return 'PENDING_AUTO_RENEWAL';
      case RenewalStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case RenewalStatus.success:
        return 'SUCCESS';
      case RenewalStatus.failed:
        return 'FAILED';
    }
  }
}

extension RenewalStatusFromString on String {
  RenewalStatus toRenewalStatus() {
    switch (this) {
      case 'PENDING_AUTO_RENEWAL':
        return RenewalStatus.pendingAutoRenewal;
      case 'PENDING_VALIDATION':
        return RenewalStatus.pendingValidation;
      case 'SUCCESS':
        return RenewalStatus.success;
      case 'FAILED':
        return RenewalStatus.failed;
    }
    throw Exception('$this is not known in enum RenewalStatus');
  }
}

/// Contains information about the status of ACM's <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
/// renewal</a> for the certificate. This structure exists only when the
/// certificate type is <code>AMAZON_ISSUED</code>.
class RenewalSummary {
  /// Contains information about the validation of each domain name in the
  /// certificate, as it pertains to ACM's <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a>. This is different from the initial validation that occurs as a
  /// result of the <a>RequestCertificate</a> request. This field exists only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  final List<DomainValidation> domainValidationOptions;

  /// The status of ACM's <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> of the certificate.
  final RenewalStatus renewalStatus;

  /// The time at which the renewal summary was last updated.
  final DateTime updatedAt;

  /// The reason that a renewal request was unsuccessful.
  final FailureReason? renewalStatusReason;

  RenewalSummary({
    required this.domainValidationOptions,
    required this.renewalStatus,
    required this.updatedAt,
    this.renewalStatusReason,
  });

  factory RenewalSummary.fromJson(Map<String, dynamic> json) {
    return RenewalSummary(
      domainValidationOptions: (json['DomainValidationOptions'] as List)
          .whereNotNull()
          .map((e) => DomainValidation.fromJson(e as Map<String, dynamic>))
          .toList(),
      renewalStatus: (json['RenewalStatus'] as String).toRenewalStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
      renewalStatusReason:
          (json['RenewalStatusReason'] as String?)?.toFailureReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainValidationOptions = this.domainValidationOptions;
    final renewalStatus = this.renewalStatus;
    final updatedAt = this.updatedAt;
    final renewalStatusReason = this.renewalStatusReason;
    return {
      'DomainValidationOptions': domainValidationOptions,
      'RenewalStatus': renewalStatus.toValue(),
      'UpdatedAt': unixTimestampToJson(updatedAt),
      if (renewalStatusReason != null)
        'RenewalStatusReason': renewalStatusReason.toValue(),
    };
  }
}

class RequestCertificateResponse {
  /// String that contains the ARN of the issued certificate. This must be of the
  /// form:
  ///
  /// <code>arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  final String? certificateArn;

  RequestCertificateResponse({
    this.certificateArn,
  });

  factory RequestCertificateResponse.fromJson(Map<String, dynamic> json) {
    return RequestCertificateResponse(
      certificateArn: json['CertificateArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
    };
  }
}

/// Contains a DNS record value that you can use to validate ownership or
/// control of a domain. This is used by the <a>DescribeCertificate</a> action.
class ResourceRecord {
  /// The name of the DNS record to create in your domain. This is supplied by
  /// ACM.
  final String name;

  /// The type of DNS record. Currently this can be <code>CNAME</code>.
  final RecordType type;

  /// The value of the CNAME record to add to your DNS database. This is supplied
  /// by ACM.
  final String value;

  ResourceRecord({
    required this.name,
    required this.type,
    required this.value,
  });

  factory ResourceRecord.fromJson(Map<String, dynamic> json) {
    return ResourceRecord(
      name: json['Name'] as String,
      type: (json['Type'] as String).toRecordType(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      'Name': name,
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum RevocationReason {
  unspecified,
  keyCompromise,
  caCompromise,
  affiliationChanged,
  superceded,
  cessationOfOperation,
  certificateHold,
  removeFromCrl,
  privilegeWithdrawn,
  aACompromise,
}

extension RevocationReasonValueExtension on RevocationReason {
  String toValue() {
    switch (this) {
      case RevocationReason.unspecified:
        return 'UNSPECIFIED';
      case RevocationReason.keyCompromise:
        return 'KEY_COMPROMISE';
      case RevocationReason.caCompromise:
        return 'CA_COMPROMISE';
      case RevocationReason.affiliationChanged:
        return 'AFFILIATION_CHANGED';
      case RevocationReason.superceded:
        return 'SUPERCEDED';
      case RevocationReason.cessationOfOperation:
        return 'CESSATION_OF_OPERATION';
      case RevocationReason.certificateHold:
        return 'CERTIFICATE_HOLD';
      case RevocationReason.removeFromCrl:
        return 'REMOVE_FROM_CRL';
      case RevocationReason.privilegeWithdrawn:
        return 'PRIVILEGE_WITHDRAWN';
      case RevocationReason.aACompromise:
        return 'A_A_COMPROMISE';
    }
  }
}

extension RevocationReasonFromString on String {
  RevocationReason toRevocationReason() {
    switch (this) {
      case 'UNSPECIFIED':
        return RevocationReason.unspecified;
      case 'KEY_COMPROMISE':
        return RevocationReason.keyCompromise;
      case 'CA_COMPROMISE':
        return RevocationReason.caCompromise;
      case 'AFFILIATION_CHANGED':
        return RevocationReason.affiliationChanged;
      case 'SUPERCEDED':
        return RevocationReason.superceded;
      case 'CESSATION_OF_OPERATION':
        return RevocationReason.cessationOfOperation;
      case 'CERTIFICATE_HOLD':
        return RevocationReason.certificateHold;
      case 'REMOVE_FROM_CRL':
        return RevocationReason.removeFromCrl;
      case 'PRIVILEGE_WITHDRAWN':
        return RevocationReason.privilegeWithdrawn;
      case 'A_A_COMPROMISE':
        return RevocationReason.aACompromise;
    }
    throw Exception('$this is not known in enum RevocationReason');
  }
}

enum SortBy {
  createdAt,
}

extension SortByValueExtension on SortBy {
  String toValue() {
    switch (this) {
      case SortBy.createdAt:
        return 'CREATED_AT';
    }
  }
}

extension SortByFromString on String {
  SortBy toSortBy() {
    switch (this) {
      case 'CREATED_AT':
        return SortBy.createdAt;
    }
    throw Exception('$this is not known in enum SortBy');
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// A key-value pair that identifies or specifies metadata about an ACM
/// resource.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

enum ValidationMethod {
  email,
  dns,
}

extension ValidationMethodValueExtension on ValidationMethod {
  String toValue() {
    switch (this) {
      case ValidationMethod.email:
        return 'EMAIL';
      case ValidationMethod.dns:
        return 'DNS';
    }
  }
}

extension ValidationMethodFromString on String {
  ValidationMethod toValidationMethod() {
    switch (this) {
      case 'EMAIL':
        return ValidationMethod.email;
      case 'DNS':
        return ValidationMethod.dns;
    }
    throw Exception('$this is not known in enum ValidationMethod');
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

class InvalidArgsException extends _s.GenericAwsException {
  InvalidArgsException({String? type, String? message})
      : super(type: type, code: 'InvalidArgsException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String? type, String? message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidDomainValidationOptionsException extends _s.GenericAwsException {
  InvalidDomainValidationOptionsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDomainValidationOptionsException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String? type, String? message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class RequestInProgressException extends _s.GenericAwsException {
  RequestInProgressException({String? type, String? message})
      : super(type: type, code: 'RequestInProgressException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String? type, String? message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'InvalidArgsException': (type, message) =>
      InvalidArgsException(type: type, message: message),
  'InvalidArnException': (type, message) =>
      InvalidArnException(type: type, message: message),
  'InvalidDomainValidationOptionsException': (type, message) =>
      InvalidDomainValidationOptionsException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'InvalidTagException': (type, message) =>
      InvalidTagException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'RequestInProgressException': (type, message) =>
      RequestInProgressException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TagPolicyException': (type, message) =>
      TagPolicyException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
