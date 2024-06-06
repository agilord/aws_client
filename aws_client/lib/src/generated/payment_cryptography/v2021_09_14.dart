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
class PaymentCryptographyControlPlane {
  final _s.JsonProtocol _protocol;
  PaymentCryptographyControlPlane({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'controlplane.payment-cryptography',
            signingName: 'payment-cryptography',
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <code>Encrypt</code>). For information about valid combinations of key
  /// attributes, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>. The mutable data contained within a key includes usage
  /// timestamp and key deletion timestamp and can be modified after creation.
  ///
  /// Amazon Web Services Payment Cryptography binds key attributes to keys
  /// using key blocks when you store or export them. Amazon Web Services
  /// Payment Cryptography stores the key contents wrapped and never stores or
  /// transmits them in the clear.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [exportable] :
  /// Specifies whether the key is exportable from the service.
  ///
  /// Parameter [keyAttributes] :
  /// The role of the key, the algorithm it supports, and the cryptographic
  /// operations allowed with the key. This data is immutable after the key is
  /// created.
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
  /// 3 highest order bytes of the encrypted result.
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
    bool? enabled,
    KeyCheckValueAlgorithm? keyCheckValueAlgorithm,
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
        if (enabled != null) 'Enabled': enabled,
        if (keyCheckValueAlgorithm != null)
          'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateKeyOutput.fromJson(jsonResponse.body);
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
    _s.validateNumRange(
      'deleteKeyInDays',
      deleteKeyInDays,
      3,
      180,
    );
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
  /// ANSI X9 TR-34 norm and RSA wrap and unwrap key exchange mechanism.
  /// Asymmetric key exchange methods are typically used to establish
  /// bi-directional trust between the two parties exhanging keys and are used
  /// for initial key exchange such as Key Encryption Key (KEK). After which you
  /// can export working keys using symmetric method to perform various
  /// cryptographic operations within Amazon Web Services Payment Cryptography.
  ///
  /// The TR-34 norm is intended for exchanging 3DES keys only and keys are
  /// imported in a WrappedKeyBlock format. Key attributes (such as KeyUsage,
  /// KeyAlgorithm, KeyModesOfUse, Exportability) are contained within the key
  /// block. With RSA wrap and unwrap, you can exchange both 3DES and AES-128
  /// keys. The keys are imported in a WrappedKeyCryptogram format and you will
  /// need to specify the key attributes during import.
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
  /// 7 days.
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
  /// When this operation is successful, Amazon Web Services Payment
  /// Cryptography returns the working key or IPEK as a TR-31 WrappedKeyBlock.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Gets the key material for an Amazon Web Services Payment Cryptography key,
  /// including the immutable and mutable data specified when the key was
  /// created.
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
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ListKeys.html">ListKeys</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Gets the export token and the signing key certificate to initiate a TR-34
  /// key export from Amazon Web Services Payment Cryptography.
  ///
  /// The signing key certificate signs the wrapped key under export within the
  /// TR-34 key payload. The export token and signing key certificate must be in
  /// place and operational before calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ExportKey.html">ExportKey</a>.
  /// The export token expires in 7 days. You can use the same export token to
  /// export multiple keys from your service account.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  Future<GetParametersForExportOutput> getParametersForExport({
    required KeyMaterialType keyMaterialType,
    required KeyAlgorithm signingKeyAlgorithm,
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
        'KeyMaterialType': keyMaterialType.toValue(),
        'SigningKeyAlgorithm': signingKeyAlgorithm.toValue(),
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
  /// The import token expires in 7 days. You can use the same import token to
  /// import multiple keys into your service account.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  Future<GetParametersForImportOutput> getParametersForImport({
    required KeyMaterialType keyMaterialType,
    required KeyAlgorithm wrappingKeyAlgorithm,
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
        'KeyMaterialType': keyMaterialType.toValue(),
        'WrappingKeyAlgorithm': wrappingKeyAlgorithm.toValue(),
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
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// ANSI X9 TR-34 norm and RSA wrap and unwrap key exchange mechanisms.
  /// Asymmetric key exchange methods are typically used to establish
  /// bi-directional trust between the two parties exhanging keys and are used
  /// for initial key exchange such as Key Encryption Key (KEK) or Zone Master
  /// Key (ZMK). After which you can import working keys using symmetric method
  /// to perform various cryptographic operations within Amazon Web Services
  /// Payment Cryptography.
  ///
  /// The TR-34 norm is intended for exchanging 3DES keys only and keys are
  /// imported in a WrappedKeyBlock format. Key attributes (such as KeyUsage,
  /// KeyAlgorithm, KeyModesOfUse, Exportability) are contained within the key
  /// block. With RSA wrap and unwrap, you can exchange both 3DES and AES-128
  /// keys. The keys are imported in a WrappedKeyCryptogram format and you will
  /// need to specify the key attributes during import.
  ///
  /// You can also import a <i>root public key certificate</i>, used to sign
  /// other public key certificates, or a <i>trusted public key certificate</i>
  /// under an already established root public key certificate.
  ///
  /// <b>To import a public root key certificate</b>
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
  /// import token and associated KRD wrapping certificate expires after 7 days.
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
  /// certificate expires after 7 days.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// 3 highest order bytes of the encrypted result.
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
          'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return ImportKeyOutput.fromJson(jsonResponse.body);
  }

