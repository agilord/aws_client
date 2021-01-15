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

part '2014-11-01.g.dart';

/// AWS Key Management Service (AWS KMS) is an encryption and key management web
/// service. This guide describes the AWS KMS operations that you can call
/// programmatically. For general information about AWS KMS, see the <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/"> <i>AWS Key
/// Management Service Developer Guide</i> </a>.
/// <note>
/// AWS provides SDKs that consist of libraries and sample code for various
/// programming languages and platforms (Java, Ruby, .Net, macOS, Android,
/// etc.). The SDKs provide a convenient way to create programmatic access to
/// AWS KMS and other AWS services. For example, the SDKs take care of tasks
/// such as signing requests (see below), managing errors, and retrying requests
/// automatically. For more information about the AWS SDKs, including how to
/// download and install them, see <a href="http://aws.amazon.com/tools/">Tools
/// for Amazon Web Services</a>.
/// </note>
/// We recommend that you use the AWS SDKs to make programmatic API calls to AWS
/// KMS.
class Kms {
  final _s.JsonProtocol _protocol;
  Kms({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kms',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels the deletion of a customer master key (CMK). When this operation
  /// succeeds, the key state of the CMK is <code>Disabled</code>. To enable the
  /// CMK, use <a>EnableKey</a>.
  ///
  /// For more information about scheduling and canceling deletion of a CMK, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting
  /// Customer Master Keys</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CancelKeyDeletion</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>ScheduleKeyDeletion</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// The unique identifier for the customer master key (CMK) for which to
  /// cancel deletion.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<CancelKeyDeletionResponse> cancelKeyDeletion({
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.CancelKeyDeletion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
      },
    );

