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
class PaymentCryptographyDataPlane {
  final _s.RestJsonProtocol _protocol;
  PaymentCryptographyDataPlane({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dataplane.payment-cryptography',
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

  /// Decrypts ciphertext data to plaintext using a symmetric (TDES, AES),
  /// asymmetric (RSA), or derived (DUKPT or EMV) encryption key scheme. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/decrypt-data.html">Decrypt
  /// data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// You can use an encryption key generated within Amazon Web Services Payment
  /// Cryptography, or you can import your own encryption key by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  /// For this operation, the key must have <code>KeyModesOfUse</code> set to
  /// <code>Decrypt</code>. In asymmetric decryption, Amazon Web Services
  /// Payment Cryptography decrypts the ciphertext using the private component
  /// of the asymmetric encryption key pair. For data encryption outside of
  /// Amazon Web Services Payment Cryptography, you can export the public
  /// component of the asymmetric key pair by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_GetPublicKeyCertificate.html">GetPublicCertificate</a>.
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  Future<DecryptDataOutput> decryptData({
    required String cipherText,
    required EncryptionDecryptionAttributes decryptionAttributes,
    required String keyIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'CipherText': cipherText,
      'DecryptionAttributes': decryptionAttributes,
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
  /// For this operation, the key must have <code>KeyModesOfUse</code> set to
  /// <code>Encrypt</code>. In asymmetric encryption, plaintext is encrypted
  /// using public component. You can import the public component of an
  /// asymmetric key pair created outside Amazon Web Services Payment
  /// Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [encryptionAttributes] :
  /// The encryption key type and attributes for plaintext encryption.
  ///
  /// Parameter [keyIdentifier] :
  /// The <code>keyARN</code> of the encryption key that Amazon Web Services
  /// Payment Cryptography uses for plaintext encryption.
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
  Future<EncryptDataOutput> encryptData({
    required EncryptionDecryptionAttributes encryptionAttributes,
    required String keyIdentifier,
    required String plainText,
  }) async {
    final $payload = <String, dynamic>{
      'EncryptionAttributes': encryptionAttributes,
      'PlainText': plainText,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/keys/${Uri.encodeComponent(keyIdentifier)}/encrypt',
      exceptionFnMap: _exceptionFns,
    );
    return EncryptDataOutput.fromJson(response);
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// generation, and they key must have <code>KeyModesOfUse</code> set to
  /// <code>Generate</code> and <code>Verify</code>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>VerifyMac</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      16,
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
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [encryptionKeyIdentifier] :
  /// The <code>keyARN</code> of the PEK that Amazon Web Services Payment
  /// Cryptography uses to encrypt the PIN Block.
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
  /// Parameter [primaryAccountNumber] :
  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card that associates the card with a specific account holder.
  ///
  /// Parameter [pinDataLength] :
  /// The length of PIN under generation.
  Future<GeneratePinDataOutput> generatePinData({
    required String encryptionKeyIdentifier,
    required PinGenerationAttributes generationAttributes,
    required String generationKeyIdentifier,
    required PinBlockFormatForPinData pinBlockFormat,
    required String primaryAccountNumber,
    int? pinDataLength,
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
      'PinBlockFormat': pinBlockFormat.toValue(),
      'PrimaryAccountNumber': primaryAccountNumber,
      if (pinDataLength != null) 'PinDataLength': pinDataLength,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/pindata/generate',
      exceptionFnMap: _exceptionFns,
    );
    return GeneratePinDataOutput.fromJson(response);
  }

  /// Re-encrypt ciphertext using DUKPT, Symmetric and Asymmetric Data
  /// Encryption Keys.
  ///
  /// You can either generate an encryption key within Amazon Web Services
  /// Payment Cryptography by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// or import your own encryption key by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>.
  /// The <code>KeyArn</code> for use with this operation must be in a
  /// compatible key state with <code>KeyModesOfUse</code> set to
  /// <code>Encrypt</code>. In asymmetric encryption, ciphertext is encrypted
  /// using public component (imported by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_ImportKey.html">ImportKey</a>)
  /// of the asymmetric key pair created outside of Amazon Web Services Payment
  /// Cryptography.
  ///
  /// For symmetric and DUKPT encryption, Amazon Web Services Payment
  /// Cryptography supports <code>TDES</code> and <code>AES</code> algorithms.
  /// For asymmetric encryption, Amazon Web Services Payment Cryptography
  /// supports <code>RSA</code>. To encrypt using DUKPT, a DUKPT key must
  /// already exist within your account with <code>KeyModesOfUse</code> set to
  /// <code>DeriveKey</code> or a new DUKPT can be generated by calling <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/APIReference/API_CreateKey.html">CreateKey</a>.
  ///
  /// For information about valid keys for this operation, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/keys-validattributes.html">Understanding
  /// key attributes</a> and <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/crypto-ops-validkeys-ops.html">Key
  /// types for specific data operations</a> in the <i>Amazon Web Services
  /// Payment Cryptography User Guide</i>.
  ///
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// Parameter [outgoingEncryptionAttributes] :
  /// The attributes and values for outgoing ciphertext data after encryption by
  /// Amazon Web Services Payment Cryptography.
  ///
  /// Parameter [outgoingKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key of outgoing ciphertext data
  /// after encryption by Amazon Web Services Payment Cryptography.
  Future<ReEncryptDataOutput> reEncryptData({
    required String cipherText,
    required ReEncryptionAttributes incomingEncryptionAttributes,
    required String incomingKeyIdentifier,
    required ReEncryptionAttributes outgoingEncryptionAttributes,
    required String outgoingKeyIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'CipherText': cipherText,
      'IncomingEncryptionAttributes': incomingEncryptionAttributes,
      'OutgoingEncryptionAttributes': outgoingEncryptionAttributes,
      'OutgoingKeyIdentifier': outgoingKeyIdentifier,
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

  /// Translates encrypted PIN block from and to ISO 9564 formats 0,1,3,4. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/payment-cryptography/latest/userguide/translate-pin-data.html">Translate
  /// PIN data</a> in the <i>Amazon Web Services Payment Cryptography User
  /// Guide</i>.
  ///
  /// PIN block translation involves changing the encrytion of PIN block from
  /// one encryption key to another encryption key and changing PIN block format
  /// from one to another without PIN block data leaving Amazon Web Services
  /// Payment Cryptography. The encryption key transformation can be from PEK
  /// (Pin Encryption Key) to BDK (Base Derivation Key) for DUKPT or from BDK
  /// for DUKPT to PEK. Amazon Web Services Payment Cryptography supports
  /// <code>TDES</code> and <code>AES</code> key derivation type for DUKPT
  /// translations.
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [encryptedPinBlock] :
  /// The encrypted PIN block data that Amazon Web Services Payment Cryptography
  /// translates.
  ///
  /// Parameter [incomingKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key under which incoming PIN
  /// block data is encrypted. This key type can be PEK or BDK.
  ///
  /// Parameter [incomingTranslationAttributes] :
  /// The format of the incoming PIN block data for translation within Amazon
  /// Web Services Payment Cryptography.
  ///
  /// Parameter [outgoingKeyIdentifier] :
  /// The <code>keyARN</code> of the encryption key for encrypting outgoing PIN
  /// block data. This key type can be PEK or BDK.
  ///
  /// Parameter [outgoingTranslationAttributes] :
  /// The format of the outgoing PIN block data after translation by Amazon Web
  /// Services Payment Cryptography.
  ///
  /// Parameter [incomingDukptAttributes] :
  /// The attributes and values to use for incoming DUKPT encryption key for PIN
  /// block translation.
  ///
  /// Parameter [outgoingDukptAttributes] :
  /// The attributes and values to use for outgoing DUKPT encryption key after
  /// PIN block translation.
  Future<TranslatePinDataOutput> translatePinData({
    required String encryptedPinBlock,
    required String incomingKeyIdentifier,
    required TranslationIsoFormats incomingTranslationAttributes,
    required String outgoingKeyIdentifier,
    required TranslationIsoFormats outgoingTranslationAttributes,
    DukptDerivationAttributes? incomingDukptAttributes,
    DukptDerivationAttributes? outgoingDukptAttributes,
  }) async {
    final $payload = <String, dynamic>{
      'EncryptedPinBlock': encryptedPinBlock,
      'IncomingKeyIdentifier': incomingKeyIdentifier,
      'IncomingTranslationAttributes': incomingTranslationAttributes,
      'OutgoingKeyIdentifier': outgoingKeyIdentifier,
      'OutgoingTranslationAttributes': outgoingTranslationAttributes,
      if (incomingDukptAttributes != null)
        'IncomingDukptAttributes': incomingDukptAttributes,
      if (outgoingDukptAttributes != null)
        'OutgoingDukptAttributes': outgoingDukptAttributes,
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'MajorKeyDerivationMode': majorKeyDerivationMode.toValue(),
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GenerateMac</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      16,
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
  /// <b>Cross-account use</b>: This operation can't be used across different
  /// Amazon Web Services accounts.
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
  /// May throw [ValidationException].
  /// May throw [VerificationFailedException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// Parameter [primaryAccountNumber] :
  /// The Primary Account Number (PAN), a unique identifier for a payment credit
  /// or debit card that associates the card with a specific account holder.
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
  Future<VerifyPinDataOutput> verifyPinData({
    required String encryptedPinBlock,
    required String encryptionKeyIdentifier,
    required PinBlockFormatForPinData pinBlockFormat,
    required String primaryAccountNumber,
    required PinVerificationAttributes verificationAttributes,
    required String verificationKeyIdentifier,
    DukptAttributes? dukptAttributes,
    int? pinDataLength,
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
      'PinBlockFormat': pinBlockFormat.toValue(),
      'PrimaryAccountNumber': primaryAccountNumber,
      'VerificationAttributes': verificationAttributes,
      'VerificationKeyIdentifier': verificationKeyIdentifier,
      if (dukptAttributes != null) 'DukptAttributes': dukptAttributes,
      if (pinDataLength != null) 'PinDataLength': pinDataLength,
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

/// Card data parameters that are required to generate a Card Security Code
/// (CSC2) for an AMEX payment card.
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

/// Parameters for plaintext encryption using asymmetric keys.
class AsymmetricEncryptionAttributes {
  /// The padding to be included with the data.
  final PaddingType? paddingType;

  AsymmetricEncryptionAttributes({
    this.paddingType,
  });

  Map<String, dynamic> toJson() {
    final paddingType = this.paddingType;
    return {
      if (paddingType != null) 'PaddingType': paddingType.toValue(),
    };
  }
}

/// Card data parameters that are required to generate Card Verification Values
/// (CVV/CVV2), Dynamic Card Verification Values (dCVV/dCVV2), or Card Security
/// Codes (CSC).
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

/// Card data parameters that are required to generate a cardholder verification
/// value for the payment card.
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

/// Card data parameters that are requried to verify Card Verification Values
/// (CVV/CVV2), Dynamic Card Verification Values (dCVV/dCVV2), or Card Security
/// Codes (CSC).
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

/// Card data parameters that are required to verify CVV (Card Verification
/// Value) for the payment card.
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

/// Parameters that are required for Authorization Response Cryptogram (ARPC)
/// generation after Authorization Request Cryptogram (ARQC) verification is
/// successful.
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
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
      plainText: json['PlainText'] as String,
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

/// Parameters that are required to generate or verify dCVC (Dynamic Card
/// Verification Code).
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

/// Parameters that are used for Derived Unique Key Per Transaction (DUKPT)
/// derivation algorithm.
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
      'DukptDerivationType': dukptDerivationType.toValue(),
      'KeySerialNumber': keySerialNumber,
    };
  }
}

/// Parameters required for encryption or decryption of data using DUKPT.
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
        'DukptKeyDerivationType': dukptKeyDerivationType.toValue(),
      if (dukptKeyVariant != null) 'DukptKeyVariant': dukptKeyVariant.toValue(),
    };
  }
}

enum DukptDerivationType {
  tdes_2key,
  tdes_3key,
  aes_128,
  aes_192,
  aes_256,
}

extension DukptDerivationTypeValueExtension on DukptDerivationType {
  String toValue() {
    switch (this) {
      case DukptDerivationType.tdes_2key:
        return 'TDES_2KEY';
      case DukptDerivationType.tdes_3key:
        return 'TDES_3KEY';
      case DukptDerivationType.aes_128:
        return 'AES_128';
      case DukptDerivationType.aes_192:
        return 'AES_192';
      case DukptDerivationType.aes_256:
        return 'AES_256';
    }
  }
}

extension DukptDerivationTypeFromString on String {
  DukptDerivationType toDukptDerivationType() {
    switch (this) {
      case 'TDES_2KEY':
        return DukptDerivationType.tdes_2key;
      case 'TDES_3KEY':
        return DukptDerivationType.tdes_3key;
      case 'AES_128':
        return DukptDerivationType.aes_128;
      case 'AES_192':
        return DukptDerivationType.aes_192;
      case 'AES_256':
        return DukptDerivationType.aes_256;
    }
    throw Exception('$this is not known in enum DukptDerivationType');
  }
}

/// Parameters that are required to encrypt plaintext data using DUKPT.
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
        'DukptKeyDerivationType': dukptKeyDerivationType.toValue(),
      if (dukptKeyVariant != null) 'DukptKeyVariant': dukptKeyVariant.toValue(),
      if (initializationVector != null)
        'InitializationVector': initializationVector,
      if (mode != null) 'Mode': mode.toValue(),
    };
  }
}

enum DukptEncryptionMode {
  ecb,
  cbc,
}

extension DukptEncryptionModeValueExtension on DukptEncryptionMode {
  String toValue() {
    switch (this) {
      case DukptEncryptionMode.ecb:
        return 'ECB';
      case DukptEncryptionMode.cbc:
        return 'CBC';
    }
  }
}

extension DukptEncryptionModeFromString on String {
  DukptEncryptionMode toDukptEncryptionMode() {
    switch (this) {
      case 'ECB':
        return DukptEncryptionMode.ecb;
      case 'CBC':
        return DukptEncryptionMode.cbc;
    }
    throw Exception('$this is not known in enum DukptEncryptionMode');
  }
}

enum DukptKeyVariant {
  bidirectional,
  request,
  response,
}

extension DukptKeyVariantValueExtension on DukptKeyVariant {
  String toValue() {
    switch (this) {
      case DukptKeyVariant.bidirectional:
        return 'BIDIRECTIONAL';
      case DukptKeyVariant.request:
        return 'REQUEST';
      case DukptKeyVariant.response:
        return 'RESPONSE';
    }
  }
}

extension DukptKeyVariantFromString on String {
  DukptKeyVariant toDukptKeyVariant() {
    switch (this) {
      case 'BIDIRECTIONAL':
        return DukptKeyVariant.bidirectional;
      case 'REQUEST':
        return DukptKeyVariant.request;
      case 'RESPONSE':
        return DukptKeyVariant.response;
    }
    throw Exception('$this is not known in enum DukptKeyVariant');
  }
}

/// Parameters that are required to generate or verify Dynamic Card Verification
/// Value (dCVV).
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

/// Parameters for plaintext encryption using EMV keys.
class EmvEncryptionAttributes {
  /// The EMV derivation mode to use for ICC master key derivation as per EMV
  /// version 4.3 book 2.
  final EmvMajorKeyDerivationMode majorKeyDerivationMode;

  /// A number that identifies and differentiates payment cards with the same
  /// Primary Account Number (PAN).
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
      'MajorKeyDerivationMode': majorKeyDerivationMode.toValue(),
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
      'SessionDerivationData': sessionDerivationData,
      if (initializationVector != null)
        'InitializationVector': initializationVector,
      if (mode != null) 'Mode': mode.toValue(),
    };
  }
}

enum EmvEncryptionMode {
  ecb,
  cbc,
}

extension EmvEncryptionModeValueExtension on EmvEncryptionMode {
  String toValue() {
    switch (this) {
      case EmvEncryptionMode.ecb:
        return 'ECB';
      case EmvEncryptionMode.cbc:
        return 'CBC';
    }
  }
}

extension EmvEncryptionModeFromString on String {
  EmvEncryptionMode toEmvEncryptionMode() {
    switch (this) {
      case 'ECB':
        return EmvEncryptionMode.ecb;
      case 'CBC':
        return EmvEncryptionMode.cbc;
    }
    throw Exception('$this is not known in enum EmvEncryptionMode');
  }
}

enum EmvMajorKeyDerivationMode {
  emvOptionA,
  emvOptionB,
}

extension EmvMajorKeyDerivationModeValueExtension on EmvMajorKeyDerivationMode {
  String toValue() {
    switch (this) {
      case EmvMajorKeyDerivationMode.emvOptionA:
        return 'EMV_OPTION_A';
      case EmvMajorKeyDerivationMode.emvOptionB:
        return 'EMV_OPTION_B';
    }
  }
}

extension EmvMajorKeyDerivationModeFromString on String {
  EmvMajorKeyDerivationMode toEmvMajorKeyDerivationMode() {
    switch (this) {
      case 'EMV_OPTION_A':
        return EmvMajorKeyDerivationMode.emvOptionA;
      case 'EMV_OPTION_B':
        return EmvMajorKeyDerivationMode.emvOptionB;
    }
    throw Exception('$this is not known in enum EmvMajorKeyDerivationMode');
  }
}

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
      cipherText: json['CipherText'] as String,
      keyArn: json['KeyArn'] as String,
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

/// Parameters that are required to perform encryption and decryption
/// operations.
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

enum EncryptionMode {
  ecb,
  cbc,
  cfb,
  cfb1,
  cfb8,
  cfb64,
  cfb128,
  ofb,
}

extension EncryptionModeValueExtension on EncryptionMode {
  String toValue() {
    switch (this) {
      case EncryptionMode.ecb:
        return 'ECB';
      case EncryptionMode.cbc:
        return 'CBC';
      case EncryptionMode.cfb:
        return 'CFB';
      case EncryptionMode.cfb1:
        return 'CFB1';
      case EncryptionMode.cfb8:
        return 'CFB8';
      case EncryptionMode.cfb64:
        return 'CFB64';
      case EncryptionMode.cfb128:
        return 'CFB128';
      case EncryptionMode.ofb:
        return 'OFB';
    }
  }
}

extension EncryptionModeFromString on String {
  EncryptionMode toEncryptionMode() {
    switch (this) {
      case 'ECB':
        return EncryptionMode.ecb;
      case 'CBC':
        return EncryptionMode.cbc;
      case 'CFB':
        return EncryptionMode.cfb;
      case 'CFB1':
        return EncryptionMode.cfb1;
      case 'CFB8':
        return EncryptionMode.cfb8;
      case 'CFB64':
        return EncryptionMode.cfb64;
      case 'CFB128':
        return EncryptionMode.cfb128;
      case 'OFB':
        return EncryptionMode.ofb;
    }
    throw Exception('$this is not known in enum EncryptionMode');
  }
}

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
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
      validationData: json['ValidationData'] as String,
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
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
      mac: json['Mac'] as String,
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

class GeneratePinDataOutput {
  /// The PIN block encrypted under PEK from Amazon Web Services Payment
  /// Cryptography. The encrypted PIN block is a composite of PAN (Primary Account
  /// Number) and PIN (Personal Identification Number), generated in accordance
  /// with ISO 9564 standard.
  final String encryptedPinBlock;

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
      encryptedPinBlock: json['EncryptedPinBlock'] as String,
      encryptionKeyArn: json['EncryptionKeyArn'] as String,
      encryptionKeyCheckValue: json['EncryptionKeyCheckValue'] as String,
      generationKeyArn: json['GenerationKeyArn'] as String,
      generationKeyCheckValue: json['GenerationKeyCheckValue'] as String,
      pinData: PinData.fromJson(json['PinData'] as Map<String, dynamic>),
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

/// Parameters that are required to generate or verify Ibm3624 natural PIN.
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

/// Parameters that are required to generate or verify Ibm3624 PIN from offset
/// PIN.
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

/// Pparameters that are required to generate or verify Ibm3624 PIN offset PIN.
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

/// Parameters that are required to generate or verify Ibm3624 PIN verification
/// PIN.
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

/// Parameters that are required to generate or verify Ibm3624 random PIN.
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

enum MacAlgorithm {
  iso9797Algorithm1,
  iso9797Algorithm3,
  cmac,
  hmacSha224,
  hmacSha256,
  hmacSha384,
  hmacSha512,
}

extension MacAlgorithmValueExtension on MacAlgorithm {
  String toValue() {
    switch (this) {
      case MacAlgorithm.iso9797Algorithm1:
        return 'ISO9797_ALGORITHM1';
      case MacAlgorithm.iso9797Algorithm3:
        return 'ISO9797_ALGORITHM3';
      case MacAlgorithm.cmac:
        return 'CMAC';
      case MacAlgorithm.hmacSha224:
        return 'HMAC_SHA224';
      case MacAlgorithm.hmacSha256:
        return 'HMAC_SHA256';
      case MacAlgorithm.hmacSha384:
        return 'HMAC_SHA384';
      case MacAlgorithm.hmacSha512:
        return 'HMAC_SHA512';
    }
  }
}

extension MacAlgorithmFromString on String {
  MacAlgorithm toMacAlgorithm() {
    switch (this) {
      case 'ISO9797_ALGORITHM1':
        return MacAlgorithm.iso9797Algorithm1;
      case 'ISO9797_ALGORITHM3':
        return MacAlgorithm.iso9797Algorithm3;
      case 'CMAC':
        return MacAlgorithm.cmac;
      case 'HMAC_SHA224':
        return MacAlgorithm.hmacSha224;
      case 'HMAC_SHA256':
        return MacAlgorithm.hmacSha256;
      case 'HMAC_SHA384':
        return MacAlgorithm.hmacSha384;
      case 'HMAC_SHA512':
        return MacAlgorithm.hmacSha512;
    }
    throw Exception('$this is not known in enum MacAlgorithm');
  }
}

/// Parameters required for DUKPT MAC generation and verification.
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
      'DukptKeyVariant': dukptKeyVariant.toValue(),
      'KeySerialNumber': keySerialNumber,
      if (dukptDerivationType != null)
        'DukptDerivationType': dukptDerivationType.toValue(),
    };
  }
}

