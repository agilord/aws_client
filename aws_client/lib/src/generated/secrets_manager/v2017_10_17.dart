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

/// Amazon Web Services Secrets Manager provides a service to enable you to
/// store, manage, and retrieve, secrets.
class SecretsManager {
  final _s.JsonProtocol _protocol;
  SecretsManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'secretsmanager',
            signingName: 'secretsmanager',
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

  /// Retrieves the contents of the encrypted fields <code>SecretString</code>
  /// or <code>SecretBinary</code> for up to 20 secrets. To retrieve a single
  /// secret, call <a>GetSecretValue</a>.
  ///
  /// To choose which secrets to retrieve, you can specify a list of secrets by
  /// name or ARN, or you can use filters. If Secrets Manager encounters errors
  /// such as <code>AccessDeniedException</code> while attempting to retrieve
  /// any of the secrets, you can see the errors in <code>Errors</code> in the
  /// response.
  ///
  /// Secrets Manager generates CloudTrail <code>GetSecretValue</code> log
  /// entries for each secret you request when you call this action. Do not
  /// include sensitive information in request parameters because it might be
  /// logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:BatchGetSecretValue</code>, and you must have
  /// <code>secretsmanager:GetSecretValue</code> for each secret. If you use
  /// filters, you must also have <code>secretsmanager:ListSecrets</code>. If
  /// the secrets are encrypted using customer-managed keys instead of the
  /// Amazon Web Services managed key <code>aws/secretsmanager</code>, then you
  /// also need <code>kms:Decrypt</code> permissions for the keys. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [DecryptionFailure].
  /// May throw [InternalServiceError].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [filters] :
  /// The filters to choose which secrets to retrieve. You must include
  /// <code>Filters</code> or <code>SecretIdList</code>, but not both.
  ///
  /// Parameter [maxResults] :
  /// The number of results to include in the response.
  ///
  /// If there are more results available, in the response, Secrets Manager
  /// includes <code>NextToken</code>. To get the next results, call
  /// <code>BatchGetSecretValue</code> again with the value from
  /// <code>NextToken</code>. To use this parameter, you must also use the
  /// <code>Filters</code> parameter.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where the output should continue from, if a
  /// previous call did not show all results. To get the next results, call
  /// <code>BatchGetSecretValue</code> again with this value.
  ///
  /// Parameter [secretIdList] :
  /// The ARN or names of the secrets to retrieve. You must include
  /// <code>Filters</code> or <code>SecretIdList</code>, but not both.
  Future<BatchGetSecretValueResponse> batchGetSecretValue({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? secretIdList,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.BatchGetSecretValue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (secretIdList != null) 'SecretIdList': secretIdList,
      },
    );

