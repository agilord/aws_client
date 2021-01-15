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

part '2017-08-22.g.dart';

/// This is the <i>ACM Private CA API Reference</i>. It provides descriptions,
/// syntax, and usage examples for each of the actions and data types involved
/// in creating and managing private certificate authorities (CA) for your
/// organization.
///
/// The documentation for each action shows the Query API request parameters and
/// the XML response. Alternatively, you can use one of the AWS SDKs to access
/// an API that's tailored to the programming language or platform that you're
/// using. For more information, see <a
/// href="https://aws.amazon.com/tools/#SDKs">AWS SDKs</a>.
/// <note>
/// Each ACM Private CA API action has a quota that determines the number of
/// times the action can be called per second. For more information, see <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaLimits.html#PcaLimits-api">API
/// Rate Quotas in ACM Private CA</a> in the ACM Private CA user guide.
/// </note>
class AcmPca {
  final _s.JsonProtocol _protocol;
  AcmPca({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'acm-pca',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a root or subordinate private certificate authority (CA). You must
  /// specify the CA configuration, the certificate revocation list (CRL)
  /// configuration, the CA type, and an optional idempotency token to avoid
  /// accidental creation of multiple CAs. The CA configuration specifies the
  /// name of the algorithm and key size to be used to create the CA private
  /// key, the type of signing algorithm that the CA uses, and X.500 subject
  /// information. The CRL configuration specifies the CRL expiration period in
  /// days (the validity period of the CRL), the Amazon S3 bucket that will
  /// contain the CRL, and a CNAME alias for the S3 bucket that is included in
  /// certificates issued by the CA. If successful, this action returns the
  /// Amazon Resource Name (ARN) of the CA.
  ///
  /// ACM Private CAA assets that are stored in Amazon S3 can be protected with
  /// encryption. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaCreateCa.html#crl-encryption">Encrypting
  /// Your CRLs</a>.
  /// <note>
  /// Both PCA and the IAM principal must have permission to write to the S3
  /// bucket that you specify. If the IAM principal making the call does not
  /// have permission to write to the bucket, then an exception is thrown. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaAuthAccess.html">Configure
  /// Access to ACM Private CA</a>.
  /// </note>
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
  /// Alphanumeric string that can be used to distinguish between calls to
  /// <b>CreateCertificateAuthority</b>. For a given token, ACM Private CA
  /// creates exactly one CA. If you issue a subsequent call using the same
  /// token, ACM Private CA returns the ARN of the existing CA and takes no
  /// further action. If you change the idempotency token across multiple calls,
  /// ACM Private CA creates a unique CA for each unique token.
  ///
  /// Parameter [revocationConfiguration] :
  /// Contains a Boolean value that you can use to enable a certification
  /// revocation list (CRL) for the CA, the name of the S3 bucket to which ACM
  /// Private CA will write the CRL, and an optional CNAME alias that you can
  /// use to hide the name of your bucket in the <b>CRL Distribution Points</b>
  /// extension of your CA certificate. For more information, see the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CrlConfiguration.html">CrlConfiguration</a>
  /// structure.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that will be attached to the new private CA. You can
  /// associate up to 50 tags with a private CA. For information using tags with
  /// IAM to manage permissions, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html">Controlling
  /// Access Using IAM Tags</a>.
  Future<CreateCertificateAuthorityResponse> createCertificateAuthority({
    @_s.required
        CertificateAuthorityConfiguration certificateAuthorityConfiguration,
    @_s.required CertificateAuthorityType certificateAuthorityType,
    String idempotencyToken,
    RevocationConfiguration revocationConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityConfiguration, 'certificateAuthorityConfiguration');
    ArgumentError.checkNotNull(
        certificateAuthorityType, 'certificateAuthorityType');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      36,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]*''',
    );
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
        'CertificateAuthorityType': certificateAuthorityType?.toValue() ?? '',
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
        if (revocationConfiguration != null)
          'RevocationConfiguration': revocationConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateCertificateAuthorityResponse.fromJson(jsonResponse.body);
  }

  /// Creates an audit report that lists every time that your CA private key is
  /// used. The report is saved in the Amazon S3 bucket that you specify on
  /// input. The <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_IssueCertificate.html">IssueCertificate</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_RevokeCertificate.html">RevokeCertificate</a>
  /// actions use the private key.
  /// <note>
  /// Both PCA and the IAM principal must have permission to write to the S3
  /// bucket that you specify. If the IAM principal making the call does not
  /// have permission to write to the bucket, then an exception is thrown. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaAuthAccess.html">Configure
  /// Access to ACM Private CA</a>.
  /// </note>
  /// ACM Private CAA assets that are stored in Amazon S3 can be protected with
  /// encryption. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaAuditReport.html#audit-report-encryption">Encrypting
  /// Your Audit Reports</a>.
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
    @_s.required AuditReportResponseFormat auditReportResponseFormat,
    @_s.required String certificateAuthorityArn,
    @_s.required String s3BucketName,
  }) async {
    ArgumentError.checkNotNull(
        auditReportResponseFormat, 'auditReportResponseFormat');
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3BucketName, 's3BucketName');
    _s.validateStringLength(
      's3BucketName',
      s3BucketName,
      3,
      63,
      isRequired: true,
    );
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
        'AuditReportResponseFormat': auditReportResponseFormat?.toValue() ?? '',
        'CertificateAuthorityArn': certificateAuthorityArn,
        'S3BucketName': s3BucketName,
      },
    );

    return CreateCertificateAuthorityAuditReportResponse.fromJson(
        jsonResponse.body);
  }

  /// Grants one or more permissions on a private CA to the AWS Certificate
  /// Manager (ACM) service principal (<code>acm.amazonaws.com</code>). These
  /// permissions allow ACM to issue and renew ACM certificates that reside in
  /// the same AWS account as the CA.
  ///
  /// You can list current permissions with the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListPermissions.html">ListPermissions</a>
  /// action and revoke them with the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeletePermission.html">DeletePermission</a>
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with ACM Private CA</a>.
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
  /// The actions that the specified AWS service principal can use. These
  /// include <code>IssueCertificate</code>, <code>GetCertificate</code>, and
  /// <code>ListPermissions</code>.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) of the CA that grants the permissions. You
  /// can find the ARN by calling the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. This must have the following form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  ///
  /// Parameter [principal] :
  /// The AWS service or identity that receives the permission. At this time,
  /// the only valid principal is <code>acm.amazonaws.com</code>.
  ///
  /// Parameter [sourceAccount] :
  /// The ID of the calling account.
  Future<void> createPermission({
    @_s.required List<ActionType> actions,
    @_s.required String certificateAuthorityArn,
    @_s.required String principal,
    String sourceAccount,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    _s.validateStringLength(
      'principal',
      principal,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'principal',
      principal,
      r'''^[^*]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'sourceAccount',
      sourceAccount,
      12,
      12,
    );
    _s.validateStringPattern(
      'sourceAccount',
      sourceAccount,
      r'''[0-9]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.CreatePermission'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Actions': actions?.map((e) => e?.toValue() ?? '')?.toList(),
        'CertificateAuthorityArn': certificateAuthorityArn,
        'Principal': principal,
        if (sourceAccount != null) 'SourceAccount': sourceAccount,
      },
    );
  }

  /// Deletes a private certificate authority (CA). You must provide the Amazon
  /// Resource Name (ARN) of the private CA that you want to delete. You can
  /// find the ARN by calling the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action.
  /// <note>
  /// Deleting a CA will invalidate other CAs and certificates below it in your
  /// CA hierarchy.
  /// </note>
  /// Before you can delete a CA that you have created and activated, you must
  /// disable it. To do this, call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// action and set the <b>CertificateAuthorityStatus</b> parameter to
  /// <code>DISABLED</code>.
  ///
  /// Additionally, you can delete a CA if you are waiting for it to be created
  /// (that is, the status of the CA is <code>CREATING</code>). You can also
  /// delete it if the CA has been created but you haven't yet imported the
  /// signed certificate into ACM Private CA (that is, the status of the CA is
  /// <code>PENDING_CERTIFICATE</code>).
  ///
  /// When you successfully call <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeleteCertificateAuthority.html">DeleteCertificateAuthority</a>,
  /// the CA's status changes to <code>DELETED</code>. However, the CA won't be
  /// permanently deleted until the restoration period has passed. By default,
  /// if you do not set the <code>PermanentDeletionTimeInDays</code> parameter,
  /// the CA remains restorable for 30 days. You can set the parameter from 7 to
  /// 30 days. The <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DescribeCertificateAuthority.html">DescribeCertificateAuthority</a>
  /// action returns the time remaining in the restoration window of a private
  /// CA in the <code>DELETED</code> state. To restore an eligible CA, call the
  /// <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_RestoreCertificateAuthority.html">RestoreCertificateAuthority</a>
  /// action.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must have the following form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  ///
  /// Parameter [permanentDeletionTimeInDays] :
  /// The number of days to make a CA restorable after it has been deleted. This
  /// can be anywhere from 7 to 30 days, with 30 being the default.
  Future<void> deleteCertificateAuthority({
    @_s.required String certificateAuthorityArn,
    int permanentDeletionTimeInDays,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
    final jsonResponse = await _protocol.send(
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

  /// Revokes permissions on a private CA granted to the AWS Certificate Manager
  /// (ACM) service principal (acm.amazonaws.com).
  ///
  /// These permissions allow ACM to issue and renew ACM certificates that
  /// reside in the same AWS account as the CA. If you revoke these permissions,
  /// ACM will no longer renew the affected certificates automatically.
  ///
  /// Permissions can be granted with the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreatePermission.html">CreatePermission</a>
  /// action and listed with the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListPermissions.html">ListPermissions</a>
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with ACM Private CA</a>.
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. This must have the following form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  ///
  /// Parameter [principal] :
  /// The AWS service or identity that will have its CA permissions revoked. At
  /// this time, the only valid service principal is
  /// <code>acm.amazonaws.com</code>
  ///
  /// Parameter [sourceAccount] :
  /// The AWS account that calls this action.
  Future<void> deletePermission({
    @_s.required String certificateAuthorityArn,
    @_s.required String principal,
    String sourceAccount,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    _s.validateStringLength(
      'principal',
      principal,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'principal',
      principal,
      r'''^[^*]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'sourceAccount',
      sourceAccount,
      12,
      12,
    );
    _s.validateStringPattern(
      'sourceAccount',
      sourceAccount,
      r'''[0-9]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.DeletePermission'
    };
    final jsonResponse = await _protocol.send(
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
  /// If you delete a policy that was applied through AWS Resource Access
  /// Manager (RAM), the CA will be removed from all shares in which it was
  /// included.
  ///
  /// The AWS Certificate Manager Service Linked Role that the policy supports
  /// is not affected when you delete the policy.
  ///
  /// The current policy can be shown with <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_GetPolicy.html">GetPolicy</a>
  /// and updated with <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_PutPolicy.html">PutPolicy</a>.
  /// <p class="title"> <b>About Policies</b>
  ///
  /// <ul>
  /// <li>
  /// A policy grants access on a private CA to an AWS customer account, to AWS
  /// Organizations, or to an AWS Organizations unit. Policies are under the
  /// control of a CA administrator. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with ACM Private CA</a>.
  /// </li>
  /// <li>
  /// A policy permits a user of AWS Certificate Manager (ACM) to issue ACM
  /// certificates signed by a CA in another account.
  /// </li>
  /// <li>
  /// For ACM to manage automatic renewal of these certificates, the ACM user
  /// must configure a Service Linked Role (SLR). The SLR allows the ACM service
  /// to assume the identity of the user, subject to confirmation against the
  /// ACM Private CA policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html">Using
  /// a Service Linked Role with ACM</a>.
  /// </li>
  /// <li>
  /// Updates made in AWS Resource Manager (RAM) are reflected in policies. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-ram.html">Attach
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. The ARN value must have the form
  /// <code>arn:aws:acm-pca:region:account:certificate-authority/01234567-89ab-cdef-0123-0123456789ab</code>.
  Future<void> deletePolicy({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.DeletePolicy'
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
  }

  /// Lists information about your private certificate authority (CA) or one
  /// that has been shared with you. You specify the private CA on input by its
  /// ARN (Amazon Resource Name). The output contains the status of your CA.
  /// This can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - ACM Private CA is creating your private
  /// certificate authority.
  /// </li>
  /// <li>
  /// <code>PENDING_CERTIFICATE</code> - The certificate is pending. You must
  /// use your ACM Private CA-hosted or on-premises root or subordinate CA to
  /// sign your private CA CSR and then import it into PCA.
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
  /// of problems such a network outage or backend AWS failure or other errors.
  /// A failed CA can never return to the pending state. You must create a new
  /// CA.
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  Future<DescribeCertificateAuthorityResponse> describeCertificateAuthority({
    @_s.required String certificateAuthorityArn,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>
  /// action. Audit information is created every time the certificate authority
  /// (CA) private key is used. The private key is used when you call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_IssueCertificate.html">IssueCertificate</a>
  /// action or the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_RevokeCertificate.html">RevokeCertificate</a>
  /// action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidArgsException].
  ///
  /// Parameter [auditReportId] :
  /// The report ID returned by calling the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>
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
    @_s.required String auditReportId,
    @_s.required String certificateAuthorityArn,
  }) async {
    ArgumentError.checkNotNull(auditReportId, 'auditReportId');
    _s.validateStringLength(
      'auditReportId',
      auditReportId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'auditReportId',
      auditReportId,
      r'''[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_IssueCertificate.html">IssueCertificate</a>
  /// action. You must specify both the ARN of your private CA and the ARN of
  /// the issued certificate when calling the <b>GetCertificate</b> action. You
  /// can retrieve the certificate if it is in the <b>ISSUED</b> state. You can
  /// call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  Future<GetCertificateResponse> getCertificate({
    @_s.required String certificateArn,
    @_s.required String certificateAuthorityArn,
  }) async {
    ArgumentError.checkNotNull(certificateArn, 'certificateArn');
    _s.validateStringLength(
      'certificateArn',
      certificateArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateArn',
      certificateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
    @_s.required String certificateAuthorityArn,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action. Sign the CSR with your ACM Private CA-hosted or on-premises root
  /// or subordinate CA. Then import the signed certificate back into ACM
  /// Private CA by calling the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html">ImportCertificateAuthorityCertificate</a>
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action. This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  Future<GetCertificateAuthorityCsrResponse> getCertificateAuthorityCsr({
    @_s.required String certificateAuthorityArn,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_PutPolicy.html">PutPolicy</a>
  /// and removed with <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeletePolicy.html">DeletePolicy</a>.
  /// <p class="title"> <b>About Policies</b>
  ///
  /// <ul>
  /// <li>
  /// A policy grants access on a private CA to an AWS customer account, to AWS
  /// Organizations, or to an AWS Organizations unit. Policies are under the
  /// control of a CA administrator. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with ACM Private CA</a>.
  /// </li>
  /// <li>
  /// A policy permits a user of AWS Certificate Manager (ACM) to issue ACM
  /// certificates signed by a CA in another account.
  /// </li>
  /// <li>
  /// For ACM to manage automatic renewal of these certificates, the ACM user
  /// must configure a Service Linked Role (SLR). The SLR allows the ACM service
  /// to assume the identity of the user, subject to confirmation against the
  /// ACM Private CA policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html">Using
  /// a Service Linked Role with ACM</a>.
  /// </li>
  /// <li>
  /// Updates made in AWS Resource Manager (RAM) are reflected in policies. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-ram.html">Attach
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
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

  /// Imports a signed private CA certificate into ACM Private CA. This action
  /// is used when you are using a chain of trust whose root is located outside
  /// ACM Private CA. Before you can call this action, the following
  /// preparations must in place:
  /// <ol>
  /// <li>
  /// In ACM Private CA, call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action to create the private CA that that you plan to back with the
  /// imported certificate.
  /// </li>
  /// <li>
  /// Call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_GetCertificateAuthorityCsr.html">GetCertificateAuthorityCsr</a>
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
  /// ACM Private CA supports three scenarios for installing a CA certificate:
  ///
  /// <ul>
  /// <li>
  /// Installing a certificate for a root CA hosted by ACM Private CA.
  /// </li>
  /// <li>
  /// Installing a subordinate CA certificate whose parent authority is hosted
  /// by ACM Private CA.
  /// </li>
  /// <li>
  /// Installing a subordinate CA certificate whose parent authority is
  /// externally hosted.
  /// </li>
  /// </ul>
  /// The following addtitional requirements apply when you import a CA
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
  /// ACM Private CA allows the following extensions to be marked critical in
  /// the imported CA certificate or chain.
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
  /// ACM Private CA rejects the following extensions when they are marked
  /// critical in an imported CA certificate or chain.
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [certificateChain] :
  /// A PEM-encoded file that contains all of your certificates, other than the
  /// certificate you're importing, chaining up to your root CA. Your ACM
  /// Private CA-hosted or on-premises root certificate is the last in the
  /// chain, and each certificate in the chain signs the one preceding.
  ///
  /// This parameter must be supplied when you import a subordinate CA. When you
  /// import a root CA, there is no chain.
  Future<void> importCertificateAuthorityCertificate({
    @_s.required Uint8List certificate,
    @_s.required String certificateAuthorityArn,
    Uint8List certificateChain,
  }) async {
    ArgumentError.checkNotNull(certificate, 'certificate');
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.ImportCertificateAuthorityCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Certificate': certificate?.let(base64Encode),
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_GetCertificate.html">GetCertificate</a>
  /// action and specifying the ARN.
  /// <note>
  /// You cannot use the ACM <b>ListCertificateAuthorities</b> action to
  /// retrieve the ARNs of the certificates that you issue by using ACM Private
  /// CA.
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [csr] :
  /// The certificate signing request (CSR) for the certificate you want to
  /// issue. You can use the following OpenSSL command to create the CSR and a
  /// 2048 bit RSA private key.
  ///
  /// <code>openssl req -new -newkey rsa:2048 -days 365 -keyout
  /// private/test_cert_priv_key.pem -out csr/test_cert_.csr</code>
  ///
  /// If you have a configuration file, you can use the following OpenSSL
  /// command. The <code>usr_cert</code> block in the configuration file
  /// contains your X509 version 3 extensions.
  ///
  /// <code>openssl req -new -config openssl_rsa.cnf -extensions usr_cert
  /// -newkey rsa:2048 -days -365 -keyout private/test_cert_priv_key.pem -out
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
  /// <code>SigningAlgorithm</code> parameter used to sign a CSR.
  ///
  /// Parameter [validity] :
  /// Information describing the validity period of the certificate.
  ///
  /// When issuing a certificate, ACM Private CA sets the "Not Before" date in
  /// the validity field to date and time minus 60 minutes. This is intended to
  /// compensate for time inconsistencies across systems of 60 minutes or less.
  ///
  /// The validity period configured on a certificate must not exceed the limit
  /// set by its parents in the CA hierarchy.
  ///
  /// Parameter [idempotencyToken] :
  /// Custom string that can be used to distinguish between calls to the
  /// <b>IssueCertificate</b> action. Idempotency tokens time out after one
  /// hour. Therefore, if you call <b>IssueCertificate</b> multiple times with
  /// the same idempotency token within 5 minutes, ACM Private CA recognizes
  /// that you are requesting only one certificate and will issue only one. If
  /// you change the idempotency token for each call, PCA recognizes that you
  /// are requesting multiple certificates.
  ///
  /// Parameter [templateArn] :
  /// Specifies a custom configuration template to use when issuing a
  /// certificate. If this parameter is not provided, ACM Private CA defaults to
  /// the <code>EndEntityCertificate/V1</code> template. For CA certificates,
  /// you should choose the shortest path length that meets your needs. The path
  /// length is indicated by the PathLen<i>N</i> portion of the ARN, where
  /// <i>N</i> is the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaTerms.html#terms-cadepth">CA
  /// depth</a>.
  ///
  /// Note: The CA depth configured on a subordinate CA certificate must not
  /// exceed the limit set by its parents in the CA hierarchy.
  ///
  /// The following service-owned <code>TemplateArn</code> values are supported
  /// by ACM Private CA:
  ///
  /// <ul>
  /// <li>
  /// arn:aws:acm-pca:::template/CodeSigningCertificate/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/CodeSigningCertificate_CSRPassthrough/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/EndEntityCertificate/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/EndEntityCertificate_CSRPassthrough/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/EndEntityClientAuthCertificate/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/EndEntityClientAuthCertificate_CSRPassthrough/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/EndEntityServerAuthCertificate/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/EndEntityServerAuthCertificate_CSRPassthrough/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/OCSPSigningCertificate/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/OCSPSigningCertificate_CSRPassthrough/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/RootCACertificate/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen0/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen1/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen2/V1
  /// </li>
  /// <li>
  /// arn:aws:acm-pca:::template/SubordinateCACertificate_PathLen3/V1
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/UsingTemplates.html">Using
  /// Templates</a>.
  Future<IssueCertificateResponse> issueCertificate({
    @_s.required String certificateAuthorityArn,
    @_s.required Uint8List csr,
    @_s.required SigningAlgorithm signingAlgorithm,
    @_s.required Validity validity,
    String idempotencyToken,
    String templateArn,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(csr, 'csr');
    ArgumentError.checkNotNull(signingAlgorithm, 'signingAlgorithm');
    ArgumentError.checkNotNull(validity, 'validity');
    _s.validateStringLength(
      'idempotencyToken',
      idempotencyToken,
      1,
      36,
    );
    _s.validateStringPattern(
      'idempotencyToken',
      idempotencyToken,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]*''',
    );
    _s.validateStringLength(
      'templateArn',
      templateArn,
      5,
      200,
    );
    _s.validateStringPattern(
      'templateArn',
      templateArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
    );
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
        'Csr': csr?.let(base64Encode),
        'SigningAlgorithm': signingAlgorithm?.toValue() ?? '',
        'Validity': validity,
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
        if (templateArn != null) 'TemplateArn': templateArn,
      },
    );

    return IssueCertificateResponse.fromJson(jsonResponse.body);
  }

  /// Lists the private certificate authorities that you created by using the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
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
  /// Parameter [nextToken] :
  /// Use this parameter when paginating results in a subsequent request after
  /// you receive a response with truncated results. Set it to the value of the
  /// <code>NextToken</code> parameter from the response you just received.
  ///
  /// Parameter [resourceOwner] :
  /// Use this parameter to filter the returned set of certificate authorities
  /// based on their owner. The default is SELF.
  Future<ListCertificateAuthoritiesResponse> listCertificateAuthorities({
    int maxResults,
    String nextToken,
    ResourceOwner resourceOwner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      500,
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

  /// List all permissions on a private CA, if any, granted to the AWS
  /// Certificate Manager (ACM) service principal (acm.amazonaws.com).
  ///
  /// These permissions allow ACM to issue and renew ACM certificates that
  /// reside in the same AWS account as the CA.
  ///
  /// Permissions can be granted with the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreatePermission.html">CreatePermission</a>
  /// action and revoked with the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeletePermission.html">DeletePermission</a>
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with ACM Private CA</a>.
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action. This must be of the form:
  /// <code>arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012</code>
  /// You can get a private CA's ARN by running the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
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
    @_s.required String certificateAuthorityArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      500,
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_TagCertificateAuthority.html">TagCertificateAuthority</a>
  /// action to add one or more tags to your CA. Call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UntagCertificateAuthority.html">UntagCertificateAuthority</a>
  /// action to remove tags.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
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
    @_s.required String certificateAuthorityArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      500,
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
  /// A policy can also be applied by sharing a private CA through AWS Resource
  /// Access Manager (RAM). For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-ram.html">Attach
  /// a Policy for Cross-Account Access</a>.
  ///
  /// The policy can be displayed with <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_GetPolicy.html">GetPolicy</a>
  /// and removed with <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeletePolicy.html">DeletePolicy</a>.
  /// <p class="title"> <b>About Policies</b>
  ///
  /// <ul>
  /// <li>
  /// A policy grants access on a private CA to an AWS customer account, to AWS
  /// Organizations, or to an AWS Organizations unit. Policies are under the
  /// control of a CA administrator. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-rbp.html">Using
  /// a Resource Based Policy with ACM Private CA</a>.
  /// </li>
  /// <li>
  /// A policy permits a user of AWS Certificate Manager (ACM) to issue ACM
  /// certificates signed by a CA in another account.
  /// </li>
  /// <li>
  /// For ACM to manage automatic renewal of these certificates, the ACM user
  /// must configure a Service Linked Role (SLR). The SLR allows the ACM service
  /// to assume the identity of the user, subject to confirmation against the
  /// ACM Private CA policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-slr.html">Using
  /// a Service Linked Role with ACM</a>.
  /// </li>
  /// <li>
  /// Updates made in AWS Resource Manager (RAM) are reflected in policies. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/pca-ram.html">Attach
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
  /// The path and filename of a JSON-formatted IAM policy to attach to the
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// action.
  /// <p/>
  Future<void> putPolicy({
    @_s.required String policy,
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      20480,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.PutPolicy'
    };
    final jsonResponse = await _protocol.send(
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeleteCertificateAuthority.html">DeleteCertificateAuthority</a>
  /// action. Currently, you can specify 7 to 30 days. If you did not specify a
  /// <b>PermanentDeletionTimeInDays</b> value, by default you can restore the
  /// CA at any time in a 30 day period. You can check the time remaining in the
  /// restoration period of a private CA in the <code>DELETED</code> state by
  /// calling the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DescribeCertificateAuthority.html">DescribeCertificateAuthority</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListCertificateAuthorities.html">ListCertificateAuthorities</a>
  /// actions. The status of a restored CA is set to its pre-deletion status
  /// when the <b>RestoreCertificateAuthority</b> action returns. To change its
  /// status to <code>ACTIVE</code>, call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// action. If the private CA was in the <code>PENDING_CERTIFICATE</code>
  /// state at deletion, you must use the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html">ImportCertificateAuthorityCertificate</a>
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action. This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  Future<void> restoreCertificateAuthority({
    @_s.required String certificateAuthorityArn,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.RestoreCertificateAuthority'
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
  }

  /// Revokes a certificate that was issued inside ACM Private CA. If you enable
  /// a certificate revocation list (CRL) when you create or update your private
  /// CA, information about the revoked certificates will be included in the
  /// CRL. ACM Private CA writes the CRL to an S3 bucket that you specify. A CRL
  /// is typically updated approximately 30 minutes after a certificate is
  /// revoked. If for any reason the CRL update fails, ACM Private CA attempts
  /// makes further attempts every 15 minutes. With Amazon CloudWatch, you can
  /// create alarms for the metrics <code>CRLGenerated</code> and
  /// <code>MisconfiguredCRLBucket</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaCloudWatch.html">Supported
  /// CloudWatch Metrics</a>.
  /// <note>
  /// Both PCA and the IAM principal must have permission to write to the S3
  /// bucket that you specify. If the IAM principal making the call does not
  /// have permission to write to the bucket, then an exception is thrown. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaAuthAccess.html">Configure
  /// Access to ACM Private CA</a>.
  /// </note>
  /// ACM Private CA also writes revocation information to the audit report. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthorityAuditReport.html">CreateCertificateAuthorityAuditReport</a>.
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_GetCertificate.html">GetCertificate</a>
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
  /// action in the <i>AWS Certificate Manager API Reference</i>.
  ///
  /// Parameter [revocationReason] :
  /// Specifies why you revoked the certificate.
  Future<void> revokeCertificate({
    @_s.required String certificateAuthorityArn,
    @_s.required String certificateSerial,
    @_s.required RevocationReason revocationReason,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(certificateSerial, 'certificateSerial');
    _s.validateStringLength(
      'certificateSerial',
      certificateSerial,
      0,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(revocationReason, 'revocationReason');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.RevokeCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateAuthorityArn': certificateAuthorityArn,
        'CertificateSerial': certificateSerial,
        'RevocationReason': revocationReason?.toValue() ?? '',
      },
    );
  }

  /// Adds one or more tags to your private CA. Tags are labels that you can use
  /// to identify and organize your AWS resources. Each tag consists of a key
  /// and an optional value. You specify the private CA on input by its Amazon
  /// Resource Name (ARN). You specify the tag by using a key-value pair. You
  /// can apply a tag to just one private CA if you want to identify a specific
  /// characteristic of that CA, or you can apply the same tag to multiple
  /// private CAs if you want to filter for a common relationship among those
  /// CAs. To remove one or more tags, use the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UntagCertificateAuthority.html">UntagCertificateAuthority</a>
  /// action. Call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListTags.html">ListTags</a>
  /// action to see what tags are associated with your CA.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidTagException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [tags] :
  /// List of tags to be associated with the CA.
  Future<void> tagCertificateAuthority({
    @_s.required String certificateAuthorityArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.TagCertificateAuthority'
    };
    final jsonResponse = await _protocol.send(
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
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_TagCertificateAuthority.html">TagCertificateAuthority</a>.
  /// Call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListTags.html">ListTags</a>
  /// action to see what tags are associated with your CA.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidStateException].
  /// May throw [InvalidTagException].
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The Amazon Resource Name (ARN) that was returned when you called <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>.
  /// This must be of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>
  ///
  /// Parameter [tags] :
  /// List of tags to be removed from the CA.
  Future<void> untagCertificateAuthority({
    @_s.required String certificateAuthorityArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.UntagCertificateAuthority'
    };
    final jsonResponse = await _protocol.send(
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
  /// Both PCA and the IAM principal must have permission to write to the S3
  /// bucket that you specify. If the IAM principal making the call does not
  /// have permission to write to the bucket, then an exception is thrown. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaAuthAccess.html">Configure
  /// Access to ACM Private CA</a>.
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
  /// Revocation information for your private CA.
  ///
  /// Parameter [status] :
  /// Status of your private CA.
  Future<void> updateCertificateAuthority({
    @_s.required String certificateAuthorityArn,
    RevocationConfiguration revocationConfiguration,
    CertificateAuthorityStatus status,
  }) async {
    ArgumentError.checkNotNull(
        certificateAuthorityArn, 'certificateAuthorityArn');
    _s.validateStringLength(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      5,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[\w+=/,.@-]+:[\w+=/,.@-]+:[\w+=/,.@-]*:[0-9]*:[\w+=,.@-]+(/[\w+=,.@-]+)*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ACMPrivateCA.UpdateCertificateAuthority'
    };
    final jsonResponse = await _protocol.send(
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

/// Contains information about the certificate subject. The certificate can be
/// one issued by your private certificate authority (CA) or it can be your
/// private CA certificate. The <b>Subject</b> field in the certificate
/// identifies the entity that owns or controls the public key in the
/// certificate. The entity can be a user, computer, device, or service. The
/// <b>Subject</b> must contain an X.500 distinguished name (DN). A DN is a
/// sequence of relative distinguished names (RDNs). The RDNs are separated by
/// commas in the certificate. The DN must be unique for each entity, but your
/// private CA can issue more than one certificate with the same DN to the same
/// entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ASN1Subject {
  /// For CA and end-entity certificates in a private PKI, the common name (CN)
  /// can be any string within the length limit.
  ///
  /// Note: In publicly trusted certificates, the common name must be a fully
  /// qualified domain name (FQDN) associated with the certificate subject.
  @_s.JsonKey(name: 'CommonName')
  final String commonName;

  /// Two-digit code that specifies the country in which the certificate subject
  /// located.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// Disambiguating information for the certificate subject.
  @_s.JsonKey(name: 'DistinguishedNameQualifier')
  final String distinguishedNameQualifier;

  /// Typically a qualifier appended to the name of an individual. Examples
  /// include Jr. for junior, Sr. for senior, and III for third.
  @_s.JsonKey(name: 'GenerationQualifier')
  final String generationQualifier;

  /// First name.
  @_s.JsonKey(name: 'GivenName')
  final String givenName;

  /// Concatenation that typically contains the first letter of the
  /// <b>GivenName</b>, the first letter of the middle name if one exists, and the
  /// first letter of the <b>SurName</b>.
  @_s.JsonKey(name: 'Initials')
  final String initials;

  /// The locality (such as a city or town) in which the certificate subject is
  /// located.
  @_s.JsonKey(name: 'Locality')
  final String locality;

  /// Legal name of the organization with which the certificate subject is
  /// affiliated.
  @_s.JsonKey(name: 'Organization')
  final String organization;

  /// A subdivision or unit of the organization (such as sales or finance) with
  /// which the certificate subject is affiliated.
  @_s.JsonKey(name: 'OrganizationalUnit')
  final String organizationalUnit;

  /// Typically a shortened version of a longer <b>GivenName</b>. For example,
  /// Jonathan is often shortened to John. Elizabeth is often shortened to Beth,
  /// Liz, or Eliza.
  @_s.JsonKey(name: 'Pseudonym')
  final String pseudonym;

  /// The certificate serial number.
  @_s.JsonKey(name: 'SerialNumber')
  final String serialNumber;

  /// State in which the subject of the certificate is located.
  @_s.JsonKey(name: 'State')
  final String state;

  /// Family name. In the US and the UK, for example, the surname of an individual
  /// is ordered last. In Asian cultures the surname is typically ordered first.
  @_s.JsonKey(name: 'Surname')
  final String surname;

  /// A title such as Mr. or Ms., which is pre-pended to the name to refer
  /// formally to the certificate subject.
  @_s.JsonKey(name: 'Title')
  final String title;

  ASN1Subject({
    this.commonName,
    this.country,
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
  factory ASN1Subject.fromJson(Map<String, dynamic> json) =>
      _$ASN1SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$ASN1SubjectToJson(this);
}

/// Provides access information used by the <code>authorityInfoAccess</code> and
/// <code>subjectInfoAccess</code> extensions described in <a
/// href="https://tools.ietf.org/html/rfc5280">RFC 5280</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessDescription {
  /// The location of <code>AccessDescription</code> information.
  @_s.JsonKey(name: 'AccessLocation')
  final GeneralName accessLocation;

  /// The type and format of <code>AccessDescription</code> information.
  @_s.JsonKey(name: 'AccessMethod')
  final AccessMethod accessMethod;

  AccessDescription({
    @_s.required this.accessLocation,
    @_s.required this.accessMethod,
  });
  factory AccessDescription.fromJson(Map<String, dynamic> json) =>
      _$AccessDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AccessDescriptionToJson(this);
}

/// Describes the type and format of extension access. Only one of
/// <code>CustomObjectIdentifier</code> or <code>AccessMethodType</code> may be
/// provided. Providing both results in <code>InvalidArgsException</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessMethod {
  /// Specifies the <code>AccessMethod</code>.
  @_s.JsonKey(name: 'AccessMethodType')
  final AccessMethodType accessMethodType;

  /// An object identifier (OID) specifying the <code>AccessMethod</code>. The OID
  /// must satisfy the regular expression shown below. For more information, see
  /// NIST's definition of <a
  /// href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
  /// Identifier (OID)</a>.
  @_s.JsonKey(name: 'CustomObjectIdentifier')
  final String customObjectIdentifier;

  AccessMethod({
    this.accessMethodType,
    this.customObjectIdentifier,
  });
  factory AccessMethod.fromJson(Map<String, dynamic> json) =>
      _$AccessMethodFromJson(json);

  Map<String, dynamic> toJson() => _$AccessMethodToJson(this);
}

enum AccessMethodType {
  @_s.JsonValue('CA_REPOSITORY')
  caRepository,
  @_s.JsonValue('RESOURCE_PKI_MANIFEST')
  resourcePkiManifest,
  @_s.JsonValue('RESOURCE_PKI_NOTIFY')
  resourcePkiNotify,
}

enum ActionType {
  @_s.JsonValue('IssueCertificate')
  issueCertificate,
  @_s.JsonValue('GetCertificate')
  getCertificate,
  @_s.JsonValue('ListPermissions')
  listPermissions,
}

extension on ActionType {
  String toValue() {
    switch (this) {
      case ActionType.issueCertificate:
        return 'IssueCertificate';
      case ActionType.getCertificate:
        return 'GetCertificate';
      case ActionType.listPermissions:
        return 'ListPermissions';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum AuditReportResponseFormat {
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('CSV')
  csv,
}

extension on AuditReportResponseFormat {
  String toValue() {
    switch (this) {
      case AuditReportResponseFormat.json:
        return 'JSON';
      case AuditReportResponseFormat.csv:
        return 'CSV';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum AuditReportStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains information about your private certificate authority (CA). Your
/// private CA can issue and revoke X.509 digital certificates. Digital
/// certificates verify that the entity named in the certificate <b>Subject</b>
/// field owns or controls the public key contained in the <b>Subject Public Key
/// Info</b> field. Call the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
/// action to create your private CA. You must then call the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_GetCertificateAuthorityCertificate.html">GetCertificateAuthorityCertificate</a>
/// action to retrieve a private CA certificate signing request (CSR). Sign the
/// CSR with your ACM Private CA-hosted or on-premises root or subordinate CA
/// certificate. Call the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ImportCertificateAuthorityCertificate.html">ImportCertificateAuthorityCertificate</a>
/// action to import the signed certificate into AWS Certificate Manager (ACM).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CertificateAuthority {
  /// Amazon Resource Name (ARN) for your private certificate authority (CA). The
  /// format is <code> <i>12345678-1234-1234-1234-123456789012</i> </code>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// Your private CA configuration.
  @_s.JsonKey(name: 'CertificateAuthorityConfiguration')
  final CertificateAuthorityConfiguration certificateAuthorityConfiguration;

  /// Date and time at which your private CA was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Reason the request to create your private CA failed.
  @_s.JsonKey(name: 'FailureReason')
  final FailureReason failureReason;

  /// Date and time at which your private CA was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastStateChangeAt')
  final DateTime lastStateChangeAt;

  /// Date and time after which your private CA certificate is not valid.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'NotAfter')
  final DateTime notAfter;

  /// Date and time before which your private CA certificate is not valid.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'NotBefore')
  final DateTime notBefore;

  /// The AWS account ID that owns the certificate authority.
  @_s.JsonKey(name: 'OwnerAccount')
  final String ownerAccount;

  /// The period during which a deleted CA can be restored. For more information,
  /// see the <code>PermanentDeletionTimeInDays</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeleteCertificateAuthorityRequest.html">DeleteCertificateAuthorityRequest</a>
  /// action.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RestorableUntil')
  final DateTime restorableUntil;

  /// Information about the certificate revocation list (CRL) created and
  /// maintained by your private CA.
  @_s.JsonKey(name: 'RevocationConfiguration')
  final RevocationConfiguration revocationConfiguration;

  /// Serial number of your private CA.
  @_s.JsonKey(name: 'Serial')
  final String serial;

  /// Status of your private CA.
  @_s.JsonKey(name: 'Status')
  final CertificateAuthorityStatus status;

  /// Type of your private CA.
  @_s.JsonKey(name: 'Type')
  final CertificateAuthorityType type;

  CertificateAuthority({
    this.arn,
    this.certificateAuthorityConfiguration,
    this.createdAt,
    this.failureReason,
    this.lastStateChangeAt,
    this.notAfter,
    this.notBefore,
    this.ownerAccount,
    this.restorableUntil,
    this.revocationConfiguration,
    this.serial,
    this.status,
    this.type,
  });
  factory CertificateAuthority.fromJson(Map<String, dynamic> json) =>
      _$CertificateAuthorityFromJson(json);
}

/// Contains configuration information for your private certificate authority
/// (CA). This includes information about the class of public key algorithm and
/// the key pair that your private CA creates when it issues a certificate. It
/// also includes the signature algorithm that it uses when issuing
/// certificates, and its X.500 distinguished name. You must specify this
/// information when you call the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CertificateAuthorityConfiguration {
  /// Type of the public key algorithm and size, in bits, of the key pair that
  /// your CA creates when it issues a certificate. When you create a subordinate
  /// CA, you must use a key algorithm supported by the parent CA.
  @_s.JsonKey(name: 'KeyAlgorithm')
  final KeyAlgorithm keyAlgorithm;

  /// Name of the algorithm your private CA uses to sign certificate requests.
  ///
  /// This parameter should not be confused with the <code>SigningAlgorithm</code>
  /// parameter used to sign certificates when they are issued.
  @_s.JsonKey(name: 'SigningAlgorithm')
  final SigningAlgorithm signingAlgorithm;

  /// Structure that contains X.500 distinguished name information for your
  /// private CA.
  @_s.JsonKey(name: 'Subject')
  final ASN1Subject subject;

  /// Specifies information to be added to the extension section of the
  /// certificate signing request (CSR).
  @_s.JsonKey(name: 'CsrExtensions')
  final CsrExtensions csrExtensions;

  CertificateAuthorityConfiguration({
    @_s.required this.keyAlgorithm,
    @_s.required this.signingAlgorithm,
    @_s.required this.subject,
    this.csrExtensions,
  });
  factory CertificateAuthorityConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$CertificateAuthorityConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CertificateAuthorityConfigurationToJson(this);
}

enum CertificateAuthorityStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('PENDING_CERTIFICATE')
  pendingCertificate,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('FAILED')
  failed,
}

extension on CertificateAuthorityStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum CertificateAuthorityType {
  @_s.JsonValue('ROOT')
  root,
  @_s.JsonValue('SUBORDINATE')
  subordinate,
}

extension on CertificateAuthorityType {
  String toValue() {
    switch (this) {
      case CertificateAuthorityType.root:
        return 'ROOT';
      case CertificateAuthorityType.subordinate:
        return 'SUBORDINATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCertificateAuthorityAuditReportResponse {
  /// An alphanumeric string that contains a report identifier.
  @_s.JsonKey(name: 'AuditReportId')
  final String auditReportId;

  /// The <b>key</b> that uniquely identifies the report file in your S3 bucket.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  CreateCertificateAuthorityAuditReportResponse({
    this.auditReportId,
    this.s3Key,
  });
  factory CreateCertificateAuthorityAuditReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCertificateAuthorityAuditReportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCertificateAuthorityResponse {
  /// If successful, the Amazon Resource Name (ARN) of the certificate authority
  /// (CA). This is of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>
  /// </code>.
  @_s.JsonKey(name: 'CertificateAuthorityArn')
  final String certificateAuthorityArn;

  CreateCertificateAuthorityResponse({
    this.certificateAuthorityArn,
  });
  factory CreateCertificateAuthorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCertificateAuthorityResponseFromJson(json);
}

/// Contains configuration information for a certificate revocation list (CRL).
/// Your private certificate authority (CA) creates base CRLs. Delta CRLs are
/// not supported. You can enable CRLs for your new or an existing private CA by
/// setting the <b>Enabled</b> parameter to <code>true</code>. Your private CA
/// writes CRLs to an S3 bucket that you specify in the <b>S3BucketName</b>
/// parameter. You can hide the name of your bucket by specifying a value for
/// the <b>CustomCname</b> parameter. Your private CA copies the CNAME or the S3
/// bucket name to the <b>CRL Distribution Points</b> extension of each
/// certificate it issues. Your S3 bucket policy must give write permission to
/// ACM Private CA.
///
/// ACM Private CAA assets that are stored in Amazon S3 can be protected with
/// encryption. For more information, see <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaCreateCa.html#crl-encryption">Encrypting
/// Your CRLs</a>.
///
/// Your private CA uses the value in the <b>ExpirationInDays</b> parameter to
/// calculate the <b>nextUpdate</b> field in the CRL. The CRL is refreshed at
/// 1/2 the age of next update or when a certificate is revoked. When a
/// certificate is revoked, it is recorded in the next CRL that is generated and
/// in the next audit report. Only time valid certificates are listed in the
/// CRL. Expired certificates are not included.
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
/// Certificate revocation lists created by ACM Private CA are DER-encoded. You
/// can use the following OpenSSL command to list a CRL.
///
/// <code>openssl crl -inform DER -text -in <i>crl_path</i> -noout</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CrlConfiguration {
  /// Boolean value that specifies whether certificate revocation lists (CRLs) are
  /// enabled. You can use this value to enable certificate revocation for a new
  /// CA when you call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
  /// action or for an existing CA when you call the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// action.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Name inserted into the certificate <b>CRL Distribution Points</b> extension
  /// that enables the use of an alias for the CRL distribution point. Use this
  /// value if you don't want the name of your S3 bucket to be public.
  @_s.JsonKey(name: 'CustomCname')
  final String customCname;

  /// Validity period of the CRL in days.
  @_s.JsonKey(name: 'ExpirationInDays')
  final int expirationInDays;

  /// Name of the S3 bucket that contains the CRL. If you do not provide a value
  /// for the <b>CustomCname</b> argument, the name of your S3 bucket is placed
  /// into the <b>CRL Distribution Points</b> extension of the issued certificate.
  /// You can change the name of your bucket by calling the <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
  /// action. You must specify a bucket policy that allows ACM Private CA to write
  /// the CRL to your bucket.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  CrlConfiguration({
    @_s.required this.enabled,
    this.customCname,
    this.expirationInDays,
    this.s3BucketName,
  });
  factory CrlConfiguration.fromJson(Map<String, dynamic> json) =>
      _$CrlConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$CrlConfigurationToJson(this);
}

/// Describes the certificate extensions to be added to the certificate signing
/// request (CSR).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CsrExtensions {
  /// Indicates the purpose of the certificate and of the key contained in the
  /// certificate.
  @_s.JsonKey(name: 'KeyUsage')
  final KeyUsage keyUsage;

  /// For CA certificates, provides a path to additional information pertaining to
  /// the CA, such as revocation and policy. For more information, see <a
  /// href="https://tools.ietf.org/html/rfc5280#section-4.2.2.2">Subject
  /// Information Access</a> in RFC 5280.
  @_s.JsonKey(name: 'SubjectInformationAccess')
  final List<AccessDescription> subjectInformationAccess;

  CsrExtensions({
    this.keyUsage,
    this.subjectInformationAccess,
  });
  factory CsrExtensions.fromJson(Map<String, dynamic> json) =>
      _$CsrExtensionsFromJson(json);

  Map<String, dynamic> toJson() => _$CsrExtensionsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCertificateAuthorityAuditReportResponse {
  /// Specifies whether report creation is in progress, has succeeded, or has
  /// failed.
  @_s.JsonKey(name: 'AuditReportStatus')
  final AuditReportStatus auditReportStatus;

  /// The date and time at which the report was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// Name of the S3 bucket that contains the report.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// S3 <b>key</b> that uniquely identifies the report file in your S3 bucket.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  DescribeCertificateAuthorityAuditReportResponse({
    this.auditReportStatus,
    this.createdAt,
    this.s3BucketName,
    this.s3Key,
  });
  factory DescribeCertificateAuthorityAuditReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCertificateAuthorityAuditReportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCertificateAuthorityResponse {
  /// A <a
  /// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CertificateAuthority.html">CertificateAuthority</a>
  /// structure that contains information about your private CA.
  @_s.JsonKey(name: 'CertificateAuthority')
  final CertificateAuthority certificateAuthority;

  DescribeCertificateAuthorityResponse({
    this.certificateAuthority,
  });
  factory DescribeCertificateAuthorityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeCertificateAuthorityResponseFromJson(json);
}

/// Describes an Electronic Data Interchange (EDI) entity as described in as
/// defined in <a href="https://tools.ietf.org/html/rfc5280">Subject Alternative
/// Name</a> in RFC 5280.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EdiPartyName {
  /// Specifies the party name.
  @_s.JsonKey(name: 'PartyName')
  final String partyName;

  /// Specifies the name assigner.
  @_s.JsonKey(name: 'NameAssigner')
  final String nameAssigner;

  EdiPartyName({
    @_s.required this.partyName,
    this.nameAssigner,
  });
  factory EdiPartyName.fromJson(Map<String, dynamic> json) =>
      _$EdiPartyNameFromJson(json);

  Map<String, dynamic> toJson() => _$EdiPartyNameToJson(this);
}

enum FailureReason {
  @_s.JsonValue('REQUEST_TIMED_OUT')
  requestTimedOut,
  @_s.JsonValue('UNSUPPORTED_ALGORITHM')
  unsupportedAlgorithm,
  @_s.JsonValue('OTHER')
  other,
}

/// Describes an ASN.1 X.400 <code>GeneralName</code> as defined in <a
/// href="https://tools.ietf.org/html/rfc5280">RFC 5280</a>. Only one of the
/// following naming options should be providied. Providing more than one option
/// results in an <code>InvalidArgsException</code> error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GeneralName {
  @_s.JsonKey(name: 'DirectoryName')
  final ASN1Subject directoryName;

  /// Represents <code>GeneralName</code> as a DNS name.
  @_s.JsonKey(name: 'DnsName')
  final String dnsName;

  /// Represents <code>GeneralName</code> as an <code>EdiPartyName</code> object.
  @_s.JsonKey(name: 'EdiPartyName')
  final EdiPartyName ediPartyName;

  /// Represents <code>GeneralName</code> as an IPv4 or IPv6 address.
  @_s.JsonKey(name: 'IpAddress')
  final String ipAddress;

  /// Represents <code>GeneralName</code> using an <code>OtherName</code> object.
  @_s.JsonKey(name: 'OtherName')
  final OtherName otherName;

  /// Represents <code>GeneralName</code> as an object identifier (OID).
  @_s.JsonKey(name: 'RegisteredId')
  final String registeredId;

  /// Represents <code>GeneralName</code> as an <a
  /// href="https://tools.ietf.org/html/rfc822">RFC 822</a> email address.
  @_s.JsonKey(name: 'Rfc822Name')
  final String rfc822Name;

  /// Represents <code>GeneralName</code> as a URI.
  @_s.JsonKey(name: 'UniformResourceIdentifier')
  final String uniformResourceIdentifier;

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
  factory GeneralName.fromJson(Map<String, dynamic> json) =>
      _$GeneralNameFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralNameToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCertificateAuthorityCertificateResponse {
  /// Base64-encoded certificate authority (CA) certificate.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// Base64-encoded certificate chain that includes any intermediate certificates
  /// and chains up to root certificate that you used to sign your private CA
  /// certificate. The chain does not include your private CA certificate. If this
  /// is a root CA, the value will be null.
  @_s.JsonKey(name: 'CertificateChain')
  final String certificateChain;

  GetCertificateAuthorityCertificateResponse({
    this.certificate,
    this.certificateChain,
  });
  factory GetCertificateAuthorityCertificateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCertificateAuthorityCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCertificateAuthorityCsrResponse {
  /// The base64 PEM-encoded certificate signing request (CSR) for your private CA
  /// certificate.
  @_s.JsonKey(name: 'Csr')
  final String csr;

  GetCertificateAuthorityCsrResponse({
    this.csr,
  });
  factory GetCertificateAuthorityCsrResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCertificateAuthorityCsrResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCertificateResponse {
  /// The base64 PEM-encoded certificate specified by the
  /// <code>CertificateArn</code> parameter.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The base64 PEM-encoded certificate chain that chains up to the root CA
  /// certificate that you used to sign your private CA certificate.
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
class GetPolicyResponse {
  /// The policy attached to the private CA as a JSON document.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  GetPolicyResponse({
    this.policy,
  });
  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IssueCertificateResponse {
  /// The Amazon Resource Name (ARN) of the issued certificate and the certificate
  /// serial number. This is of the form:
  ///
  /// <code>arn:aws:acm-pca:<i>region</i>:<i>account</i>:certificate-authority/<i>12345678-1234-1234-1234-123456789012</i>/certificate/<i>286535153982981100925020015808220737245</i>
  /// </code>
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  IssueCertificateResponse({
    this.certificateArn,
  });
  factory IssueCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$IssueCertificateResponseFromJson(json);
}

enum KeyAlgorithm {
  @_s.JsonValue('RSA_2048')
  rsa_2048,
  @_s.JsonValue('RSA_4096')
  rsa_4096,
  @_s.JsonValue('EC_prime256v1')
  ecPrime256v1,
  @_s.JsonValue('EC_secp384r1')
  ecSecp384r1,
}

/// Defines one or more purposes for which the key contained in the certificate
/// can be used. Default value for each option is false.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeyUsage {
  /// Key can be used to sign CRLs.
  @_s.JsonKey(name: 'CRLSign')
  final bool cRLSign;

  /// Key can be used to decipher data.
  @_s.JsonKey(name: 'DataEncipherment')
  final bool dataEncipherment;

  /// Key can be used only to decipher data.
  @_s.JsonKey(name: 'DecipherOnly')
  final bool decipherOnly;

  /// Key can be used for digital signing.
  @_s.JsonKey(name: 'DigitalSignature')
  final bool digitalSignature;

  /// Key can be used only to encipher data.
  @_s.JsonKey(name: 'EncipherOnly')
  final bool encipherOnly;

  /// Key can be used in a key-agreement protocol.
  @_s.JsonKey(name: 'KeyAgreement')
  final bool keyAgreement;

  /// Key can be used to sign certificates.
  @_s.JsonKey(name: 'KeyCertSign')
  final bool keyCertSign;

  /// Key can be used to encipher data.
  @_s.JsonKey(name: 'KeyEncipherment')
  final bool keyEncipherment;

  /// Key can be used for non-repudiation.
  @_s.JsonKey(name: 'NonRepudiation')
  final bool nonRepudiation;

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
  factory KeyUsage.fromJson(Map<String, dynamic> json) =>
      _$KeyUsageFromJson(json);

  Map<String, dynamic> toJson() => _$KeyUsageToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCertificateAuthoritiesResponse {
  /// Summary information about each certificate authority you have created.
  @_s.JsonKey(name: 'CertificateAuthorities')
  final List<CertificateAuthority> certificateAuthorities;

  /// When the list is truncated, this value is present and should be used for the
  /// <code>NextToken</code> parameter in a subsequent pagination request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCertificateAuthoritiesResponse({
    this.certificateAuthorities,
    this.nextToken,
  });
  factory ListCertificateAuthoritiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCertificateAuthoritiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPermissionsResponse {
  /// When the list is truncated, this value is present and should be used for the
  /// <b>NextToken</b> parameter in a subsequent pagination request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Summary information about each permission assigned by the specified private
  /// CA, including the action enabled, the policy provided, and the time of
  /// creation.
  @_s.JsonKey(name: 'Permissions')
  final List<Permission> permissions;

  ListPermissionsResponse({
    this.nextToken,
    this.permissions,
  });
  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResponse {
  /// When the list is truncated, this value is present and should be used for the
  /// <b>NextToken</b> parameter in a subsequent pagination request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The tags associated with your private CA.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);
}

/// Defines a custom ASN.1 X.400 <code>GeneralName</code> using an object
/// identifier (OID) and value. The OID must satisfy the regular expression
/// shown below. For more information, see NIST's definition of <a
/// href="https://csrc.nist.gov/glossary/term/Object_Identifier">Object
/// Identifier (OID)</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OtherName {
  /// Specifies an OID.
  @_s.JsonKey(name: 'TypeId')
  final String typeId;

  /// Specifies an OID value.
  @_s.JsonKey(name: 'Value')
  final String value;

  OtherName({
    @_s.required this.typeId,
    @_s.required this.value,
  });
  factory OtherName.fromJson(Map<String, dynamic> json) =>
      _$OtherNameFromJson(json);

  Map<String, dynamic> toJson() => _$OtherNameToJson(this);
}

/// Permissions designate which private CA actions can be performed by an AWS
/// service or entity. In order for ACM to automatically renew private
/// certificates, you must give the ACM service principal all available
/// permissions (<code>IssueCertificate</code>, <code>GetCertificate</code>, and
/// <code>ListPermissions</code>). Permissions can be assigned with the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreatePermission.html">CreatePermission</a>
/// action, removed with the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_DeletePermission.html">DeletePermission</a>
/// action, and listed with the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_ListPermissions.html">ListPermissions</a>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Permission {
  /// The private CA actions that can be performed by the designated AWS service.
  @_s.JsonKey(name: 'Actions')
  final List<ActionType> actions;

  /// The Amazon Resource Number (ARN) of the private CA from which the permission
  /// was issued.
  @_s.JsonKey(name: 'CertificateAuthorityArn')
  final String certificateAuthorityArn;

  /// The time at which the permission was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The name of the policy that is associated with the permission.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  /// The AWS service or entity that holds the permission. At this time, the only
  /// valid principal is <code>acm.amazonaws.com</code>.
  @_s.JsonKey(name: 'Principal')
  final String principal;

  /// The ID of the account that assigned the permission.
  @_s.JsonKey(name: 'SourceAccount')
  final String sourceAccount;

  Permission({
    this.actions,
    this.certificateAuthorityArn,
    this.createdAt,
    this.policy,
    this.principal,
    this.sourceAccount,
  });
  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}

enum ResourceOwner {
  @_s.JsonValue('SELF')
  self,
  @_s.JsonValue('OTHER_ACCOUNTS')
  otherAccounts,
}

extension on ResourceOwner {
  String toValue() {
    switch (this) {
      case ResourceOwner.self:
        return 'SELF';
      case ResourceOwner.otherAccounts:
        return 'OTHER_ACCOUNTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Certificate revocation information used by the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CreateCertificateAuthority.html">CreateCertificateAuthority</a>
/// and <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UpdateCertificateAuthority.html">UpdateCertificateAuthority</a>
/// actions. Your private certificate authority (CA) can create and maintain a
/// certificate revocation list (CRL). A CRL contains information about
/// certificates revoked by your CA. For more information, see <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_RevokeCertificate.html">RevokeCertificate</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RevocationConfiguration {
  /// Configuration of the certificate revocation list (CRL), if any, maintained
  /// by your private CA.
  @_s.JsonKey(name: 'CrlConfiguration')
  final CrlConfiguration crlConfiguration;

  RevocationConfiguration({
    this.crlConfiguration,
  });
  factory RevocationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RevocationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$RevocationConfigurationToJson(this);
}

enum RevocationReason {
  @_s.JsonValue('UNSPECIFIED')
  unspecified,
  @_s.JsonValue('KEY_COMPROMISE')
  keyCompromise,
  @_s.JsonValue('CERTIFICATE_AUTHORITY_COMPROMISE')
  certificateAuthorityCompromise,
  @_s.JsonValue('AFFILIATION_CHANGED')
  affiliationChanged,
  @_s.JsonValue('SUPERSEDED')
  superseded,
  @_s.JsonValue('CESSATION_OF_OPERATION')
  cessationOfOperation,
  @_s.JsonValue('PRIVILEGE_WITHDRAWN')
  privilegeWithdrawn,
  @_s.JsonValue('A_A_COMPROMISE')
  aACompromise,
}

extension on RevocationReason {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum SigningAlgorithm {
  @_s.JsonValue('SHA256WITHECDSA')
  sha256withecdsa,
  @_s.JsonValue('SHA384WITHECDSA')
  sha384withecdsa,
  @_s.JsonValue('SHA512WITHECDSA')
  sha512withecdsa,
  @_s.JsonValue('SHA256WITHRSA')
  sha256withrsa,
  @_s.JsonValue('SHA384WITHRSA')
  sha384withrsa,
  @_s.JsonValue('SHA512WITHRSA')
  sha512withrsa,
}

extension on SigningAlgorithm {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Tags are labels that you can use to identify and organize your private CAs.
/// Each tag consists of a key and an optional value. You can associate up to 50
/// tags with a private CA. To add one or more tags to a private CA, call the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_TagCertificateAuthority.html">TagCertificateAuthority</a>
/// action. To remove a tag, call the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_UntagCertificateAuthority.html">UntagCertificateAuthority</a>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// Key (name) of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// Value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Validity specifies the period of time during which a certificate is valid.
/// Validity can be expressed as an explicit date and time when the certificate
/// expires, or as a span of time after issuance, stated in days, months, or
/// years. For more information, see <a
/// href="https://tools.ietf.org/html/rfc5280#section-4.1.2.5">Validity</a> in
/// RFC 5280.
///
/// You can issue a certificate by calling the <a
/// href="https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_IssueCertificate.html">IssueCertificate</a>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Validity {
  /// Determines how <i>ACM Private CA</i> interprets the <code>Value</code>
  /// parameter, an integer. Supported validity types include those listed below.
  /// Type definitions with values include a sample input value and the resulting
  /// output.
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
  /// <code>ABSOLUTE</code>: The specific date and time when the certificate will
  /// expire, expressed in seconds since the Unix Epoch.
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
  @_s.JsonKey(name: 'Type')
  final ValidityPeriodType type;

  /// A long integer interpreted according to the value of <code>Type</code>,
  /// below.
  @_s.JsonKey(name: 'Value')
  final int value;

  Validity({
    @_s.required this.type,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$ValidityToJson(this);
}

enum ValidityPeriodType {
  @_s.JsonValue('END_DATE')
  endDate,
  @_s.JsonValue('ABSOLUTE')
  absolute,
  @_s.JsonValue('DAYS')
  days,
  @_s.JsonValue('MONTHS')
  months,
  @_s.JsonValue('YEARS')
  years,
}

class CertificateMismatchException extends _s.GenericAwsException {
  CertificateMismatchException({String type, String message})
      : super(
            type: type, code: 'CertificateMismatchException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidArgsException extends _s.GenericAwsException {
  InvalidArgsException({String type, String message})
      : super(type: type, code: 'InvalidArgsException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String type, String message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidPolicyException extends _s.GenericAwsException {
  InvalidPolicyException({String type, String message})
      : super(type: type, code: 'InvalidPolicyException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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

class LockoutPreventedException extends _s.GenericAwsException {
  LockoutPreventedException({String type, String message})
      : super(type: type, code: 'LockoutPreventedException', message: message);
}

class MalformedCSRException extends _s.GenericAwsException {
  MalformedCSRException({String type, String message})
      : super(type: type, code: 'MalformedCSRException', message: message);
}

class MalformedCertificateException extends _s.GenericAwsException {
  MalformedCertificateException({String type, String message})
      : super(
            type: type,
            code: 'MalformedCertificateException',
            message: message);
}

class PermissionAlreadyExistsException extends _s.GenericAwsException {
  PermissionAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'PermissionAlreadyExistsException',
            message: message);
}

class RequestAlreadyProcessedException extends _s.GenericAwsException {
  RequestAlreadyProcessedException({String type, String message})
      : super(
            type: type,
            code: 'RequestAlreadyProcessedException',
            message: message);
}

class RequestFailedException extends _s.GenericAwsException {
  RequestFailedException({String type, String message})
      : super(type: type, code: 'RequestFailedException', message: message);
}

class RequestInProgressException extends _s.GenericAwsException {
  RequestInProgressException({String type, String message})
      : super(type: type, code: 'RequestInProgressException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
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