  /// Lists the aliases for all keys in the caller's Amazon Web Services account
  /// and Amazon Web Services Region. You can filter the list of aliases. For
  /// more information, see <a
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAliasesOutput.fromJson(jsonResponse.body);
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
        if (keyState != null) 'KeyState': keyState.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListKeysOutput.fromJson(jsonResponse.body);
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
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <b>Cross-account use:</b> This operation can't be used across different
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
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html">StartKeyUsage</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StopKeyUsage.html">StopKeyUsage</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <b>Cross-account use:</b> This operation can't be used across different
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
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_StartKeyUsage.html">StartKeyUsage</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <b>Cross-account use:</b> This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
}

/// Contains information about an alias.
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
      aliasName: json['AliasName'] as String,
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

class CreateAliasOutput {
  /// The alias for the key.
  final Alias alias;

  CreateAliasOutput({
    required this.alias,
  });

  factory CreateAliasOutput.fromJson(Map<String, dynamic> json) {
    return CreateAliasOutput(
      alias: Alias.fromJson(json['Alias'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      'Alias': alias,
    };
  }
}

class CreateKeyOutput {
  /// The key material that contains all the key attributes.
  final Key key;

  CreateKeyOutput({
    required this.key,
  });

  factory CreateKeyOutput.fromJson(Map<String, dynamic> json) {
    return CreateKeyOutput(
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

class DeleteAliasOutput {
  DeleteAliasOutput();

  factory DeleteAliasOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAliasOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteKeyOutput {
  /// The <code>KeyARN</code> of the key that is scheduled for deletion.
  final Key key;

  DeleteKeyOutput({
    required this.key,
  });

  factory DeleteKeyOutput.fromJson(Map<String, dynamic> json) {
    return DeleteKeyOutput(
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// The attributes for IPEK generation during export.
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
  /// highest order bytes of the encrypted result.
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
        'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.toValue(),
    };
  }
}

/// Parameter information for IPEK generation during export.
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

/// Parameter information for key material export using asymmetric RSA wrap and
/// unwrap key exchange method.
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
      if (wrappingSpec != null) 'WrappingSpec': wrappingSpec.toValue(),
    };
  }
}

/// Parameter information for key material export from Amazon Web Services
/// Payment Cryptography using TR-31 or TR-34 or RSA wrap and unwrap key
/// exchange method.
class ExportKeyMaterial {
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
    this.keyCryptogram,
    this.tr31KeyBlock,
    this.tr34KeyBlock,
  });

  Map<String, dynamic> toJson() {
    final keyCryptogram = this.keyCryptogram;
    final tr31KeyBlock = this.tr31KeyBlock;
    final tr34KeyBlock = this.tr34KeyBlock;
    return {
      if (keyCryptogram != null) 'KeyCryptogram': keyCryptogram,
      if (tr31KeyBlock != null) 'Tr31KeyBlock': tr31KeyBlock,
      if (tr34KeyBlock != null) 'Tr34KeyBlock': tr34KeyBlock,
    };
  }
}

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

/// Parameter information for key material export using symmetric TR-31 key
/// exchange method.
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
class ExportTr34KeyBlock {
  /// The <code>KeyARN</code> of the certificate chain that signs the wrapping key
  /// certificate during TR-34 key export.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The export token to initiate key export from Amazon Web Services Payment
  /// Cryptography. It also contains the signing key certificate that will sign
  /// the wrapped key during TR-34 key block generation. Call <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetParametersForExport.html">GetParametersForExport</a>
  /// to receive an export token. It expires after 7 days. You can use the same
  /// export token to export multiple keys from the same service account.
  final String exportToken;

  /// The format of key block that Amazon Web Services Payment Cryptography will
  /// use during key export.
  final Tr34KeyBlockFormat keyBlockFormat;

  /// The <code>KeyARN</code> of the wrapping key certificate. Amazon Web Services
  /// Payment Cryptography uses this certificate to wrap the key under export.
  final String wrappingKeyCertificate;

  /// Optional metadata for export associated with the key material. This data is
  /// signed but transmitted in clear text.
  final KeyBlockHeaders? keyBlockHeaders;

  /// A random number value that is unique to the TR-34 key block generated using
  /// 2 pass. The operation will fail, if a random nonce value is not provided for
  /// a TR-34 key block generated using 2 pass.
  final String? randomNonce;

  ExportTr34KeyBlock({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.exportToken,
    required this.keyBlockFormat,
    required this.wrappingKeyCertificate,
    this.keyBlockHeaders,
    this.randomNonce,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final exportToken = this.exportToken;
    final keyBlockFormat = this.keyBlockFormat;
    final wrappingKeyCertificate = this.wrappingKeyCertificate;
    final keyBlockHeaders = this.keyBlockHeaders;
    final randomNonce = this.randomNonce;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'ExportToken': exportToken,
      'KeyBlockFormat': keyBlockFormat.toValue(),
      'WrappingKeyCertificate': wrappingKeyCertificate,
      if (keyBlockHeaders != null) 'KeyBlockHeaders': keyBlockHeaders,
      if (randomNonce != null) 'RandomNonce': randomNonce,
    };
  }
}

class GetAliasOutput {
  /// The alias of the Amazon Web Services Payment Cryptography key.
  final Alias alias;

  GetAliasOutput({
    required this.alias,
  });

