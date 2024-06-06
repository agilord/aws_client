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

/// This is the <i>Amazon Web Services Private Certificate Authority API
/// Reference</i>. It provides descriptions, syntax, and usage examples for each
/// of the actions and data types involved in creating and managing a private
/// certificate authority (CA) for your organization.
///
/// The documentation for each action shows the API request parameters and the
/// JSON response. Alternatively, you can use one of the Amazon Web Services
/// SDKs to access an API that is tailored to the programming language or
/// platform that you prefer. For more information, see <a
/// href="https://aws.amazon.com/tools/#SDKs">Amazon Web Services SDKs</a>.
///
/// Each Amazon Web Services Private CA API operation has a quota that
/// determines the number of times the operation can be called per second.
/// Amazon Web Services Private CA throttles API requests at different rates
/// depending on the operation. Throttling means that Amazon Web Services
/// Private CA rejects an otherwise valid request because the request exceeds
/// the operation's quota for the number of requests per second. When a request
/// is throttled, Amazon Web Services Private CA returns a <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/CommonErrors.html">ThrottlingException</a>
/// error. Amazon Web Services Private CA does not guarantee a minimum request
/// rate for APIs.
///
/// To see an up-to-date list of your Amazon Web Services Private CA quotas, or
/// to request a quota increase, log into your Amazon Web Services account and
/// visit the <a href="https://console.aws.amazon.com/servicequotas/">Service
/// Quotas</a> console.
class AcmPca {
  final _s.JsonProtocol _protocol;
  AcmPca({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'acm-pca',
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

  /// Creates a root or subordinate private certificate authority (CA). You must
  /// specify the CA configuration, an optional configuration for Online
  /// Certificate Status Protocol (OCSP) and/or a certificate revocation list
  /// (CRL), the CA type, and an optional idempotency token to avoid accidental
  /// creation of multiple CAs. The CA configuration specifies the name of the
  /// algorithm and key size to be used to create the CA private key, the type
  /// of signing algorithm that the CA uses, and X.500 subject information. The
  /// OCSP configuration can optionally specify a custom URL for the OCSP
  /// responder. The CRL configuration specifies the CRL expiration period in
  /// days (the validity period of the CRL), the Amazon S3 bucket that will
  /// contain the CRL, and a CNAME alias for the S3 bucket that is included in
  /// certificates issued by the CA. If successful, this action returns the
  /// Amazon Resource Name (ARN) of the CA.
  /// <note>
  /// Both Amazon Web Services Private CA and the IAM principal must have
  /// permission to write to the S3 bucket that you specify. If the IAM
  /// principal making the call does not have permission to write to the bucket,
  /// then an exception is thrown. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#s3-policies">Access
  /// policies for CRLs in Amazon S3</a>.
  /// </note>
  /// Amazon Web Services Private CA assets that are stored in Amazon S3 can be
  /// protected with encryption. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaCreateCa.html#crl-encryption">Encrypting
  /// Your CRLs</a>.
  ///
  /// May throw [InvalidArgsException].
  /// May throw [InvalidPolicyException].
  /// May throw [InvalidTagException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [certificateAuthorityConfiguration] :
  /// Name and bit size of the private key algorithm, the name of the signing
  /// algorithm, and X.500 certificate subject information.
  ///
  /// Parameter [certificateAuthorityType] :
  /// The type of the certificate authority.
  ///
  /// Parameter [idempotencyToken] :
  /// Custom string that can be used to distinguish between calls to the
  /// <b>CreateCertificateAuthority</b> action. Idempotency tokens for
  /// <b>CreateCertificateAuthority</b> time out after five minutes. Therefore,
  /// if you call <b>CreateCertificateAuthority</b> multiple times with the same
  /// idempotency token within five minutes, Amazon Web Services Private CA
  /// recognizes that you are requesting only certificate authority and will
  /// issue only one. If you change the idempotency token for each call, Amazon
  /// Web Services Private CA recognizes that you are requesting multiple
  /// certificate authorities.
  ///
  /// Parameter [keyStorageSecurityStandard] :
  /// Specifies a cryptographic key management compliance standard used for
  /// handling CA keys.
  ///
  /// Default: FIPS_140_2_LEVEL_3_OR_HIGHER
  /// <note>
  /// Some Amazon Web Services Regions do not support the default. When creating
  /// a CA in these Regions, you must provide
  /// <code>FIPS_140_2_LEVEL_2_OR_HIGHER</code> as the argument for
  /// <code>KeyStorageSecurityStandard</code>. Failure to do this results in an
  /// <code>InvalidArgsException</code> with the message, "A certificate
  /// authority cannot be created in this region with the specified security
  /// standard."
  ///
  /// For information about security standard support in various Regions, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/data-protection.html#private-keys">Storage
  /// and security compliance of Amazon Web Services Private CA private
  /// keys</a>.
  /// </note>
  ///
  /// Parameter [revocationConfiguration] :
  /// Contains information to enable Online Certificate Status Protocol (OCSP)
  /// support, to enable a certificate revocation list (CRL), to enable both, or
  /// to enable neither. The default is for both certificate validation
  /// mechanisms to be disabled.
  /// <note>
  /// The following requirements apply to revocation configurations.
  ///
  /// <ul>
  /// <li>
  /// A configuration disabling CRLs or OCSP must contain only the
  /// <code>Enabled=False</code> parameter, and will fail if other parameters
  /// such as <code>CustomCname</code> or <code>ExpirationInDays</code> are
  /// included.
  /// </li>
  /// <li>
  /// In a CRL configuration, the <code>S3BucketName</code> parameter must
  /// conform to <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html">Amazon
  /// S3 bucket naming rules</a>.
  /// </li>
  /// <li>
  /// A configuration containing a custom Canonical Name (CNAME) parameter for
  /// CRLs or OCSP must conform to <a
  /// href="https://www.ietf.org/rfc/rfc2396.txt">RFC2396</a> restrictions on
  /// the use of special characters in a CNAME.
  /// </li>
  /// <li>
  /// In a CRL or OCSP configuration, the value of a CNAME parameter must not
  /// include a protocol prefix such as "http://" or "https://".
  /// </li>
  /// </ul> </note>
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_OcspConfiguration.html">OcspConfiguration</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CrlConfiguration.html">CrlConfiguration</a>
  /// types.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that will be attached to the new private CA. You can
  /// associate up to 50 tags with a private CA. For information using tags with
  /// IAM to manage permissions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html">Controlling
  /// Access Using IAM Tags</a>.
  ///
  /// Parameter [usageMode] :
  /// Specifies whether the CA issues general-purpose certificates that
  /// typically require a revocation mechanism, or short-lived certificates that
  /// may optionally omit revocation because they expire quickly. Short-lived
  /// certificate validity is limited to seven days.
  ///
  /// The default value is GENERAL_PURPOSE.
  Future<CreateCertificateAuthorityResponse> createCertificateAuthority({
    required CertificateAuthorityConfiguration
        certificateAuthorityConfiguration,
    required CertificateAuthorityType certificateAuthorityType,
    String? idempotencyToken,
    KeyStorageSecurityStandard? keyStorageSecurityStandard,
    RevocationConfiguration? revocationConfiguration,
    List<Tag>? tags,
    CertificateAuthorityUsageMode? usageMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.CreateCertificateAuthority'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityConfiguration': certificateAuthorityConfiguration,
        'CertificateAuthorityType': certificateAuthorityType.toValue(),
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
        if (keyStorageSecurityStandard != null)
          'KeyStorageSecurityStandard': keyStorageSecurityStandard.toValue(),
        if (revocationConfiguration != null)
          'RevocationConfiguration': revocationConfiguration,
        if (tags != null) 'Tags': tags,
        if (usageMode != null) 'UsageMode': usageMode.toValue(),
      },
    );

    return CreateCertificateAuthorityResponse.fromJson(jsonResponse.body);
  }

  /// Creates an audit report that lists every time that your CA private key is
  /// used. The report is saved in the Amazon S3 bucket that you specify on
  /// input. The <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_IssueCertificate.html">IssueCertificate</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_RevokeCertificate.html">RevokeCertificate</a>
  /// actions use the private key.
  /// <note>
  /// Both Amazon Web Services Private CA and the IAM principal must have
  /// permission to write to the S3 bucket that you specify. If the IAM
  /// principal making the call does not have permission to write to the bucket,
  /// then an exception is thrown. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#s3-policies">Access
  /// policies for CRLs in Amazon S3</a>.
  /// </note>
  /// Amazon Web Services Private CA assets that are stored in Amazon S3 can be
  /// protected with encryption. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaAuditReport.html#audit-report-encryption">Encrypting
  /// Your Audit Reports</a>.
  /// <note>
  /// You can generate a maximum of one report every 30 minutes.
  /// </note>
  ///
  /// May throw [RequestInProgressException].
  /// May throw [RequestFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidArgsException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [auditReportResponseFormat] :
  /// The format in which to create the report. This can be either <b>JSON</b>
  /// or <b>CSV</b>.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the CA to be audited. This is of the
  /// form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  ///
  /// Parameter [s3BucketName] :
  /// The name of the S3 bucket that will contain the audit report.
  Future<CreateCertificateAuthorityAuditReportResponse>
      createCertificateAuthorityAuditReport({
    required AuditReportResponseFormat auditReportResponseFormat,
    required String certificateAuthorityArn,
    required String s3BucketName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.CreateCertificateAuthorityAuditReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuditReportResponseFormat': auditReportResponseFormat.toValue(),
        'CertificateAuthorityArn': certificateAuthorityArn,
        'S3BucketName': s3BucketName,
      },
    );

    return CreateCertificateAuthorityAuditReportResponse.fromJson(
        jsonResponse.body);
  }

