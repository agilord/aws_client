// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
  /// May throw [InvalidArnException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TagPolicyException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
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
  /// succeeds, the certificate is not available for use by Amazon Web Services
  /// services integrated with ACM. Deleting a certificate is eventually
  /// consistent. The may be a short delay before the certificate no longer
  /// appears in the list that can be displayed by calling the
  /// <a>ListCertificates</a> action or be retrieved by calling the
  /// <a>GetCertificate</a> action.
  /// <note>
  /// You cannot delete an ACM certificate that is being used by another Amazon
  /// Web Services service. To delete a certificate that is in use, you must
  /// first remove the certificate association using the console or the CLI for
  /// the associated service.
  ///
  /// Deleting a certificate issued by a private certificate authority (CA) has
  /// no effect on the CA. You will continue to be charged for the CA until it
  /// is deleted. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PCADeleteCA.html">
  /// Deleting Your Private CA</a> in the <i>Private Certificate Authority User
  /// Guide</i>.
  /// </note>
  /// Deleting a certificate issued by a private certificate authority (CA) has
  /// no effect on the CA. You will continue to be charged for the CA until it
  /// is deleted. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PCADeleteCA.html">Deleting
  /// your private CA</a> in the <i>Amazon Web Services Private Certificate
  /// Authority User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidArnException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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
  /// May throw [InvalidArnException].
  /// May throw [ResourceNotFoundException].
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
  /// (CA) or a public certificate for use anywhere. The exported file contains
  /// the certificate, the certificate chain, and the encrypted private key
  /// associated with the public key that is embedded in the certificate. For
  /// security, you must assign a passphrase for the private key when exporting
  /// it.
  ///
  /// For information about exporting and formatting a certificate using the ACM
  /// console or CLI, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/export-private.html">Export
  /// a private certificate</a> and <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/export-public-certificate">Export
  /// a public certificate</a>.
  /// <note>
  /// ACM public certificates created prior to June 17, 2025 cannot be exported.
  /// </note>
  ///
  /// May throw [InvalidArnException].
  /// May throw [RequestInProgressException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Retrieves a certificate and its certificate chain. The certificate may be
  /// either a public or private certificate issued using the ACM
  /// <code>RequestCertificate</code> action, or a certificate imported into ACM
  /// using the <code>ImportCertificate</code> action. The chain consists of the
  /// certificate of the issuing CA and the intermediate certificates of any
  /// other subordinate CAs. All of the certificates are base64 encoded. You can
  /// use <a
  /// href="https://wiki.openssl.org/index.php/Command_Line_Utilities">OpenSSL</a>
  /// to decode the certificates and inspect individual fields.
  ///
  /// May throw [InvalidArnException].
  /// May throw [RequestInProgressException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ConflictException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TagPolicyException].
  /// May throw [TooManyTagsException].
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
              certificateStatuses.map((e) => e.value).toList(),
        if (includes != null) 'Includes': includes,
        if (maxItems != null) 'MaxItems': maxItems,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.value,
        if (sortOrder != null) 'SortOrder': sortOrder.value,
      },
    );

    return ListCertificatesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags that have been applied to the ACM certificate. Use the
  /// certificate's Amazon Resource Name (ARN) to specify the certificate. To
  /// add a tag to an ACM certificate, use the <a>AddTagsToCertificate</a>
  /// action. To delete a tag, use the <a>RemoveTagsFromCertificate</a> action.
  ///
  /// May throw [InvalidArnException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [InvalidArnException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TagPolicyException].
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

  /// Renews an <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/managed-renewal.html">eligible
  /// ACM certificate</a>. In order to renew your Amazon Web Services Private CA
  /// certificates with ACM, you must first <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/assign-permissions.html#PcaPermissions">grant
  /// the ACM service principal permission to do so</a>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/managed-renewal.html">Testing
  /// Managed Renewal</a> in the ACM User Guide.
  ///
  /// May throw [InvalidArnException].
  /// May throw [RequestInProgressException].
  /// May throw [ResourceNotFoundException].
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
  /// validation</a>. We recommend that you use DNS validation.
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
  /// May throw [InvalidArnException].
  /// May throw [InvalidDomainValidationOptionsException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagException].
  /// May throw [LimitExceededException].
  /// May throw [TagPolicyException].
  /// May throw [TooManyTagsException].
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
  /// clients. Some Amazon Web Services services may require RSA keys, or only
  /// support ECDSA keys of a particular size, while others allow the use of
  /// either RSA and ECDSA keys to ensure that compatibility is not broken.
  /// Check the requirements for the Amazon Web Services service where you plan
  /// to deploy your certificate. For more information about selecting an
  /// algorithm, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-certificate-characteristics.html#algorithms-term">Key
  /// algorithms</a>.
  /// <note>
  /// Algorithms supported for an ACM certificate request include:
  ///
  /// <ul>
  /// <li>
  /// <code>RSA_2048</code>
  /// </li>
  /// <li>
  /// <code>EC_prime256v1</code>
  /// </li>
  /// <li>
  /// <code>EC_secp384r1</code>
  /// </li>
  /// </ul>
  /// Other listed algorithms are for imported certificates only.
  /// </note> <note>
  /// When you request a private PKI certificate signed by a CA from Amazon Web
  /// Services Private CA, the specified signing algorithm family (RSA or ECDSA)
  /// must match the algorithm family of the CA's secret key.
  /// </note>
  /// Default: RSA_2048
  ///
  /// Parameter [managedBy] :
  /// Identifies the Amazon Web Services service that manages the certificate
  /// issued by ACM.
  ///
  /// Parameter [options] :
  /// You can use this parameter to specify whether to add the certificate to a
  /// certificate transparency log and export your certificate.
  ///
  /// Certificate transparency makes it possible to detect SSL/TLS certificates
  /// that have been mistakenly or maliciously issued. Certificates that have
  /// not been logged typically produce an error message in a browser. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency">Opting
  /// Out of Certificate Transparency Logging</a>.
  ///
  /// You can export public ACM certificates to use with Amazon Web Services
  /// services as well as outside the Amazon Web Services Cloud. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-exportable-certificates.html">Certificate
  /// Manager exportable public certificate</a>.
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
    CertificateManagedBy? managedBy,
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
        if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.value,
        if (managedBy != null) 'ManagedBy': managedBy.value,
        if (options != null) 'Options': options,
        if (subjectAlternativeNames != null)
          'SubjectAlternativeNames': subjectAlternativeNames,
        if (tags != null) 'Tags': tags,
        if (validationMethod != null)
          'ValidationMethod': validationMethod.value,
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
  /// May throw [InvalidArnException].
  /// May throw [InvalidDomainValidationOptionsException].
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
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
  /// email to the the following five addresses:
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

  /// Revokes a public ACM certificate. You can only revoke certificates that
  /// have been previously exported.
  /// <important>
  /// Once a certificate is revoked, you cannot reuse the certificate. Revoking
  /// a certificate is permanent.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InvalidArnException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [certificateArn] :
  /// The Amazon Resource Name (ARN) of the public or private certificate that
  /// will be revoked. The ARN must have the following form:
  ///
  /// <code>arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// Parameter [revocationReason] :
  /// Specifies why you revoked the certificate.
  Future<RevokeCertificateResponse> revokeCertificate({
    required String certificateArn,
    required RevocationReason revocationReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.RevokeCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
        'RevocationReason': revocationReason.value,
      },
    );

    return RevokeCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of certificates matching search criteria. You can filter
  /// certificates by X.509 attributes and ACM specific properties like
  /// certificate status, type and renewal eligibility. This operation provides
  /// more flexible filtering than <a>ListCertificates</a> by supporting complex
  /// filter statements.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterStatement] :
  /// A filter statement that defines the search criteria. You can combine
  /// multiple filters using AND, OR, and NOT logical operators to create
  /// complex queries.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. Default is 100.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter only when paginating results and only in a subsequent
  /// request after you receive a response with truncated results. Set it to the
  /// value of <code>NextToken</code> from the response you just received.
  ///
  /// Parameter [sortBy] :
  /// Specifies the field to sort results by. Valid values are CREATED_AT,
  /// NOT_AFTER, STATUS, RENEWAL_STATUS, EXPORTED, IN_USE, NOT_BEFORE,
  /// KEY_ALGORITHM, TYPE, CERTIFICATE_ARN, COMMON_NAME, REVOKED_AT,
  /// RENEWAL_ELIGIBILITY, ISSUED_AT, MANAGED_BY, EXPORT_OPTION,
  /// VALIDATION_METHOD, and IMPORTED_AT.
  ///
  /// Parameter [sortOrder] :
  /// Specifies the order of sorted results. Valid values are ASCENDING or
  /// DESCENDING.
  Future<SearchCertificatesResponse> searchCertificates({
    CertificateFilterStatement? filterStatement,
    int? maxResults,
    String? nextToken,
    SearchCertificatesSortBy? sortBy,
    SearchCertificatesSortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.SearchCertificates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filterStatement != null) 'FilterStatement': filterStatement,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortBy != null) 'SortBy': sortBy.value,
        if (sortOrder != null) 'SortOrder': sortOrder.value,
      },
    );

    return SearchCertificatesResponse.fromJson(jsonResponse.body);
  }

  /// Updates a certificate. You can use this function to specify whether to opt
  /// in to or out of recording your certificate in a certificate transparency
  /// log and exporting. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency">
  /// Opting Out of Certificate Transparency Logging</a> and <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-exportable-certificates.html">Certificate
  /// Manager Exportable Managed Certificates</a>.
  ///
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateArn] :
  /// ARN of the requested certificate to update. This must be of the form:
  ///
  /// <code>arn:aws:acm:us-east-1:<i>account</i>:certificate/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [options] :
  /// Use to update the options for your certificate. Currently, you can specify
  /// whether to add your certificate to a transparency log or export your
  /// certificate. Certificate transparency makes it possible to detect SSL/TLS
  /// certificates that have been mistakenly or maliciously issued. Certificates
  /// that have not been logged typically produce an error message in a browser.
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class ListTagsForCertificateResponse {
  /// The key-value pairs that define the applied tags.
  final List<Tag>? tags;

  ListTagsForCertificateResponse({
    this.tags,
  });

  factory ListTagsForCertificateResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForCertificateResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
class RevokeCertificateResponse {
  /// The Amazon Resource Name (ARN) of the public or private certificate that was
  /// revoked.
  final String? certificateArn;

  RevokeCertificateResponse({
    this.certificateArn,
  });

  factory RevokeCertificateResponse.fromJson(Map<String, dynamic> json) {
    return RevokeCertificateResponse(
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

/// @nodoc
class SearchCertificatesResponse {
  /// When the list is truncated, this value is present and contains the value to
  /// use for the <code>NextToken</code> parameter in a subsequent pagination
  /// request.
  final String? nextToken;

  /// A list of certificate search results containing certificate ARNs, X.509
  /// attributes, and ACM metadata.
  final List<CertificateSearchResult>? results;

  SearchCertificatesResponse({
    this.nextToken,
    this.results,
  });

  factory SearchCertificatesResponse.fromJson(Map<String, dynamic> json) {
    return SearchCertificatesResponse(
      nextToken: json['NextToken'] as String?,
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) =>
              CertificateSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (results != null) 'Results': results,
    };
  }
}

/// Structure that contains options for your certificate. You can use this
/// structure to specify whether to opt in to or out of certificate transparency
/// logging and export your certificate.
///
/// Some browsers require that public certificates issued for your domain be
/// recorded in a log. Certificates that are not logged typically generate a
/// browser error. Transparency makes it possible for you to detect SSL/TLS
/// certificates that have been mistakenly or maliciously issued for your
/// domain. For general information, see <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency">Certificate
/// Transparency Logging</a>.
///
/// You can export public ACM certificates to use with Amazon Web Services
/// services as well as outside Amazon Web Services Cloud. For more information,
/// see <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-exportable-certificates.html">Certificate
/// Manager exportable public certificate</a>.
///
/// @nodoc
class CertificateOptions {
  /// You can opt out of certificate transparency logging by specifying the
  /// <code>DISABLED</code> option. Opt in by specifying <code>ENABLED</code>.
  final CertificateTransparencyLoggingPreference?
      certificateTransparencyLoggingPreference;

  /// You can opt in to allow the export of your certificates by specifying
  /// <code>ENABLED</code>. You cannot update the value of <code>Export</code>
  /// after the the certificate is created.
  final CertificateExport? export;

  CertificateOptions({
    this.certificateTransparencyLoggingPreference,
    this.export,
  });

  factory CertificateOptions.fromJson(Map<String, dynamic> json) {
    return CertificateOptions(
      certificateTransparencyLoggingPreference:
          (json['CertificateTransparencyLoggingPreference'] as String?)
              ?.let(CertificateTransparencyLoggingPreference.fromString),
      export: (json['Export'] as String?)?.let(CertificateExport.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateTransparencyLoggingPreference =
        this.certificateTransparencyLoggingPreference;
    final export = this.export;
    return {
      if (certificateTransparencyLoggingPreference != null)
        'CertificateTransparencyLoggingPreference':
            certificateTransparencyLoggingPreference.value,
      if (export != null) 'Export': export.value,
    };
  }
}

/// @nodoc
class CertificateTransparencyLoggingPreference {
  static const enabled = CertificateTransparencyLoggingPreference._('ENABLED');
  static const disabled =
      CertificateTransparencyLoggingPreference._('DISABLED');

  final String value;

  const CertificateTransparencyLoggingPreference._(this.value);

  static const values = [enabled, disabled];

  static CertificateTransparencyLoggingPreference fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateTransparencyLoggingPreference._(value));

  @override
  bool operator ==(other) =>
      other is CertificateTransparencyLoggingPreference && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CertificateExport {
  static const enabled = CertificateExport._('ENABLED');
  static const disabled = CertificateExport._('DISABLED');

  final String value;

  const CertificateExport._(this.value);

  static const values = [enabled, disabled];

  static CertificateExport fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateExport._(value));

  @override
  bool operator ==(other) => other is CertificateExport && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a certificate returned by the
/// <a>SearchCertificates</a> action. This structure includes the certificate
/// ARN, X.509 attributes, and ACM metadata.
///
/// @nodoc
class CertificateSearchResult {
  /// The Amazon Resource Name (ARN) of the certificate.
  final String? certificateArn;

  /// ACM-specific metadata about the certificate.
  final CertificateMetadata? certificateMetadata;

  /// X.509 certificate attributes such as subject, issuer, and validity period.
  final X509Attributes? x509Attributes;

  CertificateSearchResult({
    this.certificateArn,
    this.certificateMetadata,
    this.x509Attributes,
  });

  factory CertificateSearchResult.fromJson(Map<String, dynamic> json) {
    return CertificateSearchResult(
      certificateArn: json['CertificateArn'] as String?,
      certificateMetadata: json['CertificateMetadata'] != null
          ? CertificateMetadata.fromJson(
              json['CertificateMetadata'] as Map<String, dynamic>)
          : null,
      x509Attributes: json['X509Attributes'] != null
          ? X509Attributes.fromJson(
              json['X509Attributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificateMetadata = this.certificateMetadata;
    final x509Attributes = this.x509Attributes;
    return {
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (certificateMetadata != null)
        'CertificateMetadata': certificateMetadata,
      if (x509Attributes != null) 'X509Attributes': x509Attributes,
    };
  }
}

/// Contains X.509 certificate attributes extracted from the certificate.
///
/// @nodoc
class X509Attributes {
  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be used
  /// and consists of a name and an object identifier (OID).
  final List<ExtendedKeyUsageName>? extendedKeyUsages;

  /// The distinguished name of the certificate issuer.
  final DistinguishedName? issuer;

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

  /// The serial number assigned by the certificate authority.
  final String? serialNumber;

  /// The distinguished name of the certificate subject.
  final DistinguishedName? subject;

  /// One or more domain names (subject alternative names) included in the
  /// certificate. This list contains the domain names that are bound to the
  /// public key that is contained in the certificate. The subject alternative
  /// names include the canonical domain name (CN) of the certificate and
  /// additional domain names that can be used to connect to the website.
  final List<GeneralName>? subjectAlternativeNames;

  X509Attributes({
    this.extendedKeyUsages,
    this.issuer,
    this.keyAlgorithm,
    this.keyUsages,
    this.notAfter,
    this.notBefore,
    this.serialNumber,
    this.subject,
    this.subjectAlternativeNames,
  });

  factory X509Attributes.fromJson(Map<String, dynamic> json) {
    return X509Attributes(
      extendedKeyUsages: (json['ExtendedKeyUsages'] as List?)
          ?.nonNulls
          .map((e) => ExtendedKeyUsageName.fromString((e as String)))
          .toList(),
      issuer: json['Issuer'] != null
          ? DistinguishedName.fromJson(json['Issuer'] as Map<String, dynamic>)
          : null,
      keyAlgorithm:
          (json['KeyAlgorithm'] as String?)?.let(KeyAlgorithm.fromString),
      keyUsages: (json['KeyUsages'] as List?)
          ?.nonNulls
          .map((e) => KeyUsageName.fromString((e as String)))
          .toList(),
      notAfter: timeStampFromJson(json['NotAfter']),
      notBefore: timeStampFromJson(json['NotBefore']),
      serialNumber: json['SerialNumber'] as String?,
      subject: json['Subject'] != null
          ? DistinguishedName.fromJson(json['Subject'] as Map<String, dynamic>)
          : null,
      subjectAlternativeNames: (json['SubjectAlternativeNames'] as List?)
          ?.nonNulls
          .map((e) => GeneralName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final extendedKeyUsages = this.extendedKeyUsages;
    final issuer = this.issuer;
    final keyAlgorithm = this.keyAlgorithm;
    final keyUsages = this.keyUsages;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final serialNumber = this.serialNumber;
    final subject = this.subject;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    return {
      if (extendedKeyUsages != null)
        'ExtendedKeyUsages': extendedKeyUsages.map((e) => e.value).toList(),
      if (issuer != null) 'Issuer': issuer,
      if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.value,
      if (keyUsages != null)
        'KeyUsages': keyUsages.map((e) => e.value).toList(),
      if (notAfter != null) 'NotAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'NotBefore': unixTimestampToJson(notBefore),
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (subject != null) 'Subject': subject,
      if (subjectAlternativeNames != null)
        'SubjectAlternativeNames': subjectAlternativeNames,
    };
  }
}

/// Contains metadata about a certificate. Currently supports ACM certificate
/// metadata.
///
/// @nodoc
class CertificateMetadata {
  /// Metadata for an ACM certificate.
  final AcmCertificateMetadata? acmCertificateMetadata;

  CertificateMetadata({
    this.acmCertificateMetadata,
  });

  factory CertificateMetadata.fromJson(Map<String, dynamic> json) {
    return CertificateMetadata(
      acmCertificateMetadata: json['AcmCertificateMetadata'] != null
          ? AcmCertificateMetadata.fromJson(
              json['AcmCertificateMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acmCertificateMetadata = this.acmCertificateMetadata;
    return {
      if (acmCertificateMetadata != null)
        'AcmCertificateMetadata': acmCertificateMetadata,
    };
  }
}

/// Contains ACM-specific metadata about a certificate.
///
/// @nodoc
class AcmCertificateMetadata {
  /// The time at which the certificate was requested.
  final DateTime? createdAt;

  /// Indicates whether the certificate can be exported.
  final CertificateExport? exportOption;

  /// Indicates whether the certificate has been exported.
  final bool? exported;

  /// The date and time when the certificate was imported. This value exists only
  /// when the certificate type is <code>IMPORTED</code>.
  final DateTime? importedAt;

  /// Indicates whether the certificate is currently in use by an Amazon Web
  /// Services service.
  final bool? inUse;

  /// The time at which the certificate was issued. This value exists only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  final DateTime? issuedAt;

  /// Identifies the Amazon Web Services service that manages the certificate
  /// issued by ACM.
  final CertificateManagedBy? managedBy;

  /// Specifies whether the certificate is eligible for renewal. At this time,
  /// only exported private certificates can be renewed with the
  /// <a>RenewCertificate</a> command.
  final RenewalEligibility? renewalEligibility;

  /// The renewal status of the certificate.
  final RenewalStatus? renewalStatus;

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

  /// Specifies the domain validation method.
  final ValidationMethod? validationMethod;

  AcmCertificateMetadata({
    this.createdAt,
    this.exportOption,
    this.exported,
    this.importedAt,
    this.inUse,
    this.issuedAt,
    this.managedBy,
    this.renewalEligibility,
    this.renewalStatus,
    this.revokedAt,
    this.status,
    this.type,
    this.validationMethod,
  });

  factory AcmCertificateMetadata.fromJson(Map<String, dynamic> json) {
    return AcmCertificateMetadata(
      createdAt: timeStampFromJson(json['CreatedAt']),
      exportOption:
          (json['ExportOption'] as String?)?.let(CertificateExport.fromString),
      exported: json['Exported'] as bool?,
      importedAt: timeStampFromJson(json['ImportedAt']),
      inUse: json['InUse'] as bool?,
      issuedAt: timeStampFromJson(json['IssuedAt']),
      managedBy:
          (json['ManagedBy'] as String?)?.let(CertificateManagedBy.fromString),
      renewalEligibility: (json['RenewalEligibility'] as String?)
          ?.let(RenewalEligibility.fromString),
      renewalStatus:
          (json['RenewalStatus'] as String?)?.let(RenewalStatus.fromString),
      revokedAt: timeStampFromJson(json['RevokedAt']),
      status: (json['Status'] as String?)?.let(CertificateStatus.fromString),
      type: (json['Type'] as String?)?.let(CertificateType.fromString),
      validationMethod: (json['ValidationMethod'] as String?)
          ?.let(ValidationMethod.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final exportOption = this.exportOption;
    final exported = this.exported;
    final importedAt = this.importedAt;
    final inUse = this.inUse;
    final issuedAt = this.issuedAt;
    final managedBy = this.managedBy;
    final renewalEligibility = this.renewalEligibility;
    final renewalStatus = this.renewalStatus;
    final revokedAt = this.revokedAt;
    final status = this.status;
    final type = this.type;
    final validationMethod = this.validationMethod;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (exportOption != null) 'ExportOption': exportOption.value,
      if (exported != null) 'Exported': exported,
      if (importedAt != null) 'ImportedAt': unixTimestampToJson(importedAt),
      if (inUse != null) 'InUse': inUse,
      if (issuedAt != null) 'IssuedAt': unixTimestampToJson(issuedAt),
      if (managedBy != null) 'ManagedBy': managedBy.value,
      if (renewalEligibility != null)
        'RenewalEligibility': renewalEligibility.value,
      if (renewalStatus != null) 'RenewalStatus': renewalStatus.value,
      if (revokedAt != null) 'RevokedAt': unixTimestampToJson(revokedAt),
      if (status != null) 'Status': status.value,
      if (type != null) 'Type': type.value,
      if (validationMethod != null) 'ValidationMethod': validationMethod.value,
    };
  }
}

/// @nodoc
class RenewalEligibility {
  static const eligible = RenewalEligibility._('ELIGIBLE');
  static const ineligible = RenewalEligibility._('INELIGIBLE');

  final String value;

  const RenewalEligibility._(this.value);

  static const values = [eligible, ineligible];

  static RenewalEligibility fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RenewalEligibility._(value));

  @override
  bool operator ==(other) =>
      other is RenewalEligibility && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CertificateStatus {
  static const pendingValidation = CertificateStatus._('PENDING_VALIDATION');
  static const issued = CertificateStatus._('ISSUED');
  static const inactive = CertificateStatus._('INACTIVE');
  static const expired = CertificateStatus._('EXPIRED');
  static const validationTimedOut = CertificateStatus._('VALIDATION_TIMED_OUT');
  static const revoked = CertificateStatus._('REVOKED');
  static const failed = CertificateStatus._('FAILED');

  final String value;

  const CertificateStatus._(this.value);

  static const values = [
    pendingValidation,
    issued,
    inactive,
    expired,
    validationTimedOut,
    revoked,
    failed
  ];

  static CertificateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateStatus._(value));

  @override
  bool operator ==(other) => other is CertificateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RenewalStatus {
  static const pendingAutoRenewal = RenewalStatus._('PENDING_AUTO_RENEWAL');
  static const pendingValidation = RenewalStatus._('PENDING_VALIDATION');
  static const success = RenewalStatus._('SUCCESS');
  static const failed = RenewalStatus._('FAILED');

  final String value;

  const RenewalStatus._(this.value);

  static const values = [
    pendingAutoRenewal,
    pendingValidation,
    success,
    failed
  ];

  static RenewalStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RenewalStatus._(value));

  @override
  bool operator ==(other) => other is RenewalStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CertificateType {
  static const imported = CertificateType._('IMPORTED');
  static const amazonIssued = CertificateType._('AMAZON_ISSUED');
  static const private = CertificateType._('PRIVATE');

  final String value;

  const CertificateType._(this.value);

  static const values = [imported, amazonIssued, private];

  static CertificateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateType._(value));

  @override
  bool operator ==(other) => other is CertificateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CertificateManagedBy {
  static const cloudfront = CertificateManagedBy._('CLOUDFRONT');

  final String value;

  const CertificateManagedBy._(this.value);

  static const values = [cloudfront];

  static CertificateManagedBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CertificateManagedBy._(value));

  @override
  bool operator ==(other) =>
      other is CertificateManagedBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ValidationMethod {
  static const email = ValidationMethod._('EMAIL');
  static const dns = ValidationMethod._('DNS');
  static const http = ValidationMethod._('HTTP');

  final String value;

  const ValidationMethod._(this.value);

  static const values = [email, dns, http];

  static ValidationMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ValidationMethod._(value));

  @override
  bool operator ==(other) => other is ValidationMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains X.500 distinguished name information.
///
/// @nodoc
class DistinguishedName {
  /// The common name (CN) attribute.
  final String? commonName;

  /// The country (C) attribute.
  final String? country;

  /// A list of custom attributes in the distinguished name. Each custom attribute
  /// contains an object identifier (OID) and its corresponding value.
  final List<CustomAttribute>? customAttributes;

  /// The distinguished name qualifier attribute.
  final String? distinguishedNameQualifier;

  /// The domain component attributes.
  final List<String>? domainComponents;

  /// The generation qualifier attribute.
  final String? generationQualifier;

  /// The given name attribute.
  final String? givenName;

  /// The initials attribute.
  final String? initials;

  /// The locality (L) attribute.
  final String? locality;

  /// The organization (O) attribute.
  final String? organization;

  /// The organizational unit (OU) attribute.
  final String? organizationalUnit;

  /// The pseudonym attribute.
  final String? pseudonym;

  /// The serial number attribute.
  final String? serialNumber;

  /// The state or province (ST) attribute.
  final String? state;

  /// The surname attribute.
  final String? surname;

  /// The title attribute.
  final String? title;

  DistinguishedName({
    this.commonName,
    this.country,
    this.customAttributes,
    this.distinguishedNameQualifier,
    this.domainComponents,
    this.generationQualifier,
    this.givenName,
    this.initials,
    this.locality,
    this.organization,
    this.organizationalUnit,
    this.pseudonym,
    this.serialNumber,
    this.state,
    this.surname,
    this.title,
  });

  factory DistinguishedName.fromJson(Map<String, dynamic> json) {
    return DistinguishedName(
      commonName: json['CommonName'] as String?,
      country: json['Country'] as String?,
      customAttributes: (json['CustomAttributes'] as List?)
          ?.nonNulls
          .map((e) => CustomAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      distinguishedNameQualifier: json['DistinguishedNameQualifier'] as String?,
      domainComponents: (json['DomainComponents'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      generationQualifier: json['GenerationQualifier'] as String?,
      givenName: json['GivenName'] as String?,
      initials: json['Initials'] as String?,
      locality: json['Locality'] as String?,
      organization: json['Organization'] as String?,
      organizationalUnit: json['OrganizationalUnit'] as String?,
      pseudonym: json['Pseudonym'] as String?,
      serialNumber: json['SerialNumber'] as String?,
      state: json['State'] as String?,
      surname: json['Surname'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commonName = this.commonName;
    final country = this.country;
    final customAttributes = this.customAttributes;
    final distinguishedNameQualifier = this.distinguishedNameQualifier;
    final domainComponents = this.domainComponents;
    final generationQualifier = this.generationQualifier;
    final givenName = this.givenName;
    final initials = this.initials;
    final locality = this.locality;
    final organization = this.organization;
    final organizationalUnit = this.organizationalUnit;
    final pseudonym = this.pseudonym;
    final serialNumber = this.serialNumber;
    final state = this.state;
    final surname = this.surname;
    final title = this.title;
    return {
      if (commonName != null) 'CommonName': commonName,
      if (country != null) 'Country': country,
      if (customAttributes != null) 'CustomAttributes': customAttributes,
      if (distinguishedNameQualifier != null)
        'DistinguishedNameQualifier': distinguishedNameQualifier,
      if (domainComponents != null) 'DomainComponents': domainComponents,
      if (generationQualifier != null)
        'GenerationQualifier': generationQualifier,
      if (givenName != null) 'GivenName': givenName,
      if (initials != null) 'Initials': initials,
      if (locality != null) 'Locality': locality,
      if (organization != null) 'Organization': organization,
      if (organizationalUnit != null) 'OrganizationalUnit': organizationalUnit,
      if (pseudonym != null) 'Pseudonym': pseudonym,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (state != null) 'State': state,
      if (surname != null) 'Surname': surname,
      if (title != null) 'Title': title,
    };
  }
}

/// @nodoc
class KeyAlgorithm {
  static const rsa_1024 = KeyAlgorithm._('RSA_1024');
  static const rsa_2048 = KeyAlgorithm._('RSA_2048');
  static const rsa_3072 = KeyAlgorithm._('RSA_3072');
  static const rsa_4096 = KeyAlgorithm._('RSA_4096');
  static const ecPrime256v1 = KeyAlgorithm._('EC_prime256v1');
  static const ecSecp384r1 = KeyAlgorithm._('EC_secp384r1');
  static const ecSecp521r1 = KeyAlgorithm._('EC_secp521r1');

  final String value;

  const KeyAlgorithm._(this.value);

  static const values = [
    rsa_1024,
    rsa_2048,
    rsa_3072,
    rsa_4096,
    ecPrime256v1,
    ecSecp384r1,
    ecSecp521r1
  ];

  static KeyAlgorithm fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => KeyAlgorithm._(value));

  @override
  bool operator ==(other) => other is KeyAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyUsageName {
  static const digitalSignature = KeyUsageName._('DIGITAL_SIGNATURE');
  static const nonRepudiation = KeyUsageName._('NON_REPUDIATION');
  static const keyEncipherment = KeyUsageName._('KEY_ENCIPHERMENT');
  static const dataEncipherment = KeyUsageName._('DATA_ENCIPHERMENT');
  static const keyAgreement = KeyUsageName._('KEY_AGREEMENT');
  static const certificateSigning = KeyUsageName._('CERTIFICATE_SIGNING');
  static const crlSigning = KeyUsageName._('CRL_SIGNING');
  static const encipherOnly = KeyUsageName._('ENCIPHER_ONLY');
  static const decipherOnly = KeyUsageName._('DECIPHER_ONLY');
  static const any = KeyUsageName._('ANY');
  static const custom = KeyUsageName._('CUSTOM');

  final String value;

  const KeyUsageName._(this.value);

  static const values = [
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
    custom
  ];

  static KeyUsageName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => KeyUsageName._(value));

  @override
  bool operator ==(other) => other is KeyUsageName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExtendedKeyUsageName {
  static const tlsWebServerAuthentication =
      ExtendedKeyUsageName._('TLS_WEB_SERVER_AUTHENTICATION');
  static const tlsWebClientAuthentication =
      ExtendedKeyUsageName._('TLS_WEB_CLIENT_AUTHENTICATION');
  static const codeSigning = ExtendedKeyUsageName._('CODE_SIGNING');
  static const emailProtection = ExtendedKeyUsageName._('EMAIL_PROTECTION');
  static const timeStamping = ExtendedKeyUsageName._('TIME_STAMPING');
  static const ocspSigning = ExtendedKeyUsageName._('OCSP_SIGNING');
  static const ipsecEndSystem = ExtendedKeyUsageName._('IPSEC_END_SYSTEM');
  static const ipsecTunnel = ExtendedKeyUsageName._('IPSEC_TUNNEL');
  static const ipsecUser = ExtendedKeyUsageName._('IPSEC_USER');
  static const any = ExtendedKeyUsageName._('ANY');
  static const none = ExtendedKeyUsageName._('NONE');
  static const custom = ExtendedKeyUsageName._('CUSTOM');

  final String value;

  const ExtendedKeyUsageName._(this.value);

  static const values = [
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
    custom
  ];

  static ExtendedKeyUsageName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExtendedKeyUsageName._(value));

  @override
  bool operator ==(other) =>
      other is ExtendedKeyUsageName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes an ASN.1 X.400 <code>GeneralName</code> as defined in <a
/// href="https://datatracker.ietf.org/doc/html/rfc5280">RFC 5280</a>. Only one
/// of the following naming options should be provided.
///
/// @nodoc
class GeneralName {
  /// Contains information about the certificate subject. The <code>Subject</code>
  /// field in the certificate identifies the entity that owns or controls the
  /// public key in the certificate. The entity can be a user, computer, device,
  /// or service. The <code>Subject</code> must contain an X.500 distinguished
  /// name (DN). A DN is a sequence of relative distinguished names (RDNs). The
  /// RDNs are separated by commas in the certificate.
  final DistinguishedName? directoryName;

  /// Represents <code>GeneralName</code> as a DNS name.
  final String? dnsName;

  /// Represents <code>GeneralName</code> as an IPv4 or IPv6 address.
  final String? ipAddress;

  /// Represents <code>GeneralName</code> using an <code>OtherName</code> object.
  final OtherName? otherName;

  /// Represents <code>GeneralName</code> as an object identifier (OID).
  final String? registeredId;

  /// Represents <code>GeneralName</code> as an <a
  /// href="https://datatracker.ietf.org/doc/html/rfc822">RFC 822</a> email
  /// address.
  final String? rfc822Name;

  /// Represents <code>GeneralName</code> as a URI.
  final String? uniformResourceIdentifier;

  GeneralName({
    this.directoryName,
    this.dnsName,
    this.ipAddress,
    this.otherName,
    this.registeredId,
    this.rfc822Name,
    this.uniformResourceIdentifier,
  });

  factory GeneralName.fromJson(Map<String, dynamic> json) {
    return GeneralName(
      directoryName: json['DirectoryName'] != null
          ? DistinguishedName.fromJson(
              json['DirectoryName'] as Map<String, dynamic>)
          : null,
      dnsName: json['DnsName'] as String?,
      ipAddress: json['IpAddress'] as String?,
      otherName: json['OtherName'] != null
          ? OtherName.fromJson(json['OtherName'] as Map<String, dynamic>)
          : null,
      registeredId: json['RegisteredId'] as String?,
      rfc822Name: json['Rfc822Name'] as String?,
      uniformResourceIdentifier: json['UniformResourceIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryName = this.directoryName;
    final dnsName = this.dnsName;
    final ipAddress = this.ipAddress;
    final otherName = this.otherName;
    final registeredId = this.registeredId;
    final rfc822Name = this.rfc822Name;
    final uniformResourceIdentifier = this.uniformResourceIdentifier;
    return {
      if (directoryName != null) 'DirectoryName': directoryName,
      if (dnsName != null) 'DnsName': dnsName,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (otherName != null) 'OtherName': otherName,
      if (registeredId != null) 'RegisteredId': registeredId,
      if (rfc822Name != null) 'Rfc822Name': rfc822Name,
      if (uniformResourceIdentifier != null)
        'UniformResourceIdentifier': uniformResourceIdentifier,
    };
  }
}

/// Defines a custom ASN.1 X.400 <code>GeneralName</code> using an object
/// identifier (OID) and value. For more information, see NIST's definition of
/// <a href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
/// Identifier (OID)</a>.
///
/// @nodoc
class OtherName {
  /// Specifies an OID.
  final String? objectIdentifier;

  /// Specifies an OID value.
  final String? value;

  OtherName({
    this.objectIdentifier,
    this.value,
  });

  factory OtherName.fromJson(Map<String, dynamic> json) {
    return OtherName(
      objectIdentifier: json['ObjectIdentifier'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    final value = this.value;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
      if (value != null) 'Value': value,
    };
  }
}

/// Defines the X.500 relative distinguished name (RDN).
///
/// @nodoc
class CustomAttribute {
  /// Specifies the object identifier (OID) of the attribute type of the relative
  /// distinguished name (RDN).
  final String? objectIdentifier;

  /// Specifies the attribute value of relative distinguished name (RDN).
  final String? value;

  CustomAttribute({
    this.objectIdentifier,
    this.value,
  });

  factory CustomAttribute.fromJson(Map<String, dynamic> json) {
    return CustomAttribute(
      objectIdentifier: json['ObjectIdentifier'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    final value = this.value;
    return {
      if (objectIdentifier != null) 'ObjectIdentifier': objectIdentifier,
      if (value != null) 'Value': value,
    };
  }
}

/// A filter statement used to search for certificates. Can contain AND, OR, NOT
/// logical operators or a single filter.
///
/// @nodoc
class CertificateFilterStatement {
  /// A list of filter statements that must all be true.
  final List<CertificateFilterStatement>? and;

  /// A single certificate filter.
  final CertificateFilter? filter;

  /// A filter statement that must not be true.
  final CertificateFilterStatement? not;

  /// A list of filter statements where at least one must be true.
  final List<CertificateFilterStatement>? or;

  CertificateFilterStatement({
    this.and,
    this.filter,
    this.not,
    this.or,
  });

  Map<String, dynamic> toJson() {
    final and = this.and;
    final filter = this.filter;
    final not = this.not;
    final or = this.or;
    return {
      if (and != null) 'And': and,
      if (filter != null) 'Filter': filter,
      if (not != null) 'Not': not,
      if (or != null) 'Or': or,
    };
  }
}

/// The field to sort search results by.
///
/// @nodoc
class SearchCertificatesSortBy {
  static const createdAt = SearchCertificatesSortBy._('CREATED_AT');
  static const notAfter = SearchCertificatesSortBy._('NOT_AFTER');
  static const status = SearchCertificatesSortBy._('STATUS');
  static const renewalStatus = SearchCertificatesSortBy._('RENEWAL_STATUS');
  static const exported = SearchCertificatesSortBy._('EXPORTED');
  static const inUse = SearchCertificatesSortBy._('IN_USE');
  static const notBefore = SearchCertificatesSortBy._('NOT_BEFORE');
  static const keyAlgorithm = SearchCertificatesSortBy._('KEY_ALGORITHM');
  static const type = SearchCertificatesSortBy._('TYPE');
  static const certificateArn = SearchCertificatesSortBy._('CERTIFICATE_ARN');
  static const commonName = SearchCertificatesSortBy._('COMMON_NAME');
  static const revokedAt = SearchCertificatesSortBy._('REVOKED_AT');
  static const renewalEligibility =
      SearchCertificatesSortBy._('RENEWAL_ELIGIBILITY');
  static const issuedAt = SearchCertificatesSortBy._('ISSUED_AT');
  static const managedBy = SearchCertificatesSortBy._('MANAGED_BY');
  static const exportOption = SearchCertificatesSortBy._('EXPORT_OPTION');
  static const validationMethod =
      SearchCertificatesSortBy._('VALIDATION_METHOD');
  static const importedAt = SearchCertificatesSortBy._('IMPORTED_AT');

  final String value;

  const SearchCertificatesSortBy._(this.value);

  static const values = [
    createdAt,
    notAfter,
    status,
    renewalStatus,
    exported,
    inUse,
    notBefore,
    keyAlgorithm,
    type,
    certificateArn,
    commonName,
    revokedAt,
    renewalEligibility,
    issuedAt,
    managedBy,
    exportOption,
    validationMethod,
    importedAt
  ];

  static SearchCertificatesSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchCertificatesSortBy._(value));

  @override
  bool operator ==(other) =>
      other is SearchCertificatesSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The order to sort search results.
///
/// @nodoc
class SearchCertificatesSortOrder {
  static const ascending = SearchCertificatesSortOrder._('ASCENDING');
  static const descending = SearchCertificatesSortOrder._('DESCENDING');

  final String value;

  const SearchCertificatesSortOrder._(this.value);

  static const values = [ascending, descending];

  static SearchCertificatesSortOrder fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchCertificatesSortOrder._(value));

  @override
  bool operator ==(other) =>
      other is SearchCertificatesSortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines a filter for searching certificates by ARN, X.509 attributes, or ACM
/// metadata.
///
/// @nodoc
class CertificateFilter {
  /// Filter by ACM certificate metadata.
  final AcmCertificateMetadataFilter? acmCertificateMetadataFilter;

  /// Filter by certificate ARN.
  final String? certificateArn;

  /// Filter by X.509 certificate attributes.
  final X509AttributeFilter? x509AttributeFilter;

  CertificateFilter({
    this.acmCertificateMetadataFilter,
    this.certificateArn,
    this.x509AttributeFilter,
  });

  Map<String, dynamic> toJson() {
    final acmCertificateMetadataFilter = this.acmCertificateMetadataFilter;
    final certificateArn = this.certificateArn;
    final x509AttributeFilter = this.x509AttributeFilter;
    return {
      if (acmCertificateMetadataFilter != null)
        'AcmCertificateMetadataFilter': acmCertificateMetadataFilter,
      if (certificateArn != null) 'CertificateArn': certificateArn,
      if (x509AttributeFilter != null)
        'X509AttributeFilter': x509AttributeFilter,
    };
  }
}

/// Filters certificates by X.509 attributes.
///
/// @nodoc
class X509AttributeFilter {
  /// Filter by extended key usage.
  final ExtendedKeyUsageName? extendedKeyUsage;

  /// Filter by key algorithm.
  final KeyAlgorithm? keyAlgorithm;

  /// Filter by key usage.
  final KeyUsageName? keyUsage;

  /// Filter by certificate expiration date. The start date is inclusive.
  final TimestampRange? notAfter;

  /// Filter by certificate validity start date. The start date is inclusive.
  final TimestampRange? notBefore;

  /// Filter by serial number.
  final String? serialNumber;

  /// Filter by certificate subject.
  final SubjectFilter? subject;

  /// Filter by subject alternative names.
  final SubjectAlternativeNameFilter? subjectAlternativeName;

  X509AttributeFilter({
    this.extendedKeyUsage,
    this.keyAlgorithm,
    this.keyUsage,
    this.notAfter,
    this.notBefore,
    this.serialNumber,
    this.subject,
    this.subjectAlternativeName,
  });

  Map<String, dynamic> toJson() {
    final extendedKeyUsage = this.extendedKeyUsage;
    final keyAlgorithm = this.keyAlgorithm;
    final keyUsage = this.keyUsage;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final serialNumber = this.serialNumber;
    final subject = this.subject;
    final subjectAlternativeName = this.subjectAlternativeName;
    return {
      if (extendedKeyUsage != null) 'ExtendedKeyUsage': extendedKeyUsage.value,
      if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.value,
      if (keyUsage != null) 'KeyUsage': keyUsage.value,
      if (notAfter != null) 'NotAfter': notAfter,
      if (notBefore != null) 'NotBefore': notBefore,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (subject != null) 'Subject': subject,
      if (subjectAlternativeName != null)
        'SubjectAlternativeName': subjectAlternativeName,
    };
  }
}

/// Filters certificates by ACM metadata.
///
/// @nodoc
class AcmCertificateMetadataFilter {
  /// Filter by certificate export option.
  final CertificateExport? exportOption;

  /// Filter by whether the certificate has been exported.
  final bool? exported;

  /// Filter by whether the certificate is in use.
  final bool? inUse;

  /// Filter by the entity that manages the certificate.
  final CertificateManagedBy? managedBy;

  /// Filter by certificate renewal status.
  final RenewalStatus? renewalStatus;

  /// Filter by certificate status.
  final CertificateStatus? status;

  /// Filter by certificate type.
  final CertificateType? type;

  /// Filter by validation method.
  final ValidationMethod? validationMethod;

  AcmCertificateMetadataFilter({
    this.exportOption,
    this.exported,
    this.inUse,
    this.managedBy,
    this.renewalStatus,
    this.status,
    this.type,
    this.validationMethod,
  });

  Map<String, dynamic> toJson() {
    final exportOption = this.exportOption;
    final exported = this.exported;
    final inUse = this.inUse;
    final managedBy = this.managedBy;
    final renewalStatus = this.renewalStatus;
    final status = this.status;
    final type = this.type;
    final validationMethod = this.validationMethod;
    return {
      if (exportOption != null) 'ExportOption': exportOption.value,
      if (exported != null) 'Exported': exported,
      if (inUse != null) 'InUse': inUse,
      if (managedBy != null) 'ManagedBy': managedBy.value,
      if (renewalStatus != null) 'RenewalStatus': renewalStatus.value,
      if (status != null) 'Status': status.value,
      if (type != null) 'Type': type.value,
      if (validationMethod != null) 'ValidationMethod': validationMethod.value,
    };
  }
}

/// Filters certificates by subject attributes.
///
/// @nodoc
class SubjectFilter {
  /// Filter by common name in the subject.
  final CommonNameFilter? commonName;

  SubjectFilter({
    this.commonName,
  });

  Map<String, dynamic> toJson() {
    final commonName = this.commonName;
    return {
      if (commonName != null) 'CommonName': commonName,
    };
  }
}

/// Filters certificates by subject alternative name attributes.
///
/// @nodoc
class SubjectAlternativeNameFilter {
  /// Filter by DNS name in subject alternative names.
  final DnsNameFilter? dnsName;

  SubjectAlternativeNameFilter({
    this.dnsName,
  });

  Map<String, dynamic> toJson() {
    final dnsName = this.dnsName;
    return {
      if (dnsName != null) 'DnsName': dnsName,
    };
  }
}

/// Specifies a time range for filtering certificates.
///
/// @nodoc
class TimestampRange {
  /// The end of the time range. This value is inclusive.
  final DateTime? end;

  /// The start of the time range. This value is inclusive.
  final DateTime? start;

  TimestampRange({
    this.end,
    this.start,
  });

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'End': unixTimestampToJson(end),
      if (start != null) 'Start': unixTimestampToJson(start),
    };
  }
}

/// Filters certificates by DNS name.
///
/// @nodoc
class DnsNameFilter {
  /// The comparison operator to use.
  final ComparisonOperator comparisonOperator;

  /// The DNS name value to match against.
  final String value;

  DnsNameFilter({
    required this.comparisonOperator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final value = this.value;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'Value': value,
    };
  }
}

/// The comparison operator to use for string filters. Valid values are
/// <code>CONTAINS</code> and <code>EQUALS</code>.
///
/// @nodoc
class ComparisonOperator {
  static const contains = ComparisonOperator._('CONTAINS');
  static const equals = ComparisonOperator._('EQUALS');

  final String value;

  const ComparisonOperator._(this.value);

  static const values = [contains, equals];

  static ComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is ComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters certificates by common name.
///
/// @nodoc
class CommonNameFilter {
  /// The comparison operator to use.
  final ComparisonOperator comparisonOperator;

  /// The value to match against.
  final String value;

  CommonNameFilter({
    required this.comparisonOperator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final value = this.value;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'Value': value,
    };
  }
}

/// @nodoc
class RevocationReason {
  static const unspecified = RevocationReason._('UNSPECIFIED');
  static const keyCompromise = RevocationReason._('KEY_COMPROMISE');
  static const caCompromise = RevocationReason._('CA_COMPROMISE');
  static const affiliationChanged = RevocationReason._('AFFILIATION_CHANGED');
  static const superceded = RevocationReason._('SUPERCEDED');
  static const superseded = RevocationReason._('SUPERSEDED');
  static const cessationOfOperation =
      RevocationReason._('CESSATION_OF_OPERATION');
  static const certificateHold = RevocationReason._('CERTIFICATE_HOLD');
  static const removeFromCrl = RevocationReason._('REMOVE_FROM_CRL');
  static const privilegeWithdrawn = RevocationReason._('PRIVILEGE_WITHDRAWN');
  static const aACompromise = RevocationReason._('A_A_COMPROMISE');

  final String value;

  const RevocationReason._(this.value);

  static const values = [
    unspecified,
    keyCompromise,
    caCompromise,
    affiliationChanged,
    superceded,
    superseded,
    cessationOfOperation,
    certificateHold,
    removeFromCrl,
    privilegeWithdrawn,
    aACompromise
  ];

  static RevocationReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RevocationReason._(value));

  @override
  bool operator ==(other) => other is RevocationReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A key-value pair that identifies or specifies metadata about an ACM
/// resource.
///
/// @nodoc
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
      key: (json['Key'] as String?) ?? '',
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

/// Contains information about the domain names that you want ACM to use to send
/// you emails that enable you to validate domain ownership.
///
/// @nodoc
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
///
/// @nodoc
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

/// This structure is returned in the response object of <a>ListCertificates</a>
/// action.
///
/// @nodoc
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

  /// Indicates if export is enabled for the certificate.
  final CertificateExport? exportOption;

  /// Indicates whether the certificate has been exported. This value exists only
  /// when the certificate type is <code>PRIVATE</code>.
  final bool? exported;

  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be used
  /// and consists of a name and an object identifier (OID).
  final List<ExtendedKeyUsageName>? extendedKeyUsages;

  /// When called by <a
  /// href="https://docs.aws.amazon.com/acm/latest/APIReference/API_ListCertificates.html">ListCertificates</a>,
  /// indicates whether the full list of subject alternative names has been
  /// included in the response. If false, the response includes all of the subject
  /// alternative names included in the certificate. If true, the response only
  /// includes the first 100 subject alternative names included in the
  /// certificate. To display the full list of subject alternative names, use <a
  /// href="https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html">DescribeCertificate</a>.
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

  /// Identifies the Amazon Web Services service that manages the certificate
  /// issued by ACM.
  final CertificateManagedBy? managedBy;

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
  /// href="https://docs.aws.amazon.com/acm/latest/APIReference/API_ListCertificates.html">ListCertificates</a>,
  /// this parameter will only return the first 100 subject alternative names
  /// included in the certificate. To display the full list of subject alternative
  /// names, use <a
  /// href="https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html">DescribeCertificate</a>.
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
    this.exportOption,
    this.exported,
    this.extendedKeyUsages,
    this.hasAdditionalSubjectAlternativeNames,
    this.importedAt,
    this.inUse,
    this.issuedAt,
    this.keyAlgorithm,
    this.keyUsages,
    this.managedBy,
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
      exportOption:
          (json['ExportOption'] as String?)?.let(CertificateExport.fromString),
      exported: json['Exported'] as bool?,
      extendedKeyUsages: (json['ExtendedKeyUsages'] as List?)
          ?.nonNulls
          .map((e) => ExtendedKeyUsageName.fromString((e as String)))
          .toList(),
      hasAdditionalSubjectAlternativeNames:
          json['HasAdditionalSubjectAlternativeNames'] as bool?,
      importedAt: timeStampFromJson(json['ImportedAt']),
      inUse: json['InUse'] as bool?,
      issuedAt: timeStampFromJson(json['IssuedAt']),
      keyAlgorithm:
          (json['KeyAlgorithm'] as String?)?.let(KeyAlgorithm.fromString),
      keyUsages: (json['KeyUsages'] as List?)
          ?.nonNulls
          .map((e) => KeyUsageName.fromString((e as String)))
          .toList(),
      managedBy:
          (json['ManagedBy'] as String?)?.let(CertificateManagedBy.fromString),
      notAfter: timeStampFromJson(json['NotAfter']),
      notBefore: timeStampFromJson(json['NotBefore']),
      renewalEligibility: (json['RenewalEligibility'] as String?)
          ?.let(RenewalEligibility.fromString),
      revokedAt: timeStampFromJson(json['RevokedAt']),
      status: (json['Status'] as String?)?.let(CertificateStatus.fromString),
      subjectAlternativeNameSummaries:
          (json['SubjectAlternativeNameSummaries'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      type: (json['Type'] as String?)?.let(CertificateType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final exportOption = this.exportOption;
    final exported = this.exported;
    final extendedKeyUsages = this.extendedKeyUsages;
    final hasAdditionalSubjectAlternativeNames =
        this.hasAdditionalSubjectAlternativeNames;
    final importedAt = this.importedAt;
    final inUse = this.inUse;
    final issuedAt = this.issuedAt;
    final keyAlgorithm = this.keyAlgorithm;
    final keyUsages = this.keyUsages;
    final managedBy = this.managedBy;
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
      if (exportOption != null) 'ExportOption': exportOption.value,
      if (exported != null) 'Exported': exported,
      if (extendedKeyUsages != null)
        'ExtendedKeyUsages': extendedKeyUsages.map((e) => e.value).toList(),
      if (hasAdditionalSubjectAlternativeNames != null)
        'HasAdditionalSubjectAlternativeNames':
            hasAdditionalSubjectAlternativeNames,
      if (importedAt != null) 'ImportedAt': unixTimestampToJson(importedAt),
      if (inUse != null) 'InUse': inUse,
      if (issuedAt != null) 'IssuedAt': unixTimestampToJson(issuedAt),
      if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.value,
      if (keyUsages != null)
        'KeyUsages': keyUsages.map((e) => e.value).toList(),
      if (managedBy != null) 'ManagedBy': managedBy.value,
      if (notAfter != null) 'NotAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'NotBefore': unixTimestampToJson(notBefore),
      if (renewalEligibility != null)
        'RenewalEligibility': renewalEligibility.value,
      if (revokedAt != null) 'RevokedAt': unixTimestampToJson(revokedAt),
      if (status != null) 'Status': status.value,
      if (subjectAlternativeNameSummaries != null)
        'SubjectAlternativeNameSummaries': subjectAlternativeNameSummaries,
      if (type != null) 'Type': type.value,
    };
  }
}

/// This structure can be used in the <a>ListCertificates</a> action to filter
/// the output of the certificate list.
///
/// @nodoc
class Filters {
  /// Specify <code>ENABLED</code> or <code>DISABLED</code> to identify
  /// certificates that can be exported.
  final CertificateExport? exportOption;

  /// Specify one or more <a>ExtendedKeyUsage</a> extension values.
  final List<ExtendedKeyUsageName>? extendedKeyUsage;

  /// Specify one or more algorithms that can be used to generate key pairs.
  ///
  /// Default filtering returns only <code>RSA_1024</code> and
  /// <code>RSA_2048</code> certificates that have at least one domain. To return
  /// other certificate types, provide the desired type signatures in a
  /// comma-separated list. For example, <code>"keyTypes":
  /// \["RSA_2048","RSA_4096"\]</code> returns both <code>RSA_2048</code> and
  /// <code>RSA_4096</code> certificates.
  final List<KeyAlgorithm>? keyTypes;

  /// Specify one or more <a>KeyUsage</a> extension values.
  final List<KeyUsageName>? keyUsage;

  /// Identifies the Amazon Web Services service that manages the certificate
  /// issued by ACM.
  final CertificateManagedBy? managedBy;

  Filters({
    this.exportOption,
    this.extendedKeyUsage,
    this.keyTypes,
    this.keyUsage,
    this.managedBy,
  });

  Map<String, dynamic> toJson() {
    final exportOption = this.exportOption;
    final extendedKeyUsage = this.extendedKeyUsage;
    final keyTypes = this.keyTypes;
    final keyUsage = this.keyUsage;
    final managedBy = this.managedBy;
    return {
      if (exportOption != null) 'exportOption': exportOption.value,
      if (extendedKeyUsage != null)
        'extendedKeyUsage': extendedKeyUsage.map((e) => e.value).toList(),
      if (keyTypes != null) 'keyTypes': keyTypes.map((e) => e.value).toList(),
      if (keyUsage != null) 'keyUsage': keyUsage.map((e) => e.value).toList(),
      if (managedBy != null) 'managedBy': managedBy.value,
    };
  }
}

/// @nodoc
class SortBy {
  static const createdAt = SortBy._('CREATED_AT');

  final String value;

  const SortBy._(this.value);

  static const values = [createdAt];

  static SortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => SortBy._(value));

  @override
  bool operator ==(other) => other is SortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortOrder {
  static const ascending = SortOrder._('ASCENDING');
  static const descending = SortOrder._('DESCENDING');

  final String value;

  const SortOrder._(this.value);

  static const values = [ascending, descending];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metadata about an ACM certificate. This structure is returned in
/// the response to a <a>DescribeCertificate</a> request.
///
/// @nodoc
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

  /// Identifies the Amazon Web Services service that manages the certificate
  /// issued by ACM.
  final CertificateManagedBy? managedBy;

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
    this.managedBy,
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
          ?.nonNulls
          .map((e) => DomainValidation.fromJson(e as Map<String, dynamic>))
          .toList(),
      extendedKeyUsages: (json['ExtendedKeyUsages'] as List?)
          ?.nonNulls
          .map((e) => ExtendedKeyUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureReason:
          (json['FailureReason'] as String?)?.let(FailureReason.fromString),
      importedAt: timeStampFromJson(json['ImportedAt']),
      inUseBy:
          (json['InUseBy'] as List?)?.nonNulls.map((e) => e as String).toList(),
      issuedAt: timeStampFromJson(json['IssuedAt']),
      issuer: json['Issuer'] as String?,
      keyAlgorithm:
          (json['KeyAlgorithm'] as String?)?.let(KeyAlgorithm.fromString),
      keyUsages: (json['KeyUsages'] as List?)
          ?.nonNulls
          .map((e) => KeyUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedBy:
          (json['ManagedBy'] as String?)?.let(CertificateManagedBy.fromString),
      notAfter: timeStampFromJson(json['NotAfter']),
      notBefore: timeStampFromJson(json['NotBefore']),
      options: json['Options'] != null
          ? CertificateOptions.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      renewalEligibility: (json['RenewalEligibility'] as String?)
          ?.let(RenewalEligibility.fromString),
      renewalSummary: json['RenewalSummary'] != null
          ? RenewalSummary.fromJson(
              json['RenewalSummary'] as Map<String, dynamic>)
          : null,
      revocationReason: (json['RevocationReason'] as String?)
          ?.let(RevocationReason.fromString),
      revokedAt: timeStampFromJson(json['RevokedAt']),
      serial: json['Serial'] as String?,
      signatureAlgorithm: json['SignatureAlgorithm'] as String?,
      status: (json['Status'] as String?)?.let(CertificateStatus.fromString),
      subject: json['Subject'] as String?,
      subjectAlternativeNames: (json['SubjectAlternativeNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type: (json['Type'] as String?)?.let(CertificateType.fromString),
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
    final managedBy = this.managedBy;
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
      if (failureReason != null) 'FailureReason': failureReason.value,
      if (importedAt != null) 'ImportedAt': unixTimestampToJson(importedAt),
      if (inUseBy != null) 'InUseBy': inUseBy,
      if (issuedAt != null) 'IssuedAt': unixTimestampToJson(issuedAt),
      if (issuer != null) 'Issuer': issuer,
      if (keyAlgorithm != null) 'KeyAlgorithm': keyAlgorithm.value,
      if (keyUsages != null) 'KeyUsages': keyUsages,
      if (managedBy != null) 'ManagedBy': managedBy.value,
      if (notAfter != null) 'NotAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'NotBefore': unixTimestampToJson(notBefore),
      if (options != null) 'Options': options,
      if (renewalEligibility != null)
        'RenewalEligibility': renewalEligibility.value,
      if (renewalSummary != null) 'RenewalSummary': renewalSummary,
      if (revocationReason != null) 'RevocationReason': revocationReason.value,
      if (revokedAt != null) 'RevokedAt': unixTimestampToJson(revokedAt),
      if (serial != null) 'Serial': serial,
      if (signatureAlgorithm != null) 'SignatureAlgorithm': signatureAlgorithm,
      if (status != null) 'Status': status.value,
      if (subject != null) 'Subject': subject,
      if (subjectAlternativeNames != null)
        'SubjectAlternativeNames': subjectAlternativeNames,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class FailureReason {
  static const noAvailableContacts = FailureReason._('NO_AVAILABLE_CONTACTS');
  static const additionalVerificationRequired =
      FailureReason._('ADDITIONAL_VERIFICATION_REQUIRED');
  static const domainNotAllowed = FailureReason._('DOMAIN_NOT_ALLOWED');
  static const invalidPublicDomain = FailureReason._('INVALID_PUBLIC_DOMAIN');
  static const domainValidationDenied =
      FailureReason._('DOMAIN_VALIDATION_DENIED');
  static const caaError = FailureReason._('CAA_ERROR');
  static const pcaLimitExceeded = FailureReason._('PCA_LIMIT_EXCEEDED');
  static const pcaInvalidArn = FailureReason._('PCA_INVALID_ARN');
  static const pcaInvalidState = FailureReason._('PCA_INVALID_STATE');
  static const pcaRequestFailed = FailureReason._('PCA_REQUEST_FAILED');
  static const pcaNameConstraintsValidation =
      FailureReason._('PCA_NAME_CONSTRAINTS_VALIDATION');
  static const pcaResourceNotFound = FailureReason._('PCA_RESOURCE_NOT_FOUND');
  static const pcaInvalidArgs = FailureReason._('PCA_INVALID_ARGS');
  static const pcaInvalidDuration = FailureReason._('PCA_INVALID_DURATION');
  static const pcaAccessDenied = FailureReason._('PCA_ACCESS_DENIED');
  static const slrNotFound = FailureReason._('SLR_NOT_FOUND');
  static const other = FailureReason._('OTHER');

  final String value;

  const FailureReason._(this.value);

  static const values = [
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
    other
  ];

  static FailureReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FailureReason._(value));

  @override
  bool operator ==(other) => other is FailureReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the status of ACM's <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
/// renewal</a> for the certificate. This structure exists only when the
/// certificate type is <code>AMAZON_ISSUED</code>.
///
/// @nodoc
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
      domainValidationOptions:
          ((json['DomainValidationOptions'] as List?) ?? const [])
              .nonNulls
              .map((e) => DomainValidation.fromJson(e as Map<String, dynamic>))
              .toList(),
      renewalStatus:
          RenewalStatus.fromString((json['RenewalStatus'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] ?? 0),
      renewalStatusReason: (json['RenewalStatusReason'] as String?)
          ?.let(FailureReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final domainValidationOptions = this.domainValidationOptions;
    final renewalStatus = this.renewalStatus;
    final updatedAt = this.updatedAt;
    final renewalStatusReason = this.renewalStatusReason;
    return {
      'DomainValidationOptions': domainValidationOptions,
      'RenewalStatus': renewalStatus.value,
      'UpdatedAt': unixTimestampToJson(updatedAt),
      if (renewalStatusReason != null)
        'RenewalStatusReason': renewalStatusReason.value,
    };
  }
}

/// The Extended Key Usage X.509 v3 extension defines one or more purposes for
/// which the public key can be used. This is in addition to or in place of the
/// basic purposes specified by the Key Usage extension.
///
/// @nodoc
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
      name: (json['Name'] as String?)?.let(ExtendedKeyUsageName.fromString),
      oid: json['OID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final oid = this.oid;
    return {
      if (name != null) 'Name': name.value,
      if (oid != null) 'OID': oid,
    };
  }
}

/// The Key Usage X.509 v3 extension defines the purpose of the public key
/// contained in the certificate.
///
/// @nodoc
class KeyUsage {
  /// A string value that contains a Key Usage extension name.
  final KeyUsageName? name;

  KeyUsage({
    this.name,
  });

  factory KeyUsage.fromJson(Map<String, dynamic> json) {
    return KeyUsage(
      name: (json['Name'] as String?)?.let(KeyUsageName.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name.value,
    };
  }
}

/// Contains information about the validation of each domain name in the
/// certificate.
///
/// @nodoc
class DomainValidation {
  /// A fully qualified domain name (FQDN) in the certificate. For example,
  /// <code>www.example.com</code> or <code>example.com</code>.
  final String domainName;

  /// Contains information for HTTP-based domain validation of certificates
  /// requested through Amazon CloudFront and issued by ACM. This field exists
  /// only when the certificate type is <code>AMAZON_ISSUED</code> and the
  /// validation method is <code>HTTP</code>.
  final HttpRedirect? httpRedirect;

  /// Contains the CNAME record that you add to your DNS database for domain
  /// validation. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html">Use
  /// DNS to Validate Domain Ownership</a>.
  /// <note>
  /// The CNAME information that you need does not include the name of your
  /// domain. If you include your domain name in the DNS database CNAME record,
  /// validation fails. For example, if the name is
  /// <code>_a79865eb4cd1a6ab990a45779b4e0b96.yourdomain.com</code>, only
  /// <code>_a79865eb4cd1a6ab990a45779b4e0b96</code> must be used.
  /// </note>
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
    this.httpRedirect,
    this.resourceRecord,
    this.validationDomain,
    this.validationEmails,
    this.validationMethod,
    this.validationStatus,
  });

  factory DomainValidation.fromJson(Map<String, dynamic> json) {
    return DomainValidation(
      domainName: (json['DomainName'] as String?) ?? '',
      httpRedirect: json['HttpRedirect'] != null
          ? HttpRedirect.fromJson(json['HttpRedirect'] as Map<String, dynamic>)
          : null,
      resourceRecord: json['ResourceRecord'] != null
          ? ResourceRecord.fromJson(
              json['ResourceRecord'] as Map<String, dynamic>)
          : null,
      validationDomain: json['ValidationDomain'] as String?,
      validationEmails: (json['ValidationEmails'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      validationMethod: (json['ValidationMethod'] as String?)
          ?.let(ValidationMethod.fromString),
      validationStatus:
          (json['ValidationStatus'] as String?)?.let(DomainStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final httpRedirect = this.httpRedirect;
    final resourceRecord = this.resourceRecord;
    final validationDomain = this.validationDomain;
    final validationEmails = this.validationEmails;
    final validationMethod = this.validationMethod;
    final validationStatus = this.validationStatus;
    return {
      'DomainName': domainName,
      if (httpRedirect != null) 'HttpRedirect': httpRedirect,
      if (resourceRecord != null) 'ResourceRecord': resourceRecord,
      if (validationDomain != null) 'ValidationDomain': validationDomain,
      if (validationEmails != null) 'ValidationEmails': validationEmails,
      if (validationMethod != null) 'ValidationMethod': validationMethod.value,
      if (validationStatus != null) 'ValidationStatus': validationStatus.value,
    };
  }
}

/// @nodoc
class DomainStatus {
  static const pendingValidation = DomainStatus._('PENDING_VALIDATION');
  static const success = DomainStatus._('SUCCESS');
  static const failed = DomainStatus._('FAILED');

  final String value;

  const DomainStatus._(this.value);

  static const values = [pendingValidation, success, failed];

  static DomainStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DomainStatus._(value));

  @override
  bool operator ==(other) => other is DomainStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains a DNS record value that you can use to validate ownership or
/// control of a domain. This is used by the <a>DescribeCertificate</a> action.
///
/// @nodoc
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
      name: (json['Name'] as String?) ?? '',
      type: RecordType.fromString((json['Type'] as String?) ?? ''),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      'Name': name,
      'Type': type.value,
      'Value': value,
    };
  }
}

/// Contains information for HTTP-based domain validation of certificates
/// requested through Amazon CloudFront and issued by ACM. This field exists
/// only when the certificate type is <code>AMAZON_ISSUED</code> and the
/// validation method is <code>HTTP</code>.
///
/// @nodoc
class HttpRedirect {
  /// The URL including the domain to be validated. The certificate authority
  /// sends <code>GET</code> requests here during validation.
  final String? redirectFrom;

  /// The URL hosting the validation token. <code>RedirectFrom</code> must return
  /// this content or redirect here.
  final String? redirectTo;

  HttpRedirect({
    this.redirectFrom,
    this.redirectTo,
  });

  factory HttpRedirect.fromJson(Map<String, dynamic> json) {
    return HttpRedirect(
      redirectFrom: json['RedirectFrom'] as String?,
      redirectTo: json['RedirectTo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final redirectFrom = this.redirectFrom;
    final redirectTo = this.redirectTo;
    return {
      if (redirectFrom != null) 'RedirectFrom': redirectFrom,
      if (redirectTo != null) 'RedirectTo': redirectTo,
    };
  }
}

/// @nodoc
class RecordType {
  static const cname = RecordType._('CNAME');

  final String value;

  const RecordType._(this.value);

  static const values = [cname];

  static RecordType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RecordType._(value));

  @override
  bool operator ==(other) => other is RecordType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InvalidArgsException extends _s.GenericAwsException {
  InvalidArgsException({String? type, String? message})
      : super(type: type, code: 'InvalidArgsException', message: message);
}

/// @nodoc
class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String? type, String? message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

/// @nodoc
class InvalidDomainValidationOptionsException extends _s.GenericAwsException {
  InvalidDomainValidationOptionsException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDomainValidationOptionsException',
            message: message);
}

/// @nodoc
class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

/// @nodoc
class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

/// @nodoc
class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String? type, String? message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

/// @nodoc
class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

/// @nodoc
class RequestInProgressException extends _s.GenericAwsException {
  RequestInProgressException({String? type, String? message})
      : super(type: type, code: 'RequestInProgressException', message: message);
}

/// @nodoc
class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String? type, String? message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

/// @nodoc
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
