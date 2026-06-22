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

import 'v2022_02_03.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// You use the Amazon Web Services Payment Cryptography Data Plane to manage
/// how encryption keys are used for payment-related transaction processing and
/// associated cryptographic operations. You can encrypt, decrypt, generate,
/// verify, and translate payment-related cryptographic operations in Amazon Web
/// Services Payment Cryptography. For more information, see <a
/// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/data-operations.html">Data
/// operations</a> in the <i>Amazon Web Services Payment Cryptography User
/// Guide</i>.
///
/// To manage your encryption keys, you use the <a
/// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/Welcome.html">Amazon
/// Web Services Payment Cryptography Control Plane</a>. You can create, import,
/// export, share, manage, and delete keys. You can also manage Identity and
/// Access Management (IAM) policies for keys.
class PaymentCryptographyData {
  final _s.RestJsonProtocol _protocol;
  factory PaymentCryptographyData({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'dataplane.payment-cryptography',
      signingName: 'payment-cryptography',
    );
    return PaymentCryptographyData._(
      protocol: _s.RestJsonProtocol(
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
  PaymentCryptographyData._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Decrypts ciphertext data to plaintext using a symmetric (TDES, AES),
  /// asymmetric (RSA), or derived (DUKPT or EMV) encryption key scheme. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/decrypt-data.html">Decrypt
  /// data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// You can use an decryption key generated within Amazon Web Services Payment
  /// Cryptography, or you can import your own decryption key by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  /// For this operation, the key must have <code>KeyModesOfUse</code> set to
  /// <code>Decrypt</code>. In asymmetric decryption, Amazon Web Services
  /// Payment Cryptography decrypts the ciphertext using the private component
  /// of the asymmetric encryption key pair. For data encryption outside of
  /// Amazon Web Services Payment Cryptography, you can export the public
  /// component of the asymmetric key pair by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetPublicKeyCertificate.html">GetPublicCertificate</a>.
  ///
  /// This operation also supports dynamic keys, allowing you to pass a dynamic
  /// decryption key as a TR-31 WrappedKeyBlock. This can be used when key
  /// material is frequently rotated, such as during every card transaction, and
  /// there is need to avoid importing short-lived keys into Amazon Web Services
  /// Payment Cryptography. To decrypt using dynamic keys, the
  /// <code>keyARN</code> is the Key Encryption Key (KEK) of the TR-31 wrapped
  /// decryption key material. The incoming wrapped key shall have a key purpose
  /// of D0 with a mode of use of B or D. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/use-cases-acquirers-dynamickeys.html">Using
  /// Dynamic Keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// For symmetric and DUKPT decryption, Amazon Web Services Payment
  /// Cryptography supports <code>TDES</code> and <code>AES</code> algorithms.
  /// For EMV decryption, Amazon Web Services Payment Cryptography supports
  /// <code>TDES</code> algorithms. For asymmetric decryption, Amazon Web
  /// Services Payment Cryptography supports <code>RSA</code>.
  ///
  /// When you use TDES or TDES DUKPT, the ciphertext data length must be a
  /// multiple of 8 bytes. For AES or AES DUKPT, the ciphertext data length must
  /// be a multiple of 16 bytes. For RSA, it sould be equal to the key size
  /// unless padding is enabled.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>EncryptData</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetPublicKeyCertificate.html">GetPublicCertificate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [cipherText] :
  /// The ciphertext to decrypt.
  ///
  /// Parameter [decryptionAttributes] :
  /// The encryption key type and attributes for ciphertext decryption.
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses for ciphertext decryption.
  ///
  /// When a WrappedKeyBlock is provided, this value will be the identifier to
  /// the key wrapping key. Otherwise, it is the key identifier used to perform
  /// the operation.
  ///
  /// Parameter [wrappedKey] :
  /// The WrappedKeyBlock containing the encryption key for ciphertext
  /// decryption.
  Future<DecryptDataOutput> decryptData({
    required String cipherText,
    required EncryptionDecryptionAttributes decryptionAttributes,
    required String keyIdentifier,
    WrappedKey? wrappedKey,
  }) async {
    final $payload = <String, dynamic>{
      'CipherText': cipherText,
      'DecryptionAttributes': decryptionAttributes,
      if (wrappedKey != null) 'WrappedKey': wrappedKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/keys/${Uri.encodeComponent(keyIdentifier)}/decrypt',
      exceptionFnMap: _exceptionFns,
    );
    return DecryptDataOutput.fromJson(response);
  }

  /// Encrypts plaintext data to ciphertext using a symmetric (TDES, AES),
  /// asymmetric (RSA), or derived (DUKPT or EMV) encryption key scheme. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/encrypt-data.html">Encrypt
  /// data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// You can generate an encryption key within Amazon Web Services Payment
  /// Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>.
  /// You can import your own encryption key by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  ///
  /// For this operation, the key must have <code>KeyModesOfUse</code> set to
  /// <code>Encrypt</code>. In asymmetric encryption, plaintext is encrypted
  /// using public component. You can import the public component of an
  /// asymmetric key pair created outside Amazon Web Services Payment
  /// Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  ///
  /// This operation also supports dynamic keys, allowing you to pass a dynamic
  /// encryption key as a TR-31 WrappedKeyBlock. This can be used when key
  /// material is frequently rotated, such as during every card transaction, and
  /// there is need to avoid importing short-lived keys into Amazon Web Services
  /// Payment Cryptography. To encrypt using dynamic keys, the
  /// <code>keyARN</code> is the Key Encryption Key (KEK) of the TR-31 wrapped
  /// encryption key material. The incoming wrapped key shall have a key purpose
  /// of D0 with a mode of use of B or D. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/use-cases-acquirers-dynamickeys.html">Using
  /// Dynamic Keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// For symmetric and DUKPT encryption, Amazon Web Services Payment
  /// Cryptography supports <code>TDES</code> and <code>AES</code> algorithms.
  /// For EMV encryption, Amazon Web Services Payment Cryptography supports
  /// <code>TDES</code> algorithms.For asymmetric encryption, Amazon Web
  /// Services Payment Cryptography supports <code>RSA</code>.
  ///
  /// When you use TDES or TDES DUKPT, the plaintext data length must be a
  /// multiple of 8 bytes. For AES or AES DUKPT, the plaintext data length must
  /// be a multiple of 16 bytes. For RSA, it sould be equal to the key size
  /// unless padding is enabled.
  ///
  /// To encrypt using DUKPT, you must already have a BDK (Base Derivation Key)
  /// key in your account with <code>KeyModesOfUse</code> set to
  /// <code>DeriveKey</code>, or you can generate a new DUKPT key by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>.
  /// To encrypt using EMV, you must already have an IMK (Issuer Master Key) key
  /// in your account with <code>KeyModesOfUse</code> set to
  /// <code>DeriveKey</code>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DecryptData</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetPublicKeyCertificate.html">GetPublicCertificate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// </li>
  /// <li>
  /// <a>ReEncryptData</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [encryptionAttributes] :
  /// The encryption key type and attributes for plaintext encryption.
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses for plaintext encryption.
  ///
  /// When a WrappedKeyBlock is provided, this value will be the identifier to
  /// the key wrapping key. Otherwise, it is the key identifier used to perform
  /// the operation.
  ///
  /// Parameter [plainText] :
  /// The plaintext to be encrypted.
  /// <note>
  /// For encryption using asymmetric keys, plaintext data length is constrained
  /// by encryption key strength that you define in <code>KeyAlgorithm</code>
  /// and padding type that you define in
  /// <code>AsymmetricEncryptionAttributes</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/encrypt-data.html">Encrypt
  /// data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  /// </note>
  ///
  /// Parameter [wrappedKey] :
  /// The WrappedKeyBlock containing the encryption key for plaintext
  /// encryption.
  Future<EncryptDataOutput> encryptData({
    required EncryptionDecryptionAttributes encryptionAttributes,
    required String keyIdentifier,
    required String plainText,
    WrappedKey? wrappedKey,
  }) async {
    final $payload = <String, dynamic>{
      'EncryptionAttributes': encryptionAttributes,
      'PlainText': plainText,
      if (wrappedKey != null) 'WrappedKey': wrappedKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/keys/${Uri.encodeComponent(keyIdentifier)}/encrypt',
      exceptionFnMap: _exceptionFns,
    );
    return EncryptDataOutput.fromJson(response);
  }

  /// Generates a <code>KekValidationRequest</code> or a
  /// <code>KekValidationResponse</code> for node-to-node initialization between
  /// payment processing nodes using <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/as2805.html">Australian
  /// Standard 2805 (AS2805)</a>.
  ///
  /// During node-to-node initialization, both communicating nodes must validate
  /// that they possess the correct Key Encrypting Keys (KEKs) before proceeding
  /// with session key exchange. In AS2805, the sending KEK (KEKs) of one node
  /// corresponds to the receiving KEK (KEKr) of its partner node. Each node
  /// uses its KEK to encrypt and decrypt session keys exchanged between the
  /// nodes. A KEK can be created or imported into Amazon Web Services Payment
  /// Cryptography using either the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// operations.
  ///
  /// To use <code>GenerateAs2805KekValidation</code> to generate a KEK
  /// validation request, set <code>KekValidationType</code> to
  /// <code>KekValidationRequest</code>. This operation returns both
  /// <code>RandomKeySend</code> (KRs) and <code>RandomKeyReceive</code> (KRr)
  /// as response values. The partnering node receives the KRs, uses its KEKr to
  /// decrypt it, and generates a KRr which is an inverted value of KRs. The
  /// node receiving the KRr validates it against its own KRr generated during
  /// KEK validation request outside of Amazon Web Services Payment
  /// Cryptography.
  ///
  /// You can also use this operation to generate a KEK validation response, by
  /// setting <code>KekValidationType</code> to
  /// <code>KekValidationResponse</code> and providing the incoming KRs. This
  /// operation then calculates a KRr. To learn more about more about
  /// node-to-node initialization, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/as2805.kekvalidation.html">Validation
  /// of KEK</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [kekValidationType] :
  /// Defines whether to generate a KEK validation request or KEK validation
  /// response for node-to-node initialization.
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of sending KEK that Amazon Web Services Payment
  /// Cryptography uses for node-to-node initialization
  ///
  /// Parameter [randomKeySendVariantMask] :
  /// The key variant to use for generating a random key for KEK validation
  /// during node-to-node initialization.
  Future<GenerateAs2805KekValidationOutput> generateAs2805KekValidation({
    required As2805KekValidationType kekValidationType,
    required String keyIdentifier,
    required RandomKeySendVariantMask randomKeySendVariantMask,
  }) async {
    final $payload = <String, dynamic>{
      'KekValidationType': kekValidationType,
      'KeyIdentifier': keyIdentifier,
      'RandomKeySendVariantMask': randomKeySendVariantMask.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/as2805kekvalidation/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateAs2805KekValidationOutput.fromJson(response);
  }

  /// Generates an Authorization Request Cryptogram (ARQC) for an EMV chip
  /// payment card authorization. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/data-operations.generateauthrequestcryptogram.html">Generate
  /// auth request cryptogram</a> in the <i>Amazon Web Services Payment
  /// Cryptography User Guide</i>.
  ///
  /// ARQC generation uses an Issuer Master Key (IMK) for application
  /// cryptograms (TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS) to derive a session key,
  /// which is then used to generate the cryptogram from the provided
  /// transaction data (when applicable). To use this operation, you must first
  /// create or import an IMK-AC key by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  /// The <code>KeyModesOfUse</code> should be set to <code>DeriveKey</code> for
  /// the IMK-AC encryption key.
  /// <important>
  /// This operation is intended for development and testing scenarios only. It
  /// is not recommended to use this operation as a substitute for card-based
  /// cryptogram generation in production payment flows.
  /// </important>
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>VerifyAuthRequestCryptogram</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the IMK-AC (TR31_E0_EMV_MKEY_APP_CRYPTOGRAMS)
  /// that Amazon Web Services Payment Cryptography uses to generate the ARQC.
  ///
  /// Parameter [majorKeyDerivationMode] :
  /// The method to use when deriving the major encryption key for ARQC
  /// generation within Amazon Web Services Payment Cryptography.
  ///
  /// Parameter [sessionKeyDerivationAttributes] :
  /// The attributes and values to use for deriving a session key for ARQC
  /// generation within Amazon Web Services Payment Cryptography.
  ///
  /// Parameter [transactionData] :
  /// The transaction data that Amazon Web Services Payment Cryptography uses
  /// for ARQC generation. The same transaction data is used for ARQC
  /// verification by the issuer using <a>VerifyAuthRequestCryptogram</a>.
  Future<GenerateAuthRequestCryptogramOutput> generateAuthRequestCryptogram({
    required String keyIdentifier,
    required MajorKeyDerivationMode majorKeyDerivationMode,
    required SessionKeyDerivation sessionKeyDerivationAttributes,
    required String transactionData,
  }) async {
    final $payload = <String, dynamic>{
      'KeyIdentifier': keyIdentifier,
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'SessionKeyDerivationAttributes': sessionKeyDerivationAttributes,
      'TransactionData': transactionData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cryptogram/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateAuthRequestCryptogramOutput.fromJson(response);
  }

  /// Generates card-related validation data using algorithms such as Card
  /// Verification Values (CVV/CVV2), Dynamic Card Verification Values
  /// (dCVV/dCVV2), or Card Security Codes (CSC). For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/generate-card-data.html">Generate
  /// card data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// This operation generates a CVV or CSC value that is printed on a payment
  /// credit or debit card during card production. The CVV or CSC, PAN (Primary
  /// Account Number) and expiration date of the card are required to check its
  /// validity during transaction processing. To begin this operation, a CVK
  /// (Card Verification Key) encryption key is required. You can use <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// to establish a CVK within Amazon Web Services Payment Cryptography. The
  /// <code>KeyModesOfUse</code> should be set to <code>Generate</code> and
  /// <code>Verify</code> for a CVK encryption key.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
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
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// </li>
  /// <li>
  /// <a>VerifyCardValidationData</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [generationAttributes] :
  /// The algorithm for generating CVV or CSC values for the card within Amazon
  /// Web Services Payment Cryptography.
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the CVK encryption key that Amazon Web Services
  /// Payment Cryptography uses to generate card data.
  ///
  /// Parameter [primaryAccountNumber] :
  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card that associates the card with a specific account holder.
  ///
  /// Parameter [validationDataLength] :
  /// The length of the CVV or CSC to be generated. The default value is 3.
  Future<GenerateCardValidationDataOutput> generateCardValidationData({
    required CardGenerationAttributes generationAttributes,
    required String keyIdentifier,
    required String primaryAccountNumber,
    int? validationDataLength,
  }) async {
    _s.validateNumRange(
      'validationDataLength',
      validationDataLength,
      3,
      5,
    );
    final $payload = <String, dynamic>{
      'GenerationAttributes': generationAttributes,
      'KeyIdentifier': keyIdentifier,
      'PrimaryAccountNumber': primaryAccountNumber,
      if (validationDataLength != null)
        'ValidationDataLength': validationDataLength,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cardvalidationdata/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateCardValidationDataOutput.fromJson(response);
  }

  /// Generates a Message Authentication Code (MAC) cryptogram within Amazon Web
  /// Services Payment Cryptography.
  ///
  /// You can use this operation to authenticate card-related data by using
  /// known data values to generate MAC for data validation between the sending
  /// and receiving parties. This operation uses message data, a secret
  /// encryption key and MAC algorithm to generate a unique MAC value for
  /// transmission. The receiving party of the MAC must use the same message
  /// data, secret encryption key and MAC algorithm to reproduce another MAC
  /// value for comparision.
  ///
  /// You can use this operation to generate a DUPKT, CMAC, HMAC or EMV MAC by
  /// setting generation attributes and algorithm to the associated values. The
  /// MAC generation encryption key must have valid values for
  /// <code>KeyUsage</code> such as <code>TR31_M7_HMAC_KEY</code> for HMAC
  /// generation, and the key must have <code>KeyModesOfUse</code> set to
  /// <code>Generate</code>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>VerifyMac</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [generationAttributes] :
  /// The attributes and data values to use for MAC generation within Amazon Web
  /// Services Payment Cryptography.
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the MAC generation encryption key.
  ///
  /// Parameter [messageData] :
  /// The data for which a MAC is under generation. This value must be
  /// hexBinary.
  ///
  /// Parameter [macLength] :
  /// The length of a MAC under generation.
  Future<GenerateMacOutput> generateMac({
    required MacAttributes generationAttributes,
    required String keyIdentifier,
    required String messageData,
    int? macLength,
  }) async {
    _s.validateNumRange(
      'macLength',
      macLength,
      4,
      32,
    );
    final $payload = <String, dynamic>{
      'GenerationAttributes': generationAttributes,
      'KeyIdentifier': keyIdentifier,
      'MessageData': messageData,
      if (macLength != null) 'MacLength': macLength,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/mac/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateMacOutput.fromJson(response);
  }

  /// Generates an issuer script mac for EMV payment cards that use offline PINs
  /// as the cardholder verification method (CVM).
  ///
  /// This operation generates an authenticated issuer script response by
  /// appending the incoming message data (APDU command) with the target
  /// encrypted PIN block in ISO2 format. The command structure and method to
  /// send the issuer script update to the card is not defined by this operation
  /// and is typically determined by the applicable payment card scheme.
  ///
  /// The primary inputs to this operation include the incoming new encrypted
  /// pinblock, PIN encryption key (PEK), issuer master key (IMK), primary
  /// account number (PAN), and the payment card derivation method.
  ///
  /// The operation uses two issuer master keys - secure messaging for
  /// confidentiality (IMK-SMC) and secure messaging for integrity (IMK-SMI).
  /// The SMC key is used to internally derive a key to secure the pin, while
  /// SMI key is used to internally derive a key to authenticate the script
  /// reponse as per the <a href="https://www.emvco.com/specifications/">EMV 4.4
  /// - Book 2 - Security and Key Management</a> specification.
  ///
  /// This operation supports Amex, EMV2000, EMVCommon, Mastercard and Visa
  /// derivation methods, each requiring specific input parameters. Users must
  /// follow the specific derivation method and input parameters defined by the
  /// respective payment card scheme.
  /// <note>
  /// Use <a>GenerateMac</a> operation when sending a script update to an EMV
  /// card that does not involve PIN change. When assigning IAM permissions, it
  /// is important to understand that <a>EncryptData</a> using EMV keys and
  /// <a>GenerateMac</a> perform similar functions to this command.
  /// </note>
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>EncryptData</a>
  /// </li>
  /// <li>
  /// <a>GenerateMac</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [derivationMethodAttributes] :
  /// The attributes and data values to derive payment card specific
  /// confidentiality and integrity keys.
  ///
  /// Parameter [messageData] :
  /// The message data is the APDU command from the card reader or terminal. The
  /// target encrypted PIN block, after translation to ISO2 format, is appended
  /// to this message data to generate an issuer script response.
  ///
  /// Parameter [newEncryptedPinBlock] :
  /// The incoming new encrypted PIN block data for offline pin change on an EMV
  /// card.
  ///
  /// Parameter [newPinPekIdentifier] :
  /// The <code>keyARN</code> of the PEK protecting the incoming new encrypted
  /// PIN block.
  ///
  /// Parameter [pinBlockFormat] :
  /// The PIN encoding format of the incoming new encrypted PIN block as
  /// specified in ISO 9564.
  ///
  /// Parameter [secureMessagingConfidentialityKeyIdentifier] :
  /// The <code>keyARN</code> of the issuer master key (IMK-SMC) used to protect
  /// the PIN block data in the issuer script response.
  ///
  /// Parameter [secureMessagingIntegrityKeyIdentifier] :
  /// The <code>keyARN</code> of the issuer master key (IMK-SMI) used to
  /// authenticate the issuer script response.
  Future<GenerateMacEmvPinChangeOutput> generateMacEmvPinChange({
    required DerivationMethodAttributes derivationMethodAttributes,
    required String messageData,
    required String newEncryptedPinBlock,
    required String newPinPekIdentifier,
    required PinBlockFormatForEmvPinChange pinBlockFormat,
    required String secureMessagingConfidentialityKeyIdentifier,
    required String secureMessagingIntegrityKeyIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'DerivationMethodAttributes': derivationMethodAttributes,
      'MessageData': messageData,
      'NewEncryptedPinBlock': newEncryptedPinBlock,
      'NewPinPekIdentifier': newPinPekIdentifier,
      'PinBlockFormat': pinBlockFormat.value,
      'SecureMessagingConfidentialityKeyIdentifier':
          secureMessagingConfidentialityKeyIdentifier,
      'SecureMessagingIntegrityKeyIdentifier':
          secureMessagingIntegrityKeyIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/macemvpinchange/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateMacEmvPinChangeOutput.fromJson(response);
  }

  /// Generates pin-related data such as PIN, PIN Verification Value (PVV), PIN
  /// Block, and PIN Offset during new card issuance or reissuance. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/generate-pin-data.html">Generate
  /// PIN data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// PIN data is never transmitted in clear to or from Amazon Web Services
  /// Payment Cryptography. This operation generates PIN, PVV, or PIN Offset and
  /// then encrypts it using Pin Encryption Key (PEK) to create an
  /// <code>EncryptedPinBlock</code> for transmission from Amazon Web Services
  /// Payment Cryptography. This operation uses a separate Pin Verification Key
  /// (PVK) for VISA PVV generation.
  ///
  /// Using ECDH key exchange, you can receive cardholder selectable PINs into
  /// Amazon Web Services Payment Cryptography. The ECDH derived key protects
  /// the incoming PIN block. You can also use it for reveal PIN, wherein the
  /// generated PIN block is protected by the ECDH derived key before
  /// transmission from Amazon Web Services Payment Cryptography. For more
  /// information on establishing ECDH derived keys, see the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/create-keys.html">Generating
  /// keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GenerateCardValidationData</a>
  /// </li>
  /// <li>
  /// <a>TranslatePinData</a>
  /// </li>
  /// <li>
  /// <a>VerifyPinData</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [encryptionKeyIdentifier] :
  /// The <code>keyARN</code> of the PEK that Amazon Web Services Payment
  /// Cryptography uses to encrypt the PIN Block. For ECDH, it is the
  /// <code>keyARN</code> of the asymmetric ECC key.
  ///
  /// Parameter [generationAttributes] :
  /// The attributes and values to use for PIN, PVV, or PIN Offset generation.
  ///
  /// Parameter [generationKeyIdentifier] :
  /// The <code>keyARN</code> of the PEK that Amazon Web Services Payment
  /// Cryptography uses for pin data generation.
  ///
  /// Parameter [pinBlockFormat] :
  /// The PIN encoding format for pin data generation as specified in ISO 9564.
  /// Amazon Web Services Payment Cryptography supports
  /// <code>ISO_Format_0</code>, <code>ISO_Format_3</code> and
  /// <code>ISO_Format_4</code>.
  ///
  /// The <code>ISO_Format_0</code> PIN block format is equivalent to the ANSI
  /// X9.8, VISA-1, and ECI-1 PIN block formats. It is similar to a VISA-4 PIN
  /// block format. It supports a PIN from 4 to 12 digits in length.
  ///
  /// The <code>ISO_Format_3</code> PIN block format is the same as
  /// <code>ISO_Format_0</code> except that the fill digits are random values
  /// from 10 to 15.
  ///
  /// The <code>ISO_Format_4</code> PIN block format is the only one supporting
  /// AES encryption.
  ///
  /// Parameter [pinDataLength] :
  /// The length of PIN under generation.
  ///
  /// Parameter [primaryAccountNumber] :
  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card that associates the card with a specific account holder.
  Future<GeneratePinDataOutput> generatePinData({
    required String encryptionKeyIdentifier,
    required PinGenerationAttributes generationAttributes,
    required String generationKeyIdentifier,
    required PinBlockFormatForPinData pinBlockFormat,
    WrappedKey? encryptionWrappedKey,
    int? pinDataLength,
    String? primaryAccountNumber,
  }) async {
    _s.validateNumRange(
      'pinDataLength',
      pinDataLength,
      4,
      12,
    );
    final $payload = <String, dynamic>{
      'EncryptionKeyIdentifier': encryptionKeyIdentifier,
      'GenerationAttributes': generationAttributes,
      'GenerationKeyIdentifier': generationKeyIdentifier,
      'PinBlockFormat': pinBlockFormat.value,
      if (encryptionWrappedKey != null)
        'EncryptionWrappedKey': encryptionWrappedKey,
      if (pinDataLength != null) 'PinDataLength': pinDataLength,
      if (primaryAccountNumber != null)
        'PrimaryAccountNumber': primaryAccountNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pindata/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GeneratePinDataOutput.fromJson(response);
  }

  /// Re-encrypt ciphertext using DUKPT or Symmetric data encryption keys.
  ///
  /// You can either generate an encryption key within Amazon Web Services
  /// Payment Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// or import your own encryption key by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  /// The <code>KeyArn</code> for use with this operation must be in a
  /// compatible key state with <code>KeyModesOfUse</code> set to
  /// <code>Encrypt</code>.
  ///
  /// This operation also supports dynamic keys, allowing you to pass a dynamic
  /// encryption key as a TR-31 WrappedKeyBlock. This can be used when key
  /// material is frequently rotated, such as during every card transaction, and
  /// there is need to avoid importing short-lived keys into Amazon Web Services
  /// Payment Cryptography. To re-encrypt using dynamic keys, the
  /// <code>keyARN</code> is the Key Encryption Key (KEK) of the TR-31 wrapped
  /// encryption key material. The incoming wrapped key shall have a key purpose
  /// of D0 with a mode of use of B or D. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/use-cases-acquirers-dynamickeys.html">Using
  /// Dynamic Keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// For symmetric and DUKPT encryption, Amazon Web Services Payment
  /// Cryptography supports <code>TDES</code> and <code>AES</code> algorithms.
  /// To encrypt using DUKPT, a DUKPT key must already exist within your account
  /// with <code>KeyModesOfUse</code> set to <code>DeriveKey</code> or a new
  /// DUKPT can be generated by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DecryptData</a>
  /// </li>
  /// <li>
  /// <a>EncryptData</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetPublicKeyCertificate.html">GetPublicCertificate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [cipherText] :
  /// Ciphertext to be encrypted. The minimum allowed length is 16 bytes and
  /// maximum allowed length is 4096 bytes.
  ///
  /// Parameter [incomingEncryptionAttributes] :
  /// The attributes and values for incoming ciphertext.
  ///
  /// Parameter [incomingKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key of incoming ciphertext data.
  ///
  /// When a WrappedKeyBlock is provided, this value will be the identifier to
  /// the key wrapping key. Otherwise, it is the key identifier used to perform
  /// the operation.
  ///
  /// Parameter [outgoingEncryptionAttributes] :
  /// The attributes and values for outgoing ciphertext data after encryption by
  /// Amazon Web Services Payment Cryptography.
  ///
  /// Parameter [outgoingKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key of outgoing ciphertext data
  /// after encryption by Amazon Web Services Payment Cryptography.
  ///
  /// Parameter [incomingWrappedKey] :
  /// The WrappedKeyBlock containing the encryption key of incoming ciphertext
  /// data.
  ///
  /// Parameter [outgoingWrappedKey] :
  /// The WrappedKeyBlock containing the encryption key of outgoing ciphertext
  /// data after encryption by Amazon Web Services Payment Cryptography.
  Future<ReEncryptDataOutput> reEncryptData({
    required String cipherText,
    required ReEncryptionAttributes incomingEncryptionAttributes,
    required String incomingKeyIdentifier,
    required ReEncryptionAttributes outgoingEncryptionAttributes,
    required String outgoingKeyIdentifier,
    WrappedKey? incomingWrappedKey,
    WrappedKey? outgoingWrappedKey,
  }) async {
    final $payload = <String, dynamic>{
      'CipherText': cipherText,
      'IncomingEncryptionAttributes': incomingEncryptionAttributes,
      'OutgoingEncryptionAttributes': outgoingEncryptionAttributes,
      'OutgoingKeyIdentifier': outgoingKeyIdentifier,
      if (incomingWrappedKey != null) 'IncomingWrappedKey': incomingWrappedKey,
      if (outgoingWrappedKey != null) 'OutgoingWrappedKey': outgoingWrappedKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/keys/${Uri.encodeComponent(incomingKeyIdentifier)}/reencrypt',
      exceptionFnMap: _exceptionFns,
    );
    return ReEncryptDataOutput.fromJson(response);
  }

  /// Translates an cryptographic key between different wrapping keys without
  /// importing the key into Amazon Web Services Payment Cryptography.
  ///
  /// This operation can be used when key material is frequently rotated, such
  /// as during every card transaction, and there is a need to avoid importing
  /// short-lived keys into Amazon Web Services Payment Cryptography. It
  /// translates short-lived transaction keys such as <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/terminology.html#terms.pek">PEK</a>
  /// generated for each transaction and wrapped with an <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/terminology.html#terms.ecdh">ECDH</a>
  /// derived wrapping key to another <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/terminology.html#terms.kek">KEK</a>
  /// wrapping key.
  ///
  /// Before using this operation, you must first request the public key
  /// certificate of the ECC key pair generated within Amazon Web Services
  /// Payment Cryptography to establish an ECDH key agreement. In
  /// <code>TranslateKeyData</code>, the service uses its own ECC key pair,
  /// public certificate of receiving ECC key pair, and the key derivation
  /// parameters to generate a derived key. The service uses this derived key to
  /// unwrap the incoming transaction key received as a TR31WrappedKeyBlock and
  /// re-wrap using a user provided KEK to generate an outgoing
  /// Tr31WrappedKeyBlock.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
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
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetPublicKeyCertificate.html">GetPublicCertificate</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [incomingKeyMaterial] :
  /// Parameter information of the TR31WrappedKeyBlock containing the
  /// transaction key.
  ///
  /// Parameter [outgoingKeyMaterial] :
  /// Parameter information of the wrapping key used to wrap the transaction key
  /// in the outgoing TR31WrappedKeyBlock.
  ///
  /// Parameter [keyCheckValueAlgorithm] :
  /// The key check value (KCV) algorithm used for calculating the KCV of the
  /// derived key.
  Future<TranslateKeyMaterialOutput> translateKeyMaterial({
    required IncomingKeyMaterial incomingKeyMaterial,
    required OutgoingKeyMaterial outgoingKeyMaterial,
    KeyCheckValueAlgorithm? keyCheckValueAlgorithm,
  }) async {
    final $payload = <String, dynamic>{
      'IncomingKeyMaterial': incomingKeyMaterial,
      'OutgoingKeyMaterial': outgoingKeyMaterial,
      if (keyCheckValueAlgorithm != null)
        'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/keymaterial/translate',
      exceptionFnMap: _exceptionFns,
    );
    return TranslateKeyMaterialOutput.fromJson(response);
  }

  /// Translates encrypted PIN block from and to ISO 9564 formats 0,1,3,4. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/translate-pin-data.html">Translate
  /// PIN data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// PIN block translation involves changing a PIN block from one encryption
  /// key to another and optionally change its format. PIN block translation
  /// occurs entirely within the HSM boundary and PIN data never enters or
  /// leaves Amazon Web Services Payment Cryptography in clear text. The
  /// encryption key transformation can be from PEK (Pin Encryption Key) to BDK
  /// (Base Derivation Key) for DUKPT or from BDK for DUKPT to PEK.
  ///
  /// Amazon Web Services Payment Cryptography also supports use of dynamic keys
  /// and ECDH (Elliptic Curve Diffie-Hellman) based key exchange for this
  /// operation.
  ///
  /// Dynamic keys allow you to pass a PEK as a TR-31 WrappedKeyBlock. They can
  /// be used when key material is frequently rotated, such as during every card
  /// transaction, and there is need to avoid importing short-lived keys into
  /// Amazon Web Services Payment Cryptography. To translate PIN block using
  /// dynamic keys, the <code>keyARN</code> is the Key Encryption Key (KEK) of
  /// the TR-31 wrapped PEK. The incoming wrapped key shall have a key purpose
  /// of P0 with a mode of use of B or D. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/use-cases-acquirers-dynamickeys.html">Using
  /// Dynamic Keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// Using ECDH key exchange, you can receive cardholder selectable PINs into
  /// Amazon Web Services Payment Cryptography. The ECDH derived key protects
  /// the incoming PIN block, which is translated to a PEK encrypted PIN block
  /// for use within the service. You can also use ECDH for reveal PIN, wherein
  /// the service translates the PIN block from PEK to a ECDH derived encryption
  /// key. For more information on establishing ECDH derived keys, see the <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/create-keys.html">Creating
  /// keys</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// The allowed combinations of PIN block format translations are guided by
  /// PCI. It is important to note that not all encrypted PIN block formats
  /// (example, format 1) require PAN (Primary Account Number) as input. And as
  /// such, PIN block format that requires PAN (example, formats 0,3,4) cannot
  /// be translated to a format (format 1) that does not require a PAN for
  /// generation.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  /// <note>
  /// Amazon Web Services Payment Cryptography currently supports ISO PIN block
  /// 4 translation for PIN block built using legacy PAN length. That is, PAN is
  /// the right most 12 digits excluding the check digits.
  /// </note>
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GeneratePinData</a>
  /// </li>
  /// <li>
  /// <a>VerifyPinData</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [encryptedPinBlock] :
  /// The encrypted PIN block data that Amazon Web Services Payment Cryptography
  /// translates.
  ///
  /// Parameter [incomingKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key under which incoming PIN
  /// block data is encrypted. This key type can be PEK or BDK.
  ///
  /// For dynamic keys, it is the <code>keyARN</code> of KEK of the TR-31
  /// wrapped PEK. For ECDH, it is the <code>keyARN</code> of the asymmetric ECC
  /// key.
  ///
  /// Parameter [incomingTranslationAttributes] :
  /// The format of the incoming PIN block data for translation within Amazon
  /// Web Services Payment Cryptography.
  ///
  /// Parameter [outgoingKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key for encrypting outgoing PIN
  /// block data. This key type can be PEK or BDK.
  ///
  /// For ECDH, it is the <code>keyARN</code> of the asymmetric ECC key.
  ///
  /// Parameter [outgoingTranslationAttributes] :
  /// The format of the outgoing PIN block data after translation by Amazon Web
  /// Services Payment Cryptography.
  ///
  /// Parameter [incomingAs2805Attributes] :
  /// The attributes and values to use for incoming AS2805 encryption key for
  /// PIN block translation.
  ///
  /// Parameter [incomingDukptAttributes] :
  /// The attributes and values to use for incoming DUKPT encryption key for PIN
  /// block translation.
  ///
  /// Parameter [incomingWrappedKey] :
  /// The WrappedKeyBlock containing the encryption key under which incoming PIN
  /// block data is encrypted.
  ///
  /// Parameter [outgoingDukptAttributes] :
  /// The attributes and values to use for outgoing DUKPT encryption key after
  /// PIN block translation.
  ///
  /// Parameter [outgoingWrappedKey] :
  /// The WrappedKeyBlock containing the encryption key for encrypting outgoing
  /// PIN block data.
  Future<TranslatePinDataOutput> translatePinData({
    required String encryptedPinBlock,
    required String incomingKeyIdentifier,
    required TranslationIsoFormats incomingTranslationAttributes,
    required String outgoingKeyIdentifier,
    required TranslationIsoFormats outgoingTranslationAttributes,
    As2805PekDerivationAttributes? incomingAs2805Attributes,
    DukptDerivationAttributes? incomingDukptAttributes,
    WrappedKey? incomingWrappedKey,
    DukptDerivationAttributes? outgoingDukptAttributes,
    WrappedKey? outgoingWrappedKey,
  }) async {
    final $payload = <String, dynamic>{
      'EncryptedPinBlock': encryptedPinBlock,
      'IncomingKeyIdentifier': incomingKeyIdentifier,
      'IncomingTranslationAttributes': incomingTranslationAttributes,
      'OutgoingKeyIdentifier': outgoingKeyIdentifier,
      'OutgoingTranslationAttributes': outgoingTranslationAttributes,
      if (incomingAs2805Attributes != null)
        'IncomingAs2805Attributes': incomingAs2805Attributes,
      if (incomingDukptAttributes != null)
        'IncomingDukptAttributes': incomingDukptAttributes,
      if (incomingWrappedKey != null) 'IncomingWrappedKey': incomingWrappedKey,
      if (outgoingDukptAttributes != null)
        'OutgoingDukptAttributes': outgoingDukptAttributes,
      if (outgoingWrappedKey != null) 'OutgoingWrappedKey': outgoingWrappedKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pindata/translate',
      exceptionFnMap: _exceptionFns,
    );
    return TranslatePinDataOutput.fromJson(response);
  }

  /// Verifies Authorization Request Cryptogram (ARQC) for a EMV chip payment
  /// card authorization. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/data-operations.verifyauthrequestcryptogram.html">Verify
  /// auth request cryptogram</a> in the <i>Amazon Web Services Payment
  /// Cryptography User Guide</i>.
  ///
  /// ARQC generation is done outside of Amazon Web Services Payment
  /// Cryptography and is typically generated on a point of sale terminal for an
  /// EMV chip card to obtain payment authorization during transaction time. For
  /// ARQC verification, you must first import the ARQC generated outside of
  /// Amazon Web Services Payment Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  /// This operation uses the imported ARQC and an major encryption key (DUKPT)
  /// created by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// to either provide a boolean ARQC verification result or provide an APRC
  /// (Authorization Response Cryptogram) response using Method 1 or Method 2.
  /// The <code>ARPC_METHOD_1</code> uses <code>AuthResponseCode</code> to
  /// generate ARPC and <code>ARPC_METHOD_2</code> uses
  /// <code>CardStatusUpdate</code> to generate ARPC.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>VerifyCardValidationData</a>
  /// </li>
  /// <li>
  /// <a>VerifyPinData</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  ///
  /// Parameter [authRequestCryptogram] :
  /// The auth request cryptogram imported into Amazon Web Services Payment
  /// Cryptography for ARQC verification using a major encryption key and
  /// transaction data.
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the major encryption key that Amazon Web
  /// Services Payment Cryptography uses for ARQC verification.
  ///
  /// Parameter [majorKeyDerivationMode] :
  /// The method to use when deriving the major encryption key for ARQC
  /// verification within Amazon Web Services Payment Cryptography. The same key
  /// derivation mode was used for ARQC generation outside of Amazon Web
  /// Services Payment Cryptography.
  ///
  /// Parameter [sessionKeyDerivationAttributes] :
  /// The attributes and values to use for deriving a session key for ARQC
  /// verification within Amazon Web Services Payment Cryptography. The same
  /// attributes were used for ARQC generation outside of Amazon Web Services
  /// Payment Cryptography.
  ///
  /// Parameter [transactionData] :
  /// The transaction data that Amazon Web Services Payment Cryptography uses
  /// for ARQC verification. The same transaction is used for ARQC generation
  /// outside of Amazon Web Services Payment Cryptography.
  ///
  /// Parameter [authResponseAttributes] :
  /// The attributes and values for auth request cryptogram verification. These
  /// parameters are required in case using ARPC Method 1 or Method 2 for ARQC
  /// verification.
  Future<VerifyAuthRequestCryptogramOutput> verifyAuthRequestCryptogram({
    required String authRequestCryptogram,
    required String keyIdentifier,
    required MajorKeyDerivationMode majorKeyDerivationMode,
    required SessionKeyDerivation sessionKeyDerivationAttributes,
    required String transactionData,
    CryptogramAuthResponse? authResponseAttributes,
  }) async {
    final $payload = <String, dynamic>{
      'AuthRequestCryptogram': authRequestCryptogram,
      'KeyIdentifier': keyIdentifier,
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'SessionKeyDerivationAttributes': sessionKeyDerivationAttributes,
      'TransactionData': transactionData,
      if (authResponseAttributes != null)
        'AuthResponseAttributes': authResponseAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cryptogram/verify',
      exceptionFnMap: _exceptionFns,
    );
    return VerifyAuthRequestCryptogramOutput.fromJson(response);
  }

  /// Verifies card-related validation data using algorithms such as Card
  /// Verification Values (CVV/CVV2), Dynamic Card Verification Values
  /// (dCVV/dCVV2) and Card Security Codes (CSC). For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/verify-card-data.html">Verify
  /// card data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// This operation validates the CVV or CSC codes that is printed on a payment
  /// credit or debit card during card payment transaction. The input values are
  /// typically provided as part of an inbound transaction to an issuer or
  /// supporting platform partner. Amazon Web Services Payment Cryptography uses
  /// CVV or CSC, PAN (Primary Account Number) and expiration date of the card
  /// to check its validity during transaction processing. In this operation,
  /// the CVK (Card Verification Key) encryption key for use with card data
  /// verification is same as the one in used for
  /// <a>GenerateCardValidationData</a>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GenerateCardValidationData</a>
  /// </li>
  /// <li>
  /// <a>VerifyAuthRequestCryptogram</a>
  /// </li>
  /// <li>
  /// <a>VerifyPinData</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the CVK encryption key that Amazon Web Services
  /// Payment Cryptography uses to verify card data.
  ///
  /// Parameter [primaryAccountNumber] :
  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card that associates the card with a specific account holder.
  ///
  /// Parameter [validationData] :
  /// The CVV or CSC value for use for card data verification within Amazon Web
  /// Services Payment Cryptography.
  ///
  /// Parameter [verificationAttributes] :
  /// The algorithm to use for verification of card data within Amazon Web
  /// Services Payment Cryptography.
  Future<VerifyCardValidationDataOutput> verifyCardValidationData({
    required String keyIdentifier,
    required String primaryAccountNumber,
    required String validationData,
    required CardVerificationAttributes verificationAttributes,
  }) async {
    final $payload = <String, dynamic>{
      'KeyIdentifier': keyIdentifier,
      'PrimaryAccountNumber': primaryAccountNumber,
      'ValidationData': validationData,
      'VerificationAttributes': verificationAttributes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cardvalidationdata/verify',
      exceptionFnMap: _exceptionFns,
    );
    return VerifyCardValidationDataOutput.fromJson(response);
  }

  /// Verifies a Message Authentication Code (MAC).
  ///
  /// You can use this operation to verify MAC for message data authentication
  /// such as . In this operation, you must use the same message data, secret
  /// encryption key and MAC algorithm that was used to generate MAC. You can
  /// use this operation to verify a DUPKT, CMAC, HMAC or EMV MAC by setting
  /// generation attributes and algorithm to the associated values.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GenerateMac</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses to verify MAC data.
  ///
  /// Parameter [mac] :
  /// The MAC being verified.
  ///
  /// Parameter [messageData] :
  /// The data on for which MAC is under verification. This value must be
  /// hexBinary.
  ///
  /// Parameter [verificationAttributes] :
  /// The attributes and data values to use for MAC verification within Amazon
  /// Web Services Payment Cryptography.
  ///
  /// Parameter [macLength] :
  /// The length of the MAC.
  Future<VerifyMacOutput> verifyMac({
    required String keyIdentifier,
    required String mac,
    required String messageData,
    required MacAttributes verificationAttributes,
    int? macLength,
  }) async {
    _s.validateNumRange(
      'macLength',
      macLength,
      4,
      32,
    );
    final $payload = <String, dynamic>{
      'KeyIdentifier': keyIdentifier,
      'Mac': mac,
      'MessageData': messageData,
      'VerificationAttributes': verificationAttributes,
      if (macLength != null) 'MacLength': macLength,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/mac/verify',
      exceptionFnMap: _exceptionFns,
    );
    return VerifyMacOutput.fromJson(response);
  }

  /// Verifies pin-related data such as PIN and PIN Offset using algorithms
  /// including VISA PVV and IBM3624. For more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/verify-pin-data.html">Verify
  /// PIN data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// This operation verifies PIN data for user payment card. A card holder PIN
  /// data is never transmitted in clear to or from Amazon Web Services Payment
  /// Cryptography. This operation uses PIN Verification Key (PVK) for PIN or
  /// PIN Offset generation and then encrypts it using PIN Encryption Key (PEK)
  /// to create an <code>EncryptedPinBlock</code> for transmission from Amazon
  /// Web Services Payment Cryptography.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation supports cross-account use when
  /// the key has a resource-based policy that grants access. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/security_iam_resource-based-policies.html">Resource-based
  /// policies</a>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GeneratePinData</a>
  /// </li>
  /// <li>
  /// <a>TranslatePinData</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  ///
  /// Parameter [encryptedPinBlock] :
  /// The encrypted PIN block data that Amazon Web Services Payment Cryptography
  /// verifies.
  ///
  /// Parameter [encryptionKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key under which the PIN block
  /// data is encrypted. This key type can be PEK or BDK.
  ///
  /// Parameter [pinBlockFormat] :
  /// The PIN encoding format for pin data generation as specified in ISO 9564.
  /// Amazon Web Services Payment Cryptography supports
  /// <code>ISO_Format_0</code> and <code>ISO_Format_3</code>.
  ///
  /// The <code>ISO_Format_0</code> PIN block format is equivalent to the ANSI
  /// X9.8, VISA-1, and ECI-1 PIN block formats. It is similar to a VISA-4 PIN
  /// block format. It supports a PIN from 4 to 12 digits in length.
  ///
  /// The <code>ISO_Format_3</code> PIN block format is the same as
  /// <code>ISO_Format_0</code> except that the fill digits are random values
  /// from 10 to 15.
  ///
  /// Parameter [verificationAttributes] :
  /// The attributes and values for PIN data verification.
  ///
  /// Parameter [verificationKeyIdentifier] :
  /// The <code>keyARN</code> of the PIN verification key.
  ///
  /// Parameter [dukptAttributes] :
  /// The attributes and values for the DUKPT encrypted PIN block data.
  ///
  /// Parameter [pinDataLength] :
  /// The length of PIN being verified.
  ///
  /// Parameter [primaryAccountNumber] :
  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card that associates the card with a specific account holder.
  Future<VerifyPinDataOutput> verifyPinData({
    required String encryptedPinBlock,
    required String encryptionKeyIdentifier,
    required PinBlockFormatForPinData pinBlockFormat,
    required PinVerificationAttributes verificationAttributes,
    required String verificationKeyIdentifier,
    DukptAttributes? dukptAttributes,
    WrappedKey? encryptionWrappedKey,
    int? pinDataLength,
    String? primaryAccountNumber,
  }) async {
    _s.validateNumRange(
      'pinDataLength',
      pinDataLength,
      4,
      12,
    );
    final $payload = <String, dynamic>{
      'EncryptedPinBlock': encryptedPinBlock,
      'EncryptionKeyIdentifier': encryptionKeyIdentifier,
      'PinBlockFormat': pinBlockFormat.value,
      'VerificationAttributes': verificationAttributes,
      'VerificationKeyIdentifier': verificationKeyIdentifier,
      if (dukptAttributes != null) 'DukptAttributes': dukptAttributes,
      if (encryptionWrappedKey != null)
        'EncryptionWrappedKey': encryptionWrappedKey,
      if (pinDataLength != null) 'PinDataLength': pinDataLength,
      if (primaryAccountNumber != null)
        'PrimaryAccountNumber': primaryAccountNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pindata/verify',
      exceptionFnMap: _exceptionFns,
    );
    return VerifyPinDataOutput.fromJson(response);
  }
}

/// @nodoc
class DecryptDataOutput {
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses for ciphertext decryption.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  /// The decrypted plaintext data in hexBinary format.
  final String plainText;

  DecryptDataOutput({
    required this.keyArn,
    required this.keyCheckValue,
    required this.plainText,
  });

  factory DecryptDataOutput.fromJson(Map<String, dynamic> json) {
    return DecryptDataOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      plainText: (json['PlainText'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    final plainText = this.plainText;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
      'PlainText': plainText,
    };
  }
}

/// @nodoc
class EncryptDataOutput {
  /// The encrypted ciphertext.
  final String cipherText;

  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses for plaintext encryption.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String? keyCheckValue;

  EncryptDataOutput({
    required this.cipherText,
    required this.keyArn,
    this.keyCheckValue,
  });

  factory EncryptDataOutput.fromJson(Map<String, dynamic> json) {
    return EncryptDataOutput(
      cipherText: (json['CipherText'] as String?) ?? '',
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: json['KeyCheckValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cipherText = this.cipherText;
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    return {
      'CipherText': cipherText,
      'KeyArn': keyArn,
      if (keyCheckValue != null) 'KeyCheckValue': keyCheckValue,
    };
  }
}

/// @nodoc
class GenerateAs2805KekValidationOutput {
  /// The <code>keyARN</code> of sending KEK that Amazon Web Services Payment
  /// Cryptography validates for node-to-node initialization
  final String keyArn;

  /// The key check value (KCV) of the sending KEK that Amazon Web Services
  /// Payment Cryptography validates for node-to-node initialization.
  final String keyCheckValue;

  /// The random key generated for receiving KEK validation. The initiating node
  /// sends this key to its partner node for validation.
  final String randomKeyReceive;

  /// The random key generated for sending KEK validation.
  final String randomKeySend;

  GenerateAs2805KekValidationOutput({
    required this.keyArn,
    required this.keyCheckValue,
    required this.randomKeyReceive,
    required this.randomKeySend,
  });

  factory GenerateAs2805KekValidationOutput.fromJson(
      Map<String, dynamic> json) {
    return GenerateAs2805KekValidationOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      randomKeyReceive: (json['RandomKeyReceive'] as String?) ?? '',
      randomKeySend: (json['RandomKeySend'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    final randomKeyReceive = this.randomKeyReceive;
    final randomKeySend = this.randomKeySend;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
      'RandomKeyReceive': randomKeyReceive,
      'RandomKeySend': randomKeySend,
    };
  }
}

/// @nodoc
class GenerateAuthRequestCryptogramOutput {
  /// The Authorization Request Cryptogram (ARQC) generated by Amazon Web Services
  /// Payment Cryptography using the specified key and transaction data.
  final String authRequestCryptogram;

  /// The <code>keyARN</code> of the IMK-AC that Amazon Web Services Payment
  /// Cryptography uses for ARQC generation.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  GenerateAuthRequestCryptogramOutput({
    required this.authRequestCryptogram,
    required this.keyArn,
    required this.keyCheckValue,
  });

  factory GenerateAuthRequestCryptogramOutput.fromJson(
      Map<String, dynamic> json) {
    return GenerateAuthRequestCryptogramOutput(
      authRequestCryptogram: (json['AuthRequestCryptogram'] as String?) ?? '',
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final authRequestCryptogram = this.authRequestCryptogram;
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    return {
      'AuthRequestCryptogram': authRequestCryptogram,
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
    };
  }
}

/// @nodoc
class GenerateCardValidationDataOutput {
  /// The <code>keyARN</code> of the CVK encryption key that Amazon Web Services
  /// Payment Cryptography uses to generate CVV or CSC.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  /// The CVV or CSC value that Amazon Web Services Payment Cryptography generates
  /// for the card.
  final String validationData;

  GenerateCardValidationDataOutput({
    required this.keyArn,
    required this.keyCheckValue,
    required this.validationData,
  });

  factory GenerateCardValidationDataOutput.fromJson(Map<String, dynamic> json) {
    return GenerateCardValidationDataOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      validationData: (json['ValidationData'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    final validationData = this.validationData;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
      'ValidationData': validationData,
    };
  }
}

/// @nodoc
class GenerateMacOutput {
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses for MAC generation.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  /// The MAC cryptogram generated within Amazon Web Services Payment
  /// Cryptography.
  final String mac;

  GenerateMacOutput({
    required this.keyArn,
    required this.keyCheckValue,
    required this.mac,
  });

  factory GenerateMacOutput.fromJson(Map<String, dynamic> json) {
    return GenerateMacOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      mac: (json['Mac'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    final mac = this.mac;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
      'Mac': mac,
    };
  }
}

/// @nodoc
class GenerateMacEmvPinChangeOutput {
  /// Returns the incoming new encrpted PIN block.
  final String encryptedPinBlock;

  /// Returns the mac of the issuer script containing message data and appended
  /// target encrypted pin block in ISO2 format.
  final String mac;

  /// Returns the <code>keyArn</code> of the PEK protecting the incoming new
  /// encrypted PIN block.
  final String newPinPekArn;

  /// The key check value (KCV) of the PEK uprotecting the incoming new encrypted
  /// PIN block.
  final String newPinPekKeyCheckValue;

  /// Returns the <code>keyArn</code> of the IMK-SMC used by the operation.
  final String secureMessagingConfidentialityKeyArn;

  /// The key check value (KCV) of the SMC issuer master key used by the
  /// operation.
  final String secureMessagingConfidentialityKeyCheckValue;

  /// Returns the <code>keyArn</code> of the IMK-SMI used by the operation.
  final String secureMessagingIntegrityKeyArn;

  /// The key check value (KCV) of the SMI issuer master key used by the
  /// operation.
  final String secureMessagingIntegrityKeyCheckValue;

  /// The attribute values used for Amex and Visa derivation methods.
  final VisaAmexDerivationOutputs? visaAmexDerivationOutputs;

  GenerateMacEmvPinChangeOutput({
    required this.encryptedPinBlock,
    required this.mac,
    required this.newPinPekArn,
    required this.newPinPekKeyCheckValue,
    required this.secureMessagingConfidentialityKeyArn,
    required this.secureMessagingConfidentialityKeyCheckValue,
    required this.secureMessagingIntegrityKeyArn,
    required this.secureMessagingIntegrityKeyCheckValue,
    this.visaAmexDerivationOutputs,
  });

  factory GenerateMacEmvPinChangeOutput.fromJson(Map<String, dynamic> json) {
    return GenerateMacEmvPinChangeOutput(
      encryptedPinBlock: (json['EncryptedPinBlock'] as String?) ?? '',
      mac: (json['Mac'] as String?) ?? '',
      newPinPekArn: (json['NewPinPekArn'] as String?) ?? '',
      newPinPekKeyCheckValue: (json['NewPinPekKeyCheckValue'] as String?) ?? '',
      secureMessagingConfidentialityKeyArn:
          (json['SecureMessagingConfidentialityKeyArn'] as String?) ?? '',
      secureMessagingConfidentialityKeyCheckValue:
          (json['SecureMessagingConfidentialityKeyCheckValue'] as String?) ??
              '',
      secureMessagingIntegrityKeyArn:
          (json['SecureMessagingIntegrityKeyArn'] as String?) ?? '',
      secureMessagingIntegrityKeyCheckValue:
          (json['SecureMessagingIntegrityKeyCheckValue'] as String?) ?? '',
      visaAmexDerivationOutputs: json['VisaAmexDerivationOutputs'] != null
          ? VisaAmexDerivationOutputs.fromJson(
              json['VisaAmexDerivationOutputs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptedPinBlock = this.encryptedPinBlock;
    final mac = this.mac;
    final newPinPekArn = this.newPinPekArn;
    final newPinPekKeyCheckValue = this.newPinPekKeyCheckValue;
    final secureMessagingConfidentialityKeyArn =
        this.secureMessagingConfidentialityKeyArn;
    final secureMessagingConfidentialityKeyCheckValue =
        this.secureMessagingConfidentialityKeyCheckValue;
    final secureMessagingIntegrityKeyArn = this.secureMessagingIntegrityKeyArn;
    final secureMessagingIntegrityKeyCheckValue =
        this.secureMessagingIntegrityKeyCheckValue;
    final visaAmexDerivationOutputs = this.visaAmexDerivationOutputs;
    return {
      'EncryptedPinBlock': encryptedPinBlock,
      'Mac': mac,
      'NewPinPekArn': newPinPekArn,
      'NewPinPekKeyCheckValue': newPinPekKeyCheckValue,
      'SecureMessagingConfidentialityKeyArn':
          secureMessagingConfidentialityKeyArn,
      'SecureMessagingConfidentialityKeyCheckValue':
          secureMessagingConfidentialityKeyCheckValue,
      'SecureMessagingIntegrityKeyArn': secureMessagingIntegrityKeyArn,
      'SecureMessagingIntegrityKeyCheckValue':
          secureMessagingIntegrityKeyCheckValue,
      if (visaAmexDerivationOutputs != null)
        'VisaAmexDerivationOutputs': visaAmexDerivationOutputs,
    };
  }
}

/// @nodoc
class GeneratePinDataOutput {
  /// The PIN block encrypted under PEK from Amazon Web Services Payment
  /// Cryptography. The encrypted PIN block is a composite of PAN (Primary Account
  /// Number) and PIN (Personal Identification Number), generated in accordance
  /// with ISO 9564 standard.
  final String encryptedPinBlock;

  /// The <code>keyARN</code> of the PEK that Amazon Web Services Payment
  /// Cryptography uses for encrypted pin block generation. For ECDH, it is the
  /// <code>keyARN</code> of the asymmetric ECC key.
  final String encryptionKeyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String encryptionKeyCheckValue;

  /// The <code>keyARN</code> of the pin data generation key that Amazon Web
  /// Services Payment Cryptography uses for PIN, PVV or PIN Offset generation.
  final String generationKeyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String generationKeyCheckValue;

  /// The attributes and values Amazon Web Services Payment Cryptography uses for
  /// pin data generation.
  final PinData pinData;

  GeneratePinDataOutput({
    required this.encryptedPinBlock,
    required this.encryptionKeyArn,
    required this.encryptionKeyCheckValue,
    required this.generationKeyArn,
    required this.generationKeyCheckValue,
    required this.pinData,
  });

  factory GeneratePinDataOutput.fromJson(Map<String, dynamic> json) {
    return GeneratePinDataOutput(
      encryptedPinBlock: (json['EncryptedPinBlock'] as String?) ?? '',
      encryptionKeyArn: (json['EncryptionKeyArn'] as String?) ?? '',
      encryptionKeyCheckValue:
          (json['EncryptionKeyCheckValue'] as String?) ?? '',
      generationKeyArn: (json['GenerationKeyArn'] as String?) ?? '',
      generationKeyCheckValue:
          (json['GenerationKeyCheckValue'] as String?) ?? '',
      pinData: PinData.fromJson((json['PinData'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptedPinBlock = this.encryptedPinBlock;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionKeyCheckValue = this.encryptionKeyCheckValue;
    final generationKeyArn = this.generationKeyArn;
    final generationKeyCheckValue = this.generationKeyCheckValue;
    final pinData = this.pinData;
    return {
      'EncryptedPinBlock': encryptedPinBlock,
      'EncryptionKeyArn': encryptionKeyArn,
      'EncryptionKeyCheckValue': encryptionKeyCheckValue,
      'GenerationKeyArn': generationKeyArn,
      'GenerationKeyCheckValue': generationKeyCheckValue,
      'PinData': pinData,
    };
  }
}

/// @nodoc
class ReEncryptDataOutput {
  /// The encrypted ciphertext.
  final String cipherText;

  /// The keyARN (Amazon Resource Name) of the encryption key that Amazon Web
  /// Services Payment Cryptography uses for plaintext encryption.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  ReEncryptDataOutput({
    required this.cipherText,
    required this.keyArn,
    required this.keyCheckValue,
  });

  factory ReEncryptDataOutput.fromJson(Map<String, dynamic> json) {
    return ReEncryptDataOutput(
      cipherText: (json['CipherText'] as String?) ?? '',
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cipherText = this.cipherText;
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    return {
      'CipherText': cipherText,
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
    };
  }
}

/// @nodoc
class TranslateKeyMaterialOutput {
  /// The outgoing KEK wrapped TR31WrappedKeyBlock.
  final WrappedWorkingKey wrappedKey;

  TranslateKeyMaterialOutput({
    required this.wrappedKey,
  });

  factory TranslateKeyMaterialOutput.fromJson(Map<String, dynamic> json) {
    return TranslateKeyMaterialOutput(
      wrappedKey: WrappedWorkingKey.fromJson(
          (json['WrappedKey'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final wrappedKey = this.wrappedKey;
    return {
      'WrappedKey': wrappedKey,
    };
  }
}

/// @nodoc
class TranslatePinDataOutput {
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses to encrypt outgoing PIN block data after
  /// translation.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  /// The outgoing encrypted PIN block data after translation.
  final String pinBlock;

  TranslatePinDataOutput({
    required this.keyArn,
    required this.keyCheckValue,
    required this.pinBlock,
  });

  factory TranslatePinDataOutput.fromJson(Map<String, dynamic> json) {
    return TranslatePinDataOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      pinBlock: (json['PinBlock'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    final pinBlock = this.pinBlock;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
      'PinBlock': pinBlock,
    };
  }
}

/// @nodoc
class VerifyAuthRequestCryptogramOutput {
  /// The <code>keyARN</code> of the major encryption key that Amazon Web Services
  /// Payment Cryptography uses for ARQC verification.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  /// The result for ARQC verification or ARPC generation within Amazon Web
  /// Services Payment Cryptography.
  final String? authResponseValue;

  VerifyAuthRequestCryptogramOutput({
    required this.keyArn,
    required this.keyCheckValue,
    this.authResponseValue,
  });

  factory VerifyAuthRequestCryptogramOutput.fromJson(
      Map<String, dynamic> json) {
    return VerifyAuthRequestCryptogramOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      authResponseValue: json['AuthResponseValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    final authResponseValue = this.authResponseValue;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
      if (authResponseValue != null) 'AuthResponseValue': authResponseValue,
    };
  }
}

/// @nodoc
class VerifyCardValidationDataOutput {
  /// The <code>keyARN</code> of the CVK encryption key that Amazon Web Services
  /// Payment Cryptography uses to verify CVV or CSC.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  VerifyCardValidationDataOutput({
    required this.keyArn,
    required this.keyCheckValue,
  });

  factory VerifyCardValidationDataOutput.fromJson(Map<String, dynamic> json) {
    return VerifyCardValidationDataOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
    };
  }
}

/// @nodoc
class VerifyMacOutput {
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses for MAC verification.
  final String keyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String keyCheckValue;

  VerifyMacOutput({
    required this.keyArn,
    required this.keyCheckValue,
  });

  factory VerifyMacOutput.fromJson(Map<String, dynamic> json) {
    return VerifyMacOutput(
      keyArn: (json['KeyArn'] as String?) ?? '',
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyCheckValue = this.keyCheckValue;
    return {
      'KeyArn': keyArn,
      'KeyCheckValue': keyCheckValue,
    };
  }
}

/// @nodoc
class VerifyPinDataOutput {
  /// The <code>keyARN</code> of the PEK that Amazon Web Services Payment
  /// Cryptography uses for encrypted pin block generation.
  final String encryptionKeyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String encryptionKeyCheckValue;

  /// The <code>keyARN</code> of the PIN encryption key that Amazon Web Services
  /// Payment Cryptography uses for PIN or PIN Offset verification.
  final String verificationKeyArn;

  /// The key check value (KCV) of the encryption key. The KCV is used to check if
  /// all parties holding a given key have the same key or to detect that a key
  /// has changed.
  ///
  /// Amazon Web Services Payment Cryptography computes the KCV according to the
  /// CMAC specification.
  final String verificationKeyCheckValue;

  VerifyPinDataOutput({
    required this.encryptionKeyArn,
    required this.encryptionKeyCheckValue,
    required this.verificationKeyArn,
    required this.verificationKeyCheckValue,
  });

  factory VerifyPinDataOutput.fromJson(Map<String, dynamic> json) {
    return VerifyPinDataOutput(
      encryptionKeyArn: (json['EncryptionKeyArn'] as String?) ?? '',
      encryptionKeyCheckValue:
          (json['EncryptionKeyCheckValue'] as String?) ?? '',
      verificationKeyArn: (json['VerificationKeyArn'] as String?) ?? '',
      verificationKeyCheckValue:
          (json['VerificationKeyCheckValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionKeyCheckValue = this.encryptionKeyCheckValue;
    final verificationKeyArn = this.verificationKeyArn;
    final verificationKeyCheckValue = this.verificationKeyCheckValue;
    return {
      'EncryptionKeyArn': encryptionKeyArn,
      'EncryptionKeyCheckValue': encryptionKeyCheckValue,
      'VerificationKeyArn': verificationKeyArn,
      'VerificationKeyCheckValue': verificationKeyCheckValue,
    };
  }
}

/// Parameters that are required for PIN data verification.
///
/// @nodoc
class PinVerificationAttributes {
  /// Parameters that are required to generate or verify Ibm3624 PIN.
  final Ibm3624PinVerification? ibm3624Pin;

  /// Parameters that are required to generate or verify Visa PIN.
  final VisaPinVerification? visaPin;

  PinVerificationAttributes({
    this.ibm3624Pin,
    this.visaPin,
  });

  Map<String, dynamic> toJson() {
    final ibm3624Pin = this.ibm3624Pin;
    final visaPin = this.visaPin;
    return {
      if (ibm3624Pin != null) 'Ibm3624Pin': ibm3624Pin,
      if (visaPin != null) 'VisaPin': visaPin,
    };
  }
}

/// @nodoc
class PinBlockFormatForPinData {
  static const isoFormat_0 = PinBlockFormatForPinData._('ISO_FORMAT_0');
  static const isoFormat_1 = PinBlockFormatForPinData._('ISO_FORMAT_1');
  static const isoFormat_3 = PinBlockFormatForPinData._('ISO_FORMAT_3');
  static const isoFormat_4 = PinBlockFormatForPinData._('ISO_FORMAT_4');

  final String value;

  const PinBlockFormatForPinData._(this.value);

  static const values = [isoFormat_0, isoFormat_1, isoFormat_3, isoFormat_4];

  static PinBlockFormatForPinData fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PinBlockFormatForPinData._(value));

  @override
  bool operator ==(other) =>
      other is PinBlockFormatForPinData && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameters that are used for Derived Unique Key Per Transaction (DUKPT)
/// derivation algorithm.
///
/// @nodoc
class DukptAttributes {
  /// The key type derived using DUKPT from a Base Derivation Key (BDK) and Key
  /// Serial Number (KSN). This must be less than or equal to the strength of the
  /// BDK. For example, you can't use <code>AES_128</code> as a derivation type
  /// for a BDK of <code>AES_128</code> or <code>TDES_2KEY</code>.
  final DukptDerivationType dukptDerivationType;

  /// The unique identifier known as Key Serial Number (KSN) that comes from an
  /// encrypting device using DUKPT encryption method. The KSN is derived from the
  /// encrypting device unique identifier and an internal transaction counter.
  final String keySerialNumber;

  DukptAttributes({
    required this.dukptDerivationType,
    required this.keySerialNumber,
  });

  Map<String, dynamic> toJson() {
    final dukptDerivationType = this.dukptDerivationType;
    final keySerialNumber = this.keySerialNumber;
    return {
      'DukptDerivationType': dukptDerivationType.value,
      'KeySerialNumber': keySerialNumber,
    };
  }
}

/// Parameter information of a WrappedKeyBlock for encryption key exchange.
///
/// @nodoc
class WrappedKey {
  /// Parameter information of a WrappedKeyBlock for encryption key exchange.
  final WrappedKeyMaterial wrappedKeyMaterial;

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
    required this.wrappedKeyMaterial,
    this.keyCheckValueAlgorithm,
  });

  Map<String, dynamic> toJson() {
    final wrappedKeyMaterial = this.wrappedKeyMaterial;
    final keyCheckValueAlgorithm = this.keyCheckValueAlgorithm;
    return {
      'WrappedKeyMaterial': wrappedKeyMaterial,
      if (keyCheckValueAlgorithm != null)
        'KeyCheckValueAlgorithm': keyCheckValueAlgorithm.value,
    };
  }
}

/// Parameter information of a WrappedKeyBlock for encryption key exchange.
///
/// @nodoc
class WrappedKeyMaterial {
  /// The parameter information for deriving a ECDH shared key.
  final EcdhDerivationAttributes? diffieHellmanSymmetricKey;

  /// The TR-31 wrapped key block.
  final String? tr31KeyBlock;

  WrappedKeyMaterial({
    this.diffieHellmanSymmetricKey,
    this.tr31KeyBlock,
  });

  Map<String, dynamic> toJson() {
    final diffieHellmanSymmetricKey = this.diffieHellmanSymmetricKey;
    final tr31KeyBlock = this.tr31KeyBlock;
    return {
      if (diffieHellmanSymmetricKey != null)
        'DiffieHellmanSymmetricKey': diffieHellmanSymmetricKey,
      if (tr31KeyBlock != null) 'Tr31KeyBlock': tr31KeyBlock,
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

/// Parameters required to establish ECDH based key exchange.
///
/// @nodoc
class EcdhDerivationAttributes {
  /// The <code>keyArn</code> of the certificate that signed the client's
  /// <code>PublicKeyCertificate</code>.
  final String certificateAuthorityPublicKeyIdentifier;

  /// The key algorithm of the derived ECDH key.
  final SymmetricKeyAlgorithm keyAlgorithm;

  /// The key derivation function to use for deriving a key using ECDH.
  final KeyDerivationFunction keyDerivationFunction;

  /// The hash type to use for deriving a key using ECDH.
  final KeyDerivationHashAlgorithm keyDerivationHashAlgorithm;

  /// The client's public key certificate in PEM format (base64 encoded) to use
  /// for ECDH key derivation.
  final String publicKeyCertificate;

  /// A byte string containing information that binds the ECDH derived key to the
  /// two parties involved or to the context of the key.
  ///
  /// It may include details like identities of the two parties deriving the key,
  /// context of the operation, session IDs, and optionally a nonce. It must not
  /// contain zero bytes, and re-using shared information for multiple ECDH key
  /// derivations is not recommended.
  final String sharedInformation;

  EcdhDerivationAttributes({
    required this.certificateAuthorityPublicKeyIdentifier,
    required this.keyAlgorithm,
    required this.keyDerivationFunction,
    required this.keyDerivationHashAlgorithm,
    required this.publicKeyCertificate,
    required this.sharedInformation,
  });

  Map<String, dynamic> toJson() {
    final certificateAuthorityPublicKeyIdentifier =
        this.certificateAuthorityPublicKeyIdentifier;
    final keyAlgorithm = this.keyAlgorithm;
    final keyDerivationFunction = this.keyDerivationFunction;
    final keyDerivationHashAlgorithm = this.keyDerivationHashAlgorithm;
    final publicKeyCertificate = this.publicKeyCertificate;
    final sharedInformation = this.sharedInformation;
    return {
      'CertificateAuthorityPublicKeyIdentifier':
          certificateAuthorityPublicKeyIdentifier,
      'KeyAlgorithm': keyAlgorithm.value,
      'KeyDerivationFunction': keyDerivationFunction.value,
      'KeyDerivationHashAlgorithm': keyDerivationHashAlgorithm.value,
      'PublicKeyCertificate': publicKeyCertificate,
      'SharedInformation': sharedInformation,
    };
  }
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

/// @nodoc
class DukptDerivationType {
  static const tdes_2key = DukptDerivationType._('TDES_2KEY');
  static const tdes_3key = DukptDerivationType._('TDES_3KEY');
  static const aes_128 = DukptDerivationType._('AES_128');
  static const aes_192 = DukptDerivationType._('AES_192');
  static const aes_256 = DukptDerivationType._('AES_256');

  final String value;

  const DukptDerivationType._(this.value);

  static const values = [tdes_2key, tdes_3key, aes_128, aes_192, aes_256];

  static DukptDerivationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DukptDerivationType._(value));

  @override
  bool operator ==(other) =>
      other is DukptDerivationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameters that are required to generate or verify Visa PIN.
///
/// @nodoc
class VisaPinVerification {
  /// The value for PIN verification index. It is used in the Visa PIN algorithm
  /// to calculate the PVV (PIN Verification Value).
  final int pinVerificationKeyIndex;

  /// Parameters that are required to generate or verify Visa PVV (PIN
  /// Verification Value).
  final String verificationValue;

  VisaPinVerification({
    required this.pinVerificationKeyIndex,
    required this.verificationValue,
  });

  Map<String, dynamic> toJson() {
    final pinVerificationKeyIndex = this.pinVerificationKeyIndex;
    final verificationValue = this.verificationValue;
    return {
      'PinVerificationKeyIndex': pinVerificationKeyIndex,
      'VerificationValue': verificationValue,
    };
  }
}

/// Parameters that are required to generate or verify Ibm3624 PIN verification
/// PIN.
///
/// @nodoc
class Ibm3624PinVerification {
  /// The decimalization table to use for IBM 3624 PIN algorithm. The table is
  /// used to convert the algorithm intermediate result from hexadecimal
  /// characters to decimal.
  final String decimalizationTable;

  /// The PIN offset value.
  final String pinOffset;

  /// The unique data for cardholder identification.
  final String pinValidationData;

  /// The padding character for validation data.
  final String pinValidationDataPadCharacter;

  Ibm3624PinVerification({
    required this.decimalizationTable,
    required this.pinOffset,
    required this.pinValidationData,
    required this.pinValidationDataPadCharacter,
  });

  Map<String, dynamic> toJson() {
    final decimalizationTable = this.decimalizationTable;
    final pinOffset = this.pinOffset;
    final pinValidationData = this.pinValidationData;
    final pinValidationDataPadCharacter = this.pinValidationDataPadCharacter;
    return {
      'DecimalizationTable': decimalizationTable,
      'PinOffset': pinOffset,
      'PinValidationData': pinValidationData,
      'PinValidationDataPadCharacter': pinValidationDataPadCharacter,
    };
  }
}

/// Parameters that are required for DUKPT, HMAC, or EMV MAC generation or
/// verification.
///
/// @nodoc
class MacAttributes {
  /// The encryption algorithm for MAC generation or verification.
  final MacAlgorithm? algorithm;

  /// Parameters that are required for MAC generation or verification using DUKPT
  /// CMAC algorithm.
  final MacAlgorithmDukpt? dukptCmac;

  /// Parameters that are required for MAC generation or verification using DUKPT
  /// ISO 9797 algorithm1.
  final MacAlgorithmDukpt? dukptIso9797Algorithm1;

  /// Parameters that are required for MAC generation or verification using DUKPT
  /// ISO 9797 algorithm3.
  final MacAlgorithmDukpt? dukptIso9797Algorithm3;

  /// Parameters that are required for MAC generation or verification using EMV
  /// MAC algorithm.
  final MacAlgorithmEmv? emvMac;

  MacAttributes({
    this.algorithm,
    this.dukptCmac,
    this.dukptIso9797Algorithm1,
    this.dukptIso9797Algorithm3,
    this.emvMac,
  });

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final dukptCmac = this.dukptCmac;
    final dukptIso9797Algorithm1 = this.dukptIso9797Algorithm1;
    final dukptIso9797Algorithm3 = this.dukptIso9797Algorithm3;
    final emvMac = this.emvMac;
    return {
      if (algorithm != null) 'Algorithm': algorithm.value,
      if (dukptCmac != null) 'DukptCmac': dukptCmac,
      if (dukptIso9797Algorithm1 != null)
        'DukptIso9797Algorithm1': dukptIso9797Algorithm1,
      if (dukptIso9797Algorithm3 != null)
        'DukptIso9797Algorithm3': dukptIso9797Algorithm3,
      if (emvMac != null) 'EmvMac': emvMac,
    };
  }
}

/// @nodoc
class MacAlgorithm {
  static const iso9797Algorithm1 = MacAlgorithm._('ISO9797_ALGORITHM1');
  static const iso9797Algorithm3 = MacAlgorithm._('ISO9797_ALGORITHM3');
  static const cmac = MacAlgorithm._('CMAC');
  static const hmac = MacAlgorithm._('HMAC');
  static const hmacSha224 = MacAlgorithm._('HMAC_SHA224');
  static const hmacSha256 = MacAlgorithm._('HMAC_SHA256');
  static const hmacSha384 = MacAlgorithm._('HMAC_SHA384');
  static const hmacSha512 = MacAlgorithm._('HMAC_SHA512');
  static const as2805_4_1 = MacAlgorithm._('AS2805_4_1');

  final String value;

  const MacAlgorithm._(this.value);

  static const values = [
    iso9797Algorithm1,
    iso9797Algorithm3,
    cmac,
    hmac,
    hmacSha224,
    hmacSha256,
    hmacSha384,
    hmacSha512,
    as2805_4_1
  ];

  static MacAlgorithm fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MacAlgorithm._(value));

  @override
  bool operator ==(other) => other is MacAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameters that are required for EMV MAC generation and verification.
///
/// @nodoc
class MacAlgorithmEmv {
  /// The method to use when deriving the master key for EMV MAC generation or
  /// verification.
  final MajorKeyDerivationMode majorKeyDerivationMode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card and associates the card to a specific account holder.
  final String primaryAccountNumber;

  /// The method of deriving a session key for EMV MAC generation or verification.
  final SessionKeyDerivationMode sessionKeyDerivationMode;

  /// Parameters that are required to generate session key for EMV generation and
  /// verification.
  final SessionKeyDerivationValue sessionKeyDerivationValue;

  MacAlgorithmEmv({
    required this.majorKeyDerivationMode,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
    required this.sessionKeyDerivationMode,
    required this.sessionKeyDerivationValue,
  });

  Map<String, dynamic> toJson() {
    final majorKeyDerivationMode = this.majorKeyDerivationMode;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    final sessionKeyDerivationMode = this.sessionKeyDerivationMode;
    final sessionKeyDerivationValue = this.sessionKeyDerivationValue;
    return {
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
      'SessionKeyDerivationMode': sessionKeyDerivationMode.value,
      'SessionKeyDerivationValue': sessionKeyDerivationValue,
    };
  }
}

/// Parameters required for DUKPT MAC generation and verification.
///
/// @nodoc
class MacAlgorithmDukpt {
  /// The type of use of DUKPT, which can be MAC generation, MAC verification, or
  /// both.
  final DukptKeyVariant dukptKeyVariant;

  /// The unique identifier known as Key Serial Number (KSN) that comes from an
  /// encrypting device using DUKPT encryption method. The KSN is derived from the
  /// encrypting device unique identifier and an internal transaction counter.
  final String keySerialNumber;

  /// The key type derived using DUKPT from a Base Derivation Key (BDK) and Key
  /// Serial Number (KSN). This must be less than or equal to the strength of the
  /// BDK. For example, you can't use <code>AES_128</code> as a derivation type
  /// for a BDK of <code>AES_128</code> or <code>TDES_2KEY</code>.
  final DukptDerivationType? dukptDerivationType;

  MacAlgorithmDukpt({
    required this.dukptKeyVariant,
    required this.keySerialNumber,
    this.dukptDerivationType,
  });

  Map<String, dynamic> toJson() {
    final dukptKeyVariant = this.dukptKeyVariant;
    final keySerialNumber = this.keySerialNumber;
    final dukptDerivationType = this.dukptDerivationType;
    return {
      'DukptKeyVariant': dukptKeyVariant.value,
      'KeySerialNumber': keySerialNumber,
      if (dukptDerivationType != null)
        'DukptDerivationType': dukptDerivationType.value,
    };
  }
}

/// @nodoc
class DukptKeyVariant {
  static const bidirectional = DukptKeyVariant._('BIDIRECTIONAL');
  static const request = DukptKeyVariant._('REQUEST');
  static const response = DukptKeyVariant._('RESPONSE');

  final String value;

  const DukptKeyVariant._(this.value);

  static const values = [bidirectional, request, response];

  static DukptKeyVariant fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DukptKeyVariant._(value));

  @override
  bool operator ==(other) => other is DukptKeyVariant && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MajorKeyDerivationMode {
  static const emvOptionA = MajorKeyDerivationMode._('EMV_OPTION_A');
  static const emvOptionB = MajorKeyDerivationMode._('EMV_OPTION_B');

  final String value;

  const MajorKeyDerivationMode._(this.value);

  static const values = [emvOptionA, emvOptionB];

  static MajorKeyDerivationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MajorKeyDerivationMode._(value));

  @override
  bool operator ==(other) =>
      other is MajorKeyDerivationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SessionKeyDerivationMode {
  static const emvCommonSessionKey =
      SessionKeyDerivationMode._('EMV_COMMON_SESSION_KEY');
  static const emv2000 = SessionKeyDerivationMode._('EMV2000');
  static const amex = SessionKeyDerivationMode._('AMEX');
  static const mastercardSessionKey =
      SessionKeyDerivationMode._('MASTERCARD_SESSION_KEY');
  static const visa = SessionKeyDerivationMode._('VISA');

  final String value;

  const SessionKeyDerivationMode._(this.value);

  static const values = [
    emvCommonSessionKey,
    emv2000,
    amex,
    mastercardSessionKey,
    visa
  ];

  static SessionKeyDerivationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SessionKeyDerivationMode._(value));

  @override
  bool operator ==(other) =>
      other is SessionKeyDerivationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameters to derive session key value using a MAC EMV algorithm.
///
/// @nodoc
class SessionKeyDerivationValue {
  /// The cryptogram provided by the terminal during transaction processing.
  final String? applicationCryptogram;

  /// The transaction counter that is provided by the terminal during transaction
  /// processing.
  final String? applicationTransactionCounter;

  SessionKeyDerivationValue({
    this.applicationCryptogram,
    this.applicationTransactionCounter,
  });

  Map<String, dynamic> toJson() {
    final applicationCryptogram = this.applicationCryptogram;
    final applicationTransactionCounter = this.applicationTransactionCounter;
    return {
      if (applicationCryptogram != null)
        'ApplicationCryptogram': applicationCryptogram,
      if (applicationTransactionCounter != null)
        'ApplicationTransactionCounter': applicationTransactionCounter,
    };
  }
}

/// Card data parameters that are requried to verify Card Verification Values
/// (CVV/CVV2), Dynamic Card Verification Values (dCVV/dCVV2), or Card Security
/// Codes (CSC).
///
/// @nodoc
class CardVerificationAttributes {
  final AmexCardSecurityCodeVersion1? amexCardSecurityCodeVersion1;

  /// Card data parameters that are required to verify a Card Security Code (CSC2)
  /// for an AMEX payment card.
  final AmexCardSecurityCodeVersion2? amexCardSecurityCodeVersion2;

  /// Card data parameters that are required to verify a cardholder verification
  /// value for the payment card.
  final CardHolderVerificationValue? cardHolderVerificationValue;

  /// Card data parameters that are required to verify Card Verification Value
  /// (CVV) for the payment card.
  final CardVerificationValue1? cardVerificationValue1;

  /// Card data parameters that are required to verify Card Verification Value
  /// (CVV2) for the payment card.
  final CardVerificationValue2? cardVerificationValue2;

  /// Card data parameters that are required to verify CDynamic Card Verification
  /// Code (dCVC) for the payment card.
  final DiscoverDynamicCardVerificationCode?
      discoverDynamicCardVerificationCode;

  /// Card data parameters that are required to verify CDynamic Card Verification
  /// Code (dCVC) for the payment card.
  final DynamicCardVerificationCode? dynamicCardVerificationCode;

  /// Card data parameters that are required to verify CDynamic Card Verification
  /// Value (dCVV) for the payment card.
  final DynamicCardVerificationValue? dynamicCardVerificationValue;

  CardVerificationAttributes({
    this.amexCardSecurityCodeVersion1,
    this.amexCardSecurityCodeVersion2,
    this.cardHolderVerificationValue,
    this.cardVerificationValue1,
    this.cardVerificationValue2,
    this.discoverDynamicCardVerificationCode,
    this.dynamicCardVerificationCode,
    this.dynamicCardVerificationValue,
  });

  Map<String, dynamic> toJson() {
    final amexCardSecurityCodeVersion1 = this.amexCardSecurityCodeVersion1;
    final amexCardSecurityCodeVersion2 = this.amexCardSecurityCodeVersion2;
    final cardHolderVerificationValue = this.cardHolderVerificationValue;
    final cardVerificationValue1 = this.cardVerificationValue1;
    final cardVerificationValue2 = this.cardVerificationValue2;
    final discoverDynamicCardVerificationCode =
        this.discoverDynamicCardVerificationCode;
    final dynamicCardVerificationCode = this.dynamicCardVerificationCode;
    final dynamicCardVerificationValue = this.dynamicCardVerificationValue;
    return {
      if (amexCardSecurityCodeVersion1 != null)
        'AmexCardSecurityCodeVersion1': amexCardSecurityCodeVersion1,
      if (amexCardSecurityCodeVersion2 != null)
        'AmexCardSecurityCodeVersion2': amexCardSecurityCodeVersion2,
      if (cardHolderVerificationValue != null)
        'CardHolderVerificationValue': cardHolderVerificationValue,
      if (cardVerificationValue1 != null)
        'CardVerificationValue1': cardVerificationValue1,
      if (cardVerificationValue2 != null)
        'CardVerificationValue2': cardVerificationValue2,
      if (discoverDynamicCardVerificationCode != null)
        'DiscoverDynamicCardVerificationCode':
            discoverDynamicCardVerificationCode,
      if (dynamicCardVerificationCode != null)
        'DynamicCardVerificationCode': dynamicCardVerificationCode,
      if (dynamicCardVerificationValue != null)
        'DynamicCardVerificationValue': dynamicCardVerificationValue,
    };
  }
}

/// Card data parameters that are required to generate a Card Security Code
/// (CSC2) for an AMEX payment card.
///
/// @nodoc
class AmexCardSecurityCodeVersion1 {
  /// The expiry date of a payment card.
  final String cardExpiryDate;

  AmexCardSecurityCodeVersion1({
    required this.cardExpiryDate,
  });

  Map<String, dynamic> toJson() {
    final cardExpiryDate = this.cardExpiryDate;
    return {
      'CardExpiryDate': cardExpiryDate,
    };
  }
}

/// Card data parameters that are required to generate a Card Security Code
/// (CSC2) for an AMEX payment card.
///
/// @nodoc
class AmexCardSecurityCodeVersion2 {
  /// The expiry date of a payment card.
  final String cardExpiryDate;

  /// The service code of the AMEX payment card. This is different from the Card
  /// Security Code (CSC).
  final String serviceCode;

  AmexCardSecurityCodeVersion2({
    required this.cardExpiryDate,
    required this.serviceCode,
  });

  Map<String, dynamic> toJson() {
    final cardExpiryDate = this.cardExpiryDate;
    final serviceCode = this.serviceCode;
    return {
      'CardExpiryDate': cardExpiryDate,
      'ServiceCode': serviceCode,
    };
  }
}

/// Card data parameters that are required to verify CVV (Card Verification
/// Value) for the payment card.
///
/// @nodoc
class CardVerificationValue1 {
  /// The expiry date of a payment card.
  final String cardExpiryDate;

  /// The service code of the payment card. This is different from Card Security
  /// Code (CSC).
  final String serviceCode;

  CardVerificationValue1({
    required this.cardExpiryDate,
    required this.serviceCode,
  });

  Map<String, dynamic> toJson() {
    final cardExpiryDate = this.cardExpiryDate;
    final serviceCode = this.serviceCode;
    return {
      'CardExpiryDate': cardExpiryDate,
      'ServiceCode': serviceCode,
    };
  }
}

/// Card data parameters that are required to verify Card Verification Value
/// (CVV2) for the payment card.
///
/// @nodoc
class CardVerificationValue2 {
  /// The expiry date of a payment card.
  final String cardExpiryDate;

  CardVerificationValue2({
    required this.cardExpiryDate,
  });

  Map<String, dynamic> toJson() {
    final cardExpiryDate = this.cardExpiryDate;
    return {
      'CardExpiryDate': cardExpiryDate,
    };
  }
}

/// Card data parameters that are required to generate a cardholder verification
/// value for the payment card.
///
/// @nodoc
class CardHolderVerificationValue {
  /// The transaction counter value that comes from a point of sale terminal.
  final String applicationTransactionCounter;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// A random number generated by the issuer.
  final String unpredictableNumber;

  CardHolderVerificationValue({
    required this.applicationTransactionCounter,
    required this.panSequenceNumber,
    required this.unpredictableNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final panSequenceNumber = this.panSequenceNumber;
    final unpredictableNumber = this.unpredictableNumber;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'PanSequenceNumber': panSequenceNumber,
      'UnpredictableNumber': unpredictableNumber,
    };
  }
}

/// Parameters that are required to generate or verify Dynamic Card Verification
/// Value (dCVV).
///
/// @nodoc
class DynamicCardVerificationCode {
  /// The transaction counter value that comes from the terminal.
  final String applicationTransactionCounter;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The data on the two tracks of magnetic cards used for financial
  /// transactions. This includes the cardholder name, PAN, expiration date, bank
  /// ID (BIN) and several other numbers the issuing bank uses to validate the
  /// data received.
  final String trackData;

  /// A random number generated by the issuer.
  final String unpredictableNumber;

  DynamicCardVerificationCode({
    required this.applicationTransactionCounter,
    required this.panSequenceNumber,
    required this.trackData,
    required this.unpredictableNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final panSequenceNumber = this.panSequenceNumber;
    final trackData = this.trackData;
    final unpredictableNumber = this.unpredictableNumber;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'PanSequenceNumber': panSequenceNumber,
      'TrackData': trackData,
      'UnpredictableNumber': unpredictableNumber,
    };
  }
}

/// Parameters that are required to generate or verify Dynamic Card Verification
/// Value (dCVV).
///
/// @nodoc
class DynamicCardVerificationValue {
  /// The transaction counter value that comes from the terminal.
  final String applicationTransactionCounter;

  /// The expiry date of a payment card.
  final String cardExpiryDate;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The service code of the payment card. This is different from Card Security
  /// Code (CSC).
  final String serviceCode;

  DynamicCardVerificationValue({
    required this.applicationTransactionCounter,
    required this.cardExpiryDate,
    required this.panSequenceNumber,
    required this.serviceCode,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final cardExpiryDate = this.cardExpiryDate;
    final panSequenceNumber = this.panSequenceNumber;
    final serviceCode = this.serviceCode;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'CardExpiryDate': cardExpiryDate,
      'PanSequenceNumber': panSequenceNumber,
      'ServiceCode': serviceCode,
    };
  }
}

/// Parameters that are required to generate or verify dCVC (Dynamic Card
/// Verification Code).
///
/// @nodoc
class DiscoverDynamicCardVerificationCode {
  /// The transaction counter value that comes from the terminal.
  final String applicationTransactionCounter;

  /// The expiry date of a payment card.
  final String cardExpiryDate;

  /// A random number that is generated by the issuer.
  final String unpredictableNumber;

  DiscoverDynamicCardVerificationCode({
    required this.applicationTransactionCounter,
    required this.cardExpiryDate,
    required this.unpredictableNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final cardExpiryDate = this.cardExpiryDate;
    final unpredictableNumber = this.unpredictableNumber;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'CardExpiryDate': cardExpiryDate,
      'UnpredictableNumber': unpredictableNumber,
    };
  }
}

/// Parameters to derive a session key for Authorization Response Cryptogram
/// (ARQC) verification.
///
/// @nodoc
class SessionKeyDerivation {
  /// Parameters to derive session key for an Amex payment card for ARQC
  /// verification.
  final SessionKeyAmex? amex;

  /// Parameters to derive session key for an Emv2000 payment card for ARQC
  /// verification.
  final SessionKeyEmv2000? emv2000;

  /// Parameters to derive session key for an Emv common payment card for ARQC
  /// verification.
  final SessionKeyEmvCommon? emvCommon;

  /// Parameters to derive session key for a Mastercard payment card for ARQC
  /// verification.
  final SessionKeyMastercard? mastercard;

  /// Parameters to derive session key for a Visa payment cardfor ARQC
  /// verification.
  final SessionKeyVisa? visa;

  SessionKeyDerivation({
    this.amex,
    this.emv2000,
    this.emvCommon,
    this.mastercard,
    this.visa,
  });

  Map<String, dynamic> toJson() {
    final amex = this.amex;
    final emv2000 = this.emv2000;
    final emvCommon = this.emvCommon;
    final mastercard = this.mastercard;
    final visa = this.visa;
    return {
      if (amex != null) 'Amex': amex,
      if (emv2000 != null) 'Emv2000': emv2000,
      if (emvCommon != null) 'EmvCommon': emvCommon,
      if (mastercard != null) 'Mastercard': mastercard,
      if (visa != null) 'Visa': visa,
    };
  }
}

/// Parameters that are required for Authorization Response Cryptogram (ARPC)
/// generation after Authorization Request Cryptogram (ARQC) verification is
/// successful.
///
/// @nodoc
class CryptogramAuthResponse {
  /// Parameters that are required for ARPC response generation using method1
  /// after ARQC verification is successful.
  final CryptogramVerificationArpcMethod1? arpcMethod1;

  /// Parameters that are required for ARPC response generation using method2
  /// after ARQC verification is successful.
  final CryptogramVerificationArpcMethod2? arpcMethod2;

  CryptogramAuthResponse({
    this.arpcMethod1,
    this.arpcMethod2,
  });

  Map<String, dynamic> toJson() {
    final arpcMethod1 = this.arpcMethod1;
    final arpcMethod2 = this.arpcMethod2;
    return {
      if (arpcMethod1 != null) 'ArpcMethod1': arpcMethod1,
      if (arpcMethod2 != null) 'ArpcMethod2': arpcMethod2,
    };
  }
}

/// Parameters that are required for ARPC response generation using method1
/// after ARQC verification is successful.
///
/// @nodoc
class CryptogramVerificationArpcMethod1 {
  /// The auth code used to calculate APRC after ARQC verification is successful.
  /// This is the same auth code used for ARQC generation outside of Amazon Web
  /// Services Payment Cryptography.
  final String authResponseCode;

  CryptogramVerificationArpcMethod1({
    required this.authResponseCode,
  });

  Map<String, dynamic> toJson() {
    final authResponseCode = this.authResponseCode;
    return {
      'AuthResponseCode': authResponseCode,
    };
  }
}

/// Parameters that are required for ARPC response generation using method2
/// after ARQC verification is successful.
///
/// @nodoc
class CryptogramVerificationArpcMethod2 {
  /// The data indicating whether the issuer approves or declines an online
  /// transaction using an EMV chip card.
  final String cardStatusUpdate;

  /// The proprietary authentication data used by issuer for communication during
  /// online transaction using an EMV chip card.
  final String? proprietaryAuthenticationData;

  CryptogramVerificationArpcMethod2({
    required this.cardStatusUpdate,
    this.proprietaryAuthenticationData,
  });

  Map<String, dynamic> toJson() {
    final cardStatusUpdate = this.cardStatusUpdate;
    final proprietaryAuthenticationData = this.proprietaryAuthenticationData;
    return {
      'CardStatusUpdate': cardStatusUpdate,
      if (proprietaryAuthenticationData != null)
        'ProprietaryAuthenticationData': proprietaryAuthenticationData,
    };
  }
}

/// Parameters to derive session key for an Emv common payment card for ARQC
/// verification.
///
/// @nodoc
class SessionKeyEmvCommon {
  /// The transaction counter that is provided by the terminal during transaction
  /// processing.
  final String applicationTransactionCounter;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder. A PAN is a unique
  /// identifier for a payment credit or debit card and associates the card to a
  /// specific account holder.
  final String primaryAccountNumber;

  SessionKeyEmvCommon({
    required this.applicationTransactionCounter,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// Parameters to derive session key for Mastercard payment card for ARQC
/// verification.
///
/// @nodoc
class SessionKeyMastercard {
  /// The transaction counter that is provided by the terminal during transaction
  /// processing.
  final String applicationTransactionCounter;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder. A PAN is a unique
  /// identifier for a payment credit or debit card and associates the card to a
  /// specific account holder.
  final String primaryAccountNumber;

  /// A random number generated by the issuer.
  final String unpredictableNumber;

  SessionKeyMastercard({
    required this.applicationTransactionCounter,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
    required this.unpredictableNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    final unpredictableNumber = this.unpredictableNumber;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
      'UnpredictableNumber': unpredictableNumber,
    };
  }
}

/// Parameters to derive session key for an Emv2000 payment card for ARQC
/// verification.
///
/// @nodoc
class SessionKeyEmv2000 {
  /// The transaction counter that is provided by the terminal during transaction
  /// processing.
  final String applicationTransactionCounter;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder. A PAN is a unique
  /// identifier for a payment credit or debit card and associates the card to a
  /// specific account holder.
  final String primaryAccountNumber;

  SessionKeyEmv2000({
    required this.applicationTransactionCounter,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// Parameters to derive session key for an Amex payment card.
///
/// @nodoc
class SessionKeyAmex {
  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder. A PAN is a unique
  /// identifier for a payment credit or debit card and associates the card to a
  /// specific account holder.
  final String primaryAccountNumber;

  SessionKeyAmex({
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// Parameters to derive session key for Visa payment card for ARQC
/// verification.
///
/// @nodoc
class SessionKeyVisa {
  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder. A PAN is a unique
  /// identifier for a payment credit or debit card and associates the card to a
  /// specific account holder.
  final String primaryAccountNumber;

  SessionKeyVisa({
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// Parameters that are required for translation between ISO9564 PIN block
/// formats 0,1,3,4.
///
/// @nodoc
class TranslationIsoFormats {
  /// Parameters that are required for AS2805 PIN format 0 translation.
  final TranslationPinDataAs2805Format0? as2805Format0;

  /// Parameters that are required for ISO9564 PIN format 0 translation.
  final TranslationPinDataIsoFormat034? isoFormat0;

  /// Parameters that are required for ISO9564 PIN format 1 translation.
  final TranslationPinDataIsoFormat1? isoFormat1;

  /// Parameters that are required for ISO9564 PIN format 3 translation.
  final TranslationPinDataIsoFormat034? isoFormat3;

  /// Parameters that are required for ISO9564 PIN format 4 translation.
  final TranslationPinDataIsoFormat034? isoFormat4;

  TranslationIsoFormats({
    this.as2805Format0,
    this.isoFormat0,
    this.isoFormat1,
    this.isoFormat3,
    this.isoFormat4,
  });

  Map<String, dynamic> toJson() {
    final as2805Format0 = this.as2805Format0;
    final isoFormat0 = this.isoFormat0;
    final isoFormat1 = this.isoFormat1;
    final isoFormat3 = this.isoFormat3;
    final isoFormat4 = this.isoFormat4;
    return {
      if (as2805Format0 != null) 'As2805Format0': as2805Format0,
      if (isoFormat0 != null) 'IsoFormat0': isoFormat0,
      if (isoFormat1 != null) 'IsoFormat1': isoFormat1,
      if (isoFormat3 != null) 'IsoFormat3': isoFormat3,
      if (isoFormat4 != null) 'IsoFormat4': isoFormat4,
    };
  }
}

/// Parameters required for encryption or decryption of data using DUKPT.
///
/// @nodoc
class DukptDerivationAttributes {
  /// The unique identifier known as Key Serial Number (KSN) that comes from an
  /// encrypting device using DUKPT encryption method. The KSN is derived from the
  /// encrypting device unique identifier and an internal transaction counter.
  final String keySerialNumber;

  /// The key type derived using DUKPT from a Base Derivation Key (BDK) and Key
  /// Serial Number (KSN). This must be less than or equal to the strength of the
  /// BDK. For example, you can't use <code>AES_128</code> as a derivation type
  /// for a BDK of <code>AES_128</code> or <code>TDES_2KEY</code>
  final DukptDerivationType? dukptKeyDerivationType;

  /// The type of use of DUKPT, which can be for incoming data decryption,
  /// outgoing data encryption, or both.
  final DukptKeyVariant? dukptKeyVariant;

  DukptDerivationAttributes({
    required this.keySerialNumber,
    this.dukptKeyDerivationType,
    this.dukptKeyVariant,
  });

  Map<String, dynamic> toJson() {
    final keySerialNumber = this.keySerialNumber;
    final dukptKeyDerivationType = this.dukptKeyDerivationType;
    final dukptKeyVariant = this.dukptKeyVariant;
    return {
      'KeySerialNumber': keySerialNumber,
      if (dukptKeyDerivationType != null)
        'DukptKeyDerivationType': dukptKeyDerivationType.value,
      if (dukptKeyVariant != null) 'DukptKeyVariant': dukptKeyVariant.value,
    };
  }
}

/// Parameter information to use a PEK derived using AS2805.
///
/// @nodoc
class As2805PekDerivationAttributes {
  /// The system trace audit number for the transaction.
  final String systemTraceAuditNumber;

  /// The transaction amount for the transaction.
  final String transactionAmount;

  As2805PekDerivationAttributes({
    required this.systemTraceAuditNumber,
    required this.transactionAmount,
  });

  Map<String, dynamic> toJson() {
    final systemTraceAuditNumber = this.systemTraceAuditNumber;
    final transactionAmount = this.transactionAmount;
    return {
      'SystemTraceAuditNumber': systemTraceAuditNumber,
      'TransactionAmount': transactionAmount,
    };
  }
}

/// Parameters that are required for translation between ISO9564 PIN format
/// 0,3,4 translation.
///
/// @nodoc
class TranslationPinDataIsoFormat034 {
  /// The Primary Account Number (PAN) of the cardholder. A PAN is a unique
  /// identifier for a payment credit or debit card and associates the card to a
  /// specific account holder.
  final String primaryAccountNumber;

  TranslationPinDataIsoFormat034({
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// Parameters that are required for ISO9564 PIN format 1 translation.
///
/// @nodoc
class TranslationPinDataIsoFormat1 {
  TranslationPinDataIsoFormat1();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Parameters that are required for translation between AS2805 PIN format 0
/// translation.
///
/// @nodoc
class TranslationPinDataAs2805Format0 {
  /// The Primary Account Number (PAN) of the cardholder. A PAN is a unique
  /// identifier for a payment credit or debit card and associates the card to a
  /// specific account holder.
  final String primaryAccountNumber;

  TranslationPinDataAs2805Format0({
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// The parameter information of the outgoing wrapped key block.
///
/// @nodoc
class WrappedWorkingKey {
  /// The key check value (KCV) of the key contained within the outgoing
  /// TR31WrappedKeyBlock.
  ///
  /// The KCV is used to check if all parties holding a given key have the same
  /// key or to detect that a key has changed. For more information on KCV, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/terminology.html#terms.kcv">KCV</a>
  /// in the <i>Amazon Web Services Payment Cryptography User Guide</i>.
  final String keyCheckValue;

  /// The wrapped key block of the outgoing transaction key.
  final String wrappedKeyMaterial;

  /// The key block format of the wrapped key.
  final WrappedKeyMaterialFormat wrappedKeyMaterialFormat;

  WrappedWorkingKey({
    required this.keyCheckValue,
    required this.wrappedKeyMaterial,
    required this.wrappedKeyMaterialFormat,
  });

  factory WrappedWorkingKey.fromJson(Map<String, dynamic> json) {
    return WrappedWorkingKey(
      keyCheckValue: (json['KeyCheckValue'] as String?) ?? '',
      wrappedKeyMaterial: (json['WrappedKeyMaterial'] as String?) ?? '',
      wrappedKeyMaterialFormat: WrappedKeyMaterialFormat.fromString(
          (json['WrappedKeyMaterialFormat'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final keyCheckValue = this.keyCheckValue;
    final wrappedKeyMaterial = this.wrappedKeyMaterial;
    final wrappedKeyMaterialFormat = this.wrappedKeyMaterialFormat;
    return {
      'KeyCheckValue': keyCheckValue,
      'WrappedKeyMaterial': wrappedKeyMaterial,
      'WrappedKeyMaterialFormat': wrappedKeyMaterialFormat.value,
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

/// Parameter information of the incoming WrappedKeyBlock containing the
/// transaction key.
///
/// @nodoc
class IncomingKeyMaterial {
  /// Parameter information of the TR31WrappedKeyBlock containing the transaction
  /// key wrapped using an ECDH dervied key.
  final IncomingDiffieHellmanTr31KeyBlock? diffieHellmanTr31KeyBlock;

  IncomingKeyMaterial({
    this.diffieHellmanTr31KeyBlock,
  });

  Map<String, dynamic> toJson() {
    final diffieHellmanTr31KeyBlock = this.diffieHellmanTr31KeyBlock;
    return {
      if (diffieHellmanTr31KeyBlock != null)
        'DiffieHellmanTr31KeyBlock': diffieHellmanTr31KeyBlock,
    };
  }
}

/// Parameter information of the outgoing TR31WrappedKeyBlock containing the
/// transaction key.
///
/// @nodoc
class OutgoingKeyMaterial {
  /// Parameter information of the TR31WrappedKeyBlock containing the transaction
  /// key wrapped using a KEK.
  final OutgoingTr31KeyBlock? tr31KeyBlock;

  OutgoingKeyMaterial({
    this.tr31KeyBlock,
  });

  Map<String, dynamic> toJson() {
    final tr31KeyBlock = this.tr31KeyBlock;
    return {
      if (tr31KeyBlock != null) 'Tr31KeyBlock': tr31KeyBlock,
    };
  }
}

/// Parameter information of the TR31WrappedKeyBlock containing the transaction
/// key wrapped using a KEK.
///
/// @nodoc
class OutgoingTr31KeyBlock {
  /// The <code>keyARN</code> of the KEK used to wrap the transaction key.
  final String wrappingKeyIdentifier;

  OutgoingTr31KeyBlock({
    required this.wrappingKeyIdentifier,
  });

  Map<String, dynamic> toJson() {
    final wrappingKeyIdentifier = this.wrappingKeyIdentifier;
    return {
      'WrappingKeyIdentifier': wrappingKeyIdentifier,
    };
  }
}

/// Parameter information of a TR31KeyBlock wrapped using an ECDH derived key.
///
/// @nodoc
class IncomingDiffieHellmanTr31KeyBlock {
  /// The <code>keyArn</code> of the certificate that signed the client's
  /// <code>PublicKeyCertificate</code>.
  final String certificateAuthorityPublicKeyIdentifier;
  final DiffieHellmanDerivationData derivationData;

  /// The key algorithm of the derived ECDH key.
  final SymmetricKeyAlgorithm deriveKeyAlgorithm;

  /// The key derivation function to use for deriving a key using ECDH.
  final KeyDerivationFunction keyDerivationFunction;

  /// The hash type to use for deriving a key using ECDH.
  final KeyDerivationHashAlgorithm keyDerivationHashAlgorithm;

  /// The <code>keyARN</code> of the asymmetric ECC key pair.
  final String privateKeyIdentifier;

  /// The client's public key certificate in PEM format (base64 encoded) to use
  /// for ECDH key derivation.
  final String publicKeyCertificate;

  /// The WrappedKeyBlock containing the transaction key wrapped using an ECDH
  /// dervied key.
  final String wrappedKeyBlock;

  IncomingDiffieHellmanTr31KeyBlock({
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

/// Parameters that are required to perform reencryption operation.
///
/// @nodoc
class ReEncryptionAttributes {
  final DukptEncryptionAttributes? dukpt;

  /// Parameters that are required to encrypt data using symmetric keys.
  final SymmetricEncryptionAttributes? symmetric;

  ReEncryptionAttributes({
    this.dukpt,
    this.symmetric,
  });

  Map<String, dynamic> toJson() {
    final dukpt = this.dukpt;
    final symmetric = this.symmetric;
    return {
      if (dukpt != null) 'Dukpt': dukpt,
      if (symmetric != null) 'Symmetric': symmetric,
    };
  }
}

/// Parameters requried to encrypt plaintext data using symmetric keys.
///
/// @nodoc
class SymmetricEncryptionAttributes {
  /// The block cipher method to use for encryption.
  final EncryptionMode mode;

  /// An input used to provide the intial state. If no value is provided, Amazon
  /// Web Services Payment Cryptography defaults it to zero.
  final String? initializationVector;

  /// The padding to be included with the data.
  final PaddingType? paddingType;

  SymmetricEncryptionAttributes({
    required this.mode,
    this.initializationVector,
    this.paddingType,
  });

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final initializationVector = this.initializationVector;
    final paddingType = this.paddingType;
    return {
      'Mode': mode.value,
      if (initializationVector != null)
        'InitializationVector': initializationVector,
      if (paddingType != null) 'PaddingType': paddingType.value,
    };
  }
}

/// Parameters that are required to encrypt plaintext data using DUKPT.
///
/// @nodoc
class DukptEncryptionAttributes {
  /// The unique identifier known as Key Serial Number (KSN) that comes from an
  /// encrypting device using DUKPT encryption method. The KSN is derived from the
  /// encrypting device unique identifier and an internal transaction counter.
  final String keySerialNumber;

  /// The key type encrypted using DUKPT from a Base Derivation Key (BDK) and Key
  /// Serial Number (KSN). This must be less than or equal to the strength of the
  /// BDK. For example, you can't use <code>AES_128</code> as a derivation type
  /// for a BDK of <code>AES_128</code> or <code>TDES_2KEY</code>
  final DukptDerivationType? dukptKeyDerivationType;

  /// The type of use of DUKPT, which can be incoming data decryption, outgoing
  /// data encryption, or both.
  final DukptKeyVariant? dukptKeyVariant;

  /// An input used to provide the intial state. If no value is provided, Amazon
  /// Web Services Payment Cryptography defaults it to zero.
  final String? initializationVector;

  /// The block cipher method to use for encryption.
  ///
  /// The default is CBC.
  final DukptEncryptionMode? mode;

  DukptEncryptionAttributes({
    required this.keySerialNumber,
    this.dukptKeyDerivationType,
    this.dukptKeyVariant,
    this.initializationVector,
    this.mode,
  });

  Map<String, dynamic> toJson() {
    final keySerialNumber = this.keySerialNumber;
    final dukptKeyDerivationType = this.dukptKeyDerivationType;
    final dukptKeyVariant = this.dukptKeyVariant;
    final initializationVector = this.initializationVector;
    final mode = this.mode;
    return {
      'KeySerialNumber': keySerialNumber,
      if (dukptKeyDerivationType != null)
        'DukptKeyDerivationType': dukptKeyDerivationType.value,
      if (dukptKeyVariant != null) 'DukptKeyVariant': dukptKeyVariant.value,
      if (initializationVector != null)
        'InitializationVector': initializationVector,
      if (mode != null) 'Mode': mode.value,
    };
  }
}

/// @nodoc
class DukptEncryptionMode {
  static const ecb = DukptEncryptionMode._('ECB');
  static const cbc = DukptEncryptionMode._('CBC');

  final String value;

  const DukptEncryptionMode._(this.value);

  static const values = [ecb, cbc];

  static DukptEncryptionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DukptEncryptionMode._(value));

  @override
  bool operator ==(other) =>
      other is DukptEncryptionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EncryptionMode {
  static const ecb = EncryptionMode._('ECB');
  static const cbc = EncryptionMode._('CBC');
  static const cfb = EncryptionMode._('CFB');
  static const cfb1 = EncryptionMode._('CFB1');
  static const cfb8 = EncryptionMode._('CFB8');
  static const cfb64 = EncryptionMode._('CFB64');
  static const cfb128 = EncryptionMode._('CFB128');
  static const ofb = EncryptionMode._('OFB');

  final String value;

  const EncryptionMode._(this.value);

  static const values = [ecb, cbc, cfb, cfb1, cfb8, cfb64, cfb128, ofb];

  static EncryptionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionMode._(value));

  @override
  bool operator ==(other) => other is EncryptionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PaddingType {
  static const pkcs1 = PaddingType._('PKCS1');
  static const oaepSha1 = PaddingType._('OAEP_SHA1');
  static const oaepSha256 = PaddingType._('OAEP_SHA256');
  static const oaepSha512 = PaddingType._('OAEP_SHA512');

  final String value;

  const PaddingType._(this.value);

  static const values = [pkcs1, oaepSha1, oaepSha256, oaepSha512];

  static PaddingType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PaddingType._(value));

  @override
  bool operator ==(other) => other is PaddingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameters that are required to generate, translate, or verify PIN data.
///
/// @nodoc
class PinData {
  /// The PIN offset value.
  final String? pinOffset;

  /// The unique data to identify a cardholder. In most cases, this is the same as
  /// cardholder's Primary Account Number (PAN). If a value is not provided, it
  /// defaults to PAN.
  final String? verificationValue;

  PinData({
    this.pinOffset,
    this.verificationValue,
  });

  factory PinData.fromJson(Map<String, dynamic> json) {
    return PinData(
      pinOffset: json['PinOffset'] as String?,
      verificationValue: json['VerificationValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pinOffset = this.pinOffset;
    final verificationValue = this.verificationValue;
    return {
      if (pinOffset != null) 'PinOffset': pinOffset,
      if (verificationValue != null) 'VerificationValue': verificationValue,
    };
  }
}

/// Parameters that are required for PIN data generation.
///
/// @nodoc
class PinGenerationAttributes {
  /// Parameters that are required to generate or verify Ibm3624 natural PIN.
  final Ibm3624NaturalPin? ibm3624NaturalPin;

  /// Parameters that are required to generate or verify Ibm3624 PIN from offset
  /// PIN.
  final Ibm3624PinFromOffset? ibm3624PinFromOffset;

  /// Parameters that are required to generate or verify Ibm3624 PIN offset PIN.
  final Ibm3624PinOffset? ibm3624PinOffset;

  /// Parameters that are required to generate or verify Ibm3624 random PIN.
  final Ibm3624RandomPin? ibm3624RandomPin;

  /// Parameters that are required to generate or verify Visa PIN.
  final VisaPin? visaPin;

  /// Parameters that are required to generate or verify Visa PIN Verification
  /// Value (PVV).
  final VisaPinVerificationValue? visaPinVerificationValue;

  PinGenerationAttributes({
    this.ibm3624NaturalPin,
    this.ibm3624PinFromOffset,
    this.ibm3624PinOffset,
    this.ibm3624RandomPin,
    this.visaPin,
    this.visaPinVerificationValue,
  });

  Map<String, dynamic> toJson() {
    final ibm3624NaturalPin = this.ibm3624NaturalPin;
    final ibm3624PinFromOffset = this.ibm3624PinFromOffset;
    final ibm3624PinOffset = this.ibm3624PinOffset;
    final ibm3624RandomPin = this.ibm3624RandomPin;
    final visaPin = this.visaPin;
    final visaPinVerificationValue = this.visaPinVerificationValue;
    return {
      if (ibm3624NaturalPin != null) 'Ibm3624NaturalPin': ibm3624NaturalPin,
      if (ibm3624PinFromOffset != null)
        'Ibm3624PinFromOffset': ibm3624PinFromOffset,
      if (ibm3624PinOffset != null) 'Ibm3624PinOffset': ibm3624PinOffset,
      if (ibm3624RandomPin != null) 'Ibm3624RandomPin': ibm3624RandomPin,
      if (visaPin != null) 'VisaPin': visaPin,
      if (visaPinVerificationValue != null)
        'VisaPinVerificationValue': visaPinVerificationValue,
    };
  }
}

/// Parameters that are required to generate or verify Visa PIN.
///
/// @nodoc
class VisaPin {
  /// The value for PIN verification index. It is used in the Visa PIN algorithm
  /// to calculate the PVV (PIN Verification Value).
  final int pinVerificationKeyIndex;

  VisaPin({
    required this.pinVerificationKeyIndex,
  });

  Map<String, dynamic> toJson() {
    final pinVerificationKeyIndex = this.pinVerificationKeyIndex;
    return {
      'PinVerificationKeyIndex': pinVerificationKeyIndex,
    };
  }
}

/// Parameters that are required to generate or verify Visa PVV (PIN
/// Verification Value).
///
/// @nodoc
class VisaPinVerificationValue {
  /// The encrypted PIN block data to verify.
  final String encryptedPinBlock;

  /// The value for PIN verification index. It is used in the Visa PIN algorithm
  /// to calculate the PVV (PIN Verification Value).
  final int pinVerificationKeyIndex;

  VisaPinVerificationValue({
    required this.encryptedPinBlock,
    required this.pinVerificationKeyIndex,
  });

  Map<String, dynamic> toJson() {
    final encryptedPinBlock = this.encryptedPinBlock;
    final pinVerificationKeyIndex = this.pinVerificationKeyIndex;
    return {
      'EncryptedPinBlock': encryptedPinBlock,
      'PinVerificationKeyIndex': pinVerificationKeyIndex,
    };
  }
}

/// Pparameters that are required to generate or verify Ibm3624 PIN offset PIN.
///
/// @nodoc
class Ibm3624PinOffset {
  /// The decimalization table to use for IBM 3624 PIN algorithm. The table is
  /// used to convert the algorithm intermediate result from hexadecimal
  /// characters to decimal.
  final String decimalizationTable;

  /// The encrypted PIN block data. According to ISO 9564 standard, a PIN Block is
  /// an encoded representation of a payment card Personal Account Number (PAN)
  /// and the cardholder Personal Identification Number (PIN).
  final String encryptedPinBlock;

  /// The unique data for cardholder identification.
  final String pinValidationData;

  /// The padding character for validation data.
  final String pinValidationDataPadCharacter;

  Ibm3624PinOffset({
    required this.decimalizationTable,
    required this.encryptedPinBlock,
    required this.pinValidationData,
    required this.pinValidationDataPadCharacter,
  });

  Map<String, dynamic> toJson() {
    final decimalizationTable = this.decimalizationTable;
    final encryptedPinBlock = this.encryptedPinBlock;
    final pinValidationData = this.pinValidationData;
    final pinValidationDataPadCharacter = this.pinValidationDataPadCharacter;
    return {
      'DecimalizationTable': decimalizationTable,
      'EncryptedPinBlock': encryptedPinBlock,
      'PinValidationData': pinValidationData,
      'PinValidationDataPadCharacter': pinValidationDataPadCharacter,
    };
  }
}

/// Parameters that are required to generate or verify Ibm3624 natural PIN.
///
/// @nodoc
class Ibm3624NaturalPin {
  /// The decimalization table to use for IBM 3624 PIN algorithm. The table is
  /// used to convert the algorithm intermediate result from hexadecimal
  /// characters to decimal.
  final String decimalizationTable;

  /// The unique data for cardholder identification.
  final String pinValidationData;

  /// The padding character for validation data.
  final String pinValidationDataPadCharacter;

  Ibm3624NaturalPin({
    required this.decimalizationTable,
    required this.pinValidationData,
    required this.pinValidationDataPadCharacter,
  });

  Map<String, dynamic> toJson() {
    final decimalizationTable = this.decimalizationTable;
    final pinValidationData = this.pinValidationData;
    final pinValidationDataPadCharacter = this.pinValidationDataPadCharacter;
    return {
      'DecimalizationTable': decimalizationTable,
      'PinValidationData': pinValidationData,
      'PinValidationDataPadCharacter': pinValidationDataPadCharacter,
    };
  }
}

/// Parameters that are required to generate or verify Ibm3624 random PIN.
///
/// @nodoc
class Ibm3624RandomPin {
  /// The decimalization table to use for IBM 3624 PIN algorithm. The table is
  /// used to convert the algorithm intermediate result from hexadecimal
  /// characters to decimal.
  final String decimalizationTable;

  /// The unique data for cardholder identification.
  final String pinValidationData;

  /// The padding character for validation data.
  final String pinValidationDataPadCharacter;

  Ibm3624RandomPin({
    required this.decimalizationTable,
    required this.pinValidationData,
    required this.pinValidationDataPadCharacter,
  });

  Map<String, dynamic> toJson() {
    final decimalizationTable = this.decimalizationTable;
    final pinValidationData = this.pinValidationData;
    final pinValidationDataPadCharacter = this.pinValidationDataPadCharacter;
    return {
      'DecimalizationTable': decimalizationTable,
      'PinValidationData': pinValidationData,
      'PinValidationDataPadCharacter': pinValidationDataPadCharacter,
    };
  }
}

/// Parameters that are required to generate or verify Ibm3624 PIN from offset
/// PIN.
///
/// @nodoc
class Ibm3624PinFromOffset {
  /// The decimalization table to use for IBM 3624 PIN algorithm. The table is
  /// used to convert the algorithm intermediate result from hexadecimal
  /// characters to decimal.
  final String decimalizationTable;

  /// The PIN offset value.
  final String pinOffset;

  /// The unique data for cardholder identification.
  final String pinValidationData;

  /// The padding character for validation data.
  final String pinValidationDataPadCharacter;

  Ibm3624PinFromOffset({
    required this.decimalizationTable,
    required this.pinOffset,
    required this.pinValidationData,
    required this.pinValidationDataPadCharacter,
  });

  Map<String, dynamic> toJson() {
    final decimalizationTable = this.decimalizationTable;
    final pinOffset = this.pinOffset;
    final pinValidationData = this.pinValidationData;
    final pinValidationDataPadCharacter = this.pinValidationDataPadCharacter;
    return {
      'DecimalizationTable': decimalizationTable,
      'PinOffset': pinOffset,
      'PinValidationData': pinValidationData,
      'PinValidationDataPadCharacter': pinValidationDataPadCharacter,
    };
  }
}

/// The attributes values used for Amex and Visa derivation methods.
///
/// @nodoc
class VisaAmexDerivationOutputs {
  /// The <code>keyArn</code> of the issuer master key for cryptogram (IMK-AC)
  /// used by the operation.
  final String authorizationRequestKeyArn;

  /// The key check value (KCV) of the issuer master key for cryptogram (IMK-AC)
  /// used by the operation.
  final String authorizationRequestKeyCheckValue;

  /// The <code>keyArn</code> of the current PIN PEK.
  final String? currentPinPekArn;

  /// The key check value (KCV) of the current PIN PEK.
  final String? currentPinPekKeyCheckValue;

  VisaAmexDerivationOutputs({
    required this.authorizationRequestKeyArn,
    required this.authorizationRequestKeyCheckValue,
    this.currentPinPekArn,
    this.currentPinPekKeyCheckValue,
  });

  factory VisaAmexDerivationOutputs.fromJson(Map<String, dynamic> json) {
    return VisaAmexDerivationOutputs(
      authorizationRequestKeyArn:
          (json['AuthorizationRequestKeyArn'] as String?) ?? '',
      authorizationRequestKeyCheckValue:
          (json['AuthorizationRequestKeyCheckValue'] as String?) ?? '',
      currentPinPekArn: json['CurrentPinPekArn'] as String?,
      currentPinPekKeyCheckValue: json['CurrentPinPekKeyCheckValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationRequestKeyArn = this.authorizationRequestKeyArn;
    final authorizationRequestKeyCheckValue =
        this.authorizationRequestKeyCheckValue;
    final currentPinPekArn = this.currentPinPekArn;
    final currentPinPekKeyCheckValue = this.currentPinPekKeyCheckValue;
    return {
      'AuthorizationRequestKeyArn': authorizationRequestKeyArn,
      'AuthorizationRequestKeyCheckValue': authorizationRequestKeyCheckValue,
      if (currentPinPekArn != null) 'CurrentPinPekArn': currentPinPekArn,
      if (currentPinPekKeyCheckValue != null)
        'CurrentPinPekKeyCheckValue': currentPinPekKeyCheckValue,
    };
  }
}

/// @nodoc
class PinBlockFormatForEmvPinChange {
  static const isoFormat_0 = PinBlockFormatForEmvPinChange._('ISO_FORMAT_0');
  static const isoFormat_1 = PinBlockFormatForEmvPinChange._('ISO_FORMAT_1');
  static const isoFormat_3 = PinBlockFormatForEmvPinChange._('ISO_FORMAT_3');

  final String value;

  const PinBlockFormatForEmvPinChange._(this.value);

  static const values = [isoFormat_0, isoFormat_1, isoFormat_3];

  static PinBlockFormatForEmvPinChange fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PinBlockFormatForEmvPinChange._(value));

  @override
  bool operator ==(other) =>
      other is PinBlockFormatForEmvPinChange && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameters to derive the payment card specific confidentiality and integrity
/// keys.
///
/// @nodoc
class DerivationMethodAttributes {
  /// Parameters to derive the confidentiality and integrity keys for a payment
  /// card using Amex derivation method.
  final AmexAttributes? amex;

  /// Parameters to derive the confidentiality and integrity keys for a payment
  /// card using Emv2000 derivation method.
  final Emv2000Attributes? emv2000;

  /// Parameters to derive the confidentiality and integrity keys for a payment
  /// card using Emv common derivation method.
  final EmvCommonAttributes? emvCommon;

  /// Parameters to derive the confidentiality and integrity keys for a payment
  /// card using Mastercard derivation method.
  final MasterCardAttributes? mastercard;

  /// Parameters to derive the confidentiality and integrity keys for a a payment
  /// card using Visa derivation method.
  final VisaAttributes? visa;

  DerivationMethodAttributes({
    this.amex,
    this.emv2000,
    this.emvCommon,
    this.mastercard,
    this.visa,
  });

  Map<String, dynamic> toJson() {
    final amex = this.amex;
    final emv2000 = this.emv2000;
    final emvCommon = this.emvCommon;
    final mastercard = this.mastercard;
    final visa = this.visa;
    return {
      if (amex != null) 'Amex': amex,
      if (emv2000 != null) 'Emv2000': emv2000,
      if (emvCommon != null) 'EmvCommon': emvCommon,
      if (mastercard != null) 'Mastercard': mastercard,
      if (visa != null) 'Visa': visa,
    };
  }
}

/// Parameters to derive the confidentiality and integrity keys for an Emv
/// common payment card.
///
/// @nodoc
class EmvCommonAttributes {
  /// The application cryptogram for the current transaction that is provided by
  /// the terminal during transaction processing.
  final String applicationCryptogram;

  /// The method to use when deriving the master key for the payment card.
  final MajorKeyDerivationMode majorKeyDerivationMode;

  /// The block cipher method to use for encryption.
  final EmvEncryptionMode mode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN). Typically 00 is used, if no value is provided
  /// by the terminal.
  final String panSequenceNumber;

  /// Specifies if PIN block length should be added to front of the pin block.
  ///
  /// If value is set to <code>FRONT_OF_PIN_BLOCK</code>, then PIN block padding
  /// type should be <code>ISO_IEC_7816_4</code>.
  final PinBlockLengthPosition pinBlockLengthPosition;

  /// The padding to be added to the PIN block prior to encryption.
  ///
  /// Padding type should be <code>ISO_IEC_7816_4</code>, if
  /// <code>PinBlockLengthPosition</code> is set to
  /// <code>FRONT_OF_PIN_BLOCK</code>. No padding is required, if
  /// <code>PinBlockLengthPosition</code> is set to <code>NONE</code>.
  final PinBlockPaddingType pinBlockPaddingType;

  /// The Primary Account Number (PAN) of the cardholder.
  final String primaryAccountNumber;

  EmvCommonAttributes({
    required this.applicationCryptogram,
    required this.majorKeyDerivationMode,
    required this.mode,
    required this.panSequenceNumber,
    required this.pinBlockLengthPosition,
    required this.pinBlockPaddingType,
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationCryptogram = this.applicationCryptogram;
    final majorKeyDerivationMode = this.majorKeyDerivationMode;
    final mode = this.mode;
    final panSequenceNumber = this.panSequenceNumber;
    final pinBlockLengthPosition = this.pinBlockLengthPosition;
    final pinBlockPaddingType = this.pinBlockPaddingType;
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'ApplicationCryptogram': applicationCryptogram,
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'Mode': mode.value,
      'PanSequenceNumber': panSequenceNumber,
      'PinBlockLengthPosition': pinBlockLengthPosition.value,
      'PinBlockPaddingType': pinBlockPaddingType.value,
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// Parameters to derive the confidentiality and integrity keys for a payment
/// card using Amex derivation method.
///
/// @nodoc
class AmexAttributes {
  /// The transaction counter of the current transaction that is provided by the
  /// terminal during transaction processing.
  final String applicationTransactionCounter;

  /// The <code>keyArn</code> of the issuer master key for cryptogram (IMK-AC) for
  /// the payment card.
  final String authorizationRequestKeyIdentifier;

  /// The method to use when deriving the master key for a payment card using Amex
  /// derivation.
  final MajorKeyDerivationMode majorKeyDerivationMode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN). Typically 00 is used, if no value is provided
  /// by the terminal.
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder.
  final String primaryAccountNumber;

  /// The encrypted pinblock of the old pin stored on the chip card.
  final CurrentPinAttributes? currentPinAttributes;

  AmexAttributes({
    required this.applicationTransactionCounter,
    required this.authorizationRequestKeyIdentifier,
    required this.majorKeyDerivationMode,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
    this.currentPinAttributes,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final authorizationRequestKeyIdentifier =
        this.authorizationRequestKeyIdentifier;
    final majorKeyDerivationMode = this.majorKeyDerivationMode;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    final currentPinAttributes = this.currentPinAttributes;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'AuthorizationRequestKeyIdentifier': authorizationRequestKeyIdentifier,
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
      if (currentPinAttributes != null)
        'CurrentPinAttributes': currentPinAttributes,
    };
  }
}

/// Parameters to derive the confidentiality and integrity keys for a Visa
/// payment card.
///
/// @nodoc
class VisaAttributes {
  /// The transaction counter of the current transaction that is provided by the
  /// terminal during transaction processing.
  final String applicationTransactionCounter;

  /// The <code>keyArn</code> of the issuer master key for cryptogram (IMK-AC) for
  /// the payment card.
  final String authorizationRequestKeyIdentifier;

  /// The method to use when deriving the master key for the payment card.
  final MajorKeyDerivationMode majorKeyDerivationMode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN). Typically 00 is used, if no value is provided
  /// by the terminal.
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder.
  final String primaryAccountNumber;

  /// The encrypted pinblock of the old pin stored on the chip card.
  final CurrentPinAttributes? currentPinAttributes;

  VisaAttributes({
    required this.applicationTransactionCounter,
    required this.authorizationRequestKeyIdentifier,
    required this.majorKeyDerivationMode,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
    this.currentPinAttributes,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final authorizationRequestKeyIdentifier =
        this.authorizationRequestKeyIdentifier;
    final majorKeyDerivationMode = this.majorKeyDerivationMode;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    final currentPinAttributes = this.currentPinAttributes;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'AuthorizationRequestKeyIdentifier': authorizationRequestKeyIdentifier,
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
      if (currentPinAttributes != null)
        'CurrentPinAttributes': currentPinAttributes,
    };
  }
}

/// Parameters to derive the confidentiality and integrity keys for a payment
/// card using EMV2000 deruv.
///
/// @nodoc
class Emv2000Attributes {
  /// The transaction counter of the current transaction that is provided by the
  /// terminal during transaction processing.
  final String applicationTransactionCounter;

  /// The method to use when deriving the master key for the payment card.
  final MajorKeyDerivationMode majorKeyDerivationMode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN). Typically 00 is used, if no value is provided
  /// by the terminal.
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder.
  final String primaryAccountNumber;

  Emv2000Attributes({
    required this.applicationTransactionCounter,
    required this.majorKeyDerivationMode,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationTransactionCounter = this.applicationTransactionCounter;
    final majorKeyDerivationMode = this.majorKeyDerivationMode;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'ApplicationTransactionCounter': applicationTransactionCounter,
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// Parameters to derive the confidentiality and integrity keys for a Mastercard
/// payment card.
///
/// @nodoc
class MasterCardAttributes {
  /// The application cryptogram for the current transaction that is provided by
  /// the terminal during transaction processing.
  final String applicationCryptogram;

  /// The method to use when deriving the master key for the payment card.
  final MajorKeyDerivationMode majorKeyDerivationMode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN). Typically 00 is used, if no value is provided
  /// by the terminal.
  final String panSequenceNumber;

  /// The Primary Account Number (PAN) of the cardholder.
  final String primaryAccountNumber;

  MasterCardAttributes({
    required this.applicationCryptogram,
    required this.majorKeyDerivationMode,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
  });

  Map<String, dynamic> toJson() {
    final applicationCryptogram = this.applicationCryptogram;
    final majorKeyDerivationMode = this.majorKeyDerivationMode;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    return {
      'ApplicationCryptogram': applicationCryptogram,
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
    };
  }
}

/// The parameter values of the current PIN to be changed on the EMV chip card.
///
/// @nodoc
class CurrentPinAttributes {
  /// The encrypted pinblock of the current pin stored on the chip card.
  final String currentEncryptedPinBlock;

  /// The <code>keyArn</code> of the current PIN PEK.
  final String currentPinPekIdentifier;

  CurrentPinAttributes({
    required this.currentEncryptedPinBlock,
    required this.currentPinPekIdentifier,
  });

  Map<String, dynamic> toJson() {
    final currentEncryptedPinBlock = this.currentEncryptedPinBlock;
    final currentPinPekIdentifier = this.currentPinPekIdentifier;
    return {
      'CurrentEncryptedPinBlock': currentEncryptedPinBlock,
      'CurrentPinPekIdentifier': currentPinPekIdentifier,
    };
  }
}

/// @nodoc
class EmvEncryptionMode {
  static const ecb = EmvEncryptionMode._('ECB');
  static const cbc = EmvEncryptionMode._('CBC');

  final String value;

  const EmvEncryptionMode._(this.value);

  static const values = [ecb, cbc];

  static EmvEncryptionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EmvEncryptionMode._(value));

  @override
  bool operator ==(other) => other is EmvEncryptionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PinBlockPaddingType {
  static const noPadding = PinBlockPaddingType._('NO_PADDING');
  static const isoIec_7816_4 = PinBlockPaddingType._('ISO_IEC_7816_4');

  final String value;

  const PinBlockPaddingType._(this.value);

  static const values = [noPadding, isoIec_7816_4];

  static PinBlockPaddingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PinBlockPaddingType._(value));

  @override
  bool operator ==(other) =>
      other is PinBlockPaddingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PinBlockLengthPosition {
  static const none = PinBlockLengthPosition._('NONE');
  static const frontOfPinBlock = PinBlockLengthPosition._('FRONT_OF_PIN_BLOCK');

  final String value;

  const PinBlockLengthPosition._(this.value);

  static const values = [none, frontOfPinBlock];

  static PinBlockLengthPosition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PinBlockLengthPosition._(value));

  @override
  bool operator ==(other) =>
      other is PinBlockLengthPosition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Card data parameters that are required to generate Card Verification Values
/// (CVV/CVV2), Dynamic Card Verification Values (dCVV/dCVV2), or Card Security
/// Codes (CSC).
///
/// @nodoc
class CardGenerationAttributes {
  final AmexCardSecurityCodeVersion1? amexCardSecurityCodeVersion1;

  /// Card data parameters that are required to generate a Card Security Code
  /// (CSC2) for an AMEX payment card.
  final AmexCardSecurityCodeVersion2? amexCardSecurityCodeVersion2;

  /// Card data parameters that are required to generate a cardholder verification
  /// value for the payment card.
  final CardHolderVerificationValue? cardHolderVerificationValue;

  /// Card data parameters that are required to generate Card Verification Value
  /// (CVV) for the payment card.
  final CardVerificationValue1? cardVerificationValue1;

  /// Card data parameters that are required to generate Card Verification Value
  /// (CVV2) for the payment card.
  final CardVerificationValue2? cardVerificationValue2;

  /// Card data parameters that are required to generate CDynamic Card
  /// Verification Code (dCVC) for the payment card.
  final DynamicCardVerificationCode? dynamicCardVerificationCode;

  /// Card data parameters that are required to generate CDynamic Card
  /// Verification Value (dCVV) for the payment card.
  final DynamicCardVerificationValue? dynamicCardVerificationValue;

  CardGenerationAttributes({
    this.amexCardSecurityCodeVersion1,
    this.amexCardSecurityCodeVersion2,
    this.cardHolderVerificationValue,
    this.cardVerificationValue1,
    this.cardVerificationValue2,
    this.dynamicCardVerificationCode,
    this.dynamicCardVerificationValue,
  });

  Map<String, dynamic> toJson() {
    final amexCardSecurityCodeVersion1 = this.amexCardSecurityCodeVersion1;
    final amexCardSecurityCodeVersion2 = this.amexCardSecurityCodeVersion2;
    final cardHolderVerificationValue = this.cardHolderVerificationValue;
    final cardVerificationValue1 = this.cardVerificationValue1;
    final cardVerificationValue2 = this.cardVerificationValue2;
    final dynamicCardVerificationCode = this.dynamicCardVerificationCode;
    final dynamicCardVerificationValue = this.dynamicCardVerificationValue;
    return {
      if (amexCardSecurityCodeVersion1 != null)
        'AmexCardSecurityCodeVersion1': amexCardSecurityCodeVersion1,
      if (amexCardSecurityCodeVersion2 != null)
        'AmexCardSecurityCodeVersion2': amexCardSecurityCodeVersion2,
      if (cardHolderVerificationValue != null)
        'CardHolderVerificationValue': cardHolderVerificationValue,
      if (cardVerificationValue1 != null)
        'CardVerificationValue1': cardVerificationValue1,
      if (cardVerificationValue2 != null)
        'CardVerificationValue2': cardVerificationValue2,
      if (dynamicCardVerificationCode != null)
        'DynamicCardVerificationCode': dynamicCardVerificationCode,
      if (dynamicCardVerificationValue != null)
        'DynamicCardVerificationValue': dynamicCardVerificationValue,
    };
  }
}

/// Parameter information for generating a random key for KEK validation to
/// perform node-to-node initialization.
///
/// @nodoc
class As2805KekValidationType {
  /// Parameter information for generating a KEK validation request during
  /// node-to-node initialization.
  final KekValidationRequest? kekValidationRequest;

  /// Parameter information for generating a KEK validation response during
  /// node-to-node initialization.
  final KekValidationResponse? kekValidationResponse;

  As2805KekValidationType({
    this.kekValidationRequest,
    this.kekValidationResponse,
  });

  Map<String, dynamic> toJson() {
    final kekValidationRequest = this.kekValidationRequest;
    final kekValidationResponse = this.kekValidationResponse;
    return {
      if (kekValidationRequest != null)
        'KekValidationRequest': kekValidationRequest,
      if (kekValidationResponse != null)
        'KekValidationResponse': kekValidationResponse,
    };
  }
}

/// @nodoc
class RandomKeySendVariantMask {
  static const variantMask_82c0 =
      RandomKeySendVariantMask._('VARIANT_MASK_82C0');
  static const variantMask_82 = RandomKeySendVariantMask._('VARIANT_MASK_82');

  final String value;

  const RandomKeySendVariantMask._(this.value);

  static const values = [variantMask_82c0, variantMask_82];

  static RandomKeySendVariantMask fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RandomKeySendVariantMask._(value));

  @override
  bool operator ==(other) =>
      other is RandomKeySendVariantMask && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameter information for generating a KEK validation request during
/// node-to-node initialization.
///
/// @nodoc
class KekValidationRequest {
  /// The key derivation algorithm to use for generating a KEK validation request.
  final SymmetricKeyAlgorithm deriveKeyAlgorithm;

  /// The maximum length of the random key to generate for a KEK validation
  /// request.
  final RandomKeyMaxLength? randomKeyMaxLength;

  KekValidationRequest({
    required this.deriveKeyAlgorithm,
    this.randomKeyMaxLength,
  });

  Map<String, dynamic> toJson() {
    final deriveKeyAlgorithm = this.deriveKeyAlgorithm;
    final randomKeyMaxLength = this.randomKeyMaxLength;
    return {
      'DeriveKeyAlgorithm': deriveKeyAlgorithm.value,
      if (randomKeyMaxLength != null)
        'RandomKeyMaxLength': randomKeyMaxLength.value,
    };
  }
}

/// Parameter information for generating a KEK validation response during
/// node-to-node initialization.
///
/// @nodoc
class KekValidationResponse {
  /// The random key send value received from the initiating node to generate a
  /// KEK validation response.
  final String randomKeySend;

  KekValidationResponse({
    required this.randomKeySend,
  });

  Map<String, dynamic> toJson() {
    final randomKeySend = this.randomKeySend;
    return {
      'RandomKeySend': randomKeySend,
    };
  }
}

/// @nodoc
class RandomKeyMaxLength {
  static const bytes_8 = RandomKeyMaxLength._('BYTES_8');
  static const bytes_16 = RandomKeyMaxLength._('BYTES_16');
  static const bytes_24 = RandomKeyMaxLength._('BYTES_24');

  final String value;

  const RandomKeyMaxLength._(this.value);

  static const values = [bytes_8, bytes_16, bytes_24];

  static RandomKeyMaxLength fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RandomKeyMaxLength._(value));

  @override
  bool operator ==(other) =>
      other is RandomKeyMaxLength && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Parameters that are required to perform encryption and decryption
/// operations.
///
/// @nodoc
class EncryptionDecryptionAttributes {
  final AsymmetricEncryptionAttributes? asymmetric;
  final DukptEncryptionAttributes? dukpt;

  /// Parameters for plaintext encryption using EMV keys.
  final EmvEncryptionAttributes? emv;

  /// Parameters that are required to perform encryption and decryption using
  /// symmetric keys.
  final SymmetricEncryptionAttributes? symmetric;

  EncryptionDecryptionAttributes({
    this.asymmetric,
    this.dukpt,
    this.emv,
    this.symmetric,
  });

  Map<String, dynamic> toJson() {
    final asymmetric = this.asymmetric;
    final dukpt = this.dukpt;
    final emv = this.emv;
    final symmetric = this.symmetric;
    return {
      if (asymmetric != null) 'Asymmetric': asymmetric,
      if (dukpt != null) 'Dukpt': dukpt,
      if (emv != null) 'Emv': emv,
      if (symmetric != null) 'Symmetric': symmetric,
    };
  }
}

/// Parameters for plaintext encryption using asymmetric keys.
///
/// @nodoc
class AsymmetricEncryptionAttributes {
  /// The padding to be included with the data.
  final PaddingType? paddingType;

  AsymmetricEncryptionAttributes({
    this.paddingType,
  });

  Map<String, dynamic> toJson() {
    final paddingType = this.paddingType;
    return {
      if (paddingType != null) 'PaddingType': paddingType.value,
    };
  }
}

/// Parameters for plaintext encryption using EMV keys.
///
/// @nodoc
class EmvEncryptionAttributes {
  /// The EMV derivation mode to use for ICC master key derivation as per EMV
  /// version 4.3 book 2.
  final EmvMajorKeyDerivationMode majorKeyDerivationMode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN). Typically 00 is used, if no value is provided
  /// by the terminal.
  final String panSequenceNumber;

  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card and associates the card to a specific account holder.
  final String primaryAccountNumber;

  /// The derivation value used to derive the ICC session key. It is typically the
  /// application transaction counter value padded with zeros or previous ARQC
  /// value padded with zeros as per EMV version 4.3 book 2.
  final String sessionDerivationData;

  /// An input used to provide the intial state. If no value is provided, Amazon
  /// Web Services Payment Cryptography defaults it to zero.
  final String? initializationVector;

  /// The block cipher method to use for encryption.
  final EmvEncryptionMode? mode;

  EmvEncryptionAttributes({
    required this.majorKeyDerivationMode,
    required this.panSequenceNumber,
    required this.primaryAccountNumber,
    required this.sessionDerivationData,
    this.initializationVector,
    this.mode,
  });

  Map<String, dynamic> toJson() {
    final majorKeyDerivationMode = this.majorKeyDerivationMode;
    final panSequenceNumber = this.panSequenceNumber;
    final primaryAccountNumber = this.primaryAccountNumber;
    final sessionDerivationData = this.sessionDerivationData;
    final initializationVector = this.initializationVector;
    final mode = this.mode;
    return {
      'MajorKeyDerivationMode': majorKeyDerivationMode.value,
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
      'SessionDerivationData': sessionDerivationData,
      if (initializationVector != null)
        'InitializationVector': initializationVector,
      if (mode != null) 'Mode': mode.value,
    };
  }
}

/// @nodoc
class EmvMajorKeyDerivationMode {
  static const emvOptionA = EmvMajorKeyDerivationMode._('EMV_OPTION_A');
  static const emvOptionB = EmvMajorKeyDerivationMode._('EMV_OPTION_B');

  final String value;

  const EmvMajorKeyDerivationMode._(this.value);

  static const values = [emvOptionA, emvOptionB];

  static EmvMajorKeyDerivationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EmvMajorKeyDerivationMode._(value));

  @override
  bool operator ==(other) =>
      other is EmvMajorKeyDerivationMode && other.value == value;

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
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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

/// @nodoc
class VerificationFailedException extends _s.GenericAwsException {
  VerificationFailedException({String? type, String? message})
      : super(
            type: type, code: 'VerificationFailedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
  'VerificationFailedException': (type, message) =>
      VerificationFailedException(type: type, message: message),
};