  /// Grants one or more permissions on a private CA to the Certificate Manager
  /// (ACM) service principal (<code>acm.amazonaws.com</code>). These
  /// permissions allow ACM to issue and renew ACM certificates that reside in
  /// the same Amazon Web Services account as the CA.
  ///
  /// You can list current permissions with the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListPermissions.html">ListPermissions</a>
  /// action and revoke them with the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePermission.html">DeletePermission</a>
  /// action.
  /// <p class="title"> <b>About Permissions</b>
  ///
  /// <ul>
  /// <li>
  /// If the private CA and the certificates it issues reside in the same
  /// account, you can use <code>CreatePermission</code> to grant permissions
  /// for ACM to carry out automatic certificate renewals.
  /// </li>
  /// <li>
  /// For automatic certificate renewal to succeed, the ACM service principal
  /// needs permissions to create, retrieve, and list certificates.
  /// </li>
  /// <li>
  /// If the private CA and the ACM certificates reside in different accounts,
  /// then permissions cannot be used to enable automatic renewals. Instead, the
  /// ACM certificate owner must set up a resource-based policy to enable
  /// cross-account issuance and renewals. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with Amazon Web Services Private CA</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [PermissionAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidStateException].
  /// May throw [RequestFailedException].
  ///
  /// Parameter [actions] :
  /// The actions that the specified Amazon Web Services service principal can
  /// use. These include <code>IssueCertificate</code>,
  /// <code>GetCertificate</code>, and <code>ListPermissions</code>.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the CA that grants the permissions. You
  /// can find the ARN by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. This must have the following form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  ///
  /// Parameter [principal] :
  /// The Amazon Web Services service or identity that receives the permission.
  /// At this time, the only valid principal is <code>acm.amazonaws.com</code>.
  ///
  /// Parameter [sourceAccount] :
  /// The ID of the calling account.
  Future<void> createPermission({
    required List<ActionType> actions,
    required String certificateAuthorityArn,
    required String principal,
    String? sourceAccount,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.CreatePermission'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Actions': actions.map((e) => e.toValue()).toList(),
        'CertificateAuthorityArn': certificateAuthorityArn,
        'Principal': principal,
        if (sourceAccount != null) 'SourceAccount': sourceAccount,
      },
    );
  }

  /// Deletes a private certificate authority (CA). You must provide the Amazon
  /// Resource Name (ARN) of the private CA that you want to delete. You can
  /// find the ARN by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action.
  /// <note>
  /// Deleting a CA will invalidate other CAs and certificates below it in your
  /// CA hierarchy.
  /// </note>
  /// Before you can delete a CA that you have created and activated, you must
  /// disable it. To do this, call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// action and set the <b>CertificateAuthorityStatus</b> parameter to
  /// <code>DISABLED</code>.
  ///
  /// Additionally, you can delete a CA if you are waiting for it to be created
  /// (that is, the status of the CA is <code>CREATING</code>). You can also
  /// delete it if the CA has been created but you haven't yet imported the
  /// signed certificate into Amazon Web Services Private CA (that is, the
  /// status of the CA is <code>PENDING_CERTIFICATE</code>).
  ///
  /// When you successfully call <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeleteCertificateAuthority.html">DeleteCertificateAuthority</a>,
  /// the CA's status changes to <code>DELETED</code>. However, the CA won't be
  /// permanently deleted until the restoration period has passed. By default,
  /// if you do not set the <code>PermanentDeletionTimeInDays</code> parameter,
  /// the CA remains restorable for 30 days. You can set the parameter from 7 to
  /// 30 days. The <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DescribeCertificateAuthority.html">DescribeCertificateAuthority</a>
  /// action returns the time remaining in the restoration window of a private
  /// CA in the <code>DELETED</code> state. To restore an eligible CA, call the
  /// <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_RestoreCertificateAuthority.html">RestoreCertificateAuthority</a>
  /// action.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must have the following form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  ///
  /// Parameter [permanentDeletionTimeInDays] :
  /// The number of days to make a CA restorable after it has been deleted. This
  /// can be anywhere from 7 to 30 days, with 30 being the default.
  Future<void> deleteCertificateAuthority({
    required String certificateAuthorityArn,
    int? permanentDeletionTimeInDays,
  }) async {
    _s.validateNumRange(
      'permanentDeletionTimeInDays',
      permanentDeletionTimeInDays,
      7,
      30,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.DeleteCertificateAuthority'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        if (permanentDeletionTimeInDays != null)
          'PermanentDeletionTimeInDays': permanentDeletionTimeInDays,
      },
    );
  }

  /// Revokes permissions on a private CA granted to the Certificate Manager
  /// (ACM) service principal (acm.amazonaws.com).
  ///
  /// These permissions allow ACM to issue and renew ACM certificates that
  /// reside in the same Amazon Web Services account as the CA. If you revoke
  /// these permissions, ACM will no longer renew the affected certificates
  /// automatically.
  ///
  /// Permissions can be granted with the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreatePermission.html">CreatePermission</a>
  /// action and listed with the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListPermissions.html">ListPermissions</a>
  /// action.
  /// <p class="title"> <b>About Permissions</b>
  ///
  /// <ul>
  /// <li>
  /// If the private CA and the certificates it issues reside in the same
  /// account, you can use <code>CreatePermission</code> to grant permissions
  /// for ACM to carry out automatic certificate renewals.
  /// </li>
  /// <li>
  /// For automatic certificate renewal to succeed, the ACM service principal
  /// needs permissions to create, retrieve, and list certificates.
  /// </li>
  /// <li>
  /// If the private CA and the ACM certificates reside in different accounts,
  /// then permissions cannot be used to enable automatic renewals. Instead, the
  /// ACM certificate owner must set up a resource-based policy to enable
  /// cross-account issuance and renewals. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with Amazon Web Services Private CA</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [RequestFailedException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Number (ARN) of the private CA that issued the
  /// permissions. You can find the CA's ARN by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. This must have the following form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  ///
  /// Parameter [principal] :
  /// The Amazon Web Services service or identity that will have its CA
  /// permissions revoked. At this time, the only valid service principal is
  /// <code>acm.amazonaws.com</code>
  ///
  /// Parameter [sourceAccount] :
  /// The Amazon Web Services account that calls this action.
  Future<void> deletePermission({
    required String certificateAuthorityArn,
    required String principal,
    String? sourceAccount,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.DeletePermission'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        'Principal': principal,
        if (sourceAccount != null) 'SourceAccount': sourceAccount,
      },
    );
  }

  /// Deletes the resource-based policy attached to a private CA. Deletion will
  /// remove any access that the policy has granted. If there is no policy
  /// attached to the private CA, this action will return successful.
  ///
  /// If you delete a policy that was applied through Amazon Web Services
  /// Resource Access Manager (RAM), the CA will be removed from all shares in
  /// which it was included.
  ///
  /// The Certificate Manager Service Linked Role that the policy supports is
  /// not affected when you delete the policy.
  ///
  /// The current policy can be shown with <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetPolicy.html">GetPolicy</a>
  /// and updated with <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_PutPolicy.html">PutPolicy</a>.
  /// <p class="title"> <b>About Policies</b>
  ///
  /// <ul>
  /// <li>
  /// A policy grants access on a private CA to an Amazon Web Services customer
  /// account, to Amazon Web Services Organizations, or to an Amazon Web
  /// Services Organizations unit. Policies are under the control of a CA
  /// administrator. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with Amazon Web Services Private CA</a>.
  /// </li>
  /// <li>
  /// A policy permits a user of Certificate Manager (ACM) to issue ACM
  /// certificates signed by a CA in another account.
  /// </li>
  /// <li>
  /// For ACM to manage automatic renewal of these certificates, the ACM user
  /// must configure a Service Linked Role (SLR). The SLR allows the ACM service
  /// to assume the identity of the user, subject to confirmation against the
  /// Amazon Web Services Private CA policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html">Using
  /// a Service Linked Role with ACM</a>.
  /// </li>
  /// <li>
  /// Updates made in Amazon Web Services Resource Manager (RAM) are reflected
  /// in policies. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html">Attach
  /// a Policy for Cross-Account Access</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [LockoutPreventedException].
  /// May throw [RequestFailedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Number (ARN) of the private CA that will have its
  /// policy deleted. You can find the CA's ARN by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. The ARN value must have the form
  /// <code>arn:aws:acm-pca:region:account:certificate-authority/01234567-89ab-cdef-0123-0123456789ab</code>.
  Future<void> deletePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.DeletePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Lists information about your private certificate authority (CA) or one
  /// that has been shared with you. You specify the private CA on input by its
  /// ARN (Amazon Resource Name). The output contains the status of your CA.
  /// This can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - Amazon Web Services Private CA is creating your
  /// private certificate authority.
  /// </li>
  /// <li>
  /// <code>PENDING_CERTIFICATE</code> - The certificate is pending. You must
  /// use your Amazon Web Services Private CA-hosted or on-premises root or
  /// subordinate CA to sign your private CA CSR and then import it into Amazon
  /// Web Services Private CA.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - Your private CA is active.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - Your private CA has been disabled.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> - Your private CA certificate has expired.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Your private CA has failed. Your CA can fail because
  /// of problems such a network outage or back-end Amazon Web Services failure
  /// or other errors. A failed CA can never return to the pending state. You
  /// must create a new CA.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - Your private CA is within the restoration period,
  /// after which it is permanently deleted. The length of time remaining in the
  /// CA's restoration period is also included in this action's output.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  Future<DescribeCertificateAuthorityResponse> describeCertificateAuthority({
    required String certificateAuthorityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.DescribeCertificateAuthority'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
      },
    );

    return DescribeCertificateAuthorityResponse.fromJson(jsonResponse.body);
  }

  /// Lists information about a specific audit report created by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>
  /// action. Audit information is created every time the certificate authority
  /// (CA) private key is used. The private key is used when you call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_IssueCertificate.html">IssueCertificate</a>
  /// action or the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_RevokeCertificate.html">RevokeCertificate</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidArgsException].
  ///
  /// Parameter [auditReportId] :
  /// The report ID returned by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>
  /// action.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the private CA. This must be of the
  /// form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  Future<DescribeCertificateAuthorityAuditReportResponse>
      describeCertificateAuthorityAuditReport({
    required String auditReportId,
    required String certificateAuthorityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.DescribeCertificateAuthorityAuditReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuditReportId': auditReportId,
        'CertificateAuthorityArn': certificateAuthorityArn,
      },
    );

    return DescribeCertificateAuthorityAuditReportResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves a certificate from your private CA or one that has been shared
  /// with you. The ARN of the certificate is returned when you call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_IssueCertificate.html">IssueCertificate</a>
  /// action. You must specify both the ARN of your private CA and the ARN of
  /// the issued certificate when calling the <b>GetCertificate</b> action. You
  /// can retrieve the certificate if it is in the <b>ISSUED</b> state. You can
  /// call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>
  /// action to create a report that contains information about all of the
  /// certificates issued and revoked by your private CA.
  ///
  /// May throw [RequestInProgressException].
  /// May throw [RequestFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [certificateArn] :
  /// The ARN of the issued certificate. The ARN contains the certificate serial
  /// number and must be in the following form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>/certificate/<i>286535153982981100925020015808220737245</i>
  /// </code>
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  Future<GetCertificateResponse> getCertificate({
    required String certificateArn,
    required String certificateAuthorityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.GetCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateArn': certificateArn,
        'CertificateAuthorityArn': certificateAuthorityArn,
      },
    );

    return GetCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the certificate and certificate chain for your private
  /// certificate authority (CA) or one that has been shared with you. Both the
  /// certificate and the chain are base64 PEM-encoded. The chain does not
  /// include the CA certificate. Each certificate in the chain signs the one
  /// before it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of your private CA. This is of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  Future<GetCertificateAuthorityCertificateResponse>
      getCertificateAuthorityCertificate({
    required String certificateAuthorityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.GetCertificateAuthorityCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
      },
    );

    return GetCertificateAuthorityCertificateResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the certificate signing request (CSR) for your private
  /// certificate authority (CA). The CSR is created when you call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action. Sign the CSR with your Amazon Web Services Private CA-hosted or
  /// on-premises root or subordinate CA. Then import the signed certificate
  /// back into Amazon Web Services Private CA by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html">ImportCertificateAuthorityCertificate</a>
  /// action. The CSR is returned as a base64 PEM-encoded string.
  ///
  /// May throw [RequestInProgressException].
  /// May throw [RequestFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action. This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  Future<GetCertificateAuthorityCsrResponse> getCertificateAuthorityCsr({
    required String certificateAuthorityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.GetCertificateAuthorityCsr'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
      },
    );

    return GetCertificateAuthorityCsrResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the resource-based policy attached to a private CA. If either
  /// the private CA resource or the policy cannot be found, this action returns
  /// a <code>ResourceNotFoundException</code>.
  ///
  /// The policy can be attached or updated with <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_PutPolicy.html">PutPolicy</a>
  /// and removed with <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePolicy.html">DeletePolicy</a>.
  /// <p class="title"> <b>About Policies</b>
  ///
  /// <ul>
  /// <li>
  /// A policy grants access on a private CA to an Amazon Web Services customer
  /// account, to Amazon Web Services Organizations, or to an Amazon Web
  /// Services Organizations unit. Policies are under the control of a CA
  /// administrator. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with Amazon Web Services Private CA</a>.
  /// </li>
  /// <li>
  /// A policy permits a user of Certificate Manager (ACM) to issue ACM
  /// certificates signed by a CA in another account.
  /// </li>
  /// <li>
  /// For ACM to manage automatic renewal of these certificates, the ACM user
  /// must configure a Service Linked Role (SLR). The SLR allows the ACM service
  /// to assume the identity of the user, subject to confirmation against the
  /// Amazon Web Services Private CA policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html">Using
  /// a Service Linked Role with ACM</a>.
  /// </li>
  /// <li>
  /// Updates made in Amazon Web Services Resource Manager (RAM) are reflected
  /// in policies. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html">Attach
  /// a Policy for Cross-Account Access</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [RequestFailedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Number (ARN) of the private CA that will have its
  /// policy retrieved. You can find the CA's ARN by calling the
  /// ListCertificateAuthorities action.
  Future<GetPolicyResponse> getPolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.GetPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return GetPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Imports a signed private CA certificate into Amazon Web Services Private
  /// CA. This action is used when you are using a chain of trust whose root is
  /// located outside Amazon Web Services Private CA. Before you can call this
  /// action, the following preparations must in place:
  /// <ol>
  /// <li>
  /// In Amazon Web Services Private CA, call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action to create the private CA that you plan to back with the imported
  /// certificate.
  /// </li>
  /// <li>
  /// Call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificateAuthorityCsr.html">GetCertificateAuthorityCsr</a>
  /// action to generate a certificate signing request (CSR).
  /// </li>
  /// <li>
  /// Sign the CSR using a root or intermediate CA hosted by either an
  /// on-premises PKI hierarchy or by a commercial CA.
  /// </li>
  /// <li>
  /// Create a certificate chain and copy the signed certificate and the
  /// certificate chain to your working directory.
  /// </li> </ol>
  /// Amazon Web Services Private CA supports three scenarios for installing a
  /// CA certificate:
  ///
  /// <ul>
  /// <li>
  /// Installing a certificate for a root CA hosted by Amazon Web Services
  /// Private CA.
  /// </li>
  /// <li>
  /// Installing a subordinate CA certificate whose parent authority is hosted
  /// by Amazon Web Services Private CA.
  /// </li>
  /// <li>
  /// Installing a subordinate CA certificate whose parent authority is
  /// externally hosted.
  /// </li>
  /// </ul>
  /// The following additional requirements apply when you import a CA
  /// certificate.
  ///
  /// <ul>
  /// <li>
  /// Only a self-signed certificate can be imported as a root CA.
  /// </li>
  /// <li>
  /// A self-signed certificate cannot be imported as a subordinate CA.
  /// </li>
  /// <li>
  /// Your certificate chain must not include the private CA certificate that
  /// you are importing.
  /// </li>
  /// <li>
  /// Your root CA must be the last certificate in your chain. The subordinate
  /// certificate, if any, that your root CA signed must be next to last. The
  /// subordinate certificate signed by the preceding subordinate CA must come
  /// next, and so on until your chain is built.
  /// </li>
  /// <li>
  /// The chain must be PEM-encoded.
  /// </li>
  /// <li>
  /// The maximum allowed size of a certificate is 32 KB.
  /// </li>
  /// <li>
  /// The maximum allowed size of a certificate chain is 2 MB.
  /// </li>
  /// </ul>
  /// <i>Enforcement of Critical Constraints</i>
  ///
  /// Amazon Web Services Private CA allows the following extensions to be
  /// marked critical in the imported CA certificate or chain.
  ///
  /// <ul>
  /// <li>
  /// Basic constraints (<i>must</i> be marked critical)
  /// </li>
  /// <li>
  /// Subject alternative names
  /// </li>
  /// <li>
  /// Key usage
  /// </li>
  /// <li>
  /// Extended key usage
  /// </li>
  /// <li>
  /// Authority key identifier
  /// </li>
  /// <li>
  /// Subject key identifier
  /// </li>
  /// <li>
  /// Issuer alternative name
  /// </li>
  /// <li>
  /// Subject directory attributes
  /// </li>
  /// <li>
  /// Subject information access
  /// </li>
  /// <li>
  /// Certificate policies
  /// </li>
  /// <li>
  /// Policy mappings
  /// </li>
  /// <li>
  /// Inhibit anyPolicy
  /// </li>
  /// </ul>
  /// Amazon Web Services Private CA rejects the following extensions when they
  /// are marked critical in an imported CA certificate or chain.
  ///
  /// <ul>
  /// <li>
  /// Name constraints
  /// </li>
  /// <li>
  /// Policy constraints
  /// </li>
  /// <li>
  /// CRL distribution points
  /// </li>
  /// <li>
  /// Authority information access
  /// </li>
  /// <li>
  /// Freshest CRL
  /// </li>
  /// <li>
  /// Any other extension
  /// </li>
  /// </ul>
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [RequestInProgressException].
  /// May throw [RequestFailedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateException].
  /// May throw [MalformedCertificateException].
  /// May throw [CertificateMismatchException].
  ///
  /// Parameter [certificate] :
  /// The PEM-encoded certificate for a private CA. This may be a self-signed
  /// certificate in the case of a root CA, or it may be signed by another CA
  /// that you control.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [certificateChain] :
  /// A PEM-encoded file that contains all of your certificates, other than the
  /// certificate you're importing, chaining up to your root CA. Your Amazon Web
  /// Services Private CA-hosted or on-premises root certificate is the last in
  /// the chain, and each certificate in the chain signs the one preceding.
  ///
  /// This parameter must be supplied when you import a subordinate CA. When you
  /// import a root CA, there is no chain.
  Future<void> importCertificateAuthorityCertificate({
    required Uint8List certificate,
    required String certificateAuthorityArn,
    Uint8List? certificateChain,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.ImportCertificateAuthorityCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': base64Encode(certificate),
        'CertificateAuthorityArn': certificateAuthorityArn,
        if (certificateChain != null)
          'CertificateChain': base64Encode(certificateChain),
      },
    );
  }

  /// Uses your private certificate authority (CA), or one that has been shared
  /// with you, to issue a client certificate. This action returns the Amazon
  /// Resource Name (ARN) of the certificate. You can retrieve the certificate
  /// by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificate.html">GetCertificate</a>
  /// action and specifying the ARN.
  /// <note>
  /// You cannot use the ACM <b>ListCertificateAuthorities</b> action to
  /// retrieve the ARNs of the certificates that you issue by using Amazon Web
  /// Services Private CA.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidArgsException].
  /// May throw [MalformedCSRException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [csr] :
  /// The certificate signing request (CSR) for the certificate you want to
  /// issue. As an example, you can use the following OpenSSL command to create
  /// the CSR and a 2048 bit RSA private key.
  ///
  /// <code>openssl req -new -newkey rsa:2048 -days 365 -keyout
  /// private/test_cert_priv_key.pem -out csr/test_cert_.csr</code>
  ///
  /// If you have a configuration file, you can then use the following OpenSSL
  /// command. The <code>usr_cert</code> block in the configuration file
  /// contains your X509 version 3 extensions.
  ///
  /// <code>openssl req -new -config openssl_rsa.cnf -extensions usr_cert
  /// -newkey rsa:2048 -days 365 -keyout private/test_cert_priv_key.pem -out
  /// csr/test_cert_.csr</code>
  ///
  /// Note: A CSR must provide either a <i>subject name</i> or a <i>subject
  /// alternative name</i> or the request will be rejected.
  ///
  /// Parameter [signingAlgorithm] :
  /// The name of the algorithm that will be used to sign the certificate to be
  /// issued.
  ///
  /// This parameter should not be confused with the
  /// <code>SigningAlgorithm</code> parameter used to sign a CSR in the
  /// <code>CreateCertificateAuthority</code> action.
  /// <note>
  /// The specified signing algorithm family (RSA or ECDSA) must match the
  /// algorithm family of the CA's secret key.
  /// </note>
  ///
  /// Parameter [validity] :
  /// Information describing the end of the validity period of the certificate.
  /// This parameter sets the “Not After” date for the certificate.
  ///
  /// Certificate validity is the period of time during which a certificate is
  /// valid. Validity can be expressed as an explicit date and time when the
  /// certificate expires, or as a span of time after issuance, stated in days,
  /// months, or years. For more information, see <a
  /// href="https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.5">Validity</a>
  /// in RFC 5280.
  ///
  /// This value is unaffected when <code>ValidityNotBefore</code> is also
  /// specified. For example, if <code>Validity</code> is set to 20 days in the
  /// future, the certificate will expire 20 days from issuance time regardless
  /// of the <code>ValidityNotBefore</code> value.
  ///
  /// The end of the validity period configured on a certificate must not exceed
  /// the limit set on its parents in the CA hierarchy.
  ///
  /// Parameter [apiPassthrough] :
  /// Specifies X.509 certificate information to be included in the issued
  /// certificate. An <code>APIPassthrough</code> or
  /// <code>APICSRPassthrough</code> template variant must be selected, or else
  /// this parameter is ignored. For more information about using these
  /// templates, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html">Understanding
  /// Certificate Templates</a>.
  ///
  /// If conflicting or duplicate certificate information is supplied during
  /// certificate issuance, Amazon Web Services Private CA applies <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html#template-order-of-operations">order
  /// of operation rules</a> to determine what information is used.
  ///
  /// Parameter [idempotencyToken] :
  /// Alphanumeric string that can be used to distinguish between calls to the
  /// <b>IssueCertificate</b> action. Idempotency tokens for
  /// <b>IssueCertificate</b> time out after five minutes. Therefore, if you
  /// call <b>IssueCertificate</b> multiple times with the same idempotency
  /// token within five minutes, Amazon Web Services Private CA recognizes that
  /// you are requesting only one certificate and will issue only one. If you
  /// change the idempotency token for each call, Amazon Web Services Private CA
  /// recognizes that you are requesting multiple certificates.
  ///
  /// Parameter [templateArn] :
  /// Specifies a custom configuration template to use when issuing a
  /// certificate. If this parameter is not provided, Amazon Web Services
  /// Private CA defaults to the <code>EndEntityCertificate/V1</code> template.
  /// For CA certificates, you should choose the shortest path length that meets
  /// your needs. The path length is indicated by the PathLen<i>N</i> portion of
  /// the ARN, where <i>N</i> is the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaTerms.html#terms-cadepth">CA
  /// depth</a>.
  ///
  /// Note: The CA depth configured on a subordinate CA certificate must not
  /// exceed the limit set by its parents in the CA hierarchy.
  ///
  /// For a list of <code>TemplateArn</code> values supported by Amazon Web
  /// Services Private CA, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html">Understanding
  /// Certificate Templates</a>.
  ///
  /// Parameter [validityNotBefore] :
  /// Information describing the start of the validity period of the
  /// certificate. This parameter sets the “Not Before" date for the
  /// certificate.
  ///
  /// By default, when issuing a certificate, Amazon Web Services Private CA
  /// sets the "Not Before" date to the issuance time minus 60 minutes. This
  /// compensates for clock inconsistencies across computer systems. The
  /// <code>ValidityNotBefore</code> parameter can be used to customize the “Not
  /// Before” value.
  ///
  /// Unlike the <code>Validity</code> parameter, the
  /// <code>ValidityNotBefore</code> parameter is optional.
  ///
  /// The <code>ValidityNotBefore</code> value is expressed as an explicit date
  /// and time, using the <code>Validity</code> type value
  /// <code>ABSOLUTE</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_Validity.html">Validity</a>
  /// in this API reference and <a
  /// href="https://datatracker.ietf.org/doc/html/rfc5280#section-4.1.2.5">Validity</a>
  /// in RFC 5280.
  Future<IssueCertificateResponse> issueCertificate({
    required String certificateAuthorityArn,
    required Uint8List csr,
    required SigningAlgorithm signingAlgorithm,
    required Validity validity,
    ApiPassthrough? apiPassthrough,
    String? idempotencyToken,
    String? templateArn,
    Validity? validityNotBefore,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.IssueCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        'Csr': base64Encode(csr),
        'SigningAlgorithm': signingAlgorithm.toValue(),
        'Validity': validity,
        if (apiPassthrough != null) 'ApiPassthrough': apiPassthrough,
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
        if (templateArn != null) 'TemplateArn': templateArn,
        if (validityNotBefore != null) 'ValidityNotBefore': validityNotBefore,
      },
    );

    return IssueCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Lists the private certificate authorities that you created by using the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response on each page. If additional items exist
  /// beyond the number you specify, the <code>NextToken</code> element is sent
  /// in the response. Use this <code>NextToken</code> value in a subsequent
  /// request to retrieve additional items.
  ///
  /// Although the maximum value is 1000, the action only returns a maximum of
  /// 100 items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  ///
  /// Parameter [resourceOwner] :
  /// Use this parameter to filter the returned set of certificate authorities
  /// based on their owner. The default is SELF.
  Future<ListCertificateAuthoritiesResponse> listCertificateAuthorities({
    int? maxResults,
    String? nextToken,
    ResourceOwner? resourceOwner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.ListCertificateAuthorities'
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
        if (resourceOwner != null) 'ResourceOwner': resourceOwner.toValue(),
      },
    );

    return ListCertificateAuthoritiesResponse.fromJson(jsonResponse.body);
  }

  /// List all permissions on a private CA, if any, granted to the Certificate
  /// Manager (ACM) service principal (acm.amazonaws.com).
  ///
  /// These permissions allow ACM to issue and renew ACM certificates that
  /// reside in the same Amazon Web Services account as the CA.
  ///
  /// Permissions can be granted with the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreatePermission.html">CreatePermission</a>
  /// action and revoked with the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePermission.html">DeletePermission</a>
  /// action.
  /// <p class="title"> <b>About Permissions</b>
  ///
  /// <ul>
  /// <li>
  /// If the private CA and the certificates it issues reside in the same
  /// account, you can use <code>CreatePermission</code> to grant permissions
  /// for ACM to carry out automatic certificate renewals.
  /// </li>
  /// <li>
  /// For automatic certificate renewal to succeed, the ACM service principal
  /// needs permissions to create, retrieve, and list certificates.
  /// </li>
  /// <li>
  /// If the private CA and the ACM certificates reside in different accounts,
  /// then permissions cannot be used to enable automatic renewals. Instead, the
  /// ACM certificate owner must set up a resource-based policy to enable
  /// cross-account issuance and renewals. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with Amazon Web Services Private CA</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidStateException].
  /// May throw [RequestFailedException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Number (ARN) of the private CA to inspect. You can
  /// find the ARN by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. This must be of the form:
  /// <code>arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012</code>
  /// You can get a private CA's ARN by running the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action.
  ///
  /// Parameter [maxResults] :
  /// When paginating results, use this parameter to specify the maximum number
  /// of items to return in the response. If additional items exist beyond the
  /// number you specify, the <b>NextToken</b> element is sent in the response.
  /// Use this <b>NextToken</b> value in a subsequent request to retrieve
  /// additional items.
  ///
  /// Parameter [nextToken] :
  /// When paginating results, use this parameter in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of
  /// <b>NextToken</b> from the response you just received.
  Future<ListPermissionsResponse> listPermissions({
    required String certificateAuthorityArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.ListPermissions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPermissionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags, if any, that are associated with your private CA or one
  /// that has been shared with you. Tags are labels that you can use to
  /// identify and organize your CAs. Each tag consists of a key and an optional
  /// value. Call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_TagCertificateAuthority.html">TagCertificateAuthority</a>
  /// action to add one or more tags to your CA. Call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UntagCertificateAuthority.html">UntagCertificateAuthority</a>
  /// action to remove tags.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action. This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [maxResults] :
  /// Use this parameter when paginating results to specify the maximum number
  /// of items to return in the response. If additional items exist beyond the
  /// number you specify, the <b>NextToken</b> element is sent in the response.
  /// Use this <b>NextToken</b> value in a subsequent request to retrieve
  /// additional items.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of
  /// <b>NextToken</b> from the response you just received.
  Future<ListTagsResponse> listTags({
    required String certificateAuthorityArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsResponse.fromJson(jsonResponse.body);
  }

  /// Attaches a resource-based policy to a private CA.
  ///
  /// A policy can also be applied by sharing a private CA through Amazon Web
  /// Services Resource Access Manager (RAM). For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html">Attach
  /// a Policy for Cross-Account Access</a>.
  ///
  /// The policy can be displayed with <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetPolicy.html">GetPolicy</a>
  /// and removed with <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePolicy.html">DeletePolicy</a>.
  /// <p class="title"> <b>About Policies</b>
  ///
  /// <ul>
  /// <li>
  /// A policy grants access on a private CA to an Amazon Web Services customer
  /// account, to Amazon Web Services Organizations, or to an Amazon Web
  /// Services Organizations unit. Policies are under the control of a CA
  /// administrator. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with Amazon Web Services Private CA</a>.
  /// </li>
  /// <li>
  /// A policy permits a user of Certificate Manager (ACM) to issue ACM
  /// certificates signed by a CA in another account.
  /// </li>
  /// <li>
  /// For ACM to manage automatic renewal of these certificates, the ACM user
  /// must configure a Service Linked Role (SLR). The SLR allows the ACM service
  /// to assume the identity of the user, subject to confirmation against the
  /// Amazon Web Services Private CA policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html">Using
  /// a Service Linked Role with ACM</a>.
  /// </li>
  /// <li>
  /// Updates made in Amazon Web Services Resource Manager (RAM) are reflected
  /// in policies. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/pca-ram.html">Attach
  /// a Policy for Cross-Account Access</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidPolicyException].
  /// May throw [LockoutPreventedException].
  /// May throw [RequestFailedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [policy] :
  /// The path and file name of a JSON-formatted IAM policy to attach to the
  /// specified private CA resource. If this policy does not contain all
  /// required statements or if it includes any statement that is not allowed,
  /// the <code>PutPolicy</code> action returns an
  /// <code>InvalidPolicyException</code>. For information about IAM policy and
  /// statement structure, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#access_policies-json">Overview
  /// of JSON Policies</a>.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Number (ARN) of the private CA to associate with the
  /// policy. The ARN of the CA can be found by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action.
  /// <p/>
  Future<void> putPolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.PutPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Policy': policy,
        'ResourceArn': resourceArn,
      },
    );
  }

  /// Restores a certificate authority (CA) that is in the <code>DELETED</code>
  /// state. You can restore a CA during the period that you defined in the
  /// <b>PermanentDeletionTimeInDays</b> parameter of the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeleteCertificateAuthority.html">DeleteCertificateAuthority</a>
  /// action. Currently, you can specify 7 to 30 days. If you did not specify a
  /// <b>PermanentDeletionTimeInDays</b> value, by default you can restore the
  /// CA at any time in a 30 day period. You can check the time remaining in the
  /// restoration period of a private CA in the <code>DELETED</code> state by
  /// calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DescribeCertificateAuthority.html">DescribeCertificateAuthority</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// actions. The status of a restored CA is set to its pre-deletion status
  /// when the <b>RestoreCertificateAuthority</b> action returns. To change its
  /// status to <code>ACTIVE</code>, call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// action. If the private CA was in the <code>PENDING_CERTIFICATE</code>
  /// state at deletion, you must use the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html">ImportCertificateAuthorityCertificate</a>
  /// action to import a certificate authority into the private CA before it can
  /// be activated. You cannot restore a CA after the restoration period has
  /// ended.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidArnException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action. This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  Future<void> restoreCertificateAuthority({
    required String certificateAuthorityArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.RestoreCertificateAuthority'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
      },
    );
  }

  /// Revokes a certificate that was issued inside Amazon Web Services Private
  /// CA. If you enable a certificate revocation list (CRL) when you create or
  /// update your private CA, information about the revoked certificates will be
  /// included in the CRL. Amazon Web Services Private CA writes the CRL to an
  /// S3 bucket that you specify. A CRL is typically updated approximately 30
  /// minutes after a certificate is revoked. If for any reason the CRL update
  /// fails, Amazon Web Services Private CA attempts makes further attempts
  /// every 15 minutes. With Amazon CloudWatch, you can create alarms for the
  /// metrics <code>CRLGenerated</code> and <code>MisconfiguredCRLBucket</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaCloudWatch.html">Supported
  /// CloudWatch Metrics</a>.
  /// <note>
  /// Both Amazon Web Services Private CA and the IAM principal must have
  /// permission to write to the S3 bucket that you specify. If the IAM
  /// principal making the call does not have permission to write to the bucket,
  /// then an exception is thrown. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#s3-policies">Access
  /// policies for CRLs in Amazon S3</a>.
  /// </note>
  /// Amazon Web Services Private CA also writes revocation information to the
  /// audit report. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>.
  /// <note>
  /// You cannot revoke a root CA self-signed certificate.
  /// </note>
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestAlreadyProcessedException].
  /// May throw [RequestInProgressException].
  /// May throw [RequestFailedException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// Amazon Resource Name (ARN) of the private CA that issued the certificate
  /// to be revoked. This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [certificateSerial] :
  /// Serial number of the certificate to be revoked. This must be in
  /// hexadecimal format. You can retrieve the serial number by calling <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificate.html">GetCertificate</a>
  /// with the Amazon Resource Name (ARN) of the certificate you want and the
  /// ARN of your private CA. The <b>GetCertificate</b> action retrieves the
  /// certificate in the PEM format. You can use the following OpenSSL command
  /// to list the certificate in text format and copy the hexadecimal serial
  /// number.
  ///
  /// <code>openssl x509 -in <i>file_path</i> -text -noout</code>
  ///
  /// You can also copy the serial number from the console or use the <a
  /// href="https://docs.aws.amazon.com/acm/latest/APIReference/API_DescribeCertificate.html">DescribeCertificate</a>
  /// action in the <i>Certificate Manager API Reference</i>.
  ///
  /// Parameter [revocationReason] :
  /// Specifies why you revoked the certificate.
  Future<void> revokeCertificate({
    required String certificateAuthorityArn,
    required String certificateSerial,
    required RevocationReason revocationReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.RevokeCertificate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        'CertificateSerial': certificateSerial,
        'RevocationReason': revocationReason.toValue(),
      },
    );
  }

  /// Adds one or more tags to your private CA. Tags are labels that you can use
  /// to identify and organize your Amazon Web Services resources. Each tag
  /// consists of a key and an optional value. You specify the private CA on
  /// input by its Amazon Resource Name (ARN). You specify the tag by using a
  /// key-value pair. You can apply a tag to just one private CA if you want to
  /// identify a specific characteristic of that CA, or you can apply the same
  /// tag to multiple private CAs if you want to filter for a common
  /// relationship among those CAs. To remove one or more tags, use the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UntagCertificateAuthority.html">UntagCertificateAuthority</a>
  /// action. Call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListTags.html">ListTags</a>
  /// action to see what tags are associated with your CA.
  /// <note>
  /// To attach tags to a private CA during the creation procedure, a CA
  /// administrator must first associate an inline IAM policy with the
  /// <code>CreateCertificateAuthority</code> action and explicitly allow
  /// tagging. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/auth-InlinePolicies.html#policy-tag-ca">Attaching
  /// tags to a CA at the time of creation</a>.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidTagException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [tags] :
  /// List of tags to be associated with the CA.
  Future<void> tagCertificateAuthority({
    required String certificateAuthorityArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.TagCertificateAuthority'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        'Tags': tags,
      },
    );
  }

  /// Remove one or more tags from your private CA. A tag consists of a
  /// key-value pair. If you do not specify the value portion of the tag when
  /// calling this action, the tag will be removed regardless of value. If you
  /// specify a value, the tag is removed only if it is associated with the
  /// specified value. To add tags to a private CA, use the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_TagCertificateAuthority.html">TagCertificateAuthority</a>.
  /// Call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListTags.html">ListTags</a>
  /// action to see what tags are associated with your CA.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidTagException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [tags] :
  /// List of tags to be removed from the CA.
  Future<void> untagCertificateAuthority({
    required String certificateAuthorityArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.UntagCertificateAuthority'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        'Tags': tags,
      },
    );
  }

  /// Updates the status or configuration of a private certificate authority
  /// (CA). Your private CA must be in the <code>ACTIVE</code> or
  /// <code>DISABLED</code> state before you can update it. You can disable a
  /// private CA that is in the <code>ACTIVE</code> state or make a CA that is
  /// in the <code>DISABLED</code> state active again.
  /// <note>
  /// Both Amazon Web Services Private CA and the IAM principal must have
  /// permission to write to the S3 bucket that you specify. If the IAM
  /// principal making the call does not have permission to write to the bucket,
  /// then an exception is thrown. For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html#s3-policies">Access
  /// policies for CRLs in Amazon S3</a>.
  /// </note>
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgsException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidPolicyException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// Amazon Resource Name (ARN) of the private CA that issued the certificate
  /// to be revoked. This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [revocationConfiguration] :
  /// Contains information to enable Online Certificate Status Protocol (OCSP)
  /// support, to enable a certificate revocation list (CRL), to enable both, or
  /// to enable neither. If this parameter is not supplied, existing capibilites
  /// remain unchanged. For more information, see the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_OcspConfiguration.html">OcspConfiguration</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CrlConfiguration.html">CrlConfiguration</a>
  /// types.
  /// <note>
  /// The following requirements apply to revocation configurations.
  ///
  /// <ul>
  /// <li>
  /// A configuration disabling CRLs or OCSP must contain only the
  /// <code>Enabled=False</code> parameter, and will fail if other parameters
  /// such as <code>CustomCname</code> or <code>ExpirationInDays</code> are
  /// included.
  /// </li>
  /// <li>
  /// In a CRL configuration, the <code>S3BucketName</code> parameter must
  /// conform to <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html">Amazon
  /// S3 bucket naming rules</a>.
  /// </li>
  /// <li>
  /// A configuration containing a custom Canonical Name (CNAME) parameter for
  /// CRLs or OCSP must conform to <a
  /// href="https://www.ietf.org/rfc/rfc2396.txt">RFC2396</a> restrictions on
  /// the use of special characters in a CNAME.
  /// </li>
  /// <li>
  /// In a CRL or OCSP configuration, the value of a CNAME parameter must not
  /// include a protocol prefix such as "http://" or "https://".
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [status] :
  /// Status of your private CA.
  Future<void> updateCertificateAuthority({
    required String certificateAuthorityArn,
    RevocationConfiguration? revocationConfiguration,
    CertificateAuthorityStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.UpdateCertificateAuthority'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        if (revocationConfiguration != null)
          'RevocationConfiguration': revocationConfiguration,
        if (status != null) 'Status': status.toValue(),
      },
    );
  }
}