    return BatchGetSecretValueResponse.fromJson(jsonResponse.body);
  }

  /// Turns off automatic rotation, and if a rotation is currently in progress,
  /// cancels the rotation.
  ///
  /// If you cancel a rotation in progress, it can leave the
  /// <code>VersionStage</code> labels in an unexpected state. You might need to
  /// remove the staging label <code>AWSPENDING</code> from the partially
  /// created version. You also need to determine whether to roll back to the
  /// previous version of the secret by moving the staging label
  /// <code>AWSCURRENT</code> to the version that has <code>AWSPENDING</code>.
  /// To determine which version has a specific staging label, call
  /// <a>ListSecretVersionIds</a>. Then use <a>UpdateSecretVersionStage</a> to
  /// change staging labels. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html">How
  /// rotation works</a>.
  ///
  /// To turn on automatic rotation again, call <a>RotateSecret</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:CancelRotateSecret</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  Future<CancelRotateSecretResponse> cancelRotateSecret({
    required String secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.CancelRotateSecret'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
      },
    );

    return CancelRotateSecretResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new secret. A <i>secret</i> can be a password, a set of
  /// credentials such as a user name and password, an OAuth token, or other
  /// secret information that you store in an encrypted form in Secrets Manager.
  /// The secret also includes the connection information to access a database
  /// or other service, which Secrets Manager doesn't encrypt. A secret in
  /// Secrets Manager consists of both the protected secret data and the
  /// important information needed to manage the secret.
  ///
  /// For secrets that use <i>managed rotation</i>, you need to create the
  /// secret through the managing service. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html">Secrets
  /// Manager secrets managed by other Amazon Web Services services</a>.
  ///
  /// For information about creating a secret in the console, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_create-basic-secret.html">Create
  /// a secret</a>.
  ///
  /// To create a secret, you can provide the secret value to be encrypted in
  /// either the <code>SecretString</code> parameter or the
  /// <code>SecretBinary</code> parameter, but not both. If you include
  /// <code>SecretString</code> or <code>SecretBinary</code> then Secrets
  /// Manager creates an initial secret version and automatically attaches the
  /// staging label <code>AWSCURRENT</code> to it.
  ///
  /// For database credentials you want to rotate, for Secrets Manager to be
  /// able to rotate the secret, you must make sure the JSON you store in the
  /// <code>SecretString</code> matches the <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_secret_json_structure.html">JSON
  /// structure of a database secret</a>.
  ///
  /// If you don't specify an KMS encryption key, Secrets Manager uses the
  /// Amazon Web Services managed key <code>aws/secretsmanager</code>. If this
  /// key doesn't already exist in your account, then Secrets Manager creates it
  /// for you automatically. All users and roles in the Amazon Web Services
  /// account automatically have access to use <code>aws/secretsmanager</code>.
  /// Creating <code>aws/secretsmanager</code> can result in a one-time
  /// significant delay in returning the result.
  ///
  /// If the secret is in a different Amazon Web Services account from the
  /// credentials calling the API, then you can't use
  /// <code>aws/secretsmanager</code> to encrypt the secret, and you must create
  /// and use a customer managed KMS key.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters except
  /// <code>SecretBinary</code> or <code>SecretString</code> because it might be
  /// logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:CreateSecret</code>. If
  /// you include tags in the secret, you also need
  /// <code>secretsmanager:TagResource</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// To encrypt the secret with a KMS key other than
  /// <code>aws/secretsmanager</code>, you need <code>kms:GenerateDataKey</code>
  /// and <code>kms:Decrypt</code> permission to the key.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [EncryptionFailure].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [InternalServiceError].
  /// May throw [PreconditionNotMetException].
  /// May throw [DecryptionFailure].
  ///
  /// Parameter [name] :
  /// The name of the new secret.
  ///
  /// The secret name can contain ASCII letters, numbers, and the following
  /// characters: /_+=.@-
  ///
  /// Do not end your secret name with a hyphen followed by six characters. If
  /// you do so, you risk confusion and unexpected results when searching for a
  /// secret by partial ARN. Secrets Manager automatically adds a hyphen and six
  /// random characters after the secret name at the end of the ARN.
  ///
  /// Parameter [addReplicaRegions] :
  /// A list of Regions and KMS keys to replicate secrets.
  ///
  /// Parameter [clientRequestToken] :
  /// If you include <code>SecretString</code> or <code>SecretBinary</code>,
  /// then Secrets Manager creates an initial version for the secret, and this
  /// parameter specifies the unique identifier for the new version.
  /// <note>
  /// If you use the Amazon Web Services CLI or one of the Amazon Web Services
  /// SDKs to call this operation, then you can leave this parameter empty. The
  /// CLI or SDK generates a random UUID for you and includes it as the value
  /// for this parameter in the request.
  /// </note>
  /// If you generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a <code>ClientRequestToken</code> and
  /// include it in the request.
  ///
  /// This value helps ensure idempotency. Secrets Manager uses this value to
  /// prevent the accidental creation of duplicate versions if there are
  /// failures and retries during a rotation. We recommend that you generate a
  /// <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value to ensure uniqueness of your versions within the specified secret.
  ///
  /// <ul>
  /// <li>
  /// If the <code>ClientRequestToken</code> value isn't already associated with
  /// a version of the secret then a new version of the secret is created.
  /// </li>
  /// <li>
  /// If a version with this value already exists and the version
  /// <code>SecretString</code> and <code>SecretBinary</code> values are the
  /// same as those in the request, then the request is ignored.
  /// </li>
  /// <li>
  /// If a version with this value already exists and that version's
  /// <code>SecretString</code> and <code>SecretBinary</code> values are
  /// different from those in the request, then the request fails because you
  /// cannot modify an existing version. Instead, use <a>PutSecretValue</a> to
  /// create a new version.
  /// </li>
  /// </ul>
  /// This value becomes the <code>VersionId</code> of the new version.
  ///
  /// Parameter [description] :
  /// The description of the secret.
  ///
  /// Parameter [forceOverwriteReplicaSecret] :
  /// Specifies whether to overwrite a secret with the same name in the
  /// destination Region. By default, secrets aren't overwritten.
  ///
  /// Parameter [kmsKeyId] :
  /// The ARN, key ID, or alias of the KMS key that Secrets Manager uses to
  /// encrypt the secret value in the secret. An alias is always prefixed by
  /// <code>alias/</code>, for example <code>alias/aws/secretsmanager</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/alias-about.html">About
  /// aliases</a>.
  ///
  /// To use a KMS key in a different account, use the key ARN or the alias ARN.
  ///
  /// If you don't specify this value, then Secrets Manager uses the key
  /// <code>aws/secretsmanager</code>. If that key doesn't yet exist, then
  /// Secrets Manager creates it for you automatically the first time it
  /// encrypts the secret value.
  ///
  /// If the secret is in a different Amazon Web Services account from the
  /// credentials calling the API, then you can't use
  /// <code>aws/secretsmanager</code> to encrypt the secret, and you must create
  /// and use a customer managed KMS key.
  ///
  /// Parameter [secretBinary] :
  /// The binary data to encrypt and store in the new version of the secret. We
  /// recommend that you store your binary data in a file and then pass the
  /// contents of the file as a parameter.
  ///
  /// Either <code>SecretString</code> or <code>SecretBinary</code> must have a
  /// value, but not both.
  ///
  /// This parameter is not available in the Secrets Manager console.
  ///
  /// Parameter [secretString] :
  /// The text data to encrypt and store in this new version of the secret. We
  /// recommend you use a JSON structure of key/value pairs for your secret
  /// value.
  ///
  /// Either <code>SecretString</code> or <code>SecretBinary</code> must have a
  /// value, but not both.
  ///
  /// If you create a secret by using the Secrets Manager console then Secrets
  /// Manager puts the protected secret text in only the
  /// <code>SecretString</code> parameter. The Secrets Manager console stores
  /// the information as a JSON structure of key/value pairs that a Lambda
  /// rotation function can parse.
  ///
  /// Parameter [tags] :
  /// A list of tags to attach to the secret. Each tag is a key and value pair
  /// of strings in a JSON text string, for example:
  ///
  /// <code>[{"Key":"CostCenter","Value":"12345"},{"Key":"environment","Value":"production"}]</code>
  ///
  /// Secrets Manager tag key names are case sensitive. A tag with the key "ABC"
  /// is a different tag from one with key "abc".
  ///
  /// If you check tags in permissions policies as part of your security
  /// strategy, then adding or removing a tag can change permissions. If the
  /// completion of this operation would result in you losing your permissions
  /// for this secret, then Secrets Manager blocks the operation and returns an
  /// <code>Access Denied</code> error. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html#tag-secrets-abac">Control
  /// access to secrets using tags</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html#auth-and-access_tags2">Limit
  /// access to identities with tags that match secrets' tags</a>.
  ///
  /// For information about how to format a JSON parameter for the various
  /// command line tool environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a>. If your command-line tool or SDK requires
  /// quotation marks around the parameter, you should use single quotes to
  /// avoid confusion with the double quotes required in the JSON text.
  ///
  /// For tag quotas and naming restrictions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/arg.html#taged-reference-quotas">Service
  /// quotas for Tagging</a> in the <i>Amazon Web Services General Reference
  /// guide</i>.
  Future<CreateSecretResponse> createSecret({
    required String name,
    List<ReplicaRegionType>? addReplicaRegions,
    String? clientRequestToken,
    String? description,
    bool? forceOverwriteReplicaSecret,
    String? kmsKeyId,
    Uint8List? secretBinary,
    String? secretString,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.CreateSecret'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        if (addReplicaRegions != null) 'AddReplicaRegions': addReplicaRegions,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (forceOverwriteReplicaSecret != null)
          'ForceOverwriteReplicaSecret': forceOverwriteReplicaSecret,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (secretBinary != null) 'SecretBinary': base64Encode(secretBinary),
        if (secretString != null) 'SecretString': secretString,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSecretResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the resource-based permission policy attached to the secret. To
  /// attach a policy to a secret, use <a>PutResourcePolicy</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:DeleteResourcePolicy</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to delete the attached resource-based policy
  /// for.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy({
    required String secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.DeleteResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
      },
    );

    return DeleteResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a secret and all of its versions. You can specify a recovery
  /// window during which you can restore the secret. The minimum recovery
  /// window is 7 days. The default recovery window is 30 days. Secrets Manager
  /// attaches a <code>DeletionDate</code> stamp to the secret that specifies
  /// the end of the recovery window. At the end of the recovery window, Secrets
  /// Manager deletes the secret permanently.
  ///
  /// You can't delete a primary secret that is replicated to other Regions. You
  /// must first delete the replicas using <a>RemoveRegionsFromReplication</a>,
  /// and then delete the primary secret. When you delete a replica, it is
  /// deleted immediately.
  ///
  /// You can't directly delete a version of a secret. Instead, you remove all
  /// staging labels from the version using <a>UpdateSecretVersionStage</a>.
  /// This marks the version as deprecated, and then Secrets Manager can
  /// automatically delete the version in the background.
  ///
  /// To determine whether an application still uses a secret, you can create an
  /// Amazon CloudWatch alarm to alert you to any attempts to access a secret
  /// during the recovery window. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring_cloudwatch_deleted-secrets.html">
  /// Monitor secrets scheduled for deletion</a>.
  ///
  /// Secrets Manager performs the permanent secret deletion at the end of the
  /// waiting period as a background task with low priority. There is no
  /// guarantee of a specific time after the recovery window for the permanent
  /// delete to occur.
  ///
  /// At any time before recovery window ends, you can use <a>RestoreSecret</a>
  /// to remove the <code>DeletionDate</code> and cancel the deletion of the
  /// secret.
  ///
  /// When a secret is scheduled for deletion, you cannot retrieve the secret
  /// value. You must first cancel the deletion with <a>RestoreSecret</a> and
  /// then you can retrieve the secret.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:DeleteSecret</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to delete.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [forceDeleteWithoutRecovery] :
  /// Specifies whether to delete the secret without any recovery window. You
  /// can't use both this parameter and <code>RecoveryWindowInDays</code> in the
  /// same call. If you don't use either, then by default Secrets Manager uses a
  /// 30 day recovery window.
  ///
  /// Secrets Manager performs the actual deletion with an asynchronous
  /// background process, so there might be a short delay before the secret is
  /// permanently deleted. If you delete a secret and then immediately create a
  /// secret with the same name, use appropriate back off and retry logic.
  ///
  /// If you forcibly delete an already deleted or nonexistent secret, the
  /// operation does not return <code>ResourceNotFoundException</code>.
  /// <important>
  /// Use this parameter with caution. This parameter causes the operation to
  /// skip the normal recovery window before the permanent deletion that Secrets
  /// Manager would normally impose with the <code>RecoveryWindowInDays</code>
  /// parameter. If you delete a secret with the
  /// <code>ForceDeleteWithoutRecovery</code> parameter, then you have no
  /// opportunity to recover the secret. You lose the secret permanently.
  /// </important>
  ///
  /// Parameter [recoveryWindowInDays] :
  /// The number of days from 7 to 30 that Secrets Manager waits before
  /// permanently deleting the secret. You can't use both this parameter and
  /// <code>ForceDeleteWithoutRecovery</code> in the same call. If you don't use
  /// either, then by default Secrets Manager uses a 30 day recovery window.
  Future<DeleteSecretResponse> deleteSecret({
    required String secretId,
    bool? forceDeleteWithoutRecovery,
    int? recoveryWindowInDays,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.DeleteSecret'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        if (forceDeleteWithoutRecovery != null)
          'ForceDeleteWithoutRecovery': forceDeleteWithoutRecovery,
        if (recoveryWindowInDays != null)
          'RecoveryWindowInDays': recoveryWindowInDays,
      },
    );

    return DeleteSecretResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details of a secret. It does not include the encrypted
  /// secret value. Secrets Manager only returns fields that have a value in the
  /// response.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:DescribeSecret</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  Future<DescribeSecretResponse> describeSecret({
    required String secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.DescribeSecret'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
      },
    );

    return DescribeSecretResponse.fromJson(jsonResponse.body);
  }

  /// Generates a random password. We recommend that you specify the maximum
  /// length and include every character type that the system you are generating
  /// a password for can support. By default, Secrets Manager uses uppercase and
  /// lowercase letters, numbers, and the following characters in passwords:
  /// <code>!\"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~</code>
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:GetRandomPassword</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [excludeCharacters] :
  /// A string of the characters that you don't want in the password.
  ///
  /// Parameter [excludeLowercase] :
  /// Specifies whether to exclude lowercase letters from the password. If you
  /// don't include this switch, the password can contain lowercase letters.
  ///
  /// Parameter [excludeNumbers] :
  /// Specifies whether to exclude numbers from the password. If you don't
  /// include this switch, the password can contain numbers.
  ///
  /// Parameter [excludePunctuation] :
  /// Specifies whether to exclude the following punctuation characters from the
  /// password: <code>! " # $ % &amp; ' ( ) * + , - . / : ; &lt; = &gt; ? @ [ \
  /// ] ^ _ ` { | } ~</code>. If you don't include this switch, the password can
  /// contain punctuation.
  ///
  /// Parameter [excludeUppercase] :
  /// Specifies whether to exclude uppercase letters from the password. If you
  /// don't include this switch, the password can contain uppercase letters.
  ///
  /// Parameter [includeSpace] :
  /// Specifies whether to include the space character. If you include this
  /// switch, the password can contain space characters.
  ///
  /// Parameter [passwordLength] :
  /// The length of the password. If you don't include this parameter, the
  /// default length is 32 characters.
  ///
  /// Parameter [requireEachIncludedType] :
  /// Specifies whether to include at least one upper and lowercase letter, one
  /// number, and one punctuation. If you don't include this switch, the
  /// password contains at least one of every character type.
  Future<GetRandomPasswordResponse> getRandomPassword({
    String? excludeCharacters,
    bool? excludeLowercase,
    bool? excludeNumbers,
    bool? excludePunctuation,
    bool? excludeUppercase,
    bool? includeSpace,
    int? passwordLength,
    bool? requireEachIncludedType,
  }) async {
    _s.validateNumRange(
      'passwordLength',
      passwordLength,
      1,
      4096,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.GetRandomPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (excludeCharacters != null) 'ExcludeCharacters': excludeCharacters,
        if (excludeLowercase != null) 'ExcludeLowercase': excludeLowercase,
        if (excludeNumbers != null) 'ExcludeNumbers': excludeNumbers,
        if (excludePunctuation != null)
          'ExcludePunctuation': excludePunctuation,
        if (excludeUppercase != null) 'ExcludeUppercase': excludeUppercase,
        if (includeSpace != null) 'IncludeSpace': includeSpace,
        if (passwordLength != null) 'PasswordLength': passwordLength,
        if (requireEachIncludedType != null)
          'RequireEachIncludedType': requireEachIncludedType,
      },
    );

    return GetRandomPasswordResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the JSON text of the resource-based policy document attached to
  /// the secret. For more information about permissions policies attached to a
  /// secret, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-policies.html">Permissions
  /// policies attached to a secret</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:GetResourcePolicy</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to retrieve the attached resource-based
  /// policy for.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the contents of the encrypted fields <code>SecretString</code>
  /// or <code>SecretBinary</code> from the specified version of a secret,
  /// whichever contains content.
  ///
  /// To retrieve the values for a group of secrets, call
  /// <a>BatchGetSecretValue</a>.
  ///
  /// We recommend that you cache your secret values by using client-side
  /// caching. Caching secrets improves speed and reduces your costs. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets.html">Cache
  /// secrets for your applications</a>.
  ///
  /// To retrieve the previous version of a secret, use
  /// <code>VersionStage</code> and specify AWSPREVIOUS. To revert to the
  /// previous version of a secret, call <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/secretsmanager/update-secret-version-stage.html">UpdateSecretVersionStage</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:GetSecretValue</code>.
  /// If the secret is encrypted using a customer-managed key instead of the
  /// Amazon Web Services managed key <code>aws/secretsmanager</code>, then you
  /// also need <code>kms:Decrypt</code> permissions for that key. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [DecryptionFailure].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to retrieve.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [versionId] :
  /// The unique identifier of the version of the secret to retrieve. If you
  /// include both this parameter and <code>VersionStage</code>, the two
  /// parameters must refer to the same secret version. If you don't specify
  /// either a <code>VersionStage</code> or <code>VersionId</code>, then Secrets
  /// Manager returns the <code>AWSCURRENT</code> version.
  ///
  /// This value is typically a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value with 32 hexadecimal digits.
  ///
  /// Parameter [versionStage] :
  /// The staging label of the version of the secret to retrieve.
  ///
  /// Secrets Manager uses staging labels to keep track of different versions
  /// during the rotation process. If you include both this parameter and
  /// <code>VersionId</code>, the two parameters must refer to the same secret
  /// version. If you don't specify either a <code>VersionStage</code> or
  /// <code>VersionId</code>, Secrets Manager returns the
  /// <code>AWSCURRENT</code> version.
  Future<GetSecretValueResponse> getSecretValue({
    required String secretId,
    String? versionId,
    String? versionStage,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.GetSecretValue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        if (versionId != null) 'VersionId': versionId,
        if (versionStage != null) 'VersionStage': versionStage,
      },
    );

    return GetSecretValueResponse.fromJson(jsonResponse.body);
  }

  /// Lists the versions of a secret. Secrets Manager uses staging labels to
  /// indicate the different versions of a secret. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version">
  /// Secrets Manager concepts: Versions</a>.
  ///
  /// To list the secrets in the account, use <a>ListSecrets</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:ListSecretVersionIds</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret whose versions you want to list.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [includeDeprecated] :
  /// Specifies whether to include versions of secrets that don't have any
  /// staging labels attached to them. Versions without staging labels are
  /// considered deprecated and are subject to deletion by Secrets Manager. By
  /// default, versions without staging labels aren't included.
  ///
  /// Parameter [maxResults] :
  /// The number of results to include in the response.
  ///
  /// If there are more results available, in the response, Secrets Manager
  /// includes <code>NextToken</code>. To get the next results, call
  /// <code>ListSecretVersionIds</code> again with the value from
  /// <code>NextToken</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where the output should continue from, if a
  /// previous call did not show all results. To get the next results, call
  /// <code>ListSecretVersionIds</code> again with this value.
  Future<ListSecretVersionIdsResponse> listSecretVersionIds({
    required String secretId,
    bool? includeDeprecated,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.ListSecretVersionIds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        if (includeDeprecated != null) 'IncludeDeprecated': includeDeprecated,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSecretVersionIdsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the secrets that are stored by Secrets Manager in the Amazon Web
  /// Services account, not including secrets that are marked for deletion. To
  /// see secrets marked for deletion, use the Secrets Manager console.
  ///
  /// All Secrets Manager operations are eventually consistent. ListSecrets
  /// might not reflect changes from the last five minutes. You can get more
  /// recent information for a specific secret by calling <a>DescribeSecret</a>.
  ///
  /// To list the versions of a secret, use <a>ListSecretVersionIds</a>.
  ///
  /// To retrieve the values for the secrets, call <a>BatchGetSecretValue</a> or
  /// <a>GetSecretValue</a>.
  ///
  /// For information about finding secrets in the console, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_search-secret.html">Find
  /// secrets in Secrets Manager</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:ListSecrets</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [filters] :
  /// The filters to apply to the list of secrets.
  ///
  /// Parameter [includePlannedDeletion] :
  /// Specifies whether to include secrets scheduled for deletion. By default,
  /// secrets scheduled for deletion aren't included.
  ///
  /// Parameter [maxResults] :
  /// The number of results to include in the response.
  ///
  /// If there are more results available, in the response, Secrets Manager
  /// includes <code>NextToken</code>. To get the next results, call
  /// <code>ListSecrets</code> again with the value from <code>NextToken</code>.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates where the output should continue from, if a
  /// previous call did not show all results. To get the next results, call
  /// <code>ListSecrets</code> again with this value.
  ///
  /// Parameter [sortOrder] :
  /// Secrets are listed by <code>CreatedDate</code>.
  Future<ListSecretsResponse> listSecrets({
    List<Filter>? filters,
    bool? includePlannedDeletion,
    int? maxResults,
    String? nextToken,
    SortOrderType? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.ListSecrets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (includePlannedDeletion != null)
          'IncludePlannedDeletion': includePlannedDeletion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return ListSecretsResponse.fromJson(jsonResponse.body);
  }

  /// Attaches a resource-based permission policy to a secret. A resource-based
  /// policy is optional. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control for Secrets Manager</a>
  ///
  /// For information about attaching a policy in the console, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html">Attach
  /// a permissions policy to a secret</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:PutResourcePolicy</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PublicPolicyException].
  ///
  /// Parameter [resourcePolicy] :
  /// A JSON-formatted string for an Amazon Web Services resource-based policy.
  /// For example policies, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html">Permissions
  /// policy examples</a>.
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to attach the resource-based policy.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [blockPublicPolicy] :
  /// Specifies whether to block resource-based policies that allow broad access
  /// to the secret, for example those that use a wildcard for the principal. By
  /// default, public policies aren't blocked.
  /// <important>
  /// Resource policy validation and the BlockPublicPolicy parameter help
  /// protect your resources by preventing public access from being granted
  /// through the resource policies that are directly attached to your secrets.
  /// In addition to using these features, carefully inspect the following
  /// policies to confirm that they do not grant public access:
  ///
  /// <ul>
  /// <li>
  /// Identity-based policies attached to associated Amazon Web Services
  /// principals (for example, IAM roles)
  /// </li>
  /// <li>
  /// Resource-based policies attached to associated Amazon Web Services
  /// resources (for example, Key Management Service (KMS) keys)
  /// </li>
  /// </ul>
  /// To review permissions to your secrets, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/determine-acccess_examine-iam-policies.html">Determine
  /// who has permissions to your secrets</a>.
  /// </important>
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String resourcePolicy,
    required String secretId,
    bool? blockPublicPolicy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourcePolicy': resourcePolicy,
        'SecretId': secretId,
        if (blockPublicPolicy != null) 'BlockPublicPolicy': blockPublicPolicy,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new version with a new encrypted secret value and attaches it to
  /// the secret. The version can contain a new <code>SecretString</code> value
  /// or a new <code>SecretBinary</code> value.
  ///
  /// We recommend you avoid calling <code>PutSecretValue</code> at a sustained
  /// rate of more than once every 10 minutes. When you update the secret value,
  /// Secrets Manager creates a new version of the secret. Secrets Manager
  /// removes outdated versions when there are more than 100, but it does not
  /// remove versions created less than 24 hours ago. If you call
  /// <code>PutSecretValue</code> more than once every 10 minutes, you create
  /// more versions than Secrets Manager removes, and you will reach the quota
  /// for secret versions.
  ///
  /// You can specify the staging labels to attach to the new version in
  /// <code>VersionStages</code>. If you don't include
  /// <code>VersionStages</code>, then Secrets Manager automatically moves the
  /// staging label <code>AWSCURRENT</code> to this version. If this operation
  /// creates the first version for the secret, then Secrets Manager
  /// automatically attaches the staging label <code>AWSCURRENT</code> to it. If
  /// this operation moves the staging label <code>AWSCURRENT</code> from
  /// another version to this version, then Secrets Manager also automatically
  /// moves the staging label <code>AWSPREVIOUS</code> to the version that
  /// <code>AWSCURRENT</code> was removed from.
  ///
  /// This operation is idempotent. If you call this operation with a
  /// <code>ClientRequestToken</code> that matches an existing version's
  /// VersionId, and you specify the same secret data, the operation succeeds
  /// but does nothing. However, if the secret data is different, then the
  /// operation fails because you can't modify an existing version; you can only
  /// create new ones.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters except
  /// <code>SecretBinary</code> or <code>SecretString</code> because it might be
  /// logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:PutSecretValue</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [EncryptionFailure].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [DecryptionFailure].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to add a new version to.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// If the secret doesn't already exist, use <code>CreateSecret</code>
  /// instead.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the new version of the secret.
  /// <note>
  /// If you use the Amazon Web Services CLI or one of the Amazon Web Services
  /// SDKs to call this operation, then you can leave this parameter empty. The
  /// CLI or SDK generates a random UUID for you and includes it as the value
  /// for this parameter in the request.
  /// </note>
  /// If you generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a <code>ClientRequestToken</code> and
  /// include it in the request.
  ///
  /// This value helps ensure idempotency. Secrets Manager uses this value to
  /// prevent the accidental creation of duplicate versions if there are
  /// failures and retries during a rotation. We recommend that you generate a
  /// <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value to ensure uniqueness of your versions within the specified secret.
  ///
  /// <ul>
  /// <li>
  /// If the <code>ClientRequestToken</code> value isn't already associated with
  /// a version of the secret then a new version of the secret is created.
  /// </li>
  /// <li>
  /// If a version with this value already exists and that version's
  /// <code>SecretString</code> or <code>SecretBinary</code> values are the same
  /// as those in the request then the request is ignored. The operation is
  /// idempotent.
  /// </li>
  /// <li>
  /// If a version with this value already exists and the version of the
  /// <code>SecretString</code> and <code>SecretBinary</code> values are
  /// different from those in the request, then the request fails because you
  /// can't modify a secret version. You can only create new versions to store
  /// new secret values.
  /// </li>
  /// </ul>
  /// This value becomes the <code>VersionId</code> of the new version.
  ///
  /// Parameter [secretBinary] :
  /// The binary data to encrypt and store in the new version of the secret. To
  /// use this parameter in the command-line tools, we recommend that you store
  /// your binary data in a file and then pass the contents of the file as a
  /// parameter.
  ///
  /// You must include <code>SecretBinary</code> or <code>SecretString</code>,
  /// but not both.
  ///
  /// You can't access this value from the Secrets Manager console.
  ///
  /// Parameter [secretString] :
  /// The text to encrypt and store in the new version of the secret.
  ///
  /// You must include <code>SecretBinary</code> or <code>SecretString</code>,
  /// but not both.
  ///
  /// We recommend you create the secret string as JSON key/value pairs, as
  /// shown in the example.
  ///
  /// Parameter [versionStages] :
  /// A list of staging labels to attach to this version of the secret. Secrets
  /// Manager uses staging labels to track versions of a secret through the
  /// rotation process.
  ///
  /// If you specify a staging label that's already associated with a different
  /// version of the same secret, then Secrets Manager removes the label from
  /// the other version and attaches it to this version. If you specify
  /// <code>AWSCURRENT</code>, and it is already attached to another version,
  /// then Secrets Manager also moves the staging label <code>AWSPREVIOUS</code>
  /// to the version that <code>AWSCURRENT</code> was removed from.
  ///
  /// If you don't include <code>VersionStages</code>, then Secrets Manager
  /// automatically moves the staging label <code>AWSCURRENT</code> to this
  /// version.
  Future<PutSecretValueResponse> putSecretValue({
    required String secretId,
    String? clientRequestToken,
    Uint8List? secretBinary,
    String? secretString,
    List<String>? versionStages,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.PutSecretValue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (secretBinary != null) 'SecretBinary': base64Encode(secretBinary),
        if (secretString != null) 'SecretString': secretString,
        if (versionStages != null) 'VersionStages': versionStages,
      },
    );

    return PutSecretValueResponse.fromJson(jsonResponse.body);
  }

  /// For a secret that is replicated to other Regions, deletes the secret
  /// replicas from the Regions you specify.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:RemoveRegionsFromReplication</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [removeReplicaRegions] :
  /// The Regions of the replicas to remove.
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret.
  Future<RemoveRegionsFromReplicationResponse> removeRegionsFromReplication({
    required List<String> removeReplicaRegions,
    required String secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.RemoveRegionsFromReplication'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RemoveReplicaRegions': removeReplicaRegions,
        'SecretId': secretId,
      },
    );

    return RemoveRegionsFromReplicationResponse.fromJson(jsonResponse.body);
  }

  /// Replicates the secret to a new Regions. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/create-manage-multi-region-secrets.html">Multi-Region
  /// secrets</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:ReplicateSecretToRegions</code>. If the primary
  /// secret is encrypted with a KMS key other than
  /// <code>aws/secretsmanager</code>, you also need <code>kms:Decrypt</code>
  /// permission to the key. To encrypt the replicated secret with a KMS key
  /// other than <code>aws/secretsmanager</code>, you need
  /// <code>kms:GenerateDataKey</code> and <code>kms:Encrypt</code> to the key.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [addReplicaRegions] :
  /// A list of Regions in which to replicate the secret.
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to replicate.
  ///
  /// Parameter [forceOverwriteReplicaSecret] :
  /// Specifies whether to overwrite a secret with the same name in the
  /// destination Region. By default, secrets aren't overwritten.
  Future<ReplicateSecretToRegionsResponse> replicateSecretToRegions({
    required List<ReplicaRegionType> addReplicaRegions,
    required String secretId,
    bool? forceOverwriteReplicaSecret,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.ReplicateSecretToRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddReplicaRegions': addReplicaRegions,
        'SecretId': secretId,
        if (forceOverwriteReplicaSecret != null)
          'ForceOverwriteReplicaSecret': forceOverwriteReplicaSecret,
      },
    );

    return ReplicateSecretToRegionsResponse.fromJson(jsonResponse.body);
  }

  /// Cancels the scheduled deletion of a secret by removing the
  /// <code>DeletedDate</code> time stamp. You can access a secret again after
  /// it has been restored.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:RestoreSecret</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to restore.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  Future<RestoreSecretResponse> restoreSecret({
    required String secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.RestoreSecret'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
      },
    );

    return RestoreSecretResponse.fromJson(jsonResponse.body);
  }

  /// Configures and starts the asynchronous process of rotating the secret. For
  /// information about rotation, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html">Rotate
  /// secrets</a> in the <i>Secrets Manager User Guide</i>. If you include the
  /// configuration parameters, the operation sets the values for the secret and
  /// then immediately starts a rotation. If you don't include the configuration
  /// parameters, the operation starts a rotation with the values already stored
  /// in the secret.
  ///
  /// When rotation is successful, the <code>AWSPENDING</code> staging label
  /// might be attached to the same version as the <code>AWSCURRENT</code>
  /// version, or it might not be attached to any version. If the
  /// <code>AWSPENDING</code> staging label is present but not attached to the
  /// same version as <code>AWSCURRENT</code>, then any later invocation of
  /// <code>RotateSecret</code> assumes that a previous rotation request is
  /// still in progress and returns an error. When rotation is unsuccessful, the
  /// <code>AWSPENDING</code> staging label might be attached to an empty secret
  /// version. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot_rotation.html">Troubleshoot
  /// rotation</a> in the <i>Secrets Manager User Guide</i>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:RotateSecret</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>. You also need
  /// <code>lambda:InvokeFunction</code> permissions on the rotation function.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets-required-permissions-function.html">
  /// Permissions for rotation</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret to rotate.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the new version of the secret. You only need to
  /// specify this value if you implement your own retry logic and you want to
  /// ensure that Secrets Manager doesn't attempt to create a secret version
  /// twice.
  /// <note>
  /// If you use the Amazon Web Services CLI or one of the Amazon Web Services
  /// SDKs to call this operation, then you can leave this parameter empty. The
  /// CLI or SDK generates a random UUID for you and includes it as the value
  /// for this parameter in the request.
  /// </note>
  /// If you generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a <code>ClientRequestToken</code> and
  /// include it in the request.
  ///
  /// This value helps ensure idempotency. Secrets Manager uses this value to
  /// prevent the accidental creation of duplicate versions if there are
  /// failures and retries during a rotation. We recommend that you generate a
  /// <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value to ensure uniqueness of your versions within the specified secret.
  ///
  /// Parameter [rotateImmediately] :
  /// Specifies whether to rotate the secret immediately or wait until the next
  /// scheduled rotation window. The rotation schedule is defined in
  /// <a>RotateSecretRequest$RotationRules</a>.
  ///
  /// For secrets that use a Lambda rotation function to rotate, if you don't
  /// immediately rotate the secret, Secrets Manager tests the rotation
  /// configuration by running the <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html">
  /// <code>testSecret</code> step</a> of the Lambda rotation function. The test
  /// creates an <code>AWSPENDING</code> version of the secret and then removes
  /// it.
  ///
  /// By default, Secrets Manager rotates the secret immediately.
  ///
  /// Parameter [rotationLambdaARN] :
  /// For secrets that use a Lambda rotation function to rotate, the ARN of the
  /// Lambda rotation function.
  ///
  /// For secrets that use <i>managed rotation</i>, omit this field. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_managed.html">Managed
  /// rotation</a> in the <i>Secrets Manager User Guide</i>.
  ///
  /// Parameter [rotationRules] :
  /// A structure that defines the rotation configuration for this secret.
  Future<RotateSecretResponse> rotateSecret({
    required String secretId,
    String? clientRequestToken,
    bool? rotateImmediately,
    String? rotationLambdaARN,
    RotationRulesType? rotationRules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.RotateSecret'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (rotateImmediately != null) 'RotateImmediately': rotateImmediately,
        if (rotationLambdaARN != null) 'RotationLambdaARN': rotationLambdaARN,
        if (rotationRules != null) 'RotationRules': rotationRules,
      },
    );

    return RotateSecretResponse.fromJson(jsonResponse.body);
  }

  /// Removes the link between the replica secret and the primary secret and
  /// promotes the replica to a primary secret in the replica Region.
  ///
  /// You must call this operation from the Region in which you want to promote
  /// the replica to a primary secret.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:StopReplicationToReplica</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The ARN of the primary secret.
  Future<StopReplicationToReplicaResponse> stopReplicationToReplica({
    required String secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.StopReplicationToReplica'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
      },
    );

    return StopReplicationToReplicaResponse.fromJson(jsonResponse.body);
  }

  /// Attaches tags to a secret. Tags consist of a key name and a value. Tags
  /// are part of the secret's metadata. They are not associated with specific
  /// versions of the secret. This operation appends tags to the existing list
  /// of tags.
  ///
  /// For tag quotas and naming restrictions, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/arg.html#taged-reference-quotas">Service
  /// quotas for Tagging</a> in the <i>Amazon Web Services General Reference
  /// guide</i>.
  /// <important>
  /// If you use tags as part of your security strategy, then adding or removing
  /// a tag can change permissions. If successfully completing this operation
  /// would result in you losing your permissions for this secret, then the
  /// operation is blocked and returns an Access Denied error.
  /// </important>
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:TagResource</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The identifier for the secret to attach tags to. You can specify either
  /// the Amazon Resource Name (ARN) or the friendly name of the secret.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [tags] :
  /// The tags to attach to the secret as a JSON text string argument. Each
  /// element in the list consists of a <code>Key</code> and a
  /// <code>Value</code>.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html">Specifying
  /// parameter values for the Amazon Web Services CLI</a> in the Amazon Web
  /// Services CLI User Guide.
  Future<void> tagResource({
    required String secretId,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        'Tags': tags,
      },
    );
  }

  /// Removes specific tags from a secret.
  ///
  /// This operation is idempotent. If a requested tag is not attached to the
  /// secret, no error is returned and the secret metadata is unchanged.
  /// <important>
  /// If you use tags as part of your security strategy, then removing a tag can
  /// change permissions. If successfully completing this operation would result
  /// in you losing your permissions for this secret, then the operation is
  /// blocked and returns an Access Denied error.
  /// </important>
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:UntagResource</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag key names to remove from the secret. You don't specify the
  /// value. Both the key and its associated value are removed.
  ///
  /// This parameter requires a JSON text string argument.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html">Specifying
  /// parameter values for the Amazon Web Services CLI</a> in the Amazon Web
  /// Services CLI User Guide.
  Future<void> untagResource({
    required String secretId,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Modifies the details of a secret, including metadata and the secret value.
  /// To change the secret value, you can also use <a>PutSecretValue</a>.
  ///
  /// To change the rotation configuration of a secret, use <a>RotateSecret</a>
  /// instead.
  ///
  /// To change a secret so that it is managed by another service, you need to
  /// recreate the secret in that service. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html">Secrets
  /// Manager secrets managed by other Amazon Web Services services</a>.
  ///
  /// We recommend you avoid calling <code>UpdateSecret</code> at a sustained
  /// rate of more than once every 10 minutes. When you call
  /// <code>UpdateSecret</code> to update the secret value, Secrets Manager
  /// creates a new version of the secret. Secrets Manager removes outdated
  /// versions when there are more than 100, but it does not remove versions
  /// created less than 24 hours ago. If you update the secret value more than
  /// once every 10 minutes, you create more versions than Secrets Manager
  /// removes, and you will reach the quota for secret versions.
  ///
  /// If you include <code>SecretString</code> or <code>SecretBinary</code> to
  /// create a new secret version, Secrets Manager automatically moves the
  /// staging label <code>AWSCURRENT</code> to the new version. Then it attaches
  /// the label <code>AWSPREVIOUS</code> to the version that
  /// <code>AWSCURRENT</code> was removed from.
  ///
  /// If you call this operation with a <code>ClientRequestToken</code> that
  /// matches an existing version's <code>VersionId</code>, the operation
  /// results in an error. You can't modify an existing version, you can only
  /// create a new version. To remove a version, remove all staging labels from
  /// it. See <a>UpdateSecretVersionStage</a>.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters except
  /// <code>SecretBinary</code> or <code>SecretString</code> because it might be
  /// logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b> <code>secretsmanager:UpdateSecret</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>. If you use a customer managed
  /// key, you must also have <code>kms:GenerateDataKey</code>,
  /// <code>kms:Encrypt</code>, and <code>kms:Decrypt</code> permissions on the
  /// key. If you change the KMS key and you don't have <code>kms:Encrypt</code>
  /// permission to the new key, Secrets Manager does not re-ecrypt existing
  /// secret versions with the new key. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/security-encryption.html">
  /// Secret encryption and decryption</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [EncryptionFailure].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [InternalServiceError].
  /// May throw [PreconditionNotMetException].
  /// May throw [DecryptionFailure].
  ///
  /// Parameter [secretId] :
  /// The ARN or name of the secret.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [clientRequestToken] :
  /// If you include <code>SecretString</code> or <code>SecretBinary</code>,
  /// then Secrets Manager creates a new version for the secret, and this
  /// parameter specifies the unique identifier for the new version.
  /// <note>
  /// If you use the Amazon Web Services CLI or one of the Amazon Web Services
  /// SDKs to call this operation, then you can leave this parameter empty. The
  /// CLI or SDK generates a random UUID for you and includes it as the value
  /// for this parameter in the request.
  /// </note>
  /// If you generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a <code>ClientRequestToken</code> and
  /// include it in the request.
  ///
  /// This value helps ensure idempotency. Secrets Manager uses this value to
  /// prevent the accidental creation of duplicate versions if there are
  /// failures and retries during a rotation. We recommend that you generate a
  /// <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value to ensure uniqueness of your versions within the specified secret.
  ///
  /// Parameter [description] :
  /// The description of the secret.
  ///
  /// Parameter [kmsKeyId] :
  /// The ARN, key ID, or alias of the KMS key that Secrets Manager uses to
  /// encrypt new secret versions as well as any existing versions with the
  /// staging labels <code>AWSCURRENT</code>, <code>AWSPENDING</code>, or
  /// <code>AWSPREVIOUS</code>. If you don't have <code>kms:Encrypt</code>
  /// permission to the new key, Secrets Manager does not re-ecrypt existing
  /// secret versions with the new key. For more information about versions and
  /// staging labels, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version">Concepts:
  /// Version</a>.
  ///
  /// A key alias is always prefixed by <code>alias/</code>, for example
  /// <code>alias/aws/secretsmanager</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/alias-about.html">About
  /// aliases</a>.
  ///
  /// If you set this to an empty string, Secrets Manager uses the Amazon Web
  /// Services managed key <code>aws/secretsmanager</code>. If this key doesn't
  /// already exist in your account, then Secrets Manager creates it for you
  /// automatically. All users and roles in the Amazon Web Services account
  /// automatically have access to use <code>aws/secretsmanager</code>. Creating
  /// <code>aws/secretsmanager</code> can result in a one-time significant delay
  /// in returning the result.
  /// <important>
  /// You can only use the Amazon Web Services managed key
  /// <code>aws/secretsmanager</code> if you call this operation using
  /// credentials from the same Amazon Web Services account that owns the
  /// secret. If the secret is in a different account, then you must use a
  /// customer managed key and provide the ARN of that KMS key in this field.
  /// The user making the call must have permissions to both the secret and the
  /// KMS key in their respective accounts.
  /// </important>
  ///
  /// Parameter [secretBinary] :
  /// The binary data to encrypt and store in the new version of the secret. We
  /// recommend that you store your binary data in a file and then pass the
  /// contents of the file as a parameter.
  ///
  /// Either <code>SecretBinary</code> or <code>SecretString</code> must have a
  /// value, but not both.
  ///
  /// You can't access this parameter in the Secrets Manager console.
  ///
  /// Parameter [secretString] :
  /// The text data to encrypt and store in the new version of the secret. We
  /// recommend you use a JSON structure of key/value pairs for your secret
  /// value.
  ///
  /// Either <code>SecretBinary</code> or <code>SecretString</code> must have a
  /// value, but not both.
  Future<UpdateSecretResponse> updateSecret({
    required String secretId,
    String? clientRequestToken,
    String? description,
    String? kmsKeyId,
    Uint8List? secretBinary,
    String? secretString,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.UpdateSecret'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (secretBinary != null) 'SecretBinary': base64Encode(secretBinary),
        if (secretString != null) 'SecretString': secretString,
      },
    );

    return UpdateSecretResponse.fromJson(jsonResponse.body);
  }

  /// Modifies the staging labels attached to a version of a secret. Secrets
  /// Manager uses staging labels to track a version as it progresses through
  /// the secret rotation process. Each staging label can be attached to only
  /// one version at a time. To add a staging label to a version when it is
  /// already attached to another version, Secrets Manager first removes it from
  /// the other version first and then attaches it to this one. For more
  /// information about versions and staging labels, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version">Concepts:
  /// Version</a>.
  ///
  /// The staging labels that you specify in the <code>VersionStage</code>
  /// parameter are added to the existing list of staging labels for the
  /// version.
  ///
  /// You can move the <code>AWSCURRENT</code> staging label to this version by
  /// including it in this call.
  /// <note>
  /// Whenever you move <code>AWSCURRENT</code>, Secrets Manager automatically
  /// moves the label <code>AWSPREVIOUS</code> to the version that
  /// <code>AWSCURRENT</code> was removed from.
  /// </note>
  /// If this action results in the last label being removed from a version,
  /// then the version is considered to be 'deprecated' and can be deleted by
  /// Secrets Manager.
  ///
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:UpdateSecretVersionStage</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The ARN or the name of the secret with the version and staging labelsto
  /// modify.
  ///
  /// For an ARN, we recommend that you specify a complete ARN rather than a
  /// partial ARN. See <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen">Finding
  /// a secret from a partial ARN</a>.
  ///
  /// Parameter [versionStage] :
  /// The staging label to add to this version.
  ///
  /// Parameter [moveToVersionId] :
  /// The ID of the version to add the staging label to. To remove a label from
  /// a version, then do not specify this parameter.
  ///
  /// If the staging label is already attached to a different version of the
  /// secret, then you must also specify the <code>RemoveFromVersionId</code>
  /// parameter.
  ///
  /// Parameter [removeFromVersionId] :
  /// The ID of the version that the staging label is to be removed from. If the
  /// staging label you are trying to attach to one version is already attached
  /// to a different version, then you must include this parameter and specify
  /// the version that the label is to be removed from. If the label is attached
  /// and you either do not specify this parameter, or the version ID does not
  /// match, then the operation fails.
  Future<UpdateSecretVersionStageResponse> updateSecretVersionStage({
    required String secretId,
    required String versionStage,
    String? moveToVersionId,
    String? removeFromVersionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.UpdateSecretVersionStage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SecretId': secretId,
        'VersionStage': versionStage,
        if (moveToVersionId != null) 'MoveToVersionId': moveToVersionId,
        if (removeFromVersionId != null)
          'RemoveFromVersionId': removeFromVersionId,
      },
    );

    return UpdateSecretVersionStageResponse.fromJson(jsonResponse.body);
  }

  /// Validates that a resource policy does not grant a wide range of principals
  /// access to your secret. A resource-based policy is optional for secrets.
  ///
  /// The API performs three checks when validating the policy:
  ///
  /// <ul>
  /// <li>
  /// Sends a call to <a
  /// href="https://aws.amazon.com/blogs/security/protect-sensitive-data-in-the-cloud-with-automated-reasoning-zelkova/">Zelkova</a>,
  /// an automated reasoning engine, to ensure your resource policy does not
  /// allow broad access to your secret, for example policies that use a
  /// wildcard for the principal.
  /// </li>
  /// <li>
  /// Checks for correct syntax in a policy.
  /// </li>
  /// <li>
  /// Verifies the policy does not lock out a caller.
  /// </li>
  /// </ul>
  /// Secrets Manager generates a CloudTrail log entry when you call this
  /// action. Do not include sensitive information in request parameters because
  /// it might be logged. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html">Logging
  /// Secrets Manager events with CloudTrail</a>.
  ///
  /// <b>Required permissions: </b>
  /// <code>secretsmanager:ValidateResourcePolicy</code> and
  /// <code>secretsmanager:PutResourcePolicy</code>. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions">
  /// IAM policy actions for Secrets Manager</a> and <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control in Secrets Manager</a>.
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourcePolicy] :
  /// A JSON-formatted string that contains an Amazon Web Services
  /// resource-based policy. The policy in the string identifies who can access
  /// or manage this secret and its versions. For example policies, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html">Permissions
  /// policy examples</a>.
  ///
  /// Parameter [secretId] :
  /// This field is reserved for internal use.
  Future<ValidateResourcePolicyResponse> validateResourcePolicy({
    required String resourcePolicy,
    String? secretId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.ValidateResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourcePolicy': resourcePolicy,
        if (secretId != null) 'SecretId': secretId,
      },
    );

    return ValidateResourcePolicyResponse.fromJson(jsonResponse.body);
  }
}