/// Parameters that are required for EMV MAC generation and verification.
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
      'MajorKeyDerivationMode': majorKeyDerivationMode.toValue(),
      'PanSequenceNumber': panSequenceNumber,
      'PrimaryAccountNumber': primaryAccountNumber,
      'SessionKeyDerivationMode': sessionKeyDerivationMode.toValue(),
      'SessionKeyDerivationValue': sessionKeyDerivationValue,
    };
  }
}

/// Parameters that are required for DUKPT, HMAC, or EMV MAC generation or
/// verification.
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
      if (algorithm != null) 'Algorithm': algorithm.toValue(),
      if (dukptCmac != null) 'DukptCmac': dukptCmac,
      if (dukptIso9797Algorithm1 != null)
        'DukptIso9797Algorithm1': dukptIso9797Algorithm1,
      if (dukptIso9797Algorithm3 != null)
        'DukptIso9797Algorithm3': dukptIso9797Algorithm3,
      if (emvMac != null) 'EmvMac': emvMac,
    };
  }
}

enum MajorKeyDerivationMode {
  emvOptionA,
  emvOptionB,
}

extension MajorKeyDerivationModeValueExtension on MajorKeyDerivationMode {
  String toValue() {
    switch (this) {
      case MajorKeyDerivationMode.emvOptionA:
        return 'EMV_OPTION_A';
      case MajorKeyDerivationMode.emvOptionB:
        return 'EMV_OPTION_B';
    }
  }
}