  factory GetAliasOutput.fromJson(Map<String, dynamic> json) {
    return GetAliasOutput(
      alias: Alias.fromJson(json['Alias'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      'Alias': alias,
    };
  }
}

class GetKeyOutput {
  /// The key material, including the immutable and mutable data for the key.
  final Key key;

  GetKeyOutput({
    required this.key,
  });

  factory GetKeyOutput.fromJson(Map<String, dynamic> json) {
    return GetKeyOutput(
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

class GetParametersForExportOutput {
  /// The export token to initiate key export from Amazon Web Services Payment
  /// Cryptography. The export token expires after 7 days. You can use the same
  /// export token to export multiple keys from the same service account.
  final String exportToken;

  /// The validity period of the export token.
  final DateTime parametersValidUntilTimestamp;

  /// The algorithm of the signing key certificate for use in TR-34 key block
  /// generation. <code>RSA_2048</code> is the only signing key algorithm allowed.
  final KeyAlgorithm signingKeyAlgorithm;

  /// The signing key certificate in PEM format (base64 encoded) of the public key
  /// for signature within the TR-34 key block. The certificate expires after 7
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
      exportToken: json['ExportToken'] as String,
      parametersValidUntilTimestamp: nonNullableTimeStampFromJson(
          json['ParametersValidUntilTimestamp'] as Object),
      signingKeyAlgorithm:
          (json['SigningKeyAlgorithm'] as String).toKeyAlgorithm(),
      signingKeyCertificate: json['SigningKeyCertificate'] as String,
      signingKeyCertificateChain: json['SigningKeyCertificateChain'] as String,
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
      'SigningKeyAlgorithm': signingKeyAlgorithm.toValue(),
      'SigningKeyCertificate': signingKeyCertificate,
      'SigningKeyCertificateChain': signingKeyCertificateChain,
    };
  }
}

class GetParametersForImportOutput {
  /// The import token to initiate key import into Amazon Web Services Payment
  /// Cryptography. The import token expires after 7 days. You can use the same
  /// import token to import multiple keys to the same service account.
  final String importToken;

  /// The validity period of the import token.
  final DateTime parametersValidUntilTimestamp;

  /// The algorithm of the wrapping key for use within TR-34 WrappedKeyBlock or
  /// RSA WrappedKeyCryptogram.
  final KeyAlgorithm wrappingKeyAlgorithm;

  /// The wrapping key certificate in PEM format (base64 encoded) of the wrapping
  /// key for use within the TR-34 key block. The certificate expires in 7 days.
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
      importToken: json['ImportToken'] as String,
      parametersValidUntilTimestamp: nonNullableTimeStampFromJson(
          json['ParametersValidUntilTimestamp'] as Object),
      wrappingKeyAlgorithm:
          (json['WrappingKeyAlgorithm'] as String).toKeyAlgorithm(),
      wrappingKeyCertificate: json['WrappingKeyCertificate'] as String,
      wrappingKeyCertificateChain:
          json['WrappingKeyCertificateChain'] as String,
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
      'WrappingKeyAlgorithm': wrappingKeyAlgorithm.toValue(),
      'WrappingKeyCertificate': wrappingKeyCertificate,
      'WrappingKeyCertificateChain': wrappingKeyCertificateChain,
    };
  }
}

class GetPublicKeyCertificateOutput {
  /// The public key component of the asymmetric key pair in a certificate PEM
  /// format (base64 encoded). It is signed by the root certificate authority
  /// (CA). The certificate expires in 90 days.
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
      keyCertificate: json['KeyCertificate'] as String,
      keyCertificateChain: json['KeyCertificateChain'] as String,
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

/// Parameter information for key material import using asymmetric RSA wrap and
/// unwrap key exchange method.
class ImportKeyCryptogram {
  /// Specifies whether the key is exportable from the service.
  final bool exportable;