/// The error Secrets Manager encountered while retrieving an individual secret
/// as part of <a>BatchGetSecretValue</a>.
class APIErrorType {
  /// The error Secrets Manager encountered while retrieving an individual secret
  /// as part of <a>BatchGetSecretValue</a>, for example
  /// <code>ResourceNotFoundException</code>,<code>InvalidParameterException</code>,
  /// <code>InvalidRequestException</code>, <code>DecryptionFailure</code>, or
  /// <code>AccessDeniedException</code>.
  final String? errorCode;

  /// A message describing the error.
  final String? message;

  /// The ARN or name of the secret.
  final String? secretId;

  APIErrorType({
    this.errorCode,
    this.message,
    this.secretId,
  });

  factory APIErrorType.fromJson(Map<String, dynamic> json) {
    return APIErrorType(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      secretId: json['SecretId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    final secretId = this.secretId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
      if (secretId != null) 'SecretId': secretId,
    };
  }
}

class BatchGetSecretValueResponse {
  /// A list of errors Secrets Manager encountered while attempting to retrieve
  /// individual secrets.
  final List<APIErrorType>? errors;

  /// Secrets Manager includes this value if there's more output available than
  /// what is included in the current response. This can occur even when the
  /// response includes no values at all, such as when you ask for a filtered view
  /// of a long list. To get the next results, call
  /// <code>BatchGetSecretValue</code> again with this value.
  final String? nextToken;