extension MajorKeyDerivationModeFromString on String {
  MajorKeyDerivationMode toMajorKeyDerivationMode() {
    switch (this) {
      case 'EMV_OPTION_A':
        return MajorKeyDerivationMode.emvOptionA;
      case 'EMV_OPTION_B':
        return MajorKeyDerivationMode.emvOptionB;
    }
    throw Exception('$this is not known in enum MajorKeyDerivationMode');
  }
}

enum PaddingType {
  pkcs1,
  oaepSha1,
  oaepSha256,
  oaepSha512,
}

extension PaddingTypeValueExtension on PaddingType {
  String toValue() {
    switch (this) {
      case PaddingType.pkcs1:
        return 'PKCS1';
      case PaddingType.oaepSha1:
        return 'OAEP_SHA1';
      case PaddingType.oaepSha256:
        return 'OAEP_SHA256';
      case PaddingType.oaepSha512:
        return 'OAEP_SHA512';
    }
  }
}

extension PaddingTypeFromString on String {
  PaddingType toPaddingType() {
    switch (this) {
      case 'PKCS1':
        return PaddingType.pkcs1;
      case 'OAEP_SHA1':
        return PaddingType.oaepSha1;
      case 'OAEP_SHA256':
        return PaddingType.oaepSha256;
      case 'OAEP_SHA512':
        return PaddingType.oaepSha512;
    }
    throw Exception('$this is not known in enum PaddingType');
  }
}