  /// The import token that initiates key import using the asymmetric RSA wrap and
  /// unwrap key exchange method into AWS Payment Cryptography. It expires after 7
  /// days. You can use the same import token to import multiple keys to the same
  /// service account.
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
      if (wrappingSpec != null) 'WrappingSpec': wrappingSpec.toValue(),
    };
  }
}

/// Parameter information for key material import into Amazon Web Services
/// Payment Cryptography using TR-31 or TR-34 or RSA wrap and unwrap key
/// exchange method.
class ImportKeyMaterial {
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
    this.keyCryptogram,
    this.rootCertificatePublicKey,
    this.tr31KeyBlock,
    this.tr34KeyBlock,
    this.trustedCertificatePublicKey,
  });

  Map<String, dynamic> toJson() {
    final keyCryptogram = this.keyCryptogram;
    final rootCertificatePublicKey = this.rootCertificatePublicKey;
    final tr31KeyBlock = this.tr31KeyBlock;
    final tr34KeyBlock = this.tr34KeyBlock;
    final trustedCertificatePublicKey = this.trustedCertificatePublicKey;
    return {
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

class ImportKeyOutput {
  /// The <code>KeyARN</code> of the key material imported within Amazon Web
  /// Services Payment Cryptography.
  final Key key;

  ImportKeyOutput({
    required this.key,
  });

  factory ImportKeyOutput.fromJson(Map<String, dynamic> json) {
    return ImportKeyOutput(
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// Parameter information for key material import using symmetric TR-31 key
/// exchange method.
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
class ImportTr34KeyBlock {
  /// The <code>KeyARN</code> of the certificate chain that signs the signing key
  /// certificate during TR-34 key import.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The import token that initiates key import using the asymmetric TR-34 key
  /// exchange method into Amazon Web Services Payment Cryptography. It expires
  /// after 7 days. You can use the same import token to import multiple keys to
  /// the same service account.
  final String importToken;

  /// The key block format to use during key import. The only value allowed is
  /// <code>X9_TR34_2012</code>.
  final Tr34KeyBlockFormat keyBlockFormat;

  /// The public key component in PEM certificate format of the private key that
  /// signs the KDH TR-34 WrappedKeyBlock.
  final String signingKeyCertificate;

  /// The TR-34 wrapped key block to import.
  final String wrappedKeyBlock;

  /// A random number value that is unique to the TR-34 key block generated using
  /// 2 pass. The operation will fail, if a random nonce value is not provided for
  /// a TR-34 key block generated using 2 pass.
  final String? randomNonce;

  ImportTr34KeyBlock({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.importToken,
    required this.keyBlockFormat,
    required this.signingKeyCertificate,
    required this.wrappedKeyBlock,
    this.randomNonce,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final importToken = this.importToken;
    final keyBlockFormat = this.keyBlockFormat;
    final signingKeyCertificate = this.signingKeyCertificate;
    final wrappedKeyBlock = this.wrappedKeyBlock;
    final randomNonce = this.randomNonce;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'ImportToken': importToken,
      'KeyBlockFormat': keyBlockFormat.toValue(),
      'SigningKeyCertificate': signingKeyCertificate,
      'WrappedKeyBlock': wrappedKeyBlock,
      if (randomNonce != null) 'RandomNonce': randomNonce,
    };
  }
}

/// Metadata about an Amazon Web Services Payment Cryptography key.
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
  /// highest order bytes of the encrypted result.
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

  /// The date and time after which Amazon Web Services Payment Cryptography will
  /// start using the key material for cryptographic operations.
  final DateTime? usageStartTimestamp;

  /// The date and time after which Amazon Web Services Payment Cryptography will
  /// stop using the key material for cryptographic operations.
  final DateTime? usageStopTimestamp;

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
    this.usageStartTimestamp,
    this.usageStopTimestamp,
  });

  factory Key.fromJson(Map<String, dynamic> json) {
    return Key(
      createTimestamp:
          nonNullableTimeStampFromJson(json['CreateTimestamp'] as Object),
      enabled: json['Enabled'] as bool,
      exportable: json['Exportable'] as bool,
      keyArn: json['KeyArn'] as String,
      keyAttributes:
          KeyAttributes.fromJson(json['KeyAttributes'] as Map<String, dynamic>),
      keyCheckValue: json['KeyCheckValue'] as String,
      keyCheckValueAlgorithm:
          (json['KeyCheckValueAlgorithm'] as String).toKeyCheckValueAlgorithm(),
      keyOrigin: (json['KeyOrigin'] as String).toKeyOrigin(),
      keyState: (json['KeyState'] as String).toKeyState(),
      deletePendingTimestamp: timeStampFromJson(json['DeletePendingTimestamp']),
      deleteTimestamp: timeStampFromJson(json['DeleteTimestamp']),
      usageStartTimestamp: timeStampFromJson(json['UsageStartTimestamp']),
      usageStopTimestamp: timeStampFromJson(json['UsageStopTimestamp']),
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
    final usageStartTimestamp = this.usageStartTimestamp;
    final usageStopTimestamp = this.usageStopTimestamp;
    return {
      'CreateTimestamp': unixTimestampToJson(createTimestamp),
      'Enabled': enabled,
      'Exportable': exportable,
      'KeyArn': keyArn,
      'KeyAttributes': keyAttributes,
      'KeyCheckValue': keyCheckValue,
      'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.toValue(),
      'KeyOrigin': keyOrigin.toValue(),
      'KeyState': keyState.toValue(),
      if (deletePendingTimestamp != null)
        'DeletePendingTimestamp': unixTimestampToJson(deletePendingTimestamp),
      if (deleteTimestamp != null)
        'DeleteTimestamp': unixTimestampToJson(deleteTimestamp),
      if (usageStartTimestamp != null)
        'UsageStartTimestamp': unixTimestampToJson(usageStartTimestamp),
      if (usageStopTimestamp != null)
        'UsageStopTimestamp': unixTimestampToJson(usageStopTimestamp),
    };
  }
}

enum KeyAlgorithm {
  tdes_2key,
  tdes_3key,
  aes_128,
  aes_192,
  aes_256,
  rsa_2048,
  rsa_3072,
  rsa_4096,
}

extension KeyAlgorithmValueExtension on KeyAlgorithm {
  String toValue() {
    switch (this) {
      case KeyAlgorithm.tdes_2key:
        return 'TDES_2KEY';
      case KeyAlgorithm.tdes_3key:
        return 'TDES_3KEY';
      case KeyAlgorithm.aes_128:
        return 'AES_128';
      case KeyAlgorithm.aes_192:
        return 'AES_192';
      case KeyAlgorithm.aes_256:
        return 'AES_256';
      case KeyAlgorithm.rsa_2048:
        return 'RSA_2048';
      case KeyAlgorithm.rsa_3072:
        return 'RSA_3072';
      case KeyAlgorithm.rsa_4096:
        return 'RSA_4096';
    }
  }
}

extension KeyAlgorithmFromString on String {
  KeyAlgorithm toKeyAlgorithm() {
    switch (this) {
      case 'TDES_2KEY':
        return KeyAlgorithm.tdes_2key;
      case 'TDES_3KEY':
        return KeyAlgorithm.tdes_3key;
      case 'AES_128':
        return KeyAlgorithm.aes_128;
      case 'AES_192':
        return KeyAlgorithm.aes_192;
      case 'AES_256':
        return KeyAlgorithm.aes_256;
      case 'RSA_2048':
        return KeyAlgorithm.rsa_2048;
      case 'RSA_3072':
        return KeyAlgorithm.rsa_3072;
      case 'RSA_4096':
        return KeyAlgorithm.rsa_4096;
    }
    throw Exception('$this is not known in enum KeyAlgorithm');
  }
}

/// The role of the key, the algorithm it supports, and the cryptographic
/// operations allowed with the key. This data is immutable after the key is
/// created.
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
      keyAlgorithm: (json['KeyAlgorithm'] as String).toKeyAlgorithm(),
      keyClass: (json['KeyClass'] as String).toKeyClass(),
      keyModesOfUse:
          KeyModesOfUse.fromJson(json['KeyModesOfUse'] as Map<String, dynamic>),
      keyUsage: (json['KeyUsage'] as String).toKeyUsage(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyAlgorithm = this.keyAlgorithm;
    final keyClass = this.keyClass;
    final keyModesOfUse = this.keyModesOfUse;
    final keyUsage = this.keyUsage;
    return {
      'KeyAlgorithm': keyAlgorithm.toValue(),
      'KeyClass': keyClass.toValue(),
      'KeyModesOfUse': keyModesOfUse,
      'KeyUsage': keyUsage.toValue(),
    };
  }
}

/// Optional metadata for export associated with the key material. This data is
/// signed but transmitted in clear text.
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
      if (keyExportability != null)
        'KeyExportability': keyExportability.toValue(),
      if (keyModesOfUse != null) 'KeyModesOfUse': keyModesOfUse,
      if (keyVersion != null) 'KeyVersion': keyVersion,
      if (optionalBlocks != null) 'OptionalBlocks': optionalBlocks,
    };
  }
}