  /// A list of secret values.
  final List<SecretValueEntry>? secretValues;

  BatchGetSecretValueResponse({
    this.errors,
    this.nextToken,
    this.secretValues,
  });

  factory BatchGetSecretValueResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetSecretValueResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => APIErrorType.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      secretValues: (json['SecretValues'] as List?)
          ?.whereNotNull()
          .map((e) => SecretValueEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final nextToken = this.nextToken;
    final secretValues = this.secretValues;
    return {
      if (errors != null) 'Errors': errors,
      if (nextToken != null) 'NextToken': nextToken,
      if (secretValues != null) 'SecretValues': secretValues,
    };
  }
}

class CancelRotateSecretResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The name of the secret.
  final String? name;

  /// The unique identifier of the version of the secret created during the
  /// rotation. This version might not be complete, and should be evaluated for
  /// possible deletion. We recommend that you remove the
  /// <code>VersionStage</code> value <code>AWSPENDING</code> from this version so
  /// that Secrets Manager can delete it. Failing to clean up a cancelled rotation
  /// can block you from starting future rotations.
  final String? versionId;

  CancelRotateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });

  factory CancelRotateSecretResponse.fromJson(Map<String, dynamic> json) {
    return CancelRotateSecretResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final versionId = this.versionId;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class CreateSecretResponse {
  /// The ARN of the new secret. The ARN includes the name of the secret followed
  /// by six random characters. This ensures that if you create a new secret with
  /// the same name as a deleted secret, then users with access to the old secret
  /// don't get access to the new secret because the ARNs are different.
  final String? arn;

  /// The name of the new secret.
  final String? name;

  /// A list of the replicas of this secret and their status:
  ///
  /// <ul>
  /// <li>
  /// <code>Failed</code>, which indicates that the replica was not created.
  /// </li>
  /// <li>
  /// <code>InProgress</code>, which indicates that Secrets Manager is in the
  /// process of creating the replica.
  /// </li>
  /// <li>
  /// <code>InSync</code>, which indicates that the replica was created.
  /// </li>
  /// </ul>
  final List<ReplicationStatusType>? replicationStatus;

  /// The unique identifier associated with the version of the new secret.
  final String? versionId;

  CreateSecretResponse({
    this.arn,
    this.name,
    this.replicationStatus,
    this.versionId,
  });

  factory CreateSecretResponse.fromJson(Map<String, dynamic> json) {
    return CreateSecretResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
      replicationStatus: (json['ReplicationStatus'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationStatusType.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final replicationStatus = this.replicationStatus;
    final versionId = this.versionId;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
      if (replicationStatus != null) 'ReplicationStatus': replicationStatus,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class DeleteResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was deleted for.
  final String? arn;

  /// The name of the secret that the resource-based policy was deleted for.
  final String? name;

  DeleteResourcePolicyResponse({
    this.arn,
    this.name,
  });

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResourcePolicyResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
    };
  }
}

class DeleteSecretResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The date and time after which this secret Secrets Manager can permanently
  /// delete this secret, and it can no longer be restored. This value is the date
  /// and time of the delete request plus the number of days in
  /// <code>RecoveryWindowInDays</code>.
  final DateTime? deletionDate;

  /// The name of the secret.
  final String? name;

  DeleteSecretResponse({
    this.arn,
    this.deletionDate,
    this.name,
  });

  factory DeleteSecretResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSecretResponse(
      arn: json['ARN'] as String?,
      deletionDate: timeStampFromJson(json['DeletionDate']),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deletionDate = this.deletionDate;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (deletionDate != null)
        'DeletionDate': unixTimestampToJson(deletionDate),
      if (name != null) 'Name': name,
    };
  }
}

class DescribeSecretResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The date the secret was created.
  final DateTime? createdDate;

  /// The date the secret is scheduled for deletion. If it is not scheduled for
  /// deletion, this field is omitted. When you delete a secret, Secrets Manager
  /// requires a recovery window of at least 7 days before deleting the secret.
  /// Some time after the deleted date, Secrets Manager deletes the secret,
  /// including all of its versions.
  ///
  /// If a secret is scheduled for deletion, then its details, including the
  /// encrypted secret value, is not accessible. To cancel a scheduled deletion
  /// and restore access to the secret, use <a>RestoreSecret</a>.
  final DateTime? deletedDate;

  /// The description of the secret.
  final String? description;

  /// The key ID or alias ARN of the KMS key that Secrets Manager uses to encrypt
  /// the secret value. If the secret is encrypted with the Amazon Web Services
  /// managed key <code>aws/secretsmanager</code>, this field is omitted. Secrets
  /// created using the console use an KMS key ID.
  final String? kmsKeyId;

  /// The date that the secret was last accessed in the Region. This field is
  /// omitted if the secret has never been retrieved in the Region.
  final DateTime? lastAccessedDate;

  /// The last date and time that this secret was modified in any way.
  final DateTime? lastChangedDate;

  /// The last date and time that Secrets Manager rotated the secret. If the
  /// secret isn't configured for rotation or rotation has been disabled, Secrets
  /// Manager returns null.
  final DateTime? lastRotatedDate;

  /// The name of the secret.
  final String? name;

  /// The next rotation is scheduled to occur on or before this date. If the
  /// secret isn't configured for rotation or rotation has been disabled, Secrets
  /// Manager returns null. If rotation fails, Secrets Manager retries the entire
  /// rotation process multiple times. If rotation is unsuccessful, this date may
  /// be in the past.
  ///
  /// This date represents the latest date that rotation will occur, but it is not
  /// an approximate rotation date. In some cases, for example if you turn off
  /// automatic rotation and then turn it back on, the next rotation may occur
  /// much sooner than this date.
  final DateTime? nextRotationDate;

  /// The ID of the service that created this secret. For more information, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html">Secrets
  /// managed by other Amazon Web Services services</a>.
  final String? owningService;

  /// The Region the secret is in. If a secret is replicated to other Regions, the
  /// replicas are listed in <code>ReplicationStatus</code>.
  final String? primaryRegion;

  /// A list of the replicas of this secret and their status:
  ///
  /// <ul>
  /// <li>
  /// <code>Failed</code>, which indicates that the replica was not created.
  /// </li>
  /// <li>
  /// <code>InProgress</code>, which indicates that Secrets Manager is in the
  /// process of creating the replica.
  /// </li>
  /// <li>
  /// <code>InSync</code>, which indicates that the replica was created.
  /// </li>
  /// </ul>
  final List<ReplicationStatusType>? replicationStatus;

  /// Specifies whether automatic rotation is turned on for this secret.
  ///
  /// To turn on rotation, use <a>RotateSecret</a>. To turn off rotation, use
  /// <a>CancelRotateSecret</a>.
  final bool? rotationEnabled;

  /// The ARN of the Lambda function that Secrets Manager invokes to rotate the
  /// secret.
  final String? rotationLambdaARN;

  /// The rotation schedule and Lambda function for this secret. If the secret
  /// previously had rotation turned on, but it is now turned off, this field
  /// shows the previous rotation schedule and rotation function. If the secret
  /// never had rotation turned on, this field is omitted.
  final RotationRulesType? rotationRules;

  /// The list of tags attached to the secret. To add tags to a secret, use
  /// <a>TagResource</a>. To remove tags, use <a>UntagResource</a>.
  final List<Tag>? tags;

  /// A list of the versions of the secret that have staging labels attached.
  /// Versions that don't have staging labels are considered deprecated and
  /// Secrets Manager can delete them.
  ///
  /// Secrets Manager uses staging labels to indicate the status of a secret
  /// version during rotation. The three staging labels for rotation are:
  ///
  /// <ul>
  /// <li>
  /// <code>AWSCURRENT</code>, which indicates the current version of the secret.
  /// </li>
  /// <li>
  /// <code>AWSPENDING</code>, which indicates the version of the secret that
  /// contains new secret information that will become the next current version
  /// when rotation finishes.
  ///
  /// During rotation, Secrets Manager creates an <code>AWSPENDING</code> version
  /// ID before creating the new secret version. To check if a secret version
  /// exists, call <a>GetSecretValue</a>.
  /// </li>
  /// <li>
  /// <code>AWSPREVIOUS</code>, which indicates the previous current version of
  /// the secret. You can use this as the <i>last known good</i> version.
  /// </li>
  /// </ul>
  /// For more information about rotation and staging labels, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html">How
  /// rotation works</a>.
  final Map<String, List<String>>? versionIdsToStages;

  DescribeSecretResponse({
    this.arn,
    this.createdDate,
    this.deletedDate,
    this.description,
    this.kmsKeyId,
    this.lastAccessedDate,
    this.lastChangedDate,
    this.lastRotatedDate,
    this.name,
    this.nextRotationDate,
    this.owningService,
    this.primaryRegion,
    this.replicationStatus,
    this.rotationEnabled,
    this.rotationLambdaARN,
    this.rotationRules,
    this.tags,
    this.versionIdsToStages,
  });

  factory DescribeSecretResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSecretResponse(
      arn: json['ARN'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      deletedDate: timeStampFromJson(json['DeletedDate']),
      description: json['Description'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      lastAccessedDate: timeStampFromJson(json['LastAccessedDate']),
      lastChangedDate: timeStampFromJson(json['LastChangedDate']),
      lastRotatedDate: timeStampFromJson(json['LastRotatedDate']),
      name: json['Name'] as String?,
      nextRotationDate: timeStampFromJson(json['NextRotationDate']),
      owningService: json['OwningService'] as String?,
      primaryRegion: json['PrimaryRegion'] as String?,
      replicationStatus: (json['ReplicationStatus'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationStatusType.fromJson(e as Map<String, dynamic>))
          .toList(),
      rotationEnabled: json['RotationEnabled'] as bool?,
      rotationLambdaARN: json['RotationLambdaARN'] as String?,
      rotationRules: json['RotationRules'] != null
          ? RotationRulesType.fromJson(
              json['RotationRules'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionIdsToStages: (json['VersionIdsToStages'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final deletedDate = this.deletedDate;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final lastAccessedDate = this.lastAccessedDate;
    final lastChangedDate = this.lastChangedDate;
    final lastRotatedDate = this.lastRotatedDate;
    final name = this.name;
    final nextRotationDate = this.nextRotationDate;
    final owningService = this.owningService;
    final primaryRegion = this.primaryRegion;
    final replicationStatus = this.replicationStatus;
    final rotationEnabled = this.rotationEnabled;
    final rotationLambdaARN = this.rotationLambdaARN;
    final rotationRules = this.rotationRules;
    final tags = this.tags;
    final versionIdsToStages = this.versionIdsToStages;
    return {
      if (arn != null) 'ARN': arn,
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (deletedDate != null) 'DeletedDate': unixTimestampToJson(deletedDate),
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lastAccessedDate != null)
        'LastAccessedDate': unixTimestampToJson(lastAccessedDate),
      if (lastChangedDate != null)
        'LastChangedDate': unixTimestampToJson(lastChangedDate),
      if (lastRotatedDate != null)
        'LastRotatedDate': unixTimestampToJson(lastRotatedDate),
      if (name != null) 'Name': name,
      if (nextRotationDate != null)
        'NextRotationDate': unixTimestampToJson(nextRotationDate),
      if (owningService != null) 'OwningService': owningService,
      if (primaryRegion != null) 'PrimaryRegion': primaryRegion,
      if (replicationStatus != null) 'ReplicationStatus': replicationStatus,
      if (rotationEnabled != null) 'RotationEnabled': rotationEnabled,
      if (rotationLambdaARN != null) 'RotationLambdaARN': rotationLambdaARN,
      if (rotationRules != null) 'RotationRules': rotationRules,
      if (tags != null) 'Tags': tags,
      if (versionIdsToStages != null) 'VersionIdsToStages': versionIdsToStages,
    };
  }
}

/// Allows you to add filters when you use the search function in Secrets
/// Manager. For more information, see <a
/// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_search-secret.html">Find
/// secrets in Secrets Manager</a>.
class Filter {
  /// The following are keys you can use:
  ///
  /// <ul>
  /// <li>
  /// <b>description</b>: Prefix match, not case-sensitive.
  /// </li>
  /// <li>
  /// <b>name</b>: Prefix match, case-sensitive.
  /// </li>
  /// <li>
  /// <b>tag-key</b>: Prefix match, case-sensitive.
  /// </li>
  /// <li>
  /// <b>tag-value</b>: Prefix match, case-sensitive.
  /// </li>
  /// <li>
  /// <b>primary-region</b>: Prefix match, case-sensitive.
  /// </li>
  /// <li>
  /// <b>owning-service</b>: Prefix match, case-sensitive.
  /// </li>
  /// <li>
  /// <b>all</b>: Breaks the filter value string into words and then searches all
  /// attributes for matches. Not case-sensitive.
  /// </li>
  /// </ul>
  final FilterNameStringType? key;

  /// The keyword to filter for.
  ///
  /// You can prefix your search value with an exclamation mark (<code>!</code>)
  /// in order to perform negation filters.
  final List<String>? values;

  Filter({
    this.key,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      if (key != null) 'Key': key.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

enum FilterNameStringType {
  description,
  name,
  tagKey,
  tagValue,
  primaryRegion,
  owningService,
  all,
}

extension FilterNameStringTypeValueExtension on FilterNameStringType {
  String toValue() {
    switch (this) {
      case FilterNameStringType.description:
        return 'description';
      case FilterNameStringType.name:
        return 'name';
      case FilterNameStringType.tagKey:
        return 'tag-key';
      case FilterNameStringType.tagValue:
        return 'tag-value';
      case FilterNameStringType.primaryRegion:
        return 'primary-region';
      case FilterNameStringType.owningService:
        return 'owning-service';
      case FilterNameStringType.all:
        return 'all';
    }
  }
}

extension FilterNameStringTypeFromString on String {
  FilterNameStringType toFilterNameStringType() {
    switch (this) {
      case 'description':
        return FilterNameStringType.description;
      case 'name':
        return FilterNameStringType.name;
      case 'tag-key':
        return FilterNameStringType.tagKey;
      case 'tag-value':
        return FilterNameStringType.tagValue;
      case 'primary-region':
        return FilterNameStringType.primaryRegion;
      case 'owning-service':
        return FilterNameStringType.owningService;
      case 'all':
        return FilterNameStringType.all;
    }
    throw Exception('$this is not known in enum FilterNameStringType');
  }
}

class GetRandomPasswordResponse {
  /// A string with the password.
  final String? randomPassword;

  GetRandomPasswordResponse({
    this.randomPassword,
  });

  factory GetRandomPasswordResponse.fromJson(Map<String, dynamic> json) {
    return GetRandomPasswordResponse(
      randomPassword: json['RandomPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final randomPassword = this.randomPassword;
    return {
      if (randomPassword != null) 'RandomPassword': randomPassword,
    };
  }
}

class GetResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was retrieved for.
  final String? arn;

  /// The name of the secret that the resource-based policy was retrieved for.
  final String? name;

  /// A JSON-formatted string that contains the permissions policy attached to the
  /// secret. For more information about permissions policies, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and access control for Secrets Manager</a>.
  final String? resourcePolicy;

  GetResourcePolicyResponse({
    this.arn,
    this.name,
    this.resourcePolicy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
      resourcePolicy: json['ResourcePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final resourcePolicy = this.resourcePolicy;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

class GetSecretValueResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The date and time that this version of the secret was created. If you don't
  /// specify which version in <code>VersionId</code> or
  /// <code>VersionStage</code>, then Secrets Manager uses the
  /// <code>AWSCURRENT</code> version.
  final DateTime? createdDate;

  /// The friendly name of the secret.
  final String? name;

  /// The decrypted secret value, if the secret value was originally provided as
  /// binary data in the form of a byte array. When you retrieve a
  /// <code>SecretBinary</code> using the HTTP API, the Python SDK, or the Amazon
  /// Web Services CLI, the value is Base64-encoded. Otherwise, it is not encoded.
  ///
  /// If the secret was created by using the Secrets Manager console, or if the
  /// secret value was originally provided as a string, then this field is
  /// omitted. The secret value appears in <code>SecretString</code> instead.
  final Uint8List? secretBinary;

  /// The decrypted secret value, if the secret value was originally provided as a
  /// string or through the Secrets Manager console.
  ///
  /// If this secret was created by using the console, then Secrets Manager stores
  /// the information as a JSON structure of key/value pairs.
  final String? secretString;

  /// The unique identifier of this version of the secret.
  final String? versionId;

  /// A list of all of the staging labels currently attached to this version of
  /// the secret.
  final List<String>? versionStages;

  GetSecretValueResponse({
    this.arn,
    this.createdDate,
    this.name,
    this.secretBinary,
    this.secretString,
    this.versionId,
    this.versionStages,
  });

  factory GetSecretValueResponse.fromJson(Map<String, dynamic> json) {
    return GetSecretValueResponse(
      arn: json['ARN'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      name: json['Name'] as String?,
      secretBinary: _s.decodeNullableUint8List(json['SecretBinary'] as String?),
      secretString: json['SecretString'] as String?,
      versionId: json['VersionId'] as String?,
      versionStages: (json['VersionStages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final name = this.name;
    final secretBinary = this.secretBinary;
    final secretString = this.secretString;
    final versionId = this.versionId;
    final versionStages = this.versionStages;
    return {
      if (arn != null) 'ARN': arn,
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (name != null) 'Name': name,
      if (secretBinary != null) 'SecretBinary': base64Encode(secretBinary),
      if (secretString != null) 'SecretString': secretString,
      if (versionId != null) 'VersionId': versionId,
      if (versionStages != null) 'VersionStages': versionStages,
    };
  }
}

class ListSecretVersionIdsResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The name of the secret.
  final String? name;

  /// Secrets Manager includes this value if there's more output available than
  /// what is included in the current response. This can occur even when the
  /// response includes no values at all, such as when you ask for a filtered view
  /// of a long list. To get the next results, call
  /// <code>ListSecretVersionIds</code> again with this value.
  final String? nextToken;

  /// A list of the versions of the secret.
  final List<SecretVersionsListEntry>? versions;

  ListSecretVersionIdsResponse({
    this.arn,
    this.name,
    this.nextToken,
    this.versions,
  });

  factory ListSecretVersionIdsResponse.fromJson(Map<String, dynamic> json) {
    return ListSecretVersionIdsResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
      nextToken: json['NextToken'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SecretVersionsListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
      if (nextToken != null) 'NextToken': nextToken,
      if (versions != null) 'Versions': versions,
    };
  }
}

class ListSecretsResponse {
  /// Secrets Manager includes this value if there's more output available than
  /// what is included in the current response. This can occur even when the
  /// response includes no values at all, such as when you ask for a filtered view
  /// of a long list. To get the next results, call <code>ListSecrets</code> again
  /// with this value.
  final String? nextToken;

  /// A list of the secrets in the account.
  final List<SecretListEntry>? secretList;

  ListSecretsResponse({
    this.nextToken,
    this.secretList,
  });

  factory ListSecretsResponse.fromJson(Map<String, dynamic> json) {
    return ListSecretsResponse(
      nextToken: json['NextToken'] as String?,
      secretList: (json['SecretList'] as List?)
          ?.whereNotNull()
          .map((e) => SecretListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final secretList = this.secretList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (secretList != null) 'SecretList': secretList,
    };
  }
}

class PutResourcePolicyResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The name of the secret.
  final String? name;

  PutResourcePolicyResponse({
    this.arn,
    this.name,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
    };
  }
}

class PutSecretValueResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The name of the secret.
  final String? name;

  /// The unique identifier of the version of the secret.
  final String? versionId;

  /// The list of staging labels that are currently attached to this version of
  /// the secret. Secrets Manager uses staging labels to track a version as it
  /// progresses through the secret rotation process.
  final List<String>? versionStages;

  PutSecretValueResponse({
    this.arn,
    this.name,
    this.versionId,
    this.versionStages,
  });

  factory PutSecretValueResponse.fromJson(Map<String, dynamic> json) {
    return PutSecretValueResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
      versionId: json['VersionId'] as String?,
      versionStages: (json['VersionStages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final versionId = this.versionId;
    final versionStages = this.versionStages;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
      if (versionId != null) 'VersionId': versionId,
      if (versionStages != null) 'VersionStages': versionStages,
    };
  }
}

class RemoveRegionsFromReplicationResponse {
  /// The ARN of the primary secret.
  final String? arn;

  /// The status of replicas for this secret after you remove Regions.
  final List<ReplicationStatusType>? replicationStatus;

  RemoveRegionsFromReplicationResponse({
    this.arn,
    this.replicationStatus,
  });

  factory RemoveRegionsFromReplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return RemoveRegionsFromReplicationResponse(
      arn: json['ARN'] as String?,
      replicationStatus: (json['ReplicationStatus'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationStatusType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final replicationStatus = this.replicationStatus;
    return {
      if (arn != null) 'ARN': arn,
      if (replicationStatus != null) 'ReplicationStatus': replicationStatus,
    };
  }
}

/// A custom type that specifies a <code>Region</code> and the
/// <code>KmsKeyId</code> for a replica secret.
class ReplicaRegionType {
  /// The ARN, key ID, or alias of the KMS key to encrypt the secret. If you don't
  /// include this field, Secrets Manager uses <code>aws/secretsmanager</code>.
  final String? kmsKeyId;

  /// A Region code. For a list of Region codes, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#regional-endpoints">Name
  /// and code of Regions</a>.
  final String? region;

  ReplicaRegionType({
    this.kmsKeyId,
    this.region,
  });

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final region = this.region;
    return {
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (region != null) 'Region': region,
    };
  }
}

class ReplicateSecretToRegionsResponse {
  /// The ARN of the primary secret.
  final String? arn;

  /// The status of replication.
  final List<ReplicationStatusType>? replicationStatus;

  ReplicateSecretToRegionsResponse({
    this.arn,
    this.replicationStatus,
  });

  factory ReplicateSecretToRegionsResponse.fromJson(Map<String, dynamic> json) {
    return ReplicateSecretToRegionsResponse(
      arn: json['ARN'] as String?,
      replicationStatus: (json['ReplicationStatus'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationStatusType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final replicationStatus = this.replicationStatus;
    return {
      if (arn != null) 'ARN': arn,
      if (replicationStatus != null) 'ReplicationStatus': replicationStatus,
    };
  }
}

/// A replication object consisting of a <code>RegionReplicationStatus</code>
/// object and includes a Region, KMSKeyId, status, and status message.
class ReplicationStatusType {
  /// Can be an <code>ARN</code>, <code>Key ID</code>, or <code>Alias</code>.
  final String? kmsKeyId;

  /// The date that the secret was last accessed in the Region. This field is
  /// omitted if the secret has never been retrieved in the Region.
  final DateTime? lastAccessedDate;

  /// The Region where replication occurs.
  final String? region;

  /// The status can be <code>InProgress</code>, <code>Failed</code>, or
  /// <code>InSync</code>.
  final StatusType? status;

  /// Status message such as "<i>Secret with this name already exists in this
  /// region</i>".
  final String? statusMessage;

  ReplicationStatusType({
    this.kmsKeyId,
    this.lastAccessedDate,
    this.region,
    this.status,
    this.statusMessage,
  });

  factory ReplicationStatusType.fromJson(Map<String, dynamic> json) {
    return ReplicationStatusType(
      kmsKeyId: json['KmsKeyId'] as String?,
      lastAccessedDate: timeStampFromJson(json['LastAccessedDate']),
      region: json['Region'] as String?,
      status: (json['Status'] as String?)?.toStatusType(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final lastAccessedDate = this.lastAccessedDate;
    final region = this.region;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lastAccessedDate != null)
        'LastAccessedDate': unixTimestampToJson(lastAccessedDate),
      if (region != null) 'Region': region,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class RestoreSecretResponse {
  /// The ARN of the secret that was restored.
  final String? arn;

  /// The name of the secret that was restored.
  final String? name;

  RestoreSecretResponse({
    this.arn,
    this.name,
  });

  factory RestoreSecretResponse.fromJson(Map<String, dynamic> json) {
    return RestoreSecretResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
    };
  }
}

class RotateSecretResponse {
  /// The ARN of the secret.
  final String? arn;

  /// The name of the secret.
  final String? name;

  /// The ID of the new version of the secret.
  final String? versionId;

  RotateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });

  factory RotateSecretResponse.fromJson(Map<String, dynamic> json) {
    return RotateSecretResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final versionId = this.versionId;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// A structure that defines the rotation configuration for the secret.
class RotationRulesType {
  /// The number of days between rotations of the secret. You can use this value
  /// to check that your secret meets your compliance guidelines for how often
  /// secrets must be rotated. If you use this field to set the rotation schedule,
  /// Secrets Manager calculates the next rotation date based on the previous
  /// rotation. Manually updating the secret value by calling
  /// <code>PutSecretValue</code> or <code>UpdateSecret</code> is considered a
  /// valid rotation.
  ///
  /// In <code>DescribeSecret</code> and <code>ListSecrets</code>, this value is
  /// calculated from the rotation schedule after every successful rotation. In
  /// <code>RotateSecret</code>, you can set the rotation schedule in
  /// <code>RotationRules</code> with <code>AutomaticallyAfterDays</code> or
  /// <code>ScheduleExpression</code>, but not both. To set a rotation schedule in
  /// hours, use <code>ScheduleExpression</code>.
  final int? automaticallyAfterDays;

  /// The length of the rotation window in hours, for example <code>3h</code> for
  /// a three hour window. Secrets Manager rotates your secret at any time during
  /// this window. The window must not extend into the next rotation window or the
  /// next UTC day. The window starts according to the
  /// <code>ScheduleExpression</code>. If you don't specify a
  /// <code>Duration</code>, for a <code>ScheduleExpression</code> in hours, the
  /// window automatically closes after one hour. For a
  /// <code>ScheduleExpression</code> in days, the window automatically closes at
  /// the end of the UTC day. For more information, including examples, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_schedule.html">Schedule
  /// expressions in Secrets Manager rotation</a> in the <i>Secrets Manager Users
  /// Guide</i>.
  final String? duration;

  /// A <code>cron()</code> or <code>rate()</code> expression that defines the
  /// schedule for rotating your secret. Secrets Manager rotation schedules use
  /// UTC time zone. Secrets Manager rotates your secret any time during a
  /// rotation window.
  ///
  /// Secrets Manager <code>rate()</code> expressions represent the interval in
  /// hours or days that you want to rotate your secret, for example <code>rate(12
  /// hours)</code> or <code>rate(10 days)</code>. You can rotate a secret as
  /// often as every four hours. If you use a <code>rate()</code> expression, the
  /// rotation window starts at midnight. For a rate in hours, the default
  /// rotation window closes after one hour. For a rate in days, the default
  /// rotation window closes at the end of the day. You can set the
  /// <code>Duration</code> to change the rotation window. The rotation window
  /// must not extend into the next UTC day or into the next rotation window.
  ///
  /// You can use a <code>cron()</code> expression to create a rotation schedule
  /// that is more detailed than a rotation interval. For more information,
  /// including examples, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_schedule.html">Schedule
  /// expressions in Secrets Manager rotation</a> in the <i>Secrets Manager Users
  /// Guide</i>. For a cron expression that represents a schedule in hours, the
  /// default rotation window closes after one hour. For a cron expression that
  /// represents a schedule in days, the default rotation window closes at the end
  /// of the day. You can set the <code>Duration</code> to change the rotation
  /// window. The rotation window must not extend into the next UTC day or into
  /// the next rotation window.
  final String? scheduleExpression;

  RotationRulesType({
    this.automaticallyAfterDays,
    this.duration,
    this.scheduleExpression,
  });

  factory RotationRulesType.fromJson(Map<String, dynamic> json) {
    return RotationRulesType(
      automaticallyAfterDays: json['AutomaticallyAfterDays'] as int?,
      duration: json['Duration'] as String?,
      scheduleExpression: json['ScheduleExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automaticallyAfterDays = this.automaticallyAfterDays;
    final duration = this.duration;
    final scheduleExpression = this.scheduleExpression;
    return {
      if (automaticallyAfterDays != null)
        'AutomaticallyAfterDays': automaticallyAfterDays,
      if (duration != null) 'Duration': duration,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
    };
  }
}

/// A structure that contains the details about a secret. It does not include
/// the encrypted <code>SecretString</code> and <code>SecretBinary</code>
/// values. To get those values, use <a
/// href="https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html">GetSecretValue</a>
/// .
class SecretListEntry {
  /// The Amazon Resource Name (ARN) of the secret.
  final String? arn;

  /// The date and time when a secret was created.
  final DateTime? createdDate;

  /// The date and time the deletion of the secret occurred. Not present on active
  /// secrets. The secret can be recovered until the number of days in the
  /// recovery window has passed, as specified in the
  /// <code>RecoveryWindowInDays</code> parameter of the <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_DeleteSecret.html">
  /// <code>DeleteSecret</code> </a> operation.
  final DateTime? deletedDate;

  /// The user-provided description of the secret.
  final String? description;

  /// The ARN of the KMS key that Secrets Manager uses to encrypt the secret
  /// value. If the secret is encrypted with the Amazon Web Services managed key
  /// <code>aws/secretsmanager</code>, this field is omitted.
  final String? kmsKeyId;

  /// The date that the secret was last accessed in the Region. This field is
  /// omitted if the secret has never been retrieved in the Region.
  final DateTime? lastAccessedDate;

  /// The last date and time that this secret was modified in any way.
  final DateTime? lastChangedDate;

  /// The most recent date and time that the Secrets Manager rotation process was
  /// successfully completed. This value is null if the secret hasn't ever
  /// rotated.
  final DateTime? lastRotatedDate;

  /// The friendly name of the secret.
  final String? name;

  /// The next rotation is scheduled to occur on or before this date. If the
  /// secret isn't configured for rotation or rotation has been disabled, Secrets
  /// Manager returns null.
  final DateTime? nextRotationDate;

  /// Returns the name of the service that created the secret.
  final String? owningService;

  /// The Region where Secrets Manager originated the secret.
  final String? primaryRegion;

  /// Indicates whether automatic, scheduled rotation is enabled for this secret.
  final bool? rotationEnabled;

  /// The ARN of an Amazon Web Services Lambda function invoked by Secrets Manager
  /// to rotate and expire the secret either automatically per the schedule or
  /// manually by a call to <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_RotateSecret.html">
  /// <code>RotateSecret</code> </a>.
  final String? rotationLambdaARN;

  /// A structure that defines the rotation configuration for the secret.
  final RotationRulesType? rotationRules;

  /// A list of all of the currently assigned <code>SecretVersionStage</code>
  /// staging labels and the <code>SecretVersionId</code> attached to each one.
  /// Staging labels are used to keep track of the different versions during the
  /// rotation process.
  /// <note>
  /// A version that does not have any <code>SecretVersionStage</code> is
  /// considered deprecated and subject to deletion. Such versions are not
  /// included in this list.
  /// </note>
  final Map<String, List<String>>? secretVersionsToStages;

  /// The list of user-defined tags associated with the secret. To add tags to a
  /// secret, use <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_TagResource.html">
  /// <code>TagResource</code> </a>. To remove tags, use <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_UntagResource.html">
  /// <code>UntagResource</code> </a>.
  final List<Tag>? tags;

  SecretListEntry({
    this.arn,
    this.createdDate,
    this.deletedDate,
    this.description,
    this.kmsKeyId,
    this.lastAccessedDate,
    this.lastChangedDate,
    this.lastRotatedDate,
    this.name,
    this.nextRotationDate,
    this.owningService,
    this.primaryRegion,
    this.rotationEnabled,
    this.rotationLambdaARN,
    this.rotationRules,
    this.secretVersionsToStages,
    this.tags,
  });

  factory SecretListEntry.fromJson(Map<String, dynamic> json) {
    return SecretListEntry(
      arn: json['ARN'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      deletedDate: timeStampFromJson(json['DeletedDate']),
      description: json['Description'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      lastAccessedDate: timeStampFromJson(json['LastAccessedDate']),
      lastChangedDate: timeStampFromJson(json['LastChangedDate']),
      lastRotatedDate: timeStampFromJson(json['LastRotatedDate']),
      name: json['Name'] as String?,
      nextRotationDate: timeStampFromJson(json['NextRotationDate']),
      owningService: json['OwningService'] as String?,
      primaryRegion: json['PrimaryRegion'] as String?,
      rotationEnabled: json['RotationEnabled'] as bool?,
      rotationLambdaARN: json['RotationLambdaARN'] as String?,
      rotationRules: json['RotationRules'] != null
          ? RotationRulesType.fromJson(
              json['RotationRules'] as Map<String, dynamic>)
          : null,
      secretVersionsToStages: (json['SecretVersionsToStages']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final deletedDate = this.deletedDate;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final lastAccessedDate = this.lastAccessedDate;
    final lastChangedDate = this.lastChangedDate;
    final lastRotatedDate = this.lastRotatedDate;
    final name = this.name;
    final nextRotationDate = this.nextRotationDate;
    final owningService = this.owningService;
    final primaryRegion = this.primaryRegion;
    final rotationEnabled = this.rotationEnabled;
    final rotationLambdaARN = this.rotationLambdaARN;
    final rotationRules = this.rotationRules;
    final secretVersionsToStages = this.secretVersionsToStages;
    final tags = this.tags;
    return {
      if (arn != null) 'ARN': arn,
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (deletedDate != null) 'DeletedDate': unixTimestampToJson(deletedDate),
      if (description != null) 'Description': description,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lastAccessedDate != null)
        'LastAccessedDate': unixTimestampToJson(lastAccessedDate),
      if (lastChangedDate != null)
        'LastChangedDate': unixTimestampToJson(lastChangedDate),
      if (lastRotatedDate != null)
        'LastRotatedDate': unixTimestampToJson(lastRotatedDate),
      if (name != null) 'Name': name,
      if (nextRotationDate != null)
        'NextRotationDate': unixTimestampToJson(nextRotationDate),
      if (owningService != null) 'OwningService': owningService,
      if (primaryRegion != null) 'PrimaryRegion': primaryRegion,
      if (rotationEnabled != null) 'RotationEnabled': rotationEnabled,
      if (rotationLambdaARN != null) 'RotationLambdaARN': rotationLambdaARN,
      if (rotationRules != null) 'RotationRules': rotationRules,
      if (secretVersionsToStages != null)
        'SecretVersionsToStages': secretVersionsToStages,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A structure that contains the secret value and other details for a secret.
class SecretValueEntry {
  /// The Amazon Resource Name (ARN) of the secret.
  final String? arn;

  /// The date the secret was created.
  final DateTime? createdDate;

  /// The friendly name of the secret.
  final String? name;

  /// The decrypted secret value, if the secret value was originally provided as
  /// binary data in the form of a byte array. The parameter represents the binary
  /// data as a <a
  /// href="https://tools.ietf.org/html/rfc4648#section-4">base64-encoded</a>
  /// string.
  final Uint8List? secretBinary;

  /// The decrypted secret value, if the secret value was originally provided as a
  /// string or through the Secrets Manager console.
  final String? secretString;

  /// The unique version identifier of this version of the secret.
  final String? versionId;

  /// A list of all of the staging labels currently attached to this version of
  /// the secret.
  final List<String>? versionStages;

  SecretValueEntry({
    this.arn,
    this.createdDate,
    this.name,
    this.secretBinary,
    this.secretString,
    this.versionId,
    this.versionStages,
  });

  factory SecretValueEntry.fromJson(Map<String, dynamic> json) {
    return SecretValueEntry(
      arn: json['ARN'] as String?,
      createdDate: timeStampFromJson(json['CreatedDate']),
      name: json['Name'] as String?,
      secretBinary: _s.decodeNullableUint8List(json['SecretBinary'] as String?),
      secretString: json['SecretString'] as String?,
      versionId: json['VersionId'] as String?,
      versionStages: (json['VersionStages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdDate = this.createdDate;
    final name = this.name;
    final secretBinary = this.secretBinary;
    final secretString = this.secretString;
    final versionId = this.versionId;
    final versionStages = this.versionStages;
    return {
      if (arn != null) 'ARN': arn,
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (name != null) 'Name': name,
      if (secretBinary != null) 'SecretBinary': base64Encode(secretBinary),
      if (secretString != null) 'SecretString': secretString,
      if (versionId != null) 'VersionId': versionId,
      if (versionStages != null) 'VersionStages': versionStages,
    };
  }
}

/// A structure that contains information about one version of a secret.
class SecretVersionsListEntry {
  /// The date and time this version of the secret was created.
  final DateTime? createdDate;

  /// The KMS keys used to encrypt the secret version.
  final List<String>? kmsKeyIds;

  /// The date that this version of the secret was last accessed. Note that the
  /// resolution of this field is at the date level and does not include the time.
  final DateTime? lastAccessedDate;

  /// The unique version identifier of this version of the secret.
  final String? versionId;

  /// An array of staging labels that are currently associated with this version
  /// of the secret.
  final List<String>? versionStages;

  SecretVersionsListEntry({
    this.createdDate,
    this.kmsKeyIds,
    this.lastAccessedDate,
    this.versionId,
    this.versionStages,
  });

  factory SecretVersionsListEntry.fromJson(Map<String, dynamic> json) {
    return SecretVersionsListEntry(
      createdDate: timeStampFromJson(json['CreatedDate']),
      kmsKeyIds: (json['KmsKeyIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastAccessedDate: timeStampFromJson(json['LastAccessedDate']),
      versionId: json['VersionId'] as String?,
      versionStages: (json['VersionStages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final kmsKeyIds = this.kmsKeyIds;
    final lastAccessedDate = this.lastAccessedDate;
    final versionId = this.versionId;
    final versionStages = this.versionStages;
    return {
      if (createdDate != null) 'CreatedDate': unixTimestampToJson(createdDate),
      if (kmsKeyIds != null) 'KmsKeyIds': kmsKeyIds,
      if (lastAccessedDate != null)
        'LastAccessedDate': unixTimestampToJson(lastAccessedDate),
      if (versionId != null) 'VersionId': versionId,
      if (versionStages != null) 'VersionStages': versionStages,
    };
  }
}

enum SortOrderType {
  asc,
  desc,
}

extension SortOrderTypeValueExtension on SortOrderType {
  String toValue() {
    switch (this) {
      case SortOrderType.asc:
        return 'asc';
      case SortOrderType.desc:
        return 'desc';
    }
  }
}

extension SortOrderTypeFromString on String {
  SortOrderType toSortOrderType() {
    switch (this) {
      case 'asc':
        return SortOrderType.asc;
      case 'desc':
        return SortOrderType.desc;
    }
    throw Exception('$this is not known in enum SortOrderType');
  }
}

enum StatusType {
  inSync,
  failed,
  inProgress,
}

extension StatusTypeValueExtension on StatusType {
  String toValue() {
    switch (this) {
      case StatusType.inSync:
        return 'InSync';
      case StatusType.failed:
        return 'Failed';
      case StatusType.inProgress:
        return 'InProgress';
    }
  }
}

extension StatusTypeFromString on String {
  StatusType toStatusType() {
    switch (this) {
      case 'InSync':
        return StatusType.inSync;
      case 'Failed':
        return StatusType.failed;
      case 'InProgress':
        return StatusType.inProgress;
    }
    throw Exception('$this is not known in enum StatusType');
  }
}

class StopReplicationToReplicaResponse {
  /// The ARN of the promoted secret. The ARN is the same as the original primary
  /// secret except the Region is changed.
  final String? arn;

  StopReplicationToReplicaResponse({
    this.arn,
  });

  factory StopReplicationToReplicaResponse.fromJson(Map<String, dynamic> json) {
    return StopReplicationToReplicaResponse(
      arn: json['ARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'ARN': arn,
    };
  }
}

/// A structure that contains information about a tag.
class Tag {
  /// The key identifier, or name, of the tag.
  final String? key;

  /// The string value associated with the key of the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class UpdateSecretResponse {
  /// The ARN of the secret that was updated.
  final String? arn;

  /// The name of the secret that was updated.
  final String? name;

  /// If Secrets Manager created a new version of the secret during this
  /// operation, then <code>VersionId</code> contains the unique identifier of the
  /// new version.
  final String? versionId;

  UpdateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });

  factory UpdateSecretResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecretResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final versionId = this.versionId;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class UpdateSecretVersionStageResponse {
  /// The ARN of the secret that was updated.
  final String? arn;

  /// The name of the secret that was updated.
  final String? name;

  UpdateSecretVersionStageResponse({
    this.arn,
    this.name,
  });

  factory UpdateSecretVersionStageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecretVersionStageResponse(
      arn: json['ARN'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'ARN': arn,
      if (name != null) 'Name': name,
    };
  }
}

class ValidateResourcePolicyResponse {
  /// True if your policy passes validation, otherwise false.
  final bool? policyValidationPassed;

  /// Validation errors if your policy didn't pass validation.
  final List<ValidationErrorsEntry>? validationErrors;

  ValidateResourcePolicyResponse({
    this.policyValidationPassed,
    this.validationErrors,
  });

  factory ValidateResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return ValidateResourcePolicyResponse(
      policyValidationPassed: json['PolicyValidationPassed'] as bool?,
      validationErrors: (json['ValidationErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationErrorsEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyValidationPassed = this.policyValidationPassed;
    final validationErrors = this.validationErrors;
    return {
      if (policyValidationPassed != null)
        'PolicyValidationPassed': policyValidationPassed,
      if (validationErrors != null) 'ValidationErrors': validationErrors,
    };
  }
}

/// Displays errors that occurred during validation of the resource policy.
class ValidationErrorsEntry {
  /// Checks the name of the policy.
  final String? checkName;

  /// Displays error messages if validation encounters problems during validation
  /// of the resource policy.
  final String? errorMessage;

  ValidationErrorsEntry({
    this.checkName,
    this.errorMessage,
  });

  factory ValidationErrorsEntry.fromJson(Map<String, dynamic> json) {
    return ValidationErrorsEntry(
      checkName: json['CheckName'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkName = this.checkName;
    final errorMessage = this.errorMessage;
    return {
      if (checkName != null) 'CheckName': checkName,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

class DecryptionFailure extends _s.GenericAwsException {
  DecryptionFailure({String? type, String? message})
      : super(type: type, code: 'DecryptionFailure', message: message);
}

class EncryptionFailure extends _s.GenericAwsException {
  EncryptionFailure({String? type, String? message})
      : super(type: type, code: 'EncryptionFailure', message: message);
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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

class PreconditionNotMetException extends _s.GenericAwsException {
  PreconditionNotMetException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionNotMetException', message: message);
}

class PublicPolicyException extends _s.GenericAwsException {
  PublicPolicyException({String? type, String? message})
      : super(type: type, code: 'PublicPolicyException', message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String? type, String? message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DecryptionFailure': (type, message) =>
      DecryptionFailure(type: type, message: message),
  'EncryptionFailure': (type, message) =>
      EncryptionFailure(type: type, message: message),
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
  'PreconditionNotMetException': (type, message) =>
      PreconditionNotMetException(type: type, message: message),
  'PublicPolicyException': (type, message) =>
      PublicPolicyException(type: type, message: message),
  'ResourceExistsException': (type, message) =>
      ResourceExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