enum PinBlockFormatForPinData {
  isoFormat_0,
  isoFormat_3,
}

extension PinBlockFormatForPinDataValueExtension on PinBlockFormatForPinData {
  String toValue() {
    switch (this) {
      case PinBlockFormatForPinData.isoFormat_0:
        return 'ISO_FORMAT_0';
      case PinBlockFormatForPinData.isoFormat_3:
        return 'ISO_FORMAT_3';
    }
  }
}

extension PinBlockFormatForPinDataFromString on String {
  PinBlockFormatForPinData toPinBlockFormatForPinData() {
    switch (this) {
      case 'ISO_FORMAT_0':
        return PinBlockFormatForPinData.isoFormat_0;
      case 'ISO_FORMAT_3':
        return PinBlockFormatForPinData.isoFormat_3;
    }
    throw Exception('$this is not known in enum PinBlockFormatForPinData');
  }
}

/// Parameters that are required to generate, translate, or verify PIN data.
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

/// Parameters that are required for PIN data verification.
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
      cipherText: json['CipherText'] as String,
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
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

/// Parameters that are required to perform reencryption operation.
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

/// Parameters to derive session key for an Amex payment card.
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

/// Parameters to derive a session key for Authorization Response Cryptogram
/// (ARQC) verification.
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

enum SessionKeyDerivationMode {
  emvCommonSessionKey,
  emv2000,
  amex,
  mastercardSessionKey,
  visa,
}