enum KeyCheckValueAlgorithm {
  cmac,
  ansiX9_24,
}

extension KeyCheckValueAlgorithmValueExtension on KeyCheckValueAlgorithm {
  String toValue() {
    switch (this) {
      case KeyCheckValueAlgorithm.cmac:
        return 'CMAC';
      case KeyCheckValueAlgorithm.ansiX9_24:
        return 'ANSI_X9_24';
    }
  }
}

extension KeyCheckValueAlgorithmFromString on String {
  KeyCheckValueAlgorithm toKeyCheckValueAlgorithm() {
    switch (this) {
      case 'CMAC':
        return KeyCheckValueAlgorithm.cmac;
      case 'ANSI_X9_24':
        return KeyCheckValueAlgorithm.ansiX9_24;
    }
    throw Exception('$this is not known in enum KeyCheckValueAlgorithm');
  }
}

enum KeyClass {
  symmetricKey,
  asymmetricKeyPair,
  privateKey,
  publicKey,
}

extension KeyClassValueExtension on KeyClass {
  String toValue() {
    switch (this) {
      case KeyClass.symmetricKey:
        return 'SYMMETRIC_KEY';
      case KeyClass.asymmetricKeyPair:
        return 'ASYMMETRIC_KEY_PAIR';
      case KeyClass.privateKey:
        return 'PRIVATE_KEY';
      case KeyClass.publicKey:
        return 'PUBLIC_KEY';
    }
  }
}

extension KeyClassFromString on String {
  KeyClass toKeyClass() {
    switch (this) {
      case 'SYMMETRIC_KEY':
        return KeyClass.symmetricKey;
      case 'ASYMMETRIC_KEY_PAIR':
        return KeyClass.asymmetricKeyPair;
      case 'PRIVATE_KEY':
        return KeyClass.privateKey;
      case 'PUBLIC_KEY':
        return KeyClass.publicKey;
    }
    throw Exception('$this is not known in enum KeyClass');
  }
}

enum KeyExportability {
  exportable,
  nonExportable,
  sensitive,
}

extension KeyExportabilityValueExtension on KeyExportability {
  String toValue() {
    switch (this) {
      case KeyExportability.exportable:
        return 'EXPORTABLE';
      case KeyExportability.nonExportable:
        return 'NON_EXPORTABLE';
      case KeyExportability.sensitive:
        return 'SENSITIVE';
    }
  }
}

extension KeyExportabilityFromString on String {
  KeyExportability toKeyExportability() {
    switch (this) {
      case 'EXPORTABLE':
        return KeyExportability.exportable;
      case 'NON_EXPORTABLE':
        return KeyExportability.nonExportable;
      case 'SENSITIVE':
        return KeyExportability.sensitive;
    }
    throw Exception('$this is not known in enum KeyExportability');
  }
}

enum KeyMaterialType {
  tr34KeyBlock,
  tr31KeyBlock,
  rootPublicKeyCertificate,
  trustedPublicKeyCertificate,
  keyCryptogram,
}

extension KeyMaterialTypeValueExtension on KeyMaterialType {
  String toValue() {
    switch (this) {
      case KeyMaterialType.tr34KeyBlock:
        return 'TR34_KEY_BLOCK';
      case KeyMaterialType.tr31KeyBlock:
        return 'TR31_KEY_BLOCK';
      case KeyMaterialType.rootPublicKeyCertificate:
        return 'ROOT_PUBLIC_KEY_CERTIFICATE';
      case KeyMaterialType.trustedPublicKeyCertificate:
        return 'TRUSTED_PUBLIC_KEY_CERTIFICATE';
      case KeyMaterialType.keyCryptogram:
        return 'KEY_CRYPTOGRAM';
    }
  }
}

