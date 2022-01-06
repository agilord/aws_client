// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Key Management Service (KMS) is an encryption and key management web
/// service. This guide describes the KMS operations that you can call
/// programmatically. For general information about KMS, see the <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/"> <i>Key
/// Management Service Developer Guide</i> </a>.
/// <note>
/// KMS is replacing the term <i>customer master key (CMK)</i> with <i>KMS
/// key</i> and <i>KMS key</i>. The concept has not changed. To prevent breaking
/// changes, KMS is keeping some variations of this term.
class Kms {
  final _s.JsonProtocol _protocol;
  Kms({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kms',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels the deletion of a KMS key. When this operation succeeds, the key
  /// state of the KMS key is <code>Disabled</code>. To enable the KMS key, use
  /// <a>EnableKey</a>.
  ///
  /// For more information about scheduling and canceling deletion of a KMS key,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting
  /// KMS keys</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Identifies the KMS key whose deletion is being canceled.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<CancelKeyDeletionResponse> cancelKeyDeletion({
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
  /// key store</a> to its associated CloudHSM cluster.
  ///
  /// The custom key store must be connected before you can create KMS keys in
  /// the key store or use the KMS keys it contains. You can disconnect and
  /// reconnect a custom key store at any time.
  ///
  /// To connect a custom key store, its associated CloudHSM cluster must have
  /// at least one active HSM. To get the number of active HSMs in a cluster,
  /// use the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters</a>
  /// operation. To add HSMs to the cluster, use the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html">CreateHsm</a>
  /// operation. Also, the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
  /// <code>kmsuser</code> crypto user</a> (CU) must not be logged into the
  /// cluster. This prevents KMS from using this account to log in.
  ///
  /// The connection process can take an extended amount of time to complete; up
  /// to 20 minutes. This operation starts the connection process, but it does
  /// not wait for it to complete. When it succeeds, this operation quickly
  /// returns an HTTP 200 response and a JSON object with no properties.
  /// However, this response does not indicate that the custom key store is
  /// connected. To get the connection state of the custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  ///
  /// During the connection process, KMS finds the CloudHSM cluster that is
  /// associated with the custom key store, creates the connection
  /// infrastructure, connects to the cluster, logs into the CloudHSM client as
  /// the <code>kmsuser</code> CU, and rotates its password.
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
  /// a Custom Key Store</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different Amazon Web Services account.
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
    required String customKeyStoreId,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ConnectCustomKeyStore'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomKeyStoreId': customKeyStoreId,
      },
    );
  }

  /// Creates a friendly name for a KMS key.
  /// <note>
  /// Adding, deleting, or updating an alias can allow or deny permission to the
  /// KMS key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  /// You can use an alias to identify a KMS key in the KMS console, in the
  /// <a>DescribeKey</a> operation and in <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>, such as <a>Encrypt</a> and <a>GenerateDataKey</a>. You can
  /// also change the KMS key that's associated with the alias
  /// (<a>UpdateAlias</a>) or delete the alias (<a>DeleteAlias</a>) at any time.
  /// These operations don't affect the underlying KMS key.
  ///
  /// You can associate the alias with any customer managed key in the same
  /// Amazon Web Services Region. Each alias is associated with only one KMS key
  /// at a time, but a KMS key can have multiple aliases. A valid KMS key is
  /// required. You can't create an alias without a KMS key.
  ///
  /// The alias must be unique in the account and Region, but you can have
  /// aliases with the same name in different Regions. For detailed information
  /// about aliases, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html">Using
  /// aliases</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// This operation does not return a response. To get the alias that you
  /// created, use the <a>ListAliases</a> operation.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on an
  /// alias in a different Amazon Web Services account.
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
  /// on the KMS key (key policy).
  /// </li>
  /// </ul>
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>Key Management Service Developer
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
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed keys</a>.
  ///
  /// Parameter [targetKeyId] :
  /// Associates the alias with the specified <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed key</a>. The KMS key must be in the same Amazon Web Services
  /// Region.
  ///
  /// A valid key ID is required. If you supply a null or empty string value,
  /// this operation returns an error.
  ///
  /// For help finding the key ID and ARN, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/viewing-keys.html#find-cmk-id-arn">Finding
  /// the Key ID and ARN</a> in the <i> <i>Key Management Service Developer
  /// Guide</i> </i>.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> createAlias({
    required String aliasName,
    required String targetKeyId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    ArgumentError.checkNotNull(targetKeyId, 'targetKeyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.CreateAlias'
    };
    await _protocol.send(
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
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/clusters.html">CloudHSM
  /// cluster</a> that you own and manage.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in KMS, which combines the convenience and
  /// extensive integration of KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// Before you create the custom key store, you must assemble the required
  /// elements, including an CloudHSM cluster that fulfills the requirements for
  /// a custom key store. For details about the required elements, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore">Assemble
  /// the Prerequisites</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// When the operation completes successfully, it returns the ID of the new
  /// custom key store. Before you can use your new custom key store, you need
  /// to use the <a>ConnectCustomKeyStore</a> operation to connect the new key
  /// store to its CloudHSM cluster. Even if you are not going to use your
  /// custom key store immediately, you might want to connect it to verify that
  /// all settings are correct and then disconnect it until you are ready to use
  /// it.
  ///
  /// For help with failures, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting
  /// a Custom Key Store</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different Amazon Web Services account.
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
  /// Identifies the CloudHSM cluster for the custom key store. Enter the
  /// cluster ID of any active CloudHSM cluster that is not already associated
  /// with a custom key store. To find the cluster ID, use the <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters</a>
  /// operation.
  ///
  /// Parameter [customKeyStoreName] :
  /// Specifies a friendly name for the custom key store. The name must be
  /// unique in your Amazon Web Services account.
  ///
  /// Parameter [keyStorePassword] :
  /// Enter the password of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
  /// <code>kmsuser</code> crypto user (CU) account</a> in the specified
  /// CloudHSM cluster. KMS logs into the cluster as this user to manage key
  /// material on your behalf.
  ///
  /// The password must be a string of 7 to 32 characters. Its value is case
  /// sensitive.
  ///
  /// This parameter tells KMS the <code>kmsuser</code> account password; it
  /// does not change the password in the CloudHSM cluster.
  ///
  /// Parameter [trustAnchorCertificate] :
  /// Enter the content of the trust anchor certificate for the cluster. This is
  /// the content of the <code>customerCA.crt</code> file that you created when
  /// you <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html">initialized
  /// the cluster</a>.
  Future<CreateCustomKeyStoreResponse> createCustomKeyStore({
    required String cloudHsmClusterId,
    required String customKeyStoreName,
    required String keyStorePassword,
    required String trustAnchorCertificate,
  }) async {
    ArgumentError.checkNotNull(cloudHsmClusterId, 'cloudHsmClusterId');
    ArgumentError.checkNotNull(customKeyStoreName, 'customKeyStoreName');
    ArgumentError.checkNotNull(keyStorePassword, 'keyStorePassword');
    ArgumentError.checkNotNull(
        trustAnchorCertificate, 'trustAnchorCertificate');
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

  /// Adds a grant to a KMS key.
  ///
  /// A <i>grant</i> is a policy instrument that allows Amazon Web Services
  /// principals to use KMS keys in cryptographic operations. It also can allow
  /// them to view a KMS key (<a>DescribeKey</a>) and create and manage grants.
  /// When authorizing access to a KMS key, grants are considered along with key
  /// policies and IAM policies. Grants are often used for temporary permissions
  /// because you can create one, use its permissions, and delete it without
  /// changing your key policies or IAM policies.
  ///
  /// For detailed information about grants, including grant terminology, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using
  /// grants</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.
  /// For examples of working with grants in several programming languages, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming
  /// grants</a>.
  ///
  /// The <code>CreateGrant</code> operation returns a <code>GrantToken</code>
  /// and a <code>GrantId</code>.
  ///
  /// <ul>
  /// <li>
  /// When you create, retire, or revoke a grant, there might be a brief delay,
  /// usually less than five minutes, until the grant is available throughout
  /// KMS. This state is known as <i>eventual consistency</i>. Once the grant
  /// has achieved eventual consistency, the grantee principal can use the
  /// permissions in the grant without identifying the grant.
  ///
  /// However, to use the permissions in the grant immediately, use the
  /// <code>GrantToken</code> that <code>CreateGrant</code> returns. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i> <i>Key Management Service Developer Guide</i>
  /// </i>.
  /// </li>
  /// <li>
  /// The <code>CreateGrant</code> operation also returns a
  /// <code>GrantId</code>. You can use the <code>GrantId</code> and a key
  /// identifier to identify the grant in the <a>RetireGrant</a> and
  /// <a>RevokeGrant</a> operations. To find the grant ID, use the
  /// <a>ListGrants</a> or <a>ListRetirableGrants</a> operations.
  /// </li>
  /// </ul>
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a
  /// different Amazon Web Services account, specify the key ARN in the value of
  /// the <code>KeyId</code> parameter.
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
  /// The identity that gets the permissions specified in the grant.
  ///
  /// To specify the principal, use the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an Amazon Web Services principal. Valid Amazon
  /// Web Services principals include Amazon Web Services accounts (root), IAM
  /// users, IAM roles, federated users, and assumed role users. For examples of
  /// the ARN syntax to use for specifying a principal, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon
  /// Web Services Identity and Access Management (IAM)</a> in the Example ARNs
  /// section of the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [keyId] :
  /// Identifies the KMS key for the grant. The grant gives principals
  /// permission to use this KMS key.
  ///
  /// Specify the key ID or key ARN of the KMS key. To specify a KMS key in a
  /// different Amazon Web Services account, you must use the key ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [operations] :
  /// A list of operations that the grant permits.
  ///
  /// The operation must be supported on the KMS key. For example, you cannot
  /// create a grant for a symmetric KMS key that allows the <a>Sign</a>
  /// operation, or a grant for an asymmetric KMS key that allows the
  /// <a>GenerateDataKey</a> operation. If you try, KMS returns a
  /// <code>ValidationError</code> exception. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-grant-operations">Grant
  /// operations</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [constraints] :
  /// Specifies a grant constraint.
  ///
  /// KMS supports the <code>EncryptionContextEquals</code> and
  /// <code>EncryptionContextSubset</code> grant constraints. Each constraint
  /// value can include up to 8 encryption context pairs. The encryption context
  /// value in each constraint cannot exceed 384 characters.
  ///
  /// These grant constraints allow the permissions in the grant only when the
  /// encryption context in the request matches
  /// (<code>EncryptionContextEquals</code>) or includes
  /// (<code>EncryptionContextSubset</code>) the encryption context specified in
  /// this structure. For information about grant constraints, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/create-grant-overview.html#grant-constraints">Using
  /// grant constraints</a> in the <i>Key Management Service Developer
  /// Guide</i>. For more information about encryption context, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.
  ///
  /// The encryption context grant constraints are supported only on operations
  /// that include an encryption context. You cannot use an encryption context
  /// grant constraint for cryptographic operations with asymmetric KMS keys or
  /// for management operations, such as <a>DescribeKey</a> or
  /// <a>RetireGrant</a>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
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
  /// The principal that has permission to use the <a>RetireGrant</a> operation
  /// to retire the grant.
  ///
  /// To specify the principal, use the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an Amazon Web Services principal. Valid Amazon
  /// Web Services principals include Amazon Web Services accounts (root), IAM
  /// users, federated users, and assumed role users. For examples of the ARN
  /// syntax to use for specifying a principal, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon
  /// Web Services Identity and Access Management (IAM)</a> in the Example ARNs
  /// section of the <i>Amazon Web Services General Reference</i>.
  ///
  /// The grant determines the retiring principal. Other principals might have
  /// permission to retire the grant or revoke the grant. For details, see
  /// <a>RevokeGrant</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete">Retiring
  /// and revoking grants</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  Future<CreateGrantResponse> createGrant({
    required String granteePrincipal,
    required String keyId,
    required List<GrantOperation> operations,
    GrantConstraints? constraints,
    List<String>? grantTokens,
    String? name,
    String? retiringPrincipal,
  }) async {
    ArgumentError.checkNotNull(granteePrincipal, 'granteePrincipal');
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(operations, 'operations');
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
        'Operations': operations.map((e) => e.toValue()).toList(),
        if (constraints != null) 'Constraints': constraints,
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (name != null) 'Name': name,
        if (retiringPrincipal != null) 'RetiringPrincipal': retiringPrincipal,
      },
    );

    return CreateGrantResponse.fromJson(jsonResponse.body);
  }

  /// Creates a unique customer managed <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms-keys">KMS
  /// key</a> in your Amazon Web Services account and Region.
  /// <note>
  /// KMS is replacing the term <i>customer master key (CMK)</i> with <i>KMS
  /// key</i> and <i>KMS key</i>. The concept has not changed. To prevent
  /// breaking changes, KMS is keeping some variations of this term.
  /// </note>
  /// You can use the <code>CreateKey</code> operation to create symmetric or
  /// asymmetric KMS keys.
  ///
  /// <ul>
  /// <li>
  /// <b>Symmetric KMS keys</b> contain a 256-bit symmetric key that never
  /// leaves KMS unencrypted. To use the KMS key, you must call KMS. You can use
  /// a symmetric KMS key to encrypt and decrypt small amounts of data, but they
  /// are typically used to generate <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys">data
  /// keys</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-key-pairs">data
  /// keys pairs</a>. For details, see <a>GenerateDataKey</a> and
  /// <a>GenerateDataKeyPair</a>.
  /// </li>
  /// <li>
  /// <b>Asymmetric KMS keys</b> can contain an RSA key pair or an Elliptic
  /// Curve (ECC) key pair. The private key in an asymmetric KMS key never
  /// leaves KMS unencrypted. However, you can use the <a>GetPublicKey</a>
  /// operation to download the public key so it can be used outside of KMS. KMS
  /// keys with RSA key pairs can be used to encrypt or decrypt data or sign and
  /// verify messages (but not both). KMS keys with ECC key pairs can be used
  /// only to sign and verify messages.
  /// </li>
  /// </ul>
  /// For information about symmetric and asymmetric KMS keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric KMS keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// To create different types of KMS keys, use the following guidance:
  /// <dl> <dt>Asymmetric KMS keys</dt> <dd>
  /// To create an asymmetric KMS key, use the <code>KeySpec</code> parameter to
  /// specify the type of key material in the KMS key. Then, use the
  /// <code>KeyUsage</code> parameter to determine whether the KMS key will be
  /// used to encrypt and decrypt or sign and verify. You can't change these
  /// properties after the KMS key is created.
  ///
  ///
  /// </dd> <dt>Symmetric KMS keys</dt> <dd>
  /// When creating a symmetric KMS key, you don't need to specify the
  /// <code>KeySpec</code> or <code>KeyUsage</code> parameters. The default
  /// value for <code>KeySpec</code>, <code>SYMMETRIC_DEFAULT</code>, and the
  /// default value for <code>KeyUsage</code>, <code>ENCRYPT_DECRYPT</code>, are
  /// the only valid values for symmetric KMS keys.
  ///
  ///
  /// </dd> <dt>Multi-Region primary keys</dt> <dt>Imported key material</dt>
  /// <dd>
  /// To create a multi-Region <i>primary key</i> in the local Amazon Web
  /// Services Region, use the <code>MultiRegion</code> parameter with a value
  /// of <code>True</code>. To create a multi-Region <i>replica key</i>, that
  /// is, a KMS key with the same key ID and key material as a primary key, but
  /// in a different Amazon Web Services Region, use the <a>ReplicateKey</a>
  /// operation. To change a replica key to a primary key, and its primary key
  /// to a replica key, use the <a>UpdatePrimaryRegion</a> operation.
  ///
  /// This operation supports <i>multi-Region keys</i>, an KMS feature that lets
  /// you create multiple interoperable KMS keys in different Amazon Web
  /// Services Regions. Because these KMS keys have the same key ID, key
  /// material, and other metadata, you can use them interchangeably to encrypt
  /// data in one Amazon Web Services Region and decrypt it in a different
  /// Amazon Web Services Region without re-encrypting the data or making a
  /// cross-Region call. For more information about multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// You can create symmetric and asymmetric multi-Region keys and multi-Region
  /// keys with imported key material. You cannot create multi-Region keys in a
  /// custom key store.
  ///
  ///
  /// </dd> <dd>
  /// To import your own key material, begin by creating a symmetric KMS key
  /// with no key material. To do this, use the <code>Origin</code> parameter of
  /// <code>CreateKey</code> with a value of <code>EXTERNAL</code>. Next, use
  /// <a>GetParametersForImport</a> operation to get a public key and import
  /// token, and use the public key to encrypt your key material. Then, use
  /// <a>ImportKeyMaterial</a> with your import token to import the key
  /// material. For step-by-step instructions, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i> <i>Key Management Service Developer Guide</i>
  /// </i>. You cannot import the key material into an asymmetric KMS key.
  ///
  /// To create a multi-Region primary key with imported key material, use the
  /// <code>Origin</code> parameter of <code>CreateKey</code> with a value of
  /// <code>EXTERNAL</code> and the <code>MultiRegion</code> parameter with a
  /// value of <code>True</code>. To create replicas of the multi-Region primary
  /// key, use the <a>ReplicateKey</a> operation. For more information about
  /// multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  ///
  /// </dd> <dt>Custom key store</dt> <dd>
  /// To create a symmetric KMS key in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, use the <code>CustomKeyStoreId</code> parameter to specify
  /// the custom key store. You must also use the <code>Origin</code> parameter
  /// with a value of <code>AWS_CLOUDHSM</code>. The CloudHSM cluster that is
  /// associated with the custom key store must have at least two active HSMs in
  /// different Availability Zones in the Amazon Web Services Region.
  ///
  /// You cannot create an asymmetric KMS key in a custom key store. For
  /// information about custom key stores in KMS see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Using
  /// Custom Key Stores</a> in the <i> <i>Key Management Service Developer
  /// Guide</i> </i>.
  /// </dd> </dl>
  /// <b>Cross-account use</b>: No. You cannot use this operation to create a
  /// KMS key in a different Amazon Web Services account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateKey</a>
  /// (IAM policy). To use the <code>Tags</code> parameter, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a>
  /// (IAM policy). For examples and information about related permissions, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policy-example-create-key">Allow
  /// a user to create KMS keys</a> in the <i>Key Management Service Developer
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
  /// Setting this value to true increases the risk that the KMS key becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  ///
  /// For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section in the <i> <i>Key Management Service Developer
  /// Guide</i> </i>.
  /// </important>
  /// Use this parameter only when you include a policy in the request and you
  /// intend to prevent the principal that is making the request from making a
  /// subsequent <a>PutKeyPolicy</a> request on the KMS key.
  ///
  /// The default value is false.
  ///
  /// Parameter [customKeyStoreId] :
  /// Creates the KMS key in the specified <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> and the key material in its associated CloudHSM cluster. To
  /// create a KMS key in a custom key store, you must also specify the
  /// <code>Origin</code> parameter with a value of <code>AWS_CLOUDHSM</code>.
  /// The CloudHSM cluster that is associated with the custom key store must
  /// have at least two active HSMs, each in a different Availability Zone in
  /// the Region.
  ///
  /// This parameter is valid only for symmetric KMS keys and regional KMS keys.
  /// You cannot create an asymmetric KMS key or a multi-Region key in a custom
  /// key store.
  ///
  /// To find the ID of a custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  ///
  /// The response includes the custom key store ID and the ID of the CloudHSM
  /// cluster.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in KMS, which combines the convenience and
  /// extensive integration of KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// Parameter [customerMasterKeySpec] :
  /// Instead, use the <code>KeySpec</code> parameter.
  ///
  /// The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> parameters
  /// work the same way. Only the names differ. We recommend that you use
  /// <code>KeySpec</code> parameter in your code. However, to avoid breaking
  /// changes, KMS will support both parameters.
  ///
  /// Parameter [description] :
  /// A description of the KMS key.
  ///
  /// Use a description that helps you decide whether the KMS key is appropriate
  /// for a task. The default value is an empty string (no description).
  ///
  /// To set or change the description after the key is created, use
  /// <a>UpdateKeyDescription</a>.
  ///
  /// Parameter [keySpec] :
  /// Specifies the type of KMS key to create. The default value,
  /// <code>SYMMETRIC_DEFAULT</code>, creates a KMS key with a 256-bit symmetric
  /// key for encryption and decryption. For help choosing a key spec for your
  /// KMS key, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-choose.html">How
  /// to Choose Your KMS key Configuration</a> in the <i> <i>Key Management
  /// Service Developer Guide</i> </i>.
  ///
  /// The <code>KeySpec</code> determines whether the KMS key contains a
  /// symmetric key or an asymmetric key pair. It also determines the encryption
  /// algorithms or signing algorithms that the KMS key supports. You can't
  /// change the <code>KeySpec</code> after the KMS key is created. To further
  /// restrict the algorithms that can be used with the KMS key, use a condition
  /// key in its key policy or IAM policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-encryption-algorithm">kms:EncryptionAlgorithm</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-signing-algorithm">kms:Signing
  /// Algorithm</a> in the <i> <i>Key Management Service Developer Guide</i>
  /// </i>.
  /// <important>
  /// <a
  /// href="http://aws.amazon.com/kms/features/#AWS_Service_Integration">Amazon
  /// Web Services services that are integrated with KMS</a> use symmetric KMS
  /// keys to protect your data. These services do not support asymmetric KMS
  /// keys. For help determining whether a KMS key is symmetric or asymmetric,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/find-symm-asymm.html">Identifying
  /// Symmetric and Asymmetric KMS keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  /// </important>
  /// KMS supports the following key specs for KMS keys:
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
  /// Parameter [keyUsage] :
  /// Determines the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> for which you can use the KMS key. The default value is
  /// <code>ENCRYPT_DECRYPT</code>. This parameter is required only for
  /// asymmetric KMS keys. You can't change the <code>KeyUsage</code> value
  /// after the KMS key is created.
  ///
  /// Select only one valid value.
  ///
  /// <ul>
  /// <li>
  /// For symmetric KMS keys, omit the parameter or specify
  /// <code>ENCRYPT_DECRYPT</code>.
  /// </li>
  /// <li>
  /// For asymmetric KMS keys with RSA key material, specify
  /// <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>.
  /// </li>
  /// <li>
  /// For asymmetric KMS keys with ECC key material, specify
  /// <code>SIGN_VERIFY</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [multiRegion] :
  /// Creates a multi-Region primary key that you can replicate into other
  /// Amazon Web Services Regions. You cannot change this value after you create
  /// the KMS key.
  ///
  /// For a multi-Region key, set this parameter to <code>True</code>. For a
  /// single-Region KMS key, omit this parameter or set it to
  /// <code>False</code>. The default value is <code>False</code>.
  ///
  /// This operation supports <i>multi-Region keys</i>, an KMS feature that lets
  /// you create multiple interoperable KMS keys in different Amazon Web
  /// Services Regions. Because these KMS keys have the same key ID, key
  /// material, and other metadata, you can use them interchangeably to encrypt
  /// data in one Amazon Web Services Region and decrypt it in a different
  /// Amazon Web Services Region without re-encrypting the data or making a
  /// cross-Region call. For more information about multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// This value creates a <i>primary key</i>, not a replica. To create a
  /// <i>replica key</i>, use the <a>ReplicateKey</a> operation.
  ///
  /// You can create a symmetric or asymmetric multi-Region key, and you can
  /// create a multi-Region key with imported key material. However, you cannot
  /// create a multi-Region key in a custom key store.
  ///
  /// Parameter [origin] :
  /// The source of the key material for the KMS key. You cannot change the
  /// origin after you create the KMS key. The default is <code>AWS_KMS</code>,
  /// which means that KMS creates the key material.
  ///
  /// To create a KMS key with no key material (for imported key material), set
  /// the value to <code>EXTERNAL</code>. For more information about importing
  /// key material into KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>Key Management Service Developer Guide</i>.
  /// This value is valid only for symmetric KMS keys.
  ///
  /// To create a KMS key in an KMS <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> and create its key material in the associated CloudHSM
  /// cluster, set this value to <code>AWS_CLOUDHSM</code>. You must also use
  /// the <code>CustomKeyStoreId</code> parameter to identify the custom key
  /// store. This value is valid only for symmetric KMS keys.
  ///
  /// Parameter [policy] :
  /// The key policy to attach to the KMS key.
  ///
  /// If you provide a key policy, it must meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the
  /// key policy must allow the principal that is making the
  /// <code>CreateKey</code> request to make a subsequent <a>PutKeyPolicy</a>
  /// request on the KMS key. This reduces the risk that the KMS key becomes
  /// unmanageable. For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section of the <i> <i>Key Management Service Developer
  /// Guide</i> </i>.
  /// </li>
  /// <li>
  /// Each statement in the key policy must contain one or more principals. The
  /// principals in the key policy must exist and be visible to KMS. When you
  /// create a new Amazon Web Services principal (for example, an IAM user or
  /// role), you might need to enforce a delay before including the new
  /// principal in a key policy because the new principal might not be
  /// immediately visible to KMS. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes
  /// that I make are not always immediately visible</a> in the <i>Amazon Web
  /// Services Identity and Access Management User Guide</i>.
  /// </li>
  /// </ul>
  /// If you do not provide a key policy, KMS attaches a default key policy to
  /// the KMS key. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">Default
  /// Key Policy</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// The key policy size quota is 32 kilobytes (32768 bytes).
  ///
  /// For help writing and formatting a JSON policy document, see the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM
  /// JSON Policy Reference</a> in the <i> <i>Identity and Access Management
  /// User Guide</i> </i>.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags to the KMS key. Use this parameter to tag the KMS
  /// key when it is created. To tag an existing KMS key, use the
  /// <a>TagResource</a> operation.
  /// <note>
  /// Tagging or untagging a KMS key can allow or deny permission to the KMS
  /// key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  /// To use this parameter, you must have <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a>
  /// permission in an IAM policy.
  ///
  /// Each tag consists of a tag key and a tag value. Both the tag key and the
  /// tag value are required, but the tag value can be an empty (null) string.
  /// You cannot have more than one tag on a KMS key with the same tag key. If
  /// you specify an existing tag key with a different tag value, KMS replaces
  /// the current tag value with the specified one.
  ///
  /// When you add tags to an Amazon Web Services resource, Amazon Web Services
  /// generates a cost allocation report with usage and costs aggregated by
  /// tags. Tags can also be used to control access to a KMS key. For details,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// Keys</a>.
  Future<CreateKeyResponse> createKey({
    bool? bypassPolicyLockoutSafetyCheck,
    String? customKeyStoreId,
    CustomerMasterKeySpec? customerMasterKeySpec,
    String? description,
    KeySpec? keySpec,
    KeyUsageType? keyUsage,
    bool? multiRegion,
    OriginType? origin,
    String? policy,
    List<Tag>? tags,
  }) async {
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
        if (keySpec != null) 'KeySpec': keySpec.toValue(),
        if (keyUsage != null) 'KeyUsage': keyUsage.toValue(),
        if (multiRegion != null) 'MultiRegion': multiRegion,
        if (origin != null) 'Origin': origin.toValue(),
        if (policy != null) 'Policy': policy,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateKeyResponse.fromJson(jsonResponse.body);
  }

  /// Decrypts ciphertext that was encrypted by a KMS key using any of the
  /// following operations:
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
  /// a symmetric or asymmetric KMS key. When the KMS key is asymmetric, you
  /// must specify the KMS key and the encryption algorithm that was used to
  /// encrypt the ciphertext. For information about symmetric and asymmetric KMS
  /// keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric KMS keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// The Decrypt operation also decrypts ciphertext that was encrypted outside
  /// of KMS by the public key in an KMS asymmetric KMS key. However, it cannot
  /// decrypt ciphertext produced by other libraries, such as the <a
  /// href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">Amazon
  /// Web Services Encryption SDK</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 client-side encryption</a>. These libraries return a ciphertext format
  /// that is incompatible with KMS.
  ///
  /// If the ciphertext was encrypted under a symmetric KMS key, the
  /// <code>KeyId</code> parameter is optional. KMS can get this information
  /// from metadata that it adds to the symmetric ciphertext blob. This feature
  /// adds durability to your implementation by ensuring that authorized users
  /// can decrypt ciphertext decades after it was encrypted, even if they've
  /// lost track of the key ID. However, specifying the KMS key is always
  /// recommended as a best practice. When you use the <code>KeyId</code>
  /// parameter to specify a KMS key, KMS only uses the KMS key you specify. If
  /// the ciphertext was encrypted under a different KMS key, the
  /// <code>Decrypt</code> operation fails. This practice ensures that you use
  /// the KMS key that you intend.
  ///
  /// Whenever possible, use key policies to give users permission to call the
  /// <code>Decrypt</code> operation on a particular KMS key, instead of using
  /// IAM policies. Otherwise, you might create an IAM user policy that gives
  /// the user <code>Decrypt</code> permission on all KMS keys. This user could
  /// decrypt ciphertext that was encrypted by KMS keys in other accounts if the
  /// key policy for the cross-account KMS key permits it. If you must use an
  /// IAM policy for <code>Decrypt</code> permissions, limit the user to
  /// particular KMS keys or particular trusted accounts. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policies-best-practices">Best
  /// practices for IAM policies</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// Applications in Amazon Web Services Nitro Enclaves can call this operation
  /// by using the <a
  /// href="https://github.com/aws/aws-nitro-enclaves-sdk-c">Amazon Web Services
  /// Nitro Enclaves Development Kit</a>. For information about the supporting
  /// parameters, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html">How
  /// Amazon Web Services Nitro Enclaves use KMS</a> in the <i>Key Management
  /// Service Developer Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// asymmetric KMS key. The default value, <code>SYMMETRIC_DEFAULT</code>,
  /// represents the only supported algorithm that is valid for symmetric KMS
  /// keys.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context to use when decrypting the data. An
  /// encryption context is valid only for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> with a symmetric KMS key. The standard asymmetric
  /// encryption algorithms that KMS uses do not support an encryption context.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [keyId] :
  /// Specifies the KMS key that KMS uses to decrypt the ciphertext. Enter a key
  /// ID of the KMS key that was used to encrypt the ciphertext.
  ///
  /// This parameter is required only when the ciphertext was encrypted under an
  /// asymmetric KMS key. If you used a symmetric KMS key, KMS can get the KMS
  /// key from metadata that it adds to the symmetric ciphertext blob. However,
  /// it is always recommended as a best practice. This practice ensures that
  /// you use the KMS key that you intend.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  Future<DecryptResponse> decrypt({
    required Uint8List ciphertextBlob,
    EncryptionAlgorithmSpec? encryptionAlgorithm,
    Map<String, String>? encryptionContext,
    List<String>? grantTokens,
    String? keyId,
  }) async {
    ArgumentError.checkNotNull(ciphertextBlob, 'ciphertextBlob');
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
        'CiphertextBlob': base64Encode(ciphertextBlob),
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
  /// <note>
  /// Adding, deleting, or updating an alias can allow or deny permission to the
  /// KMS key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  /// Because an alias is not a property of a KMS key, you can delete and change
  /// the aliases of a KMS key without affecting the KMS key. Also, aliases do
  /// not appear in the response from the <a>DescribeKey</a> operation. To get
  /// the aliases of all KMS keys, use the <a>ListAliases</a> operation.
  ///
  /// Each KMS key can have multiple aliases. To change the alias of a KMS key,
  /// use <a>DeleteAlias</a> to delete the current alias and <a>CreateAlias</a>
  /// to create a new alias. To associate an existing alias with a different KMS
  /// key, call <a>UpdateAlias</a>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on an
  /// alias in a different Amazon Web Services account.
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
  /// on the KMS key (key policy).
  /// </li>
  /// </ul>
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>Key Management Service Developer
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
    required String aliasName,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DeleteAlias'
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

  /// Deletes a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. This operation does not delete the CloudHSM cluster that is
  /// associated with the custom key store, or affect any users or keys in the
  /// cluster.
  ///
  /// The custom key store that you delete cannot contain any KMS <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys">KMS
  /// keys</a>. Before deleting the key store, verify that you will never need
  /// to use any of the KMS keys in the key store for any <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>. Then, use <a>ScheduleKeyDeletion</a> to delete the KMS
  /// keys from the key store. When the scheduled waiting period expires, the
  /// <code>ScheduleKeyDeletion</code> operation deletes the KMS keys. Then it
  /// makes a best effort to delete the key material from the associated
  /// cluster. However, you might need to manually <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key">delete
  /// the orphaned key material</a> from the cluster and its backups.
  ///
  /// After all KMS keys are deleted from KMS, use
  /// <a>DisconnectCustomKeyStore</a> to disconnect the key store from KMS.
  /// Then, you can delete the custom key store.
  ///
  /// Instead of deleting the custom key store, consider using
  /// <a>DisconnectCustomKeyStore</a> to disconnect it from KMS. While the key
  /// store is disconnected, you cannot create or use the KMS keys in the key
  /// store. But, you do not need to delete KMS keys and you can reconnect a
  /// disconnected custom key store at any time.
  ///
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in KMS, which combines the convenience and
  /// extensive integration of KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different Amazon Web Services account.
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
    required String customKeyStoreId,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DeleteCustomKeyStore'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomKeyStoreId': customKeyStoreId,
      },
    );
  }

  /// Deletes key material that you previously imported. This operation makes
  /// the specified KMS key unusable. For more information about importing key
  /// material into KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// When the specified KMS key is in the <code>PendingDeletion</code> state,
  /// this operation does not change the KMS key's state. Otherwise, it changes
  /// the KMS key's state to <code>PendingImport</code>.
  ///
  /// After you delete key material, you can use <a>ImportKeyMaterial</a> to
  /// reimport the same key material into the KMS key.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Identifies the KMS key from which you are deleting imported key material.
  /// The <code>Origin</code> of the KMS key must be <code>EXTERNAL</code>.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> deleteImportedKeyMaterial({
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DeleteImportedKeyMaterial'
    };
    await _protocol.send(
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
  /// key stores</a> in the account and Region.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in KMS, which combines the convenience and
  /// extensive integration of KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// By default, this operation returns information about all custom key stores
  /// in the account and Region. To get only information about a particular
  /// custom key store, use either the <code>CustomKeyStoreName</code> or
  /// <code>CustomKeyStoreId</code> parameter (but not both).
  ///
  /// To determine whether the custom key store is connected to its CloudHSM
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
  /// it, make sure that its associated CloudHSM cluster is active and contains
  /// the minimum number of HSMs required for the operation, if any.
  ///
  /// For help repairing your custom key store, see the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting
  /// Custom Key Stores</a> topic in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different Amazon Web Services account.
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
  /// May throw [InvalidMarkerException].
  /// May throw [KMSInternalException].
  ///
  /// Parameter [customKeyStoreId] :
  /// Gets only information about the specified custom key store. Enter the key
  /// store ID.
  ///
  /// By default, this operation gets information about all custom key stores in
  /// the account and Region. To limit the output to a particular custom key
  /// store, you can use either the <code>CustomKeyStoreId</code> or
  /// <code>CustomKeyStoreName</code> parameter, but not both.
  ///
  /// Parameter [customKeyStoreName] :
  /// Gets only information about the specified custom key store. Enter the
  /// friendly name of the custom key store.
  ///
  /// By default, this operation gets information about all custom key stores in
  /// the account and Region. To limit the output to a particular custom key
  /// store, you can use either the <code>CustomKeyStoreId</code> or
  /// <code>CustomKeyStoreName</code> parameter, but not both.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, KMS does not return more than the specified number
  /// of items, but it might return fewer.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<DescribeCustomKeyStoresResponse> describeCustomKeyStores({
    String? customKeyStoreId,
    String? customKeyStoreName,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
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

  /// Provides detailed information about a KMS key. You can run
  /// <code>DescribeKey</code> on a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed key</a> or an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed key</a>.
  ///
  /// This detailed information includes the key ARN, creation date (and
  /// deletion date, if applicable), the key state, and the origin and
  /// expiration date (if any) of the key material. It includes fields, like
  /// <code>KeySpec</code>, that help you distinguish symmetric from asymmetric
  /// KMS keys. It also provides information that is particularly important to
  /// asymmetric keys, such as the key usage (encryption or signing) and the
  /// encryption algorithms or signing algorithms that the KMS key supports. For
  /// KMS keys in custom key stores, it includes information about the custom
  /// key store, such as the key store ID and the CloudHSM cluster ID. For
  /// multi-Region keys, it displays the primary key and all related replica
  /// keys.
  ///
  /// <code>DescribeKey</code> does not return the following information:
  ///
  /// <ul>
  /// <li>
  /// Aliases associated with the KMS key. To get this information, use
  /// <a>ListAliases</a>.
  /// </li>
  /// <li>
  /// Whether automatic key rotation is enabled on the KMS key. To get this
  /// information, use <a>GetKeyRotationStatus</a>. Also, some key states
  /// prevent a KMS key from being automatically rotated. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-how-it-works">How
  /// Automatic Key Rotation Works</a> in <i>Key Management Service Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// Tags on the KMS key. To get this information, use <a>ListResourceTags</a>.
  /// </li>
  /// <li>
  /// Key policies and grants on the KMS key. To get this information, use
  /// <a>GetKeyPolicy</a> and <a>ListGrants</a>.
  /// </li>
  /// </ul>
  /// If you call the <code>DescribeKey</code> operation on a <i>predefined
  /// Amazon Web Services alias</i>, that is, an Amazon Web Services alias with
  /// no key ID, KMS creates an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed key</a>. Then, it associates the alias with the new
  /// KMS key, and returns the <code>KeyId</code> and <code>Arn</code> of the
  /// new KMS key in the response.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Describes the specified KMS key.
  ///
  /// If you specify a predefined Amazon Web Services alias (an Amazon Web
  /// Services alias with no key ID), KMS associates the alias with an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html##aws-managed-cmk">Amazon
  /// Web Services managed key</a> and returns its <code>KeyId</code> and
  /// <code>Arn</code> in the response.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  Future<DescribeKeyResponse> describeKey({
    required String keyId,
    List<String>? grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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

  /// Sets the state of a KMS key to disabled. This change temporarily prevents
  /// use of the KMS key for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>.
  ///
  /// For more information about how key state affects the use of a KMS key, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i> <i>Key Management Service
  /// Developer Guide</i> </i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Identifies the KMS key to disable.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> disableKey({
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DisableKey'
    };
    await _protocol.send(
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
  /// rotation of the key material</a> for the specified symmetric KMS key.
  ///
  /// You cannot enable automatic rotation of <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric
  /// KMS keys</a>, KMS keys with <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported
  /// key material</a>, or KMS keys in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. To enable or disable automatic rotation of a set of related
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-replica-key">multi-Region
  /// keys</a>, set the property on the primary key.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Identifies a symmetric KMS key. You cannot enable or disable automatic
  /// rotation of <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html#asymmetric-cmks">asymmetric
  /// KMS keys</a>, KMS keys with <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported
  /// key material</a>, or KMS keys in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> disableKeyRotation({
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DisableKeyRotation'
    };
    await _protocol.send(
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
  /// key store</a> from its associated CloudHSM cluster. While a custom key
  /// store is disconnected, you can manage the custom key store and its KMS
  /// keys, but you cannot create or use KMS keys in the custom key store. You
  /// can reconnect the custom key store at any time.
  /// <note>
  /// While a custom key store is disconnected, all attempts to create KMS keys
  /// in the custom key store or to use existing KMS keys in <a
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
  /// Key Store feature</a> feature in KMS, which combines the convenience and
  /// extensive integration of KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different Amazon Web Services account.
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
    required String customKeyStoreId,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.DisconnectCustomKeyStore'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CustomKeyStoreId': customKeyStoreId,
      },
    );
  }

  /// Sets the key state of a KMS key to enabled. This allows you to use the KMS
  /// key for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Identifies the KMS key to enable.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> enableKey({
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.EnableKey'
    };
    await _protocol.send(
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
  /// rotation of the key material</a> for the specified symmetric KMS key.
  ///
  /// You cannot enable automatic rotation of <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric
  /// KMS keys</a>, KMS keys with <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported
  /// key material</a>, or KMS keys in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. To enable or disable automatic rotation of a set of related
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-replica-key">multi-Region
  /// keys</a>, set the property on the primary key.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Identifies a symmetric KMS key. You cannot enable automatic rotation of <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric
  /// KMS keys</a>, KMS keys with <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported
  /// key material</a>, or KMS keys in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. To enable or disable automatic rotation of a set of related
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-replica-key">multi-Region
  /// keys</a>, set the property on the primary key.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> enableKeyRotation({
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.EnableKeyRotation'
    };
    await _protocol.send(
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

  /// Encrypts plaintext into ciphertext by using a KMS key. The
  /// <code>Encrypt</code> operation has two primary use cases:
  ///
  /// <ul>
  /// <li>
  /// You can encrypt small amounts of arbitrary data, such as a personal
  /// identifier or database password, or other sensitive information.
  /// </li>
  /// <li>
  /// You can use the <code>Encrypt</code> operation to move encrypted data from
  /// one Amazon Web Services Region to another. For example, in Region A,
  /// generate a data key and use the plaintext key to encrypt your data. Then,
  /// in Region A, use the <code>Encrypt</code> operation to encrypt the
  /// plaintext data key under a KMS key in Region B. Now, you can move the
  /// encrypted data and the encrypted data key to Region B. When necessary, you
  /// can decrypt the encrypted data key and the encrypted data entirely within
  /// in Region B.
  /// </li>
  /// </ul>
  /// You don't need to use the <code>Encrypt</code> operation to encrypt a data
  /// key. The <a>GenerateDataKey</a> and <a>GenerateDataKeyPair</a> operations
  /// return a plaintext data key and an encrypted copy of that data key.
  ///
  /// When you encrypt data, you must specify a symmetric or asymmetric KMS key
  /// to use in the encryption operation. The KMS key must have a
  /// <code>KeyUsage</code> value of <code>ENCRYPT_DECRYPT.</code> To find the
  /// <code>KeyUsage</code> of a KMS key, use the <a>DescribeKey</a> operation.
  ///
  /// If you use a symmetric KMS key, you can use an encryption context to add
  /// additional security to your encryption operation. If you specify an
  /// <code>EncryptionContext</code> when encrypting data, you must specify the
  /// same encryption context (a case-sensitive exact match) when decrypting the
  /// data. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// If you specify an asymmetric KMS key, you must also specify the encryption
  /// algorithm. The algorithm must be compatible with the KMS key type.
  /// <important>
  /// When you use an asymmetric KMS key to encrypt or reencrypt data, be sure
  /// to record the KMS key and encryption algorithm that you choose. You will
  /// be required to provide the same KMS key and encryption algorithm when you
  /// decrypt the data. If the KMS key and algorithm do not match the values
  /// used to encrypt the data, the decrypt operation fails.
  ///
  /// You are not required to supply the key ID and encryption algorithm when
  /// you decrypt with symmetric KMS keys because KMS stores this information in
  /// the ciphertext blob. KMS cannot store metadata in ciphertext generated
  /// with asymmetric keys. The standard format for asymmetric key ciphertext
  /// does not include configurable fields.
  /// </important>
  /// The maximum size of the data that you can encrypt varies with the type of
  /// KMS key and the encryption algorithm that you choose.
  ///
  /// <ul>
  /// <li>
  /// Symmetric KMS keys
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
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Identifies the KMS key to use in the encryption operation.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [plaintext] :
  /// Data to be encrypted.
  ///
  /// Parameter [encryptionAlgorithm] :
  /// Specifies the encryption algorithm that KMS will use to encrypt the
  /// plaintext message. The algorithm must be compatible with the KMS key that
  /// you specify.
  ///
  /// This parameter is required only for asymmetric KMS keys. The default
  /// value, <code>SYMMETRIC_DEFAULT</code>, is the algorithm used for symmetric
  /// KMS keys. If you are using an asymmetric KMS key, we recommend
  /// RSAES_OAEP_SHA_256.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used to encrypt the data. An
  /// encryption context is valid only for <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> with a symmetric KMS key. The standard asymmetric
  /// encryption algorithms that KMS uses do not support an encryption context.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  Future<EncryptResponse> encrypt({
    required String keyId,
    required Uint8List plaintext,
    EncryptionAlgorithmSpec? encryptionAlgorithm,
    Map<String, String>? encryptionContext,
    List<String>? grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
        'Plaintext': base64Encode(plaintext),
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
  /// encrypted under a KMS key that you specify. You can use the plaintext key
  /// to encrypt your data outside of KMS and store the encrypted data key with
  /// the encrypted data.
  ///
  /// <code>GenerateDataKey</code> returns a unique data key for each request.
  /// The bytes in the plaintext key are not related to the caller or the KMS
  /// key.
  ///
  /// To generate a data key, specify the symmetric KMS key that will be used to
  /// encrypt the data key. You cannot use an asymmetric KMS key to generate
  /// data keys. To get the type of your KMS key, use the <a>DescribeKey</a>
  /// operation. You must also specify the length of the data key. Use either
  /// the <code>KeySpec</code> or <code>NumberOfBytes</code> parameters (but not
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
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Applications in Amazon Web Services Nitro Enclaves can call this operation
  /// by using the <a
  /// href="https://github.com/aws/aws-nitro-enclaves-sdk-c">Amazon Web Services
  /// Nitro Enclaves Development Kit</a>. For information about the supporting
  /// parameters, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html">How
  /// Amazon Web Services Nitro Enclaves use KMS</a> in the <i>Key Management
  /// Service Developer Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>How to use your data key</b>
  ///
  /// We recommend that you use the following pattern to encrypt data locally in
  /// your application. You can write your own code or use a client-side
  /// encryption library, such as the <a
  /// href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">Amazon
  /// Web Services Encryption SDK</a>, the <a
  /// href="https://docs.aws.amazon.com/dynamodb-encryption-client/latest/devguide/">Amazon
  /// DynamoDB Encryption Client</a>, or <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 client-side encryption</a> to do these tasks for you.
  ///
  /// To encrypt data outside of KMS:
  /// <ol>
  /// <li>
  /// Use the <code>GenerateDataKey</code> operation to get a data key.
  /// </li>
  /// <li>
  /// Use the plaintext data key (in the <code>Plaintext</code> field of the
  /// response) to encrypt your data outside of KMS. Then erase the plaintext
  /// data key from memory.
  /// </li>
  /// <li>
  /// Store the encrypted data key (in the <code>CiphertextBlob</code> field of
  /// the response) with the encrypted data.
  /// </li> </ol>
  /// To decrypt data outside of KMS:
  /// <ol>
  /// <li>
  /// Use the <a>Decrypt</a> operation to decrypt the encrypted data key. The
  /// operation returns a plaintext copy of the data key.
  /// </li>
  /// <li>
  /// Use the plaintext data key to decrypt data outside of KMS, then erase the
  /// plaintext data key from memory.
  /// </li> </ol>
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Identifies the symmetric KMS key that encrypts the data key.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
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
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
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
    required String keyId,
    Map<String, String>? encryptionContext,
    List<String>? grantTokens,
    DataKeySpec? keySpec,
    int? numberOfBytes,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
  /// under the symmetric KMS key you specify. You can use the data key pair to
  /// perform asymmetric cryptography and implement digital signatures outside
  /// of KMS.
  ///
  /// You can use the public key that <code>GenerateDataKeyPair</code> returns
  /// to encrypt data or verify a signature outside of KMS. Then, store the
  /// encrypted private key with the data. When you are ready to decrypt data or
  /// sign a message, you can use the <a>Decrypt</a> operation to decrypt the
  /// encrypted private key.
  ///
  /// To generate a data key pair, you must specify a symmetric KMS key to
  /// encrypt the private key in a data key pair. You cannot use an asymmetric
  /// KMS key or a KMS key in a custom key store. To get the type and origin of
  /// your KMS key, use the <a>DescribeKey</a> operation.
  ///
  /// Use the <code>KeyPairSpec</code> parameter to choose an RSA or Elliptic
  /// Curve (ECC) data key pair. KMS recommends that your use ECC key pairs for
  /// signing, and use RSA key pairs for either encryption or signing, but not
  /// both. However, KMS cannot enforce any restrictions on the use of data key
  /// pairs outside of KMS.
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
  /// <code>GenerateDataKeyPair</code> returns a unique data key pair for each
  /// request. The bytes in the keys are not related to the caller or the KMS
  /// key that is used to encrypt the private key. The public key is a
  /// DER-encoded X.509 SubjectPublicKeyInfo, as specified in <a
  /// href="https://tools.ietf.org/html/rfc5280">RFC 5280</a>. The private key
  /// is a DER-encoded PKCS8 PrivateKeyInfo, as specified in <a
  /// href="https://tools.ietf.org/html/rfc5958">RFC 5958</a>.
  ///
  /// You can use the optional encryption context to add additional security to
  /// the encryption operation. If you specify an
  /// <code>EncryptionContext</code>, you must specify the same encryption
  /// context (a case-sensitive exact match) when decrypting the encrypted data
  /// key. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Specifies the symmetric KMS key that encrypts the private key in the data
  /// key pair. You cannot specify an asymmetric KMS key or a KMS key in a
  /// custom key store. To get the type and origin of your KMS key, use the
  /// <a>DescribeKey</a> operation.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [keyPairSpec] :
  /// Determines the type of data key pair that is generated.
  ///
  /// The KMS rule that restricts the use of asymmetric RSA KMS keys to encrypt
  /// and decrypt or to sign and verify (but not both), and the rule that
  /// permits you to use ECC KMS keys only to sign and verify, are not effective
  /// on data key pairs, which are used outside of KMS.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used when encrypting the
  /// private key in the data key pair.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  Future<GenerateDataKeyPairResponse> generateDataKeyPair({
    required String keyId,
    required DataKeyPairSpec keyPairSpec,
    Map<String, String>? encryptionContext,
    List<String>? grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
        'KeyPairSpec': keyPairSpec.toValue(),
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
      },
    );

    return GenerateDataKeyPairResponse.fromJson(jsonResponse.body);
  }

  /// Generates a unique asymmetric data key pair. The
  /// <code>GenerateDataKeyPairWithoutPlaintext</code> operation returns a
  /// plaintext public key and a copy of the private key that is encrypted under
  /// the symmetric KMS key you specify. Unlike <a>GenerateDataKeyPair</a>, this
  /// operation does not return a plaintext private key.
  ///
  /// You can use the public key that
  /// <code>GenerateDataKeyPairWithoutPlaintext</code> returns to encrypt data
  /// or verify a signature outside of KMS. Then, store the encrypted private
  /// key with the data. When you are ready to decrypt data or sign a message,
  /// you can use the <a>Decrypt</a> operation to decrypt the encrypted private
  /// key.
  ///
  /// To generate a data key pair, you must specify a symmetric KMS key to
  /// encrypt the private key in a data key pair. You cannot use an asymmetric
  /// KMS key or a KMS key in a custom key store. To get the type and origin of
  /// your KMS key, use the <a>DescribeKey</a> operation.
  ///
  /// Use the <code>KeyPairSpec</code> parameter to choose an RSA or Elliptic
  /// Curve (ECC) data key pair. KMS recommends that your use ECC key pairs for
  /// signing, and use RSA key pairs for either encryption or signing, but not
  /// both. However, KMS cannot enforce any restrictions on the use of data key
  /// pairs outside of KMS.
  ///
  /// <code>GenerateDataKeyPairWithoutPlaintext</code> returns a unique data key
  /// pair for each request. The bytes in the key are not related to the caller
  /// or KMS key that is used to encrypt the private key. The public key is a
  /// DER-encoded X.509 SubjectPublicKeyInfo, as specified in <a
  /// href="https://tools.ietf.org/html/rfc5280">RFC 5280</a>.
  ///
  /// You can use the optional encryption context to add additional security to
  /// the encryption operation. If you specify an
  /// <code>EncryptionContext</code>, you must specify the same encryption
  /// context (a case-sensitive exact match) when decrypting the encrypted data
  /// key. Otherwise, the request to decrypt fails with an
  /// <code>InvalidCiphertextException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Specifies the KMS key that encrypts the private key in the data key pair.
  /// You must specify a symmetric KMS key. You cannot use an asymmetric KMS key
  /// or a KMS key in a custom key store. To get the type and origin of your KMS
  /// key, use the <a>DescribeKey</a> operation.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [keyPairSpec] :
  /// Determines the type of data key pair that is generated.
  ///
  /// The KMS rule that restricts the use of asymmetric RSA KMS keys to encrypt
  /// and decrypt or to sign and verify (but not both), and the rule that
  /// permits you to use ECC KMS keys only to sign and verify, are not effective
  /// on data key pairs, which are used outside of KMS.
  ///
  /// Parameter [encryptionContext] :
  /// Specifies the encryption context that will be used when encrypting the
  /// private key in the data key pair.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  Future<GenerateDataKeyPairWithoutPlaintextResponse>
      generateDataKeyPairWithoutPlaintext({
    required String keyId,
    required DataKeyPairSpec keyPairSpec,
    Map<String, String>? encryptionContext,
    List<String>? grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
        'KeyPairSpec': keyPairSpec.toValue(),
        if (encryptionContext != null) 'EncryptionContext': encryptionContext,
        if (grantTokens != null) 'GrantTokens': grantTokens,
      },
    );

    return GenerateDataKeyPairWithoutPlaintextResponse.fromJson(
        jsonResponse.body);
  }

  /// Generates a unique symmetric data key. This operation returns a data key
  /// that is encrypted under a KMS key that you specify. To request an
  /// asymmetric data key pair, use the <a>GenerateDataKeyPair</a> or
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
  /// each request. The bytes in the keys are not related to the caller or KMS
  /// key that is used to encrypt the private key.
  ///
  /// To generate a data key, you must specify the symmetric KMS key that is
  /// used to encrypt the data key. You cannot use an asymmetric KMS key to
  /// generate a data key. To get the type of your KMS key, use the
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
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// The identifier of the symmetric KMS key that encrypts the data key.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
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
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
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
    required String keyId,
    Map<String, String>? encryptionContext,
    List<String>? grantTokens,
    DataKeySpec? keySpec,
    int? numberOfBytes,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
  /// By default, the random byte string is generated in KMS. To generate the
  /// byte string in the CloudHSM cluster that is associated with a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, specify the custom key store ID.
  ///
  /// Applications in Amazon Web Services Nitro Enclaves can call this operation
  /// by using the <a
  /// href="https://github.com/aws/aws-nitro-enclaves-sdk-c">Amazon Web Services
  /// Nitro Enclaves Development Kit</a>. For information about the supporting
  /// parameters, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html">How
  /// Amazon Web Services Nitro Enclaves use KMS</a> in the <i>Key Management
  /// Service Developer Guide</i>.
  ///
  /// For more information about entropy and random number generation, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/cryptographic-details/">Key
  /// Management Service Cryptographic Details</a>.
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
  /// Generates the random byte string in the CloudHSM cluster that is
  /// associated with the specified <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. To find the ID of a custom key store, use the
  /// <a>DescribeCustomKeyStores</a> operation.
  ///
  /// Parameter [numberOfBytes] :
  /// The length of the byte string.
  Future<GenerateRandomResponse> generateRandom({
    String? customKeyStoreId,
    int? numberOfBytes,
  }) async {
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

  /// Gets a key policy attached to the specified KMS key.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Gets the key policy for the specified KMS key.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [policyName] :
  /// Specifies the name of the key policy. The only valid name is
  /// <code>default</code>. To get the names of key policies, use
  /// <a>ListKeyPolicies</a>.
  Future<GetKeyPolicyResponse> getKeyPolicy({
    required String keyId,
    required String policyName,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(policyName, 'policyName');
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
  /// rotation of the key material</a> is enabled for the specified KMS key.
  ///
  /// You cannot enable automatic rotation of <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric
  /// KMS keys</a>, KMS keys with <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported
  /// key material</a>, or KMS keys in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>. To enable or disable automatic rotation of a set of related
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-replica-key">multi-Region
  /// keys</a>, set the property on the primary key. The key rotation status for
  /// these KMS keys is always <code>false</code>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// Disabled: The key rotation status does not change when you disable a KMS
  /// key. However, while the KMS key is disabled, KMS does not rotate the key
  /// material.
  /// </li>
  /// <li>
  /// Pending deletion: While a KMS key is pending deletion, its key rotation
  /// status is <code>false</code> and KMS does not rotate the key material. If
  /// you cancel the deletion, the original key rotation status is restored.
  /// </li>
  /// </ul>
  /// <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a
  /// different Amazon Web Services account, specify the key ARN in the value of
  /// the <code>KeyId</code> parameter.
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
  /// Gets the rotation status for the specified KMS key.
  ///
  /// Specify the key ID or key ARN of the KMS key. To specify a KMS key in a
  /// different Amazon Web Services account, you must use the key ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<GetKeyRotationStatusResponse> getKeyRotationStatus({
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
  /// customer managed KMS key. For more information about importing key
  /// material into KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// This operation returns a public key and an import token. Use the public
  /// key to encrypt the symmetric key material. Store the import token to send
  /// with a subsequent <a>ImportKeyMaterial</a> request.
  ///
  /// You must specify the key ID of the symmetric KMS key into which you will
  /// import key material. This KMS key's <code>Origin</code> must be
  /// <code>EXTERNAL</code>. You must also specify the wrapping algorithm and
  /// type of wrapping key (public key) that you will use to encrypt the key
  /// material. You cannot perform this operation on an asymmetric KMS key or on
  /// any KMS key in a different Amazon Web Services account.
  ///
  /// To import key material, you must use the public key and import token from
  /// the same response. These items are valid for 24 hours. The expiration date
  /// and time appear in the <code>GetParametersForImport</code> response. You
  /// cannot use an expired token in an <a>ImportKeyMaterial</a> request. If
  /// your key and token expire, send another
  /// <code>GetParametersForImport</code> request.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// The identifier of the symmetric KMS key into which you will import key
  /// material. The <code>Origin</code> of the KMS key must be
  /// <code>EXTERNAL</code>.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [wrappingAlgorithm] :
  /// The algorithm you will use to encrypt the key material before importing it
  /// with <a>ImportKeyMaterial</a>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys-encrypt-key-material.html">Encrypt
  /// the Key Material</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [wrappingKeySpec] :
  /// The type of wrapping key (public key) to return in the response. Only
  /// 2048-bit RSA public keys are supported.
  Future<GetParametersForImportResponse> getParametersForImport({
    required String keyId,
    required AlgorithmSpec wrappingAlgorithm,
    required WrappingKeySpec wrappingKeySpec,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
        'WrappingAlgorithm': wrappingAlgorithm.toValue(),
        'WrappingKeySpec': wrappingKeySpec.toValue(),
      },
    );

    return GetParametersForImportResponse.fromJson(jsonResponse.body);
  }

  /// Returns the public key of an asymmetric KMS key. Unlike the private key of
  /// a asymmetric KMS key, which never leaves KMS unencrypted, callers with
  /// <code>kms:GetPublicKey</code> permission can download the public key of an
  /// asymmetric KMS key. You can share the public key to allow others to
  /// encrypt messages and verify signatures outside of KMS. For information
  /// about symmetric and asymmetric KMS keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric KMS keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// You do not need to download the public key. Instead, you can use the
  /// public key within KMS by calling the <a>Encrypt</a>, <a>ReEncrypt</a>, or
  /// <a>Verify</a> operations with the identifier of an asymmetric KMS key.
  /// When you use the public key within KMS, you benefit from the
  /// authentication, authorization, and logging that are part of every KMS
  /// operation. You also reduce of risk of encrypting data that cannot be
  /// decrypted. These features are not effective outside of KMS. For details,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/download-public-key.html#download-public-key-considerations">Special
  /// Considerations for Downloading Public Keys</a>.
  ///
  /// To help you use the public key safely outside of KMS,
  /// <code>GetPublicKey</code> returns important information about the public
  /// key in the response, including:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeySpec">KeySpec</a>:
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
  /// Although KMS cannot enforce these restrictions on external operations, it
  /// is crucial that you use this information to prevent the public key from
  /// being used improperly. For example, you can prevent a public signing key
  /// from being used encrypt data, or prevent a public key from being used with
  /// an encryption algorithm that is not supported by KMS. You can also avoid
  /// errors, such as using the wrong signing algorithm in a verification
  /// operation.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Identifies the asymmetric KMS key that includes the public key.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  Future<GetPublicKeyResponse> getPublicKey({
    required String keyId,
    List<String>? grantTokens,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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

  /// Imports key material into an existing symmetric KMS KMS key that was
  /// created without key material. After you successfully import key material
  /// into a KMS key, you can <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#reimport-key-material">reimport
  /// the same key material</a> into that KMS key, but you cannot import
  /// different key material.
  ///
  /// You cannot perform this operation on an asymmetric KMS key or on any KMS
  /// key in a different Amazon Web Services account. For more information about
  /// creating KMS keys with no key material and then importing key material,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing
  /// Key Material</a> in the <i>Key Management Service Developer Guide</i>.
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
  /// The key ID or key ARN of a KMS key with no key material. Its
  /// <code>Origin</code> must be <code>EXTERNAL</code>.
  ///
  /// To create a KMS key with no key material, call <a>CreateKey</a> and set
  /// the value of its <code>Origin</code> parameter to <code>EXTERNAL</code>.
  /// To get the <code>Origin</code> of a KMS key, call <a>DescribeKey</a>.)
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
  /// date, KMS deletes the key material from the KMS key on the specified date,
  /// and the KMS key becomes unusable. To use the KMS key again, you must
  /// reimport the same key material. The only way to change an expiration date
  /// is by reimporting the same key material and specifying a new expiration
  /// date.
  /// </li>
  /// </ul>
  /// When this operation is successful, the key state of the KMS key changes
  /// from <code>PendingImport</code> to <code>Enabled</code>, and you can use
  /// the KMS key.
  ///
  /// If this operation fails, use the exception to help determine the problem.
  /// If the error is related to the key material, the import token, or wrapping
  /// key, use <a>GetParametersForImport</a> to get a new public key and import
  /// token for the KMS key and repeat the import procedure. For help, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#importing-keys-overview">How
  /// To Import Key Material</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// The identifier of the symmetric KMS key that receives the imported key
  /// material. The KMS key's <code>Origin</code> must be <code>EXTERNAL</code>.
  /// This must be the same KMS key specified in the <code>KeyID</code>
  /// parameter of the corresponding <a>GetParametersForImport</a> request.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
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
  /// expires, KMS deletes the key material and the KMS key becomes unusable.
  /// You must omit this parameter when the <code>ExpirationModel</code>
  /// parameter is set to <code>KEY_MATERIAL_DOES_NOT_EXPIRE</code>. Otherwise
  /// it is required.
  Future<void> importKeyMaterial({
    required Uint8List encryptedKeyMaterial,
    required Uint8List importToken,
    required String keyId,
    ExpirationModelType? expirationModel,
    DateTime? validTo,
  }) async {
    ArgumentError.checkNotNull(encryptedKeyMaterial, 'encryptedKeyMaterial');
    ArgumentError.checkNotNull(importToken, 'importToken');
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ImportKeyMaterial'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EncryptedKeyMaterial': base64Encode(encryptedKeyMaterial),
        'ImportToken': base64Encode(importToken),
        'KeyId': keyId,
        if (expirationModel != null)
          'ExpirationModel': expirationModel.toValue(),
        if (validTo != null) 'ValidTo': unixTimestampToJson(validTo),
      },
    );
  }

  /// Gets a list of aliases in the caller's Amazon Web Services account and
  /// region. For more information about aliases, see <a>CreateAlias</a>.
  ///
  /// By default, the <code>ListAliases</code> operation returns all aliases in
  /// the account and region. To get only the aliases associated with a
  /// particular KMS key, use the <code>KeyId</code> parameter.
  ///
  /// The <code>ListAliases</code> response can include aliases that you created
  /// and associated with your customer managed keys, and aliases that Amazon
  /// Web Services created and associated with Amazon Web Services managed keys
  /// in your account. You can recognize Amazon Web Services aliases because
  /// their names have the format <code>aws/&lt;service-name&gt;</code>, such as
  /// <code>aws/dynamodb</code>.
  ///
  /// The response might also include aliases that have no
  /// <code>TargetKeyId</code> field. These are predefined aliases that Amazon
  /// Web Services has created but has not yet associated with a KMS key.
  /// Aliases that Amazon Web Services creates in your account, including
  /// predefined aliases, do not count against your <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#aliases-limit">KMS
  /// aliases quota</a>.
  ///
  /// <b>Cross-account use</b>: No. <code>ListAliases</code> does not return
  /// aliases in other Amazon Web Services accounts.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListAliases</a>
  /// (IAM policy)
  ///
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>Key Management Service Developer
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
  /// Lists only aliases that are associated with the specified KMS key. Enter a
  /// KMS key in your Amazon Web Services account.
  ///
  /// This parameter is optional. If you omit it, <code>ListAliases</code>
  /// returns all aliases in the account and Region.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, KMS does not return more than the specified number
  /// of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListAliasesResponse> listAliases({
    String? keyId,
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
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

  /// Gets a list of all grants for the specified KMS key.
  ///
  /// You must specify the KMS key in all requests. You can filter the grant
  /// list by grant ID or grantee principal.
  ///
  /// For detailed information about grants, including grant terminology, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using
  /// grants</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.
  /// For examples of working with grants in several programming languages, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming
  /// grants</a>.
  /// <note>
  /// The <code>GranteePrincipal</code> field in the <code>ListGrants</code>
  /// response usually contains the user or role designated as the grantee
  /// principal in the grant. However, when the grantee principal in the grant
  /// is an Amazon Web Services service, the <code>GranteePrincipal</code> field
  /// contains the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">service
  /// principal</a>, which might represent several different grantee principals.
  /// </note>
  /// <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a
  /// different Amazon Web Services account, specify the key ARN in the value of
  /// the <code>KeyId</code> parameter.
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
  /// May throw [InvalidGrantIdException].
  /// May throw [InvalidArnException].
  /// May throw [KMSInternalException].
  /// May throw [KMSInvalidStateException].
  ///
  /// Parameter [keyId] :
  /// Returns only grants for the specified KMS key. This parameter is required.
  ///
  /// Specify the key ID or key ARN of the KMS key. To specify a KMS key in a
  /// different Amazon Web Services account, you must use the key ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [grantId] :
  /// Returns only the grant with the specified grant ID. The grant ID uniquely
  /// identifies the grant.
  ///
  /// Parameter [granteePrincipal] :
  /// Returns only grants where the specified principal is the grantee principal
  /// for the grant.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, KMS does not return more than the specified number
  /// of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListGrantsResponse> listGrants({
    required String keyId,
    String? grantId,
    String? granteePrincipal,
    int? limit,
    String? marker,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
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
        if (grantId != null) 'GrantId': grantId,
        if (granteePrincipal != null) 'GranteePrincipal': granteePrincipal,
        if (limit != null) 'Limit': limit,
        if (marker != null) 'Marker': marker,
      },
    );

    return ListGrantsResponse.fromJson(jsonResponse.body);
  }

  /// Gets the names of the key policies that are attached to a KMS key. This
  /// operation is designed to get policy names that you can use in a
  /// <a>GetKeyPolicy</a> operation. However, the only valid policy name is
  /// <code>default</code>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Gets the names of key policies for the specified KMS key.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, KMS does not return more than the specified number
  /// of items, but it might return fewer.
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
    required String keyId,
    int? limit,
    String? marker,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
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

  /// Gets a list of all KMS keys in the caller's Amazon Web Services account
  /// and Region.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// this value is present, KMS does not return more than the specified number
  /// of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 1000, inclusive. If you do not include a value, it defaults to 100.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListKeysResponse> listKeys({
    int? limit,
    String? marker,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
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

  /// Returns all tags on the specified KMS key.
  ///
  /// For general information about tags, including the format and syntax, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>. For information about using tags in KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// keys</a>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListResourceTags</a>
  /// (key policy)
  ///
  /// <b>Related operations:</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateKey</a>
  /// </li>
  /// <li>
  /// <a>ReplicateKey</a>
  /// </li>
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
  /// Gets tags on the specified KMS key.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, KMS does not return more than the specified number
  /// of items, but it might return fewer.
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
    required String keyId,
    int? limit,
    String? marker,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
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

  /// Returns information about all grants in the Amazon Web Services account
  /// and Region that have the specified retiring principal.
  ///
  /// You can specify any principal in your Amazon Web Services account. The
  /// grants that are returned include grants for KMS keys in your Amazon Web
  /// Services account and other Amazon Web Services accounts. You might use
  /// this operation to determine which grants you may retire. To retire a
  /// grant, use the <a>RetireGrant</a> operation.
  ///
  /// For detailed information about grants, including grant terminology, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using
  /// grants</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.
  /// For examples of working with grants in several programming languages, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming
  /// grants</a>.
  ///
  /// <b>Cross-account use</b>: You must specify a principal in your Amazon Web
  /// Services account. However, this operation can return grants in any Amazon
  /// Web Services account. You do not need <code>kms:ListRetirableGrants</code>
  /// permission (or any other additional permission) in any Amazon Web Services
  /// account other than your own.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListRetirableGrants</a>
  /// (IAM policy) in your Amazon Web Services account.
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
  /// Amazon Web Services account.
  ///
  /// To specify the retiring principal, use the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Name (ARN)</a> of an Amazon Web Services principal. Valid Amazon
  /// Web Services principals include Amazon Web Services accounts (root), IAM
  /// users, federated users, and assumed role users. For examples of the ARN
  /// syntax for specifying a principal, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon
  /// Web Services Identity and Access Management (IAM)</a> in the Example ARNs
  /// section of the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [limit] :
  /// Use this parameter to specify the maximum number of items to return. When
  /// this value is present, KMS does not return more than the specified number
  /// of items, but it might return fewer.
  ///
  /// This value is optional. If you include a value, it must be between 1 and
  /// 100, inclusive. If you do not include a value, it defaults to 50.
  ///
  /// Parameter [marker] :
  /// Use this parameter in a subsequent request after you receive a response
  /// with truncated results. Set it to the value of <code>NextMarker</code>
  /// from the truncated response you just received.
  Future<ListGrantsResponse> listRetirableGrants({
    required String retiringPrincipal,
    int? limit,
    String? marker,
  }) async {
    ArgumentError.checkNotNull(retiringPrincipal, 'retiringPrincipal');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1000,
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

  /// Attaches a key policy to the specified KMS key.
  ///
  /// For more information about key policies, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Key
  /// Policies</a> in the <i>Key Management Service Developer Guide</i>. For
  /// help writing and formatting a JSON policy document, see the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM
  /// JSON Policy Reference</a> in the <i> <i>Identity and Access Management
  /// User Guide</i> </i>. For examples of adding a key policy in multiple
  /// programming languages, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-key-policies.html#put-policy">Setting
  /// a key policy</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// Sets the key policy on the specified KMS key.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [policy] :
  /// The key policy to attach to the KMS key.
  ///
  /// The key policy must meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the
  /// key policy must allow the principal that is making the
  /// <code>PutKeyPolicy</code> request to make a subsequent
  /// <code>PutKeyPolicy</code> request on the KMS key. This reduces the risk
  /// that the KMS key becomes unmanageable. For more information, refer to the
  /// scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section of the <i>Key Management Service Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// Each statement in the key policy must contain one or more principals. The
  /// principals in the key policy must exist and be visible to KMS. When you
  /// create a new Amazon Web Services principal (for example, an IAM user or
  /// role), you might need to enforce a delay before including the new
  /// principal in a key policy because the new principal might not be
  /// immediately visible to KMS. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes
  /// that I make are not always immediately visible</a> in the <i>Amazon Web
  /// Services Identity and Access Management User Guide</i>.
  /// </li>
  /// </ul>
  /// The key policy cannot exceed 32 kilobytes (32768 bytes). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/resource-limits.html">Resource
  /// Quotas</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [policyName] :
  /// The name of the key policy. The only valid value is <code>default</code>.
  ///
  /// Parameter [bypassPolicyLockoutSafetyCheck] :
  /// A flag to indicate whether to bypass the key policy lockout safety check.
  /// <important>
  /// Setting this value to true increases the risk that the KMS key becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  ///
  /// For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section in the <i>Key Management Service Developer
  /// Guide</i>.
  /// </important>
  /// Use this parameter only when you intend to prevent the principal that is
  /// making the request from making a subsequent <code>PutKeyPolicy</code>
  /// request on the KMS key.
  ///
  /// The default value is false.
  Future<void> putKeyPolicy({
    required String keyId,
    required String policy,
    required String policyName,
    bool? bypassPolicyLockoutSafetyCheck,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(policy, 'policy');
    ArgumentError.checkNotNull(policyName, 'policyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.PutKeyPolicy'
    };
    await _protocol.send(
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

  /// Decrypts ciphertext and then reencrypts it entirely within KMS. You can
  /// use this operation to change the KMS key under which data is encrypted,
  /// such as when you <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-manually">manually
  /// rotate</a> a KMS key or change the KMS key that protects a ciphertext. You
  /// can also use it to reencrypt ciphertext under the same KMS key, such as to
  /// change the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
  /// context</a> of a ciphertext.
  ///
  /// The <code>ReEncrypt</code> operation can decrypt ciphertext that was
  /// encrypted by using an KMS KMS key in an KMS operation, such as
  /// <a>Encrypt</a> or <a>GenerateDataKey</a>. It can also decrypt ciphertext
  /// that was encrypted by using the public key of an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric
  /// KMS key</a> outside of KMS. However, it cannot decrypt ciphertext produced
  /// by other libraries, such as the <a
  /// href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">Amazon
  /// Web Services Encryption SDK</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon
  /// S3 client-side encryption</a>. These libraries return a ciphertext format
  /// that is incompatible with KMS.
  ///
  /// When you use the <code>ReEncrypt</code> operation, you need to provide
  /// information for the decrypt operation and the subsequent encrypt
  /// operation.
  ///
  /// <ul>
  /// <li>
  /// If your ciphertext was encrypted under an asymmetric KMS key, you must use
  /// the <code>SourceKeyId</code> parameter to identify the KMS key that
  /// encrypted the ciphertext. You must also supply the encryption algorithm
  /// that was used. This information is required to decrypt the data.
  /// </li>
  /// <li>
  /// If your ciphertext was encrypted under a symmetric KMS key, the
  /// <code>SourceKeyId</code> parameter is optional. KMS can get this
  /// information from metadata that it adds to the symmetric ciphertext blob.
  /// This feature adds durability to your implementation by ensuring that
  /// authorized users can decrypt ciphertext decades after it was encrypted,
  /// even if they've lost track of the key ID. However, specifying the source
  /// KMS key is always recommended as a best practice. When you use the
  /// <code>SourceKeyId</code> parameter to specify a KMS key, KMS uses only the
  /// KMS key you specify. If the ciphertext was encrypted under a different KMS
  /// key, the <code>ReEncrypt</code> operation fails. This practice ensures
  /// that you use the KMS key that you intend.
  /// </li>
  /// <li>
  /// To reencrypt the data, you must use the <code>DestinationKeyId</code>
  /// parameter specify the KMS key that re-encrypts the data after it is
  /// decrypted. You can select a symmetric or asymmetric KMS key. If the
  /// destination KMS key is an asymmetric KMS key, you must also provide the
  /// encryption algorithm. The algorithm that you choose must be compatible
  /// with the KMS key.
  /// <important>
  /// When you use an asymmetric KMS key to encrypt or reencrypt data, be sure
  /// to record the KMS key and encryption algorithm that you choose. You will
  /// be required to provide the same KMS key and encryption algorithm when you
  /// decrypt the data. If the KMS key and algorithm do not match the values
  /// used to encrypt the data, the decrypt operation fails.
  ///
  /// You are not required to supply the key ID and encryption algorithm when
  /// you decrypt with symmetric KMS keys because KMS stores this information in
  /// the ciphertext blob. KMS cannot store metadata in ciphertext generated
  /// with asymmetric keys. The standard format for asymmetric key ciphertext
  /// does not include configurable fields.
  /// </important> </li>
  /// </ul>
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. The source KMS key and destination KMS key
  /// can be in different Amazon Web Services accounts. Either or both KMS keys
  /// can be in a different account than the caller. To specify a KMS key in a
  /// different account, you must use its key ARN or alias ARN.
  ///
  /// <b>Required permissions</b>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ReEncryptFrom</a>
  /// permission on the source KMS key (key policy)
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ReEncryptTo</a>
  /// permission on the destination KMS key (key policy)
  /// </li>
  /// </ul>
  /// To permit reencryption from or to a KMS key, include the
  /// <code>"kms:ReEncrypt*"</code> permission in your <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">key
  /// policy</a>. This permission is automatically included in the key policy
  /// when you use the console to create a KMS key. But you must include it
  /// manually when you create a KMS key programmatically or when you use the
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
  /// A unique identifier for the KMS key that is used to reencrypt the data.
  /// Specify a symmetric or asymmetric KMS key with a <code>KeyUsage</code>
  /// value of <code>ENCRYPT_DECRYPT</code>. To find the <code>KeyUsage</code>
  /// value of a KMS key, use the <a>DescribeKey</a> operation.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [destinationEncryptionAlgorithm] :
  /// Specifies the encryption algorithm that KMS will use to reecrypt the data
  /// after it has decrypted it. The default value,
  /// <code>SYMMETRIC_DEFAULT</code>, represents the encryption algorithm used
  /// for symmetric KMS keys.
  ///
  /// This parameter is required only when the destination KMS key is an
  /// asymmetric KMS key.
  ///
  /// Parameter [destinationEncryptionContext] :
  /// Specifies that encryption context to use when the reencrypting the data.
  ///
  /// A destination encryption context is valid only when the destination KMS
  /// key is a symmetric KMS key. The standard ciphertext format for asymmetric
  /// KMS keys does not include fields for metadata.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [sourceEncryptionAlgorithm] :
  /// Specifies the encryption algorithm that KMS will use to decrypt the
  /// ciphertext before it is reencrypted. The default value,
  /// <code>SYMMETRIC_DEFAULT</code>, represents the algorithm used for
  /// symmetric KMS keys.
  ///
  /// Specify the same algorithm that was used to encrypt the ciphertext. If you
  /// specify a different algorithm, the decrypt attempt fails.
  ///
  /// This parameter is required only when the ciphertext was encrypted under an
  /// asymmetric KMS key.
  ///
  /// Parameter [sourceEncryptionContext] :
  /// Specifies the encryption context to use to decrypt the ciphertext. Enter
  /// the same encryption context that was used to encrypt the ciphertext.
  ///
  /// An <i>encryption context</i> is a collection of non-secret key-value pairs
  /// that represents additional authenticated data. When you use an encryption
  /// context to encrypt data, you must specify the same (an exact
  /// case-sensitive match) encryption context to decrypt the data. An
  /// encryption context is optional when encrypting with a symmetric KMS key,
  /// but it is highly recommended.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
  /// Context</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [sourceKeyId] :
  /// Specifies the KMS key that KMS will use to decrypt the ciphertext before
  /// it is re-encrypted. Enter a key ID of the KMS key that was used to encrypt
  /// the ciphertext.
  ///
  /// This parameter is required only when the ciphertext was encrypted under an
  /// asymmetric KMS key. If you used a symmetric KMS key, KMS can get the KMS
  /// key from metadata that it adds to the symmetric ciphertext blob. However,
  /// it is always recommended as a best practice. This practice ensures that
  /// you use the KMS key that you intend.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  Future<ReEncryptResponse> reEncrypt({
    required Uint8List ciphertextBlob,
    required String destinationKeyId,
    EncryptionAlgorithmSpec? destinationEncryptionAlgorithm,
    Map<String, String>? destinationEncryptionContext,
    List<String>? grantTokens,
    EncryptionAlgorithmSpec? sourceEncryptionAlgorithm,
    Map<String, String>? sourceEncryptionContext,
    String? sourceKeyId,
  }) async {
    ArgumentError.checkNotNull(ciphertextBlob, 'ciphertextBlob');
    ArgumentError.checkNotNull(destinationKeyId, 'destinationKeyId');
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
        'CiphertextBlob': base64Encode(ciphertextBlob),
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

  /// Replicates a multi-Region key into the specified Region. This operation
  /// creates a multi-Region replica key based on a multi-Region primary key in
  /// a different Region of the same Amazon Web Services partition. You can
  /// create multiple replicas of a primary key, but each must be in a different
  /// Region. To create a multi-Region primary key, use the <a>CreateKey</a>
  /// operation.
  ///
  /// This operation supports <i>multi-Region keys</i>, an KMS feature that lets
  /// you create multiple interoperable KMS keys in different Amazon Web
  /// Services Regions. Because these KMS keys have the same key ID, key
  /// material, and other metadata, you can use them interchangeably to encrypt
  /// data in one Amazon Web Services Region and decrypt it in a different
  /// Amazon Web Services Region without re-encrypting the data or making a
  /// cross-Region call. For more information about multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// A <i>replica key</i> is a fully-functional KMS key that can be used
  /// independently of its primary and peer replica keys. A primary key and its
  /// replica keys share properties that make them interoperable. They have the
  /// same <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id">key
  /// ID</a> and key material. They also have the same <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec">key
  /// spec</a>, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage">key
  /// usage</a>, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin">key
  /// material origin</a>, and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
  /// key rotation status</a>. KMS automatically synchronizes these shared
  /// properties among related multi-Region keys. All other properties of a
  /// replica key can differ, including its <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">key
  /// policy</a>, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">tags</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html">aliases</a>,
  /// and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">key
  /// state</a>. KMS pricing and quotas for KMS keys apply to each primary key
  /// and replica key.
  ///
  /// When this operation completes, the new replica key has a transient key
  /// state of <code>Creating</code>. This key state changes to
  /// <code>Enabled</code> (or <code>PendingImport</code>) after a few seconds
  /// when the process of creating the new replica key is complete. While the
  /// key state is <code>Creating</code>, you can manage key, but you cannot yet
  /// use it in cryptographic operations. If you are creating and using the
  /// replica key programmatically, retry on
  /// <code>KMSInvalidStateException</code> or call <code>DescribeKey</code> to
  /// check its <code>KeyState</code> value before using it. For details about
  /// the <code>Creating</code> key state, see <a
  /// href="kms/latest/developerguide/key-state.html">Key state: Effect on your
  /// KMS key</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// The CloudTrail log of a <code>ReplicateKey</code> operation records a
  /// <code>ReplicateKey</code> operation in the primary key's Region and a
  /// <a>CreateKey</a> operation in the replica key's Region.
  ///
  /// If you replicate a multi-Region primary key with imported key material,
  /// the replica key is created with no key material. You must import the same
  /// key material that you imported into the primary key. For details, see <a
  /// href="kms/latest/developerguide/multi-region-keys-import.html">Importing
  /// key material into multi-Region keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// To convert a replica key to a primary key, use the
  /// <a>UpdatePrimaryRegion</a> operation.
  /// <note>
  /// <code>ReplicateKey</code> uses different default values for the
  /// <code>KeyPolicy</code> and <code>Tags</code> parameters than those used in
  /// the KMS console. For details, see the parameter descriptions.
  /// </note>
  /// <b>Cross-account use</b>: No. You cannot use this operation to create a
  /// replica key in a different Amazon Web Services account.
  ///
  /// <b>Required permissions</b>:
  ///
  /// <ul>
  /// <li>
  /// <code>kms:ReplicateKey</code> on the primary key (in the primary key's
  /// Region). Include this permission in the primary key's key policy.
  /// </li>
  /// <li>
  /// <code>kms:CreateKey</code> in an IAM policy in the replica Region.
  /// </li>
  /// <li>
  /// To use the <code>Tags</code> parameter, <code>kms:TagResource</code> in an
  /// IAM policy in the replica Region.
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateKey</a>
  /// </li>
  /// <li>
  /// <a>UpdatePrimaryRegion</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [DisabledException].
  /// May throw [InvalidArnException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSInternalException].
  /// May throw [LimitExceededException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [NotFoundException].
  /// May throw [TagException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [keyId] :
  /// Identifies the multi-Region primary key that is being replicated. To
  /// determine whether a KMS key is a multi-Region primary key, use the
  /// <a>DescribeKey</a> operation to check the value of the
  /// <code>MultiRegionKeyType</code> property.
  ///
  /// Specify the key ID or key ARN of a multi-Region primary key.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>mrk-1234abcd12ab34cd56ef1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [replicaRegion] :
  /// The Region ID of the Amazon Web Services Region for this replica key.
  ///
  /// Enter the Region ID, such as <code>us-east-1</code> or
  /// <code>ap-southeast-2</code>. For a list of Amazon Web Services Regions in
  /// which KMS is supported, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/kms.html#kms_region">KMS
  /// service endpoints</a> in the <i>Amazon Web Services General Reference</i>.
  ///
  /// The replica must be in a different Amazon Web Services Region than its
  /// primary key and other replicas of that primary key, but in the same Amazon
  /// Web Services partition. KMS must be available in the replica Region. If
  /// the Region is not enabled by default, the Amazon Web Services account must
  /// be enabled in the Region.
  ///
  /// For information about Amazon Web Services partitions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) in the <i>Amazon Web Services General
  /// Reference</i>.</a> For information about enabling and disabling Regions,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-enable">Enabling
  /// a Region</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html#rande-manage-disable">Disabling
  /// a Region</a> in the <i>Amazon Web Services General Reference</i>.
  ///
  /// Parameter [bypassPolicyLockoutSafetyCheck] :
  /// A flag to indicate whether to bypass the key policy lockout safety check.
  /// <important>
  /// Setting this value to true increases the risk that the KMS key becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  ///
  /// For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section in the <i>Key Management Service Developer
  /// Guide</i>.
  /// </important>
  /// Use this parameter only when you intend to prevent the principal that is
  /// making the request from making a subsequent <code>PutKeyPolicy</code>
  /// request on the KMS key.
  ///
  /// The default value is false.
  ///
  /// Parameter [description] :
  /// A description of the KMS key. The default value is an empty string (no
  /// description).
  ///
  /// The description is not a shared property of multi-Region keys. You can
  /// specify the same description or a different description for each key in a
  /// set of related multi-Region keys. KMS does not synchronize this property.
  ///
  /// Parameter [policy] :
  /// The key policy to attach to the KMS key. This parameter is optional. If
  /// you do not provide a key policy, KMS attaches the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">default
  /// key policy</a> to the KMS key.
  ///
  /// The key policy is not a shared property of multi-Region keys. You can
  /// specify the same key policy or a different key policy for each key in a
  /// set of related multi-Region keys. KMS does not synchronize this property.
  ///
  /// If you provide a key policy, it must meet the following criteria:
  ///
  /// <ul>
  /// <li>
  /// If you don't set <code>BypassPolicyLockoutSafetyCheck</code> to true, the
  /// key policy must give the caller <code>kms:PutKeyPolicy</code> permission
  /// on the replica key. This reduces the risk that the KMS key becomes
  /// unmanageable. For more information, refer to the scenario in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default-allow-root-enable-iam">Default
  /// Key Policy</a> section of the <i> <i>Key Management Service Developer
  /// Guide</i> </i>.
  /// </li>
  /// <li>
  /// Each statement in the key policy must contain one or more principals. The
  /// principals in the key policy must exist and be visible to KMS. When you
  /// create a new Amazon Web Services principal (for example, an IAM user or
  /// role), you might need to enforce a delay before including the new
  /// principal in a key policy because the new principal might not be
  /// immediately visible to KMS. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/troubleshoot_general.html#troubleshoot_general_eventual-consistency">Changes
  /// that I make are not always immediately visible</a> in the <i> <i>Identity
  /// and Access Management User Guide</i> </i>.
  /// </li>
  /// <li>
  /// The key policy size quota is 32 kilobytes (32768 bytes).
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags to the replica key. Use this parameter to tag the
  /// KMS key when it is created. To tag an existing KMS key, use the
  /// <a>TagResource</a> operation.
  /// <note>
  /// Tagging or untagging a KMS key can allow or deny permission to the KMS
  /// key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  /// To use this parameter, you must have <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a>
  /// permission in an IAM policy.
  ///
  /// Tags are not a shared property of multi-Region keys. You can specify the
  /// same tags or different tags for each key in a set of related multi-Region
  /// keys. KMS does not synchronize this property.
  ///
  /// Each tag consists of a tag key and a tag value. Both the tag key and the
  /// tag value are required, but the tag value can be an empty (null) string.
  /// You cannot have more than one tag on a KMS key with the same tag key. If
  /// you specify an existing tag key with a different tag value, KMS replaces
  /// the current tag value with the specified one.
  ///
  /// When you add tags to an Amazon Web Services resource, Amazon Web Services
  /// generates a cost allocation report with usage and costs aggregated by
  /// tags. Tags can also be used to control access to a KMS key. For details,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// Keys</a>.
  Future<ReplicateKeyResponse> replicateKey({
    required String keyId,
    required String replicaRegion,
    bool? bypassPolicyLockoutSafetyCheck,
    String? description,
    String? policy,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(replicaRegion, 'replicaRegion');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.ReplicateKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'ReplicaRegion': replicaRegion,
        if (bypassPolicyLockoutSafetyCheck != null)
          'BypassPolicyLockoutSafetyCheck': bypassPolicyLockoutSafetyCheck,
        if (description != null) 'Description': description,
        if (policy != null) 'Policy': policy,
        if (tags != null) 'Tags': tags,
      },
    );

    return ReplicateKeyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a grant. Typically, you retire a grant when you no longer need its
  /// permissions. To identify the grant to retire, use a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">grant
  /// token</a>, or both the grant ID and a key identifier (key ID or key ARN)
  /// of the KMS key. The <a>CreateGrant</a> operation returns both values.
  ///
  /// This operation can be called by the <i>retiring principal</i> for a grant,
  /// by the <i>grantee principal</i> if the grant allows the
  /// <code>RetireGrant</code> operation, and by the Amazon Web Services account
  /// (root user) in which the grant is created. It can also be called by
  /// principals to whom permission for retiring a grant is delegated. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete">Retiring
  /// and revoking grants</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// For detailed information about grants, including grant terminology, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using
  /// grants</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.
  /// For examples of working with grants in several programming languages, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming
  /// grants</a>.
  ///
  /// <b>Cross-account use</b>: Yes. You can retire a grant on a KMS key in a
  /// different Amazon Web Services account.
  ///
  /// <b>Required permissions:</b>:Permission to retire a grant is determined
  /// primarily by the grant. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete">Retiring
  /// and revoking grants</a> in the <i>Key Management Service Developer
  /// Guide</i>.
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
  /// Identifies the grant to retire. To get the grant ID, use
  /// <a>CreateGrant</a>, <a>ListGrants</a>, or <a>ListRetirableGrants</a>.
  ///
  /// <ul>
  /// <li>
  /// Grant ID Example -
  /// 0123456789012345678901234567890123456789012345678901234567890123
  /// </li>
  /// </ul>
  ///
  /// Parameter [grantToken] :
  /// Identifies the grant to be retired. You can use a grant token to identify
  /// a new grant even before it has achieved eventual consistency.
  ///
  /// Only the <a>CreateGrant</a> operation returns a grant token. For details,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency">Eventual
  /// consistency</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [keyId] :
  /// The key ARN KMS key associated with the grant. To find the key ARN, use
  /// the <a>ListKeys</a> operation.
  ///
  /// For example:
  /// <code>arn:aws:kms:us-east-2:444455556666:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  Future<void> retireGrant({
    String? grantId,
    String? grantToken,
    String? keyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.RetireGrant'
    };
    await _protocol.send(
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

  /// Deletes the specified grant. You revoke a grant to terminate the
  /// permissions that the grant allows. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/managing-grants.html#grant-delete">Retiring
  /// and revoking grants</a> in the <i> <i>Key Management Service Developer
  /// Guide</i> </i>.
  ///
  /// When you create, retire, or revoke a grant, there might be a brief delay,
  /// usually less than five minutes, until the grant is available throughout
  /// KMS. This state is known as <i>eventual consistency</i>. For details, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency">Eventual
  /// consistency</a> in the <i> <i>Key Management Service Developer Guide</i>
  /// </i>.
  ///
  /// For detailed information about grants, including grant terminology, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using
  /// grants</a> in the <i> <i>Key Management Service Developer Guide</i> </i>.
  /// For examples of working with grants in several programming languages, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming
  /// grants</a>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation on a KMS key in a
  /// different Amazon Web Services account, specify the key ARN in the value of
  /// the <code>KeyId</code> parameter.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:RevokeGrant</a>
  /// (key policy).
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
  /// Identifies the grant to revoke. To get the grant ID, use
  /// <a>CreateGrant</a>, <a>ListGrants</a>, or <a>ListRetirableGrants</a>.
  ///
  /// Parameter [keyId] :
  /// A unique identifier for the KMS key associated with the grant. To get the
  /// key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Specify the key ID or key ARN of the KMS key. To specify a KMS key in a
  /// different Amazon Web Services account, you must use the key ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> revokeGrant({
    required String grantId,
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(grantId, 'grantId');
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.RevokeGrant'
    };
    await _protocol.send(
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

  /// Schedules the deletion of a KMS key. By default, KMS applies a waiting
  /// period of 30 days, but you can specify a waiting period of 7-30 days. When
  /// this operation is successful, the key state of the KMS key changes to
  /// <code>PendingDeletion</code> and the key can't be used in any
  /// cryptographic operations. It remains in this state for the duration of the
  /// waiting period. Before the waiting period ends, you can use
  /// <a>CancelKeyDeletion</a> to cancel the deletion of the KMS key. After the
  /// waiting period ends, KMS deletes the KMS key, its key material, and all
  /// KMS data associated with it, including all aliases that refer to it.
  /// <important>
  /// Deleting a KMS key is a destructive and potentially dangerous operation.
  /// When a KMS key is deleted, all data that was encrypted under the KMS key
  /// is unrecoverable. (The only exception is a multi-Region replica key.) To
  /// prevent the use of a KMS key without deleting it, use <a>DisableKey</a>.
  /// </important>
  /// If you schedule deletion of a KMS key from a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, when the waiting period expires,
  /// <code>ScheduleKeyDeletion</code> deletes the KMS key from KMS. Then KMS
  /// makes a best effort to delete the key material from the associated
  /// CloudHSM cluster. However, you might need to manually <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key">delete
  /// the orphaned key material</a> from the cluster and its backups.
  ///
  /// You can schedule the deletion of a multi-Region primary key and its
  /// replica keys at any time. However, KMS will not delete a multi-Region
  /// primary key with existing replica keys. If you schedule the deletion of a
  /// primary key with replicas, its key state changes to
  /// <code>PendingReplicaDeletion</code> and it cannot be replicated or used in
  /// cryptographic operations. This status can continue indefinitely. When the
  /// last of its replicas keys is deleted (not just scheduled), the key state
  /// of the primary key changes to <code>PendingDeletion</code> and its waiting
  /// period (<code>PendingWindowInDays</code>) begins. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-delete.html">Deleting
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// For more information about scheduling a KMS key for deletion, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting
  /// KMS keys</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
  ///
  /// <b>Required permissions</b>: kms:ScheduleKeyDeletion (key policy)
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
  /// The unique identifier of the KMS key to delete.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [pendingWindowInDays] :
  /// The waiting period, specified in number of days. After the waiting period
  /// ends, KMS deletes the KMS key.
  ///
  /// If the KMS key is a multi-Region primary key with replicas, the waiting
  /// period begins when the last of its replica keys is deleted. Otherwise, the
  /// waiting period begins immediately.
  ///
  /// This value is optional. If you include a value, it must be between 7 and
  /// 30, inclusive. If you do not include a value, it defaults to 30.
  Future<ScheduleKeyDeletionResponse> scheduleKeyDeletion({
    required String keyId,
    int? pendingWindowInDays,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
  /// an asymmetric KMS key. To verify the signature, use the <a>Verify</a>
  /// operation, or use the public key in the same asymmetric KMS key outside of
  /// KMS. For information about symmetric and asymmetric KMS keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric KMS keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// Digital signatures are generated and verified by using asymmetric key
  /// pair, such as an RSA or ECC pair that is represented by an asymmetric KMS
  /// key. The key owner (or an authorized user) uses their private key to sign
  /// a message. Anyone with the public key can verify that the message was
  /// signed with that particular private key and that the message hasn't
  /// changed since it was signed.
  ///
  /// To use the <code>Sign</code> operation, provide the following information:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>KeyId</code> parameter to identify an asymmetric KMS key
  /// with a <code>KeyUsage</code> value of <code>SIGN_VERIFY</code>. To get the
  /// <code>KeyUsage</code> value of a KMS key, use the <a>DescribeKey</a>
  /// operation. The caller must have <code>kms:Sign</code> permission on the
  /// KMS key.
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
  /// Choose a signing algorithm that is compatible with the KMS key.
  /// </li>
  /// </ul> <important>
  /// When signing a message, be sure to record the KMS key and the signing
  /// algorithm. This information is required to verify the signature.
  /// </important>
  /// To verify the signature that this operation generates, use the
  /// <a>Verify</a> operation. Or use the <a>GetPublicKey</a> operation to
  /// download the public key and then use the public key to verify the
  /// signature outside of KMS.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Identifies an asymmetric KMS key. KMS uses the private key in the
  /// asymmetric KMS key to sign the message. The <code>KeyUsage</code> type of
  /// the KMS key must be <code>SIGN_VERIFY</code>. To find the
  /// <code>KeyUsage</code> of a KMS key, use the <a>DescribeKey</a> operation.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>. To get the alias name and alias ARN, use
  /// <a>ListAliases</a>.
  ///
  /// Parameter [message] :
  /// Specifies the message or message digest to sign. Messages can be 0-4096
  /// bytes. To sign a larger message, provide the message digest.
  ///
  /// If you provide a message, KMS generates a hash digest of the message and
  /// then signs it.
  ///
  /// Parameter [signingAlgorithm] :
  /// Specifies the signing algorithm to use when signing the message.
  ///
  /// Choose an algorithm that is compatible with the type and size of the
  /// specified asymmetric KMS key.
  ///
  /// Parameter [grantTokens] :
  /// A list of grant tokens.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [messageType] :
  /// Tells KMS whether the value of the <code>Message</code> parameter is a
  /// message or message digest. The default value, RAW, indicates a message. To
  /// indicate a message digest, enter <code>DIGEST</code>.
  Future<SignResponse> sign({
    required String keyId,
    required Uint8List message,
    required SigningAlgorithmSpec signingAlgorithm,
    List<String>? grantTokens,
    MessageType? messageType,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
        'Message': base64Encode(message),
        'SigningAlgorithm': signingAlgorithm.toValue(),
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (messageType != null) 'MessageType': messageType.toValue(),
      },
    );

    return SignResponse.fromJson(jsonResponse.body);
  }

  /// Adds or edits tags on a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed key</a>.
  /// <note>
  /// Tagging or untagging a KMS key can allow or deny permission to the KMS
  /// key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  /// Each tag consists of a tag key and a tag value, both of which are
  /// case-sensitive strings. The tag value can be an empty (null) string. To
  /// add a tag, specify a new tag key and a tag value. To edit a tag, specify
  /// an existing tag key and a new tag value.
  ///
  /// You can use this operation to tag a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed key</a>, but you cannot tag an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed key</a>, an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">Amazon
  /// Web Services owned key</a>, a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#keystore-concept">custom
  /// key store</a>, or an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#alias-concept">alias</a>.
  ///
  /// You can also add tags to a KMS key while creating it (<a>CreateKey</a>) or
  /// replicating it (<a>ReplicateKey</a>).
  ///
  /// For information about using tags in KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// keys</a>. For general information about tags, including the format and
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateKey</a>
  /// </li>
  /// <li>
  /// <a>ListResourceTags</a>
  /// </li>
  /// <li>
  /// <a>ReplicateKey</a>
  /// </li>
  /// <li>
  /// <a>UntagResource</a>
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
  /// Identifies a customer managed key in the account and Region.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  ///
  /// Each tag consists of a tag key and a tag value. The tag value can be an
  /// empty (null) string.
  ///
  /// You cannot have more than one tag on a KMS key with the same tag key. If
  /// you specify an existing tag key with a different tag value, KMS replaces
  /// the current tag value with the specified one.
  Future<void> tagResource({
    required String keyId,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.TagResource'
    };
    await _protocol.send(
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
  /// managed key</a>. To delete a tag, specify the tag key and the KMS key.
  /// <note>
  /// Tagging or untagging a KMS key can allow or deny permission to the KMS
  /// key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  /// When it succeeds, the <code>UntagResource</code> operation doesn't return
  /// any output. Also, if the specified tag key isn't found on the KMS key, it
  /// doesn't throw an exception or return a response. To confirm that the
  /// operation worked, use the <a>ListResourceTags</a> operation.
  ///
  /// For information about using tags in KMS, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
  /// keys</a>. For general information about tags, including the format and
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
  ///
  /// <b>Required permissions</b>: <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UntagResource</a>
  /// (key policy)
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateKey</a>
  /// </li>
  /// <li>
  /// <a>ListResourceTags</a>
  /// </li>
  /// <li>
  /// <a>ReplicateKey</a>
  /// </li>
  /// <li>
  /// <a>TagResource</a>
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
  /// Identifies the KMS key from which you are removing tags.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [tagKeys] :
  /// One or more tag keys. Specify only the tag keys, not the tag values.
  Future<void> untagResource({
    required String keyId,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UntagResource'
    };
    await _protocol.send(
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

  /// Associates an existing KMS alias with a different KMS key. Each alias is
  /// associated with only one KMS key at a time, although a KMS key can have
  /// multiple aliases. The alias and the KMS key must be in the same Amazon Web
  /// Services account and Region.
  /// <note>
  /// Adding, deleting, or updating an alias can allow or deny permission to the
  /// KMS key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  /// The current and new KMS key must be the same type (both symmetric or both
  /// asymmetric), and they must have the same key usage
  /// (<code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>). This
  /// restriction prevents errors in code that uses aliases. If you must assign
  /// an alias to a different type of KMS key, use <a>DeleteAlias</a> to delete
  /// the old alias and <a>CreateAlias</a> to create a new alias.
  ///
  /// You cannot use <code>UpdateAlias</code> to change an alias name. To change
  /// an alias name, use <a>DeleteAlias</a> to delete the old alias and
  /// <a>CreateAlias</a> to create a new alias.
  ///
  /// Because an alias is not a property of a KMS key, you can create, update,
  /// and delete the aliases of a KMS key without affecting the KMS key. Also,
  /// aliases do not appear in the response from the <a>DescribeKey</a>
  /// operation. To get the aliases of all KMS keys in the account, use the
  /// <a>ListAliases</a> operation.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// on the current KMS key (key policy).
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateAlias</a>
  /// on the new KMS key (key policy).
  /// </li>
  /// </ul>
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling
  /// access to aliases</a> in the <i>Key Management Service Developer
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
  /// Identifies the alias that is changing its KMS key. This value must begin
  /// with <code>alias/</code> followed by the alias name, such as
  /// <code>alias/ExampleAlias</code>. You cannot use UpdateAlias to change the
  /// alias name.
  ///
  /// Parameter [targetKeyId] :
  /// Identifies the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer
  /// managed key</a> to associate with the alias. You don't have permission to
  /// associate an alias with an <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon
  /// Web Services managed key</a>.
  ///
  /// The KMS key must be in the same Amazon Web Services account and Region as
  /// the alias. Also, the new target KMS key must be the same type as the
  /// current target KMS key (both symmetric or both asymmetric) and they must
  /// have the same key usage.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// To verify that the alias is mapped to the correct KMS key, use
  /// <a>ListAliases</a>.
  Future<void> updateAlias({
    required String aliasName,
    required String targetKeyId,
  }) async {
    ArgumentError.checkNotNull(aliasName, 'aliasName');
    ArgumentError.checkNotNull(targetKeyId, 'targetKeyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UpdateAlias'
    };
    await _protocol.send(
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
  /// The <code>CustomKeyStoreId</code> parameter is required in all commands.
  /// Use the other parameters of <code>UpdateCustomKeyStore</code> to edit your
  /// key store settings.
  ///
  /// <ul>
  /// <li>
  /// Use the <code>NewCustomKeyStoreName</code> parameter to change the
  /// friendly name of the custom key store to the value that you specify.
  ///
  ///
  /// </li>
  /// <li>
  /// Use the <code>KeyStorePassword</code> parameter tell KMS the current
  /// password of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
  /// <code>kmsuser</code> crypto user (CU)</a> in the associated CloudHSM
  /// cluster. You can use this parameter to <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-password">fix
  /// connection failures</a> that occur when KMS cannot log into the associated
  /// cluster because the <code>kmsuser</code> password has changed. This value
  /// does not change the password in the CloudHSM cluster.
  ///
  ///
  /// </li>
  /// <li>
  /// Use the <code>CloudHsmClusterId</code> parameter to associate the custom
  /// key store with a different, but related, CloudHSM cluster. You can use
  /// this parameter to repair a custom key store if its CloudHSM cluster
  /// becomes corrupted or is deleted, or when you need to create or restore a
  /// cluster from a backup.
  /// </li>
  /// </ul>
  /// If the operation succeeds, it returns a JSON object with no properties.
  ///
  /// This operation is part of the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom
  /// Key Store feature</a> feature in KMS, which combines the convenience and
  /// extensive integration of KMS with the isolation and control of a
  /// single-tenant key store.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a
  /// custom key store in a different Amazon Web Services account.
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
  /// Associates the custom key store with a related CloudHSM cluster.
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
  /// the CloudHSM cluster that is associated with the custom key store.
  ///
  /// This parameter tells KMS the current password of the <code>kmsuser</code>
  /// crypto user (CU). It does not set or change the password of any users in
  /// the CloudHSM cluster.
  ///
  /// Parameter [newCustomKeyStoreName] :
  /// Changes the friendly name of the custom key store to the value that you
  /// specify. The custom key store name must be unique in the Amazon Web
  /// Services account.
  Future<void> updateCustomKeyStore({
    required String customKeyStoreId,
    String? cloudHsmClusterId,
    String? keyStorePassword,
    String? newCustomKeyStoreName,
  }) async {
    ArgumentError.checkNotNull(customKeyStoreId, 'customKeyStoreId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UpdateCustomKeyStore'
    };
    await _protocol.send(
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
  }

  /// Updates the description of a KMS key. To see the description of a KMS key,
  /// use <a>DescribeKey</a>.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: No. You cannot perform this operation on a KMS
  /// key in a different Amazon Web Services account.
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
  /// New description for the KMS key.
  ///
  /// Parameter [keyId] :
  /// Updates the description of the specified KMS key.
  ///
  /// Specify the key ID or key ARN of the KMS key.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  Future<void> updateKeyDescription({
    required String description,
    required String keyId,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    ArgumentError.checkNotNull(keyId, 'keyId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UpdateKeyDescription'
    };
    await _protocol.send(
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

  /// Changes the primary key of a multi-Region key.
  ///
  /// This operation changes the replica key in the specified Region to a
  /// primary key and changes the former primary key to a replica key. For
  /// example, suppose you have a primary key in <code>us-east-1</code> and a
  /// replica key in <code>eu-west-2</code>. If you run
  /// <code>UpdatePrimaryRegion</code> with a <code>PrimaryRegion</code> value
  /// of <code>eu-west-2</code>, the primary key is now the key in
  /// <code>eu-west-2</code>, and the key in <code>us-east-1</code> becomes a
  /// replica key. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-update">Updating
  /// the primary Region</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// This operation supports <i>multi-Region keys</i>, an KMS feature that lets
  /// you create multiple interoperable KMS keys in different Amazon Web
  /// Services Regions. Because these KMS keys have the same key ID, key
  /// material, and other metadata, you can use them interchangeably to encrypt
  /// data in one Amazon Web Services Region and decrypt it in a different
  /// Amazon Web Services Region without re-encrypting the data or making a
  /// cross-Region call. For more information about multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// The <i>primary key</i> of a multi-Region key is the source for properties
  /// that are always shared by primary and replica keys, including the key
  /// material, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id">key
  /// ID</a>, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec">key
  /// spec</a>, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage">key
  /// usage</a>, <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin">key
  /// material origin</a>, and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
  /// key rotation</a>. It's the only key that can be replicated. You cannot <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_ScheduleKeyDeletion.html">delete
  /// the primary key</a> until all replica keys are deleted.
  ///
  /// The key ID and primary Region that you specify uniquely identify the
  /// replica key that will become the primary key. The primary Region must
  /// already have a replica key. This operation does not create a KMS key in
  /// the specified Region. To find the replica keys, use the <a>DescribeKey</a>
  /// operation on the primary key or any replica key. To create a replica key,
  /// use the <a>ReplicateKey</a> operation.
  ///
  /// You can run this operation while using the affected multi-Region keys in
  /// cryptographic operations. This operation should not delay, interrupt, or
  /// cause failures in cryptographic operations.
  ///
  /// Even after this operation completes, the process of updating the primary
  /// Region might still be in progress for a few more seconds. Operations such
  /// as <code>DescribeKey</code> might display both the old and new primary
  /// keys as replicas. The old and new primary keys have a transient key state
  /// of <code>Updating</code>. The original key state is restored when the
  /// update is complete. While the key state is <code>Updating</code>, you can
  /// use the keys in cryptographic operations, but you cannot replicate the new
  /// primary key or perform certain management operations, such as enabling or
  /// disabling these keys. For details about the <code>Updating</code> key
  /// state, see <a href="kms/latest/developerguide/key-state.html">Key state:
  /// Effect on your KMS key</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// This operation does not return any output. To verify that primary key is
  /// changed, use the <a>DescribeKey</a> operation.
  ///
  /// <b>Cross-account use</b>: No. You cannot use this operation in a different
  /// Amazon Web Services account.
  ///
  /// <b>Required permissions</b>:
  ///
  /// <ul>
  /// <li>
  /// <code>kms:UpdatePrimaryRegion</code> on the current primary key (in the
  /// primary key's Region). Include this permission primary key's key policy.
  /// </li>
  /// <li>
  /// <code>kms:UpdatePrimaryRegion</code> on the current replica key (in the
  /// replica key's Region). Include this permission in the replica key's key
  /// policy.
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateKey</a>
  /// </li>
  /// <li>
  /// <a>ReplicateKey</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [DisabledException].
  /// May throw [InvalidArnException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSInternalException].
  /// May throw [NotFoundException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [keyId] :
  /// Identifies the current primary key. When the operation completes, this KMS
  /// key will be a replica key.
  ///
  /// Specify the key ID or key ARN of a multi-Region primary key.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>mrk-1234abcd12ab34cd56ef1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/mrk-1234abcd12ab34cd56ef1234567890ab</code>
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
  /// <a>DescribeKey</a>.
  ///
  /// Parameter [primaryRegion] :
  /// The Amazon Web Services Region of the new primary key. Enter the Region
  /// ID, such as <code>us-east-1</code> or <code>ap-southeast-2</code>. There
  /// must be an existing replica key in this Region.
  ///
  /// When the operation completes, the multi-Region key in this Region will be
  /// the primary key.
  Future<void> updatePrimaryRegion({
    required String keyId,
    required String primaryRegion,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(primaryRegion, 'primaryRegion');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'TrentService.UpdatePrimaryRegion'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'KeyId': keyId,
        'PrimaryRegion': primaryRegion,
      },
    );
  }

  /// Verifies a digital signature that was generated by the <a>Sign</a>
  /// operation.
  /// <p/>
  /// Verification confirms that an authorized user signed the message with the
  /// specified KMS key and signing algorithm, and the message hasn't changed
  /// since it was signed. If the signature is verified, the value of the
  /// <code>SignatureValid</code> field in the response is <code>True</code>. If
  /// the signature verification fails, the <code>Verify</code> operation fails
  /// with an <code>KMSInvalidSignatureException</code> exception.
  ///
  /// A digital signature is generated by using the private key in an asymmetric
  /// KMS key. The signature is verified by using the public key in the same
  /// asymmetric KMS key. For information about symmetric and asymmetric KMS
  /// keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// Symmetric and Asymmetric KMS keys</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// To verify a digital signature, you can use the <code>Verify</code>
  /// operation. Specify the same asymmetric KMS key, message, and signing
  /// algorithm that were used to produce the signature.
  ///
  /// You can also verify the digital signature by using the public key of the
  /// KMS key outside of KMS. Use the <a>GetPublicKey</a> operation to download
  /// the public key in the asymmetric KMS key and then use the public key to
  /// verify the signature outside of KMS. The advantage of using the
  /// <code>Verify</code> operation is that it is performed within KMS. As a
  /// result, it's easy to call, the operation is performed within the FIPS
  /// boundary, it is logged in CloudTrail, and you can use key policy and IAM
  /// policy to determine who is authorized to use the KMS key to verify
  /// signatures.
  ///
  /// The KMS key that you use for this operation must be in a compatible key
  /// state. For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service
  /// Developer Guide</i>.
  ///
  /// <b>Cross-account use</b>: Yes. To perform this operation with a KMS key in
  /// a different Amazon Web Services account, specify the key ARN or alias ARN
  /// in the value of the <code>KeyId</code> parameter.
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
  /// Identifies the asymmetric KMS key that will be used to verify the
  /// signature. This must be the same KMS key that was used to generate the
  /// signature. If you specify a different KMS key, the signature verification
  /// fails.
  ///
  /// To specify a KMS key, use its key ID, key ARN, alias name, or alias ARN.
  /// When using an alias name, prefix it with <code>"alias/"</code>. To specify
  /// a KMS key in a different Amazon Web Services account, you must use the key
  /// ARN or alias ARN.
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
  /// To get the key ID and key ARN for a KMS key, use <a>ListKeys</a> or
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
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  ///
  /// Parameter [messageType] :
  /// Tells KMS whether the value of the <code>Message</code> parameter is a
  /// message or message digest. The default value, RAW, indicates a message. To
  /// indicate a message digest, enter <code>DIGEST</code>.
  /// <important>
  /// Use the <code>DIGEST</code> value only when the value of the
  /// <code>Message</code> parameter is a message digest. If you use the
  /// <code>DIGEST</code> value with a raw message, the security of the
  /// verification operation can be compromised.
  /// </important>
  Future<VerifyResponse> verify({
    required String keyId,
    required Uint8List message,
    required Uint8List signature,
    required SigningAlgorithmSpec signingAlgorithm,
    List<String>? grantTokens,
    MessageType? messageType,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
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
        'Message': base64Encode(message),
        'Signature': base64Encode(signature),
        'SigningAlgorithm': signingAlgorithm.toValue(),
        if (grantTokens != null) 'GrantTokens': grantTokens,
        if (messageType != null) 'MessageType': messageType.toValue(),
      },
    );

    return VerifyResponse.fromJson(jsonResponse.body);
  }
}

enum AlgorithmSpec {
  rsaesPkcs1V1_5,
  rsaesOaepSha_1,
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
  }
}

extension on String {
  AlgorithmSpec toAlgorithmSpec() {
    switch (this) {
      case 'RSAES_PKCS1_V1_5':
        return AlgorithmSpec.rsaesPkcs1V1_5;
      case 'RSAES_OAEP_SHA_1':
        return AlgorithmSpec.rsaesOaepSha_1;
      case 'RSAES_OAEP_SHA_256':
        return AlgorithmSpec.rsaesOaepSha_256;
    }
    throw Exception('$this is not known in enum AlgorithmSpec');
  }
}

/// Contains information about an alias.
class AliasListEntry {
  /// String that contains the key ARN.
  final String? aliasArn;

  /// String that contains the alias. This value begins with <code>alias/</code>.
  final String? aliasName;

  /// Date and time that the alias was most recently created in the account and
  /// Region. Formatted as Unix time.
  final DateTime? creationDate;

  /// Date and time that the alias was most recently associated with a KMS key in
  /// the account and Region. Formatted as Unix time.
  final DateTime? lastUpdatedDate;

  /// String that contains the key identifier of the KMS key associated with the
  /// alias.
  final String? targetKeyId;

  AliasListEntry({
    this.aliasArn,
    this.aliasName,
    this.creationDate,
    this.lastUpdatedDate,
    this.targetKeyId,
  });

  factory AliasListEntry.fromJson(Map<String, dynamic> json) {
    return AliasListEntry(
      aliasArn: json['AliasArn'] as String?,
      aliasName: json['AliasName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      lastUpdatedDate: timeStampFromJson(json['LastUpdatedDate']),
      targetKeyId: json['TargetKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasArn = this.aliasArn;
    final aliasName = this.aliasName;
    final creationDate = this.creationDate;
    final lastUpdatedDate = this.lastUpdatedDate;
    final targetKeyId = this.targetKeyId;
    return {
      if (aliasArn != null) 'AliasArn': aliasArn,
      if (aliasName != null) 'AliasName': aliasName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (lastUpdatedDate != null)
        'LastUpdatedDate': unixTimestampToJson(lastUpdatedDate),
      if (targetKeyId != null) 'TargetKeyId': targetKeyId,
    };
  }
}

class CancelKeyDeletionResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key whose deletion is canceled.
  final String? keyId;

  CancelKeyDeletionResponse({
    this.keyId,
  });

  factory CancelKeyDeletionResponse.fromJson(Map<String, dynamic> json) {
    return CancelKeyDeletionResponse(
      keyId: json['KeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    return {
      if (keyId != null) 'KeyId': keyId,
    };
  }
}

class ConnectCustomKeyStoreResponse {
  ConnectCustomKeyStoreResponse();

  factory ConnectCustomKeyStoreResponse.fromJson(Map<String, dynamic> _) {
    return ConnectCustomKeyStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ConnectionErrorCodeType {
  invalidCredentials,
  clusterNotFound,
  networkErrors,
  internalError,
  insufficientCloudhsmHsms,
  userLockedOut,
  userNotFound,
  userLoggedIn,
  subnetNotFound,
}

extension on ConnectionErrorCodeType {
  String toValue() {
    switch (this) {
      case ConnectionErrorCodeType.invalidCredentials:
        return 'INVALID_CREDENTIALS';
      case ConnectionErrorCodeType.clusterNotFound:
        return 'CLUSTER_NOT_FOUND';
      case ConnectionErrorCodeType.networkErrors:
        return 'NETWORK_ERRORS';
      case ConnectionErrorCodeType.internalError:
        return 'INTERNAL_ERROR';
      case ConnectionErrorCodeType.insufficientCloudhsmHsms:
        return 'INSUFFICIENT_CLOUDHSM_HSMS';
      case ConnectionErrorCodeType.userLockedOut:
        return 'USER_LOCKED_OUT';
      case ConnectionErrorCodeType.userNotFound:
        return 'USER_NOT_FOUND';
      case ConnectionErrorCodeType.userLoggedIn:
        return 'USER_LOGGED_IN';
      case ConnectionErrorCodeType.subnetNotFound:
        return 'SUBNET_NOT_FOUND';
    }
  }
}

extension on String {
  ConnectionErrorCodeType toConnectionErrorCodeType() {
    switch (this) {
      case 'INVALID_CREDENTIALS':
        return ConnectionErrorCodeType.invalidCredentials;
      case 'CLUSTER_NOT_FOUND':
        return ConnectionErrorCodeType.clusterNotFound;
      case 'NETWORK_ERRORS':
        return ConnectionErrorCodeType.networkErrors;
      case 'INTERNAL_ERROR':
        return ConnectionErrorCodeType.internalError;
      case 'INSUFFICIENT_CLOUDHSM_HSMS':
        return ConnectionErrorCodeType.insufficientCloudhsmHsms;
      case 'USER_LOCKED_OUT':
        return ConnectionErrorCodeType.userLockedOut;
      case 'USER_NOT_FOUND':
        return ConnectionErrorCodeType.userNotFound;
      case 'USER_LOGGED_IN':
        return ConnectionErrorCodeType.userLoggedIn;
      case 'SUBNET_NOT_FOUND':
        return ConnectionErrorCodeType.subnetNotFound;
    }
    throw Exception('$this is not known in enum ConnectionErrorCodeType');
  }
}

enum ConnectionStateType {
  connected,
  connecting,
  failed,
  disconnected,
  disconnecting,
}

extension on ConnectionStateType {
  String toValue() {
    switch (this) {
      case ConnectionStateType.connected:
        return 'CONNECTED';
      case ConnectionStateType.connecting:
        return 'CONNECTING';
      case ConnectionStateType.failed:
        return 'FAILED';
      case ConnectionStateType.disconnected:
        return 'DISCONNECTED';
      case ConnectionStateType.disconnecting:
        return 'DISCONNECTING';
    }
  }
}

extension on String {
  ConnectionStateType toConnectionStateType() {
    switch (this) {
      case 'CONNECTED':
        return ConnectionStateType.connected;
      case 'CONNECTING':
        return ConnectionStateType.connecting;
      case 'FAILED':
        return ConnectionStateType.failed;
      case 'DISCONNECTED':
        return ConnectionStateType.disconnected;
      case 'DISCONNECTING':
        return ConnectionStateType.disconnecting;
    }
    throw Exception('$this is not known in enum ConnectionStateType');
  }
}

class CreateCustomKeyStoreResponse {
  /// A unique identifier for the new custom key store.
  final String? customKeyStoreId;

  CreateCustomKeyStoreResponse({
    this.customKeyStoreId,
  });

  factory CreateCustomKeyStoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateCustomKeyStoreResponse(
      customKeyStoreId: json['CustomKeyStoreId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customKeyStoreId = this.customKeyStoreId;
    return {
      if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
    };
  }
}

class CreateGrantResponse {
  /// The unique identifier for the grant.
  ///
  /// You can use the <code>GrantId</code> in a <a>ListGrants</a>,
  /// <a>RetireGrant</a>, or <a>RevokeGrant</a> operation.
  final String? grantId;

  /// The grant token.
  ///
  /// Use a grant token when your permission to call this operation comes from a
  /// new grant that has not yet achieved <i>eventual consistency</i>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">Grant
  /// token</a> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using
  /// a grant token</a> in the <i>Key Management Service Developer Guide</i>.
  final String? grantToken;

  CreateGrantResponse({
    this.grantId,
    this.grantToken,
  });

  factory CreateGrantResponse.fromJson(Map<String, dynamic> json) {
    return CreateGrantResponse(
      grantId: json['GrantId'] as String?,
      grantToken: json['GrantToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grantId = this.grantId;
    final grantToken = this.grantToken;
    return {
      if (grantId != null) 'GrantId': grantId,
      if (grantToken != null) 'GrantToken': grantToken,
    };
  }
}

class CreateKeyResponse {
  /// Metadata associated with the KMS key.
  final KeyMetadata? keyMetadata;

  CreateKeyResponse({
    this.keyMetadata,
  });

  factory CreateKeyResponse.fromJson(Map<String, dynamic> json) {
    return CreateKeyResponse(
      keyMetadata: json['KeyMetadata'] != null
          ? KeyMetadata.fromJson(json['KeyMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyMetadata = this.keyMetadata;
    return {
      if (keyMetadata != null) 'KeyMetadata': keyMetadata,
    };
  }
}

/// Contains information about each custom key store in the custom key store
/// list.
class CustomKeyStoresListEntry {
  /// A unique identifier for the CloudHSM cluster that is associated with the
  /// custom key store.
  final String? cloudHsmClusterId;

  /// Describes the connection error. This field appears in the response only when
  /// the <code>ConnectionState</code> is <code>FAILED</code>. For help resolving
  /// these errors, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed">How
  /// to Fix a Connection Failure</a> in <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>CLUSTER_NOT_FOUND</code> - KMS cannot find the CloudHSM cluster with
  /// the specified cluster ID.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_CLOUDHSM_HSMS</code> - The associated CloudHSM cluster
  /// does not contain any active HSMs. To connect a custom key store to its
  /// CloudHSM cluster, the cluster must contain at least one active HSM.
  /// </li>
  /// <li>
  /// <code>INTERNAL_ERROR</code> - KMS could not complete the request due to an
  /// internal error. Retry the request. For <code>ConnectCustomKeyStore</code>
  /// requests, disconnect the custom key store before trying to connect again.
  /// </li>
  /// <li>
  /// <code>INVALID_CREDENTIALS</code> - KMS does not have the correct password
  /// for the <code>kmsuser</code> crypto user in the CloudHSM cluster. Before you
  /// can connect your custom key store to its CloudHSM cluster, you must change
  /// the <code>kmsuser</code> account password and update the key store password
  /// value for the custom key store.
  /// </li>
  /// <li>
  /// <code>NETWORK_ERRORS</code> - Network errors are preventing KMS from
  /// connecting to the custom key store.
  /// </li>
  /// <li>
  /// <code>SUBNET_NOT_FOUND</code> - A subnet in the CloudHSM cluster
  /// configuration was deleted. If KMS cannot find all of the subnets in the
  /// cluster configuration, attempts to connect the custom key store to the
  /// CloudHSM cluster fail. To fix this error, create a cluster from a recent
  /// backup and associate it with your custom key store. (This process creates a
  /// new cluster configuration with a VPC and private subnets.) For details, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-failed">How
  /// to Fix a Connection Failure</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>USER_LOCKED_OUT</code> - The <code>kmsuser</code> CU account is locked
  /// out of the associated CloudHSM cluster due to too many failed password
  /// attempts. Before you can connect your custom key store to its CloudHSM
  /// cluster, you must change the <code>kmsuser</code> account password and
  /// update the key store password value for the custom key store.
  /// </li>
  /// <li>
  /// <code>USER_LOGGED_IN</code> - The <code>kmsuser</code> CU account is logged
  /// into the the associated CloudHSM cluster. This prevents KMS from rotating
  /// the <code>kmsuser</code> account password and logging into the cluster.
  /// Before you can connect your custom key store to its CloudHSM cluster, you
  /// must log the <code>kmsuser</code> CU out of the cluster. If you changed the
  /// <code>kmsuser</code> password to log into the cluster, you must also and
  /// update the key store password value for the custom key store. For help, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#login-kmsuser-2">How
  /// to Log Out and Reconnect</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  /// </li>
  /// <li>
  /// <code>USER_NOT_FOUND</code> - KMS cannot find a <code>kmsuser</code> CU
  /// account in the associated CloudHSM cluster. Before you can connect your
  /// custom key store to its CloudHSM cluster, you must create a
  /// <code>kmsuser</code> CU account in the cluster, and then update the key
  /// store password value for the custom key store.
  /// </li>
  /// </ul>
  final ConnectionErrorCodeType? connectionErrorCode;

  /// Indicates whether the custom key store is connected to its CloudHSM cluster.
  ///
  /// You can create and use KMS keys in your custom key stores only when its
  /// connection state is <code>CONNECTED</code>.
  ///
  /// The value is <code>DISCONNECTED</code> if the key store has never been
  /// connected or you use the <a>DisconnectCustomKeyStore</a> operation to
  /// disconnect it. If the value is <code>CONNECTED</code> but you are having
  /// trouble using the custom key store, make sure that its associated CloudHSM
  /// cluster is active and contains at least one active HSM.
  ///
  /// A value of <code>FAILED</code> indicates that an attempt to connect was
  /// unsuccessful. The <code>ConnectionErrorCode</code> field in the response
  /// indicates the cause of the failure. For help resolving a connection failure,
  /// see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting
  /// a Custom Key Store</a> in the <i>Key Management Service Developer Guide</i>.
  final ConnectionStateType? connectionState;

  /// The date and time when the custom key store was created.
  final DateTime? creationDate;

  /// A unique identifier for the custom key store.
  final String? customKeyStoreId;

  /// The user-specified friendly name for the custom key store.
  final String? customKeyStoreName;

  /// The trust anchor certificate of the associated CloudHSM cluster. When you <a
  /// href="https://docs.aws.amazon.com/cloudhsm/latest/userguide/initialize-cluster.html#sign-csr">initialize
  /// the cluster</a>, you create this certificate and save it in the
  /// <code>customerCA.crt</code> file.
  final String? trustAnchorCertificate;

  CustomKeyStoresListEntry({
    this.cloudHsmClusterId,
    this.connectionErrorCode,
    this.connectionState,
    this.creationDate,
    this.customKeyStoreId,
    this.customKeyStoreName,
    this.trustAnchorCertificate,
  });

  factory CustomKeyStoresListEntry.fromJson(Map<String, dynamic> json) {
    return CustomKeyStoresListEntry(
      cloudHsmClusterId: json['CloudHsmClusterId'] as String?,
      connectionErrorCode:
          (json['ConnectionErrorCode'] as String?)?.toConnectionErrorCodeType(),
      connectionState:
          (json['ConnectionState'] as String?)?.toConnectionStateType(),
      creationDate: timeStampFromJson(json['CreationDate']),
      customKeyStoreId: json['CustomKeyStoreId'] as String?,
      customKeyStoreName: json['CustomKeyStoreName'] as String?,
      trustAnchorCertificate: json['TrustAnchorCertificate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudHsmClusterId = this.cloudHsmClusterId;
    final connectionErrorCode = this.connectionErrorCode;
    final connectionState = this.connectionState;
    final creationDate = this.creationDate;
    final customKeyStoreId = this.customKeyStoreId;
    final customKeyStoreName = this.customKeyStoreName;
    final trustAnchorCertificate = this.trustAnchorCertificate;
    return {
      if (cloudHsmClusterId != null) 'CloudHsmClusterId': cloudHsmClusterId,
      if (connectionErrorCode != null)
        'ConnectionErrorCode': connectionErrorCode.toValue(),
      if (connectionState != null) 'ConnectionState': connectionState.toValue(),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
      if (customKeyStoreName != null) 'CustomKeyStoreName': customKeyStoreName,
      if (trustAnchorCertificate != null)
        'TrustAnchorCertificate': trustAnchorCertificate,
    };
  }
}

@Deprecated('Deprecated')
enum CustomerMasterKeySpec {
  rsa_2048,
  rsa_3072,
  rsa_4096,
  eccNistP256,
  eccNistP384,
  eccNistP521,
  eccSecgP256k1,
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
  }
}

extension on String {
  CustomerMasterKeySpec toCustomerMasterKeySpec() {
    switch (this) {
      case 'RSA_2048':
        return CustomerMasterKeySpec.rsa_2048;
      case 'RSA_3072':
        return CustomerMasterKeySpec.rsa_3072;
      case 'RSA_4096':
        return CustomerMasterKeySpec.rsa_4096;
      case 'ECC_NIST_P256':
        return CustomerMasterKeySpec.eccNistP256;
      case 'ECC_NIST_P384':
        return CustomerMasterKeySpec.eccNistP384;
      case 'ECC_NIST_P521':
        return CustomerMasterKeySpec.eccNistP521;
      case 'ECC_SECG_P256K1':
        return CustomerMasterKeySpec.eccSecgP256k1;
      case 'SYMMETRIC_DEFAULT':
        return CustomerMasterKeySpec.symmetricDefault;
    }
    throw Exception('$this is not known in enum CustomerMasterKeySpec');
  }
}

enum DataKeyPairSpec {
  rsa_2048,
  rsa_3072,
  rsa_4096,
  eccNistP256,
  eccNistP384,
  eccNistP521,
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
  }
}

extension on String {
  DataKeyPairSpec toDataKeyPairSpec() {
    switch (this) {
      case 'RSA_2048':
        return DataKeyPairSpec.rsa_2048;
      case 'RSA_3072':
        return DataKeyPairSpec.rsa_3072;
      case 'RSA_4096':
        return DataKeyPairSpec.rsa_4096;
      case 'ECC_NIST_P256':
        return DataKeyPairSpec.eccNistP256;
      case 'ECC_NIST_P384':
        return DataKeyPairSpec.eccNistP384;
      case 'ECC_NIST_P521':
        return DataKeyPairSpec.eccNistP521;
      case 'ECC_SECG_P256K1':
        return DataKeyPairSpec.eccSecgP256k1;
    }
    throw Exception('$this is not known in enum DataKeyPairSpec');
  }
}

enum DataKeySpec {
  aes_256,
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
  }
}

extension on String {
  DataKeySpec toDataKeySpec() {
    switch (this) {
      case 'AES_256':
        return DataKeySpec.aes_256;
      case 'AES_128':
        return DataKeySpec.aes_128;
    }
    throw Exception('$this is not known in enum DataKeySpec');
  }
}

class DecryptResponse {
  /// The encryption algorithm that was used to decrypt the ciphertext.
  final EncryptionAlgorithmSpec? encryptionAlgorithm;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key that was used to decrypt the ciphertext.
  final String? keyId;

  /// Decrypted plaintext data. When you use the HTTP API or the Amazon Web
  /// Services CLI, the value is Base64-encoded. Otherwise, it is not
  /// Base64-encoded.
  final Uint8List? plaintext;

  DecryptResponse({
    this.encryptionAlgorithm,
    this.keyId,
    this.plaintext,
  });

  factory DecryptResponse.fromJson(Map<String, dynamic> json) {
    return DecryptResponse(
      encryptionAlgorithm:
          (json['EncryptionAlgorithm'] as String?)?.toEncryptionAlgorithmSpec(),
      keyId: json['KeyId'] as String?,
      plaintext: _s.decodeNullableUint8List(json['Plaintext'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionAlgorithm = this.encryptionAlgorithm;
    final keyId = this.keyId;
    final plaintext = this.plaintext;
    return {
      if (encryptionAlgorithm != null)
        'EncryptionAlgorithm': encryptionAlgorithm.toValue(),
      if (keyId != null) 'KeyId': keyId,
      if (plaintext != null) 'Plaintext': base64Encode(plaintext),
    };
  }
}

class DeleteCustomKeyStoreResponse {
  DeleteCustomKeyStoreResponse();

  factory DeleteCustomKeyStoreResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomKeyStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeCustomKeyStoresResponse {
  /// Contains metadata about each custom key store.
  final List<CustomKeyStoresListEntry>? customKeyStores;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  final String? nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  final bool? truncated;

  DescribeCustomKeyStoresResponse({
    this.customKeyStores,
    this.nextMarker,
    this.truncated,
  });

  factory DescribeCustomKeyStoresResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCustomKeyStoresResponse(
      customKeyStores: (json['CustomKeyStores'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CustomKeyStoresListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final customKeyStores = this.customKeyStores;
    final nextMarker = this.nextMarker;
    final truncated = this.truncated;
    return {
      if (customKeyStores != null) 'CustomKeyStores': customKeyStores,
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

class DescribeKeyResponse {
  /// Metadata associated with the key.
  final KeyMetadata? keyMetadata;

  DescribeKeyResponse({
    this.keyMetadata,
  });

  factory DescribeKeyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeKeyResponse(
      keyMetadata: json['KeyMetadata'] != null
          ? KeyMetadata.fromJson(json['KeyMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyMetadata = this.keyMetadata;
    return {
      if (keyMetadata != null) 'KeyMetadata': keyMetadata,
    };
  }
}

class DisconnectCustomKeyStoreResponse {
  DisconnectCustomKeyStoreResponse();

  factory DisconnectCustomKeyStoreResponse.fromJson(Map<String, dynamic> _) {
    return DisconnectCustomKeyStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EncryptResponse {
  /// The encrypted plaintext. When you use the HTTP API or the Amazon Web
  /// Services CLI, the value is Base64-encoded. Otherwise, it is not
  /// Base64-encoded.
  final Uint8List? ciphertextBlob;

  /// The encryption algorithm that was used to encrypt the plaintext.
  final EncryptionAlgorithmSpec? encryptionAlgorithm;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key that was used to encrypt the plaintext.
  final String? keyId;

  EncryptResponse({
    this.ciphertextBlob,
    this.encryptionAlgorithm,
    this.keyId,
  });

  factory EncryptResponse.fromJson(Map<String, dynamic> json) {
    return EncryptResponse(
      ciphertextBlob:
          _s.decodeNullableUint8List(json['CiphertextBlob'] as String?),
      encryptionAlgorithm:
          (json['EncryptionAlgorithm'] as String?)?.toEncryptionAlgorithmSpec(),
      keyId: json['KeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ciphertextBlob = this.ciphertextBlob;
    final encryptionAlgorithm = this.encryptionAlgorithm;
    final keyId = this.keyId;
    return {
      if (ciphertextBlob != null)
        'CiphertextBlob': base64Encode(ciphertextBlob),
      if (encryptionAlgorithm != null)
        'EncryptionAlgorithm': encryptionAlgorithm.toValue(),
      if (keyId != null) 'KeyId': keyId,
    };
  }
}

enum EncryptionAlgorithmSpec {
  symmetricDefault,
  rsaesOaepSha_1,
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
  }
}

extension on String {
  EncryptionAlgorithmSpec toEncryptionAlgorithmSpec() {
    switch (this) {
      case 'SYMMETRIC_DEFAULT':
        return EncryptionAlgorithmSpec.symmetricDefault;
      case 'RSAES_OAEP_SHA_1':
        return EncryptionAlgorithmSpec.rsaesOaepSha_1;
      case 'RSAES_OAEP_SHA_256':
        return EncryptionAlgorithmSpec.rsaesOaepSha_256;
    }
    throw Exception('$this is not known in enum EncryptionAlgorithmSpec');
  }
}

enum ExpirationModelType {
  keyMaterialExpires,
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
  }
}

extension on String {
  ExpirationModelType toExpirationModelType() {
    switch (this) {
      case 'KEY_MATERIAL_EXPIRES':
        return ExpirationModelType.keyMaterialExpires;
      case 'KEY_MATERIAL_DOES_NOT_EXPIRE':
        return ExpirationModelType.keyMaterialDoesNotExpire;
    }
    throw Exception('$this is not known in enum ExpirationModelType');
  }
}

class GenerateDataKeyPairResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key that encrypted the private key.
  final String? keyId;

  /// The type of data key pair that was generated.
  final DataKeyPairSpec? keyPairSpec;

  /// The encrypted copy of the private key. When you use the HTTP API or the
  /// Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not
  /// Base64-encoded.
  final Uint8List? privateKeyCiphertextBlob;

  /// The plaintext copy of the private key. When you use the HTTP API or the
  /// Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not
  /// Base64-encoded.
  final Uint8List? privateKeyPlaintext;

  /// The public key (in plaintext).
  final Uint8List? publicKey;

  GenerateDataKeyPairResponse({
    this.keyId,
    this.keyPairSpec,
    this.privateKeyCiphertextBlob,
    this.privateKeyPlaintext,
    this.publicKey,
  });

  factory GenerateDataKeyPairResponse.fromJson(Map<String, dynamic> json) {
    return GenerateDataKeyPairResponse(
      keyId: json['KeyId'] as String?,
      keyPairSpec: (json['KeyPairSpec'] as String?)?.toDataKeyPairSpec(),
      privateKeyCiphertextBlob: _s
          .decodeNullableUint8List(json['PrivateKeyCiphertextBlob'] as String?),
      privateKeyPlaintext:
          _s.decodeNullableUint8List(json['PrivateKeyPlaintext'] as String?),
      publicKey: _s.decodeNullableUint8List(json['PublicKey'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    final keyPairSpec = this.keyPairSpec;
    final privateKeyCiphertextBlob = this.privateKeyCiphertextBlob;
    final privateKeyPlaintext = this.privateKeyPlaintext;
    final publicKey = this.publicKey;
    return {
      if (keyId != null) 'KeyId': keyId,
      if (keyPairSpec != null) 'KeyPairSpec': keyPairSpec.toValue(),
      if (privateKeyCiphertextBlob != null)
        'PrivateKeyCiphertextBlob': base64Encode(privateKeyCiphertextBlob),
      if (privateKeyPlaintext != null)
        'PrivateKeyPlaintext': base64Encode(privateKeyPlaintext),
      if (publicKey != null) 'PublicKey': base64Encode(publicKey),
    };
  }
}

class GenerateDataKeyPairWithoutPlaintextResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key that encrypted the private key.
  final String? keyId;

  /// The type of data key pair that was generated.
  final DataKeyPairSpec? keyPairSpec;

  /// The encrypted copy of the private key. When you use the HTTP API or the
  /// Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not
  /// Base64-encoded.
  final Uint8List? privateKeyCiphertextBlob;

  /// The public key (in plaintext).
  final Uint8List? publicKey;

  GenerateDataKeyPairWithoutPlaintextResponse({
    this.keyId,
    this.keyPairSpec,
    this.privateKeyCiphertextBlob,
    this.publicKey,
  });

  factory GenerateDataKeyPairWithoutPlaintextResponse.fromJson(
      Map<String, dynamic> json) {
    return GenerateDataKeyPairWithoutPlaintextResponse(
      keyId: json['KeyId'] as String?,
      keyPairSpec: (json['KeyPairSpec'] as String?)?.toDataKeyPairSpec(),
      privateKeyCiphertextBlob: _s
          .decodeNullableUint8List(json['PrivateKeyCiphertextBlob'] as String?),
      publicKey: _s.decodeNullableUint8List(json['PublicKey'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    final keyPairSpec = this.keyPairSpec;
    final privateKeyCiphertextBlob = this.privateKeyCiphertextBlob;
    final publicKey = this.publicKey;
    return {
      if (keyId != null) 'KeyId': keyId,
      if (keyPairSpec != null) 'KeyPairSpec': keyPairSpec.toValue(),
      if (privateKeyCiphertextBlob != null)
        'PrivateKeyCiphertextBlob': base64Encode(privateKeyCiphertextBlob),
      if (publicKey != null) 'PublicKey': base64Encode(publicKey),
    };
  }
}

class GenerateDataKeyResponse {
  /// The encrypted copy of the data key. When you use the HTTP API or the Amazon
  /// Web Services CLI, the value is Base64-encoded. Otherwise, it is not
  /// Base64-encoded.
  final Uint8List? ciphertextBlob;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key that encrypted the data key.
  final String? keyId;

  /// The plaintext data key. When you use the HTTP API or the Amazon Web Services
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded. Use
  /// this data key to encrypt your data outside of KMS. Then, remove it from
  /// memory as soon as possible.
  final Uint8List? plaintext;

  GenerateDataKeyResponse({
    this.ciphertextBlob,
    this.keyId,
    this.plaintext,
  });

  factory GenerateDataKeyResponse.fromJson(Map<String, dynamic> json) {
    return GenerateDataKeyResponse(
      ciphertextBlob:
          _s.decodeNullableUint8List(json['CiphertextBlob'] as String?),
      keyId: json['KeyId'] as String?,
      plaintext: _s.decodeNullableUint8List(json['Plaintext'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final ciphertextBlob = this.ciphertextBlob;
    final keyId = this.keyId;
    final plaintext = this.plaintext;
    return {
      if (ciphertextBlob != null)
        'CiphertextBlob': base64Encode(ciphertextBlob),
      if (keyId != null) 'KeyId': keyId,
      if (plaintext != null) 'Plaintext': base64Encode(plaintext),
    };
  }
}

class GenerateDataKeyWithoutPlaintextResponse {
  /// The encrypted data key. When you use the HTTP API or the Amazon Web Services
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
  final Uint8List? ciphertextBlob;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key that encrypted the data key.
  final String? keyId;

  GenerateDataKeyWithoutPlaintextResponse({
    this.ciphertextBlob,
    this.keyId,
  });

  factory GenerateDataKeyWithoutPlaintextResponse.fromJson(
      Map<String, dynamic> json) {
    return GenerateDataKeyWithoutPlaintextResponse(
      ciphertextBlob:
          _s.decodeNullableUint8List(json['CiphertextBlob'] as String?),
      keyId: json['KeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ciphertextBlob = this.ciphertextBlob;
    final keyId = this.keyId;
    return {
      if (ciphertextBlob != null)
        'CiphertextBlob': base64Encode(ciphertextBlob),
      if (keyId != null) 'KeyId': keyId,
    };
  }
}

class GenerateRandomResponse {
  /// The random byte string. When you use the HTTP API or the Amazon Web Services
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
  final Uint8List? plaintext;

  GenerateRandomResponse({
    this.plaintext,
  });

  factory GenerateRandomResponse.fromJson(Map<String, dynamic> json) {
    return GenerateRandomResponse(
      plaintext: _s.decodeNullableUint8List(json['Plaintext'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final plaintext = this.plaintext;
    return {
      if (plaintext != null) 'Plaintext': base64Encode(plaintext),
    };
  }
}

class GetKeyPolicyResponse {
  /// A key policy document in JSON format.
  final String? policy;

  GetKeyPolicyResponse({
    this.policy,
  });

  factory GetKeyPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetKeyPolicyResponse(
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

class GetKeyRotationStatusResponse {
  /// A Boolean value that specifies whether key rotation is enabled.
  final bool? keyRotationEnabled;

  GetKeyRotationStatusResponse({
    this.keyRotationEnabled,
  });

  factory GetKeyRotationStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetKeyRotationStatusResponse(
      keyRotationEnabled: json['KeyRotationEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyRotationEnabled = this.keyRotationEnabled;
    return {
      if (keyRotationEnabled != null) 'KeyRotationEnabled': keyRotationEnabled,
    };
  }
}

class GetParametersForImportResponse {
  /// The import token to send in a subsequent <a>ImportKeyMaterial</a> request.
  final Uint8List? importToken;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key to use in a subsequent <a>ImportKeyMaterial</a>
  /// request. This is the same KMS key specified in the
  /// <code>GetParametersForImport</code> request.
  final String? keyId;

  /// The time at which the import token and public key are no longer valid. After
  /// this time, you cannot use them to make an <a>ImportKeyMaterial</a> request
  /// and you must send another <code>GetParametersForImport</code> request to get
  /// new ones.
  final DateTime? parametersValidTo;

  /// The public key to use to encrypt the key material before importing it with
  /// <a>ImportKeyMaterial</a>.
  final Uint8List? publicKey;

  GetParametersForImportResponse({
    this.importToken,
    this.keyId,
    this.parametersValidTo,
    this.publicKey,
  });

  factory GetParametersForImportResponse.fromJson(Map<String, dynamic> json) {
    return GetParametersForImportResponse(
      importToken: _s.decodeNullableUint8List(json['ImportToken'] as String?),
      keyId: json['KeyId'] as String?,
      parametersValidTo: timeStampFromJson(json['ParametersValidTo']),
      publicKey: _s.decodeNullableUint8List(json['PublicKey'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final importToken = this.importToken;
    final keyId = this.keyId;
    final parametersValidTo = this.parametersValidTo;
    final publicKey = this.publicKey;
    return {
      if (importToken != null) 'ImportToken': base64Encode(importToken),
      if (keyId != null) 'KeyId': keyId,
      if (parametersValidTo != null)
        'ParametersValidTo': unixTimestampToJson(parametersValidTo),
      if (publicKey != null) 'PublicKey': base64Encode(publicKey),
    };
  }
}

class GetPublicKeyResponse {
  /// Instead, use the <code>KeySpec</code> field in the <code>GetPublicKey</code>
  /// response.
  ///
  /// The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> fields have
  /// the same value. We recommend that you use the <code>KeySpec</code> field in
  /// your code. However, to avoid breaking changes, KMS will support both fields.
  final CustomerMasterKeySpec? customerMasterKeySpec;

  /// The encryption algorithms that KMS supports for this key.
  ///
  /// This information is critical. If a public key encrypts data outside of KMS
  /// by using an unsupported encryption algorithm, the ciphertext cannot be
  /// decrypted.
  ///
  /// This field appears in the response only when the <code>KeyUsage</code> of
  /// the public key is <code>ENCRYPT_DECRYPT</code>.
  final List<EncryptionAlgorithmSpec>? encryptionAlgorithms;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the asymmetric KMS key from which the public key was downloaded.
  final String? keyId;

  /// The type of the of the public key that was downloaded.
  final KeySpec? keySpec;

  /// The permitted use of the public key. Valid values are
  /// <code>ENCRYPT_DECRYPT</code> or <code>SIGN_VERIFY</code>.
  ///
  /// This information is critical. If a public key with <code>SIGN_VERIFY</code>
  /// key usage encrypts data outside of KMS, the ciphertext cannot be decrypted.
  final KeyUsageType? keyUsage;

  /// The exported public key.
  ///
  /// The value is a DER-encoded X.509 public key, also known as
  /// <code>SubjectPublicKeyInfo</code> (SPKI), as defined in <a
  /// href="https://tools.ietf.org/html/rfc5280">RFC 5280</a>. When you use the
  /// HTTP API or the Amazon Web Services CLI, the value is Base64-encoded.
  /// Otherwise, it is not Base64-encoded.
  /// <p/>
  final Uint8List? publicKey;

  /// The signing algorithms that KMS supports for this key.
  ///
  /// This field appears in the response only when the <code>KeyUsage</code> of
  /// the public key is <code>SIGN_VERIFY</code>.
  final List<SigningAlgorithmSpec>? signingAlgorithms;

  GetPublicKeyResponse({
    this.customerMasterKeySpec,
    this.encryptionAlgorithms,
    this.keyId,
    this.keySpec,
    this.keyUsage,
    this.publicKey,
    this.signingAlgorithms,
  });

  factory GetPublicKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetPublicKeyResponse(
      customerMasterKeySpec:
          (json['CustomerMasterKeySpec'] as String?)?.toCustomerMasterKeySpec(),
      encryptionAlgorithms: (json['EncryptionAlgorithms'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEncryptionAlgorithmSpec())
          .toList(),
      keyId: json['KeyId'] as String?,
      keySpec: (json['KeySpec'] as String?)?.toKeySpec(),
      keyUsage: (json['KeyUsage'] as String?)?.toKeyUsageType(),
      publicKey: _s.decodeNullableUint8List(json['PublicKey'] as String?),
      signingAlgorithms: (json['SigningAlgorithms'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSigningAlgorithmSpec())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerMasterKeySpec = this.customerMasterKeySpec;
    final encryptionAlgorithms = this.encryptionAlgorithms;
    final keyId = this.keyId;
    final keySpec = this.keySpec;
    final keyUsage = this.keyUsage;
    final publicKey = this.publicKey;
    final signingAlgorithms = this.signingAlgorithms;
    return {
      if (customerMasterKeySpec != null)
        'CustomerMasterKeySpec': customerMasterKeySpec.toValue(),
      if (encryptionAlgorithms != null)
        'EncryptionAlgorithms':
            encryptionAlgorithms.map((e) => e.toValue()).toList(),
      if (keyId != null) 'KeyId': keyId,
      if (keySpec != null) 'KeySpec': keySpec.toValue(),
      if (keyUsage != null) 'KeyUsage': keyUsage.toValue(),
      if (publicKey != null) 'PublicKey': base64Encode(publicKey),
      if (signingAlgorithms != null)
        'SigningAlgorithms': signingAlgorithms.map((e) => e.toValue()).toList(),
    };
  }
}

/// Use this structure to allow <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
/// operations</a> in the grant only when the operation request includes the
/// specified <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
/// context</a>.
///
/// KMS applies the grant constraints only to cryptographic operations that
/// support an encryption context, that is, all cryptographic operations with a
/// <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#symmetric-cmks">symmetric
/// KMS key</a>. Grant constraints are not applied to operations that do not
/// support an encryption context, such as cryptographic operations with
/// asymmetric KMS keys and management operations, such as <a>DescribeKey</a> or
/// <a>RetireGrant</a>.
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
/// in the <i> <i>Key Management Service Developer Guide</i> </i>.
/// </important>
class GrantConstraints {
  /// A list of key-value pairs that must match the encryption context in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> request. The grant allows the operation only when the
  /// encryption context in the request is the same as the encryption context
  /// specified in this constraint.
  final Map<String, String>? encryptionContextEquals;

  /// A list of key-value pairs that must be included in the encryption context of
  /// the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> request. The grant allows the cryptographic operation only
  /// when the encryption context in the request includes the key-value pairs
  /// specified in this constraint, although it can include additional key-value
  /// pairs.
  final Map<String, String>? encryptionContextSubset;

  GrantConstraints({
    this.encryptionContextEquals,
    this.encryptionContextSubset,
  });

  factory GrantConstraints.fromJson(Map<String, dynamic> json) {
    return GrantConstraints(
      encryptionContextEquals:
          (json['EncryptionContextEquals'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      encryptionContextSubset:
          (json['EncryptionContextSubset'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionContextEquals = this.encryptionContextEquals;
    final encryptionContextSubset = this.encryptionContextSubset;
    return {
      if (encryptionContextEquals != null)
        'EncryptionContextEquals': encryptionContextEquals,
      if (encryptionContextSubset != null)
        'EncryptionContextSubset': encryptionContextSubset,
    };
  }
}

/// Contains information about a grant.
class GrantListEntry {
  /// A list of key-value pairs that must be present in the encryption context of
  /// certain subsequent operations that the grant allows.
  final GrantConstraints? constraints;

  /// The date and time when the grant was created.
  final DateTime? creationDate;

  /// The unique identifier for the grant.
  final String? grantId;

  /// The identity that gets the permissions in the grant.
  ///
  /// The <code>GranteePrincipal</code> field in the <code>ListGrants</code>
  /// response usually contains the user or role designated as the grantee
  /// principal in the grant. However, when the grantee principal in the grant is
  /// an Amazon Web Services service, the <code>GranteePrincipal</code> field
  /// contains the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">service
  /// principal</a>, which might represent several different grantee principals.
  final String? granteePrincipal;

  /// The Amazon Web Services account under which the grant was issued.
  final String? issuingAccount;

  /// The unique identifier for the KMS key to which the grant applies.
  final String? keyId;

  /// The friendly name that identifies the grant. If a name was provided in the
  /// <a>CreateGrant</a> request, that name is returned. Otherwise this value is
  /// null.
  final String? name;

  /// The list of operations permitted by the grant.
  final List<GrantOperation>? operations;

  /// The principal that can retire the grant.
  final String? retiringPrincipal;

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

  factory GrantListEntry.fromJson(Map<String, dynamic> json) {
    return GrantListEntry(
      constraints: json['Constraints'] != null
          ? GrantConstraints.fromJson(
              json['Constraints'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      grantId: json['GrantId'] as String?,
      granteePrincipal: json['GranteePrincipal'] as String?,
      issuingAccount: json['IssuingAccount'] as String?,
      keyId: json['KeyId'] as String?,
      name: json['Name'] as String?,
      operations: (json['Operations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toGrantOperation())
          .toList(),
      retiringPrincipal: json['RetiringPrincipal'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final constraints = this.constraints;
    final creationDate = this.creationDate;
    final grantId = this.grantId;
    final granteePrincipal = this.granteePrincipal;
    final issuingAccount = this.issuingAccount;
    final keyId = this.keyId;
    final name = this.name;
    final operations = this.operations;
    final retiringPrincipal = this.retiringPrincipal;
    return {
      if (constraints != null) 'Constraints': constraints,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (grantId != null) 'GrantId': grantId,
      if (granteePrincipal != null) 'GranteePrincipal': granteePrincipal,
      if (issuingAccount != null) 'IssuingAccount': issuingAccount,
      if (keyId != null) 'KeyId': keyId,
      if (name != null) 'Name': name,
      if (operations != null)
        'Operations': operations.map((e) => e.toValue()).toList(),
      if (retiringPrincipal != null) 'RetiringPrincipal': retiringPrincipal,
    };
  }
}

enum GrantOperation {
  decrypt,
  encrypt,
  generateDataKey,
  generateDataKeyWithoutPlaintext,
  reEncryptFrom,
  reEncryptTo,
  sign,
  verify,
  getPublicKey,
  createGrant,
  retireGrant,
  describeKey,
  generateDataKeyPair,
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
  }
}

extension on String {
  GrantOperation toGrantOperation() {
    switch (this) {
      case 'Decrypt':
        return GrantOperation.decrypt;
      case 'Encrypt':
        return GrantOperation.encrypt;
      case 'GenerateDataKey':
        return GrantOperation.generateDataKey;
      case 'GenerateDataKeyWithoutPlaintext':
        return GrantOperation.generateDataKeyWithoutPlaintext;
      case 'ReEncryptFrom':
        return GrantOperation.reEncryptFrom;
      case 'ReEncryptTo':
        return GrantOperation.reEncryptTo;
      case 'Sign':
        return GrantOperation.sign;
      case 'Verify':
        return GrantOperation.verify;
      case 'GetPublicKey':
        return GrantOperation.getPublicKey;
      case 'CreateGrant':
        return GrantOperation.createGrant;
      case 'RetireGrant':
        return GrantOperation.retireGrant;
      case 'DescribeKey':
        return GrantOperation.describeKey;
      case 'GenerateDataKeyPair':
        return GrantOperation.generateDataKeyPair;
      case 'GenerateDataKeyPairWithoutPlaintext':
        return GrantOperation.generateDataKeyPairWithoutPlaintext;
    }
    throw Exception('$this is not known in enum GrantOperation');
  }
}

class ImportKeyMaterialResponse {
  ImportKeyMaterialResponse();

  factory ImportKeyMaterialResponse.fromJson(Map<String, dynamic> _) {
    return ImportKeyMaterialResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about each entry in the key list.
class KeyListEntry {
  /// ARN of the key.
  final String? keyArn;

  /// Unique identifier of the key.
  final String? keyId;

  KeyListEntry({
    this.keyArn,
    this.keyId,
  });

  factory KeyListEntry.fromJson(Map<String, dynamic> json) {
    return KeyListEntry(
      keyArn: json['KeyArn'] as String?,
      keyId: json['KeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyArn = this.keyArn;
    final keyId = this.keyId;
    return {
      if (keyArn != null) 'KeyArn': keyArn,
      if (keyId != null) 'KeyId': keyId,
    };
  }
}

enum KeyManagerType {
  aws,
  customer,
}

extension on KeyManagerType {
  String toValue() {
    switch (this) {
      case KeyManagerType.aws:
        return 'AWS';
      case KeyManagerType.customer:
        return 'CUSTOMER';
    }
  }
}

extension on String {
  KeyManagerType toKeyManagerType() {
    switch (this) {
      case 'AWS':
        return KeyManagerType.aws;
      case 'CUSTOMER':
        return KeyManagerType.customer;
    }
    throw Exception('$this is not known in enum KeyManagerType');
  }
}

/// Contains metadata about a KMS key.
///
/// This data type is used as a response element for the <a>CreateKey</a> and
/// <a>DescribeKey</a> operations.
class KeyMetadata {
  /// The globally unique identifier for the KMS key.
  final String keyId;

  /// The twelve-digit account ID of the Amazon Web Services account that owns the
  /// KMS key.
  final String? awsAccountId;

  /// The Amazon Resource Name (ARN) of the KMS key. For examples, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms">Key
  /// Management Service (KMS)</a> in the Example ARNs section of the <i>Amazon
  /// Web Services General Reference</i>.
  final String? arn;

  /// The cluster ID of the CloudHSM cluster that contains the key material for
  /// the KMS key. When you create a KMS key in a <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a>, KMS creates the key material for the KMS key in the
  /// associated CloudHSM cluster. This value is present only when the KMS key is
  /// created in a custom key store.
  final String? cloudHsmClusterId;

  /// The date and time when the KMS key was created.
  final DateTime? creationDate;

  /// A unique identifier for the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom
  /// key store</a> that contains the KMS key. This value is present only when the
  /// KMS key is created in a custom key store.
  final String? customKeyStoreId;

  /// Instead, use the <code>KeySpec</code> field.
  ///
  /// The <code>KeySpec</code> and <code>CustomerMasterKeySpec</code> fields have
  /// the same value. We recommend that you use the <code>KeySpec</code> field in
  /// your code. However, to avoid breaking changes, KMS will support both fields.
  final CustomerMasterKeySpec? customerMasterKeySpec;

  /// The date and time after which KMS deletes this KMS key. This value is
  /// present only when the KMS key is scheduled for deletion, that is, when its
  /// <code>KeyState</code> is <code>PendingDeletion</code>.
  ///
  /// When the primary key in a multi-Region key is scheduled for deletion but
  /// still has replica keys, its key state is <code>PendingReplicaDeletion</code>
  /// and the length of its waiting period is displayed in the
  /// <code>PendingDeletionWindowInDays</code> field.
  final DateTime? deletionDate;

  /// The description of the KMS key.
  final String? description;

  /// Specifies whether the KMS key is enabled. When <code>KeyState</code> is
  /// <code>Enabled</code> this value is true, otherwise it is false.
  final bool? enabled;

  /// The encryption algorithms that the KMS key supports. You cannot use the KMS
  /// key with other encryption algorithms within KMS.
  ///
  /// This value is present only when the <code>KeyUsage</code> of the KMS key is
  /// <code>ENCRYPT_DECRYPT</code>.
  final List<EncryptionAlgorithmSpec>? encryptionAlgorithms;

  /// Specifies whether the KMS key's key material expires. This value is present
  /// only when <code>Origin</code> is <code>EXTERNAL</code>, otherwise this value
  /// is omitted.
  final ExpirationModelType? expirationModel;

  /// The manager of the KMS key. KMS keys in your Amazon Web Services account are
  /// either customer managed or Amazon Web Services managed. For more information
  /// about the difference, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys">KMS
  /// keys</a> in the <i>Key Management Service Developer Guide</i>.
  final KeyManagerType? keyManager;

  /// Describes the type of key material in the KMS key.
  final KeySpec? keySpec;

  /// The current status of the KMS key.
  ///
  /// For more information about how key state affects the use of a KMS key, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  final KeyState? keyState;

  /// The <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> for which you can use the KMS key.
  final KeyUsageType? keyUsage;

  /// Indicates whether the KMS key is a multi-Region (<code>True</code>) or
  /// regional (<code>False</code>) key. This value is <code>True</code> for
  /// multi-Region primary and replica keys and <code>False</code> for regional
  /// KMS keys.
  ///
  /// For more information about multi-Region keys, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using
  /// multi-Region keys</a> in the <i>Key Management Service Developer Guide</i>.
  final bool? multiRegion;

  /// Lists the primary and replica keys in same multi-Region key. This field is
  /// present only when the value of the <code>MultiRegion</code> field is
  /// <code>True</code>.
  ///
  /// For more information about any listed KMS key, use the <a>DescribeKey</a>
  /// operation.
  ///
  /// <ul>
  /// <li>
  /// <code>MultiRegionKeyType</code> indicates whether the KMS key is a
  /// <code>PRIMARY</code> or <code>REPLICA</code> key.
  /// </li>
  /// <li>
  /// <code>PrimaryKey</code> displays the key ARN and Region of the primary key.
  /// This field displays the current KMS key if it is the primary key.
  /// </li>
  /// <li>
  /// <code>ReplicaKeys</code> displays the key ARNs and Regions of all replica
  /// keys. This field includes the current KMS key if it is a replica key.
  /// </li>
  /// </ul>
  final MultiRegionConfiguration? multiRegionConfiguration;

  /// The source of the key material for the KMS key. When this value is
  /// <code>AWS_KMS</code>, KMS created the key material. When this value is
  /// <code>EXTERNAL</code>, the key material was imported or the KMS key doesn't
  /// have any key material. When this value is <code>AWS_CLOUDHSM</code>, the key
  /// material was created in the CloudHSM cluster associated with a custom key
  /// store.
  final OriginType? origin;

  /// The waiting period before the primary key in a multi-Region key is deleted.
  /// This waiting period begins when the last of its replica keys is deleted.
  /// This value is present only when the <code>KeyState</code> of the KMS key is
  /// <code>PendingReplicaDeletion</code>. That indicates that the KMS key is the
  /// primary key in a multi-Region key, it is scheduled for deletion, and it
  /// still has existing replica keys.
  ///
  /// When a single-Region KMS key or a multi-Region replica key is scheduled for
  /// deletion, its deletion date is displayed in the <code>DeletionDate</code>
  /// field. However, when the primary key in a multi-Region key is scheduled for
  /// deletion, its waiting period doesn't begin until all of its replica keys are
  /// deleted. This value displays that waiting period. When the last replica key
  /// in the multi-Region key is deleted, the <code>KeyState</code> of the
  /// scheduled primary key changes from <code>PendingReplicaDeletion</code> to
  /// <code>PendingDeletion</code> and the deletion date appears in the
  /// <code>DeletionDate</code> field.
  final int? pendingDeletionWindowInDays;

  /// The signing algorithms that the KMS key supports. You cannot use the KMS key
  /// with other signing algorithms within KMS.
  ///
  /// This field appears only when the <code>KeyUsage</code> of the KMS key is
  /// <code>SIGN_VERIFY</code>.
  final List<SigningAlgorithmSpec>? signingAlgorithms;

  /// The time at which the imported key material expires. When the key material
  /// expires, KMS deletes the key material and the KMS key becomes unusable. This
  /// value is present only for KMS keys whose <code>Origin</code> is
  /// <code>EXTERNAL</code> and whose <code>ExpirationModel</code> is
  /// <code>KEY_MATERIAL_EXPIRES</code>, otherwise this value is omitted.
  final DateTime? validTo;

  KeyMetadata({
    required this.keyId,
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
    this.keySpec,
    this.keyState,
    this.keyUsage,
    this.multiRegion,
    this.multiRegionConfiguration,
    this.origin,
    this.pendingDeletionWindowInDays,
    this.signingAlgorithms,
    this.validTo,
  });

  factory KeyMetadata.fromJson(Map<String, dynamic> json) {
    return KeyMetadata(
      keyId: json['KeyId'] as String,
      awsAccountId: json['AWSAccountId'] as String?,
      arn: json['Arn'] as String?,
      cloudHsmClusterId: json['CloudHsmClusterId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      customKeyStoreId: json['CustomKeyStoreId'] as String?,
      customerMasterKeySpec:
          (json['CustomerMasterKeySpec'] as String?)?.toCustomerMasterKeySpec(),
      deletionDate: timeStampFromJson(json['DeletionDate']),
      description: json['Description'] as String?,
      enabled: json['Enabled'] as bool?,
      encryptionAlgorithms: (json['EncryptionAlgorithms'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEncryptionAlgorithmSpec())
          .toList(),
      expirationModel:
          (json['ExpirationModel'] as String?)?.toExpirationModelType(),
      keyManager: (json['KeyManager'] as String?)?.toKeyManagerType(),
      keySpec: (json['KeySpec'] as String?)?.toKeySpec(),
      keyState: (json['KeyState'] as String?)?.toKeyState(),
      keyUsage: (json['KeyUsage'] as String?)?.toKeyUsageType(),
      multiRegion: json['MultiRegion'] as bool?,
      multiRegionConfiguration: json['MultiRegionConfiguration'] != null
          ? MultiRegionConfiguration.fromJson(
              json['MultiRegionConfiguration'] as Map<String, dynamic>)
          : null,
      origin: (json['Origin'] as String?)?.toOriginType(),
      pendingDeletionWindowInDays: json['PendingDeletionWindowInDays'] as int?,
      signingAlgorithms: (json['SigningAlgorithms'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSigningAlgorithmSpec())
          .toList(),
      validTo: timeStampFromJson(json['ValidTo']),
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    final awsAccountId = this.awsAccountId;
    final arn = this.arn;
    final cloudHsmClusterId = this.cloudHsmClusterId;
    final creationDate = this.creationDate;
    final customKeyStoreId = this.customKeyStoreId;
    final customerMasterKeySpec = this.customerMasterKeySpec;
    final deletionDate = this.deletionDate;
    final description = this.description;
    final enabled = this.enabled;
    final encryptionAlgorithms = this.encryptionAlgorithms;
    final expirationModel = this.expirationModel;
    final keyManager = this.keyManager;
    final keySpec = this.keySpec;
    final keyState = this.keyState;
    final keyUsage = this.keyUsage;
    final multiRegion = this.multiRegion;
    final multiRegionConfiguration = this.multiRegionConfiguration;
    final origin = this.origin;
    final pendingDeletionWindowInDays = this.pendingDeletionWindowInDays;
    final signingAlgorithms = this.signingAlgorithms;
    final validTo = this.validTo;
    return {
      'KeyId': keyId,
      if (awsAccountId != null) 'AWSAccountId': awsAccountId,
      if (arn != null) 'Arn': arn,
      if (cloudHsmClusterId != null) 'CloudHsmClusterId': cloudHsmClusterId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (customKeyStoreId != null) 'CustomKeyStoreId': customKeyStoreId,
      if (customerMasterKeySpec != null)
        'CustomerMasterKeySpec': customerMasterKeySpec.toValue(),
      if (deletionDate != null)
        'DeletionDate': unixTimestampToJson(deletionDate),
      if (description != null) 'Description': description,
      if (enabled != null) 'Enabled': enabled,
      if (encryptionAlgorithms != null)
        'EncryptionAlgorithms':
            encryptionAlgorithms.map((e) => e.toValue()).toList(),
      if (expirationModel != null) 'ExpirationModel': expirationModel.toValue(),
      if (keyManager != null) 'KeyManager': keyManager.toValue(),
      if (keySpec != null) 'KeySpec': keySpec.toValue(),
      if (keyState != null) 'KeyState': keyState.toValue(),
      if (keyUsage != null) 'KeyUsage': keyUsage.toValue(),
      if (multiRegion != null) 'MultiRegion': multiRegion,
      if (multiRegionConfiguration != null)
        'MultiRegionConfiguration': multiRegionConfiguration,
      if (origin != null) 'Origin': origin.toValue(),
      if (pendingDeletionWindowInDays != null)
        'PendingDeletionWindowInDays': pendingDeletionWindowInDays,
      if (signingAlgorithms != null)
        'SigningAlgorithms': signingAlgorithms.map((e) => e.toValue()).toList(),
      if (validTo != null) 'ValidTo': unixTimestampToJson(validTo),
    };
  }
}

enum KeySpec {
  rsa_2048,
  rsa_3072,
  rsa_4096,
  eccNistP256,
  eccNistP384,
  eccNistP521,
  eccSecgP256k1,
  symmetricDefault,
}

extension on KeySpec {
  String toValue() {
    switch (this) {
      case KeySpec.rsa_2048:
        return 'RSA_2048';
      case KeySpec.rsa_3072:
        return 'RSA_3072';
      case KeySpec.rsa_4096:
        return 'RSA_4096';
      case KeySpec.eccNistP256:
        return 'ECC_NIST_P256';
      case KeySpec.eccNistP384:
        return 'ECC_NIST_P384';
      case KeySpec.eccNistP521:
        return 'ECC_NIST_P521';
      case KeySpec.eccSecgP256k1:
        return 'ECC_SECG_P256K1';
      case KeySpec.symmetricDefault:
        return 'SYMMETRIC_DEFAULT';
    }
  }
}

extension on String {
  KeySpec toKeySpec() {
    switch (this) {
      case 'RSA_2048':
        return KeySpec.rsa_2048;
      case 'RSA_3072':
        return KeySpec.rsa_3072;
      case 'RSA_4096':
        return KeySpec.rsa_4096;
      case 'ECC_NIST_P256':
        return KeySpec.eccNistP256;
      case 'ECC_NIST_P384':
        return KeySpec.eccNistP384;
      case 'ECC_NIST_P521':
        return KeySpec.eccNistP521;
      case 'ECC_SECG_P256K1':
        return KeySpec.eccSecgP256k1;
      case 'SYMMETRIC_DEFAULT':
        return KeySpec.symmetricDefault;
    }
    throw Exception('$this is not known in enum KeySpec');
  }
}

enum KeyState {
  creating,
  enabled,
  disabled,
  pendingDeletion,
  pendingImport,
  pendingReplicaDeletion,
  unavailable,
  updating,
}

extension on KeyState {
  String toValue() {
    switch (this) {
      case KeyState.creating:
        return 'Creating';
      case KeyState.enabled:
        return 'Enabled';
      case KeyState.disabled:
        return 'Disabled';
      case KeyState.pendingDeletion:
        return 'PendingDeletion';
      case KeyState.pendingImport:
        return 'PendingImport';
      case KeyState.pendingReplicaDeletion:
        return 'PendingReplicaDeletion';
      case KeyState.unavailable:
        return 'Unavailable';
      case KeyState.updating:
        return 'Updating';
    }
  }
}

extension on String {
  KeyState toKeyState() {
    switch (this) {
      case 'Creating':
        return KeyState.creating;
      case 'Enabled':
        return KeyState.enabled;
      case 'Disabled':
        return KeyState.disabled;
      case 'PendingDeletion':
        return KeyState.pendingDeletion;
      case 'PendingImport':
        return KeyState.pendingImport;
      case 'PendingReplicaDeletion':
        return KeyState.pendingReplicaDeletion;
      case 'Unavailable':
        return KeyState.unavailable;
      case 'Updating':
        return KeyState.updating;
    }
    throw Exception('$this is not known in enum KeyState');
  }
}

enum KeyUsageType {
  signVerify,
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
  }
}

extension on String {
  KeyUsageType toKeyUsageType() {
    switch (this) {
      case 'SIGN_VERIFY':
        return KeyUsageType.signVerify;
      case 'ENCRYPT_DECRYPT':
        return KeyUsageType.encryptDecrypt;
    }
    throw Exception('$this is not known in enum KeyUsageType');
  }
}

class ListAliasesResponse {
  /// A list of aliases.
  final List<AliasListEntry>? aliases;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  final String? nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  final bool? truncated;

  ListAliasesResponse({
    this.aliases,
    this.nextMarker,
    this.truncated,
  });

  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListAliasesResponse(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => AliasListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final nextMarker = this.nextMarker;
    final truncated = this.truncated;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

class ListGrantsResponse {
  /// A list of grants.
  final List<GrantListEntry>? grants;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  final String? nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  final bool? truncated;

  ListGrantsResponse({
    this.grants,
    this.nextMarker,
    this.truncated,
  });

  factory ListGrantsResponse.fromJson(Map<String, dynamic> json) {
    return ListGrantsResponse(
      grants: (json['Grants'] as List?)
          ?.whereNotNull()
          .map((e) => GrantListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final grants = this.grants;
    final nextMarker = this.nextMarker;
    final truncated = this.truncated;
    return {
      if (grants != null) 'Grants': grants,
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

class ListKeyPoliciesResponse {
  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  final String? nextMarker;

  /// A list of key policy names. The only valid value is <code>default</code>.
  final List<String>? policyNames;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  final bool? truncated;

  ListKeyPoliciesResponse({
    this.nextMarker,
    this.policyNames,
    this.truncated,
  });

  factory ListKeyPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListKeyPoliciesResponse(
      nextMarker: json['NextMarker'] as String?,
      policyNames: (json['PolicyNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final policyNames = this.policyNames;
    final truncated = this.truncated;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (policyNames != null) 'PolicyNames': policyNames,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

class ListKeysResponse {
  /// A list of KMS keys.
  final List<KeyListEntry>? keys;

  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  final String? nextMarker;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  final bool? truncated;

  ListKeysResponse({
    this.keys,
    this.nextMarker,
    this.truncated,
  });

  factory ListKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListKeysResponse(
      keys: (json['Keys'] as List?)
          ?.whereNotNull()
          .map((e) => KeyListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final keys = this.keys;
    final nextMarker = this.nextMarker;
    final truncated = this.truncated;
    return {
      if (keys != null) 'Keys': keys,
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

class ListResourceTagsResponse {
  /// When <code>Truncated</code> is true, this element is present and contains
  /// the value to use for the <code>Marker</code> parameter in a subsequent
  /// request.
  ///
  /// Do not assume or infer any information from this value.
  final String? nextMarker;

  /// A list of tags. Each tag consists of a tag key and a tag value.
  /// <note>
  /// Tagging or untagging a KMS key can allow or deny permission to the KMS key.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using
  /// ABAC in KMS</a> in the <i>Key Management Service Developer Guide</i>.
  /// </note>
  final List<Tag>? tags;

  /// A flag that indicates whether there are more items in the list. When this
  /// value is true, the list in this response is truncated. To get more items,
  /// pass the value of the <code>NextMarker</code> element in thisresponse to the
  /// <code>Marker</code> parameter in a subsequent request.
  final bool? truncated;

  ListResourceTagsResponse({
    this.nextMarker,
    this.tags,
    this.truncated,
  });

  factory ListResourceTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceTagsResponse(
      nextMarker: json['NextMarker'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      truncated: json['Truncated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final tags = this.tags;
    final truncated = this.truncated;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (tags != null) 'Tags': tags,
      if (truncated != null) 'Truncated': truncated,
    };
  }
}

enum MessageType {
  raw,
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
  }
}

extension on String {
  MessageType toMessageType() {
    switch (this) {
      case 'RAW':
        return MessageType.raw;
      case 'DIGEST':
        return MessageType.digest;
    }
    throw Exception('$this is not known in enum MessageType');
  }
}

/// Describes the configuration of this multi-Region key. This field appears
/// only when the KMS key is a primary or replica of a multi-Region key.
///
/// For more information about any listed KMS key, use the <a>DescribeKey</a>
/// operation.
class MultiRegionConfiguration {
  /// Indicates whether the KMS key is a <code>PRIMARY</code> or
  /// <code>REPLICA</code> key.
  final MultiRegionKeyType? multiRegionKeyType;

  /// Displays the key ARN and Region of the primary key. This field includes the
  /// current KMS key if it is the primary key.
  final MultiRegionKey? primaryKey;

  /// displays the key ARNs and Regions of all replica keys. This field includes
  /// the current KMS key if it is a replica key.
  final List<MultiRegionKey>? replicaKeys;

  MultiRegionConfiguration({
    this.multiRegionKeyType,
    this.primaryKey,
    this.replicaKeys,
  });

  factory MultiRegionConfiguration.fromJson(Map<String, dynamic> json) {
    return MultiRegionConfiguration(
      multiRegionKeyType:
          (json['MultiRegionKeyType'] as String?)?.toMultiRegionKeyType(),
      primaryKey: json['PrimaryKey'] != null
          ? MultiRegionKey.fromJson(json['PrimaryKey'] as Map<String, dynamic>)
          : null,
      replicaKeys: (json['ReplicaKeys'] as List?)
          ?.whereNotNull()
          .map((e) => MultiRegionKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final multiRegionKeyType = this.multiRegionKeyType;
    final primaryKey = this.primaryKey;
    final replicaKeys = this.replicaKeys;
    return {
      if (multiRegionKeyType != null)
        'MultiRegionKeyType': multiRegionKeyType.toValue(),
      if (primaryKey != null) 'PrimaryKey': primaryKey,
      if (replicaKeys != null) 'ReplicaKeys': replicaKeys,
    };
  }
}

/// Describes the primary or replica key in a multi-Region key.
class MultiRegionKey {
  /// Displays the key ARN of a primary or replica key of a multi-Region key.
  final String? arn;

  /// Displays the Amazon Web Services Region of a primary or replica key in a
  /// multi-Region key.
  final String? region;

  MultiRegionKey({
    this.arn,
    this.region,
  });

  factory MultiRegionKey.fromJson(Map<String, dynamic> json) {
    return MultiRegionKey(
      arn: json['Arn'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final region = this.region;
    return {
      if (arn != null) 'Arn': arn,
      if (region != null) 'Region': region,
    };
  }
}

enum MultiRegionKeyType {
  primary,
  replica,
}

extension on MultiRegionKeyType {
  String toValue() {
    switch (this) {
      case MultiRegionKeyType.primary:
        return 'PRIMARY';
      case MultiRegionKeyType.replica:
        return 'REPLICA';
    }
  }
}

extension on String {
  MultiRegionKeyType toMultiRegionKeyType() {
    switch (this) {
      case 'PRIMARY':
        return MultiRegionKeyType.primary;
      case 'REPLICA':
        return MultiRegionKeyType.replica;
    }
    throw Exception('$this is not known in enum MultiRegionKeyType');
  }
}

enum OriginType {
  awsKms,
  external,
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
  }
}

extension on String {
  OriginType toOriginType() {
    switch (this) {
      case 'AWS_KMS':
        return OriginType.awsKms;
      case 'EXTERNAL':
        return OriginType.external;
      case 'AWS_CLOUDHSM':
        return OriginType.awsCloudhsm;
    }
    throw Exception('$this is not known in enum OriginType');
  }
}

class ReEncryptResponse {
  /// The reencrypted data. When you use the HTTP API or the Amazon Web Services
  /// CLI, the value is Base64-encoded. Otherwise, it is not Base64-encoded.
  final Uint8List? ciphertextBlob;

  /// The encryption algorithm that was used to reencrypt the data.
  final EncryptionAlgorithmSpec? destinationEncryptionAlgorithm;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key that was used to reencrypt the data.
  final String? keyId;

  /// The encryption algorithm that was used to decrypt the ciphertext before it
  /// was reencrypted.
  final EncryptionAlgorithmSpec? sourceEncryptionAlgorithm;

  /// Unique identifier of the KMS key used to originally encrypt the data.
  final String? sourceKeyId;

  ReEncryptResponse({
    this.ciphertextBlob,
    this.destinationEncryptionAlgorithm,
    this.keyId,
    this.sourceEncryptionAlgorithm,
    this.sourceKeyId,
  });

  factory ReEncryptResponse.fromJson(Map<String, dynamic> json) {
    return ReEncryptResponse(
      ciphertextBlob:
          _s.decodeNullableUint8List(json['CiphertextBlob'] as String?),
      destinationEncryptionAlgorithm:
          (json['DestinationEncryptionAlgorithm'] as String?)
              ?.toEncryptionAlgorithmSpec(),
      keyId: json['KeyId'] as String?,
      sourceEncryptionAlgorithm: (json['SourceEncryptionAlgorithm'] as String?)
          ?.toEncryptionAlgorithmSpec(),
      sourceKeyId: json['SourceKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ciphertextBlob = this.ciphertextBlob;
    final destinationEncryptionAlgorithm = this.destinationEncryptionAlgorithm;
    final keyId = this.keyId;
    final sourceEncryptionAlgorithm = this.sourceEncryptionAlgorithm;
    final sourceKeyId = this.sourceKeyId;
    return {
      if (ciphertextBlob != null)
        'CiphertextBlob': base64Encode(ciphertextBlob),
      if (destinationEncryptionAlgorithm != null)
        'DestinationEncryptionAlgorithm':
            destinationEncryptionAlgorithm.toValue(),
      if (keyId != null) 'KeyId': keyId,
      if (sourceEncryptionAlgorithm != null)
        'SourceEncryptionAlgorithm': sourceEncryptionAlgorithm.toValue(),
      if (sourceKeyId != null) 'SourceKeyId': sourceKeyId,
    };
  }
}

class ReplicateKeyResponse {
  /// Displays details about the new replica key, including its Amazon Resource
  /// Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">key
  /// state</a>. It also includes the ARN and Amazon Web Services Region of its
  /// primary key and other replica keys.
  final KeyMetadata? replicaKeyMetadata;

  /// The key policy of the new replica key. The value is a key policy document in
  /// JSON format.
  final String? replicaPolicy;

  /// The tags on the new replica key. The value is a list of tag key and tag
  /// value pairs.
  final List<Tag>? replicaTags;

  ReplicateKeyResponse({
    this.replicaKeyMetadata,
    this.replicaPolicy,
    this.replicaTags,
  });

  factory ReplicateKeyResponse.fromJson(Map<String, dynamic> json) {
    return ReplicateKeyResponse(
      replicaKeyMetadata: json['ReplicaKeyMetadata'] != null
          ? KeyMetadata.fromJson(
              json['ReplicaKeyMetadata'] as Map<String, dynamic>)
          : null,
      replicaPolicy: json['ReplicaPolicy'] as String?,
      replicaTags: (json['ReplicaTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final replicaKeyMetadata = this.replicaKeyMetadata;
    final replicaPolicy = this.replicaPolicy;
    final replicaTags = this.replicaTags;
    return {
      if (replicaKeyMetadata != null) 'ReplicaKeyMetadata': replicaKeyMetadata,
      if (replicaPolicy != null) 'ReplicaPolicy': replicaPolicy,
      if (replicaTags != null) 'ReplicaTags': replicaTags,
    };
  }
}

class ScheduleKeyDeletionResponse {
  /// The date and time after which KMS deletes the KMS key.
  ///
  /// If the KMS key is a multi-Region primary key with replica keys, this field
  /// does not appear. The deletion date for the primary key isn't known until its
  /// last replica key is deleted.
  final DateTime? deletionDate;

  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the KMS key whose deletion is scheduled.
  final String? keyId;

  /// The current status of the KMS key.
  ///
  /// For more information about how key state affects the use of a KMS key, see
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key
  /// state: Effect on your KMS key</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  final KeyState? keyState;

  /// The waiting period before the KMS key is deleted.
  ///
  /// If the KMS key is a multi-Region primary key with replicas, the waiting
  /// period begins when the last of its replica keys is deleted. Otherwise, the
  /// waiting period begins immediately.
  final int? pendingWindowInDays;

  ScheduleKeyDeletionResponse({
    this.deletionDate,
    this.keyId,
    this.keyState,
    this.pendingWindowInDays,
  });

  factory ScheduleKeyDeletionResponse.fromJson(Map<String, dynamic> json) {
    return ScheduleKeyDeletionResponse(
      deletionDate: timeStampFromJson(json['DeletionDate']),
      keyId: json['KeyId'] as String?,
      keyState: (json['KeyState'] as String?)?.toKeyState(),
      pendingWindowInDays: json['PendingWindowInDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionDate = this.deletionDate;
    final keyId = this.keyId;
    final keyState = this.keyState;
    final pendingWindowInDays = this.pendingWindowInDays;
    return {
      if (deletionDate != null)
        'DeletionDate': unixTimestampToJson(deletionDate),
      if (keyId != null) 'KeyId': keyId,
      if (keyState != null) 'KeyState': keyState.toValue(),
      if (pendingWindowInDays != null)
        'PendingWindowInDays': pendingWindowInDays,
    };
  }
}

class SignResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the asymmetric KMS key that was used to sign the message.
  final String? keyId;

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
  /// When you use the HTTP API or the Amazon Web Services CLI, the value is
  /// Base64-encoded. Otherwise, it is not Base64-encoded.
  final Uint8List? signature;

  /// The signing algorithm that was used to sign the message.
  final SigningAlgorithmSpec? signingAlgorithm;

  SignResponse({
    this.keyId,
    this.signature,
    this.signingAlgorithm,
  });

  factory SignResponse.fromJson(Map<String, dynamic> json) {
    return SignResponse(
      keyId: json['KeyId'] as String?,
      signature: _s.decodeNullableUint8List(json['Signature'] as String?),
      signingAlgorithm:
          (json['SigningAlgorithm'] as String?)?.toSigningAlgorithmSpec(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    final signature = this.signature;
    final signingAlgorithm = this.signingAlgorithm;
    return {
      if (keyId != null) 'KeyId': keyId,
      if (signature != null) 'Signature': base64Encode(signature),
      if (signingAlgorithm != null)
        'SigningAlgorithm': signingAlgorithm.toValue(),
    };
  }
}

enum SigningAlgorithmSpec {
  rsassaPssSha_256,
  rsassaPssSha_384,
  rsassaPssSha_512,
  rsassaPkcs1V1_5Sha_256,
  rsassaPkcs1V1_5Sha_384,
  rsassaPkcs1V1_5Sha_512,
  ecdsaSha_256,
  ecdsaSha_384,
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
  }
}

extension on String {
  SigningAlgorithmSpec toSigningAlgorithmSpec() {
    switch (this) {
      case 'RSASSA_PSS_SHA_256':
        return SigningAlgorithmSpec.rsassaPssSha_256;
      case 'RSASSA_PSS_SHA_384':
        return SigningAlgorithmSpec.rsassaPssSha_384;
      case 'RSASSA_PSS_SHA_512':
        return SigningAlgorithmSpec.rsassaPssSha_512;
      case 'RSASSA_PKCS1_V1_5_SHA_256':
        return SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_256;
      case 'RSASSA_PKCS1_V1_5_SHA_384':
        return SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_384;
      case 'RSASSA_PKCS1_V1_5_SHA_512':
        return SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_512;
      case 'ECDSA_SHA_256':
        return SigningAlgorithmSpec.ecdsaSha_256;
      case 'ECDSA_SHA_384':
        return SigningAlgorithmSpec.ecdsaSha_384;
      case 'ECDSA_SHA_512':
        return SigningAlgorithmSpec.ecdsaSha_512;
    }
    throw Exception('$this is not known in enum SigningAlgorithmSpec');
  }
}

/// A key-value pair. A tag consists of a tag key and a tag value. Tag keys and
/// tag values are both required, but tag values can be empty (null) strings.
///
/// For information about the rules that apply to tag keys and tag values, see
/// <a
/// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined
/// Tag Restrictions</a> in the <i>Amazon Web Services Billing and Cost
/// Management User Guide</i>.
class Tag {
  /// The key of the tag.
  final String tagKey;

  /// The value of the tag.
  final String tagValue;

  Tag({
    required this.tagKey,
    required this.tagValue,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagKey: json['TagKey'] as String,
      tagValue: json['TagValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValue = this.tagValue;
    return {
      'TagKey': tagKey,
      'TagValue': tagValue,
    };
  }
}

class UpdateCustomKeyStoreResponse {
  UpdateCustomKeyStoreResponse();

  factory UpdateCustomKeyStoreResponse.fromJson(Map<String, dynamic> _) {
    return UpdateCustomKeyStoreResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class VerifyResponse {
  /// The Amazon Resource Name (<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN">key
  /// ARN</a>) of the asymmetric KMS key that was used to verify the signature.
  final String? keyId;

  /// A Boolean value that indicates whether the signature was verified. A value
  /// of <code>True</code> indicates that the <code>Signature</code> was produced
  /// by signing the <code>Message</code> with the specified <code>KeyID</code>
  /// and <code>SigningAlgorithm.</code> If the signature is not verified, the
  /// <code>Verify</code> operation fails with a
  /// <code>KMSInvalidSignatureException</code> exception.
  final bool? signatureValid;

  /// The signing algorithm that was used to verify the signature.
  final SigningAlgorithmSpec? signingAlgorithm;

  VerifyResponse({
    this.keyId,
    this.signatureValid,
    this.signingAlgorithm,
  });

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResponse(
      keyId: json['KeyId'] as String?,
      signatureValid: json['SignatureValid'] as bool?,
      signingAlgorithm:
          (json['SigningAlgorithm'] as String?)?.toSigningAlgorithmSpec(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    final signatureValid = this.signatureValid;
    final signingAlgorithm = this.signingAlgorithm;
    return {
      if (keyId != null) 'KeyId': keyId,
      if (signatureValid != null) 'SignatureValid': signatureValid,
      if (signingAlgorithm != null)
        'SigningAlgorithm': signingAlgorithm.toValue(),
    };
  }
}

enum WrappingKeySpec {
  rsa_2048,
}

extension on WrappingKeySpec {
  String toValue() {
    switch (this) {
      case WrappingKeySpec.rsa_2048:
        return 'RSA_2048';
    }
  }
}

extension on String {
  WrappingKeySpec toWrappingKeySpec() {
    switch (this) {
      case 'RSA_2048':
        return WrappingKeySpec.rsa_2048;
    }
    throw Exception('$this is not known in enum WrappingKeySpec');
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class CloudHsmClusterInUseException extends _s.GenericAwsException {
  CloudHsmClusterInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmClusterInUseException',
            message: message);
}

class CloudHsmClusterInvalidConfigurationException
    extends _s.GenericAwsException {
  CloudHsmClusterInvalidConfigurationException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmClusterInvalidConfigurationException',
            message: message);
}

class CloudHsmClusterNotActiveException extends _s.GenericAwsException {
  CloudHsmClusterNotActiveException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmClusterNotActiveException',
            message: message);
}

class CloudHsmClusterNotFoundException extends _s.GenericAwsException {
  CloudHsmClusterNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmClusterNotFoundException',
            message: message);
}

class CloudHsmClusterNotRelatedException extends _s.GenericAwsException {
  CloudHsmClusterNotRelatedException({String? type, String? message})
      : super(
            type: type,
            code: 'CloudHsmClusterNotRelatedException',
            message: message);
}

class CustomKeyStoreHasCMKsException extends _s.GenericAwsException {
  CustomKeyStoreHasCMKsException({String? type, String? message})
      : super(
            type: type,
            code: 'CustomKeyStoreHasCMKsException',
            message: message);
}

class CustomKeyStoreInvalidStateException extends _s.GenericAwsException {
  CustomKeyStoreInvalidStateException({String? type, String? message})
      : super(
            type: type,
            code: 'CustomKeyStoreInvalidStateException',
            message: message);
}

class CustomKeyStoreNameInUseException extends _s.GenericAwsException {
  CustomKeyStoreNameInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'CustomKeyStoreNameInUseException',
            message: message);
}

class CustomKeyStoreNotFoundException extends _s.GenericAwsException {
  CustomKeyStoreNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'CustomKeyStoreNotFoundException',
            message: message);
}

class DependencyTimeoutException extends _s.GenericAwsException {
  DependencyTimeoutException({String? type, String? message})
      : super(type: type, code: 'DependencyTimeoutException', message: message);
}

class DisabledException extends _s.GenericAwsException {
  DisabledException({String? type, String? message})
      : super(type: type, code: 'DisabledException', message: message);
}

class ExpiredImportTokenException extends _s.GenericAwsException {
  ExpiredImportTokenException({String? type, String? message})
      : super(
            type: type, code: 'ExpiredImportTokenException', message: message);
}

class IncorrectKeyException extends _s.GenericAwsException {
  IncorrectKeyException({String? type, String? message})
      : super(type: type, code: 'IncorrectKeyException', message: message);
}

class IncorrectKeyMaterialException extends _s.GenericAwsException {
  IncorrectKeyMaterialException({String? type, String? message})
      : super(
            type: type,
            code: 'IncorrectKeyMaterialException',
            message: message);
}

class IncorrectTrustAnchorException extends _s.GenericAwsException {
  IncorrectTrustAnchorException({String? type, String? message})
      : super(
            type: type,
            code: 'IncorrectTrustAnchorException',
            message: message);
}

class InvalidAliasNameException extends _s.GenericAwsException {
  InvalidAliasNameException({String? type, String? message})
      : super(type: type, code: 'InvalidAliasNameException', message: message);
}

class InvalidArnException extends _s.GenericAwsException {
  InvalidArnException({String? type, String? message})
      : super(type: type, code: 'InvalidArnException', message: message);
}

class InvalidCiphertextException extends _s.GenericAwsException {
  InvalidCiphertextException({String? type, String? message})
      : super(type: type, code: 'InvalidCiphertextException', message: message);
}

class InvalidGrantIdException extends _s.GenericAwsException {
  InvalidGrantIdException({String? type, String? message})
      : super(type: type, code: 'InvalidGrantIdException', message: message);
}

class InvalidGrantTokenException extends _s.GenericAwsException {
  InvalidGrantTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidGrantTokenException', message: message);
}

class InvalidImportTokenException extends _s.GenericAwsException {
  InvalidImportTokenException({String? type, String? message})
      : super(
            type: type, code: 'InvalidImportTokenException', message: message);
}

class InvalidKeyUsageException extends _s.GenericAwsException {
  InvalidKeyUsageException({String? type, String? message})
      : super(type: type, code: 'InvalidKeyUsageException', message: message);
}

class InvalidMarkerException extends _s.GenericAwsException {
  InvalidMarkerException({String? type, String? message})
      : super(type: type, code: 'InvalidMarkerException', message: message);
}

class KMSInternalException extends _s.GenericAwsException {
  KMSInternalException({String? type, String? message})
      : super(type: type, code: 'KMSInternalException', message: message);
}

class KMSInvalidSignatureException extends _s.GenericAwsException {
  KMSInvalidSignatureException({String? type, String? message})
      : super(
            type: type, code: 'KMSInvalidSignatureException', message: message);
}

class KMSInvalidStateException extends _s.GenericAwsException {
  KMSInvalidStateException({String? type, String? message})
      : super(type: type, code: 'KMSInvalidStateException', message: message);
}

class KeyUnavailableException extends _s.GenericAwsException {
  KeyUnavailableException({String? type, String? message})
      : super(type: type, code: 'KeyUnavailableException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TagException extends _s.GenericAwsException {
  TagException({String? type, String? message})
      : super(type: type, code: 'TagException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
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