/// Contains information about the certificate subject. The <code>Subject</code>
/// field in the certificate identifies the entity that owns or controls the
/// public key in the certificate. The entity can be a user, computer, device,
/// or service. The <code>Subject </code>must contain an X.500 distinguished
/// name (DN). A DN is a sequence of relative distinguished names (RDNs). The
/// RDNs are separated by commas in the certificate.
class ASN1Subject {
  /// For CA and end-entity certificates in a private PKI, the common name (CN)
  /// can be any string within the length limit.
  ///
  /// Note: In publicly trusted certificates, the common name must be a fully
  /// qualified domain name (FQDN) associated with the certificate subject.
  final String? commonName;

  /// Two-digit code that specifies the country in which the certificate subject
  /// located.
  final String? country;

  /// <p/>
  /// Contains a sequence of one or more X.500 relative distinguished names
  /// (RDNs), each of which consists of an object identifier (OID) and a value.
  /// For more information, see NIST’s definition of <a
  /// href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
  /// Identifier (OID)</a>.
  /// <note>
  /// Custom attributes cannot be used in combination with standard attributes.
  /// </note>
  final List<CustomAttribute>? customAttributes;

  /// Disambiguating information for the certificate subject.
  final String? distinguishedNameQualifier;

  /// Typically a qualifier appended to the name of an individual. Examples
  /// include Jr. for junior, Sr. for senior, and III for third.
  final String? generationQualifier;

