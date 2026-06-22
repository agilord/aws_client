// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2021_09_14.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Web Services Payment Cryptography Control Plane APIs manage
/// encryption keys for use during payment-related cryptographic operations. You
/// can create, import, export, share, manage, and delete keys. You can also
/// manage Identity and Access Management (IAM) policies for keys. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security-iam.html">Identity
/// and access management</a> in the <i>Amazon Web Services Payment Cryptography
/// User Guide.</i>
///
/// To use encryption keys for payment-related transaction processing and
/// associated cryptographic operations, you use the <a
/// href="https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/Welcome.html">Amazon
/// Web Services Payment Cryptography Data Plane</a>. You can perform actions
/// like encrypt, decrypt, generate, and verify payment-related data.
///
/// All Amazon Web Services Payment Cryptography API calls must be signed and
/// transmitted using Transport Layer Security (TLS). We recommend you always
/// use the latest supported TLS version for logging API requests.
///
/// Amazon Web Services Payment Cryptography supports CloudTrail for control
/// plane operations, a service that logs Amazon Web Services API calls and
/// related events for your Amazon Web Services account and delivers them to an
/// Amazon S3 bucket you specify. By using the information collected by
/// CloudTrail, you can determine what requests were made to Amazon Web Services
/// Payment Cryptography, who made the request, when it was made, and so on. If
/// you don't conﬁgure a trail, you can still view the most recent events in the
/// CloudTrail console. For more information, see the <a
/// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/">CloudTrail
/// User Guide</a>.
class PaymentCryptography {
  final _s.JsonProtocol _protocol;
  factory PaymentCryptography({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'controlplane.payment-cryptography',
      signingName: 'payment-cryptography',
    );
    return PaymentCryptography._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  PaymentCryptography._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Associates a Multi-Party Approval (MPA) team with a protected operation.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/mpa.html">Multi-Party
  /// Approval</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide.</i>
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisassociateMpaTeam.html">DisassociateMpaTeam</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetMpaTeamAssociation.html">GetMpaTeamAssociation</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The protected operation to associate with the MPA team. Currently, the
  /// only supported value is <code>IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE</code>.
  ///
  /// Parameter [mpaTeamArn] :
  /// The ARN of the MPA team to associate with the protected operation.
  ///
  /// Parameter [requesterComment] :
  /// The comment from the requester explaining the reason for the association.
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important>
  Future<AssociateMpaTeamOutput> associateMpaTeam({
    required MpaOperation action,
    required String mpaTeamArn,
    String? requesterComment,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.AssociateMpaTeam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action.value,
        'MpaTeamArn': mpaTeamArn,
        if (requesterComment != null) 'RequesterComment': requesterComment,
      },
    );

    return AssociateMpaTeamOutput.fromJson(jsonResponse.body);
  }

  /// Removes the resource-based policy attached to an Amazon Web Services
  /// Payment Cryptography key.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_PutResourcePolicy.html">PutResourcePolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetResourcePolicy.html">GetResourcePolicy</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>KeyARN</code> of the key whose resource-based policy you want to
  /// delete.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.DeleteResourcePolicy'
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

  /// Disables <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a> settings for the specified Amazon Web Services Regions
  /// in your Amazon Web Services account, preventing new keys from being
  /// automatically replicated to those regions.
  ///
  /// After disabling Multi-Region key replication for specific regions, new
  /// keys created in your account will not be automatically replicated to those
  /// regions. You can still manually add replication to those regions for
  /// individual keys using the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AddKeyReplicationRegions.html">AddKeyReplicationRegions</a>
  /// operation.
  ///
  /// This operation does not affect existing keys or their current replication
  /// configuration.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_EnableDefaultKeyReplicationRegions.html">EnableDefaultKeyReplicationRegions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetDefaultKeyReplicationRegions.html">GetDefaultKeyReplicationRegions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [replicationRegions] :
  /// The list of Amazon Web Services Regions to remove from the account's
  /// default replication regions.
  ///
  /// New keys created after this operation will not automatically be replicated
  /// to these regions, though existing keys with replication to these regions
  /// will be unaffected.
  Future<DisableDefaultKeyReplicationRegionsOutput>
      disableDefaultKeyReplicationRegions({
    required List<String> replicationRegions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PaymentCryptographyControlPlane.DisableDefaultKeyReplicationRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationRegions': replicationRegions,
      },
    );

