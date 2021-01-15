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

part '2015-12-08.g.dart';

/// Welcome to the AWS Certificate Manager (ACM) API documentation.
class Acm {
  final _s.JsonProtocol _protocol;
  Acm({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'acm',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds one or more tags to an ACM certificate. Tags are labels that you can
  /// use to identify and organize your AWS resources. Each tag consists of a
  /// <code>key</code> and an optional <code>value</code>. You specify the
  /// certificate on input by its Amazon Resource Name (ARN). You specify the
  /// tag by using a key-value pair.
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
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the ACM certificate to which the tag is to
  /// be applied. This must be of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pair that defines the tag. The tag value is optional.
  Future<void> addTagsToCertificate({
    @_s.required String certificateArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.AddTagsToCertificate'
    };
    final jsonResponse = await _protocol.send(
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
  /// available for use by AWS services integrated with ACM.
  /// <note>
  /// You cannot delete an ACM certificate that is being used by another AWS
  /// service. To delete a certificate that is in use, the certificate
  /// association must first be removed.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<void> deleteCertificate({
    @_s.required String certificateArn,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.DeleteCertificate'
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
  }

  /// Returns detailed metadata about the specified ACM certificate.
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<DescribeCertificateResponse> describeCertificate({
    @_s.required String certificateArn,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
  /// Passphrase to associate with the encrypted exported private key. If you
  /// want to later decrypt the private key, you must have the passphrase. You
  /// can use the following OpenSSL command to decrypt a private key:
  ///
  /// <code>openssl rsa -in encrypted_key.pem -out decrypted_key.pem</code>
  Future<ExportCertificateResponse> exportCertificate({
    @_s.required String certificateArn,
    @_s.required Uint8List passphrase,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(passphrase, 'passphrase');
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
        'Passphrase': passphrase?.let(base64Encode),
      },
    );

    return ExportCertificateResponse.fromJson(jsonResponse.body);
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<GetCertificateResponse> getCertificate({
    @_s.required String certificateArn,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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

  /// Imports a certificate into AWS Certificate Manager (ACM) to use with
  /// services that are integrated with ACM. Note that <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-services.html">integrated
  /// services</a> allow only certificate types and keys they support to be
  /// associated with their resources. Further, their support differs depending
  /// on whether the certificate is imported into IAM or into ACM. For more
  /// information, see the documentation for each service. For more information
  /// about importing certificates into ACM, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// Certificates</a> in the <i>AWS Certificate Manager User Guide</i>.
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
  /// imported certifica
  /// </li>
  /// <li>
  /// When you import a certificate by using the CLI, you must specify the
  /// certificate, the certificate chain, and the private key by their file
  /// names preceded by <code>file://</code>. For example, you can specify a
  /// certificate saved in the <code>C:\temp</code> folder as
  /// <code>file://C:\temp\certificate_to_import.pem</code>. If you are making
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
    @_s.required Uint8List certificate,
    @_s.required Uint8List privateKey,
    String certificateArn,
    Uint8List certificateChain,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(certificate, 'certificate');
    ArgumentError.checkNotNull(privateKey, 'privateKey');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
    );
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
        'Certificate': certificate?.let(base64Encode),
        'PrivateKey': privateKey?.let(base64Encode),
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
  Future<ListCertificatesResponse> listCertificates({
    List<CertificateStatus> certificateStatuses,
    Filters includes,
    int maxItems,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      10000,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]*''',
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
              certificateStatuses.map((e) => e?.toValue() ?? '').toList(),
        if (includes != null) 'Includes': includes,
        if (maxItems != null) 'MaxItems': maxItems,
        if (nextToken != null) 'NextToken': nextToken,
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<ListTagsForCertificateResponse> listTagsForCertificate({
    @_s.required String certificateArn,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
  ///
  /// Parameter [certificateArn] :
  /// String that contains the ARN of the ACM Certificate with one or more tags
  /// that you want to remove. This must be of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Parameter [tags] :
  /// The key-value pair that defines the tag to remove.
  Future<void> removeTagsFromCertificate({
    @_s.required String certificateArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.RemoveTagsFromCertificate'
    };
    final jsonResponse = await _protocol.send(
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

  /// Renews an eligable ACM certificate. At this time, only exported private
  /// certificates can be renewed with this operation. In order to renew your
  /// ACM PCA certificates with ACM, you must first <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaPermissions.html">grant
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
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<void> renewCertificate({
    @_s.required String certificateArn,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.RenewCertificate'
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
  }

  /// Requests an ACM certificate for use with other AWS services. To request an
  /// ACM certificate, you must specify a fully qualified domain name (FQDN) in
  /// the <code>DomainName</code> parameter. You can also specify additional
  /// FQDNs in the <code>SubjectAlternativeNames</code> parameter.
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
  /// The first domain name you enter cannot exceed 64 octets, including
  /// periods. Each subsequent Subject Alternative Name (SAN), however, can be
  /// up to 253 octets in length.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the private certificate authority (CA)
  /// that will be used to issue the certificate. If you do not provide an ARN
  /// and you are trying to request a private certificate, ACM will attempt to
  /// issue a public certificate. For more information about private CAs, see
  /// the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaWelcome.html">AWS
  /// Certificate Manager Private Certificate Authority (PCA)</a> user guide.
  /// The ARN must have the following form:
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
    @_s.required String domainName,
    String certificateAuthorityArn,
    List<DomainValidationOption> domainValidationOptions,
    String idempotencyToken,
    CertificateOptions options,
    List<String> subjectAlternativeNames,
    List<Tag> tags,
    ValidationMethod validationMethod,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^(\*\.)?(((?!-)[A-Za-z0-9-]{0,62}[A-Za-z0-9])\.)+((?!-)[A-Za-z0-9-]{1,62}[A-Za-z0-9])$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
    );
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      32,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''\w+''',
    );
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
    @_s.required String certificateArn,
    @_s.required String domain,
    @_s.required String validationDomain,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domain',
      domain,
      r'''^(\*\.)?(((?!-)[A-Za-z0-9-]{0,62}[A-Za-z0-9])\.)+((?!-)[A-Za-z0-9-]{1,62}[A-Za-z0-9])$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(validationDomain, 'validationDomain');
    _s.validateStringLength(
      'validationDomain',
      validationDomain,
      1,
      253,
      isRequired: true,
    );
    _s.validateStringPattern(
      'validationDomain',
      validationDomain,
      r'''^(\*\.)?(((?!-)[A-Za-z0-9-]{0,62}[A-Za-z0-9])\.)+((?!-)[A-Za-z0-9-]{1,62}[A-Za-z0-9])$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.ResendValidationEmail'
    };
    final jsonResponse = await _protocol.send(
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
    @_s.required String certificateArn,
    @_s.required CertificateOptions options,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]+:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(options, 'options');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'CertificateManager.UpdateCertificateOptions'
    };
    final jsonResponse = await _protocol.send(
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CertificateDetail {
  /// The Amazon Resource Name (ARN) of the certificate. For more information
  /// about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a> in the <i>AWS General
  /// Reference</i>.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// The Amazon Resource Name (ARN) of the ACM PCA private certificate authority
  /// (CA) that issued the certificate. This has the following format:
  ///
  /// <code>arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012</code>
  @_s.JsonKey(name: 'CertificateAuthorityArn')
  final String certificateAuthorityArn;

  /// The time at which the certificate was requested. This value exists only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The fully qualified domain name for the certificate, such as www.example.com
  /// or example.com.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// Contains information about the initial validation of each domain name that
  /// occurs as a result of the <a>RequestCertificate</a> request. This field
  /// exists only when the certificate type is <code>AMAZON_ISSUED</code>.
  @_s.JsonKey(name: 'DomainValidationOptions')
  final List<DomainValidation> domainValidationOptions;

  /// Contains a list of Extended Key Usage X.509 v3 extension objects. Each
  /// object specifies a purpose for which the certificate public key can be used
  /// and consists of a name and an object identifier (OID).
  @_s.JsonKey(name: 'ExtendedKeyUsages')
  final List<ExtendedKeyUsage> extendedKeyUsages;

  /// The reason the certificate request failed. This value exists only when the
  /// certificate status is <code>FAILED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/troubleshooting.html#troubleshooting-failed">Certificate
  /// Request Failed</a> in the <i>AWS Certificate Manager User Guide</i>.
  @_s.JsonKey(name: 'FailureReason')
  final FailureReason failureReason;

  /// The date and time at which the certificate was imported. This value exists
  /// only when the certificate type is <code>IMPORTED</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ImportedAt')
  final DateTime importedAt;

  /// A list of ARNs for the AWS resources that are using the certificate. A
  /// certificate can be used by multiple AWS resources.
  @_s.JsonKey(name: 'InUseBy')
  final List<String> inUseBy;

  /// The time at which the certificate was issued. This value exists only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'IssuedAt')
  final DateTime issuedAt;

  /// The name of the certificate authority that issued and signed the
  /// certificate.
  @_s.JsonKey(name: 'Issuer')
  final String issuer;

  /// The algorithm that was used to generate the public-private key pair.
  @_s.JsonKey(name: 'KeyAlgorithm')
  final KeyAlgorithm keyAlgorithm;

  /// A list of Key Usage X.509 v3 extension objects. Each object is a string
  /// value that identifies the purpose of the public key contained in the
  /// certificate. Possible extension values include DIGITAL_SIGNATURE,
  /// KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
  @_s.JsonKey(name: 'KeyUsages')
  final List<KeyUsage> keyUsages;

  /// The time after which the certificate is not valid.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'NotAfter')
  final DateTime notAfter;

  /// The time before which the certificate is not valid.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'NotBefore')
  final DateTime notBefore;

  /// Value that specifies whether to add the certificate to a transparency log.
  /// Certificate transparency makes it possible to detect SSL certificates that
  /// have been mistakenly or maliciously issued. A browser might respond to
  /// certificate that has not been logged by showing an error message. The logs
  /// are cryptographically secure.
  @_s.JsonKey(name: 'Options')
  final CertificateOptions options;

  /// Specifies whether the certificate is eligible for renewal. At this time,
  /// only exported private certificates can be renewed with the
  /// <a>RenewCertificate</a> command.
  @_s.JsonKey(name: 'RenewalEligibility')
  final RenewalEligibility renewalEligibility;

  /// Contains information about the status of ACM's <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> for the certificate. This field exists only when the certificate
  /// type is <code>AMAZON_ISSUED</code>.
  @_s.JsonKey(name: 'RenewalSummary')
  final RenewalSummary renewalSummary;

  /// The reason the certificate was revoked. This value exists only when the
  /// certificate status is <code>REVOKED</code>.
  @_s.JsonKey(name: 'RevocationReason')
  final RevocationReason revocationReason;

  /// The time at which the certificate was revoked. This value exists only when
  /// the certificate status is <code>REVOKED</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RevokedAt')
  final DateTime revokedAt;

  /// The serial number of the certificate.
  @_s.JsonKey(name: 'Serial')
  final String serial;

  /// The algorithm that was used to sign the certificate.
  @_s.JsonKey(name: 'SignatureAlgorithm')
  final String signatureAlgorithm;

  /// The status of the certificate.
  @_s.JsonKey(name: 'Status')
  final CertificateStatus status;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  /// One or more domain names (subject alternative names) included in the
  /// certificate. This list contains the domain names that are bound to the
  /// public key that is contained in the certificate. The subject alternative
  /// names include the canonical domain name (CN) of the certificate and
  /// additional domain names that can be used to connect to the website.
  @_s.JsonKey(name: 'SubjectAlternativeNames')
  final List<String> subjectAlternativeNames;

  /// The source of the certificate. For certificates provided by ACM, this value
  /// is <code>AMAZON_ISSUED</code>. For certificates that you imported with
  /// <a>ImportCertificate</a>, this value is <code>IMPORTED</code>. ACM does not
  /// provide <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> for imported certificates. For more information about the
  /// differences between certificates that you import and those that ACM
  /// provides, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
  /// Certificates</a> in the <i>AWS Certificate Manager User Guide</i>.
  @_s.JsonKey(name: 'Type')
  final CertificateType type;

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
  factory CertificateDetail.fromJson(Map<String, dynamic> json) =>
      _$CertificateDetailFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CertificateOptions {
  /// You can opt out of certificate transparency logging by specifying the
  /// <code>DISABLED</code> option. Opt in by specifying <code>ENABLED</code>.
  @_s.JsonKey(name: 'CertificateTransparencyLoggingPreference')
  final CertificateTransparencyLoggingPreference
      certificateTransparencyLoggingPreference;

  CertificateOptions({
    this.certificateTransparencyLoggingPreference,
  });
  factory CertificateOptions.fromJson(Map<String, dynamic> json) =>
      _$CertificateOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateOptionsToJson(this);
}

enum CertificateStatus {
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('ISSUED')
  issued,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('VALIDATION_TIMED_OUT')
  validationTimedOut,
  @_s.JsonValue('REVOKED')
  revoked,
  @_s.JsonValue('FAILED')
  failed,
}

extension on CertificateStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// This structure is returned in the response object of <a>ListCertificates</a>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CertificateSummary {
  /// Amazon Resource Name (ARN) of the certificate. This is of the form:
  ///
  /// <code>arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  ///
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// Fully qualified domain name (FQDN), such as www.example.com or example.com,
  /// for the certificate.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  CertificateSummary({
    this.certificateArn,
    this.domainName,
  });
  factory CertificateSummary.fromJson(Map<String, dynamic> json) =>
      _$CertificateSummaryFromJson(json);
}

enum CertificateTransparencyLoggingPreference {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

enum CertificateType {
  @_s.JsonValue('IMPORTED')
  imported,
  @_s.JsonValue('AMAZON_ISSUED')
  amazonIssued,
  @_s.JsonValue('PRIVATE')
  private,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCertificateResponse {
  /// Metadata about an ACM certificate.
  @_s.JsonKey(name: 'Certificate')
  final CertificateDetail certificate;

  DescribeCertificateResponse({
    this.certificate,
  });
  factory DescribeCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCertificateResponseFromJson(json);
}

enum DomainStatus {
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains information about the validation of each domain name in the
/// certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainValidation {
  /// A fully qualified domain name (FQDN) in the certificate. For example,
  /// <code>www.example.com</code> or <code>example.com</code>.
  @_s.JsonKey(name: 'DomainName')
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
  @_s.JsonKey(name: 'ResourceRecord')
  final ResourceRecord resourceRecord;

  /// The domain name that ACM used to send domain validation emails.
  @_s.JsonKey(name: 'ValidationDomain')
  final String validationDomain;

  /// A list of email addresses that ACM used to send domain validation emails.
  @_s.JsonKey(name: 'ValidationEmails')
  final List<String> validationEmails;

  /// Specifies the domain validation method.
  @_s.JsonKey(name: 'ValidationMethod')
  final ValidationMethod validationMethod;

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
  @_s.JsonKey(name: 'ValidationStatus')
  final DomainStatus validationStatus;

  DomainValidation({
    @_s.required this.domainName,
    this.resourceRecord,
    this.validationDomain,
    this.validationEmails,
    this.validationMethod,
    this.validationStatus,
  });
  factory DomainValidation.fromJson(Map<String, dynamic> json) =>
      _$DomainValidationFromJson(json);
}

/// Contains information about the domain names that you want ACM to use to send
/// you emails that enable you to validate domain ownership.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DomainValidationOption {
  /// A fully qualified domain name (FQDN) in the certificate request.
  @_s.JsonKey(name: 'DomainName')
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
  @_s.JsonKey(name: 'ValidationDomain')
  final String validationDomain;

  DomainValidationOption({
    @_s.required this.domainName,
    @_s.required this.validationDomain,
  });
  Map<String, dynamic> toJson() => _$DomainValidationOptionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportCertificateResponse {
  /// The base64 PEM-encoded certificate.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The base64 PEM-encoded certificate chain. This does not include the
  /// certificate that you are exporting.
  @_s.JsonKey(name: 'CertificateChain')
  final String certificateChain;

  /// The encrypted private key associated with the public key in the certificate.
  /// The key is output in PKCS #8 format and is base64 PEM-encoded.
  @_s.JsonKey(name: 'PrivateKey')
  final String privateKey;

  ExportCertificateResponse({
    this.certificate,
    this.certificateChain,
    this.privateKey,
  });
  factory ExportCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportCertificateResponseFromJson(json);
}

/// The Extended Key Usage X.509 v3 extension defines one or more purposes for
/// which the public key can be used. This is in addition to or in place of the
/// basic purposes specified by the Key Usage extension.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExtendedKeyUsage {
  /// The name of an Extended Key Usage value.
  @_s.JsonKey(name: 'Name')
  final ExtendedKeyUsageName name;

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
  @_s.JsonKey(name: 'OID')
  final String oid;

  ExtendedKeyUsage({
    this.name,
    this.oid,
  });
  factory ExtendedKeyUsage.fromJson(Map<String, dynamic> json) =>
      _$ExtendedKeyUsageFromJson(json);
}

enum ExtendedKeyUsageName {
  @_s.JsonValue('TLS_WEB_SERVER_AUTHENTICATION')
  tlsWebServerAuthentication,
  @_s.JsonValue('TLS_WEB_CLIENT_AUTHENTICATION')
  tlsWebClientAuthentication,
  @_s.JsonValue('CODE_SIGNING')
  codeSigning,
  @_s.JsonValue('EMAIL_PROTECTION')
  emailProtection,
  @_s.JsonValue('TIME_STAMPING')
  timeStamping,
  @_s.JsonValue('OCSP_SIGNING')
  ocspSigning,
  @_s.JsonValue('IPSEC_END_SYSTEM')
  ipsecEndSystem,
  @_s.JsonValue('IPSEC_TUNNEL')
  ipsecTunnel,
  @_s.JsonValue('IPSEC_USER')
  ipsecUser,
  @_s.JsonValue('ANY')
  any,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('CUSTOM')
  custom,
}

enum FailureReason {
  @_s.JsonValue('NO_AVAILABLE_CONTACTS')
  noAvailableContacts,
  @_s.JsonValue('ADDITIONAL_VERIFICATION_REQUIRED')
  additionalVerificationRequired,
  @_s.JsonValue('DOMAIN_NOT_ALLOWED')
  domainNotAllowed,
  @_s.JsonValue('INVALID_PUBLIC_DOMAIN')
  invalidPublicDomain,
  @_s.JsonValue('DOMAIN_VALIDATION_DENIED')
  domainValidationDenied,
  @_s.JsonValue('CAA_ERROR')
  caaError,
  @_s.JsonValue('PCA_LIMIT_EXCEEDED')
  pcaLimitExceeded,
  @_s.JsonValue('PCA_INVALID_ARN')
  pcaInvalidArn,
  @_s.JsonValue('PCA_INVALID_STATE')
  pcaInvalidState,
  @_s.JsonValue('PCA_REQUEST_FAILED')
  pcaRequestFailed,
  @_s.JsonValue('PCA_NAME_CONSTRAINTS_VALIDATION')
  pcaNameConstraintsValidation,
  @_s.JsonValue('PCA_RESOURCE_NOT_FOUND')
  pcaResourceNotFound,
  @_s.JsonValue('PCA_INVALID_ARGS')
  pcaInvalidArgs,
  @_s.JsonValue('PCA_INVALID_DURATION')
  pcaInvalidDuration,
  @_s.JsonValue('PCA_ACCESS_DENIED')
  pcaAccessDenied,
  @_s.JsonValue('SLR_NOT_FOUND')
  slrNotFound,
  @_s.JsonValue('OTHER')
  other,
}

/// This structure can be used in the <a>ListCertificates</a> action to filter
/// the output of the certificate list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filters {
  /// Specify one or more <a>ExtendedKeyUsage</a> extension values.
  @_s.JsonKey(name: 'extendedKeyUsage')
  final List<ExtendedKeyUsageName> extendedKeyUsage;

  /// Specify one or more algorithms that can be used to generate key pairs.
  ///
  /// Default filtering returns only <code>RSA_2048</code> certificates. To return
  /// other certificate types, provide the desired type signatures in a
  /// comma-separated list. For example, <code>"keyTypes":
  /// ["RSA_2048,RSA_4096"]</code> returns both <code>RSA_2048</code> and
  /// <code>RSA_4096</code> certificates.
  @_s.JsonKey(name: 'keyTypes')
  final List<KeyAlgorithm> keyTypes;

  /// Specify one or more <a>KeyUsage</a> extension values.
  @_s.JsonKey(name: 'keyUsage')
  final List<KeyUsageName> keyUsage;

  Filters({
    this.extendedKeyUsage,
    this.keyTypes,
    this.keyUsage,
  });
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCertificateResponse {
  /// The ACM-issued certificate corresponding to the ARN specified as input.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// Certificates forming the requested certificate's chain of trust. The chain
  /// consists of the certificate of the issuing CA and the intermediate
  /// certificates of any other subordinate CAs.
  @_s.JsonKey(name: 'CertificateChain')
  final String certificateChain;

  GetCertificateResponse({
    this.certificate,
    this.certificateChain,
  });
  factory GetCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportCertificateResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of the imported certificate.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  ImportCertificateResponse({
    this.certificateArn,
  });
  factory ImportCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportCertificateResponseFromJson(json);
}

enum KeyAlgorithm {
  @_s.JsonValue('RSA_2048')
  rsa_2048,
  @_s.JsonValue('RSA_1024')
  rsa_1024,
  @_s.JsonValue('RSA_4096')
  rsa_4096,
  @_s.JsonValue('EC_prime256v1')
  ecPrime256v1,
  @_s.JsonValue('EC_secp384r1')
  ecSecp384r1,
  @_s.JsonValue('EC_secp521r1')
  ecSecp521r1,
}

/// The Key Usage X.509 v3 extension defines the purpose of the public key
/// contained in the certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeyUsage {
  /// A string value that contains a Key Usage extension name.
  @_s.JsonKey(name: 'Name')
  final KeyUsageName name;

  KeyUsage({
    this.name,
  });
  factory KeyUsage.fromJson(Map<String, dynamic> json) =>
      _$KeyUsageFromJson(json);
}

enum KeyUsageName {
  @_s.JsonValue('DIGITAL_SIGNATURE')
  digitalSignature,
  @_s.JsonValue('NON_REPUDIATION')
  nonRepudiation,
  @_s.JsonValue('KEY_ENCIPHERMENT')
  keyEncipherment,
  @_s.JsonValue('DATA_ENCIPHERMENT')
  dataEncipherment,
  @_s.JsonValue('KEY_AGREEMENT')
  keyAgreement,
  @_s.JsonValue('CERTIFICATE_SIGNING')
  certificateSigning,
  @_s.JsonValue('CRL_SIGNING')
  crlSigning,
  @_s.JsonValue('ENCIPHER_ONLY')
  encipherOnly,
  @_s.JsonValue('DECIPHER_ONLY')
  decipherOnly,
  @_s.JsonValue('ANY')
  any,
  @_s.JsonValue('CUSTOM')
  custom,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCertificatesResponse {
  /// A list of ACM certificates.
  @_s.JsonKey(name: 'CertificateSummaryList')
  final List<CertificateSummary> certificateSummaryList;

  /// When the list is truncated, this value is present and contains the value to
  /// use for the <code>NextToken</code> parameter in a subsequent pagination
  /// request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCertificatesResponse({
    this.certificateSummaryList,
    this.nextToken,
  });
  factory ListCertificatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCertificatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForCertificateResponse {
  /// The key-value pairs that define the applied tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForCertificateResponse({
    this.tags,
  });
  factory ListTagsForCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForCertificateResponseFromJson(json);
}

enum RecordType {
  @_s.JsonValue('CNAME')
  cname,
}

enum RenewalEligibility {
  @_s.JsonValue('ELIGIBLE')
  eligible,
  @_s.JsonValue('INELIGIBLE')
  ineligible,
}

enum RenewalStatus {
  @_s.JsonValue('PENDING_AUTO_RENEWAL')
  pendingAutoRenewal,
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains information about the status of ACM's <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
/// renewal</a> for the certificate. This structure exists only when the
/// certificate type is <code>AMAZON_ISSUED</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RenewalSummary {
  /// Contains information about the validation of each domain name in the
  /// certificate, as it pertains to ACM's <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a>. This is different from the initial validation that occurs as a
  /// result of the <a>RequestCertificate</a> request. This field exists only when
  /// the certificate type is <code>AMAZON_ISSUED</code>.
  @_s.JsonKey(name: 'DomainValidationOptions')
  final List<DomainValidation> domainValidationOptions;

  /// The status of ACM's <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed
  /// renewal</a> of the certificate.
  @_s.JsonKey(name: 'RenewalStatus')
  final RenewalStatus renewalStatus;

  /// The time at which the renewal summary was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  /// The reason that a renewal request was unsuccessful.
  @_s.JsonKey(name: 'RenewalStatusReason')
  final FailureReason renewalStatusReason;

  RenewalSummary({
    @_s.required this.domainValidationOptions,
    @_s.required this.renewalStatus,
    @_s.required this.updatedAt,
    this.renewalStatusReason,
  });
  factory RenewalSummary.fromJson(Map<String, dynamic> json) =>
      _$RenewalSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestCertificateResponse {
  /// String that contains the ARN of the issued certificate. This must be of the
  /// form:
  ///
  /// <code>arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012</code>
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  RequestCertificateResponse({
    this.certificateArn,
  });
  factory RequestCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestCertificateResponseFromJson(json);
}

/// Contains a DNS record value that you can use to can use to validate
/// ownership or control of a domain. This is used by the
/// <a>DescribeCertificate</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceRecord {
  /// The name of the DNS record to create in your domain. This is supplied by
  /// ACM.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of DNS record. Currently this can be <code>CNAME</code>.
  @_s.JsonKey(name: 'Type')
  final RecordType type;

  /// The value of the CNAME record to add to your DNS database. This is supplied
  /// by ACM.
  @_s.JsonKey(name: 'Value')
  final String value;

  ResourceRecord({
    @_s.required this.name,
    @_s.required this.type,
    @_s.required this.value,
  });
  factory ResourceRecord.fromJson(Map<String, dynamic> json) =>
      _$ResourceRecordFromJson(json);
}

enum RevocationReason {
  @_s.JsonValue('UNSPECIFIED')
  unspecified,
  @_s.JsonValue('KEY_COMPROMISE')
  keyCompromise,
  @_s.JsonValue('CA_COMPROMISE')
  caCompromise,
  @_s.JsonValue('AFFILIATION_CHANGED')
  affiliationChanged,
  @_s.JsonValue('SUPERCEDED')
  superceded,
  @_s.JsonValue('CESSATION_OF_OPERATION')
  cessationOfOperation,
  @_s.JsonValue('CERTIFICATE_HOLD')
  certificateHold,
  @_s.JsonValue('REMOVE_FROM_CRL')
  removeFromCrl,
  @_s.JsonValue('PRIVILEGE_WITHDRAWN')
  privilegeWithdrawn,
  @_s.JsonValue('A_A_COMPROMISE')
  aACompromise,
}

/// A key-value pair that identifies or specifies metadata about an ACM
/// resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

enum ValidationMethod {
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('DNS')
  dns,
}

extension on ValidationMethod {
  String toValue() {
    switch (this) {
      case ValidationMethod.email:
        return 'EMAIL';
      case ValidationMethod.dns:
        return 'DNS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

class InvalidArgsException extends _s.GenericAwsException {
  InvalidArgsException({String type, String message})
      : super(type: type, code: 'InvalidArgsException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String type, String message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidDomainValidationOptionsException extends _s.GenericAwsException {
  InvalidDomainValidationOptionsException({String type, String message})
      : super(
            type: type,
            code: 'InvalidDomainValidationOptionsException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String type, String message})
      : super(type: type, code: 'InvalidStateException', message: message);
}

class InvalidTagException extends _s.GenericAwsException {
  InvalidTagException({String type, String message})
      : super(type: type, code: 'InvalidTagException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class RequestInProgressException extends _s.GenericAwsException {
  RequestInProgressException({String type, String message})
      : super(type: type, code: 'RequestInProgressException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TagPolicyException extends _s.GenericAwsException {
  TagPolicyException({String type, String message})
      : super(type: type, code: 'TagPolicyException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
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
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