  /// First name.
  final String? givenName;

  /// Concatenation that typically contains the first letter of the
  /// <b>GivenName</b>, the first letter of the middle name if one exists, and the
  /// first letter of the <b>Surname</b>.
  final String? initials;

  /// The locality (such as a city or town) in which the certificate subject is
  /// located.
  final String? locality;

  /// Legal name of the organization with which the certificate subject is
  /// affiliated.
  final String? organization;

  /// A subdivision or unit of the organization (such as sales or finance) with
  /// which the certificate subject is affiliated.
  final String? organizationalUnit;

  /// Typically a shortened version of a longer <b>GivenName</b>. For example,
  /// Jonathan is often shortened to John. Elizabeth is often shortened to Beth,
  /// Liz, or Eliza.
  final String? pseudonym;

  /// The certificate serial number.
  final String? serialNumber;

  /// State in which the subject of the certificate is located.
  final String? state;

  /// Family name. In the US and the UK, for example, the surname of an individual
  /// is ordered last. In Asian cultures the surname is typically ordered first.
  final String? surname;

  /// A title such as Mr. or Ms., which is pre-pended to the name to refer
  /// formally to the certificate subject.
  final String? title;

  ASN1Subject({
    this.commonName,
    this.country,
    this.customAttributes,
    this.distinguishedNameQualifier,
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

  factory ASN1Subject.fromJson(Map<String, dynamic> json) {
    return ASN1Subject(
      commonName: json['CommonName'] as String?,
      country: json['Country'] as String?,
      customAttributes: (json['CustomAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => CustomAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      distinguishedNameQualifier: json['DistinguishedNameQualifier'] as String?,
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

/// Provides access information used by the <code>authorityInfoAccess</code> and
/// <code>subjectInfoAccess</code> extensions described in <a
/// href="https://datatracker.ietf.org/doc/html/rfc5280">RFC 5280</a>.
class AccessDescription {
  /// The location of <code>AccessDescription</code> information.
  final GeneralName accessLocation;

  /// The type and format of <code>AccessDescription</code> information.
  final AccessMethod accessMethod;

  AccessDescription({
    required this.accessLocation,
    required this.accessMethod,
  });

  factory AccessDescription.fromJson(Map<String, dynamic> json) {
    return AccessDescription(
      accessLocation:
          GeneralName.fromJson(json['AccessLocation'] as Map<String, dynamic>),
      accessMethod:
          AccessMethod.fromJson(json['AccessMethod'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final accessLocation = this.accessLocation;
    final accessMethod = this.accessMethod;
    return {
      'AccessLocation': accessLocation,
      'AccessMethod': accessMethod,
    };
  }
}

/// Describes the type and format of extension access. Only one of
/// <code>CustomObjectIdentifier</code> or <code>AccessMethodType</code> may be
/// provided. Providing both results in <code>InvalidArgsException</code>.
class AccessMethod {
  /// Specifies the <code>AccessMethod</code>.
  final AccessMethodType? accessMethodType;

  /// An object identifier (OID) specifying the <code>AccessMethod</code>. The OID
  /// must satisfy the regular expression shown below. For more information, see
  /// NIST's definition of <a
  /// href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
  /// Identifier (OID)</a>.
  final String? customObjectIdentifier;

  AccessMethod({
    this.accessMethodType,
    this.customObjectIdentifier,
  });

  factory AccessMethod.fromJson(Map<String, dynamic> json) {
    return AccessMethod(
      accessMethodType:
          (json['AccessMethodType'] as String?)?.toAccessMethodType(),
      customObjectIdentifier: json['CustomObjectIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessMethodType = this.accessMethodType;
    final customObjectIdentifier = this.customObjectIdentifier;
    return {
      if (accessMethodType != null)
        'AccessMethodType': accessMethodType.toValue(),
      if (customObjectIdentifier != null)
        'CustomObjectIdentifier': customObjectIdentifier,
    };
  }
}

enum AccessMethodType {
  caRepository,
  resourcePkiManifest,
  resourcePkiNotify,
}

extension AccessMethodTypeValueExtension on AccessMethodType {
  String toValue() {
    switch (this) {
      case AccessMethodType.caRepository:
        return 'CA_REPOSITORY';
      case AccessMethodType.resourcePkiManifest:
        return 'RESOURCE_PKI_MANIFEST';
      case AccessMethodType.resourcePkiNotify:
        return 'RESOURCE_PKI_NOTIFY';
    }
  }
}

extension AccessMethodTypeFromString on String {
  AccessMethodType toAccessMethodType() {
    switch (this) {
      case 'CA_REPOSITORY':
        return AccessMethodType.caRepository;
      case 'RESOURCE_PKI_MANIFEST':
        return AccessMethodType.resourcePkiManifest;
      case 'RESOURCE_PKI_NOTIFY':
        return AccessMethodType.resourcePkiNotify;
    }
    throw Exception('$this is not known in enum AccessMethodType');
  }
}

enum ActionType {
  issueCertificate,
  getCertificate,
  listPermissions,
}

extension ActionTypeValueExtension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.issueCertificate:
        return 'IssueCertificate';
      case ActionType.getCertificate:
        return 'GetCertificate';
      case ActionType.listPermissions:
        return 'ListPermissions';
    }
  }
}

extension ActionTypeFromString on String {
  ActionType toActionType() {
    switch (this) {
      case 'IssueCertificate':
        return ActionType.issueCertificate;
      case 'GetCertificate':
        return ActionType.getCertificate;
      case 'ListPermissions':
        return ActionType.listPermissions;
    }
    throw Exception('$this is not known in enum ActionType');
  }
}

/// Contains X.509 certificate information to be placed in an issued
/// certificate. An <code>APIPassthrough</code> or
/// <code>APICSRPassthrough</code> template variant must be selected, or else
/// this parameter is ignored.
///
/// If conflicting or duplicate certificate information is supplied from other
/// sources, Amazon Web Services Private CA applies <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html#template-order-of-operations">order
/// of operation rules</a> to determine what information is used.
class ApiPassthrough {
  /// Specifies X.509 extension information for a certificate.
  final Extensions? extensions;
  final ASN1Subject? subject;

  ApiPassthrough({
    this.extensions,
    this.subject,
  });

  Map<String, dynamic> toJson() {
    final extensions = this.extensions;
    final subject = this.subject;
    return {
      if (extensions != null) 'Extensions': extensions,
      if (subject != null) 'Subject': subject,
    };
  }
}

enum AuditReportResponseFormat {
  json,
  csv,
}

extension AuditReportResponseFormatValueExtension on AuditReportResponseFormat {
  String toValue() {
    switch (this) {
      case AuditReportResponseFormat.json:
        return 'JSON';
      case AuditReportResponseFormat.csv:
        return 'CSV';
    }
  }
}

extension AuditReportResponseFormatFromString on String {
  AuditReportResponseFormat toAuditReportResponseFormat() {
    switch (this) {
      case 'JSON':
        return AuditReportResponseFormat.json;
      case 'CSV':
        return AuditReportResponseFormat.csv;
    }
    throw Exception('$this is not known in enum AuditReportResponseFormat');
  }
}

enum AuditReportStatus {
  creating,
  success,
  failed,
}

extension AuditReportStatusValueExtension on AuditReportStatus {
  String toValue() {
    switch (this) {
      case AuditReportStatus.creating:
        return 'CREATING';
      case AuditReportStatus.success:
        return 'SUCCESS';
      case AuditReportStatus.failed:
        return 'FAILED';
    }
  }
}

extension AuditReportStatusFromString on String {
  AuditReportStatus toAuditReportStatus() {
    switch (this) {
      case 'CREATING':
        return AuditReportStatus.creating;
      case 'SUCCESS':
        return AuditReportStatus.success;
      case 'FAILED':
        return AuditReportStatus.failed;
    }
    throw Exception('$this is not known in enum AuditReportStatus');
  }
}

/// Contains information about your private certificate authority (CA). Your
/// private CA can issue and revoke X.509 digital certificates. Digital
/// certificates verify that the entity named in the certificate <b>Subject</b>
/// field owns or controls the public key contained in the <b>Subject Public Key
/// Info</b> field. Call the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
/// action to create your private CA. You must then call the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_GetCertificateAuthorityCertificate.html">GetCertificateAuthorityCertificate</a>
/// action to retrieve a private CA certificate signing request (CSR). Sign the
/// CSR with your Amazon Web Services Private CA-hosted or on-premises root or
/// subordinate CA certificate. Call the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html">ImportCertificateAuthorityCertificate</a>
/// action to import the signed certificate into Certificate Manager (ACM).
class CertificateAuthority {
  /// Amazon Resource Name (ARN) for your private certificate authority (CA). The
  /// format is <code> <i>12345678-1234-1234-1234-123456789012</i> </code>.
  final String? arn;

  /// Your private CA configuration.
  final CertificateAuthorityConfiguration? certificateAuthorityConfiguration;

  /// Date and time at which your private CA was created.
  final DateTime? createdAt;

  /// Reason the request to create your private CA failed.
  final FailureReason? failureReason;

  /// Defines a cryptographic key management compliance standard used for handling
  /// CA keys.
  ///
  /// Default: FIPS_140_2_LEVEL_3_OR_HIGHER
  ///
  /// Note: Amazon Web Services Region ap-northeast-3 supports only
  /// FIPS_140_2_LEVEL_2_OR_HIGHER. You must explicitly specify this parameter and
  /// value when creating a CA in that Region. Specifying a different value (or no
  /// value) results in an <code>InvalidArgsException</code> with the message "A
  /// certificate authority cannot be created in this region with the specified
  /// security standard."
  final KeyStorageSecurityStandard? keyStorageSecurityStandard;

  /// Date and time at which your private CA was last updated.
  final DateTime? lastStateChangeAt;

  /// Date and time after which your private CA certificate is not valid.
  final DateTime? notAfter;

  /// Date and time before which your private CA certificate is not valid.
  final DateTime? notBefore;

  /// The Amazon Web Services account ID that owns the certificate authority.
  final String? ownerAccount;

  /// The period during which a deleted CA can be restored. For more information,
  /// see the <code>PermanentDeletionTimeInDays</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeleteCertificateAuthorityRequest.html">DeleteCertificateAuthorityRequest</a>
  /// action.
  final DateTime? restorableUntil;

  /// Information about the Online Certificate Status Protocol (OCSP)
  /// configuration or certificate revocation list (CRL) created and maintained by
  /// your private CA.
  final RevocationConfiguration? revocationConfiguration;

  /// Serial number of your private CA.
  final String? serial;

  /// Status of your private CA.
  final CertificateAuthorityStatus? status;

  /// Type of your private CA.
  final CertificateAuthorityType? type;

  /// Specifies whether the CA issues general-purpose certificates that typically
  /// require a revocation mechanism, or short-lived certificates that may
  /// optionally omit revocation because they expire quickly. Short-lived
  /// certificate validity is limited to seven days.
  ///
  /// The default value is GENERAL_PURPOSE.
  final CertificateAuthorityUsageMode? usageMode;

  CertificateAuthority({
    this.arn,
    this.certificateAuthorityConfiguration,
    this.createdAt,
    this.failureReason,
    this.keyStorageSecurityStandard,
    this.lastStateChangeAt,
    this.notAfter,
    this.notBefore,
    this.ownerAccount,
    this.restorableUntil,
    this.revocationConfiguration,
    this.serial,
    this.status,
    this.type,
    this.usageMode,
  });

  factory CertificateAuthority.fromJson(Map<String, dynamic> json) {
    return CertificateAuthority(
      arn: json['Arn'] as String?,
      certificateAuthorityConfiguration:
          json['CertificateAuthorityConfiguration'] != null
              ? CertificateAuthorityConfiguration.fromJson(
                  json['CertificateAuthorityConfiguration']
                      as Map<String, dynamic>)
              : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      failureReason: (json['FailureReason'] as String?)?.toFailureReason(),
      keyStorageSecurityStandard:
          (json['KeyStorageSecurityStandard'] as String?)
              ?.toKeyStorageSecurityStandard(),
      lastStateChangeAt: timeStampFromJson(json['LastStateChangeAt']),
      notAfter: timeStampFromJson(json['NotAfter']),
      notBefore: timeStampFromJson(json['NotBefore']),
      ownerAccount: json['OwnerAccount'] as String?,
      restorableUntil: timeStampFromJson(json['RestorableUntil']),
      revocationConfiguration: json['RevocationConfiguration'] != null
          ? RevocationConfiguration.fromJson(
              json['RevocationConfiguration'] as Map<String, dynamic>)
          : null,
      serial: json['Serial'] as String?,
      status: (json['Status'] as String?)?.toCertificateAuthorityStatus(),
      type: (json['Type'] as String?)?.toCertificateAuthorityType(),
      usageMode:
          (json['UsageMode'] as String?)?.toCertificateAuthorityUsageMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final certificateAuthorityConfiguration =
        this.certificateAuthorityConfiguration;
    final createdAt = this.createdAt;
    final failureReason = this.failureReason;
    final keyStorageSecurityStandard = this.keyStorageSecurityStandard;
    final lastStateChangeAt = this.lastStateChangeAt;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final ownerAccount = this.ownerAccount;
    final restorableUntil = this.restorableUntil;
    final revocationConfiguration = this.revocationConfiguration;
    final serial = this.serial;
    final status = this.status;
    final type = this.type;
    final usageMode = this.usageMode;
    return {
      if (arn != null) 'Arn': arn,
      if (certificateAuthorityConfiguration != null)
        'CertificateAuthorityConfiguration': certificateAuthorityConfiguration,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (failureReason != null) 'FailureReason': failureReason.toValue(),
      if (keyStorageSecurityStandard != null)
        'KeyStorageSecurityStandard': keyStorageSecurityStandard.toValue(),
      if (lastStateChangeAt != null)
        'LastStateChangeAt': unixTimestampToJson(lastStateChangeAt),
      if (notAfter != null) 'NotAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'NotBefore': unixTimestampToJson(notBefore),
      if (ownerAccount != null) 'OwnerAccount': ownerAccount,
      if (restorableUntil != null)
        'RestorableUntil': unixTimestampToJson(restorableUntil),
      if (revocationConfiguration != null)
        'RevocationConfiguration': revocationConfiguration,
      if (serial != null) 'Serial': serial,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (usageMode != null) 'UsageMode': usageMode.toValue(),
    };
  }
}

/// Contains configuration information for your private certificate authority
/// (CA). This includes information about the class of public key algorithm and
/// the key pair that your private CA creates when it issues a certificate. It
/// also includes the signature algorithm that it uses when issuing
/// certificates, and its X.500 distinguished name. You must specify this
/// information when you call the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
/// action.
class CertificateAuthorityConfiguration {
  /// Type of the public key algorithm and size, in bits, of the key pair that
  /// your CA creates when it issues a certificate. When you create a subordinate
  /// CA, you must use a key algorithm supported by the parent CA.
  final KeyAlgorithm keyAlgorithm;

  /// Name of the algorithm your private CA uses to sign certificate requests.
  ///
  /// This parameter should not be confused with the <code>SigningAlgorithm</code>
  /// parameter used to sign certificates when they are issued.
  final SigningAlgorithm signingAlgorithm;

  /// Structure that contains X.500 distinguished name information for your
  /// private CA.
  final ASN1Subject subject;

  /// Specifies information to be added to the extension section of the
  /// certificate signing request (CSR).
  final CsrExtensions? csrExtensions;

  CertificateAuthorityConfiguration({
    required this.keyAlgorithm,
    required this.signingAlgorithm,
    required this.subject,
    this.csrExtensions,
  });

  factory CertificateAuthorityConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CertificateAuthorityConfiguration(
      keyAlgorithm: (json['KeyAlgorithm'] as String).toKeyAlgorithm(),
      signingAlgorithm:
          (json['SigningAlgorithm'] as String).toSigningAlgorithm(),
      subject: ASN1Subject.fromJson(json['Subject'] as Map<String, dynamic>),
      csrExtensions: json['CsrExtensions'] != null
          ? CsrExtensions.fromJson(
              json['CsrExtensions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyAlgorithm = this.keyAlgorithm;
    final signingAlgorithm = this.signingAlgorithm;
    final subject = this.subject;
    final csrExtensions = this.csrExtensions;
    return {
      'KeyAlgorithm': keyAlgorithm.toValue(),
      'SigningAlgorithm': signingAlgorithm.toValue(),
      'Subject': subject,
      if (csrExtensions != null) 'CsrExtensions': csrExtensions,
    };
  }
}

enum CertificateAuthorityStatus {
  creating,
  pendingCertificate,
  active,
  deleted,
  disabled,
  expired,
  failed,
}

extension CertificateAuthorityStatusValueExtension
    on CertificateAuthorityStatus {
  String toValue() {
    switch (this) {
      case CertificateAuthorityStatus.creating:
        return 'CREATING';
      case CertificateAuthorityStatus.pendingCertificate:
        return 'PENDING_CERTIFICATE';
      case CertificateAuthorityStatus.active:
        return 'ACTIVE';
      case CertificateAuthorityStatus.deleted:
        return 'DELETED';
      case CertificateAuthorityStatus.disabled:
        return 'DISABLED';
      case CertificateAuthorityStatus.expired:
        return 'EXPIRED';
      case CertificateAuthorityStatus.failed:
        return 'FAILED';
    }
  }
}

extension CertificateAuthorityStatusFromString on String {
  CertificateAuthorityStatus toCertificateAuthorityStatus() {
    switch (this) {
      case 'CREATING':
        return CertificateAuthorityStatus.creating;
      case 'PENDING_CERTIFICATE':
        return CertificateAuthorityStatus.pendingCertificate;
      case 'ACTIVE':
        return CertificateAuthorityStatus.active;
      case 'DELETED':
        return CertificateAuthorityStatus.deleted;
      case 'DISABLED':
        return CertificateAuthorityStatus.disabled;
      case 'EXPIRED':
        return CertificateAuthorityStatus.expired;
      case 'FAILED':
        return CertificateAuthorityStatus.failed;
    }
    throw Exception('$this is not known in enum CertificateAuthorityStatus');
  }
}

enum CertificateAuthorityType {
  root,
  subordinate,
}

extension CertificateAuthorityTypeValueExtension on CertificateAuthorityType {
  String toValue() {
    switch (this) {
      case CertificateAuthorityType.root:
        return 'ROOT';
      case CertificateAuthorityType.subordinate:
        return 'SUBORDINATE';
    }
  }
}

extension CertificateAuthorityTypeFromString on String {
  CertificateAuthorityType toCertificateAuthorityType() {
    switch (this) {
      case 'ROOT':
        return CertificateAuthorityType.root;
      case 'SUBORDINATE':
        return CertificateAuthorityType.subordinate;
    }
    throw Exception('$this is not known in enum CertificateAuthorityType');
  }
}

enum CertificateAuthorityUsageMode {
  generalPurpose,
  shortLivedCertificate,
}

extension CertificateAuthorityUsageModeValueExtension
    on CertificateAuthorityUsageMode {
  String toValue() {
    switch (this) {
      case CertificateAuthorityUsageMode.generalPurpose:
        return 'GENERAL_PURPOSE';
      case CertificateAuthorityUsageMode.shortLivedCertificate:
        return 'SHORT_LIVED_CERTIFICATE';
    }
  }
}

extension CertificateAuthorityUsageModeFromString on String {
  CertificateAuthorityUsageMode toCertificateAuthorityUsageMode() {
    switch (this) {
      case 'GENERAL_PURPOSE':
        return CertificateAuthorityUsageMode.generalPurpose;
      case 'SHORT_LIVED_CERTIFICATE':
        return CertificateAuthorityUsageMode.shortLivedCertificate;
    }
    throw Exception('$this is not known in enum CertificateAuthorityUsageMode');
  }
}

class CreateCertificateAuthorityAuditReportResponse {
  /// An alphanumeric string that contains a report identifier.
  final String? auditReportId;

  /// The <b>key</b> that uniquely identifies the report file in your S3 bucket.
  final String? s3Key;

  CreateCertificateAuthorityAuditReportResponse({
    this.auditReportId,
    this.s3Key,
  });

  factory CreateCertificateAuthorityAuditReportResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCertificateAuthorityAuditReportResponse(
      auditReportId: json['AuditReportId'] as String?,
      s3Key: json['S3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final auditReportId = this.auditReportId;
    final s3Key = this.s3Key;
    return {
      if (auditReportId != null) 'AuditReportId': auditReportId,
      if (s3Key != null) 'S3Key': s3Key,
    };
  }
}

class CreateCertificateAuthorityResponse {
  /// If successful, the Amazon Resource Name (ARN) of the certificate authority
  /// (CA). This is of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  final String? certificateAuthorityArn;

  CreateCertificateAuthorityResponse({
    this.certificateAuthorityArn,
  });

  factory CreateCertificateAuthorityResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCertificateAuthorityResponse(
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArn = this.certificateAuthorityArn;
    return {
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
    };
  }
}

/// Contains configuration information for a certificate revocation list (CRL).
/// Your private certificate authority (CA) creates base CRLs. Delta CRLs are
/// not supported. You can enable CRLs for your new or an existing private CA by
/// setting the <b>Enabled</b> parameter to <code>true</code>. Your private CA
/// writes CRLs to an S3 bucket that you specify in the <b>S3BucketName</b>
/// parameter. You can hide the name of your bucket by specifying a value for
/// the <b>CustomCname</b> parameter. Your private CA by default copies the
/// CNAME or the S3 bucket name to the <b>CRL Distribution Points</b> extension
/// of each certificate it issues. If you want to configure this default
/// behavior to be something different, you can set the
/// <b>CrlDistributionPointExtensionConfiguration</b> parameter. Your S3 bucket
/// policy must give write permission to Amazon Web Services Private CA.
///
/// Amazon Web Services Private CA assets that are stored in Amazon S3 can be
/// protected with encryption. For more information, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaCreateCa.html#crl-encryption">Encrypting
/// Your CRLs</a>.
///
/// Your private CA uses the value in the <b>ExpirationInDays</b> parameter to
/// calculate the <b>nextUpdate</b> field in the CRL. The CRL is refreshed prior
/// to a certificate's expiration date or when a certificate is revoked. When a
/// certificate is revoked, it appears in the CRL until the certificate expires,
/// and then in one additional CRL after expiration, and it always appears in
/// the audit report.
///
/// A CRL is typically updated approximately 30 minutes after a certificate is
/// revoked. If for any reason a CRL update fails, Amazon Web Services Private
/// CA makes further attempts every 15 minutes.
///
/// CRLs contain the following fields:
///
/// <ul>
/// <li>
/// <b>Version</b>: The current version number defined in RFC 5280 is V2. The
/// integer value is 0x1.
/// </li>
/// <li>
/// <b>Signature Algorithm</b>: The name of the algorithm used to sign the CRL.
/// </li>
/// <li>
/// <b>Issuer</b>: The X.500 distinguished name of your private CA that issued
/// the CRL.
/// </li>
/// <li>
/// <b>Last Update</b>: The issue date and time of this CRL.
/// </li>
/// <li>
/// <b>Next Update</b>: The day and time by which the next CRL will be issued.
/// </li>
/// <li>
/// <b>Revoked Certificates</b>: List of revoked certificates. Each list item
/// contains the following information.
///
/// <ul>
/// <li>
/// <b>Serial Number</b>: The serial number, in hexadecimal format, of the
/// revoked certificate.
/// </li>
/// <li>
/// <b>Revocation Date</b>: Date and time the certificate was revoked.
/// </li>
/// <li>
/// <b>CRL Entry Extensions</b>: Optional extensions for the CRL entry.
///
/// <ul>
/// <li>
/// <b>X509v3 CRL Reason Code</b>: Reason the certificate was revoked.
/// </li>
/// </ul> </li>
/// </ul> </li>
/// <li>
/// <b>CRL Extensions</b>: Optional extensions for the CRL.
///
/// <ul>
/// <li>
/// <b>X509v3 Authority Key Identifier</b>: Identifies the public key associated
/// with the private key used to sign the certificate.
/// </li>
/// <li>
/// <b>X509v3 CRL Number:</b>: Decimal sequence number for the CRL.
/// </li>
/// </ul> </li>
/// <li>
/// <b>Signature Algorithm</b>: Algorithm used by your private CA to sign the
/// CRL.
/// </li>
/// <li>
/// <b>Signature Value</b>: Signature computed over the CRL.
/// </li>
/// </ul>
/// Certificate revocation lists created by Amazon Web Services Private CA are
/// DER-encoded. You can use the following OpenSSL command to list a CRL.
///
/// <code>openssl crl -inform DER -text -in <i>crl_path</i> -noout</code>
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/crl-planning.html">Planning
/// a certificate revocation list (CRL)</a> in the <i>Amazon Web Services
/// Private Certificate Authority User Guide</i>
class CrlConfiguration {
  /// Boolean value that specifies whether certificate revocation lists (CRLs) are
  /// enabled. You can use this value to enable certificate revocation for a new
  /// CA when you call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action or for an existing CA when you call the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// action.
  final bool enabled;

  /// Configures the behavior of the CRL Distribution Point extension for
  /// certificates issued by your certificate authority. If this field is not
  /// provided, then the CRl Distribution Point Extension will be present and
  /// contain the default CRL URL.
  final CrlDistributionPointExtensionConfiguration?
      crlDistributionPointExtensionConfiguration;

  /// Name inserted into the certificate <b>CRL Distribution Points</b> extension
  /// that enables the use of an alias for the CRL distribution point. Use this
  /// value if you don't want the name of your S3 bucket to be public.
  /// <note>
  /// The content of a Canonical Name (CNAME) record must conform to <a
  /// href="https://www.ietf.org/rfc/rfc2396.txt">RFC2396</a> restrictions on the
  /// use of special characters in URIs. Additionally, the value of the CNAME must
  /// not include a protocol prefix such as "http://" or "https://".
  /// </note>
  final String? customCname;

  /// Validity period of the CRL in days.
  final int? expirationInDays;

  /// Name of the S3 bucket that contains the CRL. If you do not provide a value
  /// for the <b>CustomCname</b> argument, the name of your S3 bucket is placed
  /// into the <b>CRL Distribution Points</b> extension of the issued certificate.
  /// You can change the name of your bucket by calling the <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// operation. You must specify a <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaCreateCa.html#s3-policies">bucket
  /// policy</a> that allows Amazon Web Services Private CA to write the CRL to
  /// your bucket.
  /// <note>
  /// The <code>S3BucketName</code> parameter must conform to the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html">S3
  /// bucket naming rules</a>.
  /// </note>
  final String? s3BucketName;

  /// Determines whether the CRL will be publicly readable or privately held in
  /// the CRL Amazon S3 bucket. If you choose PUBLIC_READ, the CRL will be
  /// accessible over the public internet. If you choose
  /// BUCKET_OWNER_FULL_CONTROL, only the owner of the CRL S3 bucket can access
  /// the CRL, and your PKI clients may need an alternative method of access.
  ///
  /// If no value is specified, the default is <code>PUBLIC_READ</code>.
  ///
  /// <i>Note:</i> This default can cause CA creation to fail in some
  /// circumstances. If you have have enabled the Block Public Access (BPA)
  /// feature in your S3 account, then you must specify the value of this
  /// parameter as <code>BUCKET_OWNER_FULL_CONTROL</code>, and not doing so
  /// results in an error. If you have disabled BPA in S3, then you can specify
  /// either <code>BUCKET_OWNER_FULL_CONTROL</code> or <code>PUBLIC_READ</code> as
  /// the value.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/PcaCreateCa.html#s3-bpa">Blocking
  /// public access to the S3 bucket</a>.
  final S3ObjectAcl? s3ObjectAcl;

  CrlConfiguration({
    required this.enabled,
    this.crlDistributionPointExtensionConfiguration,
    this.customCname,
    this.expirationInDays,
    this.s3BucketName,
    this.s3ObjectAcl,
  });

  factory CrlConfiguration.fromJson(Map<String, dynamic> json) {
    return CrlConfiguration(
      enabled: json['Enabled'] as bool,
      crlDistributionPointExtensionConfiguration:
          json['CrlDistributionPointExtensionConfiguration'] != null
              ? CrlDistributionPointExtensionConfiguration.fromJson(
                  json['CrlDistributionPointExtensionConfiguration']
                      as Map<String, dynamic>)
              : null,
      customCname: json['CustomCname'] as String?,
      expirationInDays: json['ExpirationInDays'] as int?,
      s3BucketName: json['S3BucketName'] as String?,
      s3ObjectAcl: (json['S3ObjectAcl'] as String?)?.toS3ObjectAcl(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final crlDistributionPointExtensionConfiguration =
        this.crlDistributionPointExtensionConfiguration;
    final customCname = this.customCname;
    final expirationInDays = this.expirationInDays;
    final s3BucketName = this.s3BucketName;
    final s3ObjectAcl = this.s3ObjectAcl;
    return {
      'Enabled': enabled,
      if (crlDistributionPointExtensionConfiguration != null)
        'CrlDistributionPointExtensionConfiguration':
            crlDistributionPointExtensionConfiguration,
      if (customCname != null) 'CustomCname': customCname,
      if (expirationInDays != null) 'ExpirationInDays': expirationInDays,
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3ObjectAcl != null) 'S3ObjectAcl': s3ObjectAcl.toValue(),
    };
  }
}

/// Contains configuration information for the default behavior of the CRL
/// Distribution Point (CDP) extension in certificates issued by your CA. This
/// extension contains a link to download the CRL, so you can check whether a
/// certificate has been revoked. To choose whether you want this extension
/// omitted or not in certificates issued by your CA, you can set the
/// <b>OmitExtension</b> parameter.
class CrlDistributionPointExtensionConfiguration {
  /// Configures whether the CRL Distribution Point extension should be populated
  /// with the default URL to the CRL. If set to <code>true</code>, then the CDP
  /// extension will not be present in any certificates issued by that CA unless
  /// otherwise specified through CSR or API passthrough.
  /// <note>
  /// Only set this if you have another way to distribute the CRL Distribution
  /// Points ffor certificates issued by your CA, such as the Matter Distributed
  /// Compliance Ledger
  ///
  /// This configuration cannot be enabled with a custom CNAME set.
  /// </note>
  final bool omitExtension;

  CrlDistributionPointExtensionConfiguration({
    required this.omitExtension,
  });

  factory CrlDistributionPointExtensionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CrlDistributionPointExtensionConfiguration(
      omitExtension: json['OmitExtension'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final omitExtension = this.omitExtension;
    return {
      'OmitExtension': omitExtension,
    };
  }
}

/// Describes the certificate extensions to be added to the certificate signing
/// request (CSR).
class CsrExtensions {
  /// Indicates the purpose of the certificate and of the key contained in the
  /// certificate.
  final KeyUsage? keyUsage;

  /// For CA certificates, provides a path to additional information pertaining to
  /// the CA, such as revocation and policy. For more information, see <a
  /// href="https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.2.2">Subject
  /// Information Access</a> in RFC 5280.
  final List<AccessDescription>? subjectInformationAccess;

  CsrExtensions({
    this.keyUsage,
    this.subjectInformationAccess,
  });

  factory CsrExtensions.fromJson(Map<String, dynamic> json) {
    return CsrExtensions(
      keyUsage: json['KeyUsage'] != null
          ? KeyUsage.fromJson(json['KeyUsage'] as Map<String, dynamic>)
          : null,
      subjectInformationAccess: (json['SubjectInformationAccess'] as List?)
          ?.whereNotNull()
          .map((e) => AccessDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyUsage = this.keyUsage;
    final subjectInformationAccess = this.subjectInformationAccess;
    return {
      if (keyUsage != null) 'KeyUsage': keyUsage,
      if (subjectInformationAccess != null)
        'SubjectInformationAccess': subjectInformationAccess,
    };
  }
}

/// Defines the X.500 relative distinguished name (RDN).
class CustomAttribute {
  /// Specifies the object identifier (OID) of the attribute type of the relative
  /// distinguished name (RDN).
  final String objectIdentifier;

  /// <p/>
  /// Specifies the attribute value of relative distinguished name (RDN).
  final String value;

  CustomAttribute({
    required this.objectIdentifier,
    required this.value,
  });

  factory CustomAttribute.fromJson(Map<String, dynamic> json) {
    return CustomAttribute(
      objectIdentifier: json['ObjectIdentifier'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    final value = this.value;
    return {
      'ObjectIdentifier': objectIdentifier,
      'Value': value,
    };
  }
}

/// <p/>
/// Specifies the X.509 extension information for a certificate.
///
/// Extensions present in <code>CustomExtensions</code> follow the
/// <code>ApiPassthrough</code> <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/UsingTemplates.html#template-order-of-operations">template
/// rules</a>.
class CustomExtension {
  /// <p/>
  /// Specifies the object identifier (OID) of the X.509 extension. For more
  /// information, see the <a href="https://oidref.com/2.5.29">Global OID
  /// reference database.</a>
  final String objectIdentifier;

  /// <p/>
  /// Specifies the base64-encoded value of the X.509 extension.
  final String value;

  /// <p/>
  /// Specifies the critical flag of the X.509 extension.
  final bool? critical;

  CustomExtension({
    required this.objectIdentifier,
    required this.value,
    this.critical,
  });

  Map<String, dynamic> toJson() {
    final objectIdentifier = this.objectIdentifier;
    final value = this.value;
    final critical = this.critical;
    return {
      'ObjectIdentifier': objectIdentifier,
      'Value': value,
      if (critical != null) 'Critical': critical,
    };
  }
}

class DescribeCertificateAuthorityAuditReportResponse {
  /// Specifies whether report creation is in progress, has succeeded, or has
  /// failed.
  final AuditReportStatus? auditReportStatus;

  /// The date and time at which the report was created.
  final DateTime? createdAt;

  /// Name of the S3 bucket that contains the report.
  final String? s3BucketName;

  /// S3 <b>key</b> that uniquely identifies the report file in your S3 bucket.
  final String? s3Key;

  DescribeCertificateAuthorityAuditReportResponse({
    this.auditReportStatus,
    this.createdAt,
    this.s3BucketName,
    this.s3Key,
  });

  factory DescribeCertificateAuthorityAuditReportResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCertificateAuthorityAuditReportResponse(
      auditReportStatus:
          (json['AuditReportStatus'] as String?)?.toAuditReportStatus(),
      createdAt: timeStampFromJson(json['CreatedAt']),
      s3BucketName: json['S3BucketName'] as String?,
      s3Key: json['S3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final auditReportStatus = this.auditReportStatus;
    final createdAt = this.createdAt;
    final s3BucketName = this.s3BucketName;
    final s3Key = this.s3Key;
    return {
      if (auditReportStatus != null)
        'AuditReportStatus': auditReportStatus.toValue(),
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3Key != null) 'S3Key': s3Key,
    };
  }
}

class DescribeCertificateAuthorityResponse {
  /// A <a
  /// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CertificateAuthority.html">CertificateAuthority</a>
  /// structure that contains information about your private CA.
  final CertificateAuthority? certificateAuthority;

  DescribeCertificateAuthorityResponse({
    this.certificateAuthority,
  });

  factory DescribeCertificateAuthorityResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeCertificateAuthorityResponse(
      certificateAuthority: json['CertificateAuthority'] != null
          ? CertificateAuthority.fromJson(
              json['CertificateAuthority'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthority = this.certificateAuthority;
    return {
      if (certificateAuthority != null)
        'CertificateAuthority': certificateAuthority,
    };
  }
}

/// Describes an Electronic Data Interchange (EDI) entity as described in as
/// defined in <a href="https://datatracker.ietf.org/doc/html/rfc5280">Subject
/// Alternative Name</a> in RFC 5280.
class EdiPartyName {
  /// Specifies the party name.
  final String partyName;

  /// Specifies the name assigner.
  final String? nameAssigner;

  EdiPartyName({
    required this.partyName,
    this.nameAssigner,
  });

  factory EdiPartyName.fromJson(Map<String, dynamic> json) {
    return EdiPartyName(
      partyName: json['PartyName'] as String,
      nameAssigner: json['NameAssigner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final partyName = this.partyName;
    final nameAssigner = this.nameAssigner;
    return {
      'PartyName': partyName,
      if (nameAssigner != null) 'NameAssigner': nameAssigner,
    };
  }
}

/// Specifies additional purposes for which the certified public key may be used
/// other than basic purposes indicated in the <code>KeyUsage</code> extension.
class ExtendedKeyUsage {
  /// Specifies a custom <code>ExtendedKeyUsage</code> with an object identifier
  /// (OID).
  final String? extendedKeyUsageObjectIdentifier;

  /// Specifies a standard <code>ExtendedKeyUsage</code> as defined as in <a
  /// href="https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.12">RFC
  /// 5280</a>.
  final ExtendedKeyUsageType? extendedKeyUsageType;

  ExtendedKeyUsage({
    this.extendedKeyUsageObjectIdentifier,
    this.extendedKeyUsageType,
  });

  Map<String, dynamic> toJson() {
    final extendedKeyUsageObjectIdentifier =
        this.extendedKeyUsageObjectIdentifier;
    final extendedKeyUsageType = this.extendedKeyUsageType;
    return {
      if (extendedKeyUsageObjectIdentifier != null)
        'ExtendedKeyUsageObjectIdentifier': extendedKeyUsageObjectIdentifier,
      if (extendedKeyUsageType != null)
        'ExtendedKeyUsageType': extendedKeyUsageType.toValue(),
    };
  }
}

enum ExtendedKeyUsageType {
  serverAuth,
  clientAuth,
  codeSigning,
  emailProtection,
  timeStamping,
  ocspSigning,
  smartCardLogin,
  documentSigning,
  certificateTransparency,
}

extension ExtendedKeyUsageTypeValueExtension on ExtendedKeyUsageType {
  String toValue() {
    switch (this) {
      case ExtendedKeyUsageType.serverAuth:
        return 'SERVER_AUTH';
      case ExtendedKeyUsageType.clientAuth:
        return 'CLIENT_AUTH';
      case ExtendedKeyUsageType.codeSigning:
        return 'CODE_SIGNING';
      case ExtendedKeyUsageType.emailProtection:
        return 'EMAIL_PROTECTION';
      case ExtendedKeyUsageType.timeStamping:
        return 'TIME_STAMPING';
      case ExtendedKeyUsageType.ocspSigning:
        return 'OCSP_SIGNING';
      case ExtendedKeyUsageType.smartCardLogin:
        return 'SMART_CARD_LOGIN';
      case ExtendedKeyUsageType.documentSigning:
        return 'DOCUMENT_SIGNING';
      case ExtendedKeyUsageType.certificateTransparency:
        return 'CERTIFICATE_TRANSPARENCY';
    }
  }
}

extension ExtendedKeyUsageTypeFromString on String {
  ExtendedKeyUsageType toExtendedKeyUsageType() {
    switch (this) {
      case 'SERVER_AUTH':
        return ExtendedKeyUsageType.serverAuth;
      case 'CLIENT_AUTH':
        return ExtendedKeyUsageType.clientAuth;
      case 'CODE_SIGNING':
        return ExtendedKeyUsageType.codeSigning;
      case 'EMAIL_PROTECTION':
        return ExtendedKeyUsageType.emailProtection;
      case 'TIME_STAMPING':
        return ExtendedKeyUsageType.timeStamping;
      case 'OCSP_SIGNING':
        return ExtendedKeyUsageType.ocspSigning;
      case 'SMART_CARD_LOGIN':
        return ExtendedKeyUsageType.smartCardLogin;
      case 'DOCUMENT_SIGNING':
        return ExtendedKeyUsageType.documentSigning;
      case 'CERTIFICATE_TRANSPARENCY':
        return ExtendedKeyUsageType.certificateTransparency;
    }
    throw Exception('$this is not known in enum ExtendedKeyUsageType');
  }
}

/// Contains X.509 extension information for a certificate.
class Extensions {
  /// Contains a sequence of one or more policy information terms, each of which
  /// consists of an object identifier (OID) and optional qualifiers. For more
  /// information, see NIST's definition of <a
  /// href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
  /// Identifier (OID)</a>.
  ///
  /// In an end-entity certificate, these terms indicate the policy under which
  /// the certificate was issued and the purposes for which it may be used. In a
  /// CA certificate, these terms limit the set of policies for certification
  /// paths that include this certificate.
  final List<PolicyInformation>? certificatePolicies;

  /// <p/>
  /// Contains a sequence of one or more X.509 extensions, each of which consists
  /// of an object identifier (OID), a base64-encoded value, and the critical
  /// flag. For more information, see the <a
  /// href="https://oidref.com/2.5.29">Global OID reference database.</a>
  final List<CustomExtension>? customExtensions;

  /// Specifies additional purposes for which the certified public key may be used
  /// other than basic purposes indicated in the <code>KeyUsage</code> extension.
  final List<ExtendedKeyUsage>? extendedKeyUsage;
  final KeyUsage? keyUsage;

  /// The subject alternative name extension allows identities to be bound to the
  /// subject of the certificate. These identities may be included in addition to
  /// or in place of the identity in the subject field of the certificate.
  final List<GeneralName>? subjectAlternativeNames;

  Extensions({
    this.certificatePolicies,
    this.customExtensions,
    this.extendedKeyUsage,
    this.keyUsage,
    this.subjectAlternativeNames,
  });

  Map<String, dynamic> toJson() {
    final certificatePolicies = this.certificatePolicies;
    final customExtensions = this.customExtensions;
    final extendedKeyUsage = this.extendedKeyUsage;
    final keyUsage = this.keyUsage;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    return {
      if (certificatePolicies != null)
        'CertificatePolicies': certificatePolicies,
      if (customExtensions != null) 'CustomExtensions': customExtensions,
      if (extendedKeyUsage != null) 'ExtendedKeyUsage': extendedKeyUsage,
      if (keyUsage != null) 'KeyUsage': keyUsage,
      if (subjectAlternativeNames != null)
        'SubjectAlternativeNames': subjectAlternativeNames,
    };
  }
}

enum FailureReason {
  requestTimedOut,
  unsupportedAlgorithm,
  other,
}

extension FailureReasonValueExtension on FailureReason {
  String toValue() {
    switch (this) {
      case FailureReason.requestTimedOut:
        return 'REQUEST_TIMED_OUT';
      case FailureReason.unsupportedAlgorithm:
        return 'UNSUPPORTED_ALGORITHM';
      case FailureReason.other:
        return 'OTHER';
    }
  }
}

extension FailureReasonFromString on String {
  FailureReason toFailureReason() {
    switch (this) {
      case 'REQUEST_TIMED_OUT':
        return FailureReason.requestTimedOut;
      case 'UNSUPPORTED_ALGORITHM':
        return FailureReason.unsupportedAlgorithm;
      case 'OTHER':
        return FailureReason.other;
    }
    throw Exception('$this is not known in enum FailureReason');
  }
}

/// Describes an ASN.1 X.400 <code>GeneralName</code> as defined in <a
/// href="https://datatracker.ietf.org/doc/html/rfc5280">RFC 5280</a>. Only one
/// of the following naming options should be provided. Providing more than one
/// option results in an <code>InvalidArgsException</code> error.
class GeneralName {
  final ASN1Subject? directoryName;

  /// Represents <code>GeneralName</code> as a DNS name.
  final String? dnsName;

  /// Represents <code>GeneralName</code> as an <code>EdiPartyName</code> object.
  final EdiPartyName? ediPartyName;

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
    this.ediPartyName,
    this.ipAddress,
    this.otherName,
    this.registeredId,
    this.rfc822Name,
    this.uniformResourceIdentifier,
  });

  factory GeneralName.fromJson(Map<String, dynamic> json) {
    return GeneralName(
      directoryName: json['DirectoryName'] != null
          ? ASN1Subject.fromJson(json['DirectoryName'] as Map<String, dynamic>)
          : null,
      dnsName: json['DnsName'] as String?,
      ediPartyName: json['EdiPartyName'] != null
          ? EdiPartyName.fromJson(json['EdiPartyName'] as Map<String, dynamic>)
          : null,
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
    final ediPartyName = this.ediPartyName;
    final ipAddress = this.ipAddress;
    final otherName = this.otherName;
    final registeredId = this.registeredId;
    final rfc822Name = this.rfc822Name;
    final uniformResourceIdentifier = this.uniformResourceIdentifier;
    return {
      if (directoryName != null) 'DirectoryName': directoryName,
      if (dnsName != null) 'DnsName': dnsName,
      if (ediPartyName != null) 'EdiPartyName': ediPartyName,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (otherName != null) 'OtherName': otherName,
      if (registeredId != null) 'RegisteredId': registeredId,
      if (rfc822Name != null) 'Rfc822Name': rfc822Name,
      if (uniformResourceIdentifier != null)
        'UniformResourceIdentifier': uniformResourceIdentifier,
    };
  }
}

class GetCertificateAuthorityCertificateResponse {
  /// Base64-encoded certificate authority (CA) certificate.
  final String? certificate;

  /// Base64-encoded certificate chain that includes any intermediate certificates
  /// and chains up to root certificate that you used to sign your private CA
  /// certificate. The chain does not include your private CA certificate. If this
  /// is a root CA, the value will be null.
  final String? certificateChain;

  GetCertificateAuthorityCertificateResponse({
    this.certificate,
    this.certificateChain,
  });

  factory GetCertificateAuthorityCertificateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCertificateAuthorityCertificateResponse(
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

class GetCertificateAuthorityCsrResponse {
  /// The base64 PEM-encoded certificate signing request (CSR) for your private CA
  /// certificate.
  final String? csr;

  GetCertificateAuthorityCsrResponse({
    this.csr,
  });

  factory GetCertificateAuthorityCsrResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCertificateAuthorityCsrResponse(
      csr: json['Csr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final csr = this.csr;
    return {
      if (csr != null) 'Csr': csr,
    };
  }
}

class GetCertificateResponse {
  /// The base64 PEM-encoded certificate specified by the
  /// <code>CertificateArn</code> parameter.
  final String? certificate;

  /// The base64 PEM-encoded certificate chain that chains up to the root CA
  /// certificate that you used to sign your private CA certificate.
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

class GetPolicyResponse {
  /// The policy attached to the private CA as a JSON document.
  final String? policy;

  GetPolicyResponse({
    this.policy,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class IssueCertificateResponse {
  /// The Amazon Resource Name (ARN) of the issued certificate and the certificate
  /// serial number. This is of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>/certificate/<i>286535153982981100925020015808220737245</i>
  /// </code>
  final String? certificateArn;

  IssueCertificateResponse({
    this.certificateArn,
  });

  factory IssueCertificateResponse.fromJson(Map<String, dynamic> json) {
    return IssueCertificateResponse(
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
  rsa_2048,
  rsa_4096,
  ecPrime256v1,
  ecSecp384r1,
}

extension KeyAlgorithmValueExtension on KeyAlgorithm {
  String toValue() {
    switch (this) {
      case KeyAlgorithm.rsa_2048:
        return 'RSA_2048';
      case KeyAlgorithm.rsa_4096:
        return 'RSA_4096';
      case KeyAlgorithm.ecPrime256v1:
        return 'EC_prime256v1';
      case KeyAlgorithm.ecSecp384r1:
        return 'EC_secp384r1';
    }
  }
}

extension KeyAlgorithmFromString on String {
  KeyAlgorithm toKeyAlgorithm() {
    switch (this) {
      case 'RSA_2048':
        return KeyAlgorithm.rsa_2048;
      case 'RSA_4096':
        return KeyAlgorithm.rsa_4096;
      case 'EC_prime256v1':
        return KeyAlgorithm.ecPrime256v1;
      case 'EC_secp384r1':
        return KeyAlgorithm.ecSecp384r1;
    }
    throw Exception('$this is not known in enum KeyAlgorithm');
  }
}

enum KeyStorageSecurityStandard {
  fips_140_2Level_2OrHigher,
  fips_140_2Level_3OrHigher,
}

extension KeyStorageSecurityStandardValueExtension
    on KeyStorageSecurityStandard {
  String toValue() {
    switch (this) {
      case KeyStorageSecurityStandard.fips_140_2Level_2OrHigher:
        return 'FIPS_140_2_LEVEL_2_OR_HIGHER';
      case KeyStorageSecurityStandard.fips_140_2Level_3OrHigher:
        return 'FIPS_140_2_LEVEL_3_OR_HIGHER';
    }
  }
}

extension KeyStorageSecurityStandardFromString on String {
  KeyStorageSecurityStandard toKeyStorageSecurityStandard() {
    switch (this) {
      case 'FIPS_140_2_LEVEL_2_OR_HIGHER':
        return KeyStorageSecurityStandard.fips_140_2Level_2OrHigher;
      case 'FIPS_140_2_LEVEL_3_OR_HIGHER':
        return KeyStorageSecurityStandard.fips_140_2Level_3OrHigher;
    }
    throw Exception('$this is not known in enum KeyStorageSecurityStandard');
  }
}

/// Defines one or more purposes for which the key contained in the certificate
/// can be used. Default value for each option is false.
class KeyUsage {
  /// Key can be used to sign CRLs.
  final bool? cRLSign;

  /// Key can be used to decipher data.
  final bool? dataEncipherment;

  /// Key can be used only to decipher data.
  final bool? decipherOnly;

  /// Key can be used for digital signing.
  final bool? digitalSignature;

  /// Key can be used only to encipher data.
  final bool? encipherOnly;

  /// Key can be used in a key-agreement protocol.
  final bool? keyAgreement;

  /// Key can be used to sign certificates.
  final bool? keyCertSign;

  /// Key can be used to encipher data.
  final bool? keyEncipherment;

  /// Key can be used for non-repudiation.
  final bool? nonRepudiation;

  KeyUsage({
    this.cRLSign,
    this.dataEncipherment,
    this.decipherOnly,
    this.digitalSignature,
    this.encipherOnly,
    this.keyAgreement,
    this.keyCertSign,
    this.keyEncipherment,
    this.nonRepudiation,
  });

  factory KeyUsage.fromJson(Map<String, dynamic> json) {
    return KeyUsage(
      cRLSign: json['CRLSign'] as bool?,
      dataEncipherment: json['DataEncipherment'] as bool?,
      decipherOnly: json['DecipherOnly'] as bool?,
      digitalSignature: json['DigitalSignature'] as bool?,
      encipherOnly: json['EncipherOnly'] as bool?,
      keyAgreement: json['KeyAgreement'] as bool?,
      keyCertSign: json['KeyCertSign'] as bool?,
      keyEncipherment: json['KeyEncipherment'] as bool?,
      nonRepudiation: json['NonRepudiation'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cRLSign = this.cRLSign;
    final dataEncipherment = this.dataEncipherment;
    final decipherOnly = this.decipherOnly;
    final digitalSignature = this.digitalSignature;
    final encipherOnly = this.encipherOnly;
    final keyAgreement = this.keyAgreement;
    final keyCertSign = this.keyCertSign;
    final keyEncipherment = this.keyEncipherment;
    final nonRepudiation = this.nonRepudiation;
    return {
      if (cRLSign != null) 'CRLSign': cRLSign,
      if (dataEncipherment != null) 'DataEncipherment': dataEncipherment,
      if (decipherOnly != null) 'DecipherOnly': decipherOnly,
      if (digitalSignature != null) 'DigitalSignature': digitalSignature,
      if (encipherOnly != null) 'EncipherOnly': encipherOnly,
      if (keyAgreement != null) 'KeyAgreement': keyAgreement,
      if (keyCertSign != null) 'KeyCertSign': keyCertSign,
      if (keyEncipherment != null) 'KeyEncipherment': keyEncipherment,
      if (nonRepudiation != null) 'NonRepudiation': nonRepudiation,
    };
  }
}

class ListCertificateAuthoritiesResponse {
  /// Summary information about each certificate authority you have created.
  final List<CertificateAuthority>? certificateAuthorities;

  /// When the list is truncated, this value is present and should be used for the
  /// <code>NextToken</code> parameter in a subsequent pagination request.
  final String? nextToken;

  ListCertificateAuthoritiesResponse({
    this.certificateAuthorities,
    this.nextToken,
  });

  factory ListCertificateAuthoritiesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCertificateAuthoritiesResponse(
      certificateAuthorities: (json['CertificateAuthorities'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateAuthority.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorities = this.certificateAuthorities;
    final nextToken = this.nextToken;
    return {
      if (certificateAuthorities != null)
        'CertificateAuthorities': certificateAuthorities,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPermissionsResponse {
  /// When the list is truncated, this value is present and should be used for the
  /// <b>NextToken</b> parameter in a subsequent pagination request.
  final String? nextToken;

  /// Summary information about each permission assigned by the specified private
  /// CA, including the action enabled, the policy provided, and the time of
  /// creation.
  final List<Permission>? permissions;

  ListPermissionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionsResponse(
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

class ListTagsResponse {
  /// When the list is truncated, this value is present and should be used for the
  /// <b>NextToken</b> parameter in a subsequent pagination request.
  final String? nextToken;

  /// The tags associated with your private CA.
  final List<Tag>? tags;

  ListTagsResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information to enable and configure Online Certificate Status
/// Protocol (OCSP) for validating certificate revocation status.
///
/// When you revoke a certificate, OCSP responses may take up to 60 minutes to
/// reflect the new status.
class OcspConfiguration {
  /// Flag enabling use of the Online Certificate Status Protocol (OCSP) for
  /// validating certificate revocation status.
  final bool enabled;

  /// By default, Amazon Web Services Private CA injects an Amazon Web Services
  /// domain into certificates being validated by the Online Certificate Status
  /// Protocol (OCSP). A customer can alternatively use this object to define a
  /// CNAME specifying a customized OCSP domain.
  /// <note>
  /// The content of a Canonical Name (CNAME) record must conform to <a
  /// href="https://www.ietf.org/rfc/rfc2396.txt">RFC2396</a> restrictions on the
  /// use of special characters in URIs. Additionally, the value of the CNAME must
  /// not include a protocol prefix such as "http://" or "https://".
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/privateca/latest/userguide/ocsp-customize.html">Customizing
  /// Online Certificate Status Protocol (OCSP) </a> in the <i>Amazon Web Services
  /// Private Certificate Authority User Guide</i>.
  final String? ocspCustomCname;

  OcspConfiguration({
    required this.enabled,
    this.ocspCustomCname,
  });

  factory OcspConfiguration.fromJson(Map<String, dynamic> json) {
    return OcspConfiguration(
      enabled: json['Enabled'] as bool,
      ocspCustomCname: json['OcspCustomCname'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final ocspCustomCname = this.ocspCustomCname;
    return {
      'Enabled': enabled,
      if (ocspCustomCname != null) 'OcspCustomCname': ocspCustomCname,
    };
  }
}

/// Defines a custom ASN.1 X.400 <code>GeneralName</code> using an object
/// identifier (OID) and value. The OID must satisfy the regular expression
/// shown below. For more information, see NIST's definition of <a
/// href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
/// Identifier (OID)</a>.
class OtherName {
  /// Specifies an OID.
  final String typeId;

  /// Specifies an OID value.
  final String value;

  OtherName({
    required this.typeId,
    required this.value,
  });

  factory OtherName.fromJson(Map<String, dynamic> json) {
    return OtherName(
      typeId: json['TypeId'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final typeId = this.typeId;
    final value = this.value;
    return {
      'TypeId': typeId,
      'Value': value,
    };
  }
}

/// Permissions designate which private CA actions can be performed by an Amazon
/// Web Services service or entity. In order for ACM to automatically renew
/// private certificates, you must give the ACM service principal all available
/// permissions (<code>IssueCertificate</code>, <code>GetCertificate</code>, and
/// <code>ListPermissions</code>). Permissions can be assigned with the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreatePermission.html">CreatePermission</a>
/// action, removed with the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_DeletePermission.html">DeletePermission</a>
/// action, and listed with the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_ListPermissions.html">ListPermissions</a>
/// action.
class Permission {
  /// The private CA actions that can be performed by the designated Amazon Web
  /// Services service.
  final List<ActionType>? actions;

  /// The Amazon Resource Number (ARN) of the private CA from which the permission
  /// was issued.
  final String? certificateAuthorityArn;

  /// The time at which the permission was created.
  final DateTime? createdAt;

  /// The name of the policy that is associated with the permission.
  final String? policy;

  /// The Amazon Web Services service or entity that holds the permission. At this
  /// time, the only valid principal is <code>acm.amazonaws.com</code>.
  final String? principal;

  /// The ID of the account that assigned the permission.
  final String? sourceAccount;

  Permission({
    this.actions,
    this.certificateAuthorityArn,
    this.createdAt,
    this.policy,
    this.principal,
    this.sourceAccount,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      actions: (json['Actions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toActionType())
          .toList(),
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      policy: json['Policy'] as String?,
      principal: json['Principal'] as String?,
      sourceAccount: json['SourceAccount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final certificateAuthorityArn = this.certificateAuthorityArn;
    final createdAt = this.createdAt;
    final policy = this.policy;
    final principal = this.principal;
    final sourceAccount = this.sourceAccount;
    return {
      if (actions != null) 'Actions': actions.map((e) => e.toValue()).toList(),
      if (certificateAuthorityArn != null)
        'CertificateAuthorityArn': certificateAuthorityArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (policy != null) 'Policy': policy,
      if (principal != null) 'Principal': principal,
      if (sourceAccount != null) 'SourceAccount': sourceAccount,
    };
  }
}

/// Defines the X.509 <code>CertificatePolicies</code> extension.
class PolicyInformation {
  /// Specifies the object identifier (OID) of the certificate policy under which
  /// the certificate was issued. For more information, see NIST's definition of
  /// <a href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
  /// Identifier (OID)</a>.
  final String certPolicyId;

  /// Modifies the given <code>CertPolicyId</code> with a qualifier. Amazon Web
  /// Services Private CA supports the certification practice statement (CPS)
  /// qualifier.
  final List<PolicyQualifierInfo>? policyQualifiers;

  PolicyInformation({
    required this.certPolicyId,
    this.policyQualifiers,
  });

  Map<String, dynamic> toJson() {
    final certPolicyId = this.certPolicyId;
    final policyQualifiers = this.policyQualifiers;
    return {
      'CertPolicyId': certPolicyId,
      if (policyQualifiers != null) 'PolicyQualifiers': policyQualifiers,
    };
  }
}

enum PolicyQualifierId {
  cps,
}

extension PolicyQualifierIdValueExtension on PolicyQualifierId {
  String toValue() {
    switch (this) {
      case PolicyQualifierId.cps:
        return 'CPS';
    }
  }
}

extension PolicyQualifierIdFromString on String {
  PolicyQualifierId toPolicyQualifierId() {
    switch (this) {
      case 'CPS':
        return PolicyQualifierId.cps;
    }
    throw Exception('$this is not known in enum PolicyQualifierId');
  }
}

/// Modifies the <code>CertPolicyId</code> of a <code>PolicyInformation</code>
/// object with a qualifier. Amazon Web Services Private CA supports the
/// certification practice statement (CPS) qualifier.
class PolicyQualifierInfo {
  /// Identifies the qualifier modifying a <code>CertPolicyId</code>.
  final PolicyQualifierId policyQualifierId;

  /// Defines the qualifier type. Amazon Web Services Private CA supports the use
  /// of a URI for a CPS qualifier in this field.
  final Qualifier qualifier;

  PolicyQualifierInfo({
    required this.policyQualifierId,
    required this.qualifier,
  });

  Map<String, dynamic> toJson() {
    final policyQualifierId = this.policyQualifierId;
    final qualifier = this.qualifier;
    return {
      'PolicyQualifierId': policyQualifierId.toValue(),
      'Qualifier': qualifier,
    };
  }
}

/// Defines a <code>PolicyInformation</code> qualifier. Amazon Web Services
/// Private CA supports the <a
/// href="https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.4">certification
/// practice statement (CPS) qualifier</a> defined in RFC 5280.
class Qualifier {
  /// Contains a pointer to a certification practice statement (CPS) published by
  /// the CA.
  final String cpsUri;

  Qualifier({
    required this.cpsUri,
  });

  Map<String, dynamic> toJson() {
    final cpsUri = this.cpsUri;
    return {
      'CpsUri': cpsUri,
    };
  }
}

enum ResourceOwner {
  self,
  otherAccounts,
}

extension ResourceOwnerValueExtension on ResourceOwner {
  String toValue() {
    switch (this) {
      case ResourceOwner.self:
        return 'SELF';
      case ResourceOwner.otherAccounts:
        return 'OTHER_ACCOUNTS';
    }
  }
}

extension ResourceOwnerFromString on String {
  ResourceOwner toResourceOwner() {
    switch (this) {
      case 'SELF':
        return ResourceOwner.self;
      case 'OTHER_ACCOUNTS':
        return ResourceOwner.otherAccounts;
    }
    throw Exception('$this is not known in enum ResourceOwner');
  }
}

/// Certificate revocation information used by the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
/// and <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
/// actions. Your private certificate authority (CA) can configure Online
/// Certificate Status Protocol (OCSP) support and/or maintain a certificate
/// revocation list (CRL). OCSP returns validation information about
/// certificates as requested by clients, and a CRL contains an updated list of
/// certificates revoked by your CA. For more information, see <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_RevokeCertificate.html">RevokeCertificate</a>
/// and <a
/// href="https://docs.aws.amazon.com/privateca/latest/userguide/revocation-setup.html">Setting
/// up a certificate revocation method</a> in the <i>Amazon Web Services Private
/// Certificate Authority User Guide</i>.
class RevocationConfiguration {
  /// Configuration of the certificate revocation list (CRL), if any, maintained
  /// by your private CA. A CRL is typically updated approximately 30 minutes
  /// after a certificate is revoked. If for any reason a CRL update fails, Amazon
  /// Web Services Private CA makes further attempts every 15 minutes.
  final CrlConfiguration? crlConfiguration;

  /// Configuration of Online Certificate Status Protocol (OCSP) support, if any,
  /// maintained by your private CA. When you revoke a certificate, OCSP responses
  /// may take up to 60 minutes to reflect the new status.
  final OcspConfiguration? ocspConfiguration;

  RevocationConfiguration({
    this.crlConfiguration,
    this.ocspConfiguration,
  });

  factory RevocationConfiguration.fromJson(Map<String, dynamic> json) {
    return RevocationConfiguration(
      crlConfiguration: json['CrlConfiguration'] != null
          ? CrlConfiguration.fromJson(
              json['CrlConfiguration'] as Map<String, dynamic>)
          : null,
      ocspConfiguration: json['OcspConfiguration'] != null
          ? OcspConfiguration.fromJson(
              json['OcspConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final crlConfiguration = this.crlConfiguration;
    final ocspConfiguration = this.ocspConfiguration;
    return {
      if (crlConfiguration != null) 'CrlConfiguration': crlConfiguration,
      if (ocspConfiguration != null) 'OcspConfiguration': ocspConfiguration,
    };
  }
}

enum RevocationReason {
  unspecified,
  keyCompromise,
  certificateAuthorityCompromise,
  affiliationChanged,
  superseded,
  cessationOfOperation,
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
      case RevocationReason.certificateAuthorityCompromise:
        return 'CERTIFICATE_AUTHORITY_COMPROMISE';
      case RevocationReason.affiliationChanged:
        return 'AFFILIATION_CHANGED';
      case RevocationReason.superseded:
        return 'SUPERSEDED';
      case RevocationReason.cessationOfOperation:
        return 'CESSATION_OF_OPERATION';
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
      case 'CERTIFICATE_AUTHORITY_COMPROMISE':
        return RevocationReason.certificateAuthorityCompromise;
      case 'AFFILIATION_CHANGED':
        return RevocationReason.affiliationChanged;
      case 'SUPERSEDED':
        return RevocationReason.superseded;
      case 'CESSATION_OF_OPERATION':
        return RevocationReason.cessationOfOperation;
      case 'PRIVILEGE_WITHDRAWN':
        return RevocationReason.privilegeWithdrawn;
      case 'A_A_COMPROMISE':
        return RevocationReason.aACompromise;
    }
    throw Exception('$this is not known in enum RevocationReason');
  }
}

enum S3ObjectAcl {
  publicRead,
  bucketOwnerFullControl,
}

extension S3ObjectAclValueExtension on S3ObjectAcl {
  String toValue() {
    switch (this) {
      case S3ObjectAcl.publicRead:
        return 'PUBLIC_READ';
      case S3ObjectAcl.bucketOwnerFullControl:
        return 'BUCKET_OWNER_FULL_CONTROL';
    }
  }
}

extension S3ObjectAclFromString on String {
  S3ObjectAcl toS3ObjectAcl() {
    switch (this) {
      case 'PUBLIC_READ':
        return S3ObjectAcl.publicRead;
      case 'BUCKET_OWNER_FULL_CONTROL':
        return S3ObjectAcl.bucketOwnerFullControl;
    }
    throw Exception('$this is not known in enum S3ObjectAcl');
  }
}

enum SigningAlgorithm {
  sha256withecdsa,
  sha384withecdsa,
  sha512withecdsa,
  sha256withrsa,
  sha384withrsa,
  sha512withrsa,
}

extension SigningAlgorithmValueExtension on SigningAlgorithm {
  String toValue() {
    switch (this) {
      case SigningAlgorithm.sha256withecdsa:
        return 'SHA256WITHECDSA';
      case SigningAlgorithm.sha384withecdsa:
        return 'SHA384WITHECDSA';
      case SigningAlgorithm.sha512withecdsa:
        return 'SHA512WITHECDSA';
      case SigningAlgorithm.sha256withrsa:
        return 'SHA256WITHRSA';
      case SigningAlgorithm.sha384withrsa:
        return 'SHA384WITHRSA';
      case SigningAlgorithm.sha512withrsa:
        return 'SHA512WITHRSA';
    }
  }
}

extension SigningAlgorithmFromString on String {
  SigningAlgorithm toSigningAlgorithm() {
    switch (this) {
      case 'SHA256WITHECDSA':
        return SigningAlgorithm.sha256withecdsa;
      case 'SHA384WITHECDSA':
        return SigningAlgorithm.sha384withecdsa;
      case 'SHA512WITHECDSA':
        return SigningAlgorithm.sha512withecdsa;
      case 'SHA256WITHRSA':
        return SigningAlgorithm.sha256withrsa;
      case 'SHA384WITHRSA':
        return SigningAlgorithm.sha384withrsa;
      case 'SHA512WITHRSA':
        return SigningAlgorithm.sha512withrsa;
    }
    throw Exception('$this is not known in enum SigningAlgorithm');
  }
}

/// Tags are labels that you can use to identify and organize your private CAs.
/// Each tag consists of a key and an optional value. You can associate up to 50
/// tags with a private CA. To add one or more tags to a private CA, call the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_TagCertificateAuthority.html">TagCertificateAuthority</a>
/// action. To remove a tag, call the <a
/// href="https://docs.aws.amazon.com/privateca/latest/APIReference/API_UntagCertificateAuthority.html">UntagCertificateAuthority</a>
/// action.
class Tag {
  /// Key (name) of the tag.
  final String key;

  /// Value of the tag.
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

/// Validity specifies the period of time during which a certificate is valid.
/// Validity can be expressed as an explicit date and time when the validity of
/// a certificate starts or expires, or as a span of time after issuance, stated
/// in days, months, or years. For more information, see <a
/// href="https://tools.ietf.org/html/rfc5280#section-4.1.2.5">Validity</a> in
/// RFC 5280.
///
/// Amazon Web Services Private CA API consumes the <code>Validity</code> data
/// type differently in two distinct parameters of the
/// <code>IssueCertificate</code> action. The required parameter
/// <code>IssueCertificate</code>:<code>Validity</code> specifies the end of a
/// certificate's validity period. The optional parameter
/// <code>IssueCertificate</code>:<code>ValidityNotBefore</code> specifies a
/// customized starting time for the validity period.
class Validity {
  /// Determines how <i>Amazon Web Services Private CA</i> interprets the
  /// <code>Value</code> parameter, an integer. Supported validity types include
  /// those listed below. Type definitions with values include a sample input
  /// value and the resulting output.
  ///
  /// <code>END_DATE</code>: The specific date and time when the certificate will
  /// expire, expressed using UTCTime (YYMMDDHHMMSS) or GeneralizedTime
  /// (YYYYMMDDHHMMSS) format. When UTCTime is used, if the year field (YY) is
  /// greater than or equal to 50, the year is interpreted as 19YY. If the year
  /// field is less than 50, the year is interpreted as 20YY.
  ///
  /// <ul>
  /// <li>
  /// Sample input value: 491231235959 (UTCTime format)
  /// </li>
  /// <li>
  /// Output expiration date/time: 12/31/2049 23:59:59
  /// </li>
  /// </ul>
  /// <code>ABSOLUTE</code>: The specific date and time when the validity of a
  /// certificate will start or expire, expressed in seconds since the Unix Epoch.
  ///
  /// <ul>
  /// <li>
  /// Sample input value: 2524608000
  /// </li>
  /// <li>
  /// Output expiration date/time: 01/01/2050 00:00:00
  /// </li>
  /// </ul>
  /// <code>DAYS</code>, <code>MONTHS</code>, <code>YEARS</code>: The relative
  /// time from the moment of issuance until the certificate will expire,
  /// expressed in days, months, or years.
  ///
  /// Example if <code>DAYS</code>, issued on 10/12/2020 at 12:34:54 UTC:
  ///
  /// <ul>
  /// <li>
  /// Sample input value: 90
  /// </li>
  /// <li>
  /// Output expiration date: 01/10/2020 12:34:54 UTC
  /// </li>
  /// </ul>
  /// The minimum validity duration for a certificate using relative time
  /// (<code>DAYS</code>) is one day. The minimum validity for a certificate using
  /// absolute time (<code>ABSOLUTE</code> or <code>END_DATE</code>) is one
  /// second.
  final ValidityPeriodType type;

  /// A long integer interpreted according to the value of <code>Type</code>,
  /// below.
  final int value;

  Validity({
    required this.type,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum ValidityPeriodType {
  endDate,
  absolute,
  days,
  months,
  years,
}

extension ValidityPeriodTypeValueExtension on ValidityPeriodType {
  String toValue() {
    switch (this) {
      case ValidityPeriodType.endDate:
        return 'END_DATE';
      case ValidityPeriodType.absolute:
        return 'ABSOLUTE';
      case ValidityPeriodType.days:
        return 'DAYS';
      case ValidityPeriodType.months:
        return 'MONTHS';
      case ValidityPeriodType.years:
        return 'YEARS';
    }
  }
}

extension ValidityPeriodTypeFromString on String {
  ValidityPeriodType toValidityPeriodType() {
    switch (this) {
      case 'END_DATE':
        return ValidityPeriodType.endDate;
      case 'ABSOLUTE':
        return ValidityPeriodType.absolute;
      case 'DAYS':
        return ValidityPeriodType.days;
      case 'MONTHS':
        return ValidityPeriodType.months;
      case 'YEARS':
        return ValidityPeriodType.years;
    }
    throw Exception('$this is not known in enum ValidityPeriodType');
  }
}

class CertificateMismatchException extends _s.GenericAwsException {
  CertificateMismatchException({String? type, String? message})
      : super(
            type: type, code: 'CertificateMismatchException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidArgsException extends _s.GenericAwsException {
  InvalidArgsException({String? type, String? message})
      : super(type: type, code: 'InvalidArgsException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String? type, String? message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidPolicyException extends _s.GenericAwsException {
  InvalidPolicyException({String? type, String? message})
      : super(type: type, code: 'InvalidPolicyException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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

class LockoutPreventedException extends _s.GenericAwsException {
  LockoutPreventedException({String? type, String? message})
      : super(type: type, code: 'LockoutPreventedException', message: message);
}

class MalformedCSRException extends _s.GenericAwsException {
  MalformedCSRException({String? type, String? message})
      : super(type: type, code: 'MalformedCSRException', message: message);
}

class MalformedCertificateException extends _s.GenericAwsException {
  MalformedCertificateException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedCertificateException',
            message: message);
}

class PermissionAlreadyExistsException extends _s.GenericAwsException {
  PermissionAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'PermissionAlreadyExistsException',
            message: message);
}

class RequestAlreadyProcessedException extends _s.GenericAwsException {
  RequestAlreadyProcessedException({String? type, String? message})
      : super(
            type: type,
            code: 'RequestAlreadyProcessedException',
            message: message);
}

class RequestFailedException extends _s.GenericAwsException {
  RequestFailedException({String? type, String? message})
      : super(type: type, code: 'RequestFailedException', message: message);
}

class RequestInProgressException extends _s.GenericAwsException {
  RequestInProgressException({String? type, String? message})
      : super(type: type, code: 'RequestInProgressException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CertificateMismatchException': (type, message) =>
      CertificateMismatchException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InvalidArgsException': (type, message) =>
      InvalidArgsException(type: type, message: message),
  'InvalidArnException': (type, message) =>
      InvalidArnException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidPolicyException': (type, message) =>
      InvalidPolicyException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'InvalidTagException': (type, message) =>
      InvalidTagException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'LockoutPreventedException': (type, message) =>
      LockoutPreventedException(type: type, message: message),
  'MalformedCSRException': (type, message) =>
      MalformedCSRException(type: type, message: message),
  'MalformedCertificateException': (type, message) =>
      MalformedCertificateException(type: type, message: message),
  'PermissionAlreadyExistsException': (type, message) =>
      PermissionAlreadyExistsException(type: type, message: message),
  'RequestAlreadyProcessedException': (type, message) =>
      RequestAlreadyProcessedException(type: type, message: message),
  'RequestFailedException': (type, message) =>
      RequestFailedException(type: type, message: message),
  'RequestInProgressException': (type, message) =>
      RequestInProgressException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