    return DisableDefaultKeyReplicationRegionsOutput.fromJson(
        jsonResponse.body);
  }

  /// Removes the association between a Multi-Party Approval (MPA) team and a
  /// protected operation.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AssociateMpaTeam.html">AssociateMpaTeam</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetMpaTeamAssociation.html">GetMpaTeamAssociation</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The protected operation to disassociate from the MPA team. Currently, the
  /// only supported value is <code>IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE</code>.
  ///
  /// Parameter [requesterComment] :
  /// The comment from the requester explaining the reason for the
  /// disassociation.
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important>
  Future<DisassociateMpaTeamOutput> disassociateMpaTeam({
    required MpaOperation action,
    String? requesterComment,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.DisassociateMpaTeam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action.value,
        if (requesterComment != null) 'RequesterComment': requesterComment,
      },
    );

    return DisassociateMpaTeamOutput.fromJson(jsonResponse.body);
  }

  /// Enables <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a> settings for your Amazon Web Services account, causing
  /// new keys to be automatically replicated to the specified Amazon Web
  /// Services Regions when created.
  ///
  /// When Multi-Region key replication are enabled, any new keys created in
  /// your account will automatically be replicated to these regions unless you
  /// explicitly override this behavior during key creation. This simplifies key
  /// management for applications that operate across multiple regions.
  ///
  /// Existing keys are not affected by this operation - only keys created after
  /// enabling default replication will be automatically replicated.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisableDefaultKeyReplicationRegions.html">DisableDefaultKeyReplicationRegions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetDefaultKeyReplicationRegions.html">GetDefaultKeyReplicationRegions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [replicationRegions] :
  /// The list of Amazon Web Services Regions to enable as default replication
  /// regions for the Amazon Web Services account for <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a>.
  ///
  /// New keys created in this account will automatically be replicated to these
  /// regions unless explicitly overridden during key creation.
  Future<EnableDefaultKeyReplicationRegionsOutput>
      enableDefaultKeyReplicationRegions({
    required List<String> replicationRegions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PaymentCryptographyControlPlane.EnableDefaultKeyReplicationRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReplicationRegions': replicationRegions,
      },
    );

    return EnableDefaultKeyReplicationRegionsOutput.fromJson(jsonResponse.body);
  }

  /// Exports a key from Amazon Web Services Payment Cryptography.
  ///
  /// Amazon Web Services Payment Cryptography simplifies key exchange by
  /// replacing the existing paper-based approach with a modern electronic
  /// approach. With <code>ExportKey</code> you can export symmetric keys using
  /// either symmetric and asymmetric key exchange mechanisms. Using this
  /// operation, you can share your Amazon Web Services Payment Cryptography
  /// generated keys with other service partners to perform cryptographic
  /// operations outside of Amazon Web Services Payment Cryptography
  ///
  /// For symmetric key exchange, Amazon Web Services Payment Cryptography uses
  /// the ANSI X9 TR-31 norm in accordance with PCI PIN guidelines. And for
  /// asymmetric key exchange, Amazon Web Services Payment Cryptography supports
  /// ANSI X9 TR-34 norm, RSA unwrap, and ECDH (Elliptic Curve Diffie-Hellman)
  /// key exchange mechanisms. Asymmetric key exchange methods are typically
  /// used to establish bi-directional trust between the two parties exhanging
  /// keys and are used for initial key exchange such as Key Encryption Key
  /// (KEK). After which you can export working keys using symmetric method to
  /// perform various cryptographic operations within Amazon Web Services
  /// Payment Cryptography.
  ///
  /// PCI requires specific minimum key strength of wrapping keys used to
  /// protect the keys being exchanged electronically. These requirements can
  /// change when PCI standards are revised. The rules specify that wrapping
  /// keys used for transport must be at least as strong as the key being
  /// protected. For more information on recommended key strength of wrapping
  /// keys and key exchange mechanism, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-importexport.html">Importing
  /// and exporting keys</a> in the <i>Amazon Web Services Payment Cryptography
  /// User Guide</i>.
  ///
  /// You can also use <code>ExportKey</code> functionality to generate and
  /// export an IPEK (Initial Pin Encryption Key) from Amazon Web Services
  /// Payment Cryptography using either TR-31 or TR-34 export key exchange. IPEK
  /// is generated from BDK (Base Derivation Key) and
  /// <code>ExportDukptInitialKey</code> attribute KSN
  /// (<code>KeySerialNumber</code>). The generated IPEK does not persist within
  /// Amazon Web Services Payment Cryptography and has to be re-generated each
  /// time during export.
  ///
  /// For key exchange using TR-31 or TR-34 key blocks, you can also export
  /// optional blocks within the key block header which contain additional
  /// attribute information about the key. The <code>KeyVersion</code> within
  /// <code>KeyBlockHeaders</code> indicates the version of the key within the
  /// key block. Furthermore, <code>KeyExportability</code> within
  /// <code>KeyBlockHeaders</code> can be used to further restrict exportability
  /// of the key after export from Amazon Web Services Payment Cryptography.
  ///
  /// The <code>OptionalBlocks</code> contain the additional data related to the
  /// key. For information on data type that can be included within optional
  /// blocks, refer to <a
  /// href="https://webstore.ansi.org/standards/ascx9/ansix91432022">ASC
  /// X9.143-2022</a>.
  /// <note>
  /// Data included in key block headers is signed but transmitted in clear
  /// text. Sensitive or confidential information should not be included in
  /// optional blocks. Refer to ASC X9.143-2022 standard for information on
  /// allowed data type.
  /// </note>
  /// <b>To export initial keys (KEK) or IPEK using TR-34</b>
  ///
  /// Using this operation, you can export initial key using TR-34 asymmetric
  /// key exchange. You can only export KEK generated within Amazon Web Services
  /// Payment Cryptography. In TR-34 terminology, the sending party of the key
  /// is called Key Distribution Host (KDH) and the receiving party of the key
  /// is called Key Receiving Device (KRD). During key export process, KDH is
  /// Amazon Web Services Payment Cryptography which initiates key export and
  /// KRD is the user receiving the key.
  ///
  /// To initiate TR-34 key export, the KRD must obtain an export token by
  /// calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html">GetParametersForExport</a>.
  /// This operation also generates a key pair for the purpose of key export,
  /// signs the key and returns back the signing public key certificate (also
  /// known as KDH signing certificate) and root certificate chain. The KDH uses
  /// the private key to sign the the export payload and the signing public key
  /// certificate is provided to KRD to verify the signature. The KRD can import
  /// the root certificate into its Hardware Security Module (HSM), as required.
  /// The export token and the associated KDH signing certificate expires after
  /// 30 days.
  ///
  /// Next the KRD generates a key pair for the the purpose of encrypting the
  /// KDH key and provides the public key cerificate (also known as KRD wrapping
  /// certificate) back to KDH. The KRD will also import the root cerificate
  /// chain into Amazon Web Services Payment Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// for <code>RootCertificatePublicKey</code>. The KDH, Amazon Web Services
  /// Payment Cryptography, will use the KRD wrapping cerificate to encrypt
  /// (wrap) the key under export and signs it with signing private key to
  /// generate a TR-34 WrappedKeyBlock. For more information on TR-34 key
  /// export, see section <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-export.html">Exporting
  /// symmetric keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// Set the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>ExportAttributes</code>: Specify export attributes in case of IPEK
  /// export. This parameter is optional for KEK export.
  /// </li>
  /// <li>
  /// <code>ExportKeyIdentifier</code>: The <code>KeyARN</code> of the KEK or
  /// BDK (in case of IPEK) under export.
  /// </li>
  /// <li>
  /// <code>KeyMaterial</code>: Use <code>Tr34KeyBlock</code> parameters.
  /// </li>
  /// <li>
  /// <code>CertificateAuthorityPublicKeyIdentifier</code>: The
  /// <code>KeyARN</code> of the certificate chain that signed the KRD wrapping
  /// key certificate.
  /// </li>
  /// <li>
  /// <code>ExportToken</code>: Obtained from KDH by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html">GetParametersForImport</a>.
  /// </li>
  /// <li>
  /// <code>WrappingKeyCertificate</code>: The public key certificate in PEM
  /// format (base64 encoded) of the KRD wrapping key Amazon Web Services
  /// Payment Cryptography uses for encryption of the TR-34 export payload. This
  /// certificate must be signed by the root certificate
  /// (CertificateAuthorityPublicKeyIdentifier) imported into Amazon Web
  /// Services Payment Cryptography.
  /// </li>
  /// </ul>
  /// When this operation is successful, Amazon Web Services Payment
  /// Cryptography returns the KEK or IPEK as a TR-34 WrappedKeyBlock.
  ///
  /// <b>To export initial keys (KEK) or IPEK using RSA Wrap and Unwrap</b>
  ///
  /// Using this operation, you can export initial key using asymmetric RSA wrap
  /// and unwrap key exchange method. To initiate export, generate an asymmetric
  /// key pair on the receiving HSM and obtain the public key certificate in PEM
  /// format (base64 encoded) for the purpose of wrapping and the root
  /// certifiate chain. Import the root certificate into Amazon Web Services
  /// Payment Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// for <code>RootCertificatePublicKey</code>.
  ///
  /// Next call <code>ExportKey</code> and set the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>CertificateAuthorityPublicKeyIdentifier</code>: The
  /// <code>KeyARN</code> of the certificate chain that signed wrapping key
  /// certificate.
  /// </li>
  /// <li>
  /// <code>KeyMaterial</code>: Set to <code>KeyCryptogram</code>.
  /// </li>
  /// <li>
  /// <code>WrappingKeyCertificate</code>: The public key certificate in PEM
  /// format (base64 encoded) obtained by the receiving HSM and signed by the
  /// root certificate (CertificateAuthorityPublicKeyIdentifier) imported into
  /// Amazon Web Services Payment Cryptography. The receiving HSM uses its
  /// private key component to unwrap the WrappedKeyCryptogram.
  /// </li>
  /// </ul>
  /// When this operation is successful, Amazon Web Services Payment
  /// Cryptography returns the WrappedKeyCryptogram.
  ///
  /// <b>To export working keys or IPEK using TR-31</b>
  ///
  /// Using this operation, you can export working keys or IPEK using TR-31
  /// symmetric key exchange. In TR-31, you must use an initial key such as KEK
  /// to encrypt or wrap the key under export. To establish a KEK, you can use
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  ///
  /// Set the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>ExportAttributes</code>: Specify export attributes in case of IPEK
  /// export. This parameter is optional for KEK export.
  /// </li>
  /// <li>
  /// <code>ExportKeyIdentifier</code>: The <code>KeyARN</code> of the KEK or
  /// BDK (in case of IPEK) under export.
  /// </li>
  /// <li>
  /// <code>KeyMaterial</code>: Use <code>Tr31KeyBlock</code> parameters.
  /// </li>
  /// </ul>
  /// <b>To export working keys using ECDH</b>
  ///
  /// You can also use ECDH key agreement to export working keys in a TR-31
  /// keyblock, where the wrapping key is an ECDH derived key.
  ///
  /// To initiate a TR-31 key export using ECDH, both sides must create an ECC
  /// key pair with key usage K3 and exchange public key certificates. In Amazon
  /// Web Services Payment Cryptography, you can do this by calling
  /// <code>CreateKey</code>. If you have not already done so, you must import
  /// the CA chain that issued the receiving public key certificate by calling
  /// <code>ImportKey</code> with input <code>RootCertificatePublicKey</code>
  /// for root CA or <code>TrustedPublicKey</code> for intermediate CA. You can
  /// then complete a TR-31 key export by deriving a shared wrapping key using
  /// the service ECC key pair, public certificate of your ECC key pair outside
  /// of Amazon Web Services Payment Cryptography, and the key derivation
  /// parameters including key derivation function, hash algorithm, derivation
  /// data, key algorithm.
  ///
  /// <ul>
  /// <li>
  /// <code>KeyMaterial</code>: Use <code>DiffieHellmanTr31KeyBlock</code>
  /// parameters.
  /// </li>
  /// <li>
  /// <code>PrivateKeyIdentifier</code>: The <code>KeyArn</code> of the ECC key
  /// pair created within Amazon Web Services Payment Cryptography to derive a
  /// shared KEK.
  /// </li>
  /// <li>
  /// <code>PublicKeyCertificate</code>: The public key certificate of the
  /// receiving ECC key pair in PEM format (base64 encoded) to derive a shared
  /// KEK.
  /// </li>
  /// <li>
  /// <code>CertificateAuthorityPublicKeyIdentifier</code>: The
  /// <code>keyARN</code> of the CA that signed the public key certificate of
  /// the receiving ECC key pair.
  /// </li>
  /// </ul>
  /// When this operation is successful, Amazon Web Services Payment
  /// Cryptography returns the working key as a TR-31 WrappedKeyBlock, where the
  /// wrapping key is the ECDH derived key.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html">GetParametersForExport</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportKeyIdentifier] :
  /// The <code>KeyARN</code> of the key under export from Amazon Web Services
  /// Payment Cryptography.
  ///
  /// Parameter [keyMaterial] :
  /// The key block format type, for example, TR-34 or TR-31, to use during key
  /// material export.
  ///
  /// Parameter [exportAttributes] :
  /// The attributes for IPEK generation during export.
  Future<ExportKeyOutput> exportKey({
    required String exportKeyIdentifier,
    required ExportKeyMaterial keyMaterial,
    ExportAttributes? exportAttributes,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.ExportKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportKeyIdentifier': exportKeyIdentifier,
        'KeyMaterial': keyMaterial,
        if (exportAttributes != null) 'ExportAttributes': exportAttributes,
      },
    );

    return ExportKeyOutput.fromJson(jsonResponse.body);
  }

  /// Creates a certificate signing request (CSR) from a key pair.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [certificateSubject] :
  /// The metadata used to create the CSR.
  ///
  /// Parameter [keyIdentifier] :
  /// Asymmetric key used for generating the certificate signing request
  ///
  /// Parameter [signingAlgorithm] :
  /// The cryptographic algorithm used to sign your CSR.
  Future<GetCertificateSigningRequestOutput> getCertificateSigningRequest({
    required CertificateSubjectType certificateSubject,
    required String keyIdentifier,
    required SigningAlgorithmType signingAlgorithm,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PaymentCryptographyControlPlane.GetCertificateSigningRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CertificateSubject': certificateSubject,
        'KeyIdentifier': keyIdentifier,
        'SigningAlgorithm': signingAlgorithm.value,
      },
    );

    return GetCertificateSigningRequestOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of Amazon Web Services Regions where <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a> is currently enabled for your Amazon Web Services
  /// account.
  ///
  /// This operation returns the current Multi-Region key replication
  /// configuration. New keys created in your account will be automatically
  /// replicated to these regions unless explicitly overridden during key
  /// creation.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_EnableDefaultKeyReplicationRegions.html">EnableDefaultKeyReplicationRegions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisableDefaultKeyReplicationRegions.html">DisableDefaultKeyReplicationRegions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetDefaultKeyReplicationRegionsOutput>
      getDefaultKeyReplicationRegions() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PaymentCryptographyControlPlane.GetDefaultKeyReplicationRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetDefaultKeyReplicationRegionsOutput.fromJson(jsonResponse.body);
  }

  /// Returns the Multi-Party Approval (MPA) team association for a protected
  /// operation.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AssociateMpaTeam.html">AssociateMpaTeam</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisassociateMpaTeam.html">DisassociateMpaTeam</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The protected operation whose MPA team association you want to retrieve.
  /// Currently, the only supported value is
  /// <code>IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE</code>.
  Future<GetMpaTeamAssociationOutput> getMpaTeamAssociation({
    required MpaOperation action,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.GetMpaTeamAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action.value,
      },
    );

    return GetMpaTeamAssociationOutput.fromJson(jsonResponse.body);
  }

  /// Gets the export token and the signing key certificate to initiate a TR-34
  /// key export from Amazon Web Services Payment Cryptography.
  ///
  /// The signing key certificate signs the wrapped key under export within the
  /// TR-34 key payload. The export token and signing key certificate must be in
  /// place and operational before calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ExportKey.html">ExportKey</a>.
  /// The export token expires in 30 days. You can use the same export token to
  /// export multiple keys from your service account.
  ///
  /// To return a previously generated export token and signing key certificate
  /// instead of generating new ones, set <code>ReuseLastGeneratedToken</code>
  /// to <code>true</code>.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ExportKey.html">ExportKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html">GetParametersForImport</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyMaterialType] :
  /// The key block format type (for example, TR-34 or TR-31) to use during key
  /// material export. Export token is only required for a TR-34 key export,
  /// <code>TR34_KEY_BLOCK</code>. Export token is not required for TR-31 key
  /// export.
  ///
  /// Parameter [signingKeyAlgorithm] :
  /// The signing key algorithm to generate a signing key certificate. This
  /// certificate signs the wrapped key under export within the TR-34 key block.
  /// <code>RSA_2048</code> is the only signing key algorithm allowed.
  ///
  /// Parameter [reuseLastGeneratedToken] :
  /// Specifies whether to reuse the existing export token and signing key
  /// certificate. If set to <code>true</code> and a valid export token exists
  /// for the same key material type and signing key algorithm with at least 7
  /// days of remaining validity, the existing token and signing key certificate
  /// are returned. Otherwise, a new export token and signing key certificate
  /// are generated. The default value is <code>false</code>, which generates a
  /// new export token and signing key certificate on every call.
  Future<GetParametersForExportOutput> getParametersForExport({
    required KeyMaterialType keyMaterialType,
    required KeyAlgorithm signingKeyAlgorithm,
    bool? reuseLastGeneratedToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.GetParametersForExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyMaterialType': keyMaterialType.value,
        'SigningKeyAlgorithm': signingKeyAlgorithm.value,
        if (reuseLastGeneratedToken != null)
          'ReuseLastGeneratedToken': reuseLastGeneratedToken,
      },
    );

    return GetParametersForExportOutput.fromJson(jsonResponse.body);
  }

  /// Gets the import token and the wrapping key certificate in PEM format
  /// (base64 encoded) to initiate a TR-34 WrappedKeyBlock or a RSA
  /// WrappedKeyCryptogram import into Amazon Web Services Payment Cryptography.
  ///
  /// The wrapping key certificate wraps the key under import. The import token
  /// and wrapping key certificate must be in place and operational before
  /// calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  /// The import token expires in 30 days. You can use the same import token to
  /// import multiple keys into your service account.
  ///
  /// To return a previously generated import token and wrapping key certificate
  /// instead of generating new ones, set <code>ReuseLastGeneratedToken</code>
  /// to <code>true</code>.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html">GetParametersForExport</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyMaterialType] :
  /// The method to use for key material import. Import token is only required
  /// for TR-34 WrappedKeyBlock (<code>TR34_KEY_BLOCK</code>) and RSA
  /// WrappedKeyCryptogram (<code>KEY_CRYPTOGRAM</code>).
  ///
  /// Import token is not required for TR-31, root public key cerificate or
  /// trusted public key certificate.
  ///
  /// Parameter [wrappingKeyAlgorithm] :
  /// The wrapping key algorithm to generate a wrapping key certificate. This
  /// certificate wraps the key under import.
  ///
  /// At this time, <code>RSA_2048</code> is the allowed algorithm for TR-34
  /// WrappedKeyBlock import. Additionally, <code>RSA_2048</code>,
  /// <code>RSA_3072</code>, <code>RSA_4096</code> are the allowed algorithms
  /// for RSA WrappedKeyCryptogram import.
  ///
  /// Parameter [reuseLastGeneratedToken] :
  /// Specifies whether to reuse the existing import token and wrapping key
  /// certificate. If set to <code>true</code> and a valid import token exists
  /// for the same key material type and wrapping key algorithm with at least 7
  /// days of remaining validity, the existing token and wrapping key
  /// certificate are returned. Otherwise, a new import token and wrapping key
  /// certificate are generated. The default value is <code>false</code>, which
  /// generates a new import token and wrapping key certificate on every call.
  Future<GetParametersForImportOutput> getParametersForImport({
    required KeyMaterialType keyMaterialType,
    required KeyAlgorithm wrappingKeyAlgorithm,
    bool? reuseLastGeneratedToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.GetParametersForImport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyMaterialType': keyMaterialType.value,
        'WrappingKeyAlgorithm': wrappingKeyAlgorithm.value,
        if (reuseLastGeneratedToken != null)
          'ReuseLastGeneratedToken': reuseLastGeneratedToken,
      },
    );

    return GetParametersForImportOutput.fromJson(jsonResponse.body);
  }

  /// Gets the public key certificate of the asymmetric key pair that exists
  /// within Amazon Web Services Payment Cryptography.
  ///
  /// Unlike the private key of an asymmetric key, which never leaves Amazon Web
  /// Services Payment Cryptography unencrypted, callers with
  /// <code>GetPublicKeyCertificate</code> permission can download the public
  /// key certificate of the asymmetric key. You can share the public key
  /// certificate to allow others to encrypt messages and verify signatures
  /// outside of Amazon Web Services Payment Cryptography
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>KeyARN</code> of the asymmetric key pair.
  Future<GetPublicKeyCertificateOutput> getPublicKeyCertificate({
    required String keyIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.GetPublicKeyCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
      },
    );

    return GetPublicKeyCertificateOutput.fromJson(jsonResponse.body);
  }

  /// Returns the resource-based policy attached to an Amazon Web Services
  /// Payment Cryptography key.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_PutResourcePolicy.html">PutResourcePolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteResourcePolicy.html">DeleteResourcePolicy</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>KeyARN</code> of the key whose resource-based policy you want to
  /// retrieve.
  Future<GetResourcePolicyOutput> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.GetResourcePolicy'
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

    return GetResourcePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Imports symmetric keys and public key certificates in PEM format (base64
  /// encoded) into Amazon Web Services Payment Cryptography.
  ///
  /// Amazon Web Services Payment Cryptography simplifies key exchange by
  /// replacing the existing paper-based approach with a modern electronic
  /// approach. With <code>ImportKey</code> you can import symmetric keys using
  /// either symmetric and asymmetric key exchange mechanisms.
  ///
  /// For symmetric key exchange, Amazon Web Services Payment Cryptography uses
  /// the ANSI X9 TR-31 norm in accordance with PCI PIN guidelines. And for
  /// asymmetric key exchange, Amazon Web Services Payment Cryptography supports
  /// ANSI X9 TR-34 norm, RSA unwrap, and ECDH (Elliptic Curve Diffie-Hellman)
  /// key exchange mechanisms. Asymmetric key exchange methods are typically
  /// used to establish bi-directional trust between the two parties exhanging
  /// keys and are used for initial key exchange such as Key Encryption Key
  /// (KEK) or Zone Master Key (ZMK). After which you can import working keys
  /// using symmetric method to perform various cryptographic operations within
  /// Amazon Web Services Payment Cryptography.
  ///
  /// PCI requires specific minimum key strength of wrapping keys used to
  /// protect the keys being exchanged electronically. These requirements can
  /// change when PCI standards are revised. The rules specify that wrapping
  /// keys used for transport must be at least as strong as the key being
  /// protected. For more information on recommended key strength of wrapping
  /// keys and key exchange mechanism, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-importexport.html">Importing
  /// and exporting keys</a> in the <i>Amazon Web Services Payment Cryptography
  /// User Guide</i>.
  ///
  /// You can also import a <i>root public key certificate</i>, used to sign
  /// other public key certificates, or a <i>trusted public key certificate</i>
  /// under an already established root public key certificate.
  ///
  /// <b>To import a public root key certificate</b>
  ///
  /// Using this operation, you can import the public component (in PEM
  /// cerificate format) of your private root key. You can use the imported
  /// public root key certificate for digital signatures, for example signing
  /// wrapping key or signing key in TR-34, within your Amazon Web Services
  /// Payment Cryptography account.
  ///
  /// Set the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>KeyMaterial</code>: <code>RootCertificatePublicKey</code>
  /// </li>
  /// <li>
  /// <code>KeyClass</code>: <code>PUBLIC_KEY</code>
  /// </li>
  /// <li>
  /// <code>KeyModesOfUse</code>: <code>Verify</code>
  /// </li>
  /// <li>
  /// <code>KeyUsage</code>:
  /// <code>TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE</code>
  /// </li>
  /// <li>
  /// <code>PublicKeyCertificate</code>: The public key certificate in PEM
  /// format (base64 encoded) of the private root key under import.
  /// </li>
  /// </ul>
  /// <b>To import a trusted public key certificate</b>
  ///
  /// The root public key certificate must be in place and operational before
  /// you import a trusted public key certificate. Set the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>KeyMaterial</code>: <code>TrustedCertificatePublicKey</code>
  /// </li>
  /// <li>
  /// <code>CertificateAuthorityPublicKeyIdentifier</code>: <code>KeyArn</code>
  /// of the <code>RootCertificatePublicKey</code>.
  /// </li>
  /// <li>
  /// <code>KeyModesOfUse</code> and <code>KeyUsage</code>: Corresponding to the
  /// cryptographic operations such as wrap, sign, or encrypt that you will
  /// allow the trusted public key certificate to perform.
  /// </li>
  /// <li>
  /// <code>PublicKeyCertificate</code>: The trusted public key certificate in
  /// PEM format (base64 encoded) under import.
  /// </li>
  /// </ul>
  /// <b>To import initial keys (KEK or ZMK or similar) using TR-34</b>
  ///
  /// Using this operation, you can import initial key using TR-34 asymmetric
  /// key exchange. In TR-34 terminology, the sending party of the key is called
  /// Key Distribution Host (KDH) and the receiving party of the key is called
  /// Key Receiving Device (KRD). During the key import process, KDH is the user
  /// who initiates the key import and KRD is Amazon Web Services Payment
  /// Cryptography who receives the key.
  ///
  /// To initiate TR-34 key import, the KDH must obtain an import token by
  /// calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html">GetParametersForImport</a>.
  /// This operation generates an encryption keypair for the purpose of key
  /// import, signs the key and returns back the wrapping key certificate (also
  /// known as KRD wrapping certificate) and the root certificate chain. The KDH
  /// must trust and install the KRD wrapping certificate on its HSM and use it
  /// to encrypt (wrap) the KDH key during TR-34 WrappedKeyBlock generation. The
  /// import token and associated KRD wrapping certificate expires after 30
  /// days.
  ///
  /// Next the KDH generates a key pair for the purpose of signing the encrypted
  /// KDH key and provides the public certificate of the signing key to Amazon
  /// Web Services Payment Cryptography. The KDH will also need to import the
  /// root certificate chain of the KDH signing certificate by calling
  /// <code>ImportKey</code> for <code>RootCertificatePublicKey</code>. For more
  /// information on TR-34 key import, see section <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-import.html">Importing
  /// symmetric keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// Set the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>KeyMaterial</code>: Use <code>Tr34KeyBlock</code> parameters.
  /// </li>
  /// <li>
  /// <code>CertificateAuthorityPublicKeyIdentifier</code>: The
  /// <code>KeyARN</code> of the certificate chain that signed the KDH signing
  /// key certificate.
  /// </li>
  /// <li>
  /// <code>ImportToken</code>: Obtained from KRD by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html">GetParametersForImport</a>.
  /// </li>
  /// <li>
  /// <code>WrappedKeyBlock</code>: The TR-34 wrapped key material from KDH. It
  /// contains the KDH key under import, wrapped with KRD wrapping certificate
  /// and signed by KDH signing private key. This TR-34 key block is typically
  /// generated by the KDH Hardware Security Module (HSM) outside of Amazon Web
  /// Services Payment Cryptography.
  /// </li>
  /// <li>
  /// <code>SigningKeyCertificate</code>: The public key certificate in PEM
  /// format (base64 encoded) of the KDH signing key generated under the root
  /// certificate (CertificateAuthorityPublicKeyIdentifier) imported in Amazon
  /// Web Services Payment Cryptography.
  /// </li>
  /// </ul>
  /// <b>To import initial keys (KEK or ZMK or similar) using RSA Wrap and
  /// Unwrap</b>
  ///
  /// Using this operation, you can import initial key using asymmetric RSA wrap
  /// and unwrap key exchange method. To initiate import, call <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html">GetParametersForImport</a>
  /// with <code>KeyMaterial</code> set to <code>KEY_CRYPTOGRAM</code> to
  /// generate an import token. This operation also generates an encryption
  /// keypair for the purpose of key import, signs the key and returns back the
  /// wrapping key certificate in PEM format (base64 encoded) and its root
  /// certificate chain. The import token and associated KRD wrapping
  /// certificate expires after 30 days.
  ///
  /// You must trust and install the wrapping certificate and its certificate
  /// chain on the sending HSM and use it to wrap the key under export for
  /// WrappedKeyCryptogram generation. Next call <code>ImportKey</code> with
  /// <code>KeyMaterial</code> set to <code>KEY_CRYPTOGRAM</code> and provide
  /// the <code>ImportToken</code> and <code>KeyAttributes</code> for the key
  /// under import.
  ///
  /// <b>To import working keys using TR-31</b>
  ///
  /// Amazon Web Services Payment Cryptography uses TR-31 symmetric key exchange
  /// norm to import working keys. A KEK must be established within Amazon Web
  /// Services Payment Cryptography by using TR-34 key import or by using <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>.
  /// To initiate a TR-31 key import, set the following parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>KeyMaterial</code>: Use <code>Tr31KeyBlock</code> parameters.
  /// </li>
  /// <li>
  /// <code>WrappedKeyBlock</code>: The TR-31 wrapped key material. It contains
  /// the key under import, encrypted using KEK. The TR-31 key block is
  /// typically generated by a HSM outside of Amazon Web Services Payment
  /// Cryptography.
  /// </li>
  /// <li>
  /// <code>WrappingKeyIdentifier</code>: The <code>KeyArn</code> of the KEK
  /// that Amazon Web Services Payment Cryptography uses to decrypt or unwrap
  /// the key under import.
  /// </li>
  /// </ul>
  /// <b>To import working keys using ECDH</b>
  ///
  /// You can also use ECDH key agreement to import working keys as a TR-31
  /// keyblock, where the wrapping key is an ECDH derived key.
  ///
  /// To initiate a TR-31 key import using ECDH, both sides must create an ECC
  /// key pair with key usage K3 and exchange public key certificates. In Amazon
  /// Web Services Payment Cryptography, you can do this by calling
  /// <code>CreateKey</code> and then <code>GetPublicKeyCertificate</code> to
  /// retrieve its public key certificate. Next, you can then generate a TR-31
  /// WrappedKeyBlock using your own ECC key pair, the public certificate of the
  /// service's ECC key pair, and the key derivation parameters including key
  /// derivation function, hash algorithm, derivation data, and key algorithm.
  /// If you have not already done so, you must import the CA chain that issued
  /// the receiving public key certificate by calling <code>ImportKey</code>
  /// with input <code>RootCertificatePublicKey</code> for root CA or
  /// <code>TrustedPublicKey</code> for intermediate CA. To complete the TR-31
  /// key import, you can use the following parameters. It is important that the
  /// ECDH key derivation parameters you use should match those used during
  /// import to derive the same shared wrapping key within Amazon Web Services
  /// Payment Cryptography.
  ///
  /// <ul>
  /// <li>
  /// <code>KeyMaterial</code>: Use <code>DiffieHellmanTr31KeyBlock</code>
  /// parameters.
  /// </li>
  /// <li>
  /// <code>PrivateKeyIdentifier</code>: The <code>KeyArn</code> of the ECC key
  /// pair created within Amazon Web Services Payment Cryptography to derive a
  /// shared KEK.
  /// </li>
  /// <li>
  /// <code>PublicKeyCertificate</code>: The public key certificate of the
  /// receiving ECC key pair in PEM format (base64 encoded) to derive a shared
  /// KEK.
  /// </li>
  /// <li>
  /// <code>CertificateAuthorityPublicKeyIdentifier</code>: The
  /// <code>keyARN</code> of the CA that signed the public key certificate of
  /// the receiving ECC key pair.
  /// </li>
  /// </ul>
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ExportKey.html">ExportKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForImport.html">GetParametersForImport</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyMaterial] :
  /// The key or public key certificate type to use during key material import,
  /// for example TR-34 or RootCertificatePublicKey.
  ///
  /// Parameter [enabled] :
  /// Specifies whether import key is enabled.
  ///
  /// Parameter [keyCheckValueAlgorithm] :
  /// The algorithm that Amazon Web Services Payment Cryptography uses to
  /// calculate the key check value (KCV). It is used to validate the key
  /// integrity.
  ///
  /// For TDES keys, the KCV is computed by encrypting 8 bytes, each with value
  /// of zero, with the key to be checked and retaining the 3 highest order
  /// bytes of the encrypted result. For AES keys, the KCV is computed using a
  /// CMAC algorithm where the input data is 16 bytes of zero and retaining the
  /// 3 highest order bytes of the encrypted result. For HMAC keys, the KCV is
  /// computed using the hash selected at key creation on a zero-length message,
  /// taking the leftmost 3 bytes.
  ///
  /// Parameter [requesterComment] :
  /// The comment from the requester explaining the reason for the import.
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important>
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags to the Amazon Web Services Payment Cryptography
  /// key. Use this parameter to tag a key when it is imported. To tag an
  /// existing Amazon Web Services Payment Cryptography key, use the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html">TagResource</a>
  /// operation.
  ///
  /// Each tag consists of a tag key and a tag value. Both the tag key and the
  /// tag value are required, but the tag value can be an empty (null) string.
  /// You can't have more than one tag on an Amazon Web Services Payment
  /// Cryptography key with the same tag key. If you specify an existing tag key
  /// with a different tag value, Amazon Web Services Payment Cryptography
  /// replaces the current tag value with the specified one.
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important> <note>
  /// Tagging or untagging an Amazon Web Services Payment Cryptography key can
  /// allow or deny permission to the key.
  /// </note>
  Future<ImportKeyOutput> importKey({
    required ImportKeyMaterial keyMaterial,
    bool? enabled,
    KeyCheckValueAlgorithm? keyCheckValueAlgorithm,
    List<String>? replicationRegions,
    String? requesterComment,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.ImportKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyMaterial': keyMaterial,
        if (enabled != null) 'Enabled': enabled,
        if (keyCheckValueAlgorithm != null)
          'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.value,
        if (replicationRegions != null)
          'ReplicationRegions': replicationRegions,
        if (requesterComment != null) 'RequesterComment': requesterComment,
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportKeyOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags for an Amazon Web Services resource.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the tags. When the response contains only a
  /// subset of tags, it includes a <code>NextToken</code> value. Use this value
  /// in a subsequent <code>ListTagsForResource</code> request to get more tags.
  /// When you receive a response with no NextToken (or an empty or null value),
  /// that means there are no more tags to get.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html">TagResource</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UntagResource.html">UntagResource</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>KeyARN</code> of the key whose tags you are getting.
  ///
  /// Parameter [maxResults] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, Amazon Web Services Payment Cryptography does not
  /// return more than the specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextToken</code> from
  /// the truncated response you just received.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Attaches or replaces a resource-based policy on an Amazon Web Services
  /// Payment Cryptography key. A resource-based policy can grant cross-account
  /// access to your key.
  ///
  /// If the policy would grant public access, the request fails with a
  /// <code>PublicPolicyException</code>.
  ///
  /// To remove a resource-based policy from a key, use <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteResourcePolicy.html">DeleteResourcePolicy</a>.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetResourcePolicy.html">GetResourcePolicy</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteResourcePolicy.html">DeleteResourcePolicy</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PublicPolicyException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policy] :
  /// The resource-based policy to attach to the key, in JSON format.
  ///
  /// Parameter [resourceArn] :
  /// The <code>KeyARN</code> of the key to attach the resource-based policy to.
  Future<PutResourcePolicyOutput> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.PutResourcePolicy'
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

    return PutResourcePolicyOutput.fromJson(jsonResponse.body);
  }

  /// Adds or edits tags on an Amazon Web Services Payment Cryptography key.
  /// <note>
  /// Tagging or untagging an Amazon Web Services Payment Cryptography key can
  /// allow or deny permission to the key.
  /// </note>
  /// Each tag consists of a tag key and a tag value, both of which are
  /// case-sensitive strings. The tag value can be an empty (null) string. To
  /// add a tag, specify a new tag key and a tag value. To edit a tag, specify
  /// an existing tag key and a new tag value. You can also add tags to an
  /// Amazon Web Services Payment Cryptography key when you create it with <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UntagResource.html">UntagResource</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>KeyARN</code> of the key whose tags are being updated.
  ///
  /// Parameter [tags] :
  /// One or more tags. Each tag consists of a tag key and a tag value. The tag
  /// value can be an empty (null) string. You can't have more than one tag on
  /// an Amazon Web Services Payment Cryptography key with the same tag key. If
  /// you specify an existing tag key with a different tag value, Amazon Web
  /// Services Payment Cryptography replaces the current tag value with the new
  /// one.
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important>
  /// To use this parameter, you must have <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html">TagResource</a>
  /// permission in an IAM policy.
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important>
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Deletes a tag from an Amazon Web Services Payment Cryptography key.
  /// <note>
  /// Tagging or untagging an Amazon Web Services Payment Cryptography key can
  /// allow or deny permission to the key.
  /// </note>
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html">TagResource</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>KeyARN</code> of the key whose tags are being removed.
  ///
  /// Parameter [tagKeys] :
  /// One or more tag keys. Don't include the tag values.
  ///
  /// If the Amazon Web Services Payment Cryptography key doesn't have the
  /// specified tag key, Amazon Web Services Payment Cryptography doesn't throw
  /// an exception or return a response. To confirm that the operation
  /// succeeded, use the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListTagsForResource.html">ListTagsForResource</a>
  /// operation.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Creates an <i>alias</i>, or a friendly name, for an Amazon Web Services
  /// Payment Cryptography key. You can use an alias to identify a key in the
  /// console and when you call cryptographic operations such as <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/API_EncryptData.html">EncryptData</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/DataAPIReference/API_DecryptData.html">DecryptData</a>.
  ///
  /// You can associate the alias with any key in the same Amazon Web Services
  /// Region. Each alias is associated with only one key at a time, but a key
  /// can have multiple aliases. You can't create an alias without a key. The
  /// alias must be unique in the account and Amazon Web Services Region, but
  /// you can create another alias with the same name in a different Amazon Web
  /// Services Region.
  ///
  /// To change the key that's associated with the alias, call <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html">UpdateAlias</a>.
  /// To delete the alias, call <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html">DeleteAlias</a>.
  /// These operations don't affect the underlying key. To get the alias that
  /// you created, call <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html">ListAliases</a>.
  ///
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html">DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html">GetAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html">ListAliases</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html">UpdateAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aliasName] :
  /// A friendly name that you can use to refer to a key. An alias must begin
  /// with <code>alias/</code> followed by a name, for example
  /// <code>alias/ExampleAlias</code>. It can contain only alphanumeric
  /// characters, forward slashes (/), underscores (_), and dashes (-).
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important>
  ///
  /// Parameter [keyArn] :
  /// The <code>KeyARN</code> of the key to associate with the alias.
  Future<CreateAliasOutput> createAlias({
    required String aliasName,
    String? keyArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.CreateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasName': aliasName,
        if (keyArn != null) 'KeyArn': keyArn,
      },
    );

    return CreateAliasOutput.fromJson(jsonResponse.body);
  }

  /// Gets the Amazon Web Services Payment Cryptography key associated with the
  /// alias.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html">CreateAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html">DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html">ListAliases</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html">UpdateAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aliasName] :
  /// The alias of the Amazon Web Services Payment Cryptography key.
  Future<GetAliasOutput> getAlias({
    required String aliasName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.GetAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasName': aliasName,
      },
    );

    return GetAliasOutput.fromJson(jsonResponse.body);
  }

  /// Associates an existing Amazon Web Services Payment Cryptography alias with
  /// a different key. Each alias is associated with only one Amazon Web
  /// Services Payment Cryptography key at a time, although a key can have
  /// multiple aliases. The alias and the Amazon Web Services Payment
  /// Cryptography key must be in the same Amazon Web Services account and
  /// Amazon Web Services Region
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html">CreateAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html">DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html">GetAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html">ListAliases</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aliasName] :
  /// The alias whose associated key is changing.
  ///
  /// Parameter [keyArn] :
  /// The <code>KeyARN</code> for the key that you are updating or removing from
  /// the alias.
  Future<UpdateAliasOutput> updateAlias({
    required String aliasName,
    String? keyArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.UpdateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasName': aliasName,
        if (keyArn != null) 'KeyArn': keyArn,
      },
    );

    return UpdateAliasOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the alias, but doesn't affect the underlying key.
  ///
  /// Each key can have multiple aliases. To get the aliases of all keys, use
  /// the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html">UpdateAlias</a>
  /// operation. To change the alias of a key, first use <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html">DeleteAlias</a>
  /// to delete the current alias and then use <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html">CreateAlias</a>
  /// to create a new alias. To associate an existing alias with a different
  /// key, call <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html">UpdateAlias</a>.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html">CreateAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html">GetAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListAliases.html">ListAliases</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html">UpdateAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aliasName] :
  /// A friendly name that you can use to refer Amazon Web Services Payment
  /// Cryptography key. This value must begin with <code>alias/</code> followed
  /// by a name, such as <code>alias/ExampleAlias</code>.
  Future<void> deleteAlias({
    required String aliasName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.DeleteAlias'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasName': aliasName,
      },
    );
  }

  /// Lists the aliases for all keys in the caller's Amazon Web Services account
  /// and Amazon Web Services Region. You can filter the aliases by
  /// <code>keyARN</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-managealias.html">Using
  /// aliases</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the aliases. When the response contains only
  /// a subset of aliases, it includes a <code>NextToken</code> value. Use this
  /// value in a subsequent <code>ListAliases</code> request to get more
  /// aliases. When you receive a response with no NextToken (or an empty or
  /// null value), that means there are no more aliases to get.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateAlias.html">CreateAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteAlias.html">DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetAlias.html">GetAlias</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_UpdateAlias.html">UpdateAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyArn] :
  /// The <code>keyARN</code> for which you want to list all aliases.
  ///
  /// Parameter [maxResults] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, Amazon Web Services Payment Cryptography does not
  /// return more than the specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextToken</code> from
  /// the truncated response you just received.
  Future<ListAliasesOutput> listAliases({
    String? keyArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.ListAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (keyArn != null) 'KeyArn': keyArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAliasesOutput.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Web Services Payment Cryptography key, a logical
  /// representation of a cryptographic key, that is unique in your account and
  /// Amazon Web Services Region. You use keys for cryptographic functions such
  /// as encryption and decryption.
  ///
  /// In addition to the key material used in cryptographic operations, an
  /// Amazon Web Services Payment Cryptography key includes metadata such as the
  /// key ARN, key usage, key origin, creation date, description, and key state.
  ///
  /// When you create a key, you specify both immutable and mutable data about
  /// the key. The immutable data contains key attributes that define the scope
  /// and cryptographic operations that you can perform using the key, for
  /// example key class (example: <code>SYMMETRIC_KEY</code>), key algorithm
  /// (example: <code>TDES_2KEY</code>), key usage (example:
  /// <code>TR31_P0_PIN_ENCRYPTION_KEY</code>) and key modes of use (example:
  /// <code>Encrypt</code>). Amazon Web Services Payment Cryptography binds key
  /// attributes to keys using key blocks when you store or export them. Amazon
  /// Web Services Payment Cryptography stores the key contents wrapped and
  /// never stores or transmits them in the clear.
  ///
  /// For information about valid combinations of key attributes, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>. The mutable data contained within a key includes usage
  /// timestamp and key deletion timestamp and can be modified after creation.
  ///
  /// You can use the <code>CreateKey</code> operation to generate an ECC
  /// (Elliptic Curve Cryptography) key pair used for establishing an ECDH
  /// (Elliptic Curve Diffie-Hellman) key agreement between two parties. In the
  /// ECDH key agreement process, both parties generate their own ECC key pair
  /// with key usage K3 and exchange the public keys. Each party then use their
  /// private key, the received public key from the other party, and the key
  /// derivation parameters including key derivation function, hash algorithm,
  /// derivation data, and key algorithm to derive a shared key.
  ///
  /// To maintain the single-use principle of cryptographic keys in payments,
  /// ECDH derived keys should not be used for multiple purposes, such as a
  /// <code>TR31_P0_PIN_ENCRYPTION_KEY</code> and
  /// <code>TR31_K1_KEY_BLOCK_PROTECTION_KEY</code>. When creating ECC key pairs
  /// in Amazon Web Services Payment Cryptography you can optionally set the
  /// <code>DeriveKeyUsage</code> parameter, which defines the key usage bound
  /// to the symmetric key that will be derived using the ECC key pair.
  ///
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html">DeleteKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetKey.html">GetKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListKeys.html">ListKeys</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportable] :
  /// Specifies whether the key is exportable from the service.
  ///
  /// Parameter [keyAttributes] :
  /// The role of the key, the algorithm it supports, and the cryptographic
  /// operations allowed with the key. This data is immutable after the key is
  /// created.
  ///
  /// Parameter [deriveKeyUsage] :
  /// The intended cryptographic usage of keys derived from the ECC key pair to
  /// be created.
  ///
  /// After creating an ECC key pair, you cannot change the intended
  /// cryptographic usage of keys derived from it using ECDH.
  ///
  /// Parameter [enabled] :
  /// Specifies whether to enable the key. If the key is enabled, it is
  /// activated for use within the service. If the key is not enabled, then it
  /// is created but not activated. The default value is enabled.
  ///
  /// Parameter [keyCheckValueAlgorithm] :
  /// The algorithm that Amazon Web Services Payment Cryptography uses to
  /// calculate the key check value (KCV). It is used to validate the key
  /// integrity.
  ///
  /// For TDES keys, the KCV is computed by encrypting 8 bytes, each with value
  /// of zero, with the key to be checked and retaining the 3 highest order
  /// bytes of the encrypted result. For AES keys, the KCV is computed using a
  /// CMAC algorithm where the input data is 16 bytes of zero and retaining the
  /// 3 highest order bytes of the encrypted result. For HMAC keys, the KCV is
  /// computed using the hash selected at key creation on a zero-length message,
  /// taking the leftmost 3 bytes.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags to the Amazon Web Services Payment Cryptography
  /// key. Use this parameter to tag a key when it is created. To tag an
  /// existing Amazon Web Services Payment Cryptography key, use the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_TagResource.html">TagResource</a>
  /// operation.
  ///
  /// Each tag consists of a tag key and a tag value. Both the tag key and the
  /// tag value are required, but the tag value can be an empty (null) string.
  /// You can't have more than one tag on an Amazon Web Services Payment
  /// Cryptography key with the same tag key.
  /// <important>
  /// Don't include personal, confidential or sensitive information in this
  /// field. This field may be displayed in plaintext in CloudTrail logs and
  /// other output.
  /// </important> <note>
  /// Tagging or untagging an Amazon Web Services Payment Cryptography key can
  /// allow or deny permission to the key.
  /// </note>
  Future<CreateKeyOutput> createKey({
    required bool exportable,
    required KeyAttributes keyAttributes,
    DeriveKeyUsage? deriveKeyUsage,
    bool? enabled,
    KeyCheckValueAlgorithm? keyCheckValueAlgorithm,
    List<String>? replicationRegions,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.CreateKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Exportable': exportable,
        'KeyAttributes': keyAttributes,
        if (deriveKeyUsage != null) 'DeriveKeyUsage': deriveKeyUsage.value,
        if (enabled != null) 'Enabled': enabled,
        if (keyCheckValueAlgorithm != null)
          'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.value,
        if (replicationRegions != null)
          'ReplicationRegions': replicationRegions,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateKeyOutput.fromJson(jsonResponse.body);
  }

  /// Gets the key metadata for an Amazon Web Services Payment Cryptography key,
  /// including the immutable and mutable attributes specified when the key was
  /// created. Returns key metadata including attributes, state, and timestamps,
  /// but does not return the actual cryptographic key material.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html">DeleteKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListKeys.html">ListKeys</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>KeyARN</code> of the Amazon Web Services Payment Cryptography
  /// key.
  Future<GetKeyOutput> getKey({
    required String keyIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.GetKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
      },
    );

    return GetKeyOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the key material and metadata associated with Amazon Web Services
  /// Payment Cryptography key.
  ///
  /// Key deletion is irreversible. After a key is deleted, you can't perform
  /// cryptographic operations using the key. For example, you can't decrypt
  /// data that was encrypted by a deleted Amazon Web Services Payment
  /// Cryptography key, and the data may become unrecoverable. Because key
  /// deletion is destructive, Amazon Web Services Payment Cryptography has a
  /// safety mechanism to prevent accidental deletion of a key. When you call
  /// this operation, Amazon Web Services Payment Cryptography disables the
  /// specified key but doesn't delete it until after a waiting period set using
  /// <code>DeleteKeyInDays</code>. The default waiting period is 7 days. During
  /// the waiting period, the <code>KeyState</code> is
  /// <code>DELETE_PENDING</code>. After the key is deleted, the
  /// <code>KeyState</code> is <code>DELETE_COMPLETE</code>.
  ///
  /// You should delete a key only when you are sure that you don't need to use
  /// it anymore and no other parties are utilizing this key. If you aren't
  /// sure, consider deactivating it instead by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html">StopKeyUsage</a>.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_RestoreKey.html">RestoreKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html">StartKeyUsage</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html">StopKeyUsage</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>KeyARN</code> of the key that is scheduled for deletion.
  ///
  /// Parameter [deleteKeyInDays] :
  /// The waiting period for key deletion. The default value is seven days.
  Future<DeleteKeyOutput> deleteKey({
    required String keyIdentifier,
    int? deleteKeyInDays,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.DeleteKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
        if (deleteKeyInDays != null) 'DeleteKeyInDays': deleteKeyInDays,
      },
    );

    return DeleteKeyOutput.fromJson(jsonResponse.body);
  }

  /// Lists the keys in the caller's Amazon Web Services account and Amazon Web
  /// Services Region. You can filter the list of keys.
  ///
  /// This is a paginated operation, which means that each response might
  /// contain only a subset of all the keys. When the response contains only a
  /// subset of keys, it includes a <code>NextToken</code> value. Use this value
  /// in a subsequent <code>ListKeys</code> request to get more keys. When you
  /// receive a response with no NextToken (or an empty or null value), that
  /// means there are no more keys to get.
  ///
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html">DeleteKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetKey.html">GetKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyState] :
  /// The key state of the keys you want to list.
  ///
  /// Parameter [maxResults] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, Amazon Web Services Payment Cryptography does not
  /// return more than the specified number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [nextToken] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextToken</code> from
  /// the truncated response you just received.
  Future<ListKeysOutput> listKeys({
    KeyState? keyState,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.ListKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (keyState != null) 'KeyState': keyState.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListKeysOutput.fromJson(jsonResponse.body);
  }

  /// Adds replication Amazon Web Services Regions to an existing Amazon Web
  /// Services Payment Cryptography key, enabling the key to be used for
  /// cryptographic operations in additional Amazon Web Services Regions.
  ///
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a> allow you to use the same key material across multiple
  /// Amazon Web Services Regions, providing lower latency for applications
  /// distributed across regions. When you add Replication Regions, Amazon Web
  /// Services Payment Cryptography securely replicates the key material to the
  /// specified Amazon Web Services Regions.
  ///
  /// The key must be in an active state to add Replication Regions. You can add
  /// multiple regions in a single operation, and the key will be available for
  /// use in those regions once replication is complete.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_RemoveKeyReplicationRegions.html">RemoveKeyReplicationRegions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_EnableDefaultKeyReplicationRegions.html">EnableDefaultKeyReplicationRegions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetDefaultKeyReplicationRegions.html">GetDefaultKeyReplicationRegions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The key identifier (ARN or alias) of the key for which to add replication
  /// regions.
  ///
  /// This key must exist and be in a valid state for replication operations.
  ///
  /// Parameter [replicationRegions] :
  /// The list of Amazon Web Services Regions to add to the key's replication
  /// configuration.
  ///
  /// Each region must be a valid Amazon Web Services Region where Amazon Web
  /// Services Payment Cryptography is available. The key will be replicated to
  /// these regions, allowing cryptographic operations to be performed closer to
  /// your applications.
  Future<AddKeyReplicationRegionsOutput> addKeyReplicationRegions({
    required String keyIdentifier,
    required List<String> replicationRegions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.AddKeyReplicationRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
        'ReplicationRegions': replicationRegions,
      },
    );

    return AddKeyReplicationRegionsOutput.fromJson(jsonResponse.body);
  }

  /// Removes Replication Regions from an existing Amazon Web Services Payment
  /// Cryptography key, disabling the key's availability for cryptographic
  /// operations in the specified Amazon Web Services Regions.
  ///
  /// When you remove Replication Regions, the key material is securely deleted
  /// from those regions and can no longer be used for cryptographic operations
  /// there. This operation is irreversible for the specified Amazon Web
  /// Services Regions. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a>.
  /// <important>
  /// Ensure that no active cryptographic operations or applications depend on
  /// the key in the regions you're removing before performing this operation.
  /// </important>
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_AddKeyReplicationRegions.html">AddKeyReplicationRegions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DisableDefaultKeyReplicationRegions.html">DisableDefaultKeyReplicationRegions</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The key identifier (ARN or alias) of the key from which to remove
  /// replication regions.
  ///
  /// This key must exist and have replication enabled in the specified regions.
  ///
  /// Parameter [replicationRegions] :
  /// The list of Amazon Web Services Regions to remove from the key's
  /// replication configuration.
  ///
  /// The key will no longer be available for cryptographic operations in these
  /// regions after removal. Ensure no active operations depend on the key in
  /// these regions before removal.
  Future<RemoveKeyReplicationRegionsOutput> removeKeyReplicationRegions({
    required String keyIdentifier,
    required List<String> replicationRegions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PaymentCryptographyControlPlane.RemoveKeyReplicationRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
        'ReplicationRegions': replicationRegions,
      },
    );

    return RemoveKeyReplicationRegionsOutput.fromJson(jsonResponse.body);
  }

  /// Cancels a scheduled key deletion during the waiting period. Use this
  /// operation to restore a <code>Key</code> that is scheduled for deletion.
  ///
  /// During the waiting period, the <code>KeyState</code> is
  /// <code>DELETE_PENDING</code> and <code>deletePendingTimestamp</code>
  /// contains the date and time after which the <code>Key</code> will be
  /// deleted. After <code>Key</code> is restored, the <code>KeyState</code> is
  /// <code>CREATE_COMPLETE</code>, and the value for
  /// <code>deletePendingTimestamp</code> is removed.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html">DeleteKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html">StartKeyUsage</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html">StopKeyUsage</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>KeyARN</code> of the key to be restored within Amazon Web
  /// Services Payment Cryptography.
  Future<RestoreKeyOutput> restoreKey({
    required String keyIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.RestoreKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
      },
    );

    return RestoreKeyOutput.fromJson(jsonResponse.body);
  }

  /// Enables an Amazon Web Services Payment Cryptography key, which makes it
  /// active for cryptographic operations within Amazon Web Services Payment
  /// Cryptography
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html">StopKeyUsage</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>KeyArn</code> of the key.
  Future<StartKeyUsageOutput> startKeyUsage({
    required String keyIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.StartKeyUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
      },
    );

    return StartKeyUsageOutput.fromJson(jsonResponse.body);
  }

  /// Disables an Amazon Web Services Payment Cryptography key, which makes it
  /// inactive within Amazon Web Services Payment Cryptography.
  ///
  /// You can use this operation instead of <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html">DeleteKey</a>
  /// to deactivate a key. You can enable the key in the future by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html">StartKeyUsage</a>.
  ///
  /// <b>Cross-account use:</b> This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_DeleteKey.html">DeleteKey</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html">StartKeyUsage</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>KeyArn</code> of the key.
  Future<StopKeyUsageOutput> stopKeyUsage({
    required String keyIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PaymentCryptographyControlPlane.StopKeyUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyIdentifier': keyIdentifier,
      },
    );

    return StopKeyUsageOutput.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class AssociateMpaTeamOutput {
  /// The details of the MPA team association.
  final MpaTeamAssociation mpaTeamAssociation;

  AssociateMpaTeamOutput({
    required this.mpaTeamAssociation,
  });

  factory AssociateMpaTeamOutput.fromJson(Map<String, dynamic> json) {
    return AssociateMpaTeamOutput(
      mpaTeamAssociation: MpaTeamAssociation.fromJson(
          (json['MpaTeamAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final mpaTeamAssociation = this.mpaTeamAssociation;
    return {
      'MpaTeamAssociation': mpaTeamAssociation,
    };
  }
}

/// @nodoc
class DeleteResourcePolicyOutput {
  DeleteResourcePolicyOutput();

  factory DeleteResourcePolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output from disabling default key replication regions for the account.
///
/// @nodoc
class DisableDefaultKeyReplicationRegionsOutput {
  /// The remaining list of regions where default key replication is still enabled
  /// for the account.
  ///
  /// This reflects the account's default replication configuration after removing
  /// the specified regions.
  final List<String> enabledReplicationRegions;

  DisableDefaultKeyReplicationRegionsOutput({
    required this.enabledReplicationRegions,
  });

  factory DisableDefaultKeyReplicationRegionsOutput.fromJson(
      Map<String, dynamic> json) {
    return DisableDefaultKeyReplicationRegionsOutput(
      enabledReplicationRegions:
          ((json['EnabledReplicationRegions'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabledReplicationRegions = this.enabledReplicationRegions;
    return {
      'EnabledReplicationRegions': enabledReplicationRegions,
    };
  }
}

/// @nodoc
class DisassociateMpaTeamOutput {
  /// The details of the MPA team association.
  final MpaTeamAssociation mpaTeamAssociation;

  DisassociateMpaTeamOutput({
    required this.mpaTeamAssociation,
  });

  factory DisassociateMpaTeamOutput.fromJson(Map<String, dynamic> json) {
    return DisassociateMpaTeamOutput(
      mpaTeamAssociation: MpaTeamAssociation.fromJson(
          (json['MpaTeamAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final mpaTeamAssociation = this.mpaTeamAssociation;
    return {
      'MpaTeamAssociation': mpaTeamAssociation,
    };
  }
}

/// Output from enabling default key replication regions for the account.
///
/// @nodoc
class EnableDefaultKeyReplicationRegionsOutput {
  /// The complete list of regions where default key replication is now enabled
  /// for the account.
  ///
  /// This includes both previously enabled regions and the newly added regions
  /// from this operation.
  final List<String> enabledReplicationRegions;

  EnableDefaultKeyReplicationRegionsOutput({
    required this.enabledReplicationRegions,
  });

  factory EnableDefaultKeyReplicationRegionsOutput.fromJson(
      Map<String, dynamic> json) {
    return EnableDefaultKeyReplicationRegionsOutput(
      enabledReplicationRegions:
          ((json['EnabledReplicationRegions'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabledReplicationRegions = this.enabledReplicationRegions;
    return {
      'EnabledReplicationRegions': enabledReplicationRegions,
    };
  }
}

/// @nodoc
class ExportKeyOutput {
  /// The key material under export as a TR-34 WrappedKeyBlock or a TR-31
  /// WrappedKeyBlock. or a RSA WrappedKeyCryptogram.
  final WrappedKey? wrappedKey;

  ExportKeyOutput({
    this.wrappedKey,
  });

  factory ExportKeyOutput.fromJson(Map<String, dynamic> json) {
    return ExportKeyOutput(
      wrappedKey: json['WrappedKey'] != null
          ? WrappedKey.fromJson(json['WrappedKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final wrappedKey = this.wrappedKey;
    return {
      if (wrappedKey != null) 'WrappedKey': wrappedKey,
    };
  }
}

/// @nodoc
class GetCertificateSigningRequestOutput {
  /// The certificate signing request generated using the key pair associated with
  /// the key identifier.
  final String certificateSigningRequest;

  GetCertificateSigningRequestOutput({
    required this.certificateSigningRequest,
  });

  factory GetCertificateSigningRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return GetCertificateSigningRequestOutput(
      certificateSigningRequest:
          (json['CertificateSigningRequest'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final certificateSigningRequest = this.certificateSigningRequest;
    return {
      'CertificateSigningRequest': certificateSigningRequest,
    };
  }
}

/// Output containing the account's current default key replication
/// configuration.
///
/// @nodoc
class GetDefaultKeyReplicationRegionsOutput {
  /// The list of regions where default key replication is currently enabled for
  /// the account.
  ///
  /// New keys created in this account will automatically be replicated to these
  /// regions unless explicitly configured otherwise during key creation.
  final List<String> enabledReplicationRegions;

  GetDefaultKeyReplicationRegionsOutput({
    required this.enabledReplicationRegions,
  });

  factory GetDefaultKeyReplicationRegionsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetDefaultKeyReplicationRegionsOutput(
      enabledReplicationRegions:
          ((json['EnabledReplicationRegions'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabledReplicationRegions = this.enabledReplicationRegions;
    return {
      'EnabledReplicationRegions': enabledReplicationRegions,
    };
  }
}

/// @nodoc
class GetMpaTeamAssociationOutput {
  /// The details of the MPA team association.
  final MpaTeamAssociation mpaTeamAssociation;

  GetMpaTeamAssociationOutput({
    required this.mpaTeamAssociation,
  });

  factory GetMpaTeamAssociationOutput.fromJson(Map<String, dynamic> json) {
    return GetMpaTeamAssociationOutput(
      mpaTeamAssociation: MpaTeamAssociation.fromJson(
          (json['MpaTeamAssociation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final mpaTeamAssociation = this.mpaTeamAssociation;
    return {
      'MpaTeamAssociation': mpaTeamAssociation,
    };
  }
}

/// @nodoc
class GetParametersForExportOutput {
  /// The export token to initiate key export from Amazon Web Services Payment
  /// Cryptography. The export token expires after 30 days. You can use the same
  /// export token to export multiple keys from the same service account.
  final String exportToken;

  /// The validity period of the export token.
  final DateTime parametersValidUntilTimestamp;

  /// The algorithm of the signing key certificate for use in TR-34 key block
  /// generation. <code>RSA_2048</code> is the only signing key algorithm allowed.
  final KeyAlgorithm signingKeyAlgorithm;

  /// The signing key certificate in PEM format (base64 encoded) of the public key
  /// for signature within the TR-34 key block. The certificate expires after 30
  /// days.
  final String signingKeyCertificate;

  /// The root certificate authority (CA) that signed the signing key certificate
  /// in PEM format (base64 encoded).
  final String signingKeyCertificateChain;

  GetParametersForExportOutput({
    required this.exportToken,
    required this.parametersValidUntilTimestamp,
    required this.signingKeyAlgorithm,
    required this.signingKeyCertificate,
    required this.signingKeyCertificateChain,
  });

  factory GetParametersForExportOutput.fromJson(Map<String, dynamic> json) {
    return GetParametersForExportOutput(
      exportToken: (json['ExportToken'] as String?) ?? '',
      parametersValidUntilTimestamp: nonNullableTimeStampFromJson(
          json['ParametersValidUntilTimestamp'] ?? 0),
      signingKeyAlgorithm: KeyAlgorithm.fromString(
          (json['SigningKeyAlgorithm'] as String?) ?? ''),
      signingKeyCertificate: (json['SigningKeyCertificate'] as String?) ?? '',
      signingKeyCertificateChain:
          (json['SigningKeyCertificateChain'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final exportToken = this.exportToken;
    final parametersValidUntilTimestamp = this.parametersValidUntilTimestamp;
    final signingKeyAlgorithm = this.signingKeyAlgorithm;
    final signingKeyCertificate = this.signingKeyCertificate;
    final signingKeyCertificateChain = this.signingKeyCertificateChain;
    return {
      'ExportToken': exportToken,
      'ParametersValidUntilTimestamp':
          unixTimestampToJson(parametersValidUntilTimestamp),
      'SigningKeyAlgorithm': signingKeyAlgorithm.value,
      'SigningKeyCertificate': signingKeyCertificate,
      'SigningKeyCertificateChain': signingKeyCertificateChain,
    };
  }
}

/// @nodoc
class GetParametersForImportOutput {
  /// The import token to initiate key import into Amazon Web Services Payment
  /// Cryptography. The import token expires after 30 days. You can use the same
  /// import token to import multiple keys to the same service account.
  final String importToken;

  /// The validity period of the import token.
  final DateTime parametersValidUntilTimestamp;

  /// The algorithm of the wrapping key for use within TR-34 WrappedKeyBlock or
  /// RSA WrappedKeyCryptogram.
  final KeyAlgorithm wrappingKeyAlgorithm;

  /// The wrapping key certificate in PEM format (base64 encoded) of the wrapping
  /// key for use within the TR-34 key block. The certificate expires in 30 days.
  final String wrappingKeyCertificate;

  /// The Amazon Web Services Payment Cryptography root certificate authority (CA)
  /// that signed the wrapping key certificate in PEM format (base64 encoded).
  final String wrappingKeyCertificateChain;

  GetParametersForImportOutput({
    required this.importToken,
    required this.parametersValidUntilTimestamp,
    required this.wrappingKeyAlgorithm,
    required this.wrappingKeyCertificate,
    required this.wrappingKeyCertificateChain,
  });

  factory GetParametersForImportOutput.fromJson(Map<String, dynamic> json) {
    return GetParametersForImportOutput(
      importToken: (json['ImportToken'] as String?) ?? '',
      parametersValidUntilTimestamp: nonNullableTimeStampFromJson(
          json['ParametersValidUntilTimestamp'] ?? 0),
      wrappingKeyAlgorithm: KeyAlgorithm.fromString(
          (json['WrappingKeyAlgorithm'] as String?) ?? ''),
      wrappingKeyCertificate: (json['WrappingKeyCertificate'] as String?) ?? '',
      wrappingKeyCertificateChain:
          (json['WrappingKeyCertificateChain'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final importToken = this.importToken;
    final parametersValidUntilTimestamp = this.parametersValidUntilTimestamp;
    final wrappingKeyAlgorithm = this.wrappingKeyAlgorithm;
    final wrappingKeyCertificate = this.wrappingKeyCertificate;
    final wrappingKeyCertificateChain = this.wrappingKeyCertificateChain;
    return {
      'ImportToken': importToken,
      'ParametersValidUntilTimestamp':
          unixTimestampToJson(parametersValidUntilTimestamp),
      'WrappingKeyAlgorithm': wrappingKeyAlgorithm.value,
      'WrappingKeyCertificate': wrappingKeyCertificate,
      'WrappingKeyCertificateChain': wrappingKeyCertificateChain,
    };
  }
}

/// @nodoc
class GetPublicKeyCertificateOutput {
  /// The public key component of the asymmetric key pair in a certificate PEM
  /// format (base64 encoded). It is signed by the root certificate authority
  /// (CA). The certificate is valid for 90 days from the time it is issued. The
  /// service returns a cached certificate if one exists with at least 30 days of
  /// remaining validity. Otherwise, a new 90-day certificate is issued.
  final String keyCertificate;

  /// The root certificate authority (CA) that signed the public key certificate
  /// in PEM format (base64 encoded) of the asymmetric key pair.
  final String keyCertificateChain;

  GetPublicKeyCertificateOutput({
    required this.keyCertificate,
    required this.keyCertificateChain,
  });

  factory GetPublicKeyCertificateOutput.fromJson(Map<String, dynamic> json) {
    return GetPublicKeyCertificateOutput(
      keyCertificate: (json['KeyCertificate'] as String?) ?? '',
      keyCertificateChain: (json['KeyCertificateChain'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyCertificate = this.keyCertificate;
    final keyCertificateChain = this.keyCertificateChain;
    return {
      'KeyCertificate': keyCertificate,
      'KeyCertificateChain': keyCertificateChain,
    };
  }
}

/// @nodoc
class GetResourcePolicyOutput {
  /// The resource-based policy attached to the key, in JSON format.
  final String policy;

  /// The <code>KeyARN</code> of the key.
  final String resourceArn;

  GetResourcePolicyOutput({
    required this.policy,
    required this.resourceArn,
  });

  factory GetResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyOutput(
      policy: (json['Policy'] as String?) ?? '',
      resourceArn: (json['ResourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      'Policy': policy,
      'ResourceArn': resourceArn,
    };
  }
}

/// @nodoc
class ImportKeyOutput {
  /// The <code>KeyARN</code> of the key material imported within Amazon Web
  /// Services Payment Cryptography.
  final Key key;

  ImportKeyOutput({
    required this.key,
  });

  factory ImportKeyOutput.fromJson(Map<String, dynamic> json) {
    return ImportKeyOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The list of tags associated with a <code>ResourceArn</code>. Each tag will
  /// list the key-value pair contained within that tag.
  final List<Tag> tags;

  /// The token for the next set of results, or an empty or null value if there
  /// are no more results.
  final String? nextToken;

  ListTagsForResourceOutput({
    required this.tags,
    this.nextToken,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: ((json['Tags'] as List?) ?? const [])
          .nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final nextToken = this.nextToken;
    return {
      'Tags': tags,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class PutResourcePolicyOutput {
  /// The resource-based policy that was attached to the key.
  final String policy;

  /// The <code>KeyARN</code> of the key that the resource-based policy was
  /// attached to.
  final String resourceArn;

  PutResourcePolicyOutput({
    required this.policy,
    required this.resourceArn,
  });

  factory PutResourcePolicyOutput.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyOutput(
      policy: (json['Policy'] as String?) ?? '',
      resourceArn: (json['ResourceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      'Policy': policy,
      'ResourceArn': resourceArn,
    };
  }
}

/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateAliasOutput {
  /// The alias for the key.
  final Alias alias;

  CreateAliasOutput({
    required this.alias,
  });

  factory CreateAliasOutput.fromJson(Map<String, dynamic> json) {
    return CreateAliasOutput(
      alias: Alias.fromJson((json['Alias'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      'Alias': alias,
    };
  }
}

/// @nodoc
class GetAliasOutput {
  /// The alias of the Amazon Web Services Payment Cryptography key.
  final Alias alias;

  GetAliasOutput({
    required this.alias,
  });

  factory GetAliasOutput.fromJson(Map<String, dynamic> json) {
    return GetAliasOutput(
      alias: Alias.fromJson((json['Alias'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      'Alias': alias,
    };
  }
}

/// @nodoc
class UpdateAliasOutput {
  /// The alias name.
  final Alias alias;

  UpdateAliasOutput({
    required this.alias,
  });

  factory UpdateAliasOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAliasOutput(
      alias: Alias.fromJson((json['Alias'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      'Alias': alias,
    };
  }
}

/// @nodoc
class DeleteAliasOutput {
  DeleteAliasOutput();

  factory DeleteAliasOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAliasOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAliasesOutput {
  /// The list of aliases. Each alias describes the <code>KeyArn</code> contained
  /// within.
  final List<Alias> aliases;

  /// The token for the next set of results, or an empty or null value if there
  /// are no more results.
  final String? nextToken;

  ListAliasesOutput({
    required this.aliases,
    this.nextToken,
  });

  factory ListAliasesOutput.fromJson(Map<String, dynamic> json) {
    return ListAliasesOutput(
      aliases: ((json['Aliases'] as List?) ?? const [])
          .nonNulls
          .map((e) => Alias.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final nextToken = this.nextToken;
    return {
      'Aliases': aliases,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateKeyOutput {
  /// The key material that contains all the key attributes.
  final Key key;

  CreateKeyOutput({
    required this.key,
  });

  factory CreateKeyOutput.fromJson(Map<String, dynamic> json) {
    return CreateKeyOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// @nodoc
class GetKeyOutput {
  /// Contains the key metadata, including both immutable and mutable attributes
  /// for the key, but does not include actual cryptographic key material.
  final Key key;

  GetKeyOutput({
    required this.key,
  });

  factory GetKeyOutput.fromJson(Map<String, dynamic> json) {
    return GetKeyOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// @nodoc
class DeleteKeyOutput {
  /// The <code>KeyARN</code> of the key that is scheduled for deletion.
  final Key key;

  DeleteKeyOutput({
    required this.key,
  });

  factory DeleteKeyOutput.fromJson(Map<String, dynamic> json) {
    return DeleteKeyOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// @nodoc
class ListKeysOutput {
  /// The list of keys created within the caller's Amazon Web Services account and
  /// Amazon Web Services Region.
  final List<KeySummary> keys;

  /// The token for the next set of results, or an empty or null value if there
  /// are no more results.
  final String? nextToken;

  ListKeysOutput({
    required this.keys,
    this.nextToken,
  });

  factory ListKeysOutput.fromJson(Map<String, dynamic> json) {
    return ListKeysOutput(
      keys: ((json['Keys'] as List?) ?? const [])
          .nonNulls
          .map((e) => KeySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keys = this.keys;
    final nextToken = this.nextToken;
    return {
      'Keys': keys,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Output from adding replication regions to a key.
///
/// @nodoc
class AddKeyReplicationRegionsOutput {
  /// The updated key metadata after adding the replication regions.
  ///
  /// This includes the current state of the key and its replication
  /// configuration.
  final Key key;

  AddKeyReplicationRegionsOutput({
    required this.key,
  });

  factory AddKeyReplicationRegionsOutput.fromJson(Map<String, dynamic> json) {
    return AddKeyReplicationRegionsOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// Output from removing replication regions from a key.
///
/// @nodoc
class RemoveKeyReplicationRegionsOutput {
  /// The updated key metadata after removing the replication regions.
  ///
  /// This reflects the current state of the key and its updated replication
  /// configuration.
  final Key key;

  RemoveKeyReplicationRegionsOutput({
    required this.key,
  });

  factory RemoveKeyReplicationRegionsOutput.fromJson(
      Map<String, dynamic> json) {
    return RemoveKeyReplicationRegionsOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// @nodoc
class RestoreKeyOutput {
  /// The key material of the restored key. The <code>KeyState</code> will change
  /// to <code>CREATE_COMPLETE</code> and value for
  /// <code>DeletePendingTimestamp</code> gets removed.
  final Key key;

  RestoreKeyOutput({
    required this.key,
  });

  factory RestoreKeyOutput.fromJson(Map<String, dynamic> json) {
    return RestoreKeyOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// @nodoc
class StartKeyUsageOutput {
  /// The <code>KeyARN</code> of the Amazon Web Services Payment Cryptography key
  /// activated for use.
  final Key key;

  StartKeyUsageOutput({
    required this.key,
  });

  factory StartKeyUsageOutput.fromJson(Map<String, dynamic> json) {
    return StartKeyUsageOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// @nodoc
class StopKeyUsageOutput {
  /// The <code>KeyARN</code> of the key.
  final Key key;

  StopKeyUsageOutput({
    required this.key,
  });

  factory StopKeyUsageOutput.fromJson(Map<String, dynamic> json) {
    return StopKeyUsageOutput(
      key: Key.fromJson(
          (json['Key'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// Metadata about an Amazon Web Services Payment Cryptography key.
///
/// @nodoc
class Key {
  /// The date and time when the key was created.
  final DateTime createTimestamp;

  /// Specifies whether the key is enabled.
  final bool enabled;

  /// Specifies whether the key is exportable. This data is immutable after the
  /// key is created.
  final bool exportable;

  /// The Amazon Resource Name (ARN) of the key.
  final String keyArn;

  /// The role of the key, the algorithm it supports, and the cryptographic
  /// operations allowed with the key. This data is immutable after the key is
  /// created.
  final KeyAttributes keyAttributes;

  /// The key check value (KCV) is used to check if all parties holding a given
  /// key have the same key or to detect that a key has changed.
  final String keyCheckValue;

  /// The algorithm that Amazon Web Services Payment Cryptography uses to
  /// calculate the key check value (KCV). It is used to validate the key
  /// integrity.
  ///
  /// For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of
  /// zero, with the key to be checked and retaining the 3 highest order bytes of
  /// the encrypted result. For AES keys, the KCV is computed using a CMAC
  /// algorithm where the input data is 16 bytes of zero and retaining the 3
  /// highest order bytes of the encrypted result. For HMAC keys, the KCV is
  /// computed using the hash selected at key creation on a zero-length message,
  /// taking the leftmost 3 bytes.
  final KeyCheckValueAlgorithm keyCheckValueAlgorithm;

  /// The source of the key material. For keys created within Amazon Web Services
  /// Payment Cryptography, the value is <code>AWS_PAYMENT_CRYPTOGRAPHY</code>.
  /// For keys imported into Amazon Web Services Payment Cryptography, the value
  /// is <code>EXTERNAL</code>.
  final KeyOrigin keyOrigin;

  /// The state of key that is being created or deleted.
  final KeyState keyState;

  /// The date and time after which Amazon Web Services Payment Cryptography will
  /// delete the key. This value is present only when <code>KeyState</code> is
  /// <code>DELETE_PENDING</code> and the key is scheduled for deletion.
  final DateTime? deletePendingTimestamp;

  /// The date and time after which Amazon Web Services Payment Cryptography will
  /// delete the key. This value is present only when when the
  /// <code>KeyState</code> is <code>DELETE_COMPLETE</code> and the Amazon Web
  /// Services Payment Cryptography key is deleted.
  final DateTime? deleteTimestamp;

  /// The cryptographic usage of an ECDH derived key as deﬁned in section A.5.2 of
  /// the TR-31 spec.
  final DeriveKeyUsage? deriveKeyUsage;

  /// The Multi-Party Approval (MPA) status for the key, if applicable.
  final MpaStatus? mpaStatus;

  /// Indicates whether this key is a Multi-Region key and its role in the
  /// Multi-Region key hierarchy.
  ///
  /// Multi-Region replication keys allow the same key material to be used across
  /// multiple Amazon Web Services Regions. This field specifies whether the key
  /// is a Primary Region key (PRK) (which can be replicated to other Amazon Web
  /// Services Regions) or a Replica Region key (RRK) (which is a copy of a PRK in
  /// another Region). For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a>.
  final MultiRegionKeyType? multiRegionKeyType;
  final String? primaryRegion;

  /// Information about the replication status of the key across different Amazon
  /// Web Services Regions.
  ///
  /// This field provides details about the current state of key replication,
  /// including any status messages or operational information. It helps track the
  /// progress and health of key replication operations.
  final Map<String, ReplicationStatusType>? replicationStatus;

  /// The date and time after which Amazon Web Services Payment Cryptography will
  /// start using the key material for cryptographic operations.
  final DateTime? usageStartTimestamp;

  /// The date and time after which Amazon Web Services Payment Cryptography will
  /// stop using the key material for cryptographic operations.
  final DateTime? usageStopTimestamp;

  /// Indicates whether this key is using the account's default replication
  /// regions configuration for <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a>.
  ///
  /// When set to <code>true</code>, the key automatically replicates to the
  /// regions specified in the account's default replication settings. When set to
  /// <code>false</code>, the key has a custom replication configuration that
  /// overrides the account defaults.
  final bool? usingDefaultReplicationRegions;

  Key({
    required this.createTimestamp,
    required this.enabled,
    required this.exportable,
    required this.keyArn,
    required this.keyAttributes,
    required this.keyCheckValue,
    required this.keyCheckValueAlgorithm,
    required this.keyOrigin,
    required this.keyState,
    this.deletePendingTimestamp,
    this.deleteTimestamp,
    this.deriveKeyUsage,
    this.mpaStatus,
    this.multiRegionKeyType,
    this.primaryRegion,
    this.replicationStatus,
    this.usageStartTimestamp,
    this.usageStopTimestamp,
    this.usingDefaultReplicationRegions,
  });

  factory Key.fromJson(Map<String, dynamic> json) {
    return Key(
      createTimestamp:
          nonNullableTimeStampFromJson(json['CreateTimestamp'] ?? 0),
      enabled: (json['Enabled'] as bool?) ?? false,
      exportable: (json['Exportable'] as bool?) ?? false,
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyAttributes: KeyAttributes.fromJson(
          (json['KeyAttributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      keyCheckValueAlgorithm: KeyCheckValueAlgorithm.fromString(
          (json['KeyCheckValueAlgorithm'] as String?) ?? ''),
      keyOrigin: KeyOrigin.fromString((json['KeyOrigin'] as String?) ?? ''),
      keyState: KeyState.fromString((json['KeyState'] as String?) ?? ''),
      deletePendingTimestamp: timeStampFromJson(json['DeletePendingTimestamp']),
      deleteTimestamp: timeStampFromJson(json['DeleteTimestamp']),
      deriveKeyUsage:
          (json['DeriveKeyUsage'] as String?)?.let(DeriveKeyUsage.fromString),
      mpaStatus: json['MpaStatus'] != null
          ? MpaStatus.fromJson(json['MpaStatus'] as Map<String, dynamic>)
          : null,
      multiRegionKeyType: (json['MultiRegionKeyType'] as String?)
          ?.let(MultiRegionKeyType.fromString),
      primaryRegion: json['PrimaryRegion'] as String?,
      replicationStatus: (json['ReplicationStatus'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ReplicationStatusType.fromJson(e as Map<String, dynamic>))),
      usageStartTimestamp: timeStampFromJson(json['UsageStartTimestamp']),
      usageStopTimestamp: timeStampFromJson(json['UsageStopTimestamp']),
      usingDefaultReplicationRegions:
          json['UsingDefaultReplicationRegions'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTimestamp = this.createTimestamp;
    final enabled = this.enabled;
    final exportable = this.exportable;
    final keyArn = this.keyArn;
    final keyAttributes = this.keyAttributes;
    final keyCheckValue = this.keyCheckValue;
    final keyCheckValueAlgorithm = this.keyCheckValueAlgorithm;
    final keyOrigin = this.keyOrigin;
    final keyState = this.keyState;
    final deletePendingTimestamp = this.deletePendingTimestamp;
    final deleteTimestamp = this.deleteTimestamp;
    final deriveKeyUsage = this.deriveKeyUsage;
    final mpaStatus = this.mpaStatus;
    final multiRegionKeyType = this.multiRegionKeyType;
    final primaryRegion = this.primaryRegion;
    final replicationStatus = this.replicationStatus;
    final usageStartTimestamp = this.usageStartTimestamp;
    final usageStopTimestamp = this.usageStopTimestamp;
    final usingDefaultReplicationRegions = this.usingDefaultReplicationRegions;
    return {
      'CreateTimestamp': unixTimestampToJson(createTimestamp),
      'Enabled': enabled,
      'Exportable': exportable,
      'KeyArn': keyArn,
      'KeyAttributes': keyAttributes,
      'KeyCheckValue': keyCheckValue,
      'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.value,
      'KeyOrigin': keyOrigin.value,
      'KeyState': keyState.value,
      if (deletePendingTimestamp != null)
        'DeletePendingTimestamp': unixTimestampToJson(deletePendingTimestamp),
      if (deleteTimestamp != null)
        'DeleteTimestamp': unixTimestampToJson(deleteTimestamp),
      if (deriveKeyUsage != null) 'DeriveKeyUsage': deriveKeyUsage.value,
      if (mpaStatus != null) 'MpaStatus': mpaStatus,
      if (multiRegionKeyType != null)
        'MultiRegionKeyType': multiRegionKeyType.value,
      if (primaryRegion != null) 'PrimaryRegion': primaryRegion,
      if (replicationStatus != null) 'ReplicationStatus': replicationStatus,
      if (usageStartTimestamp != null)
        'UsageStartTimestamp': unixTimestampToJson(usageStartTimestamp),
      if (usageStopTimestamp != null)
        'UsageStopTimestamp': unixTimestampToJson(usageStopTimestamp),
      if (usingDefaultReplicationRegions != null)
        'UsingDefaultReplicationRegions': usingDefaultReplicationRegions,
    };
  }
}

/// The role of the key, the algorithm it supports, and the cryptographic
/// operations allowed with the key. This data is immutable after the key is
/// created.
///
/// @nodoc
class KeyAttributes {
  /// The key algorithm to be use during creation of an Amazon Web Services
  /// Payment Cryptography key.
  ///
  /// For symmetric keys, Amazon Web Services Payment Cryptography supports
  /// <code>AES</code> and <code>TDES</code> algorithms. For asymmetric keys,
  /// Amazon Web Services Payment Cryptography supports <code>RSA</code> and
  /// <code>ECC_NIST</code> algorithms.
  final KeyAlgorithm keyAlgorithm;

  /// The type of Amazon Web Services Payment Cryptography key to create, which
  /// determines the classiﬁcation of the cryptographic method and whether Amazon
  /// Web Services Payment Cryptography key contains a symmetric key or an
  /// asymmetric key pair.
  final KeyClass keyClass;

  /// The list of cryptographic operations that you can perform using the key.
  final KeyModesOfUse keyModesOfUse;

  /// The cryptographic usage of an Amazon Web Services Payment Cryptography key
  /// as deﬁned in section A.5.2 of the TR-31 spec.
  final KeyUsage keyUsage;

  KeyAttributes({
    required this.keyAlgorithm,
    required this.keyClass,
    required this.keyModesOfUse,
    required this.keyUsage,
  });

  factory KeyAttributes.fromJson(Map<String, dynamic> json) {
    return KeyAttributes(
      keyAlgorithm:
          KeyAlgorithm.fromString((json['KeyAlgorithm'] as String?) ?? ''),
      keyClass: KeyClass.fromString((json['KeyClass'] as String?) ?? ''),
      keyModesOfUse: KeyModesOfUse.fromJson(
          (json['KeyModesOfUse'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      keyUsage: KeyUsage.fromString((json['KeyUsage'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final keyAlgorithm = this.keyAlgorithm;
    final keyClass = this.keyClass;
    final keyModesOfUse = this.keyModesOfUse;
    final keyUsage = this.keyUsage;
    return {
      'KeyAlgorithm': keyAlgorithm.value,
      'KeyClass': keyClass.value,
      'KeyModesOfUse': keyModesOfUse,
      'KeyUsage': keyUsage.value,
    };
  }
}

/// @nodoc
class KeyCheckValueAlgorithm {
  static const cmac = KeyCheckValueAlgorithm._('CMAC');
  static const ansiX9_24 = KeyCheckValueAlgorithm._('ANSI_X9_24');
  static const hmac = KeyCheckValueAlgorithm._('HMAC');
  static const sha_1 = KeyCheckValueAlgorithm._('SHA_1');

  final String value;

  const KeyCheckValueAlgorithm._(this.value);

  static const values = [cmac, ansiX9_24, hmac, sha_1];

  static KeyCheckValueAlgorithm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeyCheckValueAlgorithm._(value));

  @override
  bool operator ==(other) =>
      other is KeyCheckValueAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the state of a key
///
/// @nodoc
class KeyState {
  static const createInProgress = KeyState._('CREATE_IN_PROGRESS');
  static const createComplete = KeyState._('CREATE_COMPLETE');
  static const deletePending = KeyState._('DELETE_PENDING');
  static const deleteComplete = KeyState._('DELETE_COMPLETE');

  final String value;

  const KeyState._(this.value);

  static const values = [
    createInProgress,
    createComplete,
    deletePending,
    deleteComplete
  ];

  static KeyState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => KeyState._(value));

  @override
  bool operator ==(other) => other is KeyState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the source of a key
///
/// @nodoc
class KeyOrigin {
  static const external = KeyOrigin._('EXTERNAL');
  static const awsPaymentCryptography = KeyOrigin._('AWS_PAYMENT_CRYPTOGRAPHY');

  final String value;

  const KeyOrigin._(this.value);

  static const values = [external, awsPaymentCryptography];

  static KeyOrigin fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => KeyOrigin._(value));

  @override
  bool operator ==(other) => other is KeyOrigin && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DeriveKeyUsage {
  static const tr31B0BaseDerivationKey =
      DeriveKeyUsage._('TR31_B0_BASE_DERIVATION_KEY');
  static const tr31C0CardVerificationKey =
      DeriveKeyUsage._('TR31_C0_CARD_VERIFICATION_KEY');
  static const tr31D0SymmetricDataEncryptionKey =
      DeriveKeyUsage._('TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY');
  static const tr31E0EmvMkeyAppCryptograms =
      DeriveKeyUsage._('TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS');
  static const tr31E1EmvMkeyConfidentiality =
      DeriveKeyUsage._('TR31_E1_EMV_MKEY_CONFIDENTIALITY');
  static const tr31E2EmvMkeyIntegrity =
      DeriveKeyUsage._('TR31_E2_EMV_MKEY_INTEGRITY');
  static const tr31E4EmvMkeyDynamicNumbers =
      DeriveKeyUsage._('TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS');
  static const tr31E5EmvMkeyCardPersonalization =
      DeriveKeyUsage._('TR31_E5_EMV_MKEY_CARD_PERSONALIZATION');
  static const tr31E6EmvMkeyOther = DeriveKeyUsage._('TR31_E6_EMV_MKEY_OTHER');
  static const tr31K0KeyEncryptionKey =
      DeriveKeyUsage._('TR31_K0_KEY_ENCRYPTION_KEY');
  static const tr31K1KeyBlockProtectionKey =
      DeriveKeyUsage._('TR31_K1_KEY_BLOCK_PROTECTION_KEY');
  static const tr31M3Iso_9797_3MacKey =
      DeriveKeyUsage._('TR31_M3_ISO_9797_3_MAC_KEY');
  static const tr31M1Iso_9797_1MacKey =
      DeriveKeyUsage._('TR31_M1_ISO_9797_1_MAC_KEY');
  static const tr31M6Iso_9797_5CmacKey =
      DeriveKeyUsage._('TR31_M6_ISO_9797_5_CMAC_KEY');
  static const tr31M7HmacKey = DeriveKeyUsage._('TR31_M7_HMAC_KEY');
  static const tr31P0PinEncryptionKey =
      DeriveKeyUsage._('TR31_P0_PIN_ENCRYPTION_KEY');
  static const tr31P1PinGenerationKey =
      DeriveKeyUsage._('TR31_P1_PIN_GENERATION_KEY');
  static const tr31V1Ibm3624PinVerificationKey =
      DeriveKeyUsage._('TR31_V1_IBM3624_PIN_VERIFICATION_KEY');
  static const tr31V2VisaPinVerificationKey =
      DeriveKeyUsage._('TR31_V2_VISA_PIN_VERIFICATION_KEY');

  final String value;

  const DeriveKeyUsage._(this.value);

  static const values = [
    tr31B0BaseDerivationKey,
    tr31C0CardVerificationKey,
    tr31D0SymmetricDataEncryptionKey,
    tr31E0EmvMkeyAppCryptograms,
    tr31E1EmvMkeyConfidentiality,
    tr31E2EmvMkeyIntegrity,
    tr31E4EmvMkeyDynamicNumbers,
    tr31E5EmvMkeyCardPersonalization,
    tr31E6EmvMkeyOther,
    tr31K0KeyEncryptionKey,
    tr31K1KeyBlockProtectionKey,
    tr31M3Iso_9797_3MacKey,
    tr31M1Iso_9797_1MacKey,
    tr31M6Iso_9797_5CmacKey,
    tr31M7HmacKey,
    tr31P0PinEncryptionKey,
    tr31P1PinGenerationKey,
    tr31V1Ibm3624PinVerificationKey,
    tr31V2VisaPinVerificationKey
  ];

  static DeriveKeyUsage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeriveKeyUsage._(value));

  @override
  bool operator ==(other) => other is DeriveKeyUsage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the replication type of a key
///
/// @nodoc
class MultiRegionKeyType {
  static const primary = MultiRegionKeyType._('PRIMARY');
  static const replica = MultiRegionKeyType._('REPLICA');

  final String value;

  const MultiRegionKeyType._(this.value);

  static const values = [primary, replica];

  static MultiRegionKeyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MultiRegionKeyType._(value));

  @override
  bool operator ==(other) =>
      other is MultiRegionKeyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status of an MPA session.
///
/// @nodoc
class MpaStatus {
  /// The date and time when the MPA session was initiated.
  final DateTime initiationDate;

  /// The ARN of the MPA session.
  final String mpaSessionArn;

  /// The current status of the MPA session.
  final SessionStatus status;

  /// The message providing additional information about the MPA session status.
  final String? statusMessage;

  MpaStatus({
    required this.initiationDate,
    required this.mpaSessionArn,
    required this.status,
    this.statusMessage,
  });

  factory MpaStatus.fromJson(Map<String, dynamic> json) {
    return MpaStatus(
      initiationDate: nonNullableTimeStampFromJson(json['InitiationDate'] ?? 0),
      mpaSessionArn: (json['MpaSessionArn'] as String?) ?? '',
      status: SessionStatus.fromString((json['Status'] as String?) ?? ''),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final initiationDate = this.initiationDate;
    final mpaSessionArn = this.mpaSessionArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'InitiationDate': unixTimestampToJson(initiationDate),
      'MpaSessionArn': mpaSessionArn,
      'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class SessionStatus {
  static const pending = SessionStatus._('PENDING');
  static const approved = SessionStatus._('APPROVED');
  static const failed = SessionStatus._('FAILED');
  static const cancelled = SessionStatus._('CANCELLED');

  final String value;

  const SessionStatus._(this.value);

  static const values = [pending, approved, failed, cancelled];

  static SessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionStatus._(value));

  @override
  bool operator ==(other) => other is SessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the replication status information for a key in a replication
/// region for <a
/// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
/// key replication</a>.
///
/// This structure contains details about the current state of key replication,
/// including any status messages and operational information about the
/// replication process.
///
/// @nodoc
class ReplicationStatusType {
  /// The current status of key replication in this Amazon Web Services Region.
  ///
  /// This field indicates whether the key replication is in progress, completed
  /// successfully, or has encountered an error. Possible values include states
  /// such as <code>SYNCRHONIZED</code>, <code>IN_PROGRESS</code>,
  /// <code>DELETE_IN_PROGRESS</code>, or <code>FAILED</code>. This provides
  /// visibility into the replication process for monitoring and troubleshooting
  /// purposes.
  final KeyReplicationState status;

  /// A message that provides additional information about the current replication
  /// status of the key.
  ///
  /// This field contains details about any issues or progress updates related to
  /// key replication operations. It may include information about replication
  /// failures, synchronization status, or other operational details.
  final String? statusMessage;

  ReplicationStatusType({
    required this.status,
    this.statusMessage,
  });

  factory ReplicationStatusType.fromJson(Map<String, dynamic> json) {
    return ReplicationStatusType(
      status: KeyReplicationState.fromString((json['Status'] as String?) ?? ''),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Defines the replication state of a key
///
/// @nodoc
class KeyReplicationState {
  static const inProgress = KeyReplicationState._('IN_PROGRESS');
  static const deleteInProgress = KeyReplicationState._('DELETE_IN_PROGRESS');
  static const failed = KeyReplicationState._('FAILED');
  static const synchronized = KeyReplicationState._('SYNCHRONIZED');

  final String value;

  const KeyReplicationState._(this.value);

  static const values = [inProgress, deleteInProgress, failed, synchronized];

  static KeyReplicationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeyReplicationState._(value));

  @override
  bool operator ==(other) =>
      other is KeyReplicationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyUsage {
  static const tr31B0BaseDerivationKey =
      KeyUsage._('TR31_B0_BASE_DERIVATION_KEY');
  static const tr31C0CardVerificationKey =
      KeyUsage._('TR31_C0_CARD_VERIFICATION_KEY');
  static const tr31D0SymmetricDataEncryptionKey =
      KeyUsage._('TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY');
  static const tr31D1AsymmetricKeyForDataEncryption =
      KeyUsage._('TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION');
  static const tr31E0EmvMkeyAppCryptograms =
      KeyUsage._('TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS');
  static const tr31E1EmvMkeyConfidentiality =
      KeyUsage._('TR31_E1_EMV_MKEY_CONFIDENTIALITY');
  static const tr31E2EmvMkeyIntegrity =
      KeyUsage._('TR31_E2_EMV_MKEY_INTEGRITY');
  static const tr31E4EmvMkeyDynamicNumbers =
      KeyUsage._('TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS');
  static const tr31E5EmvMkeyCardPersonalization =
      KeyUsage._('TR31_E5_EMV_MKEY_CARD_PERSONALIZATION');
  static const tr31E6EmvMkeyOther = KeyUsage._('TR31_E6_EMV_MKEY_OTHER');
  static const tr31K0KeyEncryptionKey =
      KeyUsage._('TR31_K0_KEY_ENCRYPTION_KEY');
  static const tr31K1KeyBlockProtectionKey =
      KeyUsage._('TR31_K1_KEY_BLOCK_PROTECTION_KEY');
  static const tr31K3AsymmetricKeyForKeyAgreement =
      KeyUsage._('TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT');
  static const tr31M0Iso_16609MacKey = KeyUsage._('TR31_M0_ISO_16609_MAC_KEY');
  static const tr31M3Iso_9797_3MacKey =
      KeyUsage._('TR31_M3_ISO_9797_3_MAC_KEY');
  static const tr31M1Iso_9797_1MacKey =
      KeyUsage._('TR31_M1_ISO_9797_1_MAC_KEY');
  static const tr31M6Iso_9797_5CmacKey =
      KeyUsage._('TR31_M6_ISO_9797_5_CMAC_KEY');
  static const tr31M7HmacKey = KeyUsage._('TR31_M7_HMAC_KEY');
  static const tr31P0PinEncryptionKey =
      KeyUsage._('TR31_P0_PIN_ENCRYPTION_KEY');
  static const tr31P1PinGenerationKey =
      KeyUsage._('TR31_P1_PIN_GENERATION_KEY');
  static const tr31S0AsymmetricKeyForDigitalSignature =
      KeyUsage._('TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE');
  static const tr31V1Ibm3624PinVerificationKey =
      KeyUsage._('TR31_V1_IBM3624_PIN_VERIFICATION_KEY');
  static const tr31V2VisaPinVerificationKey =
      KeyUsage._('TR31_V2_VISA_PIN_VERIFICATION_KEY');
  static const tr31K2Tr34AsymmetricKey =
      KeyUsage._('TR31_K2_TR34_ASYMMETRIC_KEY');

  final String value;

  const KeyUsage._(this.value);

  static const values = [
    tr31B0BaseDerivationKey,
    tr31C0CardVerificationKey,
    tr31D0SymmetricDataEncryptionKey,
    tr31D1AsymmetricKeyForDataEncryption,
    tr31E0EmvMkeyAppCryptograms,
    tr31E1EmvMkeyConfidentiality,
    tr31E2EmvMkeyIntegrity,
    tr31E4EmvMkeyDynamicNumbers,
    tr31E5EmvMkeyCardPersonalization,
    tr31E6EmvMkeyOther,
    tr31K0KeyEncryptionKey,
    tr31K1KeyBlockProtectionKey,
    tr31K3AsymmetricKeyForKeyAgreement,
    tr31M0Iso_16609MacKey,
    tr31M3Iso_9797_3MacKey,
    tr31M1Iso_9797_1MacKey,
    tr31M6Iso_9797_5CmacKey,
    tr31M7HmacKey,
    tr31P0PinEncryptionKey,
    tr31P1PinGenerationKey,
    tr31S0AsymmetricKeyForDigitalSignature,
    tr31V1Ibm3624PinVerificationKey,
    tr31V2VisaPinVerificationKey,
    tr31K2Tr34AsymmetricKey
  ];

  static KeyUsage fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => KeyUsage._(value));

  @override
  bool operator ==(other) => other is KeyUsage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyClass {
  static const symmetricKey = KeyClass._('SYMMETRIC_KEY');
  static const asymmetricKeyPair = KeyClass._('ASYMMETRIC_KEY_PAIR');
  static const privateKey = KeyClass._('PRIVATE_KEY');
  static const publicKey = KeyClass._('PUBLIC_KEY');

  final String value;

  const KeyClass._(this.value);

  static const values = [
    symmetricKey,
    asymmetricKeyPair,
    privateKey,
    publicKey
  ];

  static KeyClass fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => KeyClass._(value));

  @override
  bool operator ==(other) => other is KeyClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyAlgorithm {
  static const tdes_2key = KeyAlgorithm._('TDES_2KEY');
  static const tdes_3key = KeyAlgorithm._('TDES_3KEY');
  static const aes_128 = KeyAlgorithm._('AES_128');
  static const aes_192 = KeyAlgorithm._('AES_192');
  static const aes_256 = KeyAlgorithm._('AES_256');
  static const hmacSha256 = KeyAlgorithm._('HMAC_SHA256');
  static const hmacSha384 = KeyAlgorithm._('HMAC_SHA384');
  static const hmacSha512 = KeyAlgorithm._('HMAC_SHA512');
  static const hmacSha224 = KeyAlgorithm._('HMAC_SHA224');
  static const rsa_2048 = KeyAlgorithm._('RSA_2048');
  static const rsa_3072 = KeyAlgorithm._('RSA_3072');
  static const rsa_4096 = KeyAlgorithm._('RSA_4096');
  static const eccNistP256 = KeyAlgorithm._('ECC_NIST_P256');
  static const eccNistP384 = KeyAlgorithm._('ECC_NIST_P384');
  static const eccNistP521 = KeyAlgorithm._('ECC_NIST_P521');

  final String value;

  const KeyAlgorithm._(this.value);

  static const values = [
    tdes_2key,
    tdes_3key,
    aes_128,
    aes_192,
    aes_256,
    hmacSha256,
    hmacSha384,
    hmacSha512,
    hmacSha224,
    rsa_2048,
    rsa_3072,
    rsa_4096,
    eccNistP256,
    eccNistP384,
    eccNistP521
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

/// The list of cryptographic operations that you can perform using the key. The
/// modes of use are deﬁned in section A.5.3 of the TR-31 spec.
///
/// @nodoc
class KeyModesOfUse {
  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// to decrypt data.
  final bool? decrypt;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// to derive new keys.
  final bool? deriveKey;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// to encrypt data.
  final bool? encrypt;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// to generate and verify other card and PIN verification keys.
  final bool? generate;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key has no
  /// special restrictions other than the restrictions implied by
  /// <code>KeyUsage</code>.
  final bool? noRestrictions;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// for signing.
  final bool? sign;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// to unwrap other keys.
  final bool? unwrap;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// to verify signatures.
  final bool? verify;

  /// Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used
  /// to wrap other keys.
  final bool? wrap;

  KeyModesOfUse({
    this.decrypt,
    this.deriveKey,
    this.encrypt,
    this.generate,
    this.noRestrictions,
    this.sign,
    this.unwrap,
    this.verify,
    this.wrap,
  });

  factory KeyModesOfUse.fromJson(Map<String, dynamic> json) {
    return KeyModesOfUse(
      decrypt: json['Decrypt'] as bool?,
      deriveKey: json['DeriveKey'] as bool?,
      encrypt: json['Encrypt'] as bool?,
      generate: json['Generate'] as bool?,
      noRestrictions: json['NoRestrictions'] as bool?,
      sign: json['Sign'] as bool?,
      unwrap: json['Unwrap'] as bool?,
      verify: json['Verify'] as bool?,
      wrap: json['Wrap'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final decrypt = this.decrypt;
    final deriveKey = this.deriveKey;
    final encrypt = this.encrypt;
    final generate = this.generate;
    final noRestrictions = this.noRestrictions;
    final sign = this.sign;
    final unwrap = this.unwrap;
    final verify = this.verify;
    final wrap = this.wrap;
    return {
      if (decrypt != null) 'Decrypt': decrypt,
      if (deriveKey != null) 'DeriveKey': deriveKey,
      if (encrypt != null) 'Encrypt': encrypt,
      if (generate != null) 'Generate': generate,
      if (noRestrictions != null) 'NoRestrictions': noRestrictions,
      if (sign != null) 'Sign': sign,
      if (unwrap != null) 'Unwrap': unwrap,
      if (verify != null) 'Verify': verify,
      if (wrap != null) 'Wrap': wrap,
    };
  }
}

/// Metadata about an Amazon Web Services Payment Cryptography key.
///
/// @nodoc
class KeySummary {
  /// Specifies whether the key is enabled.
  final bool enabled;

  /// Specifies whether the key is exportable. This data is immutable after the
  /// key is created.
  final bool exportable;

  /// The Amazon Resource Name (ARN) of the key.
  final String keyArn;

  /// The role of the key, the algorithm it supports, and the cryptographic
  /// operations allowed with the key. This data is immutable after the key is
  /// created.
  final KeyAttributes keyAttributes;

  /// The key check value (KCV) is used to check if all parties holding a given
  /// key have the same key or to detect that a key has changed.
  final String keyCheckValue;

  /// The state of an Amazon Web Services Payment Cryptography that is being
  /// created or deleted.
  final KeyState keyState;

  /// Indicates whether this key is a Multi-Region key and its role in the
  /// Multi-Region key hierarchy.
  ///
  /// Multi-Region replication keys allow the same key material to be used across
  /// multiple Amazon Web Services Regions. This field specifies whether the key
  /// is a Primary Region key (PRK) (which can be replicated to other Amazon Web
  /// Services Regions) or a Replica Region key (RRK) (which is a copy of a PRK in
  /// another Region). For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-multi-region-replication.html">Multi-Region
  /// key replication</a>.
  final MultiRegionKeyType? multiRegionKeyType;
  final String? primaryRegion;

  KeySummary({
    required this.enabled,
    required this.exportable,
    required this.keyArn,
    required this.keyAttributes,
    required this.keyCheckValue,
    required this.keyState,
    this.multiRegionKeyType,
    this.primaryRegion,
  });

  factory KeySummary.fromJson(Map<String, dynamic> json) {
    return KeySummary(
      enabled: (json['Enabled'] as bool?) ?? false,
      exportable: (json['Exportable'] as bool?) ?? false,
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyAttributes: KeyAttributes.fromJson(
          (json['KeyAttributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      keyState: KeyState.fromString((json['KeyState'] as String?) ?? ''),
      multiRegionKeyType: (json['MultiRegionKeyType'] as String?)
          ?.let(MultiRegionKeyType.fromString),
      primaryRegion: json['PrimaryRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final exportable = this.exportable;
    final keyArn = this.keyArn;
    final keyAttributes = this.keyAttributes;
    final keyCheckValue = this.keyCheckValue;
    final keyState = this.keyState;
    final multiRegionKeyType = this.multiRegionKeyType;
    final primaryRegion = this.primaryRegion;
    return {
      'Enabled': enabled,
      'Exportable': exportable,
      'KeyArn': keyArn,
      'KeyAttributes': keyAttributes,
      'KeyCheckValue': keyCheckValue,
      'KeyState': keyState.value,
      if (multiRegionKeyType != null)
        'MultiRegionKeyType': multiRegionKeyType.value,
      if (primaryRegion != null) 'PrimaryRegion': primaryRegion,
    };
  }
}

/// A structure that contains information about a tag.
///
/// @nodoc
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// Contains information about an alias.
///
/// @nodoc
class Alias {
  /// A friendly name that you can use to refer to a key. The value must begin
  /// with <code>alias/</code>.
  /// <important>
  /// Do not include confidential or sensitive information in this field. This
  /// field may be displayed in plaintext in CloudTrail logs and other output.
  /// </important>
  final String aliasName;

  /// The <code>KeyARN</code> of the key associated with the alias.
  final String? keyArn;

  Alias({
    required this.aliasName,
    this.keyArn,
  });

  factory Alias.fromJson(Map<String, dynamic> json) {
    return Alias(
      aliasName: (json['AliasName'] as String?) ?? '',
      keyArn: json['KeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasName = this.aliasName;
    final keyArn = this.keyArn;
    return {
      'AliasName': aliasName,
      if (keyArn != null) 'KeyArn': keyArn,
    };
  }
}

/// Parameter information for key material import into Amazon Web Services
/// Payment Cryptography using TR-31 or TR-34 or RSA wrap and unwrap key
/// exchange method.
///
/// @nodoc
class ImportKeyMaterial {
  /// Parameter information for key material import using AS2805 key cryptogram
  /// format.
  final ImportAs2805KeyCryptogram? as2805KeyCryptogram;

  /// Key derivation parameter information for key material import using
  /// asymmetric ECDH key exchange method.
  final ImportDiffieHellmanTr31KeyBlock? diffieHellmanTr31KeyBlock;

  /// Parameter information for key material import using asymmetric RSA wrap and
  /// unwrap key exchange method.
  final ImportKeyCryptogram? keyCryptogram;

  /// Parameter information for root public key certificate import.
  final RootCertificatePublicKey? rootCertificatePublicKey;

  /// Parameter information for key material import using symmetric TR-31 key
  /// exchange method.
  final ImportTr31KeyBlock? tr31KeyBlock;

  /// Parameter information for key material import using the asymmetric TR-34 key
  /// exchange method.
  final ImportTr34KeyBlock? tr34KeyBlock;

  /// Parameter information for trusted public key certificate import.
  final TrustedCertificatePublicKey? trustedCertificatePublicKey;

  ImportKeyMaterial({
    this.as2805KeyCryptogram,
    this.diffieHellmanTr31KeyBlock,
    this.keyCryptogram,
    this.rootCertificatePublicKey,
    this.tr31KeyBlock,
    this.tr34KeyBlock,
    this.trustedCertificatePublicKey,
  });

  Map<String, dynamic> toJson() {
    final as2805KeyCryptogram = this.as2805KeyCryptogram;
    final diffieHellmanTr31KeyBlock = this.diffieHellmanTr31KeyBlock;
    final keyCryptogram = this.keyCryptogram;
    final rootCertificatePublicKey = this.rootCertificatePublicKey;
    final tr31KeyBlock = this.tr31KeyBlock;
    final tr34KeyBlock = this.tr34KeyBlock;
    final trustedCertificatePublicKey = this.trustedCertificatePublicKey;
    return {
      if (as2805KeyCryptogram != null)
        'As2805KeyCryptogram': as2805KeyCryptogram,
      if (diffieHellmanTr31KeyBlock != null)
        'DiffieHellmanTr31KeyBlock': diffieHellmanTr31KeyBlock,
      if (keyCryptogram != null) 'KeyCryptogram': keyCryptogram,
      if (rootCertificatePublicKey != null)
        'RootCertificatePublicKey': rootCertificatePublicKey,
      if (tr31KeyBlock != null) 'Tr31KeyBlock': tr31KeyBlock,
      if (tr34KeyBlock != null) 'Tr34KeyBlock': tr34KeyBlock,
      if (trustedCertificatePublicKey != null)
        'TrustedCertificatePublicKey': trustedCertificatePublicKey,
    };
  }
}

/// Parameter information for root public key certificate import.
///
/// @nodoc
class RootCertificatePublicKey {
  /// The role of the key, the algorithm it supports, and the cryptographic
  /// operations allowed with the key. This data is immutable after the root
  /// public key is imported.
  final KeyAttributes keyAttributes;

  /// Parameter information for root public key certificate import.
  final String publicKeyCertificate;

  RootCertificatePublicKey({
    required this.keyAttributes,
    required this.publicKeyCertificate,
  });

  Map<String, dynamic> toJson() {
    final keyAttributes = this.keyAttributes;
    final publicKeyCertificate = this.publicKeyCertificate;
    return {
      'KeyAttributes': keyAttributes,
      'PublicKeyCertificate': publicKeyCertificate,
    };
  }
}

/// Parameter information for trusted public key certificate import.
///
/// @nodoc
class TrustedCertificatePublicKey {
  /// The <code>KeyARN</code> of the root public key certificate or certificate
  /// chain that signs the trusted public key certificate import.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The role of the key, the algorithm it supports, and the cryptographic
  /// operations allowed with the key. This data is immutable after a trusted
  /// public key is imported.
  final KeyAttributes keyAttributes;

  /// Parameter information for trusted public key certificate import.
  final String publicKeyCertificate;

  TrustedCertificatePublicKey({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.keyAttributes,
    required this.publicKeyCertificate,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final keyAttributes = this.keyAttributes;
    final publicKeyCertificate = this.publicKeyCertificate;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'KeyAttributes': keyAttributes,
      'PublicKeyCertificate': publicKeyCertificate,
    };
  }
}

/// Parameter information for key material import using symmetric TR-31 key
/// exchange method.
///
/// @nodoc
class ImportTr31KeyBlock {
  /// The TR-31 wrapped key block to import.
  final String wrappedKeyBlock;

  /// The <code>KeyARN</code> of the key that will decrypt or unwrap a TR-31 key
  /// block during import.
  final String wrappingKeyIdentifier;

  ImportTr31KeyBlock({
    required this.wrappedKeyBlock,
    required this.wrappingKeyIdentifier,
  });

  Map<String, dynamic> toJson() {
    final wrappedKeyBlock = this.wrappedKeyBlock;
    final wrappingKeyIdentifier = this.wrappingKeyIdentifier;
    return {
      'WrappedKeyBlock': wrappedKeyBlock,
      'WrappingKeyIdentifier': wrappingKeyIdentifier,
    };
  }
}

/// Parameter information for key material import using the asymmetric TR-34 key
/// exchange method.
///
/// @nodoc
class ImportTr34KeyBlock {
  /// The <code>KeyARN</code> of the certificate chain that signs the signing key
  /// certificate during TR-34 key import.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The key block format to use during key import. The only value allowed is
  /// <code>X9_TR34_2012</code>.
  final Tr34KeyBlockFormat keyBlockFormat;

  /// The public key component in PEM certificate format of the private key that
  /// signs the KDH TR-34 WrappedKeyBlock.
  final String signingKeyCertificate;

  /// The TR-34 wrapped key block to import.
  final String wrappedKeyBlock;

  /// The import token that initiates key import using the asymmetric TR-34 key
  /// exchange method into Amazon Web Services Payment Cryptography. It expires
  /// after 30 days. You can use the same import token to import multiple keys to
  /// the same service account.
  final String? importToken;

  /// A random number value that is unique to the TR-34 key block generated using
  /// 2 pass. The operation will fail, if a random nonce value is not provided for
  /// a TR-34 key block generated using 2 pass.
  final String? randomNonce;

  /// The certificate used to wrap the TR-34 key block.
  final String? wrappingKeyCertificate;

  /// Key Identifier used for unwrapping the import key
  final String? wrappingKeyIdentifier;

  ImportTr34KeyBlock({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.keyBlockFormat,
    required this.signingKeyCertificate,
    required this.wrappedKeyBlock,
    this.importToken,
    this.randomNonce,
    this.wrappingKeyCertificate,
    this.wrappingKeyIdentifier,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final keyBlockFormat = this.keyBlockFormat;
    final signingKeyCertificate = this.signingKeyCertificate;
    final wrappedKeyBlock = this.wrappedKeyBlock;
    final importToken = this.importToken;
    final randomNonce = this.randomNonce;
    final wrappingKeyCertificate = this.wrappingKeyCertificate;
    final wrappingKeyIdentifier = this.wrappingKeyIdentifier;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'KeyBlockFormat': keyBlockFormat.value,
      'SigningKeyCertificate': signingKeyCertificate,
      'WrappedKeyBlock': wrappedKeyBlock,
      if (importToken != null) 'ImportToken': importToken,
      if (randomNonce != null) 'RandomNonce': randomNonce,
      if (wrappingKeyCertificate != null)
        'WrappingKeyCertificate': wrappingKeyCertificate,
      if (wrappingKeyIdentifier != null)
        'WrappingKeyIdentifier': wrappingKeyIdentifier,
    };
  }
}

/// Parameter information for key material import using asymmetric RSA wrap and
/// unwrap key exchange method.
///
/// @nodoc
class ImportKeyCryptogram {
  /// Specifies whether the key is exportable from the service.
  final bool exportable;

  /// The import token that initiates key import using the asymmetric RSA wrap and
  /// unwrap key exchange method into AWS Payment Cryptography. It expires after
  /// 30 days. You can use the same import token to import multiple keys to the
  /// same service account.
  final String importToken;
  final KeyAttributes keyAttributes;

  /// The RSA wrapped key cryptogram under import.
  final String wrappedKeyCryptogram;

  /// The wrapping spec for the wrapped key cryptogram.
  final WrappingKeySpec? wrappingSpec;

  ImportKeyCryptogram({
    required this.exportable,
    required this.importToken,
    required this.keyAttributes,
    required this.wrappedKeyCryptogram,
    this.wrappingSpec,
  });

  Map<String, dynamic> toJson() {
    final exportable = this.exportable;
    final importToken = this.importToken;
    final keyAttributes = this.keyAttributes;
    final wrappedKeyCryptogram = this.wrappedKeyCryptogram;
    final wrappingSpec = this.wrappingSpec;
    return {
      'Exportable': exportable,
      'ImportToken': importToken,
      'KeyAttributes': keyAttributes,
      'WrappedKeyCryptogram': wrappedKeyCryptogram,
      if (wrappingSpec != null) 'WrappingSpec': wrappingSpec.value,
    };
  }
}

/// Key derivation parameter information for key material import using
/// asymmetric ECDH key exchange method.
///
/// @nodoc
class ImportDiffieHellmanTr31KeyBlock {
  /// The <code>keyARN</code> of the CA that signed the
  /// <code>PublicKeyCertificate</code> for the client's receiving ECC key pair.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The shared information used when deriving a key using ECDH.
  final DiffieHellmanDerivationData derivationData;

  /// The key algorithm of the shared derived ECDH key.
  final SymmetricKeyAlgorithm deriveKeyAlgorithm;

  /// The key derivation function to use when deriving a key using ECDH.
  final KeyDerivationFunction keyDerivationFunction;

  /// The hash type to use when deriving a key using ECDH.
  final KeyDerivationHashAlgorithm keyDerivationHashAlgorithm;

  /// The <code>keyARN</code> of the asymmetric ECC key created within Amazon Web
  /// Services Payment Cryptography.
  final String privateKeyIdentifier;

  /// The public key certificate of the client's receiving ECC key pair, in PEM
  /// format (base64 encoded), to use for ECDH key derivation.
  final String publicKeyCertificate;

  /// The ECDH wrapped key block to import.
  final String wrappedKeyBlock;

  ImportDiffieHellmanTr31KeyBlock({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.derivationData,
    required this.deriveKeyAlgorithm,
    required this.keyDerivationFunction,
    required this.keyDerivationHashAlgorithm,
    required this.privateKeyIdentifier,
    required this.publicKeyCertificate,
    required this.wrappedKeyBlock,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final derivationData = this.derivationData;
    final deriveKeyAlgorithm = this.deriveKeyAlgorithm;
    final keyDerivationFunction = this.keyDerivationFunction;
    final keyDerivationHashAlgorithm = this.keyDerivationHashAlgorithm;
    final privateKeyIdentifier = this.privateKeyIdentifier;
    final publicKeyCertificate = this.publicKeyCertificate;
    final wrappedKeyBlock = this.wrappedKeyBlock;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'DerivationData': derivationData,
      'DeriveKeyAlgorithm': deriveKeyAlgorithm.value,
      'KeyDerivationFunction': keyDerivationFunction.value,
      'KeyDerivationHashAlgorithm': keyDerivationHashAlgorithm.value,
      'PrivateKeyIdentifier': privateKeyIdentifier,
      'PublicKeyCertificate': publicKeyCertificate,
      'WrappedKeyBlock': wrappedKeyBlock,
    };
  }
}

/// Parameter information for key material import using AS2805 key cryptogram
/// format.
///
/// @nodoc
class ImportAs2805KeyCryptogram {
  /// The cryptographic usage of the key under import.
  final As2805KeyVariant as2805KeyVariant;

  /// Specified whether the key is exportable. This data is immutable after the
  /// key is imported.
  final bool exportable;

  /// The key algorithm of the key under import.
  final KeyAlgorithm keyAlgorithm;
  final KeyModesOfUse keyModesOfUse;

  /// The wrapped key cryptogram under import.
  final String wrappedKeyCryptogram;
  final String wrappingKeyIdentifier;

  ImportAs2805KeyCryptogram({
    required this.as2805KeyVariant,
    required this.exportable,
    required this.keyAlgorithm,
    required this.keyModesOfUse,
    required this.wrappedKeyCryptogram,
    required this.wrappingKeyIdentifier,
  });

  Map<String, dynamic> toJson() {
    final as2805KeyVariant = this.as2805KeyVariant;
    final exportable = this.exportable;
    final keyAlgorithm = this.keyAlgorithm;
    final keyModesOfUse = this.keyModesOfUse;
    final wrappedKeyCryptogram = this.wrappedKeyCryptogram;
    final wrappingKeyIdentifier = this.wrappingKeyIdentifier;
    return {
      'As2805KeyVariant': as2805KeyVariant.value,
      'Exportable': exportable,
      'KeyAlgorithm': keyAlgorithm.value,
      'KeyModesOfUse': keyModesOfUse,
      'WrappedKeyCryptogram': wrappedKeyCryptogram,
      'WrappingKeyIdentifier': wrappingKeyIdentifier,
    };
  }
}

/// @nodoc
class As2805KeyVariant {
  static const terminalMajorKeyVariant_00 =
      As2805KeyVariant._('TERMINAL_MAJOR_KEY_VARIANT_00');
  static const pinEncryptionKeyVariant_28 =
      As2805KeyVariant._('PIN_ENCRYPTION_KEY_VARIANT_28');
  static const messageAuthenticationKeyVariant_24 =
      As2805KeyVariant._('MESSAGE_AUTHENTICATION_KEY_VARIANT_24');
  static const dataEncryptionKeyVariant_22 =
      As2805KeyVariant._('DATA_ENCRYPTION_KEY_VARIANT_22');

  final String value;

  const As2805KeyVariant._(this.value);

  static const values = [
    terminalMajorKeyVariant_00,
    pinEncryptionKeyVariant_28,
    messageAuthenticationKeyVariant_24,
    dataEncryptionKeyVariant_22
  ];

  static As2805KeyVariant fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => As2805KeyVariant._(value));

  @override
  bool operator ==(other) => other is As2805KeyVariant && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SymmetricKeyAlgorithm {
  static const tdes_2key = SymmetricKeyAlgorithm._('TDES_2KEY');
  static const tdes_3key = SymmetricKeyAlgorithm._('TDES_3KEY');
  static const aes_128 = SymmetricKeyAlgorithm._('AES_128');
  static const aes_192 = SymmetricKeyAlgorithm._('AES_192');
  static const aes_256 = SymmetricKeyAlgorithm._('AES_256');
  static const hmacSha256 = SymmetricKeyAlgorithm._('HMAC_SHA256');
  static const hmacSha384 = SymmetricKeyAlgorithm._('HMAC_SHA384');
  static const hmacSha512 = SymmetricKeyAlgorithm._('HMAC_SHA512');
  static const hmacSha224 = SymmetricKeyAlgorithm._('HMAC_SHA224');

  final String value;

  const SymmetricKeyAlgorithm._(this.value);

  static const values = [
    tdes_2key,
    tdes_3key,
    aes_128,
    aes_192,
    aes_256,
    hmacSha256,
    hmacSha384,
    hmacSha512,
    hmacSha224
  ];

  static SymmetricKeyAlgorithm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SymmetricKeyAlgorithm._(value));

  @override
  bool operator ==(other) =>
      other is SymmetricKeyAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyDerivationFunction {
  static const nistSp800 = KeyDerivationFunction._('NIST_SP800');
  static const ansiX963 = KeyDerivationFunction._('ANSI_X963');

  final String value;

  const KeyDerivationFunction._(this.value);

  static const values = [nistSp800, ansiX963];

  static KeyDerivationFunction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeyDerivationFunction._(value));

  @override
  bool operator ==(other) =>
      other is KeyDerivationFunction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyDerivationHashAlgorithm {
  static const sha_256 = KeyDerivationHashAlgorithm._('SHA_256');
  static const sha_384 = KeyDerivationHashAlgorithm._('SHA_384');
  static const sha_512 = KeyDerivationHashAlgorithm._('SHA_512');

  final String value;

  const KeyDerivationHashAlgorithm._(this.value);

  static const values = [sha_256, sha_384, sha_512];

  static KeyDerivationHashAlgorithm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeyDerivationHashAlgorithm._(value));

  @override
  bool operator ==(other) =>
      other is KeyDerivationHashAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The shared information used when deriving a key using ECDH.
///
/// @nodoc
class DiffieHellmanDerivationData {
  /// A string containing information that binds the ECDH derived key to the two
  /// parties involved or to the context of the key.
  ///
  /// It may include details like identities of the two parties deriving the key,
  /// context of the operation, session IDs, and optionally a nonce. It must not
  /// contain zero bytes. It is not recommended to reuse shared information for
  /// multiple ECDH key derivations, as it could result in derived key material
  /// being the same across different derivations.
  final String? sharedInformation;

  DiffieHellmanDerivationData({
    this.sharedInformation,
  });

  Map<String, dynamic> toJson() {
    final sharedInformation = this.sharedInformation;
    return {
      if (sharedInformation != null) 'SharedInformation': sharedInformation,
    };
  }
}

/// @nodoc
class WrappingKeySpec {
  static const rsaOaepSha_256 = WrappingKeySpec._('RSA_OAEP_SHA_256');
  static const rsaOaepSha_512 = WrappingKeySpec._('RSA_OAEP_SHA_512');

  final String value;

  const WrappingKeySpec._(this.value);

  static const values = [rsaOaepSha_256, rsaOaepSha_512];

  static WrappingKeySpec fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WrappingKeySpec._(value));

  @override
  bool operator ==(other) => other is WrappingKeySpec && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Tr34KeyBlockFormat {
  static const x9Tr34_2012 = Tr34KeyBlockFormat._('X9_TR34_2012');

  final String value;

  const Tr34KeyBlockFormat._(this.value);

  static const values = [x9Tr34_2012];

  static Tr34KeyBlockFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Tr34KeyBlockFormat._(value));

  @override
  bool operator ==(other) =>
      other is Tr34KeyBlockFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyMaterialType {
  static const tr34KeyBlock = KeyMaterialType._('TR34_KEY_BLOCK');
  static const tr31KeyBlock = KeyMaterialType._('TR31_KEY_BLOCK');
  static const rootPublicKeyCertificate =
      KeyMaterialType._('ROOT_PUBLIC_KEY_CERTIFICATE');
  static const trustedPublicKeyCertificate =
      KeyMaterialType._('TRUSTED_PUBLIC_KEY_CERTIFICATE');
  static const keyCryptogram = KeyMaterialType._('KEY_CRYPTOGRAM');

  final String value;

  const KeyMaterialType._(this.value);

  static const values = [
    tr34KeyBlock,
    tr31KeyBlock,
    rootPublicKeyCertificate,
    trustedPublicKeyCertificate,
    keyCryptogram
  ];

  static KeyMaterialType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeyMaterialType._(value));

  @override
  bool operator ==(other) => other is KeyMaterialType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of an MPA team association with a protected operation.
///
/// @nodoc
class MpaTeamAssociation {
  /// The protected operation associated with the MPA team.
  final MpaOperation action;

  /// The state of the MPA team association.
  final AssociationState associationState;

  /// The ARN of the MPA team.
  final String mpaTeamArn;

  /// The MPA session status for the association, if applicable.
  final MpaStatus? mpaStatus;

  MpaTeamAssociation({
    required this.action,
    required this.associationState,
    required this.mpaTeamArn,
    this.mpaStatus,
  });

  factory MpaTeamAssociation.fromJson(Map<String, dynamic> json) {
    return MpaTeamAssociation(
      action: MpaOperation.fromString((json['Action'] as String?) ?? ''),
      associationState: AssociationState.fromString(
          (json['AssociationState'] as String?) ?? ''),
      mpaTeamArn: (json['MpaTeamArn'] as String?) ?? '',
      mpaStatus: json['MpaStatus'] != null
          ? MpaStatus.fromJson(json['MpaStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final associationState = this.associationState;
    final mpaTeamArn = this.mpaTeamArn;
    final mpaStatus = this.mpaStatus;
    return {
      'Action': action.value,
      'AssociationState': associationState.value,
      'MpaTeamArn': mpaTeamArn,
      if (mpaStatus != null) 'MpaStatus': mpaStatus,
    };
  }
}

/// @nodoc
class MpaOperation {
  static const importRootPublicKeyCertificate =
      MpaOperation._('IMPORT_ROOT_PUBLIC_KEY_CERTIFICATE');

  final String value;

  const MpaOperation._(this.value);

  static const values = [importRootPublicKeyCertificate];

  static MpaOperation fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MpaOperation._(value));

  @override
  bool operator ==(other) => other is MpaOperation && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AssociationState {
  static const active = AssociationState._('ACTIVE');
  static const updatePending = AssociationState._('UPDATE_PENDING');
  static const deletePending = AssociationState._('DELETE_PENDING');

  final String value;

  const AssociationState._(this.value);

  static const values = [active, updatePending, deletePending];

  static AssociationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssociationState._(value));

  @override
  bool operator ==(other) => other is AssociationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the Algorithm used to generate the certificate signing request
///
/// @nodoc
class SigningAlgorithmType {
  static const sha224 = SigningAlgorithmType._('SHA224');
  static const sha256 = SigningAlgorithmType._('SHA256');
  static const sha384 = SigningAlgorithmType._('SHA384');
  static const sha512 = SigningAlgorithmType._('SHA512');

  final String value;

  const SigningAlgorithmType._(this.value);

  static const values = [sha224, sha256, sha384, sha512];

  static SigningAlgorithmType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SigningAlgorithmType._(value));

  @override
  bool operator ==(other) =>
      other is SigningAlgorithmType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The metadata used to create the certificate signing request.
///
/// @nodoc
class CertificateSubjectType {
  /// The name you provide to create the certificate signing request.
  final String commonName;

  /// The city you provide to create the certificate signing request.
  final String? city;

  /// The country you provide to create the certificate signing request.
  final String? country;

  /// The email address you provide to create the certificate signing request.
  final String? emailAddress;

  /// The organization you provide to create the certificate signing request.
  final String? organization;

  /// The organization unit you provide to create the certificate signing request.
  final String? organizationUnit;

  /// The state or province you provide to create the certificate signing request.
  final String? stateOrProvince;

  CertificateSubjectType({
    required this.commonName,
    this.city,
    this.country,
    this.emailAddress,
    this.organization,
    this.organizationUnit,
    this.stateOrProvince,
  });

  Map<String, dynamic> toJson() {
    final commonName = this.commonName;
    final city = this.city;
    final country = this.country;
    final emailAddress = this.emailAddress;
    final organization = this.organization;
    final organizationUnit = this.organizationUnit;
    final stateOrProvince = this.stateOrProvince;
    return {
      'CommonName': commonName,
      if (city != null) 'City': city,
      if (country != null) 'Country': country,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (organization != null) 'Organization': organization,
      if (organizationUnit != null) 'OrganizationUnit': organizationUnit,
      if (stateOrProvince != null) 'StateOrProvince': stateOrProvince,
    };
  }
}

/// Parameter information for generating a WrappedKeyBlock for key exchange.
///
/// @nodoc
class WrappedKey {
  /// Parameter information for generating a wrapped key using TR-31 or TR-34 skey
  /// exchange method.
  final String keyMaterial;

  /// The key block format of a wrapped key.
  final WrappedKeyMaterialFormat wrappedKeyMaterialFormat;

  /// The <code>KeyARN</code> of the wrapped key.
  final String wrappingKeyArn;

  /// The key check value (KCV) is used to check if all parties holding a given
  /// key have the same key or to detect that a key has changed.
  final String? keyCheckValue;

  /// The algorithm that Amazon Web Services Payment Cryptography uses to
  /// calculate the key check value (KCV). It is used to validate the key
  /// integrity.
  ///
  /// For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of
  /// zero, with the key to be checked and retaining the 3 highest order bytes of
  /// the encrypted result. For AES keys, the KCV is computed using a CMAC
  /// algorithm where the input data is 16 bytes of zero and retaining the 3
  /// highest order bytes of the encrypted result. For HMAC keys, the KCV is
  /// computed using the hash selected at key creation on a zero-length message,
  /// taking the leftmost 3 bytes.
  final KeyCheckValueAlgorithm? keyCheckValueAlgorithm;

  WrappedKey({
    required this.keyMaterial,
    required this.wrappedKeyMaterialFormat,
    required this.wrappingKeyArn,
    this.keyCheckValue,
    this.keyCheckValueAlgorithm,
  });

  factory WrappedKey.fromJson(Map<String, dynamic> json) {
    return WrappedKey(
      keyMaterial: (json['KeyMaterial'] as String?) ?? '',
      wrappedKeyMaterialFormat: WrappedKeyMaterialFormat.fromString(
          (json['WrappedKeyMaterialFormat'] as String?) ?? ''),
      wrappingKeyArn: (json['WrappingKeyArn'] as String?) ?? '',
      keyCheckValue: json['KeyCheckValue'] as String?,
      keyCheckValueAlgorithm: (json['KeyCheckValueAlgorithm'] as String?)
          ?.let(KeyCheckValueAlgorithm.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final keyMaterial = this.keyMaterial;
    final wrappedKeyMaterialFormat = this.wrappedKeyMaterialFormat;
    final wrappingKeyArn = this.wrappingKeyArn;
    final keyCheckValue = this.keyCheckValue;
    final keyCheckValueAlgorithm = this.keyCheckValueAlgorithm;
    return {
      'KeyMaterial': keyMaterial,
      'WrappedKeyMaterialFormat': wrappedKeyMaterialFormat.value,
      'WrappingKeyArn': wrappingKeyArn,
      if (keyCheckValue != null) 'KeyCheckValue': keyCheckValue,
      if (keyCheckValueAlgorithm != null)
        'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.value,
    };
  }
}

/// @nodoc
class WrappedKeyMaterialFormat {
  static const keyCryptogram = WrappedKeyMaterialFormat._('KEY_CRYPTOGRAM');
  static const tr31KeyBlock = WrappedKeyMaterialFormat._('TR31_KEY_BLOCK');
  static const tr34KeyBlock = WrappedKeyMaterialFormat._('TR34_KEY_BLOCK');

  final String value;

  const WrappedKeyMaterialFormat._(this.value);

  static const values = [keyCryptogram, tr31KeyBlock, tr34KeyBlock];

  static WrappedKeyMaterialFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WrappedKeyMaterialFormat._(value));

  @override
  bool operator ==(other) =>
      other is WrappedKeyMaterialFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameter information for key material export from Amazon Web Services
/// Payment Cryptography using TR-31 or TR-34 or RSA wrap and unwrap key
/// exchange method.
///
/// @nodoc
class ExportKeyMaterial {
  /// Parameter information for key material export using AS2805 key cryptogram
  /// format.
  final ExportAs2805KeyCryptogram? as2805KeyCryptogram;

  /// Key derivation parameter information for key material export using
  /// asymmetric ECDH key exchange method.
  final ExportDiffieHellmanTr31KeyBlock? diffieHellmanTr31KeyBlock;

  /// Parameter information for key material export using asymmetric RSA wrap and
  /// unwrap key exchange method
  final ExportKeyCryptogram? keyCryptogram;

  /// Parameter information for key material export using symmetric TR-31 key
  /// exchange method.
  final ExportTr31KeyBlock? tr31KeyBlock;

  /// Parameter information for key material export using the asymmetric TR-34 key
  /// exchange method.
  final ExportTr34KeyBlock? tr34KeyBlock;

  ExportKeyMaterial({
    this.as2805KeyCryptogram,
    this.diffieHellmanTr31KeyBlock,
    this.keyCryptogram,
    this.tr31KeyBlock,
    this.tr34KeyBlock,
  });

  Map<String, dynamic> toJson() {
    final as2805KeyCryptogram = this.as2805KeyCryptogram;
    final diffieHellmanTr31KeyBlock = this.diffieHellmanTr31KeyBlock;
    final keyCryptogram = this.keyCryptogram;
    final tr31KeyBlock = this.tr31KeyBlock;
    final tr34KeyBlock = this.tr34KeyBlock;
    return {
      if (as2805KeyCryptogram != null)
        'As2805KeyCryptogram': as2805KeyCryptogram,
      if (diffieHellmanTr31KeyBlock != null)
        'DiffieHellmanTr31KeyBlock': diffieHellmanTr31KeyBlock,
      if (keyCryptogram != null) 'KeyCryptogram': keyCryptogram,
      if (tr31KeyBlock != null) 'Tr31KeyBlock': tr31KeyBlock,
      if (tr34KeyBlock != null) 'Tr34KeyBlock': tr34KeyBlock,
    };
  }
}

/// The attributes for IPEK generation during export.
///
/// @nodoc
class ExportAttributes {
  /// Parameter information for IPEK export.
  final ExportDukptInitialKey? exportDukptInitialKey;

  /// The algorithm that Amazon Web Services Payment Cryptography uses to
  /// calculate the key check value (KCV). It is used to validate the key
  /// integrity. Specify KCV for IPEK export only.
  ///
  /// For TDES keys, the KCV is computed by encrypting 8 bytes, each with value of
  /// zero, with the key to be checked and retaining the 3 highest order bytes of
  /// the encrypted result. For AES keys, the KCV is computed using a CMAC
  /// algorithm where the input data is 16 bytes of zero and retaining the 3
  /// highest order bytes of the encrypted result. For HMAC keys, the KCV is
  /// computed using the hash selected at key creation on a zero-length message,
  /// taking the leftmost 3 bytes.
  final KeyCheckValueAlgorithm? keyCheckValueAlgorithm;

  ExportAttributes({
    this.exportDukptInitialKey,
    this.keyCheckValueAlgorithm,
  });

  Map<String, dynamic> toJson() {
    final exportDukptInitialKey = this.exportDukptInitialKey;
    final keyCheckValueAlgorithm = this.keyCheckValueAlgorithm;
    return {
      if (exportDukptInitialKey != null)
        'ExportDukptInitialKey': exportDukptInitialKey,
      if (keyCheckValueAlgorithm != null)
        'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.value,
    };
  }
}

/// Parameter information for IPEK generation during export.
///
/// @nodoc
class ExportDukptInitialKey {
  /// The KSN for IPEK generation using DUKPT.
  ///
  /// KSN must be padded before sending to Amazon Web Services Payment
  /// Cryptography. KSN hex length should be 20 for a TDES_2KEY key or 24 for an
  /// AES key.
  final String keySerialNumber;

  ExportDukptInitialKey({
    required this.keySerialNumber,
  });

  Map<String, dynamic> toJson() {
    final keySerialNumber = this.keySerialNumber;
    return {
      'KeySerialNumber': keySerialNumber,
    };
  }
}

/// Parameter information for key material export using symmetric TR-31 key
/// exchange method.
///
/// @nodoc
class ExportTr31KeyBlock {
  /// The <code>KeyARN</code> of the the wrapping key. This key encrypts or wraps
  /// the key under export for TR-31 key block generation.
  final String wrappingKeyIdentifier;

  /// Optional metadata for export associated with the key material. This data is
  /// signed but transmitted in clear text.
  final KeyBlockHeaders? keyBlockHeaders;

  ExportTr31KeyBlock({
    required this.wrappingKeyIdentifier,
    this.keyBlockHeaders,
  });

  Map<String, dynamic> toJson() {
    final wrappingKeyIdentifier = this.wrappingKeyIdentifier;
    final keyBlockHeaders = this.keyBlockHeaders;
    return {
      'WrappingKeyIdentifier': wrappingKeyIdentifier,
      if (keyBlockHeaders != null) 'KeyBlockHeaders': keyBlockHeaders,
    };
  }
}

/// Parameter information for key material export using the asymmetric TR-34 key
/// exchange method.
///
/// @nodoc
class ExportTr34KeyBlock {
  /// The <code>KeyARN</code> of the certificate chain that signs the wrapping key
  /// certificate during TR-34 key export.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The format of key block that Amazon Web Services Payment Cryptography will
  /// use during key export.
  final Tr34KeyBlockFormat keyBlockFormat;

  /// The <code>KeyARN</code> of the wrapping key certificate. Amazon Web Services
  /// Payment Cryptography uses this certificate to wrap the key under export.
  final String wrappingKeyCertificate;

  /// The export token to initiate key export from Amazon Web Services Payment
  /// Cryptography. It also contains the signing key certificate that will sign
  /// the wrapped key during TR-34 key block generation. Call <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html">GetParametersForExport</a>
  /// to receive an export token. It expires after 30 days. You can use the same
  /// export token to export multiple keys from the same service account.
  final String? exportToken;

  /// Optional metadata for export associated with the key material. This data is
  /// signed but transmitted in clear text.
  final KeyBlockHeaders? keyBlockHeaders;

  /// A random number value that is unique to the TR-34 key block generated using
  /// 2 pass. The operation will fail, if a random nonce value is not provided for
  /// a TR-34 key block generated using 2 pass.
  final String? randomNonce;

  /// The certificate used to sign the TR-34 key block.
  final String? signingKeyCertificate;

  /// Key Identifier used for signing the export key
  final String? signingKeyIdentifier;

  ExportTr34KeyBlock({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.keyBlockFormat,
    required this.wrappingKeyCertificate,
    this.exportToken,
    this.keyBlockHeaders,
    this.randomNonce,
    this.signingKeyCertificate,
    this.signingKeyIdentifier,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final keyBlockFormat = this.keyBlockFormat;
    final wrappingKeyCertificate = this.wrappingKeyCertificate;
    final exportToken = this.exportToken;
    final keyBlockHeaders = this.keyBlockHeaders;
    final randomNonce = this.randomNonce;
    final signingKeyCertificate = this.signingKeyCertificate;
    final signingKeyIdentifier = this.signingKeyIdentifier;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'KeyBlockFormat': keyBlockFormat.value,
      'WrappingKeyCertificate': wrappingKeyCertificate,
      if (exportToken != null) 'ExportToken': exportToken,
      if (keyBlockHeaders != null) 'KeyBlockHeaders': keyBlockHeaders,
      if (randomNonce != null) 'RandomNonce': randomNonce,
      if (signingKeyCertificate != null)
        'SigningKeyCertificate': signingKeyCertificate,
      if (signingKeyIdentifier != null)
        'SigningKeyIdentifier': signingKeyIdentifier,
    };
  }
}

/// Parameter information for key material export using asymmetric RSA wrap and
/// unwrap key exchange method.
///
/// @nodoc
class ExportKeyCryptogram {
  /// The <code>KeyARN</code> of the certificate chain that signs the wrapping key
  /// certificate during RSA wrap and unwrap key export.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The wrapping key certificate in PEM format (base64 encoded). Amazon Web
  /// Services Payment Cryptography uses this certificate to wrap the key under
  /// export.
  final String wrappingKeyCertificate;

  /// The wrapping spec for the key under export.
  final WrappingKeySpec? wrappingSpec;

  ExportKeyCryptogram({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.wrappingKeyCertificate,
    this.wrappingSpec,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final wrappingKeyCertificate = this.wrappingKeyCertificate;
    final wrappingSpec = this.wrappingSpec;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'WrappingKeyCertificate': wrappingKeyCertificate,
      if (wrappingSpec != null) 'WrappingSpec': wrappingSpec.value,
    };
  }
}

/// Key derivation parameter information for key material export using
/// asymmetric ECDH key exchange method.
///
/// @nodoc
class ExportDiffieHellmanTr31KeyBlock {
  /// The <code>keyARN</code> of the CA that signed the
  /// <code>PublicKeyCertificate</code> for the client's receiving ECC key pair.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The shared information used when deriving a key using ECDH.
  final DiffieHellmanDerivationData derivationData;

  /// The key algorithm of the shared derived ECDH key.
  final SymmetricKeyAlgorithm deriveKeyAlgorithm;

  /// The key derivation function to use when deriving a key using ECDH.
  final KeyDerivationFunction keyDerivationFunction;

  /// The hash type to use when deriving a key using ECDH.
  final KeyDerivationHashAlgorithm keyDerivationHashAlgorithm;

  /// The <code>keyARN</code> of the asymmetric ECC key created within Amazon Web
  /// Services Payment Cryptography.
  final String privateKeyIdentifier;

  /// The public key certificate of the client's receiving ECC key pair, in PEM
  /// format (base64 encoded), to use for ECDH key derivation.
  final String publicKeyCertificate;
  final KeyBlockHeaders? keyBlockHeaders;

  ExportDiffieHellmanTr31KeyBlock({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.derivationData,
    required this.deriveKeyAlgorithm,
    required this.keyDerivationFunction,
    required this.keyDerivationHashAlgorithm,
    required this.privateKeyIdentifier,
    required this.publicKeyCertificate,
    this.keyBlockHeaders,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final derivationData = this.derivationData;
    final deriveKeyAlgorithm = this.deriveKeyAlgorithm;
    final keyDerivationFunction = this.keyDerivationFunction;
    final keyDerivationHashAlgorithm = this.keyDerivationHashAlgorithm;
    final privateKeyIdentifier = this.privateKeyIdentifier;
    final publicKeyCertificate = this.publicKeyCertificate;
    final keyBlockHeaders = this.keyBlockHeaders;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'DerivationData': derivationData,
      'DeriveKeyAlgorithm': deriveKeyAlgorithm.value,
      'KeyDerivationFunction': keyDerivationFunction.value,
      'KeyDerivationHashAlgorithm': keyDerivationHashAlgorithm.value,
      'PrivateKeyIdentifier': privateKeyIdentifier,
      'PublicKeyCertificate': publicKeyCertificate,
      if (keyBlockHeaders != null) 'KeyBlockHeaders': keyBlockHeaders,
    };
  }
}

/// Parameter information for key material export using AS2805 key cryptogram
/// format.
///
/// @nodoc
class ExportAs2805KeyCryptogram {
  /// The cryptographic usage of the key under export.
  final As2805KeyVariant as2805KeyVariant;
  final String wrappingKeyIdentifier;

  ExportAs2805KeyCryptogram({
    required this.as2805KeyVariant,
    required this.wrappingKeyIdentifier,
  });

  Map<String, dynamic> toJson() {
    final as2805KeyVariant = this.as2805KeyVariant;
    final wrappingKeyIdentifier = this.wrappingKeyIdentifier;
    return {
      'As2805KeyVariant': as2805KeyVariant.value,
      'WrappingKeyIdentifier': wrappingKeyIdentifier,
    };
  }
}

/// Optional metadata for export associated with the key material. This data is
/// signed but transmitted in clear text.
///
/// @nodoc
class KeyBlockHeaders {
  /// Specifies subsequent exportability of the key within the key block after it
  /// is received by the receiving party. It can be used to further restrict
  /// exportability of the key after export from Amazon Web Services Payment
  /// Cryptography.
  ///
  /// When set to <code>EXPORTABLE</code>, the key can be subsequently exported by
  /// the receiver under a KEK using TR-31 or TR-34 key block export only. When
  /// set to <code>NON_EXPORTABLE</code>, the key cannot be subsequently exported
  /// by the receiver. When set to <code>SENSITIVE</code>, the key can be exported
  /// by the receiver under a KEK using TR-31, TR-34, RSA wrap and unwrap
  /// cryptogram or using a symmetric cryptogram key export method. For further
  /// information refer to <a
  /// href="https://webstore.ansi.org/standards/ascx9/ansix91432022">ANSI
  /// X9.143-2022</a>.
  final KeyExportability? keyExportability;
  final KeyModesOfUse? keyModesOfUse;

  /// Parameter used to indicate the version of the key carried in the key block
  /// or indicate the value carried in the key block is a component of a key.
  final String? keyVersion;

  /// Parameter used to indicate the type of optional data in key block headers.
  /// Refer to <a
  /// href="https://webstore.ansi.org/standards/ascx9/ansix91432022">ANSI
  /// X9.143-2022</a> for information on allowed data type for optional blocks.
  ///
  /// Optional block character limit is 112 characters. For each optional block, 2
  /// characters are reserved for optional block ID and 2 characters reserved for
  /// optional block length. More than one optional blocks can be included as long
  /// as the combined length does not increase 112 characters.
  final Map<String, String>? optionalBlocks;

  KeyBlockHeaders({
    this.keyExportability,
    this.keyModesOfUse,
    this.keyVersion,
    this.optionalBlocks,
  });

  Map<String, dynamic> toJson() {
    final keyExportability = this.keyExportability;
    final keyModesOfUse = this.keyModesOfUse;
    final keyVersion = this.keyVersion;
    final optionalBlocks = this.optionalBlocks;
    return {
      if (keyExportability != null) 'KeyExportability': keyExportability.value,
      if (keyModesOfUse != null) 'KeyModesOfUse': keyModesOfUse,
      if (keyVersion != null) 'KeyVersion': keyVersion,
      if (optionalBlocks != null) 'OptionalBlocks': optionalBlocks,
    };
  }
}

/// @nodoc
class KeyExportability {
  static const exportable = KeyExportability._('EXPORTABLE');
  static const nonExportable = KeyExportability._('NON_EXPORTABLE');
  static const sensitive = KeyExportability._('SENSITIVE');

  final String value;

  const KeyExportability._(this.value);

  static const values = [exportable, nonExportable, sensitive];

  static KeyExportability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeyExportability._(value));

  @override
  bool operator ==(other) => other is KeyExportability && other.value == value;

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
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class PublicPolicyException extends _s.GenericAwsException {
  PublicPolicyException({String? type, String? message})
      : super(type: type, code: 'PublicPolicyException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'PublicPolicyException': (type, message) =>
      PublicPolicyException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