    return CancelKeyDeletionResponse.fromJson(jsonResponse.body);
  }

  /// Connects or reconnects a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> to its associated AWS CloudHSM cluster.
  ///
  /// The custom key store must be connected before you can create customer
  /// master keys (CMKs) in the key store or use the CMKs it contains. You can
  /// disconnect and reconnect a custom key store at any time.
  ///
  /// To connect a custom key store, its associated AWS CloudHSM cluster must
  /// have at least one active HSM. To get the number of active HSMs in a
  /// cluster, use the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters</a>
  /// operation. To add HSMs to the cluster, use the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html">CreateHsm</a>
  /// operation. Also, the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
  /// <code>kmsuser</code> crypto user</a> (CU) must not be logged into the
  /// cluster. This prevents AWS KMS from using this account to log in.
  ///
  /// The connection process can take an extended amount of time to complete; up
  /// to 20 minutes. This operation starts the connection process, but it does
  /// not wait for it to complete. When it succeeds, this operation quickly
  /// returns an HTTP 200 response and a JSON object with no properties.
  /// However, this response does not indicate that the custom key store is
  /// connected. To get the connection state of the custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  ///
  /// During the connection process, AWS KMS finds the AWS CloudHSM cluster that
  /// is associated with the custom key store, creates the connection
  /// infrastructure, connects to the cluster, logs into the AWS CloudHSM client
  /// as the <code>kmsuser</code> CU, and rotates its password.
  ///
  /// The <code>ConnectCustomKeyStore</code> operation might fail for various
  /// reasons. To find the reason, use the <a>DescribeCustomKeyStores</a>
  /// operation and see the <code>ConnectionErrorCode</code> in the response.
  /// For help interpreting the <code>ConnectionErrorCode</code>, see
  /// <a>CustomKeyStoresListEntry</a>.
  ///
  /// To fix the failure, use the <a>DisconnectCustomKeyStore</a> operation to
  /// disconnect the custom key store, correct the error, use the
  /// <a>UpdateCustomKeyStore</a> operation if necessary, and then use
  /// <code>ConnectCustomKeyStore</code> again.
  ///
  /// If you are having trouble connecting or disconnecting a custom key store,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting
  /// a Custom Key Store</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ConnectCustomKeyStore</a>
  /// (IAM policy)
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DeleteCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DescribeCustomKeyStores</a>
  /// </li>
  /// <li>
  /// <a>DisconnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>UpdateCustomKeyStore</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [CloudHsmClusterNotActiveException].
  /// May throw [CustomKeyStoreInvalidStateException].
  /// May throw [CustomKeyStoreNotFoundException].
  /// May throw [KMSInternalException].
  /// May throw [CloudHsmClusterInvalidConfigurationException].
  ///
  /// Parameter [customKeyStoreId] :
  /// Enter the key store ID of the custom key store that you want to connect.
  /// To find the ID of a custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  Future<void> connectCustomKeyStore({
    @_s.required String customKeyStoreId,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    _s.validateStringLength(
      'customKeyStoreId',
      customKeyStoreId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ConnectCustomKeyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomKeyStoreId': customKeyStoreId,
      },
    );

    return ConnectCustomKeyStoreResponse.fromJson(jsonResponse.body);
  }

  /// Creates a friendly name for a customer master key (CMK). You can use an
  /// alias to identify a CMK in the AWS KMS console, in the <a>DescribeKey</a>
  /// operation and in <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>, such as <a>Encrypt</a> and <a>GenerateDataKey</a>.
  ///
  /// You can also change the CMK that's associated with the alias
  /// (<a>UpdateAlias</a>) or delete the alias (<a>DeleteAlias</a>) at any time.
  /// These operations don't affect the underlying CMK.
  ///
  /// You can associate the alias with any customer managed CMK in the same AWS
  /// Region. Each alias is associated with only on CMK at a time, but a CMK can
  /// have multiple aliases. A valid CMK is required. You can't create an alias
  /// without a CMK.
  ///
  /// The alias must be unique in the account and Region, but you can have
  /// aliases with the same name in different Regions. For detailed information
  /// about aliases, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html">Using
  /// aliases</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// This operation does not return a response. To get the alias that you
  /// created, use the <a>ListAliases</a> operation.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on an
  /// alias in a different AWS account.
  ///
  /// <b>Required permissions</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateAlias</a>
  /// on the alias (IAM policy).
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateAlias</a>
  /// on the CMK (key policy).
  /// </li>
  /// </ul>
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [DependencyTimeoutException].
  /// May throw [AlreadyExistsException].
  /// May throw [NotFoundException].
  /// May throw [InvalidAliasNameException].
  /// May throw [KMSInternalException].
  /// May throw [LimitExceededException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [aliasName] :
  /// Specifies the alias name. This value must begin with <code>alias/</code>
  /// followed by a name, such as <code>alias/ExampleAlias</code>.
  ///
  /// The <code>AliasName</code> value must be string of 1-256 characters. It
  /// can contain only alphanumeric characters, forward slashes (/), underscores
  /// (_), and dashes (-). The alias name cannot begin with
  /// <code>alias/aws/</code>. The <code>alias/aws/</code> prefix is reserved
  /// for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">AWS
  /// managed CMKs</a>.
  ///
  /// Parameter [targetKeyId] :
  /// Associates the alias with the specified <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed CMK</a>. The CMK must be in the same AWS Region.
  ///
  /// A valid CMK ID is required. If you supply a null or empty string value,
  /// this operation returns an error.
  ///
  /// For help finding the key ID and ARN, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn">Finding
  /// the Key ID and ARN</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> createAlias({
    @_s.required String aliasName,
    @_s.required String targetKeyId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''^[a-zA-Z0-9:/_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetKeyId, 'targetKeyId');
    _s.validateStringLength(
      'targetKeyId',
      targetKeyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.CreateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasName': aliasName,
        'TargetKeyId': targetKeyId,
      },
    );
  }

  /// Creates a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> that is associated with an <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/clusters.html">AWS
  /// CloudHSM cluster</a> that you own and manage.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in AWS KMS, which combines the convenience
  /// and extensive integration of AWS KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// Before you create the custom key store, you must assemble the required
  /// elements, including an AWS CloudHSM cluster that fulfills the requirements
  /// for a custom key store. For details about the required elements, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore">Assemble
  /// the Prerequisites</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// When the operation completes successfully, it returns the ID of the new
  /// custom key store. Before you can use your new custom key store, you need
  /// to use the <a>ConnectCustomKeyStore</a> operation to connect the new key
  /// store to its AWS CloudHSM cluster. Even if you are not going to use your
  /// custom key store immediately, you might want to connect it to verify that
  /// all settings are correct and then disconnect it until you are ready to use
  /// it.
  ///
  /// For help with failures, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting
  /// a Custom Key Store</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateCustomKeyStore</a>
  /// (IAM policy).
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ConnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DeleteCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DescribeCustomKeyStores</a>
  /// </li>
  /// <li>
  /// <a>DisconnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>UpdateCustomKeyStore</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [CloudHsmClusterInUseException].
  /// May throw [CustomKeyStoreNameInUseException].
  /// May throw [CloudHsmClusterNotFoundException].
  /// May throw [KMSInternalException].
  /// May throw [CloudHsmClusterNotActiveException].
  /// May throw [IncorrectTrustAnchorException].
  /// May throw [CloudHsmClusterInvalidConfigurationException].
  ///
  /// Parameter [cloudHsmClusterId] :
  /// Identifies the AWS CloudHSM cluster for the custom key store. Enter the
  /// cluster ID of any active AWS CloudHSM cluster that is not already
  /// associated with a custom key store. To find the cluster ID, use the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters</a>
  /// operation.
  ///
  /// Parameter [customKeyStoreName] :
  /// Specifies a friendly name for the custom key store. The name must be
  /// unique in your AWS account.
  ///
  /// Parameter [keyStorePassword] :
  /// Enter the password of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
  /// <code>kmsuser</code> crypto user (CU) account</a> in the specified AWS
  /// CloudHSM cluster. AWS KMS logs into the cluster as this user to manage key
  /// material on your behalf.
  ///
  /// The password must be a string of 7 to 32 characters. Its value is case
  /// sensitive.
  ///
  /// This parameter tells AWS KMS the <code>kmsuser</code> account password; it
  /// does not change the password in the AWS CloudHSM cluster.
  ///
  /// Parameter [trustAnchorCertificate] :
  /// Enter the content of the trust anchor certificate for the cluster. This is
  /// the content of the <code>customerCA.crt</code> file that you created when
  /// you <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html">initialized
  /// the cluster</a>.
  Future<CreateCustomKeyStoreResponse> createCustomKeyStore({
    @_s.required String cloudHsmClusterId,
    @_s.required String customKeyStoreName,
    @_s.required String keyStorePassword,
    @_s.required String trustAnchorCertificate,
  }) async {
    ArgumentError.checkNotNull(cloudHsmClusterId, 'cloudHsmClusterId');
    _s.validateStringLength(
      'cloudHsmClusterId',
      cloudHsmClusterId,
      19,
      24,
      isRequired: true,
    );
    ArgumentError.checkNotNull(customKeyStoreName, 'customKeyStoreName');
    _s.validateStringLength(
      'customKeyStoreName',
      customKeyStoreName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyStorePassword, 'keyStorePassword');
    _s.validateStringLength(
      'keyStorePassword',
      keyStorePassword,
      7,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        trustAnchorCertificate, 'trustAnchorCertificate');
    _s.validateStringLength(
      'trustAnchorCertificate',
      trustAnchorCertificate,
      1,
      5000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.CreateCustomKeyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CloudHsmClusterId': cloudHsmClusterId,
        'CustomKeyStoreName': customKeyStoreName,
        'KeyStorePassword': keyStorePassword,
        'TrustAnchorCertificate': trustAnchorCertificate,
      },
    );

    return CreateCustomKeyStoreResponse.fromJson(jsonResponse.body);
  }

  /// Adds a grant to a customer master key (CMK). The grant allows the grantee
  /// principal to use the CMK when the conditions specified in the grant are
  /// met. When setting permissions, grants are an alternative to key policies.
  ///
  /// To create a grant that allows a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> only when the request includes a particular <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
  /// context</a>, use the <code>Constraints</code> parameter. For details, see
  /// <a>GrantConstraints</a>.
  ///
  /// You can create grants on symmetric and asymmetric CMKs. However, if the
  /// grant allows an operation that the CMK does not support,
  /// <code>CreateGrant</code> fails with a <code>ValidationException</code>.
  ///
  /// <ul>
  /// <li>
  /// Grants for symmetric CMKs cannot allow operations that are not supported
  /// for symmetric CMKs, including <a>Sign</a>, <a>Verify</a>, and
  /// <a>GetPublicKey</a>. (There are limited exceptions to this rule for legacy
  /// operations, but you should not create a grant for an operation that AWS
  /// KMS does not support.)
  /// </li>
  /// <li>
  /// Grants for asymmetric CMKs cannot allow operations that are not supported
  /// for asymmetric CMKs, including operations that <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GenerateDataKey">generate
  /// data keys</a> or <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GenerateDataKeyPair">data
  /// key pairs</a>, or operations related to <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
  /// key rotation</a>, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported
  /// key material</a>, or CMKs in <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key stores</a>.
  /// </li>
  /// <li>
  /// Grants for asymmetric CMKs with a <code>KeyUsage</code> of
  /// <code>ENCRYPT_DECRYPT</code> cannot allow the <a>Sign</a> or <a>Verify</a>
  /// operations. Grants for asymmetric CMKs with a <code>KeyUsage</code> of
  /// <code>SIGN_VERIFY</code> cannot allow the <a>Encrypt</a> or <a>Decrypt</a>
  /// operations.
  /// </li>
  /// <li>
  /// Grants for asymmetric CMKs cannot include an encryption context grant
  /// constraint. An encryption context is not supported on asymmetric CMKs.
  /// </li>
  /// </ul>
  /// For information about symmetric and asymmetric CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric CMKs</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>. For more information about grants, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Grants</a>
  /// in the <i> <i>AWS Key Management Service Developer Guide</i> </i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation on a CMK in a
  /// different AWS account, specify the key ARN in the value of the
  /// <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateGrant</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListGrants</a>
  /// </li>
  /// <li>
  /// <a>ListRetirableGrants</a>
  /// </li>
  /// <li>
  /// <a>RetireGrant</a>
  /// </li>
  /// <li>
  /// <a>RevokeGrant</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidArnException].
  /// May throw [KMSInternalException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [LimitExceededException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [granteePrincipal] :
  /// The principal that is given permission to perform the operations that the
  /// grant permits.
  ///
  /// To specify the principal, use the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include
  /// AWS accounts (root), IAM users, IAM roles, federated users, and assumed
  /// role users. For examples of the ARN syntax to use for specifying a
  /// principal, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS
  /// Identity and Access Management (IAM)</a> in the Example ARNs section of
  /// the <i>AWS General Reference</i>.
  ///
  /// Parameter [keyId] :
  /// The unique identifier for the customer master key (CMK) that the grant
  /// applies to.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [operations] :
  /// A list of operations that the grant permits.
  ///
  /// Parameter [constraints] :
  /// Allows a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> only when the encryption context matches or includes the
  /// encryption context specified in this structure. For more information about
  /// encryption context, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i> <i>AWS Key Management Service Developer Guide</i>
  /// </i>.
  ///
  /// Grant constraints are not applied to operations that do not support an
  /// encryption context, such as cryptographic operations with asymmetric CMKs
  /// and management operations, such as <a>DescribeKey</a> or
  /// <a>RetireGrant</a>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [name] :
  /// A friendly name for the grant. Use this value to prevent the unintended
  /// creation of duplicate grants when retrying this request.
  ///
  /// When this value is absent, all <code>CreateGrant</code> requests result in
  /// a new grant with a unique <code>GrantId</code> even if all the supplied
  /// parameters are identical. This can result in unintended duplicates when
  /// you retry the <code>CreateGrant</code> request.
  ///
  /// When this value is present, you can retry a <code>CreateGrant</code>
  /// request with identical parameters; if the grant already exists, the
  /// original <code>GrantId</code> is returned without creating a new grant.
  /// Note that the returned grant token is unique with every
  /// <code>CreateGrant</code> request, even when a duplicate
  /// <code>GrantId</code> is returned. All grant tokens for the same grant ID
  /// can be used interchangeably.
  ///
  /// Parameter [retiringPrincipal] :
  /// The principal that is given permission to retire the grant by using
  /// <a>RetireGrant</a> operation.
  ///
  /// To specify the principal, use the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include
  /// AWS accounts (root), IAM users, federated users, and assumed role users.
  /// For examples of the ARN syntax to use for specifying a principal, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS
  /// Identity and Access Management (IAM)</a> in the Example ARNs section of
  /// the <i>AWS General Reference</i>.
  Future<CreateGrantResponse> createGrant({
    @_s.required String granteePrincipal,
    @_s.required String keyId,
    @_s.required List<GrantOperation> operations,
    GrantConstraints constraints,
    List<String> grantTokens,
    String name,
    String retiringPrincipal,
  }) async {
    ArgumentError.checkNotNull(granteePrincipal, 'granteePrincipal');
    _s.validateStringLength(
      'granteePrincipal',
      granteePrincipal,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'granteePrincipal',
      granteePrincipal,
      r'''^[\w+=,.@:/-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(operations, 'operations');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9:/_-]+$''',
    );
    _s.validateStringLength(
      'retiringPrincipal',
      retiringPrincipal,
      1,
      256,
    );
    _s.validateStringPattern(
      'retiringPrincipal',
      retiringPrincipal,
      r'''^[\w+=,.@:/-]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.CreateGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GranteePrincipal': granteePrincipal,
        'KeyId': keyId,
        'Operations': operations?.map((e) => e?.toValue() ?? '')?.toList(),
        if (constraints != null) 'Constraints': constraints,
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (name != null) 'Name': name,
        if (retiringPrincipal != null) 'RetiringPrincipal': retiringPrincipal,
      },
    );

    return CreateGrantResponse.fromJson(jsonResponse.body);
  }

  /// Creates a unique customer managed <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master-keys">customer
  /// master key</a> (CMK) in your AWS account and Region.
  ///
  /// You can use the <code>CreateKey</code> operation to create symmetric or
  /// asymmetric CMKs.
  ///
  /// <ul>
  /// <li>
  /// <b>Symmetric CMKs</b> contain a 256-bit symmetric key that never leaves
  /// AWS KMS unencrypted. To use the CMK, you must call AWS KMS. You can use a
  /// symmetric CMK to encrypt and decrypt small amounts of data, but they are
  /// typically used to generate <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys">data
  /// keys</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-key-pairs">data
  /// keys pairs</a>. For details, see <a>GenerateDataKey</a> and
  /// <a>GenerateDataKeyPair</a>.
  /// </li>
  /// <li>
  /// <b>Asymmetric CMKs</b> can contain an RSA key pair or an Elliptic Curve
  /// (ECC) key pair. The private key in an asymmetric CMK never leaves AWS KMS
  /// unencrypted. However, you can use the <a>GetPublicKey</a> operation to
  /// download the public key so it can be used outside of AWS KMS. CMKs with
  /// RSA key pairs can be used to encrypt or decrypt data or sign and verify
  /// messages (but not both). CMKs with ECC key pairs can be used only to sign
  /// and verify messages.
  /// </li>
  /// </ul>
  /// For information about symmetric and asymmetric CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric CMKs</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  ///
  /// To create different types of CMKs, use the following guidance:
  /// <dl> <dt>Asymmetric CMKs</dt> <dd>
  /// To create an asymmetric CMK, use the <code>CustomerMasterKeySpec</code>
  /// parameter to specify the type of key material in the CMK. Then, use the
  /// <code>KeyUsage</code> parameter to determine whether the CMK will be used
  /// to encrypt and decrypt or sign and verify. You can't change these
  /// properties after the CMK is created.
  ///
  ///
  /// </dd> <dt>Symmetric CMKs</dt> <dd>
  /// When creating a symmetric CMK, you don't need to specify the
  /// <code>CustomerMasterKeySpec</code> or <code>KeyUsage</code> parameters.
  /// The default value for <code>CustomerMasterKeySpec</code>,
  /// <code>SYMMETRIC_DEFAULT</code>, and the default value for
  /// <code>KeyUsage</code>, <code>ENCRYPT_DECRYPT</code>, are the only valid
  /// values for symmetric CMKs.
  ///
  ///
  /// </dd> <dt>Imported Key Material</dt> <dd>
  /// To import your own key material, begin by creating a symmetric CMK with no
  /// key material. To do this, use the <code>Origin</code> parameter of
  /// <code>CreateKey</code> with a value of <code>EXTERNAL</code>. Next, use
  /// <a>GetParametersForImport</a> operation to get a public key and import
  /// token, and use the public key to encrypt your key material. Then, use
  /// <a>ImportKeyMaterial</a> with your import token to import the key
  /// material. For step-by-step instructions, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i> <i>AWS Key Management Service Developer
  /// Guide</i> </i>. You cannot import the key material into an asymmetric CMK.
  ///
  ///
  /// </dd> <dt>Custom Key Stores</dt> <dd>
  /// To create a symmetric CMK in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, use the <code>CustomKeyStoreId</code> parameter to specify
  /// the custom key store. You must also use the <code>Origin</code> parameter
  /// with a value of <code>AWS_CLOUDHSM</code>. The AWS CloudHSM cluster that
  /// is associated with the custom key store must have at least two active HSMs
  /// in different Availability Zones in the AWS Region.
  ///
  /// You cannot create an asymmetric CMK in a custom key store. For information
  /// about custom key stores in AWS KMS see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Using
  /// Custom Key Stores</a> in the <i> <i>AWS Key Management Service Developer
  /// Guide</i> </i>.
  /// </dd> </dl>
  /// <b>Cross-account use</b>: No. You cannot use this operation to create a
  /// CMK in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateKey</a>
  /// (IAM policy). To use the <code>Tags</code> parameter, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a>
  /// (IAM policy). For examples and information about related permissions, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policy-example-create-key">Allow
  /// a user to create CMKs</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DescribeKey</a>
  /// </li>
  /// <li>
  /// <a>ListKeys</a>
  /// </li>
  /// <li>
  /// <a>ScheduleKeyDeletion</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidArnException].
  /// May throw [UnsupportedOperationException].
  /// May throw [KMSInternalException].
  /// May throw [LimitExceededException].
  /// May throw [TagException].
  /// May throw [CustomKeyStoreNotFoundException].
  /// May throw [CustomKeyStoreInvalidStateException].
  /// May throw [CloudHsmClusterInvalidConfigurationException].
  ///
  /// Parameter [bypassPolicyLockoutSafetyCheck] :
  /// A flag to indicate whether to bypass the key policy lockout safety check.
  /// <important>
  /// Setting this value to true increases the risk that the CMK becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  ///
  /// For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section in the <i> <i>AWS Key Management Service Developer
  /// Guide</i> </i>.
  /// </important>
  /// Use this parameter only when you include a policy in the request and you
  /// intend to prevent the principal that is making the request from making a
  /// subsequent <a>PutKeyPolicy</a> request on the CMK.
  ///
  /// The default value is false.
  ///
  /// Parameter [customKeyStoreId] :
  /// Creates the CMK in the specified <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> and the key material in its associated AWS CloudHSM cluster.
  /// To create a CMK in a custom key store, you must also specify the
  /// <code>Origin</code> parameter with a value of <code>AWS_CLOUDHSM</code>.
  /// The AWS CloudHSM cluster that is associated with the custom key store must
  /// have at least two active HSMs, each in a different Availability Zone in
  /// the Region.
  ///
  /// This parameter is valid only for symmetric CMKs. You cannot create an
  /// asymmetric CMK in a custom key store.
  ///
  /// To find the ID of a custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  ///
  /// The response includes the custom key store ID and the ID of the AWS
  /// CloudHSM cluster.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in AWS KMS, which combines the convenience
  /// and extensive integration of AWS KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// Parameter [customerMasterKeySpec] :
  /// Specifies the type of CMK to create. The default value,
  /// <code>SYMMETRIC_DEFAULT</code>, creates a CMK with a 256-bit symmetric key
  /// for encryption and decryption. For help choosing a key spec for your CMK,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-choose.html">How
  /// to Choose Your CMK Configuration</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  ///
  /// The <code>CustomerMasterKeySpec</code> determines whether the CMK contains
  /// a symmetric key or an asymmetric key pair. It also determines the
  /// encryption algorithms or signing algorithms that the CMK supports. You
  /// can't change the <code>CustomerMasterKeySpec</code> after the CMK is
  /// created. To further restrict the algorithms that can be used with the CMK,
  /// use a condition key in its key policy or IAM policy. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-algorithm">kms:EncryptionAlgorithm</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-signing-algorithm">kms:Signing
  /// Algorithm</a> in the <i>AWS Key Management Service Developer Guide</i>.
  /// <important>
  /// <a href="http://aws.amazon.com/kms/features/#AWS_Service_Integration">AWS
  /// services that are integrated with AWS KMS</a> use symmetric CMKs to
  /// protect your data. These services do not support asymmetric CMKs. For help
  /// determining whether a CMK is symmetric or asymmetric, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/find-symm-asymm.html">Identifying
  /// Symmetric and Asymmetric CMKs</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  /// </important>
  /// AWS KMS supports the following key specs for CMKs:
  ///
  /// <ul>
  /// <li>
  /// Symmetric key (default)
  ///
  /// <ul>
  /// <li>
  /// <code>SYMMETRIC_DEFAULT</code> (AES-256-GCM)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Asymmetric RSA key pairs
  ///
  /// <ul>
  /// <li>
  /// <code>RSA_2048</code>
  /// </li>
  /// <li>
  /// <code>RSA_3072</code>
  /// </li>
  /// <li>
  /// <code>RSA_4096</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Asymmetric NIST-recommended elliptic curve key pairs
  ///
  /// <ul>
  /// <li>
  /// <code>ECC_NIST_P256</code> (secp256r1)
  /// </li>
  /// <li>
  /// <code>ECC_NIST_P384</code> (secp384r1)
  /// </li>
  /// <li>
  /// <code>ECC_NIST_P521</code> (secp521r1)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Other asymmetric elliptic curve key pairs
  ///
  /// <ul>
  /// <li>
  /// <code>ECC_SECG_P256K1</code> (secp256k1), commonly used for
  /// cryptocurrencies.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// A description of the CMK.
  ///
  /// Use a description that helps you decide whether the CMK is appropriate for
  /// a task.
  ///
  /// Parameter [keyUsage] :
  /// Determines the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> for which you can use the CMK. The default value is
  /// <code>ENCRYPT_DECRYPT</code>. This parameter is required only for
  /// asymmetric CMKs. You can't change the <code>KeyUsage</code> value after
  /// the CMK is created.
  ///
  /// Select only one valid value.
  ///
  /// <ul>
  /// <li>
  /// For symmetric CMKs, omit the parameter or specify
  /// <code>ENCRYPT_DECRYPT</code>.
  /// </li>
  /// <li>
  /// For asymmetric CMKs with RSA key material, specify
  /// <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>.
  /// </li>
  /// <li>
  /// For asymmetric CMKs with ECC key material, specify
  /// <code>SIGN_VERIFY</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [origin] :
  /// The source of the key material for the CMK. You cannot change the origin
  /// after you create the CMK. The default is <code>AWS_KMS</code>, which means
  /// AWS KMS creates the key material.
  ///
  /// When the parameter value is <code>EXTERNAL</code>, AWS KMS creates a CMK
  /// without key material so that you can import key material from your
  /// existing key management infrastructure. For more information about
  /// importing key material into AWS KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.
  /// This value is valid only for symmetric CMKs.
  ///
  /// When the parameter value is <code>AWS_CLOUDHSM</code>, AWS KMS creates the
  /// CMK in an AWS KMS <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> and creates its key material in the associated AWS CloudHSM
  /// cluster. You must also use the <code>CustomKeyStoreId</code> parameter to
  /// identify the custom key store. This value is valid only for symmetric
  /// CMKs.
  ///
  /// Parameter [policy] :
  /// The key policy to attach to the CMK.
  ///
  /// If you provide a key policy, it must meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the
  /// key policy must allow the principal that is making the
  /// <code>CreateKey</code> request to make a subsequent <a>PutKeyPolicy</a>
  /// request on the CMK. This reduces the risk that the CMK becomes
  /// unmanageable. For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section of the <i> <i>AWS Key Management Service Developer
  /// Guide</i> </i>.
  /// </li>
  /// <li>
  /// Each statement in the key policy must contain one or more principals. The
  /// principals in the key policy must exist and be visible to AWS KMS. When
  /// you create a new AWS principal (for example, an IAM user or role), you
  /// might need to enforce a delay before including the new principal in a key
  /// policy because the new principal might not be immediately visible to AWS
  /// KMS. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes
  /// that I make are not always immediately visible</a> in the <i>AWS Identity
  /// and Access Management User Guide</i>.
  /// </li>
  /// </ul>
  /// If you do not provide a key policy, AWS KMS attaches a default key policy
  /// to the CMK. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">Default
  /// Key Policy</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// The key policy size quota is 32 kilobytes (32768 bytes).
  ///
  /// For help writing and formatting a JSON policy document, see the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM
  /// JSON Policy Reference</a> in the <i> <i>IAM User Guide</i> </i>.
  ///
  /// Parameter [tags] :
  /// One or more tags. Each tag consists of a tag key and a tag value. Both the
  /// tag key and the tag value are required, but the tag value can be an empty
  /// (null) string.
  ///
  /// When you add tags to an AWS resource, AWS generates a cost allocation
  /// report with usage and costs aggregated by tags. For information about
  /// adding, changing, deleting and listing tags for CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// Keys</a>.
  ///
  /// Use this parameter to tag the CMK when it is created. To add tags to an
  /// existing CMK, use the <a>TagResource</a> operation.
  ///
  /// To use this parameter, you must have <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a>
  /// permission in an IAM policy.
  Future<CreateKeyResponse> createKey({
    bool bypassPolicyLockoutSafetyCheck,
    String customKeyStoreId,
    CustomerMasterKeySpec customerMasterKeySpec,
    String description,
    KeyUsageType keyUsage,
    OriginType origin,
    String policy,
    List<Tag> tags,
  }) async {
    _s.validateStringLength(
      'customKeyStoreId',
      customKeyStoreId,
      1,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      8192,
    );
    _s.validateStringLength(
      'policy',
      policy,
      1,
      131072,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.CreateKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bypassPolicyLockoutSafetyCheck != null)
          'BypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
        if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
        if (customerMasterKeySpec != null)
          'CustomerMasterKeySpec': customerMasterKeySpec.toValue(),
        if (description != null) 'Description': description,
        if (keyUsage != null) 'KeyUsage': keyUsage.toValue(),
        if (origin != null) 'Origin': origin.toValue(),
        if (policy != null) 'Policy': policy,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateKeyResponse.fromJson(jsonResponse.body);
  }

  /// Decrypts ciphertext that was encrypted by a AWS KMS customer master key
  /// (CMK) using any of the following operations:
  ///
  /// <ul>
  /// <li>
  /// <a>Encrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKey</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPair</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyWithoutPlaintext</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPairWithoutPlaintext</a>
  /// </li>
  /// </ul>
  /// You can use this operation to decrypt ciphertext that was encrypted under
  /// a symmetric or asymmetric CMK. When the CMK is asymmetric, you must
  /// specify the CMK and the encryption algorithm that was used to encrypt the
  /// ciphertext. For information about symmetric and asymmetric CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric CMKs</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  ///
  /// The Decrypt operation also decrypts ciphertext that was encrypted outside
  /// of AWS KMS by the public key in an AWS KMS asymmetric CMK. However, it
  /// cannot decrypt ciphertext produced by other libraries, such as the <a
  /// href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">AWS
  /// Encryption SDK</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 client-side encryption</a>. These libraries return a ciphertext format
  /// that is incompatible with AWS KMS.
  ///
  /// If the ciphertext was encrypted under a symmetric CMK, the
  /// <code>KeyId</code> parameter is optional. AWS KMS can get this information
  /// from metadata that it adds to the symmetric ciphertext blob. This feature
  /// adds durability to your implementation by ensuring that authorized users
  /// can decrypt ciphertext decades after it was encrypted, even if they've
  /// lost track of the CMK ID. However, specifying the CMK is always
  /// recommended as a best practice. When you use the <code>KeyId</code>
  /// parameter to specify a CMK, AWS KMS only uses the CMK you specify. If the
  /// ciphertext was encrypted under a different CMK, the <code>Decrypt</code>
  /// operation fails. This practice ensures that you use the CMK that you
  /// intend.
  ///
  /// Whenever possible, use key policies to give users permission to call the
  /// <code>Decrypt</code> operation on a particular CMK, instead of using IAM
  /// policies. Otherwise, you might create an IAM user policy that gives the
  /// user <code>Decrypt</code> permission on all CMKs. This user could decrypt
  /// ciphertext that was encrypted by CMKs in other accounts if the key policy
  /// for the cross-account CMK permits it. If you must use an IAM policy for
  /// <code>Decrypt</code> permissions, limit the user to particular CMKs or
  /// particular trusted accounts. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policies-best-practices">Best
  /// practices for IAM policies</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. You can decrypt a ciphertext using a CMK in
  /// a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Decrypt</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>Encrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKey</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPair</a>
  /// </li>
  /// <li>
  /// <a>ReEncrypt</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [InvalidCiphertextException].
  /// May throw [KeyUnavailableException].
  /// May throw [IncorrectKeyException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [ciphertextBlob] :
  /// Ciphertext to be decrypted. The blob includes metadata.
  ///
  /// Parameter [encryptionAlgorithm] :
  /// Specifies the encryption algorithm that will be used to decrypt the
  /// ciphertext. Specify the same algorithm that was used to encrypt the data.
  /// If you specify a different algorithm, the <code>Decrypt</code> operation
  /// fails.
  ///
  /// This parameter is required only when the ciphertext was encrypted under an
  /// asymmetric CMK. The default value, <code>SYMMETRIC_DEFAULT</code>,
  /// represents the only supported algorithm that is valid for symmetric CMKs.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context to use when decrypting the data. An
  /// encryption context is valid only for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> with a symmetric CMK. The standard asymmetric encryption
  /// algorithms that AWS KMS uses do not support an encryption context.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [keyId] :
  /// Specifies the customer master key (CMK) that AWS KMS uses to decrypt the
  /// ciphertext. Enter a key ID of the CMK that was used to encrypt the
  /// ciphertext.
  ///
  /// This parameter is required only when the ciphertext was encrypted under an
  /// asymmetric CMK. If you used a symmetric CMK, AWS KMS can get the CMK from
  /// metadata that it adds to the symmetric ciphertext blob. However, it is
  /// always recommended as a best practice. This practice ensures that you use
  /// the CMK that you intend.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  Future<DecryptResponse> decrypt({
    @_s.required Uint8List ciphertextBlob,
    EncryptionAlgorithmSpec encryptionAlgorithm,
    Map<String, String> encryptionContext,
    List<String> grantTokens,
    String keyId,
  }) async {
    ArgumentError.checkNotNull(ciphertextBlob, 'ciphertextBlob');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.Decrypt'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CiphertextBlob': ciphertextBlob?.let(base64Encode),
        if (encryptionAlgorithm != null)
          'EncryptionAlgorithm': encryptionAlgorithm.toValue(),
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (keyId != null) 'KeyId': keyId,
      },
    );

    return DecryptResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified alias.
  ///
  /// Because an alias is not a property of a CMK, you can delete and change the
  /// aliases of a CMK without affecting the CMK. Also, aliases do not appear in
  /// the response from the <a>DescribeKey</a> operation. To get the aliases of
  /// all CMKs, use the <a>ListAliases</a> operation.
  ///
  /// Each CMK can have multiple aliases. To change the alias of a CMK, use
  /// <a>DeleteAlias</a> to delete the current alias and <a>CreateAlias</a> to
  /// create a new alias. To associate an existing alias with a different
  /// customer master key (CMK), call <a>UpdateAlias</a>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on an
  /// alias in a different AWS account.
  ///
  /// <b>Required permissions</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteAlias</a>
  /// on the alias (IAM policy).
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteAlias</a>
  /// on the CMK (key policy).
  /// </li>
  /// </ul>
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [DependencyTimeoutException].
  /// May throw [NotFoundException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [aliasName] :
  /// The alias to be deleted. The alias name must begin with
  /// <code>alias/</code> followed by the alias name, such as
  /// <code>alias/ExampleAlias</code>.
  Future<void> deleteAlias({
    @_s.required String aliasName,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''^[a-zA-Z0-9:/_-]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DeleteAlias'
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
  }

  /// Deletes a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. This operation does not delete the AWS CloudHSM cluster
  /// that is associated with the custom key store, or affect any users or keys
  /// in the cluster.
  ///
  /// The custom key store that you delete cannot contain any AWS KMS <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">customer
  /// master keys (CMKs)</a>. Before deleting the key store, verify that you
  /// will never need to use any of the CMKs in the key store for any <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>. Then, use <a>ScheduleKeyDeletion</a> to delete the AWS KMS
  /// customer master keys (CMKs) from the key store. When the scheduled waiting
  /// period expires, the <code>ScheduleKeyDeletion</code> operation deletes the
  /// CMKs. Then it makes a best effort to delete the key material from the
  /// associated cluster. However, you might need to manually <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key">delete
  /// the orphaned key material</a> from the cluster and its backups.
  ///
  /// After all CMKs are deleted from AWS KMS, use
  /// <a>DisconnectCustomKeyStore</a> to disconnect the key store from AWS KMS.
  /// Then, you can delete the custom key store.
  ///
  /// Instead of deleting the custom key store, consider using
  /// <a>DisconnectCustomKeyStore</a> to disconnect it from AWS KMS. While the
  /// key store is disconnected, you cannot create or use the CMKs in the key
  /// store. But, you do not need to delete CMKs and you can reconnect a
  /// disconnected custom key store at any time.
  ///
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in AWS KMS, which combines the convenience
  /// and extensive integration of AWS KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteCustomKeyStore</a>
  /// (IAM policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ConnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>CreateCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DescribeCustomKeyStores</a>
  /// </li>
  /// <li>
  /// <a>DisconnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>UpdateCustomKeyStore</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [CustomKeyStoreHasCMKsException].
  /// May throw [CustomKeyStoreInvalidStateException].
  /// May throw [CustomKeyStoreNotFoundException].
  /// May throw [KMSInternalException].
  ///
  /// Parameter [customKeyStoreId] :
  /// Enter the ID of the custom key store you want to delete. To find the ID of
  /// a custom key store, use the <a>DescribeCustomKeyStores</a> operation.
  Future<void> deleteCustomKeyStore({
    @_s.required String customKeyStoreId,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    _s.validateStringLength(
      'customKeyStoreId',
      customKeyStoreId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DeleteCustomKeyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomKeyStoreId': customKeyStoreId,
      },
    );

    return DeleteCustomKeyStoreResponse.fromJson(jsonResponse.body);
  }

  /// Deletes key material that you previously imported. This operation makes
  /// the specified customer master key (CMK) unusable. For more information
  /// about importing key material into AWS KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// When the specified CMK is in the <code>PendingDeletion</code> state, this
  /// operation does not change the CMK's state. Otherwise, it changes the CMK's
  /// state to <code>PendingImport</code>.
  ///
  /// After you delete key material, you can use <a>ImportKeyMaterial</a> to
  /// reimport the same key material into the CMK.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteImportedKeyMaterial</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GetParametersForImport</a>
  /// </li>
  /// <li>
  /// <a>ImportKeyMaterial</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidArnException].
  /// May throw [UnsupportedOperationException].
  /// May throw [DependencyTimeoutException].
  /// May throw [NotFoundException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// Identifies the CMK from which you are deleting imported key material. The
  /// <code>Origin</code> of the CMK must be <code>EXTERNAL</code>.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> deleteImportedKeyMaterial({
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DeleteImportedKeyMaterial'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
      },
    );
  }

  /// Gets information about <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key stores</a> in the account and region.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in AWS KMS, which combines the convenience
  /// and extensive integration of AWS KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// By default, this operation returns information about all custom key stores
  /// in the account and region. To get only information about a particular
  /// custom key store, use either the <code>CustomKeyStoreName</code> or
  /// <code>CustomKeyStoreId</code> parameter (but not both).
  ///
  /// To determine whether the custom key store is connected to its AWS CloudHSM
  /// cluster, use the <code>ConnectionState</code> element in the response. If
  /// an attempt to connect the custom key store failed, the
  /// <code>ConnectionState</code> value is <code>FAILED</code> and the
  /// <code>ConnectionErrorCode</code> element in the response indicates the
  /// cause of the failure. For help interpreting the
  /// <code>ConnectionErrorCode</code>, see <a>CustomKeyStoresListEntry</a>.
  ///
  /// Custom key stores have a <code>DISCONNECTED</code> connection state if the
  /// key store has never been connected or you use the
  /// <a>DisconnectCustomKeyStore</a> operation to disconnect it. If your custom
  /// key store state is <code>CONNECTED</code> but you are having trouble using
  /// it, make sure that its associated AWS CloudHSM cluster is active and
  /// contains the minimum number of HSMs required for the operation, if any.
  ///
  /// For help repairing your custom key store, see the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting
  /// Custom Key Stores</a> topic in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DescribeCustomKeyStores</a>
  /// (IAM policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ConnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>CreateCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DeleteCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DisconnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>UpdateCustomKeyStore</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [CustomKeyStoreNotFoundException].
  /// May throw [KMSInternalException].
  ///
  /// Parameter [customKeyStoreId] :
  /// Gets only information about the specified custom key store. Enter the key
  /// store ID.
  ///
  /// By default, this operation gets information about all custom key stores in
  /// the account and region. To limit the output to a particular custom key
  /// store, you can use either the <code>CustomKeyStoreId</code> or
  /// <code>CustomKeyStoreName</code> parameter, but not both.
  ///
  /// Parameter [customKeyStoreName] :
  /// Gets only information about the specified custom key store. Enter the
  /// friendly name of the custom key store.
  ///
  /// By default, this operation gets information about all custom key stores in
  /// the account and region. To limit the output to a particular custom key
  /// store, you can use either the <code>CustomKeyStoreId</code> or
  /// <code>CustomKeyStoreName</code> parameter, but not both.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, AWS KMS does not return more than the specified
  /// number of items, but it might return fewer.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<DescribeCustomKeyStoresResponse> describeCustomKeyStores({
    String customKeyStoreId,
    String customKeyStoreName,
    int limit,
    String marker,
  }) async {
    _s.validateStringLength(
      'customKeyStoreId',
      customKeyStoreId,
      1,
      64,
    );
    _s.validateStringLength(
      'customKeyStoreName',
      customKeyStoreName,
      1,
      256,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DescribeCustomKeyStores'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
        if (customKeyStoreName != null)
          'CustomKeyStoreName': customKeyStoreName,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return DescribeCustomKeyStoresResponse.fromJson(jsonResponse.body);
  }

  /// Provides detailed information about a customer master key (CMK). You can
  /// run <code>DescribeKey</code> on a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed CMK</a> or an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">AWS
  /// managed CMK</a>.
  ///
  /// This detailed information includes the key ARN, creation date (and
  /// deletion date, if applicable), the key state, and the origin and
  /// expiration date (if any) of the key material. For CMKs in custom key
  /// stores, it includes information about the custom key store, such as the
  /// key store ID and the AWS CloudHSM cluster ID. It includes fields, like
  /// <code>KeySpec</code>, that help you distinguish symmetric from asymmetric
  /// CMKs. It also provides information that is particularly important to
  /// asymmetric CMKs, such as the key usage (encryption or signing) and the
  /// encryption algorithms or signing algorithms that the CMK supports.
  ///
  /// <code>DescribeKey</code> does not return the following information:
  ///
  /// <ul>
  /// <li>
  /// Aliases associated with the CMK. To get this information, use
  /// <a>ListAliases</a>.
  /// </li>
  /// <li>
  /// Whether automatic key rotation is enabled on the CMK. To get this
  /// information, use <a>GetKeyRotationStatus</a>. Also, some key states
  /// prevent a CMK from being automatically rotated. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-how-it-works">How
  /// Automatic Key Rotation Works</a> in <i>AWS Key Management Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// Tags on the CMK. To get this information, use <a>ListResourceTags</a>.
  /// </li>
  /// <li>
  /// Key policies and grants on the CMK. To get this information, use
  /// <a>GetKeyPolicy</a> and <a>ListGrants</a>.
  /// </li>
  /// </ul>
  /// If you call the <code>DescribeKey</code> operation on a <i>predefined AWS
  /// alias</i>, that is, an AWS alias with no key ID, AWS KMS creates an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">AWS
  /// managed CMK</a>. Then, it associates the alias with the new CMK, and
  /// returns the <code>KeyId</code> and <code>Arn</code> of the new CMK in the
  /// response.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DescribeKey</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GetKeyPolicy</a>
  /// </li>
  /// <li>
  /// <a>GetKeyRotationStatus</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>ListGrants</a>
  /// </li>
  /// <li>
  /// <a>ListKeys</a>
  /// </li>
  /// <li>
  /// <a>ListResourceTags</a>
  /// </li>
  /// <li>
  /// <a>ListRetirableGrants</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  ///
  /// Parameter [keyId] :
  /// Describes the specified customer master key (CMK).
  ///
  /// If you specify a predefined AWS alias (an AWS alias with no key ID), KMS
  /// associates the alias with an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">AWS
  /// managed CMK</a> and returns its <code>KeyId</code> and <code>Arn</code> in
  /// the response.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  Future<DescribeKeyResponse> describeKey({
    @_s.required String keyId,
    List<String> grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DescribeKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (grantTokens != null) 'GrantTokens': grantTokens,
      },
    );

    return DescribeKeyResponse.fromJson(jsonResponse.body);
  }

  /// Sets the state of a customer master key (CMK) to disabled. This change
  /// temporarily prevents use of the CMK for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>.
  ///
  /// For more information about how key state affects the use of a CMK, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects the Use of a Customer Master Key</a> in the <i> <i>AWS
  /// Key Management Service Developer Guide</i> </i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DisableKey</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>EnableKey</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> disableKey({
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DisableKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
      },
    );
  }

  /// Disables <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
  /// rotation of the key material</a> for the specified symmetric customer
  /// master key (CMK).
  ///
  /// You cannot enable automatic rotation of asymmetric CMKs, CMKs with
  /// imported key material, or CMKs in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DisableKeyRotation</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>EnableKeyRotation</a>
  /// </li>
  /// <li>
  /// <a>GetKeyRotationStatus</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [keyId] :
  /// Identifies a symmetric customer master key (CMK). You cannot enable or
  /// disable automatic rotation of <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks">asymmetric
  /// CMKs</a>, CMKs with <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported
  /// key material</a>, or CMKs in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> disableKeyRotation({
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DisableKeyRotation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
      },
    );
  }

  /// Disconnects the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> from its associated AWS CloudHSM cluster. While a custom key
  /// store is disconnected, you can manage the custom key store and its
  /// customer master keys (CMKs), but you cannot create or use CMKs in the
  /// custom key store. You can reconnect the custom key store at any time.
  /// <note>
  /// While a custom key store is disconnected, all attempts to create customer
  /// master keys (CMKs) in the custom key store or to use existing CMKs in <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> will fail. This action can prevent users from storing and
  /// accessing sensitive data.
  /// </note> <p/>
  /// To find the connection state of a custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation. To reconnect a custom key store,
  /// use the <a>ConnectCustomKeyStore</a> operation.
  ///
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in AWS KMS, which combines the convenience
  /// and extensive integration of AWS KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DisconnectCustomKeyStore</a>
  /// (IAM policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ConnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>CreateCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DeleteCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DescribeCustomKeyStores</a>
  /// </li>
  /// <li>
  /// <a>UpdateCustomKeyStore</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [CustomKeyStoreInvalidStateException].
  /// May throw [CustomKeyStoreNotFoundException].
  /// May throw [KMSInternalException].
  ///
  /// Parameter [customKeyStoreId] :
  /// Enter the ID of the custom key store you want to disconnect. To find the
  /// ID of a custom key store, use the <a>DescribeCustomKeyStores</a>
  /// operation.
  Future<void> disconnectCustomKeyStore({
    @_s.required String customKeyStoreId,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    _s.validateStringLength(
      'customKeyStoreId',
      customKeyStoreId,
      1,
      64,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DisconnectCustomKeyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomKeyStoreId': customKeyStoreId,
      },
    );

    return DisconnectCustomKeyStoreResponse.fromJson(jsonResponse.body);
  }

  /// Sets the key state of a customer master key (CMK) to enabled. This allows
  /// you to use the CMK for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:EnableKey</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>DisableKey</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [LimitExceededException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> enableKey({
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.EnableKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
      },
    );
  }

  /// Enables <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
  /// rotation of the key material</a> for the specified symmetric customer
  /// master key (CMK).
  ///
  /// You cannot enable automatic rotation of asymmetric CMKs, CMKs with
  /// imported key material, or CMKs in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:EnableKeyRotation</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DisableKeyRotation</a>
  /// </li>
  /// <li>
  /// <a>GetKeyRotationStatus</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [keyId] :
  /// Identifies a symmetric customer master key (CMK). You cannot enable
  /// automatic rotation of asymmetric CMKs, CMKs with imported key material, or
  /// CMKs in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> enableKeyRotation({
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.EnableKeyRotation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
      },
    );
  }

  /// Encrypts plaintext into ciphertext by using a customer master key (CMK).
  /// The <code>Encrypt</code> operation has two primary use cases:
  ///
  /// <ul>
  /// <li>
  /// You can encrypt small amounts of arbitrary data, such as a personal
  /// identifier or database password, or other sensitive information.
  /// </li>
  /// <li>
  /// You can use the <code>Encrypt</code> operation to move encrypted data from
  /// one AWS Region to another. For example, in Region A, generate a data key
  /// and use the plaintext key to encrypt your data. Then, in Region A, use the
  /// <code>Encrypt</code> operation to encrypt the plaintext data key under a
  /// CMK in Region B. Now, you can move the encrypted data and the encrypted
  /// data key to Region B. When necessary, you can decrypt the encrypted data
  /// key and the encrypted data entirely within in Region B.
  /// </li>
  /// </ul>
  /// You don't need to use the <code>Encrypt</code> operation to encrypt a data
  /// key. The <a>GenerateDataKey</a> and <a>GenerateDataKeyPair</a> operations
  /// return a plaintext data key and an encrypted copy of that data key.
  ///
  /// When you encrypt data, you must specify a symmetric or asymmetric CMK to
  /// use in the encryption operation. The CMK must have a <code>KeyUsage</code>
  /// value of <code>ENCRYPT_DECRYPT.</code> To find the <code>KeyUsage</code>
  /// of a CMK, use the <a>DescribeKey</a> operation.
  ///
  /// If you use a symmetric CMK, you can use an encryption context to add
  /// additional security to your encryption operation. If you specify an
  /// <code>EncryptionContext</code> when encrypting data, you must specify the
  /// same encryption context (a case-sensitive exact match) when decrypting the
  /// data. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// If you specify an asymmetric CMK, you must also specify the encryption
  /// algorithm. The algorithm must be compatible with the CMK type.
  /// <important>
  /// When you use an asymmetric CMK to encrypt or reencrypt data, be sure to
  /// record the CMK and encryption algorithm that you choose. You will be
  /// required to provide the same CMK and encryption algorithm when you decrypt
  /// the data. If the CMK and algorithm do not match the values used to encrypt
  /// the data, the decrypt operation fails.
  ///
  /// You are not required to supply the CMK ID and encryption algorithm when
  /// you decrypt with symmetric CMKs because AWS KMS stores this information in
  /// the ciphertext blob. AWS KMS cannot store metadata in ciphertext generated
  /// with asymmetric keys. The standard format for asymmetric key ciphertext
  /// does not include configurable fields.
  /// </important>
  /// The maximum size of the data that you can encrypt varies with the type of
  /// CMK and the encryption algorithm that you choose.
  ///
  /// <ul>
  /// <li>
  /// Symmetric CMKs
  ///
  /// <ul>
  /// <li>
  /// <code>SYMMETRIC_DEFAULT</code>: 4096 bytes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RSA_2048</code>
  ///
  /// <ul>
  /// <li>
  /// <code>RSAES_OAEP_SHA_1</code>: 214 bytes
  /// </li>
  /// <li>
  /// <code>RSAES_OAEP_SHA_256</code>: 190 bytes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RSA_3072</code>
  ///
  /// <ul>
  /// <li>
  /// <code>RSAES_OAEP_SHA_1</code>: 342 bytes
  /// </li>
  /// <li>
  /// <code>RSAES_OAEP_SHA_256</code>: 318 bytes
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>RSA_4096</code>
  ///
  /// <ul>
  /// <li>
  /// <code>RSAES_OAEP_SHA_1</code>: 470 bytes
  /// </li>
  /// <li>
  /// <code>RSAES_OAEP_SHA_256</code>: 446 bytes
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Encrypt</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>Decrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKey</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPair</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [plaintext] :
  /// Data to be encrypted.
  ///
  /// Parameter [encryptionAlgorithm] :
  /// Specifies the encryption algorithm that AWS KMS will use to encrypt the
  /// plaintext message. The algorithm must be compatible with the CMK that you
  /// specify.
  ///
  /// This parameter is required only for asymmetric CMKs. The default value,
  /// <code>SYMMETRIC_DEFAULT</code>, is the algorithm used for symmetric CMKs.
  /// If you are using an asymmetric CMK, we recommend RSAES_OAEP_SHA_256.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used to encrypt the data. An
  /// encryption context is valid only for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> with a symmetric CMK. The standard asymmetric encryption
  /// algorithms that AWS KMS uses do not support an encryption context.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  Future<EncryptResponse> encrypt({
    @_s.required String keyId,
    @_s.required Uint8List plaintext,
    EncryptionAlgorithmSpec encryptionAlgorithm,
    Map<String, String> encryptionContext,
    List<String> grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(plaintext, 'plaintext');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.Encrypt'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'Plaintext': plaintext?.let(base64Encode),
        if (encryptionAlgorithm != null)
          'EncryptionAlgorithm': encryptionAlgorithm.toValue(),
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
      },
    );

    return EncryptResponse.fromJson(jsonResponse.body);
  }

  /// Generates a unique symmetric data key for client-side encryption. This
  /// operation returns a plaintext copy of the data key and a copy that is
  /// encrypted under a customer master key (CMK) that you specify. You can use
  /// the plaintext key to encrypt your data outside of AWS KMS and store the
  /// encrypted data key with the encrypted data.
  ///
  /// <code>GenerateDataKey</code> returns a unique data key for each request.
  /// The bytes in the plaintext key are not related to the caller or the CMK.
  ///
  /// To generate a data key, specify the symmetric CMK that will be used to
  /// encrypt the data key. You cannot use an asymmetric CMK to generate data
  /// keys. To get the type of your CMK, use the <a>DescribeKey</a> operation.
  /// You must also specify the length of the data key. Use either the
  /// <code>KeySpec</code> or <code>NumberOfBytes</code> parameters (but not
  /// both). For 128-bit and 256-bit data keys, use the <code>KeySpec</code>
  /// parameter.
  ///
  /// To get only an encrypted copy of the data key, use
  /// <a>GenerateDataKeyWithoutPlaintext</a>. To generate an asymmetric data key
  /// pair, use the <a>GenerateDataKeyPair</a> or
  /// <a>GenerateDataKeyPairWithoutPlaintext</a> operation. To get a
  /// cryptographically secure random byte string, use <a>GenerateRandom</a>.
  ///
  /// You can use the optional encryption context to add additional security to
  /// the encryption operation. If you specify an
  /// <code>EncryptionContext</code>, you must specify the same encryption
  /// context (a case-sensitive exact match) when decrypting the encrypted data
  /// key. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>How to use your data key</b>
  ///
  /// We recommend that you use the following pattern to encrypt data locally in
  /// your application. You can write your own code or use a client-side
  /// encryption library, such as the <a
  /// href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">AWS
  /// Encryption SDK</a>, the <a
  /// href="https://docs.aws.amazon.com/dynamodb-encryption-client/latest/devguide/">Amazon
  /// DynamoDB Encryption Client</a>, or <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 client-side encryption</a> to do these tasks for you.
  ///
  /// To encrypt data outside of AWS KMS:
  /// <ol>
  /// <li>
  /// Use the <code>GenerateDataKey</code> operation to get a data key.
  /// </li>
  /// <li>
  /// Use the plaintext data key (in the <code>Plaintext</code> field of the
  /// response) to encrypt your data outside of AWS KMS. Then erase the
  /// plaintext data key from memory.
  /// </li>
  /// <li>
  /// Store the encrypted data key (in the <code>CiphertextBlob</code> field of
  /// the response) with the encrypted data.
  /// </li> </ol>
  /// To decrypt data outside of AWS KMS:
  /// <ol>
  /// <li>
  /// Use the <a>Decrypt</a> operation to decrypt the encrypted data key. The
  /// operation returns a plaintext copy of the data key.
  /// </li>
  /// <li>
  /// Use the plaintext data key to decrypt data outside of AWS KMS, then erase
  /// the plaintext data key from memory.
  /// </li> </ol>
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKey</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>Decrypt</a>
  /// </li>
  /// <li>
  /// <a>Encrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPair</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPairWithoutPlaintext</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyWithoutPlaintext</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// Identifies the symmetric CMK that encrypts the data key.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used when encrypting the
  /// data key.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [keySpec] :
  /// Specifies the length of the data key. Use <code>AES_128</code> to generate
  /// a 128-bit symmetric key, or <code>AES_256</code> to generate a 256-bit
  /// symmetric key.
  ///
  /// You must specify either the <code>KeySpec</code> or the
  /// <code>NumberOfBytes</code> parameter (but not both) in every
  /// <code>GenerateDataKey</code> request.
  ///
  /// Parameter [numberOfBytes] :
  /// Specifies the length of the data key in bytes. For example, use the value
  /// 64 to generate a 512-bit data key (64 bytes is 512 bits). For 128-bit
  /// (16-byte) and 256-bit (32-byte) data keys, use the <code>KeySpec</code>
  /// parameter.
  ///
  /// You must specify either the <code>KeySpec</code> or the
  /// <code>NumberOfBytes</code> parameter (but not both) in every
  /// <code>GenerateDataKey</code> request.
  Future<GenerateDataKeyResponse> generateDataKey({
    @_s.required String keyId,
    Map<String, String> encryptionContext,
    List<String> grantTokens,
    DataKeySpec keySpec,
    int numberOfBytes,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'numberOfBytes',
      numberOfBytes,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GenerateDataKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (keySpec != null) 'KeySpec': keySpec.toValue(),
        if (numberOfBytes != null) 'NumberOfBytes': numberOfBytes,
      },
    );

    return GenerateDataKeyResponse.fromJson(jsonResponse.body);
  }

  /// Generates a unique asymmetric data key pair. The
  /// <code>GenerateDataKeyPair</code> operation returns a plaintext public key,
  /// a plaintext private key, and a copy of the private key that is encrypted
  /// under the symmetric CMK you specify. You can use the data key pair to
  /// perform asymmetric cryptography outside of AWS KMS.
  ///
  /// <code>GenerateDataKeyPair</code> returns a unique data key pair for each
  /// request. The bytes in the keys are not related to the caller or the CMK
  /// that is used to encrypt the private key.
  ///
  /// You can use the public key that <code>GenerateDataKeyPair</code> returns
  /// to encrypt data or verify a signature outside of AWS KMS. Then, store the
  /// encrypted private key with the data. When you are ready to decrypt data or
  /// sign a message, you can use the <a>Decrypt</a> operation to decrypt the
  /// encrypted private key.
  ///
  /// To generate a data key pair, you must specify a symmetric customer master
  /// key (CMK) to encrypt the private key in a data key pair. You cannot use an
  /// asymmetric CMK or a CMK in a custom key store. To get the type and origin
  /// of your CMK, use the <a>DescribeKey</a> operation.
  ///
  /// If you are using the data key pair to encrypt data, or for any operation
  /// where you don't immediately need a private key, consider using the
  /// <a>GenerateDataKeyPairWithoutPlaintext</a> operation.
  /// <code>GenerateDataKeyPairWithoutPlaintext</code> returns a plaintext
  /// public key and an encrypted private key, but omits the plaintext private
  /// key that you need only to decrypt ciphertext or sign a message. Later,
  /// when you need to decrypt the data or sign a message, use the
  /// <a>Decrypt</a> operation to decrypt the encrypted private key in the data
  /// key pair.
  ///
  /// You can use the optional encryption context to add additional security to
  /// the encryption operation. If you specify an
  /// <code>EncryptionContext</code>, you must specify the same encryption
  /// context (a case-sensitive exact match) when decrypting the encrypted data
  /// key. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKeyPair</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>Decrypt</a>
  /// </li>
  /// <li>
  /// <a>Encrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKey</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPairWithoutPlaintext</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyWithoutPlaintext</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [keyId] :
  /// Specifies the symmetric CMK that encrypts the private key in the data key
  /// pair. You cannot specify an asymmetric CMK or a CMK in a custom key store.
  /// To get the type and origin of your CMK, use the <a>DescribeKey</a>
  /// operation.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [keyPairSpec] :
  /// Determines the type of data key pair that is generated.
  ///
  /// The AWS KMS rule that restricts the use of asymmetric RSA CMKs to encrypt
  /// and decrypt or to sign and verify (but not both), and the rule that
  /// permits you to use ECC CMKs only to sign and verify, are not effective
  /// outside of AWS KMS.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used when encrypting the
  /// private key in the data key pair.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  Future<GenerateDataKeyPairResponse> generateDataKeyPair({
    @_s.required String keyId,
    @_s.required DataKeyPairSpec keyPairSpec,
    Map<String, String> encryptionContext,
    List<String> grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyPairSpec, 'keyPairSpec');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GenerateDataKeyPair'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'KeyPairSpec': keyPairSpec?.toValue() ?? '',
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
      },
    );

    return GenerateDataKeyPairResponse.fromJson(jsonResponse.body);
  }

  /// Generates a unique asymmetric data key pair. The
  /// <code>GenerateDataKeyPairWithoutPlaintext</code> operation returns a
  /// plaintext public key and a copy of the private key that is encrypted under
  /// the symmetric CMK you specify. Unlike <a>GenerateDataKeyPair</a>, this
  /// operation does not return a plaintext private key.
  ///
  /// To generate a data key pair, you must specify a symmetric customer master
  /// key (CMK) to encrypt the private key in the data key pair. You cannot use
  /// an asymmetric CMK or a CMK in a custom key store. To get the type and
  /// origin of your CMK, use the <code>KeySpec</code> field in the
  /// <a>DescribeKey</a> response.
  ///
  /// You can use the public key that
  /// <code>GenerateDataKeyPairWithoutPlaintext</code> returns to encrypt data
  /// or verify a signature outside of AWS KMS. Then, store the encrypted
  /// private key with the data. When you are ready to decrypt data or sign a
  /// message, you can use the <a>Decrypt</a> operation to decrypt the encrypted
  /// private key.
  ///
  /// <code>GenerateDataKeyPairWithoutPlaintext</code> returns a unique data key
  /// pair for each request. The bytes in the key are not related to the caller
  /// or CMK that is used to encrypt the private key.
  ///
  /// You can use the optional encryption context to add additional security to
  /// the encryption operation. If you specify an
  /// <code>EncryptionContext</code>, you must specify the same encryption
  /// context (a case-sensitive exact match) when decrypting the encrypted data
  /// key. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKeyPairWithoutPlaintext</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>Decrypt</a>
  /// </li>
  /// <li>
  /// <a>Encrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKey</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPair</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyWithoutPlaintext</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [keyId] :
  /// Specifies the CMK that encrypts the private key in the data key pair. You
  /// must specify a symmetric CMK. You cannot use an asymmetric CMK or a CMK in
  /// a custom key store. To get the type and origin of your CMK, use the
  /// <a>DescribeKey</a> operation.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [keyPairSpec] :
  /// Determines the type of data key pair that is generated.
  ///
  /// The AWS KMS rule that restricts the use of asymmetric RSA CMKs to encrypt
  /// and decrypt or to sign and verify (but not both), and the rule that
  /// permits you to use ECC CMKs only to sign and verify, are not effective
  /// outside of AWS KMS.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used when encrypting the
  /// private key in the data key pair.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  Future<GenerateDataKeyPairWithoutPlaintextResponse>
      generateDataKeyPairWithoutPlaintext({
    @_s.required String keyId,
    @_s.required DataKeyPairSpec keyPairSpec,
    Map<String, String> encryptionContext,
    List<String> grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyPairSpec, 'keyPairSpec');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GenerateDataKeyPairWithoutPlaintext'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'KeyPairSpec': keyPairSpec?.toValue() ?? '',
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
      },
    );

    return GenerateDataKeyPairWithoutPlaintextResponse.fromJson(
        jsonResponse.body);
  }

  /// Generates a unique symmetric data key. This operation returns a data key
  /// that is encrypted under a customer master key (CMK) that you specify. To
  /// request an asymmetric data key pair, use the <a>GenerateDataKeyPair</a> or
  /// <a>GenerateDataKeyPairWithoutPlaintext</a> operations.
  ///
  /// <code>GenerateDataKeyWithoutPlaintext</code> is identical to the
  /// <a>GenerateDataKey</a> operation except that returns only the encrypted
  /// copy of the data key. This operation is useful for systems that need to
  /// encrypt data at some point, but not immediately. When you need to encrypt
  /// the data, you call the <a>Decrypt</a> operation on the encrypted copy of
  /// the key.
  ///
  /// It's also useful in distributed systems with different levels of trust.
  /// For example, you might store encrypted data in containers. One component
  /// of your system creates new containers and stores an encrypted data key
  /// with each container. Then, a different component puts the data into the
  /// containers. That component first decrypts the data key, uses the plaintext
  /// data key to encrypt data, puts the encrypted data into the container, and
  /// then destroys the plaintext data key. In this system, the component that
  /// creates the containers never sees the plaintext data key.
  ///
  /// <code>GenerateDataKeyWithoutPlaintext</code> returns a unique data key for
  /// each request. The bytes in the keys are not related to the caller or CMK
  /// that is used to encrypt the private key.
  ///
  /// To generate a data key, you must specify the symmetric customer master key
  /// (CMK) that is used to encrypt the data key. You cannot use an asymmetric
  /// CMK to generate a data key. To get the type of your CMK, use the
  /// <a>DescribeKey</a> operation.
  ///
  /// If the operation succeeds, you will find the encrypted copy of the data
  /// key in the <code>CiphertextBlob</code> field.
  ///
  /// You can use the optional encryption context to add additional security to
  /// the encryption operation. If you specify an
  /// <code>EncryptionContext</code>, you must specify the same encryption
  /// context (a case-sensitive exact match) when decrypting the encrypted data
  /// key. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKeyWithoutPlaintext</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>Decrypt</a>
  /// </li>
  /// <li>
  /// <a>Encrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKey</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPair</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPairWithoutPlaintext</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// The identifier of the symmetric customer master key (CMK) that encrypts
  /// the data key.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used when encrypting the
  /// data key.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [keySpec] :
  /// The length of the data key. Use <code>AES_128</code> to generate a 128-bit
  /// symmetric key, or <code>AES_256</code> to generate a 256-bit symmetric
  /// key.
  ///
  /// Parameter [numberOfBytes] :
  /// The length of the data key in bytes. For example, use the value 64 to
  /// generate a 512-bit data key (64 bytes is 512 bits). For common key lengths
  /// (128-bit and 256-bit symmetric keys), we recommend that you use the
  /// <code>KeySpec</code> field instead of this one.
  Future<GenerateDataKeyWithoutPlaintextResponse>
      generateDataKeyWithoutPlaintext({
    @_s.required String keyId,
    Map<String, String> encryptionContext,
    List<String> grantTokens,
    DataKeySpec keySpec,
    int numberOfBytes,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'numberOfBytes',
      numberOfBytes,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GenerateDataKeyWithoutPlaintext'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (keySpec != null) 'KeySpec': keySpec.toValue(),
        if (numberOfBytes != null) 'NumberOfBytes': numberOfBytes,
      },
    );

    return GenerateDataKeyWithoutPlaintextResponse.fromJson(jsonResponse.body);
  }

  /// Returns a random byte string that is cryptographically secure.
  ///
  /// By default, the random byte string is generated in AWS KMS. To generate
  /// the byte string in the AWS CloudHSM cluster that is associated with a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, specify the custom key store ID.
  ///
  /// For more information about entropy and random number generation, see the
  /// <a
  /// href="https://d0.awsstatic.com/whitepapers/KMS-Cryptographic-Details.pdf">AWS
  /// Key Management Service Cryptographic Details</a> whitepaper.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateRandom</a>
  /// (IAM policy)
  ///
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [CustomKeyStoreNotFoundException].
  /// May throw [CustomKeyStoreInvalidStateException].
  ///
  /// Parameter [customKeyStoreId] :
  /// Generates the random byte string in the AWS CloudHSM cluster that is
  /// associated with the specified <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. To find the ID of a custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  ///
  /// Parameter [numberOfBytes] :
  /// The length of the byte string.
  Future<GenerateRandomResponse> generateRandom({
    String customKeyStoreId,
    int numberOfBytes,
  }) async {
    _s.validateStringLength(
      'customKeyStoreId',
      customKeyStoreId,
      1,
      64,
    );
    _s.validateNumRange(
      'numberOfBytes',
      numberOfBytes,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GenerateRandom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
        if (numberOfBytes != null) 'NumberOfBytes': numberOfBytes,
      },
    );

    return GenerateRandomResponse.fromJson(jsonResponse.body);
  }

  /// Gets a key policy attached to the specified customer master key (CMK).
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetKeyPolicy</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>PutKeyPolicy</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [policyName] :
  /// Specifies the name of the key policy. The only valid name is
  /// <code>default</code>. To get the names of key policies, use
  /// <a>ListKeyPolicies</a>.
  Future<GetKeyPolicyResponse> getKeyPolicy({
    @_s.required String keyId,
    @_s.required String policyName,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GetKeyPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'PolicyName': policyName,
      },
    );

    return GetKeyPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Gets a Boolean value that indicates whether <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
  /// rotation of the key material</a> is enabled for the specified customer
  /// master key (CMK).
  ///
  /// You cannot enable automatic rotation of asymmetric CMKs, CMKs with
  /// imported key material, or CMKs in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. The key rotation status for these CMKs is always
  /// <code>false</code>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// Disabled: The key rotation status does not change when you disable a CMK.
  /// However, while the CMK is disabled, AWS KMS does not rotate the backing
  /// key.
  /// </li>
  /// <li>
  /// Pending deletion: While a CMK is pending deletion, its key rotation status
  /// is <code>false</code> and AWS KMS does not rotate the backing key. If you
  /// cancel the deletion, the original key rotation status is restored.
  /// </li>
  /// </ul>
  /// <b>Cross-account use</b>: Yes. To perform this operation on a CMK in a
  /// different AWS account, specify the key ARN in the value of the
  /// <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetKeyRotationStatus</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DisableKeyRotation</a>
  /// </li>
  /// <li>
  /// <a>EnableKeyRotation</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<GetKeyRotationStatusResponse> getKeyRotationStatus({
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GetKeyRotationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
      },
    );

    return GetKeyRotationStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns the items you need to import key material into a symmetric,
  /// customer managed customer master key (CMK). For more information about
  /// importing key material into AWS KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// This operation returns a public key and an import token. Use the public
  /// key to encrypt the symmetric key material. Store the import token to send
  /// with a subsequent <a>ImportKeyMaterial</a> request.
  ///
  /// You must specify the key ID of the symmetric CMK into which you will
  /// import key material. This CMK's <code>Origin</code> must be
  /// <code>EXTERNAL</code>. You must also specify the wrapping algorithm and
  /// type of wrapping key (public key) that you will use to encrypt the key
  /// material. You cannot perform this operation on an asymmetric CMK or on any
  /// CMK in a different AWS account.
  ///
  /// To import key material, you must use the public key and import token from
  /// the same response. These items are valid for 24 hours. The expiration date
  /// and time appear in the <code>GetParametersForImport</code> response. You
  /// cannot use an expired token in an <a>ImportKeyMaterial</a> request. If
  /// your key and token expire, send another
  /// <code>GetParametersForImport</code> request.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetParametersForImport</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ImportKeyMaterial</a>
  /// </li>
  /// <li>
  /// <a>DeleteImportedKeyMaterial</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidArnException].
  /// May throw [UnsupportedOperationException].
  /// May throw [DependencyTimeoutException].
  /// May throw [NotFoundException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// The identifier of the symmetric CMK into which you will import key
  /// material. The <code>Origin</code> of the CMK must be
  /// <code>EXTERNAL</code>.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [wrappingAlgorithm] :
  /// The algorithm you will use to encrypt the key material before importing it
  /// with <a>ImportKeyMaterial</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-encrypt-key-material.html">Encrypt
  /// the Key Material</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// Parameter [wrappingKeySpec] :
  /// The type of wrapping key (public key) to return in the response. Only
  /// 2048-bit RSA public keys are supported.
  Future<GetParametersForImportResponse> getParametersForImport({
    @_s.required String keyId,
    @_s.required AlgorithmSpec wrappingAlgorithm,
    @_s.required WrappingKeySpec wrappingKeySpec,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(wrappingAlgorithm, 'wrappingAlgorithm');
    ArgumentError.checkNotNull(wrappingKeySpec, 'wrappingKeySpec');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GetParametersForImport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'WrappingAlgorithm': wrappingAlgorithm?.toValue() ?? '',
        'WrappingKeySpec': wrappingKeySpec?.toValue() ?? '',
      },
    );

    return GetParametersForImportResponse.fromJson(jsonResponse.body);
  }

  /// Returns the public key of an asymmetric CMK. Unlike the private key of a
  /// asymmetric CMK, which never leaves AWS KMS unencrypted, callers with
  /// <code>kms:GetPublicKey</code> permission can download the public key of an
  /// asymmetric CMK. You can share the public key to allow others to encrypt
  /// messages and verify signatures outside of AWS KMS. For information about
  /// symmetric and asymmetric CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric CMKs</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  ///
  /// You do not need to download the public key. Instead, you can use the
  /// public key within AWS KMS by calling the <a>Encrypt</a>, <a>ReEncrypt</a>,
  /// or <a>Verify</a> operations with the identifier of an asymmetric CMK. When
  /// you use the public key within AWS KMS, you benefit from the
  /// authentication, authorization, and logging that are part of every AWS KMS
  /// operation. You also reduce of risk of encrypting data that cannot be
  /// decrypted. These features are not effective outside of AWS KMS. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/download-public-key.html#download-public-key-considerations">Special
  /// Considerations for Downloading Public Keys</a>.
  ///
  /// To help you use the public key safely outside of AWS KMS,
  /// <code>GetPublicKey</code> returns important information about the public
  /// key in the response, including:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-CustomerMasterKeySpec">CustomerMasterKeySpec</a>:
  /// The type of key material in the public key, such as <code>RSA_4096</code>
  /// or <code>ECC_NIST_P521</code>.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeyUsage">KeyUsage</a>:
  /// Whether the key is used for encryption or signing.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-EncryptionAlgorithms">EncryptionAlgorithms</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-SigningAlgorithms">SigningAlgorithms</a>:
  /// A list of the encryption algorithms or the signing algorithms for the key.
  /// </li>
  /// </ul>
  /// Although AWS KMS cannot enforce these restrictions on external operations,
  /// it is crucial that you use this information to prevent the public key from
  /// being used improperly. For example, you can prevent a public signing key
  /// from being used encrypt data, or prevent a public key from being used with
  /// an encryption algorithm that is not supported by AWS KMS. You can also
  /// avoid errors, such as using the wrong signing algorithm in a verification
  /// operation.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetPublicKey</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>CreateKey</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [UnsupportedOperationException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// Identifies the asymmetric CMK that includes the public key.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  Future<GetPublicKeyResponse> getPublicKey({
    @_s.required String keyId,
    List<String> grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.GetPublicKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (grantTokens != null) 'GrantTokens': grantTokens,
      },
    );

    return GetPublicKeyResponse.fromJson(jsonResponse.body);
  }

  /// Imports key material into an existing symmetric AWS KMS customer master
  /// key (CMK) that was created without key material. After you successfully
  /// import key material into a CMK, you can <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#reimport-key-material">reimport
  /// the same key material</a> into that CMK, but you cannot import different
  /// key material.
  ///
  /// You cannot perform this operation on an asymmetric CMK or on any CMK in a
  /// different AWS account. For more information about creating CMKs with no
  /// key material and then importing key material, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Before using this operation, call <a>GetParametersForImport</a>. Its
  /// response includes a public key and an import token. Use the public key to
  /// encrypt the key material. Then, submit the import token from the same
  /// <code>GetParametersForImport</code> response.
  ///
  /// When calling this operation, you must specify the following values:
  ///
  /// <ul>
  /// <li>
  /// The key ID or key ARN of a CMK with no key material. Its
  /// <code>Origin</code> must be <code>EXTERNAL</code>.
  ///
  /// To create a CMK with no key material, call <a>CreateKey</a> and set the
  /// value of its <code>Origin</code> parameter to <code>EXTERNAL</code>. To
  /// get the <code>Origin</code> of a CMK, call <a>DescribeKey</a>.)
  /// </li>
  /// <li>
  /// The encrypted key material. To get the public key to encrypt the key
  /// material, call <a>GetParametersForImport</a>.
  /// </li>
  /// <li>
  /// The import token that <a>GetParametersForImport</a> returned. You must use
  /// a public key and token from the same <code>GetParametersForImport</code>
  /// response.
  /// </li>
  /// <li>
  /// Whether the key material expires and if so, when. If you set an expiration
  /// date, AWS KMS deletes the key material from the CMK on the specified date,
  /// and the CMK becomes unusable. To use the CMK again, you must reimport the
  /// same key material. The only way to change an expiration date is by
  /// reimporting the same key material and specifying a new expiration date.
  /// </li>
  /// </ul>
  /// When this operation is successful, the key state of the CMK changes from
  /// <code>PendingImport</code> to <code>Enabled</code>, and you can use the
  /// CMK.
  ///
  /// If this operation fails, use the exception to help determine the problem.
  /// If the error is related to the key material, the import token, or wrapping
  /// key, use <a>GetParametersForImport</a> to get a new public key and import
  /// token for the CMK and repeat the import procedure. For help, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#importing-keys-overview">How
  /// To Import Key Material</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ImportKeyMaterial</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>DeleteImportedKeyMaterial</a>
  /// </li>
  /// <li>
  /// <a>GetParametersForImport</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidArnException].
  /// May throw [UnsupportedOperationException].
  /// May throw [DependencyTimeoutException].
  /// May throw [NotFoundException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  /// May throw [InvalidCiphertextException].
  /// May throw [IncorrectKeyMaterialException].
  /// May throw [ExpiredImportTokenException].
  /// May throw [InvalidImportTokenException].
  ///
  /// Parameter [encryptedKeyMaterial] :
  /// The encrypted key material to import. The key material must be encrypted
  /// with the public wrapping key that <a>GetParametersForImport</a> returned,
  /// using the wrapping algorithm that you specified in the same
  /// <code>GetParametersForImport</code> request.
  ///
  /// Parameter [importToken] :
  /// The import token that you received in the response to a previous
  /// <a>GetParametersForImport</a> request. It must be from the same response
  /// that contained the public key that you used to encrypt the key material.
  ///
  /// Parameter [keyId] :
  /// The identifier of the symmetric CMK that receives the imported key
  /// material. The CMK's <code>Origin</code> must be <code>EXTERNAL</code>.
  /// This must be the same CMK specified in the <code>KeyID</code> parameter of
  /// the corresponding <a>GetParametersForImport</a> request.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [expirationModel] :
  /// Specifies whether the key material expires. The default is
  /// <code>KEY_MATERIAL_EXPIRES</code>, in which case you must include the
  /// <code>ValidTo</code> parameter. When this parameter is set to
  /// <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>, you must omit the
  /// <code>ValidTo</code> parameter.
  ///
  /// Parameter [validTo] :
  /// The time at which the imported key material expires. When the key material
  /// expires, AWS KMS deletes the key material and the CMK becomes unusable.
  /// You must omit this parameter when the <code>ExpirationModel</code>
  /// parameter is set to <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>. Otherwise
  /// it is required.
  Future<void> importKeyMaterial({
    @_s.required Uint8List encryptedKeyMaterial,
    @_s.required Uint8List importToken,
    @_s.required String keyId,
    ExpirationModelType expirationModel,
    DateTime validTo,
  }) async {
    ArgumentError.checkNotNull(encryptedKeyMaterial, 'encryptedKeyMaterial');
    ArgumentError.checkNotNull(importToken, 'importToken');
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ImportKeyMaterial'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EncryptedKeyMaterial': encryptedKeyMaterial?.let(base64Encode),
        'ImportToken': importToken?.let(base64Encode),
        'KeyId': keyId,
        if (expirationModel != null)
          'ExpirationModel': expirationModel.toValue(),
        if (validTo != null) 'ValidTo': unixTimestampToJson(validTo),
      },
    );

    return ImportKeyMaterialResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of aliases in the caller's AWS account and region. For more
  /// information about aliases, see <a>CreateAlias</a>.
  ///
  /// By default, the <code>ListAliases</code> operation returns all aliases in
  /// the account and region. To get only the aliases associated with a
  /// particular customer master key (CMK), use the <code>KeyId</code>
  /// parameter.
  ///
  /// The <code>ListAliases</code> response can include aliases that you created
  /// and associated with your customer managed CMKs, and aliases that AWS
  /// created and associated with AWS managed CMKs in your account. You can
  /// recognize AWS aliases because their names have the format
  /// <code>aws/&lt;service-name&gt;</code>, such as <code>aws/dynamodb</code>.
  ///
  /// The response might also include aliases that have no
  /// <code>TargetKeyId</code> field. These are predefined aliases that AWS has
  /// created but has not yet associated with a CMK. Aliases that AWS creates in
  /// your account, including predefined aliases, do not count against your <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#aliases-limit">AWS
  /// KMS aliases quota</a>.
  ///
  /// <b>Cross-account use</b>: No. <code>ListAliases</code> does not return
  /// aliases in other AWS accounts.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListAliases</a>
  /// (IAM policy)
  ///
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>UpdateAlias</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidMarkerException].
  /// May throw [KMSInternalException].
  /// May throw [InvalidArnException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [keyId] :
  /// Lists only aliases that are associated with the specified CMK. Enter a CMK
  /// in your AWS account.
  ///
  /// This parameter is optional. If you omit it, <code>ListAliases</code>
  /// returns all aliases in the account and Region.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, AWS KMS does not return more than the specified
  /// number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListAliasesResponse> listAliases({
    String keyId,
    int limit,
    String marker,
  }) async {
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ListAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (keyId != null) 'KeyId': keyId,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListAliasesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of all grants for the specified customer master key (CMK).
  /// <note>
  /// The <code>GranteePrincipal</code> field in the <code>ListGrants</code>
  /// response usually contains the user or role designated as the grantee
  /// principal in the grant. However, when the grantee principal in the grant
  /// is an AWS service, the <code>GranteePrincipal</code> field contains the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">service
  /// principal</a>, which might represent several different grantee principals.
  /// </note>
  /// <b>Cross-account use</b>: Yes. To perform this operation on a CMK in a
  /// different AWS account, specify the key ARN in the value of the
  /// <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListGrants</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGrant</a>
  /// </li>
  /// <li>
  /// <a>ListRetirableGrants</a>
  /// </li>
  /// <li>
  /// <a>RetireGrant</a>
  /// </li>
  /// <li>
  /// <a>RevokeGrant</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidMarkerException].
  /// May throw [InvalidArnException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, AWS KMS does not return more than the specified
  /// number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListGrantsResponse> listGrants({
    @_s.required String keyId,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ListGrants'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListGrantsResponse.fromJson(jsonResponse.body);
  }

  /// Gets the names of the key policies that are attached to a customer master
  /// key (CMK). This operation is designed to get policy names that you can use
  /// in a <a>GetKeyPolicy</a> operation. However, the only valid policy name is
  /// <code>default</code>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListKeyPolicies</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>GetKeyPolicy</a>
  /// </li>
  /// <li>
  /// <a>PutKeyPolicy</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, AWS KMS does not return more than the specified
  /// number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 1000, inclusive. If you do not include a value, it defaults to 100.
  ///
  /// Only one policy can be attached to a key.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListKeyPoliciesResponse> listKeyPolicies({
    @_s.required String keyId,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ListKeyPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListKeyPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of all customer master keys (CMKs) in the caller's AWS account
  /// and Region.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListKeys</a>
  /// (IAM policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateKey</a>
  /// </li>
  /// <li>
  /// <a>DescribeKey</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// <li>
  /// <a>ListResourceTags</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [InvalidMarkerException].
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, AWS KMS does not return more than the specified
  /// number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 1000, inclusive. If you do not include a value, it defaults to 100.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListKeysResponse> listKeys({
    int limit,
    String marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ListKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListKeysResponse.fromJson(jsonResponse.body);
  }

  /// Returns all tags on the specified customer master key (CMK).
  ///
  /// For general information about tags, including the format and syntax, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a> in the <i>Amazon Web Services General Reference</i>. For
  /// information about using tags in AWS KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// keys</a>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListResourceTags</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>TagResource</a>
  /// </li>
  /// <li>
  /// <a>UntagResource</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [KMSInternalException].
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidMarkerException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, AWS KMS does not return more than the specified
  /// number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 50, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  ///
  /// Do not attempt to construct this value. Use only the value of
  /// <code>NextMarker</code> from the truncated response you just received.
  Future<ListResourceTagsResponse> listResourceTags({
    @_s.required String keyId,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ListResourceTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListResourceTagsResponse.fromJson(jsonResponse.body);
  }

  /// Returns all grants in which the specified principal is the
  /// <code>RetiringPrincipal</code> in the grant.
  ///
  /// You can specify any principal in your AWS account. The grants that are
  /// returned include grants for CMKs in your AWS account and other AWS
  /// accounts.
  ///
  /// You might use this operation to determine which grants you may retire. To
  /// retire a grant, use the <a>RetireGrant</a> operation.
  ///
  /// <b>Cross-account use</b>: You must specify a principal in your AWS
  /// account. However, this operation can return grants in any AWS account. You
  /// do not need <code>kms:ListRetirableGrants</code> permission (or any other
  /// additional permission) in any AWS account other than your own.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListRetirableGrants</a>
  /// (IAM policy) in your AWS account.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGrant</a>
  /// </li>
  /// <li>
  /// <a>ListGrants</a>
  /// </li>
  /// <li>
  /// <a>RetireGrant</a>
  /// </li>
  /// <li>
  /// <a>RevokeGrant</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidMarkerException].
  /// May throw [InvalidArnException].
  /// May throw [NotFoundException].
  /// May throw [KMSInternalException].
  ///
  /// Parameter [retiringPrincipal] :
  /// The retiring principal for which to list grants. Enter a principal in your
  /// AWS account.
  ///
  /// To specify the retiring principal, use the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an AWS principal. Valid AWS principals include
  /// AWS accounts (root), IAM users, federated users, and assumed role users.
  /// For examples of the ARN syntax for specifying a principal, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS
  /// Identity and Access Management (IAM)</a> in the Example ARNs section of
  /// the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, AWS KMS does not return more than the specified
  /// number of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListGrantsResponse> listRetirableGrants({
    @_s.required String retiringPrincipal,
    int limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(retiringPrincipal, 'retiringPrincipal');
    _s.validateStringLength(
      'retiringPrincipal',
      retiringPrincipal,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'retiringPrincipal',
      retiringPrincipal,
      r'''^[\w+=,.@:/-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
    );
    _s.validateStringLength(
      'marker',
      marker,
      1,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[\u0020-\u00FF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ListRetirableGrants'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RetiringPrincipal': retiringPrincipal,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListGrantsResponse.fromJson(jsonResponse.body);
  }

  /// Attaches a key policy to the specified customer master key (CMK).
  ///
  /// For more information about key policies, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Key
  /// Policies</a> in the <i>AWS Key Management Service Developer Guide</i>. For
  /// help writing and formatting a JSON policy document, see the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM
  /// JSON Policy Reference</a> in the <i> <i>IAM User Guide</i> </i>. For
  /// examples of adding a key policy in multiple programming languages, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-key-policies.html#put-policy">Setting
  /// a key policy</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:PutKeyPolicy</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>GetKeyPolicy</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [DependencyTimeoutException].
  /// May throw [UnsupportedOperationException].
  /// May throw [KMSInternalException].
  /// May throw [LimitExceededException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [policy] :
  /// The key policy to attach to the CMK.
  ///
  /// The key policy must meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the
  /// key policy must allow the principal that is making the
  /// <code>PutKeyPolicy</code> request to make a subsequent
  /// <code>PutKeyPolicy</code> request on the CMK. This reduces the risk that
  /// the CMK becomes unmanageable. For more information, refer to the scenario
  /// in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section of the <i>AWS Key Management Service Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// Each statement in the key policy must contain one or more principals. The
  /// principals in the key policy must exist and be visible to AWS KMS. When
  /// you create a new AWS principal (for example, an IAM user or role), you
  /// might need to enforce a delay before including the new principal in a key
  /// policy because the new principal might not be immediately visible to AWS
  /// KMS. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes
  /// that I make are not always immediately visible</a> in the <i>AWS Identity
  /// and Access Management User Guide</i>.
  /// </li>
  /// </ul>
  /// The key policy cannot exceed 32 kilobytes (32768 bytes). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/resource-limits.html">Resource
  /// Quotas</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [policyName] :
  /// The name of the key policy. The only valid value is <code>default</code>.
  ///
  /// Parameter [bypassPolicyLockoutSafetyCheck] :
  /// A flag to indicate whether to bypass the key policy lockout safety check.
  /// <important>
  /// Setting this value to true increases the risk that the CMK becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  ///
  /// For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  /// </important>
  /// Use this parameter only when you intend to prevent the principal that is
  /// making the request from making a subsequent <code>PutKeyPolicy</code>
  /// request on the CMK.
  ///
  /// The default value is false.
  Future<void> putKeyPolicy({
    @_s.required String keyId,
    @_s.required String policy,
    @_s.required String policyName,
    bool bypassPolicyLockoutSafetyCheck,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      131072,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policy',
      policy,
      r'''[\u0009\u000A\u000D\u0020-\u00FF]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.PutKeyPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'Policy': policy,
        'PolicyName': policyName,
        if (bypassPolicyLockoutSafetyCheck != null)
          'BypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
      },
    );
  }

  /// Decrypts ciphertext and then reencrypts it entirely within AWS KMS. You
  /// can use this operation to change the customer master key (CMK) under which
  /// data is encrypted, such as when you <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-manually">manually
  /// rotate</a> a CMK or change the CMK that protects a ciphertext. You can
  /// also use it to reencrypt ciphertext under the same CMK, such as to change
  /// the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
  /// context</a> of a ciphertext.
  ///
  /// The <code>ReEncrypt</code> operation can decrypt ciphertext that was
  /// encrypted by using an AWS KMS CMK in an AWS KMS operation, such as
  /// <a>Encrypt</a> or <a>GenerateDataKey</a>. It can also decrypt ciphertext
  /// that was encrypted by using the public key of an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric
  /// CMK</a> outside of AWS KMS. However, it cannot decrypt ciphertext produced
  /// by other libraries, such as the <a
  /// href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">AWS
  /// Encryption SDK</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 client-side encryption</a>. These libraries return a ciphertext format
  /// that is incompatible with AWS KMS.
  ///
  /// When you use the <code>ReEncrypt</code> operation, you need to provide
  /// information for the decrypt operation and the subsequent encrypt
  /// operation.
  ///
  /// <ul>
  /// <li>
  /// If your ciphertext was encrypted under an asymmetric CMK, you must use the
  /// <code>SourceKeyId</code> parameter to identify the CMK that encrypted the
  /// ciphertext. You must also supply the encryption algorithm that was used.
  /// This information is required to decrypt the data.
  /// </li>
  /// <li>
  /// If your ciphertext was encrypted under a symmetric CMK, the
  /// <code>SourceKeyId</code> parameter is optional. AWS KMS can get this
  /// information from metadata that it adds to the symmetric ciphertext blob.
  /// This feature adds durability to your implementation by ensuring that
  /// authorized users can decrypt ciphertext decades after it was encrypted,
  /// even if they've lost track of the CMK ID. However, specifying the source
  /// CMK is always recommended as a best practice. When you use the
  /// <code>SourceKeyId</code> parameter to specify a CMK, AWS KMS uses only the
  /// CMK you specify. If the ciphertext was encrypted under a different CMK,
  /// the <code>ReEncrypt</code> operation fails. This practice ensures that you
  /// use the CMK that you intend.
  /// </li>
  /// <li>
  /// To reencrypt the data, you must use the <code>DestinationKeyId</code>
  /// parameter specify the CMK that re-encrypts the data after it is decrypted.
  /// You can select a symmetric or asymmetric CMK. If the destination CMK is an
  /// asymmetric CMK, you must also provide the encryption algorithm. The
  /// algorithm that you choose must be compatible with the CMK.
  /// <important>
  /// When you use an asymmetric CMK to encrypt or reencrypt data, be sure to
  /// record the CMK and encryption algorithm that you choose. You will be
  /// required to provide the same CMK and encryption algorithm when you decrypt
  /// the data. If the CMK and algorithm do not match the values used to encrypt
  /// the data, the decrypt operation fails.
  ///
  /// You are not required to supply the CMK ID and encryption algorithm when
  /// you decrypt with symmetric CMKs because AWS KMS stores this information in
  /// the ciphertext blob. AWS KMS cannot store metadata in ciphertext generated
  /// with asymmetric keys. The standard format for asymmetric key ciphertext
  /// does not include configurable fields.
  /// </important> </li>
  /// </ul>
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. The source CMK and destination CMK can be
  /// in different AWS accounts. Either or both CMKs can be in a different
  /// account than the caller.
  ///
  /// <b>Required permissions</b>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ReEncryptFrom</a>
  /// permission on the source CMK (key policy)
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ReEncryptTo</a>
  /// permission on the destination CMK (key policy)
  /// </li>
  /// </ul>
  /// To permit reencryption from or to a CMK, include the
  /// <code>"kms:ReEncrypt*"</code> permission in your <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">key
  /// policy</a>. This permission is automatically included in the key policy
  /// when you use the console to create a CMK. But you must include it manually
  /// when you create a CMK programmatically or when you use the
  /// <a>PutKeyPolicy</a> operation to set a key policy.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>Decrypt</a>
  /// </li>
  /// <li>
  /// <a>Encrypt</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKey</a>
  /// </li>
  /// <li>
  /// <a>GenerateDataKeyPair</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [InvalidCiphertextException].
  /// May throw [KeyUnavailableException].
  /// May throw [IncorrectKeyException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [ciphertextBlob] :
  /// Ciphertext of the data to reencrypt.
  ///
  /// Parameter [destinationKeyId] :
  /// A unique identifier for the CMK that is used to reencrypt the data.
  /// Specify a symmetric or asymmetric CMK with a <code>KeyUsage</code> value
  /// of <code>ENCRYPT_DECRYPT</code>. To find the <code>KeyUsage</code> value
  /// of a CMK, use the <a>DescribeKey</a> operation.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [destinationEncryptionAlgorithm] :
  /// Specifies the encryption algorithm that AWS KMS will use to reecrypt the
  /// data after it has decrypted it. The default value,
  /// <code>SYMMETRIC_DEFAULT</code>, represents the encryption algorithm used
  /// for symmetric CMKs.
  ///
  /// This parameter is required only when the destination CMK is an asymmetric
  /// CMK.
  ///
  /// Parameter [destinationEncryptionContext] :
  /// Specifies that encryption context to use when the reencrypting the data.
  ///
  /// A destination encryption context is valid only when the destination CMK is
  /// a symmetric CMK. The standard ciphertext format for asymmetric CMKs does
  /// not include fields for metadata.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [sourceEncryptionAlgorithm] :
  /// Specifies the encryption algorithm that AWS KMS will use to decrypt the
  /// ciphertext before it is reencrypted. The default value,
  /// <code>SYMMETRIC_DEFAULT</code>, represents the algorithm used for
  /// symmetric CMKs.
  ///
  /// Specify the same algorithm that was used to encrypt the ciphertext. If you
  /// specify a different algorithm, the decrypt attempt fails.
  ///
  /// This parameter is required only when the ciphertext was encrypted under an
  /// asymmetric CMK.
  ///
  /// Parameter [sourceEncryptionContext] :
  /// Specifies the encryption context to use to decrypt the ciphertext. Enter
  /// the same encryption context that was used to encrypt the ciphertext.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric CMK, but
  /// it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [sourceKeyId] :
  /// Specifies the customer master key (CMK) that AWS KMS will use to decrypt
  /// the ciphertext before it is re-encrypted. Enter a key ID of the CMK that
  /// was used to encrypt the ciphertext.
  ///
  /// This parameter is required only when the ciphertext was encrypted under an
  /// asymmetric CMK. If you used a symmetric CMK, AWS KMS can get the CMK from
  /// metadata that it adds to the symmetric ciphertext blob. However, it is
  /// always recommended as a best practice. This practice ensures that you use
  /// the CMK that you intend.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  Future<ReEncryptResponse> reEncrypt({
    @_s.required Uint8List ciphertextBlob,
    @_s.required String destinationKeyId,
    EncryptionAlgorithmSpec destinationEncryptionAlgorithm,
    Map<String, String> destinationEncryptionContext,
    List<String> grantTokens,
    EncryptionAlgorithmSpec sourceEncryptionAlgorithm,
    Map<String, String> sourceEncryptionContext,
    String sourceKeyId,
  }) async {
    ArgumentError.checkNotNull(ciphertextBlob, 'ciphertextBlob');
    ArgumentError.checkNotNull(destinationKeyId, 'destinationKeyId');
    _s.validateStringLength(
      'destinationKeyId',
      destinationKeyId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'sourceKeyId',
      sourceKeyId,
      1,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ReEncrypt'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CiphertextBlob': ciphertextBlob?.let(base64Encode),
        'DestinationKeyId': destinationKeyId,
        if (destinationEncryptionAlgorithm != null)
          'DestinationEncryptionAlgorithm':
              destinationEncryptionAlgorithm.toValue(),
        if (destinationEncryptionContext != null)
          'DestinationEncryptionContext': destinationEncryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (sourceEncryptionAlgorithm != null)
          'SourceEncryptionAlgorithm': sourceEncryptionAlgorithm.toValue(),
        if (sourceEncryptionContext != null)
          'SourceEncryptionContext': sourceEncryptionContext,
        if (sourceKeyId != null) 'SourceKeyId': sourceKeyId,
      },
    );

    return ReEncryptResponse.fromJson(jsonResponse.body);
  }

  /// Retires a grant. To clean up, you can retire a grant when you're done
  /// using it. You should revoke a grant when you intend to actively deny
  /// operations that depend on it. The following are permitted to call this
  /// API:
  ///
  /// <ul>
  /// <li>
  /// The AWS account (root user) under which the grant was created
  /// </li>
  /// <li>
  /// The <code>RetiringPrincipal</code>, if present in the grant
  /// </li>
  /// <li>
  /// The <code>GranteePrincipal</code>, if <code>RetireGrant</code> is an
  /// operation specified in the grant
  /// </li>
  /// </ul>
  /// You must identify the grant to retire by its grant token or by a
  /// combination of the grant ID and the Amazon Resource Name (ARN) of the
  /// customer master key (CMK). A grant token is a unique variable-length
  /// base64-encoded string. A grant ID is a 64 character unique identifier of a
  /// grant. The <a>CreateGrant</a> operation returns both.
  ///
  /// <b>Cross-account use</b>: Yes. You can retire a grant on a CMK in a
  /// different AWS account.
  ///
  /// <b>Required permissions:</b>: Permission to retire a grant is specified in
  /// the grant. You cannot control access to this operation in a policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using
  /// grants</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGrant</a>
  /// </li>
  /// <li>
  /// <a>ListGrants</a>
  /// </li>
  /// <li>
  /// <a>ListRetirableGrants</a>
  /// </li>
  /// <li>
  /// <a>RevokeGrant</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidArnException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [InvalidGrantIdException].
  /// May throw [NotFoundException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [grantId] :
  /// Unique identifier of the grant to retire. The grant ID is returned in the
  /// response to a <code>CreateGrant</code> operation.
  ///
  /// <ul>
  /// <li>
  /// Grant ID Example -
  /// 0123456789012345678901234567890123456789012345678901234567890123
  /// </li>
  /// </ul>
  ///
  /// Parameter [grantToken] :
  /// Token that identifies the grant to be retired.
  ///
  /// Parameter [keyId] :
  /// The Amazon Resource Name (ARN) of the CMK associated with the grant.
  ///
  /// For example:
  /// <code>arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  Future<void> retireGrant({
    String grantId,
    String grantToken,
    String keyId,
  }) async {
    _s.validateStringLength(
      'grantId',
      grantId,
      1,
      128,
    );
    _s.validateStringLength(
      'grantToken',
      grantToken,
      1,
      8192,
    );
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.RetireGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (grantId != null) 'GrantId': grantId,
        if (grantToken != null) 'GrantToken': grantToken,
        if (keyId != null) 'KeyId': keyId,
      },
    );
  }

  /// Revokes the specified grant for the specified customer master key (CMK).
  /// You can revoke a grant to actively deny operations that depend on it.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation on a CMK in a
  /// different AWS account, specify the key ARN in the value of the
  /// <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:RevokeGrant</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateGrant</a>
  /// </li>
  /// <li>
  /// <a>ListGrants</a>
  /// </li>
  /// <li>
  /// <a>ListRetirableGrants</a>
  /// </li>
  /// <li>
  /// <a>RetireGrant</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidArnException].
  /// May throw [InvalidGrantIdException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [grantId] :
  /// Identifier of the grant to be revoked.
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key associated with the grant.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK. To
  /// specify a CMK in a different AWS account, you must use the key ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> revokeGrant({
    @_s.required String grantId,
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(grantId, 'grantId');
    _s.validateStringLength(
      'grantId',
      grantId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.RevokeGrant'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GrantId': grantId,
        'KeyId': keyId,
      },
    );
  }

  /// Schedules the deletion of a customer master key (CMK). You may provide a
  /// waiting period, specified in days, before deletion occurs. If you do not
  /// provide a waiting period, the default period of 30 days is used. When this
  /// operation is successful, the key state of the CMK changes to
  /// <code>PendingDeletion</code>. Before the waiting period ends, you can use
  /// <a>CancelKeyDeletion</a> to cancel the deletion of the CMK. After the
  /// waiting period ends, AWS KMS deletes the CMK and all AWS KMS data
  /// associated with it, including all aliases that refer to it.
  /// <important>
  /// Deleting a CMK is a destructive and potentially dangerous operation. When
  /// a CMK is deleted, all data that was encrypted under the CMK is
  /// unrecoverable. To prevent the use of a CMK without deleting it, use
  /// <a>DisableKey</a>.
  /// </important>
  /// If you schedule deletion of a CMK from a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, when the waiting period expires,
  /// <code>ScheduleKeyDeletion</code> deletes the CMK from AWS KMS. Then AWS
  /// KMS makes a best effort to delete the key material from the associated AWS
  /// CloudHSM cluster. However, you might need to manually <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key">delete
  /// the orphaned key material</a> from the cluster and its backups.
  ///
  /// For more information about scheduling a CMK for deletion, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting
  /// Customer Master Keys</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ScheduleKeyDeletion</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CancelKeyDeletion</a>
  /// </li>
  /// <li>
  /// <a>DisableKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// The unique identifier of the customer master key (CMK) to delete.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [pendingWindowInDays] :
  /// The waiting period, specified in number of days. After the waiting period
  /// ends, AWS KMS deletes the customer master key (CMK).
  ///
  /// This value is optional. If you include a value, it must be between 7 and
  /// 30, inclusive. If you do not include a value, it defaults to 30.
  Future<ScheduleKeyDeletionResponse> scheduleKeyDeletion({
    @_s.required String keyId,
    int pendingWindowInDays,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'pendingWindowInDays',
      pendingWindowInDays,
      1,
      365,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ScheduleKeyDeletion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        if (pendingWindowInDays != null)
          'PendingWindowInDays': pendingWindowInDays,
      },
    );

    return ScheduleKeyDeletionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a <a
  /// href="https://en.wikipedia.org/wiki/Digital_signature">digital
  /// signature</a> for a message or message digest by using the private key in
  /// an asymmetric CMK. To verify the signature, use the <a>Verify</a>
  /// operation, or use the public key in the same asymmetric CMK outside of AWS
  /// KMS. For information about symmetric and asymmetric CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric CMKs</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  ///
  /// Digital signatures are generated and verified by using asymmetric key
  /// pair, such as an RSA or ECC pair that is represented by an asymmetric
  /// customer master key (CMK). The key owner (or an authorized user) uses
  /// their private key to sign a message. Anyone with the public key can verify
  /// that the message was signed with that particular private key and that the
  /// message hasn't changed since it was signed.
  ///
  /// To use the <code>Sign</code> operation, provide the following information:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>KeyId</code> parameter to identify an asymmetric CMK with a
  /// <code>KeyUsage</code> value of <code>SIGN_VERIFY</code>. To get the
  /// <code>KeyUsage</code> value of a CMK, use the <a>DescribeKey</a>
  /// operation. The caller must have <code>kms:Sign</code> permission on the
  /// CMK.
  /// </li>
  /// <li>
  /// Use the <code>Message</code> parameter to specify the message or message
  /// digest to sign. You can submit messages of up to 4096 bytes. To sign a
  /// larger message, generate a hash digest of the message, and then provide
  /// the hash digest in the <code>Message</code> parameter. To indicate whether
  /// the message is a full message or a digest, use the
  /// <code>MessageType</code> parameter.
  /// </li>
  /// <li>
  /// Choose a signing algorithm that is compatible with the CMK.
  /// </li>
  /// </ul> <important>
  /// When signing a message, be sure to record the CMK and the signing
  /// algorithm. This information is required to verify the signature.
  /// </important>
  /// To verify the signature that this operation generates, use the
  /// <a>Verify</a> operation. Or use the <a>GetPublicKey</a> operation to
  /// download the public key and then use the public key to verify the
  /// signature outside of AWS KMS.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Sign</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>Verify</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// Identifies an asymmetric CMK. AWS KMS uses the private key in the
  /// asymmetric CMK to sign the message. The <code>KeyUsage</code> type of the
  /// CMK must be <code>SIGN_VERIFY</code>. To find the <code>KeyUsage</code> of
  /// a CMK, use the <a>DescribeKey</a> operation.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [message] :
  /// Specifies the message or message digest to sign. Messages can be 0-4096
  /// bytes. To sign a larger message, provide the message digest.
  ///
  /// If you provide a message, AWS KMS generates a hash digest of the message
  /// and then signs it.
  ///
  /// Parameter [signingAlgorithm] :
  /// Specifies the signing algorithm to use when signing the message.
  ///
  /// Choose an algorithm that is compatible with the type and size of the
  /// specified asymmetric CMK.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [messageType] :
  /// Tells AWS KMS whether the value of the <code>Message</code> parameter is a
  /// message or message digest. The default value, RAW, indicates a message. To
  /// indicate a message digest, enter <code>DIGEST</code>.
  Future<SignResponse> sign({
    @_s.required String keyId,
    @_s.required Uint8List message,
    @_s.required SigningAlgorithmSpec signingAlgorithm,
    List<String> grantTokens,
    MessageType messageType,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(message, 'message');
    ArgumentError.checkNotNull(signingAlgorithm, 'signingAlgorithm');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.Sign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'Message': message?.let(base64Encode),
        'SigningAlgorithm': signingAlgorithm?.toValue() ?? '',
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (messageType != null) 'MessageType': messageType.toValue(),
      },
    );

    return SignResponse.fromJson(jsonResponse.body);
  }

  /// Adds or edits tags on a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed CMK</a>.
  ///
  /// Each tag consists of a tag key and a tag value, both of which are
  /// case-sensitive strings. The tag value can be an empty (null) string.
  ///
  /// To add a tag, specify a new tag key and a tag value. To edit a tag,
  /// specify an existing tag key and a new tag value.
  ///
  /// You can use this operation to tag a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed CMK</a>, but you cannot tag an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">AWS
  /// managed CMK</a>, an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">AWS
  /// owned CMK</a>, or an alias.
  ///
  /// For general information about tags, including the format and syntax, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a> in the <i>Amazon Web Services General Reference</i>. For
  /// information about using tags in AWS KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// keys</a>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>UntagResource</a>
  /// </li>
  /// <li>
  /// <a>ListResourceTags</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [KMSInternalException].
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [KMSInvalidStateException].
  /// May throw [LimitExceededException].
  /// May throw [TagException].
  ///
  /// Parameter [keyId] :
  /// Identifies a customer managed CMK in the account and Region.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  ///
  /// Each tag consists of a tag key and a tag value. The tag value can be an
  /// empty (null) string.
  ///
  /// You cannot have more than one tag on a CMK with the same tag key. If you
  /// specify an existing tag key with a different tag value, AWS KMS replaces
  /// the current tag value with the specified one.
  Future<void> tagResource({
    @_s.required String keyId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'Tags': tags,
      },
    );
  }

  /// Deletes tags from a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed CMK</a>. To delete a tag, specify the tag key and the CMK.
  ///
  /// When it succeeds, the <code>UntagResource</code> operation doesn't return
  /// any output. Also, if the specified tag key isn't found on the CMK, it
  /// doesn't throw an exception or return a response. To confirm that the
  /// operation worked, use the <a>ListResourceTags</a> operation.
  ///
  /// For general information about tags, including the format and syntax, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a> in the <i>Amazon Web Services General Reference</i>. For
  /// information about using tags in AWS KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// keys</a>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UntagResource</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>TagResource</a>
  /// </li>
  /// <li>
  /// <a>ListResourceTags</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [KMSInternalException].
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [KMSInvalidStateException].
  /// May throw [TagException].
  ///
  /// Parameter [keyId] :
  /// Identifies the CMK from which you are removing tags.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [tagKeys] :
  /// One or more tag keys. Specify only the tag keys, not the tag values.
  Future<void> untagResource({
    @_s.required String keyId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Associates an existing AWS KMS alias with a different customer master key
  /// (CMK). Each alias is associated with only one CMK at a time, although a
  /// CMK can have multiple aliases. The alias and the CMK must be in the same
  /// AWS account and region.
  ///
  /// The current and new CMK must be the same type (both symmetric or both
  /// asymmetric), and they must have the same key usage
  /// (<code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>). This
  /// restriction prevents errors in code that uses aliases. If you must assign
  /// an alias to a different type of CMK, use <a>DeleteAlias</a> to delete the
  /// old alias and <a>CreateAlias</a> to create a new alias.
  ///
  /// You cannot use <code>UpdateAlias</code> to change an alias name. To change
  /// an alias name, use <a>DeleteAlias</a> to delete the old alias and
  /// <a>CreateAlias</a> to create a new alias.
  ///
  /// Because an alias is not a property of a CMK, you can create, update, and
  /// delete the aliases of a CMK without affecting the CMK. Also, aliases do
  /// not appear in the response from the <a>DescribeKey</a> operation. To get
  /// the aliases of all CMKs in the account, use the <a>ListAliases</a>
  /// operation.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateAlias</a>
  /// on the alias (IAM policy).
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateAlias</a>
  /// on the current CMK (key policy).
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateAlias</a>
  /// on the new CMK (key policy).
  /// </li>
  /// </ul>
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateAlias</a>
  /// </li>
  /// <li>
  /// <a>DeleteAlias</a>
  /// </li>
  /// <li>
  /// <a>ListAliases</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [DependencyTimeoutException].
  /// May throw [NotFoundException].
  /// May throw [KMSInternalException].
  /// May throw [LimitExceededException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [aliasName] :
  /// Identifies the alias that is changing its CMK. This value must begin with
  /// <code>alias/</code> followed by the alias name, such as
  /// <code>alias/ExampleAlias</code>. You cannot use UpdateAlias to change the
  /// alias name.
  ///
  /// Parameter [targetKeyId] :
  /// Identifies the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed CMK</a> to associate with the alias. You don't have permission to
  /// associate an alias with an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">AWS
  /// managed CMK</a>.
  ///
  /// The CMK must be in the same AWS account and Region as the alias. Also, the
  /// new target CMK must be the same type as the current target CMK (both
  /// symmetric or both asymmetric) and they must have the same key usage.
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// To verify that the alias is mapped to the correct CMK, use
  /// <a>ListAliases</a>.
  Future<void> updateAlias({
    @_s.required String aliasName,
    @_s.required String targetKeyId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    _s.validateStringLength(
      'aliasName',
      aliasName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'aliasName',
      aliasName,
      r'''^[a-zA-Z0-9:/_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetKeyId, 'targetKeyId');
    _s.validateStringLength(
      'targetKeyId',
      targetKeyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UpdateAlias'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AliasName': aliasName,
        'TargetKeyId': targetKeyId,
      },
    );
  }

  /// Changes the properties of a custom key store. Use the
  /// <code>CustomKeyStoreId</code> parameter to identify the custom key store
  /// you want to edit. Use the remaining parameters to change the properties of
  /// the custom key store.
  ///
  /// You can only update a custom key store that is disconnected. To disconnect
  /// the custom key store, use <a>DisconnectCustomKeyStore</a>. To reconnect
  /// the custom key store after the update completes, use
  /// <a>ConnectCustomKeyStore</a>. To find the connection state of a custom key
  /// store, use the <a>DescribeCustomKeyStores</a> operation.
  ///
  /// Use the parameters of <code>UpdateCustomKeyStore</code> to edit your
  /// keystore settings.
  ///
  /// <ul>
  /// <li>
  /// Use the <b>NewCustomKeyStoreName</b> parameter to change the friendly name
  /// of the custom key store to the value that you specify.
  ///
  ///
  /// </li>
  /// <li>
  /// Use the <b>KeyStorePassword</b> parameter tell AWS KMS the current
  /// password of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
  /// <code>kmsuser</code> crypto user (CU)</a> in the associated AWS CloudHSM
  /// cluster. You can use this parameter to <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-password">fix
  /// connection failures</a> that occur when AWS KMS cannot log into the
  /// associated cluster because the <code>kmsuser</code> password has changed.
  /// This value does not change the password in the AWS CloudHSM cluster.
  ///
  ///
  /// </li>
  /// <li>
  /// Use the <b>CloudHsmClusterId</b> parameter to associate the custom key
  /// store with a different, but related, AWS CloudHSM cluster. You can use
  /// this parameter to repair a custom key store if its AWS CloudHSM cluster
  /// becomes corrupted or is deleted, or when you need to create or restore a
  /// cluster from a backup.
  /// </li>
  /// </ul>
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in AWS KMS, which combines the convenience
  /// and extensive integration of AWS KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateCustomKeyStore</a>
  /// (IAM policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ConnectCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>CreateCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DeleteCustomKeyStore</a>
  /// </li>
  /// <li>
  /// <a>DescribeCustomKeyStores</a>
  /// </li>
  /// <li>
  /// <a>DisconnectCustomKeyStore</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [CustomKeyStoreNotFoundException].
  /// May throw [CustomKeyStoreNameInUseException].
  /// May throw [CloudHsmClusterNotFoundException].
  /// May throw [CloudHsmClusterNotRelatedException].
  /// May throw [CustomKeyStoreInvalidStateException].
  /// May throw [KMSInternalException].
  /// May throw [CloudHsmClusterNotActiveException].
  /// May throw [CloudHsmClusterInvalidConfigurationException].
  ///
  /// Parameter [customKeyStoreId] :
  /// Identifies the custom key store that you want to update. Enter the ID of
  /// the custom key store. To find the ID of a custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  ///
  /// Parameter [cloudHsmClusterId] :
  /// Associates the custom key store with a related AWS CloudHSM cluster.
  ///
  /// Enter the cluster ID of the cluster that you used to create the custom key
  /// store or a cluster that shares a backup history and has the same cluster
  /// certificate as the original cluster. You cannot use this parameter to
  /// associate a custom key store with an unrelated cluster. In addition, the
  /// replacement cluster must <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore">fulfill
  /// the requirements</a> for a cluster associated with a custom key store. To
  /// view the cluster certificate of a cluster, use the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters</a>
  /// operation.
  ///
  /// Parameter [keyStorePassword] :
  /// Enter the current password of the <code>kmsuser</code> crypto user (CU) in
  /// the AWS CloudHSM cluster that is associated with the custom key store.
  ///
  /// This parameter tells AWS KMS the current password of the
  /// <code>kmsuser</code> crypto user (CU). It does not set or change the
  /// password of any users in the AWS CloudHSM cluster.
  ///
  /// Parameter [newCustomKeyStoreName] :
  /// Changes the friendly name of the custom key store to the value that you
  /// specify. The custom key store name must be unique in the AWS account.
  Future<void> updateCustomKeyStore({
    @_s.required String customKeyStoreId,
    String cloudHsmClusterId,
    String keyStorePassword,
    String newCustomKeyStoreName,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    _s.validateStringLength(
      'customKeyStoreId',
      customKeyStoreId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'cloudHsmClusterId',
      cloudHsmClusterId,
      19,
      24,
    );
    _s.validateStringLength(
      'keyStorePassword',
      keyStorePassword,
      7,
      32,
    );
    _s.validateStringLength(
      'newCustomKeyStoreName',
      newCustomKeyStoreName,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UpdateCustomKeyStore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomKeyStoreId': customKeyStoreId,
        if (cloudHsmClusterId != null) 'CloudHsmClusterId': cloudHsmClusterId,
        if (keyStorePassword != null) 'KeyStorePassword': keyStorePassword,
        if (newCustomKeyStoreName != null)
          'NewCustomKeyStoreName': newCustomKeyStoreName,
      },
    );

    return UpdateCustomKeyStoreResponse.fromJson(jsonResponse.body);
  }

  /// Updates the description of a customer master key (CMK). To see the
  /// description of a CMK, use <a>DescribeKey</a>.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a CMK
  /// in a different AWS account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateKeyDescription</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateKey</a>
  /// </li>
  /// <li>
  /// <a>DescribeKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidArnException].
  /// May throw [DependencyTimeoutException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [description] :
  /// New description for the CMK.
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the customer master key (CMK).
  ///
  /// Specify the key ID or the Amazon Resource Name (ARN) of the CMK.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> updateKeyDescription({
    @_s.required String description,
    @_s.required String keyId,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      8192,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UpdateKeyDescription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'KeyId': keyId,
      },
    );
  }

  /// Verifies a digital signature that was generated by the <a>Sign</a>
  /// operation.
  /// <p/>
  /// Verification confirms that an authorized user signed the message with the
  /// specified CMK and signing algorithm, and the message hasn't changed since
  /// it was signed. If the signature is verified, the value of the
  /// <code>SignatureValid</code> field in the response is <code>True</code>. If
  /// the signature verification fails, the <code>Verify</code> operation fails
  /// with an <code>KMSInvalidSignatureException</code> exception.
  ///
  /// A digital signature is generated by using the private key in an asymmetric
  /// CMK. The signature is verified by using the public key in the same
  /// asymmetric CMK. For information about symmetric and asymmetric CMKs, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric CMKs</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  ///
  /// To verify a digital signature, you can use the <code>Verify</code>
  /// operation. Specify the same asymmetric CMK, message, and signing algorithm
  /// that were used to produce the signature.
  ///
  /// You can also verify the digital signature by using the public key of the
  /// CMK outside of AWS KMS. Use the <a>GetPublicKey</a> operation to download
  /// the public key in the asymmetric CMK and then use the public key to verify
  /// the signature outside of AWS KMS. The advantage of using the
  /// <code>Verify</code> operation is that it is performed within AWS KMS. As a
  /// result, it's easy to call, the operation is performed within the FIPS
  /// boundary, it is logged in AWS CloudTrail, and you can use key policy and
  /// IAM policy to determine who is authorized to use the CMK to verify
  /// signatures.
  ///
  /// The CMK that you use for this operation must be in a compatible key state.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">How
  /// Key State Affects Use of a Customer Master Key</a> in the <i>AWS Key
  /// Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a CMK in a
  /// different AWS account, specify the key ARN or alias ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Verify</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>: <a>Sign</a>
  ///
  /// May throw [NotFoundException].
  /// May throw [DisabledException].
  /// May throw [KeyUnavailableException].
  /// May throw [DependencyTimeoutException].
  /// May throw [InvalidKeyUsageException].
  /// May throw [InvalidGrantTokenException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSInvalidSignatureException].
  ///
  /// Parameter [keyId] :
  /// Identifies the asymmetric CMK that will be used to verify the signature.
  /// This must be the same CMK that was used to generate the signature. If you
  /// specify a different CMK, the signature verification fails.
  ///
  /// To specify a CMK, use its key ID, Amazon Resource Name (ARN), alias name,
  /// or alias ARN. When using an alias name, prefix it with
  /// <code>"alias/"</code>. To specify a CMK in a different AWS account, you
  /// must use the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a CMK, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [message] :
  /// Specifies the message that was signed. You can submit a raw message of up
  /// to 4096 bytes, or a hash digest of the message. If you submit a digest,
  /// use the <code>MessageType</code> parameter with a value of
  /// <code>DIGEST</code>.
  ///
  /// If the message specified here is different from the message that was
  /// signed, the signature verification fails. A message and its hash digest
  /// are considered to be the same message.
  ///
  /// Parameter [signature] :
  /// The signature that the <code>Sign</code> operation generated.
  ///
  /// Parameter [signingAlgorithm] :
  /// The signing algorithm that was used to sign the message. If you submit a
  /// different algorithm, the signature verification fails.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  ///
  /// Parameter [messageType] :
  /// Tells AWS KMS whether the value of the <code>Message</code> parameter is a
  /// message or message digest. The default value, RAW, indicates a message. To
  /// indicate a message digest, enter <code>DIGEST</code>.
  /// <important>
  /// Use the <code>DIGEST</code> value only when the value of the
  /// <code>Message</code> parameter is a message digest. If you use the
  /// <code>DIGEST</code> value with a raw message, the security of the
  /// verification operation can be compromised.
  /// </important>
  Future<VerifyResponse> verify({
    @_s.required String keyId,
    @_s.required Uint8List message,
    @_s.required Uint8List signature,
    @_s.required SigningAlgorithmSpec signingAlgorithm,
    List<String> grantTokens,
    MessageType messageType,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(message, 'message');
    ArgumentError.checkNotNull(signature, 'signature');
    ArgumentError.checkNotNull(signingAlgorithm, 'signingAlgorithm');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.Verify'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'Message': message?.let(base64Encode),
        'Signature': signature?.let(base64Encode),
        'SigningAlgorithm': signingAlgorithm?.toValue() ?? '',
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (messageType != null) 'MessageType': messageType.toValue(),
      },
    );

    return VerifyResponse.fromJson(jsonResponse.body);
  }
}