extension SessionKeyDerivationModeValueExtension on SessionKeyDerivationMode {
  String toValue() {
    switch (this) {
      case SessionKeyDerivationMode.emvCommonSessionKey:
        return 'EMV_COMMON_SESSION_KEY';
      case SessionKeyDerivationMode.emv2000:
        return 'EMV2000';
      case SessionKeyDerivationMode.amex:
        return 'AMEX';
      case SessionKeyDerivationMode.mastercardSessionKey:
        return 'MASTERCARD_SESSION_KEY';
      case SessionKeyDerivationMode.visa:
        return 'VISA';
    }
  }
}

extension SessionKeyDerivationModeFromString on String {
  SessionKeyDerivationMode toSessionKeyDerivationMode() {
    switch (this) {
      case 'EMV_COMMON_SESSION_KEY':
        return SessionKeyDerivationMode.emvCommonSessionKey;
      case 'EMV2000':
        return SessionKeyDerivationMode.emv2000;
      case 'AMEX':
        return SessionKeyDerivationMode.amex;
      case 'MASTERCARD_SESSION_KEY':
        return SessionKeyDerivationMode.mastercardSessionKey;
      case 'VISA':
        return SessionKeyDerivationMode.visa;
    }
    throw Exception('$this is not known in enum SessionKeyDerivationMode');
  }
}