extension KeyMaterialTypeFromString on String {
  KeyMaterialType toKeyMaterialType() {
    switch (this) {
      case 'TR34_KEY_BLOCK':
        return KeyMaterialType.tr34KeyBlock;
      case 'TR31_KEY_BLOCK':
        return KeyMaterialType.tr31KeyBlock;
      case 'ROOT_PUBLIC_KEY_CERTIFICATE':
        return KeyMaterialType.rootPublicKeyCertificate;
      case 'TRUSTED_PUBLIC_KEY_CERTIFICATE':
        return KeyMaterialType.trustedPublicKeyCertificate;
      case 'KEY_CRYPTOGRAM':
        return KeyMaterialType.keyCryptogram;
    }
    throw Exception('$this is not known in enum KeyMaterialType');
  }
}

/// The list of cryptographic operations that you can perform using the key. The
/// modes of use are deﬁned in section A.5.3 of the TR-31 spec.
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

/// Defines the source of a key
enum KeyOrigin {
  external,
  awsPaymentCryptography,
}

extension KeyOriginValueExtension on KeyOrigin {
  String toValue() {
    switch (this) {
      case KeyOrigin.external:
        return 'EXTERNAL';
      case KeyOrigin.awsPaymentCryptography:
        return 'AWS_PAYMENT_CRYPTOGRAPHY';
    }
  }
}

extension KeyOriginFromString on String {
  KeyOrigin toKeyOrigin() {
    switch (this) {
      case 'EXTERNAL':
        return KeyOrigin.external;
      case 'AWS_PAYMENT_CRYPTOGRAPHY':
        return KeyOrigin.awsPaymentCryptography;
    }
    throw Exception('$this is not known in enum KeyOrigin');
  }
}

/// Defines the state of a key
enum KeyState {
  createInProgress,
  createComplete,
  deletePending,
  deleteComplete,
}

extension KeyStateValueExtension on KeyState {
  String toValue() {
    switch (this) {
      case KeyState.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case KeyState.createComplete:
        return 'CREATE_COMPLETE';
      case KeyState.deletePending:
        return 'DELETE_PENDING';
      case KeyState.deleteComplete:
        return 'DELETE_COMPLETE';
    }
  }
}

extension KeyStateFromString on String {
  KeyState toKeyState() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return KeyState.createInProgress;
      case 'CREATE_COMPLETE':
        return KeyState.createComplete;
      case 'DELETE_PENDING':
        return KeyState.deletePending;
      case 'DELETE_COMPLETE':
        return KeyState.deleteComplete;
    }
    throw Exception('$this is not known in enum KeyState');
  }
}

/// Metadata about an Amazon Web Services Payment Cryptography key.
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

  KeySummary({
    required this.enabled,
    required this.exportable,
    required this.keyArn,
    required this.keyAttributes,
    required this.keyCheckValue,
    required this.keyState,
  });

  factory KeySummary.fromJson(Map<String, dynamic> json) {
    return KeySummary(
      enabled: json['Enabled'] as bool,
      exportable: json['Exportable'] as bool,
      keyArn: json['KeyArn'] as String,
      keyAttributes:
          KeyAttributes.fromJson(json['KeyAttributes'] as Map<String, dynamic>),
      keyCheckValue: json['KeyCheckValue'] as String,
      keyState: (json['KeyState'] as String).toKeyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final exportable = this.exportable;
    final keyArn = this.keyArn;
    final keyAttributes = this.keyAttributes;
    final keyCheckValue = this.keyCheckValue;
    final keyState = this.keyState;
    return {
      'Enabled': enabled,
      'Exportable': exportable,
      'KeyArn': keyArn,
      'KeyAttributes': keyAttributes,
      'KeyCheckValue': keyCheckValue,
      'KeyState': keyState.toValue(),
    };
  }
}

enum KeyUsage {
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
  tr31M3Iso_9797_3MacKey,
  tr31M1Iso_9797_1MacKey,
  tr31M6Iso_9797_5CmacKey,
  tr31M7HmacKey,
  tr31P0PinEncryptionKey,
  tr31P1PinGenerationKey,
  tr31S0AsymmetricKeyForDigitalSignature,
  tr31V1Ibm3624PinVerificationKey,
  tr31V2VisaPinVerificationKey,
  tr31K2Tr34AsymmetricKey,
}