enum AlgorithmSpec {
  @_s.JsonValue('RSAES_PKCS1_V1_5')
  rsaesPkcs1V1_5,
  @_s.JsonValue('RSAES_OAEP_SHA_1')
  rsaesOaepSha_1,
  @_s.JsonValue('RSAES_OAEP_SHA_256')
  rsaesOaepSha_256,
}

extension on AlgorithmSpec {
  String toValue() {
    switch (this) {
      case AlgorithmSpec.rsaesPkcs1V1_5:
        return 'RSAES_PKCS1_V1_5';
      case AlgorithmSpec.rsaesOaepSha_1:
        return 'RSAES_OAEP_SHA_1';
      case AlgorithmSpec.rsaesOaepSha_256:
        return 'RSAES_OAEP_SHA_256';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about an alias.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AliasListEntry {
  /// String that contains the key ARN.
  @_s.JsonKey(name: 'AliasArn')
  final String aliasArn;

  /// String that contains the alias. This value begins with <code>alias/</code>.
  @_s.JsonKey(name: 'AliasName')
  final String aliasName;

  /// Date and time that the alias was most recently created in the account and
  /// Region. Formatted as Unix time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// Date and time that the alias was most recently associated with a CMK in the
  /// account and Region. Formatted as Unix time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// String that contains the key identifier of the CMK associated with the
  /// alias.
  @_s.JsonKey(name: 'TargetKeyId')
  final String targetKeyId;

  AliasListEntry({
    this.aliasArn,
    this.aliasName,
    this.creationDate,
    this.lastUpdatedDate,
    this.targetKeyId,
  });
  factory AliasListEntry.fromJson(Map<String, dynamic> json) =>
      _$AliasListEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelKeyDeletionResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK whose deletion is canceled.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  CancelKeyDeletionResponse({
    this.keyId,
  });
  factory CancelKeyDeletionResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelKeyDeletionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectCustomKeyStoreResponse {
  ConnectCustomKeyStoreResponse();
  factory ConnectCustomKeyStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectCustomKeyStoreResponseFromJson(json);
}

enum ConnectionErrorCodeType {
  @_s.JsonValue('INVALID_CREDENTIALS')
  invalidCredentials,
  @_s.JsonValue('CLUSTER_NOT_FOUND')
  clusterNotFound,
  @_s.JsonValue('NETWORK_ERRORS')
  networkErrors,
  @_s.JsonValue('INTERNAL_ERROR')
  internalError,
  @_s.JsonValue('INSUFFICIENT_CLOUDHSM_HSMS')
  insufficientCloudhsmHsms,
  @_s.JsonValue('USER_LOCKED_OUT')
  userLockedOut,
  @_s.JsonValue('USER_NOT_FOUND')
  userNotFound,
  @_s.JsonValue('USER_LOGGED_IN')
  userLoggedIn,
  @_s.JsonValue('SUBNET_NOT_FOUND')
  subnetNotFound,
}

enum ConnectionStateType {
  @_s.JsonValue('CONNECTED')
  connected,
  @_s.JsonValue('CONNECTING')
  connecting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DISCONNECTED')
  disconnected,
  @_s.JsonValue('DISCONNECTING')
  disconnecting,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCustomKeyStoreResponse {
  /// A unique identifier for the new custom key store.
  @_s.JsonKey(name: 'CustomKeyStoreId')
  final String customKeyStoreId;

  CreateCustomKeyStoreResponse({
    this.customKeyStoreId,
  });
  factory CreateCustomKeyStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomKeyStoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGrantResponse {
  /// The unique identifier for the grant.
  ///
  /// You can use the <code>GrantId</code> in a subsequent <a>RetireGrant</a> or
  /// <a>RevokeGrant</a> operation.
  @_s.JsonKey(name: 'GrantId')
  final String grantId;

  /// The grant token.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#grant_token">Grant
  /// Tokens</a> in the <i>AWS Key Management Service Developer Guide</i>.
  @_s.JsonKey(name: 'GrantToken')
  final String grantToken;

  CreateGrantResponse({
    this.grantId,
    this.grantToken,
  });
  factory CreateGrantResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGrantResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateKeyResponse {
  /// Metadata associated with the CMK.
  @_s.JsonKey(name: 'KeyMetadata')
  final KeyMetadata keyMetadata;

  CreateKeyResponse({
    this.keyMetadata,
  });
  factory CreateKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateKeyResponseFromJson(json);
}

/// Contains information about each custom key store in the custom key store
/// list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomKeyStoresListEntry {
  /// A unique identifier for the AWS CloudHSM cluster that is associated with the
  /// custom key store.
  @_s.JsonKey(name: 'CloudHsmClusterId')
  final String cloudHsmClusterId;

  /// Describes the connection error. This field appears in the response only when
  /// the <code>ConnectionState</code> is <code>FAILED</code>. For help resolving
  /// these errors, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed">How
  /// to Fix a Connection Failure</a> in <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>CLUSTER_NOT_FOUND</code> - AWS KMS cannot find the AWS CloudHSM
  /// cluster with the specified cluster ID.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_CLOUDHSM_HSMS</code> - The associated AWS CloudHSM
  /// cluster does not contain any active HSMs. To connect a custom key store to
  /// its AWS CloudHSM cluster, the cluster must contain at least one active HSM.
  /// </li>
  /// <li>
  /// <code>INTERNAL_ERROR</code> - AWS KMS could not complete the request due to
  /// an internal error. Retry the request. For <code>ConnectCustomKeyStore</code>
  /// requests, disconnect the custom key store before trying to connect again.
  /// </li>
  /// <li>
  /// <code>INVALID_CREDENTIALS</code> - AWS KMS does not have the correct
  /// password for the <code>kmsuser</code> crypto user in the AWS CloudHSM
  /// cluster. Before you can connect your custom key store to its AWS CloudHSM
  /// cluster, you must change the <code>kmsuser</code> account password and
  /// update the key store password value for the custom key store.
  /// </li>
  /// <li>
  /// <code>NETWORK_ERRORS</code> - Network errors are preventing AWS KMS from
  /// connecting to the custom key store.
  /// </li>
  /// <li>
  /// <code>SUBNET_NOT_FOUND</code> - A subnet in the AWS CloudHSM cluster
  /// configuration was deleted. If AWS KMS cannot find all of the subnets in the
  /// cluster configuration, attempts to connect the custom key store to the AWS
  /// CloudHSM cluster fail. To fix this error, create a cluster from a recent
  /// backup and associate it with your custom key store. (This process creates a
  /// new cluster configuration with a VPC and private subnets.) For details, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed">How
  /// to Fix a Connection Failure</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>USER_LOCKED_OUT</code> - The <code>kmsuser</code> CU account is locked
  /// out of the associated AWS CloudHSM cluster due to too many failed password
  /// attempts. Before you can connect your custom key store to its AWS CloudHSM
  /// cluster, you must change the <code>kmsuser</code> account password and
  /// update the key store password value for the custom key store.
  /// </li>
  /// <li>
  /// <code>USER_LOGGED_IN</code> - The <code>kmsuser</code> CU account is logged
  /// into the the associated AWS CloudHSM cluster. This prevents AWS KMS from
  /// rotating the <code>kmsuser</code> account password and logging into the
  /// cluster. Before you can connect your custom key store to its AWS CloudHSM
  /// cluster, you must log the <code>kmsuser</code> CU out of the cluster. If you
  /// changed the <code>kmsuser</code> password to log into the cluster, you must
  /// also and update the key store password value for the custom key store. For
  /// help, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#login-kmsuser-2">How
  /// to Log Out and Reconnect</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>USER_NOT_FOUND</code> - AWS KMS cannot find a <code>kmsuser</code> CU
  /// account in the associated AWS CloudHSM cluster. Before you can connect your
  /// custom key store to its AWS CloudHSM cluster, you must create a
  /// <code>kmsuser</code> CU account in the cluster, and then update the key
  /// store password value for the custom key store.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ConnectionErrorCode')
  final ConnectionErrorCodeType connectionErrorCode;

  /// Indicates whether the custom key store is connected to its AWS CloudHSM
  /// cluster.
  ///
  /// You can create and use CMKs in your custom key stores only when its
  /// connection state is <code>CONNECTED</code>.
  ///
  /// The value is <code>DISCONNECTED</code> if the key store has never been
  /// connected or you use the <a>DisconnectCustomKeyStore</a> operation to
  /// disconnect it. If the value is <code>CONNECTED</code> but you are having
  /// trouble using the custom key store, make sure that its associated AWS
  /// CloudHSM cluster is active and contains at least one active HSM.
  ///
  /// A value of <code>FAILED</code> indicates that an attempt to connect was
  /// unsuccessful. The <code>ConnectionErrorCode</code> field in the response
  /// indicates the cause of the failure. For help resolving a connection failure,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting
  /// a Custom Key Store</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'ConnectionState')
  final ConnectionStateType connectionState;

  /// The date and time when the custom key store was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// A unique identifier for the custom key store.
  @_s.JsonKey(name: 'CustomKeyStoreId')
  final String customKeyStoreId;

  /// The user-specified friendly name for the custom key store.
  @_s.JsonKey(name: 'CustomKeyStoreName')
  final String customKeyStoreName;

  /// The trust anchor certificate of the associated AWS CloudHSM cluster. When
  /// you <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr">initialize
  /// the cluster</a>, you create this certificate and save it in the
  /// <code>customerCA.crt</code> file.
  @_s.JsonKey(name: 'TrustAnchorCertificate')
  final String trustAnchorCertificate;

  CustomKeyStoresListEntry({
    this.cloudHsmClusterId,
    this.connectionErrorCode,
    this.connectionState,
    this.creationDate,
    this.customKeyStoreId,
    this.customKeyStoreName,
    this.trustAnchorCertificate,
  });
  factory CustomKeyStoresListEntry.fromJson(Map<String, dynamic> json) =>
      _$CustomKeyStoresListEntryFromJson(json);
}

enum CustomerMasterKeySpec {
  @_s.JsonValue('RSA_2048')
  rsa_2048,
  @_s.JsonValue('RSA_3072')
  rsa_3072,
  @_s.JsonValue('RSA_4096')
  rsa_4096,
  @_s.JsonValue('ECC_NIST_P256')
  eccNistP256,
  @_s.JsonValue('ECC_NIST_P384')
  eccNistP384,
  @_s.JsonValue('ECC_NIST_P521')
  eccNistP521,
  @_s.JsonValue('ECC_SECG_P256K1')
  eccSecgP256k1,
  @_s.JsonValue('SYMMETRIC_DEFAULT')
  symmetricDefault,
}

extension on CustomerMasterKeySpec {
  String toValue() {
    switch (this) {
      case CustomerMasterKeySpec.rsa_2048:
        return 'RSA_2048';
      case CustomerMasterKeySpec.rsa_3072:
        return 'RSA_3072';
      case CustomerMasterKeySpec.rsa_4096:
        return 'RSA_4096';
      case CustomerMasterKeySpec.eccNistP256:
        return 'ECC_NIST_P256';
      case CustomerMasterKeySpec.eccNistP384:
        return 'ECC_NIST_P384';
      case CustomerMasterKeySpec.eccNistP521:
        return 'ECC_NIST_P521';
      case CustomerMasterKeySpec.eccSecgP256k1:
        return 'ECC_SECG_P256K1';
      case CustomerMasterKeySpec.symmetricDefault:
        return 'SYMMETRIC_DEFAULT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DataKeyPairSpec {
  @_s.JsonValue('RSA_2048')
  rsa_2048,
  @_s.JsonValue('RSA_3072')
  rsa_3072,
  @_s.JsonValue('RSA_4096')
  rsa_4096,
  @_s.JsonValue('ECC_NIST_P256')
  eccNistP256,
  @_s.JsonValue('ECC_NIST_P384')
  eccNistP384,
  @_s.JsonValue('ECC_NIST_P521')
  eccNistP521,
  @_s.JsonValue('ECC_SECG_P256K1')
  eccSecgP256k1,
}

extension on DataKeyPairSpec {
  String toValue() {
    switch (this) {
      case DataKeyPairSpec.rsa_2048:
        return 'RSA_2048';
      case DataKeyPairSpec.rsa_3072:
        return 'RSA_3072';
      case DataKeyPairSpec.rsa_4096:
        return 'RSA_4096';
      case DataKeyPairSpec.eccNistP256:
        return 'ECC_NIST_P256';
      case DataKeyPairSpec.eccNistP384:
        return 'ECC_NIST_P384';
      case DataKeyPairSpec.eccNistP521:
        return 'ECC_NIST_P521';
      case DataKeyPairSpec.eccSecgP256k1:
        return 'ECC_SECG_P256K1';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DataKeySpec {
  @_s.JsonValue('AES_256')
  aes_256,
  @_s.JsonValue('AES_128')
  aes_128,
}

extension on DataKeySpec {
  String toValue() {
    switch (this) {
      case DataKeySpec.aes_256:
        return 'AES_256';
      case DataKeySpec.aes_128:
        return 'AES_128';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DecryptResponse {
  /// The encryption algorithm that was used to decrypt the ciphertext.
  @_s.JsonKey(name: 'EncryptionAlgorithm')
  final EncryptionAlgorithmSpec encryptionAlgorithm;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK that was used to decrypt the ciphertext.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// Decrypted plaintext data. When you use the HTTP API or the AWS CLI, the
  /// value is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Plaintext')
  final Uint8List plaintext;

  DecryptResponse({
    this.encryptionAlgorithm,
    this.keyId,
    this.plaintext,
  });
  factory DecryptResponse.fromJson(Map<String, dynamic> json) =>
      _$DecryptResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCustomKeyStoreResponse {
  DeleteCustomKeyStoreResponse();
  factory DeleteCustomKeyStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCustomKeyStoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCustomKeyStoresResponse {
  /// Contains metadata about each custom key store.
  @_s.JsonKey(name: 'CustomKeyStores')
  final List<CustomKeyStoresListEntry> customKeyStores;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  @_s.JsonKey(name: 'Truncated')
  final bool truncated;

  DescribeCustomKeyStoresResponse({
    this.customKeyStores,
    this.nextMarker,
    this.truncated,
  });
  factory DescribeCustomKeyStoresResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCustomKeyStoresResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeKeyResponse {
  /// Metadata associated with the key.
  @_s.JsonKey(name: 'KeyMetadata')
  final KeyMetadata keyMetadata;

  DescribeKeyResponse({
    this.keyMetadata,
  });
  factory DescribeKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisconnectCustomKeyStoreResponse {
  DisconnectCustomKeyStoreResponse();
  factory DisconnectCustomKeyStoreResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisconnectCustomKeyStoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EncryptResponse {
  /// The encrypted plaintext. When you use the HTTP API or the AWS CLI, the value
  /// is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'CiphertextBlob')
  final Uint8List ciphertextBlob;

  /// The encryption algorithm that was used to encrypt the plaintext.
  @_s.JsonKey(name: 'EncryptionAlgorithm')
  final EncryptionAlgorithmSpec encryptionAlgorithm;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK that was used to encrypt the plaintext.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  EncryptResponse({
    this.ciphertextBlob,
    this.encryptionAlgorithm,
    this.keyId,
  });
  factory EncryptResponse.fromJson(Map<String, dynamic> json) =>
      _$EncryptResponseFromJson(json);
}

enum EncryptionAlgorithmSpec {
  @_s.JsonValue('SYMMETRIC_DEFAULT')
  symmetricDefault,
  @_s.JsonValue('RSAES_OAEP_SHA_1')
  rsaesOaepSha_1,
  @_s.JsonValue('RSAES_OAEP_SHA_256')
  rsaesOaepSha_256,
}

extension on EncryptionAlgorithmSpec {
  String toValue() {
    switch (this) {
      case EncryptionAlgorithmSpec.symmetricDefault:
        return 'SYMMETRIC_DEFAULT';
      case EncryptionAlgorithmSpec.rsaesOaepSha_1:
        return 'RSAES_OAEP_SHA_1';
      case EncryptionAlgorithmSpec.rsaesOaepSha_256:
        return 'RSAES_OAEP_SHA_256';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ExpirationModelType {
  @_s.JsonValue('KEY_MATERIAL_EXPIRES')
  keyMaterialExpires,
  @_s.JsonValue('KEY_MATERIAL_DOES_NOT_EXPIRE')
  keyMaterialDoesNotExpire,
}

extension on ExpirationModelType {
  String toValue() {
    switch (this) {
      case ExpirationModelType.keyMaterialExpires:
        return 'KEY_MATERIAL_EXPIRES';
      case ExpirationModelType.keyMaterialDoesNotExpire:
        return 'KEY_MATERIAL_DOES_NOT_EXPIRE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateDataKeyPairResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK that encrypted the private key.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The type of data key pair that was generated.
  @_s.JsonKey(name: 'KeyPairSpec')
  final DataKeyPairSpec keyPairSpec;

  /// The encrypted copy of the private key. When you use the HTTP API or the AWS
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'PrivateKeyCiphertextBlob')
  final Uint8List privateKeyCiphertextBlob;

  /// The plaintext copy of the private key. When you use the HTTP API or the AWS
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'PrivateKeyPlaintext')
  final Uint8List privateKeyPlaintext;

  /// The public key (in plaintext).
  @Uint8ListConverter()
  @_s.JsonKey(name: 'PublicKey')
  final Uint8List publicKey;

  GenerateDataKeyPairResponse({
    this.keyId,
    this.keyPairSpec,
    this.privateKeyCiphertextBlob,
    this.privateKeyPlaintext,
    this.publicKey,
  });
  factory GenerateDataKeyPairResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateDataKeyPairResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateDataKeyPairWithoutPlaintextResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK that encrypted the private key.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The type of data key pair that was generated.
  @_s.JsonKey(name: 'KeyPairSpec')
  final DataKeyPairSpec keyPairSpec;

  /// The encrypted copy of the private key. When you use the HTTP API or the AWS
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'PrivateKeyCiphertextBlob')
  final Uint8List privateKeyCiphertextBlob;

  /// The public key (in plaintext).
  @Uint8ListConverter()
  @_s.JsonKey(name: 'PublicKey')
  final Uint8List publicKey;

  GenerateDataKeyPairWithoutPlaintextResponse({
    this.keyId,
    this.keyPairSpec,
    this.privateKeyCiphertextBlob,
    this.publicKey,
  });
  factory GenerateDataKeyPairWithoutPlaintextResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GenerateDataKeyPairWithoutPlaintextResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateDataKeyResponse {
  /// The encrypted copy of the data key. When you use the HTTP API or the AWS
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'CiphertextBlob')
  final Uint8List ciphertextBlob;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK that encrypted the data key.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The plaintext data key. When you use the HTTP API or the AWS CLI, the value
  /// is Base64-encoded. Otherwise, it is not Base64-encoded. Use this data key to
  /// encrypt your data outside of KMS. Then, remove it from memory as soon as
  /// possible.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Plaintext')
  final Uint8List plaintext;

  GenerateDataKeyResponse({
    this.ciphertextBlob,
    this.keyId,
    this.plaintext,
  });
  factory GenerateDataKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateDataKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateDataKeyWithoutPlaintextResponse {
  /// The encrypted data key. When you use the HTTP API or the AWS CLI, the value
  /// is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'CiphertextBlob')
  final Uint8List ciphertextBlob;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK that encrypted the data key.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  GenerateDataKeyWithoutPlaintextResponse({
    this.ciphertextBlob,
    this.keyId,
  });
  factory GenerateDataKeyWithoutPlaintextResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GenerateDataKeyWithoutPlaintextResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateRandomResponse {
  /// The random byte string. When you use the HTTP API or the AWS CLI, the value
  /// is Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Plaintext')
  final Uint8List plaintext;

  GenerateRandomResponse({
    this.plaintext,
  });
  factory GenerateRandomResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateRandomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetKeyPolicyResponse {
  /// A key policy document in JSON format.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  GetKeyPolicyResponse({
    this.policy,
  });
  factory GetKeyPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetKeyPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetKeyRotationStatusResponse {
  /// A Boolean value that specifies whether key rotation is enabled.
  @_s.JsonKey(name: 'KeyRotationEnabled')
  final bool keyRotationEnabled;

  GetKeyRotationStatusResponse({
    this.keyRotationEnabled,
  });
  factory GetKeyRotationStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetKeyRotationStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetParametersForImportResponse {
  /// The import token to send in a subsequent <a>ImportKeyMaterial</a> request.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'ImportToken')
  final Uint8List importToken;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK to use in a subsequent <a>ImportKeyMaterial</a> request.
  /// This is the same CMK specified in the <code>GetParametersForImport</code>
  /// request.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The time at which the import token and public key are no longer valid. After
  /// this time, you cannot use them to make an <a>ImportKeyMaterial</a> request
  /// and you must send another <code>GetParametersForImport</code> request to get
  /// new ones.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ParametersValidTo')
  final DateTime parametersValidTo;

  /// The public key to use to encrypt the key material before importing it with
  /// <a>ImportKeyMaterial</a>.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'PublicKey')
  final Uint8List publicKey;

  GetParametersForImportResponse({
    this.importToken,
    this.keyId,
    this.parametersValidTo,
    this.publicKey,
  });
  factory GetParametersForImportResponse.fromJson(Map<String, dynamic> json) =>
      _$GetParametersForImportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPublicKeyResponse {
  /// The type of the of the public key that was downloaded.
  @_s.JsonKey(name: 'CustomerMasterKeySpec')
  final CustomerMasterKeySpec customerMasterKeySpec;

  /// The encryption algorithms that AWS KMS supports for this key.
  ///
  /// This information is critical. If a public key encrypts data outside of AWS
  /// KMS by using an unsupported encryption algorithm, the ciphertext cannot be
  /// decrypted.
  ///
  /// This field appears in the response only when the <code>KeyUsage</code> of
  /// the public key is <code>ENCRYPT_DECRYPT</code>.
  @_s.JsonKey(name: 'EncryptionAlgorithms')
  final List<EncryptionAlgorithmSpec> encryptionAlgorithms;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the asymmetric CMK from which the public key was downloaded.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The permitted use of the public key. Valid values are
  /// <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>.
  ///
  /// This information is critical. If a public key with <code>SIGN_VERIFY</code>
  /// key usage encrypts data outside of AWS KMS, the ciphertext cannot be
  /// decrypted.
  @_s.JsonKey(name: 'KeyUsage')
  final KeyUsageType keyUsage;

  /// The exported public key.
  ///
  /// The value is a DER-encoded X.509 public key, also known as
  /// <code>SubjectPublicKeyInfo</code> (SPKI), as defined in <a
  /// href="https://tools.ietf.org/html/rfc5280">RFC 5280</a>. When you use the
  /// HTTP API or the AWS CLI, the value is Base64-encoded. Otherwise, it is not
  /// Base64-encoded.
  /// <p/>
  @Uint8ListConverter()
  @_s.JsonKey(name: 'PublicKey')
  final Uint8List publicKey;

  /// The signing algorithms that AWS KMS supports for this key.
  ///
  /// This field appears in the response only when the <code>KeyUsage</code> of
  /// the public key is <code>SIGN_VERIFY</code>.
  @_s.JsonKey(name: 'SigningAlgorithms')
  final List<SigningAlgorithmSpec> signingAlgorithms;

  GetPublicKeyResponse({
    this.customerMasterKeySpec,
    this.encryptionAlgorithms,
    this.keyId,
    this.keyUsage,
    this.publicKey,
    this.signingAlgorithms,
  });
  factory GetPublicKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPublicKeyResponseFromJson(json);
}

/// Use this structure to allow <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
/// operations</a> in the grant only when the operation request includes the
/// specified <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
/// context</a>.
///
/// AWS KMS applies the grant constraints only to cryptographic operations that
/// support an encryption context, that is, all cryptographic operations with a
/// <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#symmetric-cmks">symmetric
/// CMK</a>. Grant constraints are not applied to operations that do not support
/// an encryption context, such as cryptographic operations with asymmetric CMKs
/// and management operations, such as <a>DescribeKey</a> or <a>RetireGrant</a>.
/// <important>
/// In a cryptographic operation, the encryption context in the decryption
/// operation must be an exact, case-sensitive match for the keys and values in
/// the encryption context of the encryption operation. Only the order of the
/// pairs can vary.
///
/// However, in a grant constraint, the key in each key-value pair is not case
/// sensitive, but the value is case sensitive.
///
/// To avoid confusion, do not use multiple encryption context pairs that differ
/// only by case. To require a fully case-sensitive encryption context, use the
/// <code>kms:EncryptionContext:</code> and
/// <code>kms:EncryptionContextKeys</code> conditions in an IAM or key policy.
/// For details, see <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-context">kms:EncryptionContext:</a>
/// in the <i> <i>AWS Key Management Service Developer Guide</i> </i>.
/// </important>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrantConstraints {
  /// A list of key-value pairs that must match the encryption context in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> request. The grant allows the operation only when the
  /// encryption context in the request is the same as the encryption context
  /// specified in this constraint.
  @_s.JsonKey(name: 'EncryptionContextEquals')
  final Map<String, String> encryptionContextEquals;

  /// A list of key-value pairs that must be included in the encryption context of
  /// the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> request. The grant allows the cryptographic operation only
  /// when the encryption context in the request includes the key-value pairs
  /// specified in this constraint, although it can include additional key-value
  /// pairs.
  @_s.JsonKey(name: 'EncryptionContextSubset')
  final Map<String, String> encryptionContextSubset;

  GrantConstraints({
    this.encryptionContextEquals,
    this.encryptionContextSubset,
  });
  factory GrantConstraints.fromJson(Map<String, dynamic> json) =>
      _$GrantConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$GrantConstraintsToJson(this);
}

/// Contains information about a grant.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GrantListEntry {
  /// A list of key-value pairs that must be present in the encryption context of
  /// certain subsequent operations that the grant allows.
  @_s.JsonKey(name: 'Constraints')
  final GrantConstraints constraints;

  /// The date and time when the grant was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The unique identifier for the grant.
  @_s.JsonKey(name: 'GrantId')
  final String grantId;

  /// The identity that gets the permissions in the grant.
  ///
  /// The <code>GranteePrincipal</code> field in the <code>ListGrants</code>
  /// response usually contains the user or role designated as the grantee
  /// principal in the grant. However, when the grantee principal in the grant is
  /// an AWS service, the <code>GranteePrincipal</code> field contains the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">service
  /// principal</a>, which might represent several different grantee principals.
  @_s.JsonKey(name: 'GranteePrincipal')
  final String granteePrincipal;

  /// The AWS account under which the grant was issued.
  @_s.JsonKey(name: 'IssuingAccount')
  final String issuingAccount;

  /// The unique identifier for the customer master key (CMK) to which the grant
  /// applies.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The friendly name that identifies the grant. If a name was provided in the
  /// <a>CreateGrant</a> request, that name is returned. Otherwise this value is
  /// null.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The list of operations permitted by the grant.
  @_s.JsonKey(name: 'Operations')
  final List<GrantOperation> operations;

  /// The principal that can retire the grant.
  @_s.JsonKey(name: 'RetiringPrincipal')
  final String retiringPrincipal;

  GrantListEntry({
    this.constraints,
    this.creationDate,
    this.grantId,
    this.granteePrincipal,
    this.issuingAccount,
    this.keyId,
    this.name,
    this.operations,
    this.retiringPrincipal,
  });
  factory GrantListEntry.fromJson(Map<String, dynamic> json) =>
      _$GrantListEntryFromJson(json);
}

enum GrantOperation {
  @_s.JsonValue('Decrypt')
  decrypt,
  @_s.JsonValue('Encrypt')
  encrypt,
  @_s.JsonValue('GenerateDataKey')
  generateDataKey,
  @_s.JsonValue('GenerateDataKeyWithoutPlaintext')
  generateDataKeyWithoutPlaintext,
  @_s.JsonValue('ReEncryptFrom')
  reEncryptFrom,
  @_s.JsonValue('ReEncryptTo')
  reEncryptTo,
  @_s.JsonValue('Sign')
  sign,
  @_s.JsonValue('Verify')
  verify,
  @_s.JsonValue('GetPublicKey')
  getPublicKey,
  @_s.JsonValue('CreateGrant')
  createGrant,
  @_s.JsonValue('RetireGrant')
  retireGrant,
  @_s.JsonValue('DescribeKey')
  describeKey,
  @_s.JsonValue('GenerateDataKeyPair')
  generateDataKeyPair,
  @_s.JsonValue('GenerateDataKeyPairWithoutPlaintext')
  generateDataKeyPairWithoutPlaintext,
}

extension on GrantOperation {
  String toValue() {
    switch (this) {
      case GrantOperation.decrypt:
        return 'Decrypt';
      case GrantOperation.encrypt:
        return 'Encrypt';
      case GrantOperation.generateDataKey:
        return 'GenerateDataKey';
      case GrantOperation.generateDataKeyWithoutPlaintext:
        return 'GenerateDataKeyWithoutPlaintext';
      case GrantOperation.reEncryptFrom:
        return 'ReEncryptFrom';
      case GrantOperation.reEncryptTo:
        return 'ReEncryptTo';
      case GrantOperation.sign:
        return 'Sign';
      case GrantOperation.verify:
        return 'Verify';
      case GrantOperation.getPublicKey:
        return 'GetPublicKey';
      case GrantOperation.createGrant:
        return 'CreateGrant';
      case GrantOperation.retireGrant:
        return 'RetireGrant';
      case GrantOperation.describeKey:
        return 'DescribeKey';
      case GrantOperation.generateDataKeyPair:
        return 'GenerateDataKeyPair';
      case GrantOperation.generateDataKeyPairWithoutPlaintext:
        return 'GenerateDataKeyPairWithoutPlaintext';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportKeyMaterialResponse {
  ImportKeyMaterialResponse();
  factory ImportKeyMaterialResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportKeyMaterialResponseFromJson(json);
}

/// Contains information about each entry in the key list.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeyListEntry {
  /// ARN of the key.
  @_s.JsonKey(name: 'KeyArn')
  final String keyArn;

  /// Unique identifier of the key.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  KeyListEntry({
    this.keyArn,
    this.keyId,
  });
  factory KeyListEntry.fromJson(Map<String, dynamic> json) =>
      _$KeyListEntryFromJson(json);
}

enum KeyManagerType {
  @_s.JsonValue('AWS')
  aws,
  @_s.JsonValue('CUSTOMER')
  customer,
}

/// Contains metadata about a customer master key (CMK).
///
/// This data type is used as a response element for the <a>CreateKey</a> and
/// <a>DescribeKey</a> operations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeyMetadata {
  /// The globally unique identifier for the CMK.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The twelve-digit account ID of the AWS account that owns the CMK.
  @_s.JsonKey(name: 'AWSAccountId')
  final String awsAccountId;

  /// The Amazon Resource Name (ARN) of the CMK. For examples, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">AWS
  /// Key Management Service (AWS KMS)</a> in the Example ARNs section of the
  /// <i>AWS General Reference</i>.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The cluster ID of the AWS CloudHSM cluster that contains the key material
  /// for the CMK. When you create a CMK in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, AWS KMS creates the key material for the CMK in the
  /// associated AWS CloudHSM cluster. This value is present only when the CMK is
  /// created in a custom key store.
  @_s.JsonKey(name: 'CloudHsmClusterId')
  final String cloudHsmClusterId;

  /// The date and time when the CMK was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// A unique identifier for the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> that contains the CMK. This value is present only when the CMK
  /// is created in a custom key store.
  @_s.JsonKey(name: 'CustomKeyStoreId')
  final String customKeyStoreId;

  /// Describes the type of key material in the CMK.
  @_s.JsonKey(name: 'CustomerMasterKeySpec')
  final CustomerMasterKeySpec customerMasterKeySpec;

  /// The date and time after which AWS KMS deletes the CMK. This value is present
  /// only when <code>KeyState</code> is <code>PendingDeletion</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeletionDate')
  final DateTime deletionDate;

  /// The description of the CMK.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Specifies whether the CMK is enabled. When <code>KeyState</code> is
  /// <code>Enabled</code> this value is true, otherwise it is false.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The encryption algorithms that the CMK supports. You cannot use the CMK with
  /// other encryption algorithms within AWS KMS.
  ///
  /// This field appears only when the <code>KeyUsage</code> of the CMK is
  /// <code>ENCRYPT_DECRYPT</code>.
  @_s.JsonKey(name: 'EncryptionAlgorithms')
  final List<EncryptionAlgorithmSpec> encryptionAlgorithms;

  /// Specifies whether the CMK's key material expires. This value is present only
  /// when <code>Origin</code> is <code>EXTERNAL</code>, otherwise this value is
  /// omitted.
  @_s.JsonKey(name: 'ExpirationModel')
  final ExpirationModelType expirationModel;

  /// The manager of the CMK. CMKs in your AWS account are either customer managed
  /// or AWS managed. For more information about the difference, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">Customer
  /// Master Keys</a> in the <i>AWS Key Management Service Developer Guide</i>.
  @_s.JsonKey(name: 'KeyManager')
  final KeyManagerType keyManager;

  /// The current status of the CMK.
  ///
  /// For more information about how key state affects the use of a CMK, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your CMK</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'KeyState')
  final KeyState keyState;

  /// The <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> for which you can use the CMK.
  @_s.JsonKey(name: 'KeyUsage')
  final KeyUsageType keyUsage;

  /// The source of the CMK's key material. When this value is
  /// <code>AWS_KMS</code>, AWS KMS created the key material. When this value is
  /// <code>EXTERNAL</code>, the key material was imported from your existing key
  /// management infrastructure or the CMK lacks key material. When this value is
  /// <code>AWS_CLOUDHSM</code>, the key material was created in the AWS CloudHSM
  /// cluster associated with a custom key store.
  @_s.JsonKey(name: 'Origin')
  final OriginType origin;

  /// The signing algorithms that the CMK supports. You cannot use the CMK with
  /// other signing algorithms within AWS KMS.
  ///
  /// This field appears only when the <code>KeyUsage</code> of the CMK is
  /// <code>SIGN_VERIFY</code>.
  @_s.JsonKey(name: 'SigningAlgorithms')
  final List<SigningAlgorithmSpec> signingAlgorithms;

  /// The time at which the imported key material expires. When the key material
  /// expires, AWS KMS deletes the key material and the CMK becomes unusable. This
  /// value is present only for CMKs whose <code>Origin</code> is
  /// <code>EXTERNAL</code> and whose <code>ExpirationModel</code> is
  /// <code>KEY_MATERIAL_EXPIRES</code>, otherwise this value is omitted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ValidTo')
  final DateTime validTo;

  KeyMetadata({
    @_s.required this.keyId,
    this.awsAccountId,
    this.arn,
    this.cloudHsmClusterId,
    this.creationDate,
    this.customKeyStoreId,
    this.customerMasterKeySpec,
    this.deletionDate,
    this.description,
    this.enabled,
    this.encryptionAlgorithms,
    this.expirationModel,
    this.keyManager,
    this.keyState,
    this.keyUsage,
    this.origin,
    this.signingAlgorithms,
    this.validTo,
  });
  factory KeyMetadata.fromJson(Map<String, dynamic> json) =>
      _$KeyMetadataFromJson(json);
}

enum KeyState {
  @_s.JsonValue('Enabled')
  enabled,
  @_s.JsonValue('Disabled')
  disabled,
  @_s.JsonValue('PendingDeletion')
  pendingDeletion,
  @_s.JsonValue('PendingImport')
  pendingImport,
  @_s.JsonValue('Unavailable')
  unavailable,
}

enum KeyUsageType {
  @_s.JsonValue('SIGN_VERIFY')
  signVerify,
  @_s.JsonValue('ENCRYPT_DECRYPT')
  encryptDecrypt,
}

extension on KeyUsageType {
  String toValue() {
    switch (this) {
      case KeyUsageType.signVerify:
        return 'SIGN_VERIFY';
      case KeyUsageType.encryptDecrypt:
        return 'ENCRYPT_DECRYPT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAliasesResponse {
  /// A list of aliases.
  @_s.JsonKey(name: 'Aliases')
  final List<AliasListEntry> aliases;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  @_s.JsonKey(name: 'Truncated')
  final bool truncated;

  ListAliasesResponse({
    this.aliases,
    this.nextMarker,
    this.truncated,
  });
  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAliasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGrantsResponse {
  /// A list of grants.
  @_s.JsonKey(name: 'Grants')
  final List<GrantListEntry> grants;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  @_s.JsonKey(name: 'Truncated')
  final bool truncated;

  ListGrantsResponse({
    this.grants,
    this.nextMarker,
    this.truncated,
  });
  factory ListGrantsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGrantsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListKeyPoliciesResponse {
  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of key policy names. The only valid value is <code>default</code>.
  @_s.JsonKey(name: 'PolicyNames')
  final List<String> policyNames;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  @_s.JsonKey(name: 'Truncated')
  final bool truncated;

  ListKeyPoliciesResponse({
    this.nextMarker,
    this.policyNames,
    this.truncated,
  });
  factory ListKeyPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListKeyPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListKeysResponse {
  /// A list of customer master keys (CMKs).
  @_s.JsonKey(name: 'Keys')
  final List<KeyListEntry> keys;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  @_s.JsonKey(name: 'Truncated')
  final bool truncated;

  ListKeysResponse({
    this.keys,
    this.nextMarker,
    this.truncated,
  });
  factory ListKeysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListKeysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceTagsResponse {
  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  ///
  /// Do not assume or infer any information from this value.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of tags. Each tag consists of a tag key and a tag value.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  @_s.JsonKey(name: 'Truncated')
  final bool truncated;

  ListResourceTagsResponse({
    this.nextMarker,
    this.tags,
    this.truncated,
  });
  factory ListResourceTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourceTagsResponseFromJson(json);
}

enum MessageType {
  @_s.JsonValue('RAW')
  raw,
  @_s.JsonValue('DIGEST')
  digest,
}

extension on MessageType {
  String toValue() {
    switch (this) {
      case MessageType.raw:
        return 'RAW';
      case MessageType.digest:
        return 'DIGEST';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum OriginType {
  @_s.JsonValue('AWS_KMS')
  awsKms,
  @_s.JsonValue('EXTERNAL')
  external,
  @_s.JsonValue('AWS_CLOUDHSM')
  awsCloudhsm,
}

extension on OriginType {
  String toValue() {
    switch (this) {
      case OriginType.awsKms:
        return 'AWS_KMS';
      case OriginType.external:
        return 'EXTERNAL';
      case OriginType.awsCloudhsm:
        return 'AWS_CLOUDHSM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReEncryptResponse {
  /// The reencrypted data. When you use the HTTP API or the AWS CLI, the value is
  /// Base64-encoded. Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'CiphertextBlob')
  final Uint8List ciphertextBlob;

  /// The encryption algorithm that was used to reencrypt the data.
  @_s.JsonKey(name: 'DestinationEncryptionAlgorithm')
  final EncryptionAlgorithmSpec destinationEncryptionAlgorithm;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK that was used to reencrypt the data.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The encryption algorithm that was used to decrypt the ciphertext before it
  /// was reencrypted.
  @_s.JsonKey(name: 'SourceEncryptionAlgorithm')
  final EncryptionAlgorithmSpec sourceEncryptionAlgorithm;

  /// Unique identifier of the CMK used to originally encrypt the data.
  @_s.JsonKey(name: 'SourceKeyId')
  final String sourceKeyId;

  ReEncryptResponse({
    this.ciphertextBlob,
    this.destinationEncryptionAlgorithm,
    this.keyId,
    this.sourceEncryptionAlgorithm,
    this.sourceKeyId,
  });
  factory ReEncryptResponse.fromJson(Map<String, dynamic> json) =>
      _$ReEncryptResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScheduleKeyDeletionResponse {
  /// The date and time after which AWS KMS deletes the customer master key (CMK).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeletionDate')
  final DateTime deletionDate;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the CMK whose deletion is scheduled.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  ScheduleKeyDeletionResponse({
    this.deletionDate,
    this.keyId,
  });
  factory ScheduleKeyDeletionResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleKeyDeletionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SignResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the asymmetric CMK that was used to sign the message.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The cryptographic signature that was generated for the message.
  ///
  /// <ul>
  /// <li>
  /// When used with the supported RSA signing algorithms, the encoding of this
  /// value is defined by <a href="https://tools.ietf.org/html/rfc8017">PKCS #1 in
  /// RFC 8017</a>.
  /// </li>
  /// <li>
  /// When used with the <code>ECDSA_SHA_256</code>, <code>ECDSA_SHA_384</code>,
  /// or <code>ECDSA_SHA_512</code> signing algorithms, this value is a
  /// DER-encoded object as defined by ANS X9.62–2005 and <a
  /// href="https://tools.ietf.org/html/rfc3279#section-2.2.3">RFC 3279 Section
  /// 2.2.3</a>. This is the most commonly used signature format and is
  /// appropriate for most uses.
  /// </li>
  /// </ul>
  /// When you use the HTTP API or the AWS CLI, the value is Base64-encoded.
  /// Otherwise, it is not Base64-encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Signature')
  final Uint8List signature;

  /// The signing algorithm that was used to sign the message.
  @_s.JsonKey(name: 'SigningAlgorithm')
  final SigningAlgorithmSpec signingAlgorithm;

  SignResponse({
    this.keyId,
    this.signature,
    this.signingAlgorithm,
  });
  factory SignResponse.fromJson(Map<String, dynamic> json) =>
      _$SignResponseFromJson(json);
}

enum SigningAlgorithmSpec {
  @_s.JsonValue('RSASSA_PSS_SHA_256')
  rsassaPssSha_256,
  @_s.JsonValue('RSASSA_PSS_SHA_384')
  rsassaPssSha_384,
  @_s.JsonValue('RSASSA_PSS_SHA_512')
  rsassaPssSha_512,
  @_s.JsonValue('RSASSA_PKCS1_V1_5_SHA_256')
  rsassaPkcs1V1_5Sha_256,
  @_s.JsonValue('RSASSA_PKCS1_V1_5_SHA_384')
  rsassaPkcs1V1_5Sha_384,
  @_s.JsonValue('RSASSA_PKCS1_V1_5_SHA_512')
  rsassaPkcs1V1_5Sha_512,
  @_s.JsonValue('ECDSA_SHA_256')
  ecdsaSha_256,
  @_s.JsonValue('ECDSA_SHA_384')
  ecdsaSha_384,
  @_s.JsonValue('ECDSA_SHA_512')
  ecdsaSha_512,
}

extension on SigningAlgorithmSpec {
  String toValue() {
    switch (this) {
      case SigningAlgorithmSpec.rsassaPssSha_256:
        return 'RSASSA_PSS_SHA_256';
      case SigningAlgorithmSpec.rsassaPssSha_384:
        return 'RSASSA_PSS_SHA_384';
      case SigningAlgorithmSpec.rsassaPssSha_512:
        return 'RSASSA_PSS_SHA_512';
      case SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_256:
        return 'RSASSA_PKCS1_V1_5_SHA_256';
      case SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_384:
        return 'RSASSA_PKCS1_V1_5_SHA_384';
      case SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_512:
        return 'RSASSA_PKCS1_V1_5_SHA_512';
      case SigningAlgorithmSpec.ecdsaSha_256:
        return 'ECDSA_SHA_256';
      case SigningAlgorithmSpec.ecdsaSha_384:
        return 'ECDSA_SHA_384';
      case SigningAlgorithmSpec.ecdsaSha_512:
        return 'ECDSA_SHA_512';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A key-value pair. A tag consists of a tag key and a tag value. Tag keys and
/// tag values are both required, but tag values can be empty (null) strings.
///
/// For information about the rules that apply to tag keys and tag values, see
/// <a
/// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined
/// Tag Restrictions</a> in the <i>AWS Billing and Cost Management User
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'TagKey')
  final String tagKey;

  /// The value of the tag.
  @_s.JsonKey(name: 'TagValue')
  final String tagValue;

  Tag({
    @_s.required this.tagKey,
    @_s.required this.tagValue,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCustomKeyStoreResponse {
  UpdateCustomKeyStoreResponse();
  factory UpdateCustomKeyStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomKeyStoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VerifyResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the asymmetric CMK that was used to verify the signature.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// A Boolean value that indicates whether the signature was verified. A value
  /// of <code>True</code> indicates that the <code>Signature</code> was produced
  /// by signing the <code>Message</code> with the specified <code>KeyID</code>
  /// and <code>SigningAlgorithm.</code> If the signature is not verified, the
  /// <code>Verify</code> operation fails with a
  /// <code>KMSInvalidSignatureException</code> exception.
  @_s.JsonKey(name: 'SignatureValid')
  final bool signatureValid;

  /// The signing algorithm that was used to verify the signature.
  @_s.JsonKey(name: 'SigningAlgorithm')
  final SigningAlgorithmSpec signingAlgorithm;

  VerifyResponse({
    this.keyId,
    this.signatureValid,
    this.signingAlgorithm,
  });
  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);
}

enum WrappingKeySpec {
  @_s.JsonValue('RSA_2048')
  rsa_2048,
}

extension on WrappingKeySpec {
  String toValue() {
    switch (this) {
      case WrappingKeySpec.rsa_2048:
        return 'RSA_2048';
    }
    throw Exception('Unknown enum value: $this');
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class CloudHsmClusterInUseException extends _s.GenericAwsException {
  CloudHsmClusterInUseException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmClusterInUseException',
            message: message);
}

class CloudHsmClusterInvalidConfigurationException
    extends _s.GenericAwsException {
  CloudHsmClusterInvalidConfigurationException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmClusterInvalidConfigurationException',
            message: message);
}

class CloudHsmClusterNotActiveException extends _s.GenericAwsException {
  CloudHsmClusterNotActiveException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmClusterNotActiveException',
            message: message);
}

class CloudHsmClusterNotFoundException extends _s.GenericAwsException {
  CloudHsmClusterNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmClusterNotFoundException',
            message: message);
}

class CloudHsmClusterNotRelatedException extends _s.GenericAwsException {
  CloudHsmClusterNotRelatedException({String type, String message})
      : super(
            type: type,
            code: 'CloudHsmClusterNotRelatedException',
            message: message);
}

class CustomKeyStoreHasCMKsException extends _s.GenericAwsException {
  CustomKeyStoreHasCMKsException({String type, String message})
      : super(
            type: type,
            code: 'CustomKeyStoreHasCMKsException',
            message: message);
}

class CustomKeyStoreInvalidStateException extends _s.GenericAwsException {
  CustomKeyStoreInvalidStateException({String type, String message})
      : super(
            type: type,
            code: 'CustomKeyStoreInvalidStateException',
            message: message);
}

class CustomKeyStoreNameInUseException extends _s.GenericAwsException {
  CustomKeyStoreNameInUseException({String type, String message})
      : super(
            type: type,
            code: 'CustomKeyStoreNameInUseException',
            message: message);
}

class CustomKeyStoreNotFoundException extends _s.GenericAwsException {
  CustomKeyStoreNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'CustomKeyStoreNotFoundException',
            message: message);
}

class DependencyTimeoutException extends _s.GenericAwsException {
  DependencyTimeoutException({String type, String message})
      : super(type: type, code: 'DependencyTimeoutException', message: message);
}

class DisabledException extends _s.GenericAwsException {
  DisabledException({String type, String message})
      : super(type: type, code: 'DisabledException', message: message);
}

class ExpiredImportTokenException extends _s.GenericAwsException {
  ExpiredImportTokenException({String type, String message})
      : super(
            type: type, code: 'ExpiredImportTokenException', message: message);
}

class IncorrectKeyException extends _s.GenericAwsException {
  IncorrectKeyException({String type, String message})
      : super(type: type, code: 'IncorrectKeyException', message: message);
}

class IncorrectKeyMaterialException extends _s.GenericAwsException {
  IncorrectKeyMaterialException({String type, String message})
      : super(
            type: type,
            code: 'IncorrectKeyMaterialException',
            message: message);
}

class IncorrectTrustAnchorException extends _s.GenericAwsException {
  IncorrectTrustAnchorException({String type, String message})
      : super(
            type: type,
            code: 'IncorrectTrustAnchorException',
            message: message);
}

class InvalidAliasNameException extends _s.GenericAwsException {
  InvalidAliasNameException({String type, String message})
      : super(type: type, code: 'InvalidAliasNameException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String type, String message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidCiphertextException extends _s.GenericAwsException {
  InvalidCiphertextException({String type, String message})
      : super(type: type, code: 'InvalidCiphertextException', message: message);
}

class InvalidGrantIdException extends _s.GenericAwsException {
  InvalidGrantIdException({String type, String message})
      : super(type: type, code: 'InvalidGrantIdException', message: message);
}

class InvalidGrantTokenException extends _s.GenericAwsException {
  InvalidGrantTokenException({String type, String message})
      : super(type: type, code: 'InvalidGrantTokenException', message: message);
}

class InvalidImportTokenException extends _s.GenericAwsException {
  InvalidImportTokenException({String type, String message})
      : super(
            type: type, code: 'InvalidImportTokenException', message: message);
}

class InvalidKeyUsageException extends _s.GenericAwsException {
  InvalidKeyUsageException({String type, String message})
      : super(type: type, code: 'InvalidKeyUsageException', message: message);
}

class InvalidMarkerException extends _s.GenericAwsException {
  InvalidMarkerException({String type, String message})
      : super(type: type, code: 'InvalidMarkerException', message: message);
}

class KMSInternalException extends _s.GenericAwsException {
  KMSInternalException({String type, String message})
      : super(type: type, code: 'KMSInternalException', message: message);
}

class KMSInvalidSignatureException extends _s.GenericAwsException {
  KMSInvalidSignatureException({String type, String message})
      : super(
            type: type, code: 'KMSInvalidSignatureException', message: message);
}

class KMSInvalidStateException extends _s.GenericAwsException {
  KMSInvalidStateException({String type, String message})
      : super(type: type, code: 'KMSInvalidStateException', message: message);
}

class KeyUnavailableException extends _s.GenericAwsException {
  KeyUnavailableException({String type, String message})
      : super(type: type, code: 'KeyUnavailableException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String type, String message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TagException extends _s.GenericAwsException {
  TagException({String type, String message})
      : super(type: type, code: 'TagException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'CloudHsmClusterInUseException': (type, message) =>
      CloudHsmClusterInUseException(type: type, message: message),
  'CloudHsmClusterInvalidConfigurationException': (type, message) =>
      CloudHsmClusterInvalidConfigurationException(
          type: type, message: message),
  'CloudHsmClusterNotActiveException': (type, message) =>
      CloudHsmClusterNotActiveException(type: type, message: message),
  'CloudHsmClusterNotFoundException': (type, message) =>
      CloudHsmClusterNotFoundException(type: type, message: message),
  'CloudHsmClusterNotRelatedException': (type, message) =>
      CloudHsmClusterNotRelatedException(type: type, message: message),
  'CustomKeyStoreHasCMKsException': (type, message) =>
      CustomKeyStoreHasCMKsException(type: type, message: message),
  'CustomKeyStoreInvalidStateException': (type, message) =>
      CustomKeyStoreInvalidStateException(type: type, message: message),
  'CustomKeyStoreNameInUseException': (type, message) =>
      CustomKeyStoreNameInUseException(type: type, message: message),
  'CustomKeyStoreNotFoundException': (type, message) =>
      CustomKeyStoreNotFoundException(type: type, message: message),
  'DependencyTimeoutException': (type, message) =>
      DependencyTimeoutException(type: type, message: message),
  'DisabledException': (type, message) =>
      DisabledException(type: type, message: message),
  'ExpiredImportTokenException': (type, message) =>
      ExpiredImportTokenException(type: type, message: message),
  'IncorrectKeyException': (type, message) =>
      IncorrectKeyException(type: type, message: message),
  'IncorrectKeyMaterialException': (type, message) =>
      IncorrectKeyMaterialException(type: type, message: message),
  'IncorrectTrustAnchorException': (type, message) =>
      IncorrectTrustAnchorException(type: type, message: message),
  'InvalidAliasNameException': (type, message) =>
      InvalidAliasNameException(type: type, message: message),
  'InvalidArnException': (type, message) =>
      InvalidArnException(type: type, message: message),
  'InvalidCiphertextException': (type, message) =>
      InvalidCiphertextException(type: type, message: message),
  'InvalidGrantIdException': (type, message) =>
      InvalidGrantIdException(type: type, message: message),
  'InvalidGrantTokenException': (type, message) =>
      InvalidGrantTokenException(type: type, message: message),
  'InvalidImportTokenException': (type, message) =>
      InvalidImportTokenException(type: type, message: message),
  'InvalidKeyUsageException': (type, message) =>
      InvalidKeyUsageException(type: type, message: message),
  'InvalidMarkerException': (type, message) =>
      InvalidMarkerException(type: type, message: message),
  'KMSInternalException': (type, message) =>
      KMSInternalException(type: type, message: message),
  'KMSInvalidSignatureException': (type, message) =>
      KMSInvalidSignatureException(type: type, message: message),
  'KMSInvalidStateException': (type, message) =>
      KMSInvalidStateException(type: type, message: message),
  'KeyUnavailableException': (type, message) =>
      KeyUnavailableException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TagException': (type, message) => TagException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