/// Parameters to derive session key value using a MAC EMV algorithm.
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

/// Parameters to derive session key for an Emv2000 payment card for ARQC
/// verification.
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

/// Parameters to derive session key for an Emv common payment card for ARQC
/// verification.
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

/// Parameters to derive session key for Visa payment card for ARQC
/// verification.
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

/// Parameters requried to encrypt plaintext data using symmetric keys.
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
      'Mode': mode.toValue(),
      if (initializationVector != null)
        'InitializationVector': initializationVector,
      if (paddingType != null) 'PaddingType': paddingType.toValue(),
    };
  }
}

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
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
      pinBlock: json['PinBlock'] as String,
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

/// Parameters that are required for translation between ISO9564 PIN block
/// formats 0,1,3,4.
class TranslationIsoFormats {
  /// Parameters that are required for ISO9564 PIN format 0 tranlation.
  final TranslationPinDataIsoFormat034? isoFormat0;

  /// Parameters that are required for ISO9564 PIN format 1 tranlation.
  final TranslationPinDataIsoFormat1? isoFormat1;

  /// Parameters that are required for ISO9564 PIN format 3 tranlation.
  final TranslationPinDataIsoFormat034? isoFormat3;

  /// Parameters that are required for ISO9564 PIN format 4 tranlation.
  final TranslationPinDataIsoFormat034? isoFormat4;