extension KeyUsageValueExtension on KeyUsage {
  String toValue() {
    switch (this) {
      case KeyUsage.tr31B0BaseDerivationKey:
        return 'TR31_B0_BASE_DERIVATION_KEY';
      case KeyUsage.tr31C0CardVerificationKey:
        return 'TR31_C0_CARD_VERIFICATION_KEY';
      case KeyUsage.tr31D0SymmetricDataEncryptionKey:
        return 'TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY';
      case KeyUsage.tr31D1AsymmetricKeyForDataEncryption:
        return 'TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION';
      case KeyUsage.tr31E0EmvMkeyAppCryptograms:
        return 'TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS';
      case KeyUsage.tr31E1EmvMkeyConfidentiality:
        return 'TR31_E1_EMV_MKEY_CONFIDENTIALITY';
      case KeyUsage.tr31E2EmvMkeyIntegrity:
        return 'TR31_E2_EMV_MKEY_INTEGRITY';
      case KeyUsage.tr31E4EmvMkeyDynamicNumbers:
        return 'TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS';
      case KeyUsage.tr31E5EmvMkeyCardPersonalization:
        return 'TR31_E5_EMV_MKEY_CARD_PERSONALIZATION';
      case KeyUsage.tr31E6EmvMkeyOther:
        return 'TR31_E6_EMV_MKEY_OTHER';
      case KeyUsage.tr31K0KeyEncryptionKey:
        return 'TR31_K0_KEY_ENCRYPTION_KEY';
      case KeyUsage.tr31K1KeyBlockProtectionKey:
        return 'TR31_K1_KEY_BLOCK_PROTECTION_KEY';
      case KeyUsage.tr31K3AsymmetricKeyForKeyAgreement:
        return 'TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT';
      case KeyUsage.tr31M3Iso_9797_3MacKey:
        return 'TR31_M3_ISO_9797_3_MAC_KEY';
      case KeyUsage.tr31M1Iso_9797_1MacKey:
        return 'TR31_M1_ISO_9797_1_MAC_KEY';
      case KeyUsage.tr31M6Iso_9797_5CmacKey:
        return 'TR31_M6_ISO_9797_5_CMAC_KEY';
      case KeyUsage.tr31M7HmacKey:
        return 'TR31_M7_HMAC_KEY';
      case KeyUsage.tr31P0PinEncryptionKey:
        return 'TR31_P0_PIN_ENCRYPTION_KEY';
      case KeyUsage.tr31P1PinGenerationKey:
        return 'TR31_P1_PIN_GENERATION_KEY';
      case KeyUsage.tr31S0AsymmetricKeyForDigitalSignature:
        return 'TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE';
      case KeyUsage.tr31V1Ibm3624PinVerificationKey:
        return 'TR31_V1_IBM3624_PIN_VERIFICATION_KEY';
      case KeyUsage.tr31V2VisaPinVerificationKey:
        return 'TR31_V2_VISA_PIN_VERIFICATION_KEY';
      case KeyUsage.tr31K2Tr34AsymmetricKey:
        return 'TR31_K2_TR34_ASYMMETRIC_KEY';
    }
  }
}

extension KeyUsageFromString on String {
  KeyUsage toKeyUsage() {
    switch (this) {
      case 'TR31_B0_BASE_DERIVATION_KEY':
        return KeyUsage.tr31B0BaseDerivationKey;
      case 'TR31_C0_CARD_VERIFICATION_KEY':
        return KeyUsage.tr31C0CardVerificationKey;
      case 'TR31_D0_SYMMETRIC_DATA_ENCRYPTION_KEY':
        return KeyUsage.tr31D0SymmetricDataEncryptionKey;
      case 'TR31_D1_ASYMMETRIC_KEY_FOR_DATA_ENCRYPTION':
        return KeyUsage.tr31D1AsymmetricKeyForDataEncryption;
      case 'TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS':
        return KeyUsage.tr31E0EmvMkeyAppCryptograms;
      case 'TR31_E1_EMV_MKEY_CONFIDENTIALITY':
        return KeyUsage.tr31E1EmvMkeyConfidentiality;
      case 'TR31_E2_EMV_MKEY_INTEGRITY':
        return KeyUsage.tr31E2EmvMkeyIntegrity;
      case 'TR31_E4_EMV_MKEY_DYNAMIC_NUMBERS':
        return KeyUsage.tr31E4EmvMkeyDynamicNumbers;
      case 'TR31_E5_EMV_MKEY_CARD_PERSONALIZATION':
        return KeyUsage.tr31E5EmvMkeyCardPersonalization;
      case 'TR31_E6_EMV_MKEY_OTHER':
        return KeyUsage.tr31E6EmvMkeyOther;
      case 'TR31_K0_KEY_ENCRYPTION_KEY':
        return KeyUsage.tr31K0KeyEncryptionKey;
      case 'TR31_K1_KEY_BLOCK_PROTECTION_KEY':
        return KeyUsage.tr31K1KeyBlockProtectionKey;
      case 'TR31_K3_ASYMMETRIC_KEY_FOR_KEY_AGREEMENT':
        return KeyUsage.tr31K3AsymmetricKeyForKeyAgreement;
      case 'TR31_M3_ISO_9797_3_MAC_KEY':
        return KeyUsage.tr31M3Iso_9797_3MacKey;
      case 'TR31_M1_ISO_9797_1_MAC_KEY':
        return KeyUsage.tr31M1Iso_9797_1MacKey;
      case 'TR31_M6_ISO_9797_5_CMAC_KEY':
        return KeyUsage.tr31M6Iso_9797_5CmacKey;
      case 'TR31_M7_HMAC_KEY':
        return KeyUsage.tr31M7HmacKey;
      case 'TR31_P0_PIN_ENCRYPTION_KEY':
        return KeyUsage.tr31P0PinEncryptionKey;
      case 'TR31_P1_PIN_GENERATION_KEY':
        return KeyUsage.tr31P1PinGenerationKey;
      case 'TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE':
        return KeyUsage.tr31S0AsymmetricKeyForDigitalSignature;
      case 'TR31_V1_IBM3624_PIN_VERIFICATION_KEY':
        return KeyUsage.tr31V1Ibm3624PinVerificationKey;
      case 'TR31_V2_VISA_PIN_VERIFICATION_KEY':
        return KeyUsage.tr31V2VisaPinVerificationKey;
      case 'TR31_K2_TR34_ASYMMETRIC_KEY':
        return KeyUsage.tr31K2Tr34AsymmetricKey;
    }
    throw Exception('$this is not known in enum KeyUsage');
  }
}

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
      aliases: (json['Aliases'] as List)
          .whereNotNull()
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
      keys: (json['Keys'] as List)
          .whereNotNull()
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
      tags: (json['Tags'] as List)
          .whereNotNull()
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
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// Parameter information for root public key certificate import.
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