  TranslationIsoFormats({
    this.isoFormat0,
    this.isoFormat1,
    this.isoFormat3,
    this.isoFormat4,
  });

  Map<String, dynamic> toJson() {
    final isoFormat0 = this.isoFormat0;
    final isoFormat1 = this.isoFormat1;
    final isoFormat3 = this.isoFormat3;
    final isoFormat4 = this.isoFormat4;
    return {
      if (isoFormat0 != null) 'IsoFormat0': isoFormat0,
      if (isoFormat1 != null) 'IsoFormat1': isoFormat1,
      if (isoFormat3 != null) 'IsoFormat3': isoFormat3,
      if (isoFormat4 != null) 'IsoFormat4': isoFormat4,
    };
  }
}

/// Parameters that are required for tranlation between ISO9564 PIN format 0,3,4
/// tranlation.
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

/// Parameters that are required for ISO9564 PIN format 1 tranlation.
class TranslationPinDataIsoFormat1 {
  TranslationPinDataIsoFormat1();

  Map<String, dynamic> toJson() {
    return {};
  }
}

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
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
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
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
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
      keyArn: json['KeyArn'] as String,
      keyCheckValue: json['KeyCheckValue'] as String,
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
      encryptionKeyArn: json['EncryptionKeyArn'] as String,
      encryptionKeyCheckValue: json['EncryptionKeyCheckValue'] as String,
      verificationKeyArn: json['VerificationKeyArn'] as String,
      verificationKeyCheckValue: json['VerificationKeyCheckValue'] as String,
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

/// Parameters that are required to generate or verify Visa PIN.
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

/// Parameters that are required to generate or verify Visa PIN.
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

/// Parameters that are required to generate or verify Visa PVV (PIN
/// Verification Value).
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

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