class StartKeyUsageOutput {
  /// The <code>KeyARN</code> of the Amazon Web Services Payment Cryptography key
  /// activated for use.
  final Key key;

  StartKeyUsageOutput({
    required this.key,
  });

  factory StartKeyUsageOutput.fromJson(Map<String, dynamic> json) {
    return StartKeyUsageOutput(
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

class StopKeyUsageOutput {
  /// The <code>KeyARN</code> of the key.
  final Key key;

  StopKeyUsageOutput({
    required this.key,
  });

  factory StopKeyUsageOutput.fromJson(Map<String, dynamic> json) {
    return StopKeyUsageOutput(
      key: Key.fromJson(json['Key'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    return {
      'Key': key,
    };
  }
}

/// A structure that contains information about a tag.
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

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Tr34KeyBlockFormat {
  x9Tr34_2012,
}

extension Tr34KeyBlockFormatValueExtension on Tr34KeyBlockFormat {
  String toValue() {
    switch (this) {
      case Tr34KeyBlockFormat.x9Tr34_2012:
        return 'X9_TR34_2012';
    }
  }
}

extension Tr34KeyBlockFormatFromString on String {
  Tr34KeyBlockFormat toTr34KeyBlockFormat() {
    switch (this) {
      case 'X9_TR34_2012':
        return Tr34KeyBlockFormat.x9Tr34_2012;
    }
    throw Exception('$this is not known in enum Tr34KeyBlockFormat');
  }
}

/// Parameter information for trusted public key certificate import.
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

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAliasOutput {
  /// The alias name.
  final Alias alias;

  UpdateAliasOutput({
    required this.alias,
  });

  factory UpdateAliasOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAliasOutput(
      alias: Alias.fromJson(json['Alias'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    return {
      'Alias': alias,
    };
  }
}

/// Parameter information for generating a WrappedKeyBlock for key exchange.
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
  /// highest order bytes of the encrypted result.
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
      keyMaterial: json['KeyMaterial'] as String,
      wrappedKeyMaterialFormat: (json['WrappedKeyMaterialFormat'] as String)
          .toWrappedKeyMaterialFormat(),
      wrappingKeyArn: json['WrappingKeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String?,
      keyCheckValueAlgorithm: (json['KeyCheckValueAlgorithm'] as String?)
          ?.toKeyCheckValueAlgorithm(),
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
      'WrappedKeyMaterialFormat': wrappedKeyMaterialFormat.toValue(),
      'WrappingKeyArn': wrappingKeyArn,
      if (keyCheckValue != null) 'KeyCheckValue': keyCheckValue,
      if (keyCheckValueAlgorithm != null)
        'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.toValue(),
    };
  }
}

enum WrappedKeyMaterialFormat {
  keyCryptogram,
  tr31KeyBlock,
  tr34KeyBlock,
}

extension WrappedKeyMaterialFormatValueExtension on WrappedKeyMaterialFormat {
  String toValue() {
    switch (this) {
      case WrappedKeyMaterialFormat.keyCryptogram:
        return 'KEY_CRYPTOGRAM';
      case WrappedKeyMaterialFormat.tr31KeyBlock:
        return 'TR31_KEY_BLOCK';
      case WrappedKeyMaterialFormat.tr34KeyBlock:
        return 'TR34_KEY_BLOCK';
    }
  }
}

extension WrappedKeyMaterialFormatFromString on String {
  WrappedKeyMaterialFormat toWrappedKeyMaterialFormat() {
    switch (this) {
      case 'KEY_CRYPTOGRAM':
        return WrappedKeyMaterialFormat.keyCryptogram;
      case 'TR31_KEY_BLOCK':
        return WrappedKeyMaterialFormat.tr31KeyBlock;
      case 'TR34_KEY_BLOCK':
        return WrappedKeyMaterialFormat.tr34KeyBlock;
    }
    throw Exception('$this is not known in enum WrappedKeyMaterialFormat');
  }
}

enum WrappingKeySpec {
  rsaOaepSha_256,
  rsaOaepSha_512,
}

extension WrappingKeySpecValueExtension on WrappingKeySpec {
  String toValue() {
    switch (this) {
      case WrappingKeySpec.rsaOaepSha_256:
        return 'RSA_OAEP_SHA_256';
      case WrappingKeySpec.rsaOaepSha_512:
        return 'RSA_OAEP_SHA_512';
    }
  }
}

extension WrappingKeySpecFromString on String {
  WrappingKeySpec toWrappingKeySpec() {
    switch (this) {
      case 'RSA_OAEP_SHA_256':
        return WrappingKeySpec.rsaOaepSha_256;
      case 'RSA_OAEP_SHA_512':
        return WrappingKeySpec.rsaOaepSha_512;
    }
    throw Exception('$this is not known in enum WrappingKeySpec');
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
