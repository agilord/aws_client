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

part '2017-10-17.g.dart';

/// AWS Secrets Manager provides a service to enable you to store, manage, and
/// retrieve, secrets.
class SecretsManager {
  final _s.JsonProtocol _protocol;
  SecretsManager({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'secretsmanager',
            signingName: 'secretsmanager',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Disables automatic scheduled rotation and cancels the rotation of a secret
  /// if currently in progress.
  ///
  /// To re-enable scheduled rotation, call <a>RotateSecret</a> with
  /// <code>AutomaticallyRotateAfterDays</code> set to a value greater than 0.
  /// This immediately rotates your secret and then enables the automatic
  /// schedule.
  /// <note>
  /// If you cancel a rotation while in progress, it can leave the
  /// <code>VersionStage</code> labels in an unexpected state. Depending on the
  /// step of the rotation in progress, you might need to remove the staging
  /// label <code>AWSPENDING</code> from the partially created version,
  /// specified by the <code>VersionId</code> response value. You should also
  /// evaluate the partially rotated new version to see if it should be deleted,
  /// which you can do by removing all staging labels from the new version
  /// <code>VersionStage</code> field.
  /// </note>
  /// To successfully start a rotation, the staging label
  /// <code>AWSPENDING</code> must be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// Not attached to any version at all
  /// </li>
  /// <li>
  /// Attached to the same version as the staging label <code>AWSCURRENT</code>
  /// </li>
  /// </ul>
  /// If the staging label <code>AWSPENDING</code> attached to a different
  /// version than the version with <code>AWSCURRENT</code> then the attempt to
  /// rotate fails.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:CancelRotateSecret
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To configure rotation for a secret or to manually trigger a rotation, use
  /// <a>RotateSecret</a>.
  /// </li>
  /// <li>
  /// To get the rotation configuration details for a secret, use
  /// <a>DescribeSecret</a>.
  /// </li>
  /// <li>
  /// To list all of the currently available secrets, use <a>ListSecrets</a>.
  /// </li>
  /// <li>
  /// To list all of the versions currently associated with a secret, use
  /// <a>ListSecretVersionIds</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret to cancel a rotation request. You can specify either
  /// the Amazon Resource Name (ARN) or the friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  Future<CancelRotateSecretResponse> cancelRotateSecret({
    @_s.required String secretId,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
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

  /// Creates a new secret. A secret in Secrets Manager consists of both the
  /// protected secret data and the important information needed to manage the
  /// secret.
  ///
  /// Secrets Manager stores the encrypted secret data in one of a collection of
  /// "versions" associated with the secret. Each version contains a copy of the
  /// encrypted secret data. Each version is associated with one or more
  /// "staging labels" that identify where the version is in the rotation cycle.
  /// The <code>SecretVersionsToStages</code> field of the secret contains the
  /// mapping of staging labels to the active versions of the secret. Versions
  /// without a staging label are considered deprecated and not included in the
  /// list.
  ///
  /// You provide the secret data to be encrypted by putting text in either the
  /// <code>SecretString</code> parameter or binary data in the
  /// <code>SecretBinary</code> parameter, but not both. If you include
  /// <code>SecretString</code> or <code>SecretBinary</code> then Secrets
  /// Manager also creates an initial secret version and automatically attaches
  /// the staging label <code>AWSCURRENT</code> to the new version.
  /// <note>
  /// <ul>
  /// <li>
  /// If you call an operation to encrypt or decrypt the
  /// <code>SecretString</code> or <code>SecretBinary</code> for a secret in the
  /// same account as the calling user and that secret doesn't specify a AWS KMS
  /// encryption key, Secrets Manager uses the account's default AWS managed
  /// customer master key (CMK) with the alias <code>aws/secretsmanager</code>.
  /// If this key doesn't already exist in your account then Secrets Manager
  /// creates it for you automatically. All users and roles in the same AWS
  /// account automatically have access to use the default CMK. Note that if an
  /// Secrets Manager API call results in AWS creating the account's AWS-managed
  /// CMK, it can result in a one-time significant delay in returning the
  /// result.
  /// </li>
  /// <li>
  /// If the secret resides in a different AWS account from the credentials
  /// calling an API that requires encryption or decryption of the secret value
  /// then you must create and use a custom AWS KMS CMK because you can't access
  /// the default CMK for the account using credentials from a different AWS
  /// account. Store the ARN of the CMK in the secret when you create the secret
  /// or when you update it by including it in the <code>KMSKeyId</code>. If you
  /// call an API that must encrypt or decrypt <code>SecretString</code> or
  /// <code>SecretBinary</code> using credentials from a different account then
  /// the AWS KMS key policy must grant cross-account access to that other
  /// account's user or role for both the kms:GenerateDataKey and kms:Decrypt
  /// operations.
  /// </li>
  /// </ul> </note>
  ///
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:CreateSecret
  /// </li>
  /// <li>
  /// kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS
  /// key to encrypt the secret. You do not need this permission to use the
  /// account default AWS managed CMK for Secrets Manager.
  /// </li>
  /// <li>
  /// kms:Decrypt - needed only if you use a customer-managed AWS KMS key to
  /// encrypt the secret. You do not need this permission to use the account
  /// default AWS managed CMK for Secrets Manager.
  /// </li>
  /// <li>
  /// secretsmanager:TagResource - needed only if you include the
  /// <code>Tags</code> parameter.
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To delete a secret, use <a>DeleteSecret</a>.
  /// </li>
  /// <li>
  /// To modify an existing secret, use <a>UpdateSecret</a>.
  /// </li>
  /// <li>
  /// To create a new version of a secret, use <a>PutSecretValue</a>.
  /// </li>
  /// <li>
  /// To retrieve the encrypted secure string and secure binary values, use
  /// <a>GetSecretValue</a>.
  /// </li>
  /// <li>
  /// To retrieve all other details for a secret, use <a>DescribeSecret</a>.
  /// This does not include the encrypted secure string and secure binary
  /// values.
  /// </li>
  /// <li>
  /// To retrieve the list of secret versions associated with the current
  /// secret, use <a>DescribeSecret</a> and examine the
  /// <code>SecretVersionsToStages</code> response value.
  /// </li>
  /// </ul>
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
  ///
  /// Parameter [name] :
  /// Specifies the friendly name of the new secret.
  ///
  /// The secret name must be ASCII letters, digits, or the following characters
  /// : /_+=.@-
  /// <note>
  /// Do not end your secret name with a hyphen followed by six characters. If
  /// you do so, you risk confusion and unexpected results when searching for a
  /// secret by partial ARN. Secrets Manager automatically adds a hyphen and six
  /// random characters at the end of the ARN.
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) If you include <code>SecretString</code> or
  /// <code>SecretBinary</code>, then an initial version is created as part of
  /// the secret, and this parameter specifies a unique identifier for the new
  /// version.
  /// <note>
  /// If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes it as the value for this parameter in the request. If
  /// you don't use the SDK and instead generate a raw HTTP request to the
  /// Secrets Manager service endpoint, then you must generate a
  /// <code>ClientRequestToken</code> yourself for the new version and include
  /// the value in the request.
  /// </note>
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
  /// different from those in the request then the request fails because you
  /// cannot modify an existing version. Instead, use <a>PutSecretValue</a> to
  /// create a new version.
  /// </li>
  /// </ul>
  /// This value becomes the <code>VersionId</code> of the new version.
  ///
  /// Parameter [description] :
  /// (Optional) Specifies a user-provided description of the secret.
  ///
  /// Parameter [kmsKeyId] :
  /// (Optional) Specifies the ARN, Key ID, or alias of the AWS KMS customer
  /// master key (CMK) to be used to encrypt the <code>SecretString</code> or
  /// <code>SecretBinary</code> values in the versions stored in this secret.
  ///
  /// You can specify any of the supported ways to identify a AWS KMS key ID. If
  /// you need to reference a CMK in a different account, you can use only the
  /// key ARN or the alias ARN.
  ///
  /// If you don't specify this value, then Secrets Manager defaults to using
  /// the AWS account's default CMK (the one named
  /// <code>aws/secretsmanager</code>). If a AWS KMS CMK with that name doesn't
  /// yet exist, then Secrets Manager creates it for you automatically the first
  /// time it needs to encrypt a version's <code>SecretString</code> or
  /// <code>SecretBinary</code> fields.
  /// <important>
  /// You can use the account default CMK to encrypt and decrypt only if you
  /// call this operation using credentials from the same account that owns the
  /// secret. If the secret resides in a different account, then you must create
  /// a custom CMK and specify the ARN in this field.
  /// </important>
  ///
  /// Parameter [secretBinary] :
  /// (Optional) Specifies binary data that you want to encrypt and store in the
  /// new version of the secret. To use this parameter in the command-line
  /// tools, we recommend that you store your binary data in a file and then use
  /// the appropriate technique for your tool to pass the contents of the file
  /// as a parameter.
  ///
  /// Either <code>SecretString</code> or <code>SecretBinary</code> must have a
  /// value, but not both. They cannot both be empty.
  ///
  /// This parameter is not available using the Secrets Manager console. It can
  /// be accessed only by using the AWS CLI or one of the AWS SDKs.
  ///
  /// Parameter [secretString] :
  /// (Optional) Specifies text data that you want to encrypt and store in this
  /// new version of the secret.
  ///
  /// Either <code>SecretString</code> or <code>SecretBinary</code> must have a
  /// value, but not both. They cannot both be empty.
  ///
  /// If you create a secret by using the Secrets Manager console then Secrets
  /// Manager puts the protected secret text in only the
  /// <code>SecretString</code> parameter. The Secrets Manager console stores
  /// the information as a JSON structure of key/value pairs that the Lambda
  /// rotation function knows how to parse.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For information on how to format a
  /// JSON parameter for the various command line tool environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:
  ///
  /// <code>{"username":"bob","password":"abc123xyz456"}</code>
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text.
  ///
  /// Parameter [tags] :
  /// (Optional) Specifies a list of user-defined tags that are attached to the
  /// secret. Each tag is a "Key" and "Value" pair of strings. This operation
  /// only appends tags to the existing list of tags. To remove tags, you must
  /// use <a>UntagResource</a>.
  /// <important>
  /// <ul>
  /// <li>
  /// Secrets Manager tag key names are case sensitive. A tag with the key "ABC"
  /// is a different tag from one with key "abc".
  /// </li>
  /// <li>
  /// If you check tags in IAM policy <code>Condition</code> elements as part of
  /// your security strategy, then adding or removing a tag can change
  /// permissions. If the successful completion of this operation would result
  /// in you losing your permissions for this secret, then this operation is
  /// blocked and returns an <code>Access Denied</code> error.
  /// </li>
  /// </ul> </important>
  /// This parameter requires a JSON text string argument. For information on
  /// how to format a JSON parameter for the various command line tool
  /// environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:
  ///
  /// <code>[{"Key":"CostCenter","Value":"12345"},{"Key":"environment","Value":"production"}]</code>
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per secret—50
  /// </li>
  /// <li>
  /// Maximum key length—127 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length—255 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use the <code>aws:</code> prefix in your tag names or values
  /// because AWS reserves it for AWS use. You can't edit or delete tag names or
  /// values with this prefix. Tags with this prefix do not count against your
  /// tags per secret limit.
  /// </li>
  /// <li>
  /// If you use your tagging schema across multiple services and resources,
  /// remember other services might have restrictions on allowed characters.
  /// Generally allowed characters: letters, spaces, and numbers representable
  /// in UTF-8, plus the following special characters: + - = . _ : / @.
  /// </li>
  /// </ul>
  Future<CreateSecretResponse> createSecret({
    @_s.required String name,
    String clientRequestToken,
    String description,
    String kmsKeyId,
    Uint8List secretBinary,
    String secretString,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      512,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      0,
      2048,
    );
    _s.validateStringLength(
      'secretString',
      secretString,
      0,
      65536,
    );
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
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (secretBinary != null) 'SecretBinary': base64Encode(secretBinary),
        if (secretString != null) 'SecretString': secretString,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSecretResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the resource-based permission policy attached to the secret.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:DeleteResourcePolicy
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.
  /// </li>
  /// <li>
  /// To retrieve the current resource-based policy that's attached to a secret,
  /// use <a>GetResourcePolicy</a>.
  /// </li>
  /// <li>
  /// To list all of the currently available secrets, use <a>ListSecrets</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret that you want to delete the attached resource-based
  /// policy for. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy({
    @_s.required String secretId,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
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

  /// Deletes an entire secret and all of its versions. You can optionally
  /// include a recovery window during which you can restore the secret. If you
  /// don't specify a recovery window value, the operation defaults to 30 days.
  /// Secrets Manager attaches a <code>DeletionDate</code> stamp to the secret
  /// that specifies the end of the recovery window. At the end of the recovery
  /// window, Secrets Manager deletes the secret permanently.
  ///
  /// At any time before recovery window ends, you can use <a>RestoreSecret</a>
  /// to remove the <code>DeletionDate</code> and cancel the deletion of the
  /// secret.
  ///
  /// You cannot access the encrypted secret information in any secret that is
  /// scheduled for deletion. If you need to access that information, you must
  /// cancel the deletion with <a>RestoreSecret</a> and then retrieve the
  /// information.
  /// <note>
  /// <ul>
  /// <li>
  /// There is no explicit operation to delete a version of a secret. Instead,
  /// remove all staging labels from the <code>VersionStage</code> field of a
  /// version. That marks the version as deprecated and allows Secrets Manager
  /// to delete it as needed. Versions that do not have any staging labels do
  /// not show up in <a>ListSecretVersionIds</a> unless you specify
  /// <code>IncludeDeprecated</code>.
  /// </li>
  /// <li>
  /// The permanent secret deletion at the end of the waiting period is
  /// performed as a background task with low priority. There is no guarantee of
  /// a specific time after the recovery window for the actual delete operation
  /// to occur.
  /// </li>
  /// </ul> </note>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:DeleteSecret
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To create a secret, use <a>CreateSecret</a>.
  /// </li>
  /// <li>
  /// To cancel deletion of a version of a secret before the recovery window has
  /// expired, use <a>RestoreSecret</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret that you want to delete. You can specify either the
  /// Amazon Resource Name (ARN) or the friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [forceDeleteWithoutRecovery] :
  /// (Optional) Specifies that the secret is to be deleted without any recovery
  /// window. You can't use both this parameter and the
  /// <code>RecoveryWindowInDays</code> parameter in the same API call.
  ///
  /// An asynchronous background process performs the actual deletion, so there
  /// can be a short delay before the operation completes. If you write code to
  /// delete and then immediately recreate a secret with the same name, ensure
  /// that your code includes appropriate back off and retry logic.
  /// <important>
  /// Use this parameter with caution. This parameter causes the operation to
  /// skip the normal waiting period before the permanent deletion that AWS
  /// would normally impose with the <code>RecoveryWindowInDays</code>
  /// parameter. If you delete a secret with the
  /// <code>ForceDeleteWithouRecovery</code> parameter, then you have no
  /// opportunity to recover the secret. It is permanently lost.
  /// </important>
  ///
  /// Parameter [recoveryWindowInDays] :
  /// (Optional) Specifies the number of days that Secrets Manager waits before
  /// it can delete the secret. You can't use both this parameter and the
  /// <code>ForceDeleteWithoutRecovery</code> parameter in the same API call.
  ///
  /// This value can range from 7 to 30 days. The default value is 30.
  Future<DeleteSecretResponse> deleteSecret({
    @_s.required String secretId,
    bool forceDeleteWithoutRecovery,
    int recoveryWindowInDays,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
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
  /// fields. Secrets Manager only returns fields populated with a value in the
  /// response.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:DescribeSecret
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To create a secret, use <a>CreateSecret</a>.
  /// </li>
  /// <li>
  /// To modify a secret, use <a>UpdateSecret</a>.
  /// </li>
  /// <li>
  /// To retrieve the encrypted secret information in a version of the secret,
  /// use <a>GetSecretValue</a>.
  /// </li>
  /// <li>
  /// To list all of the secrets in the AWS account, use <a>ListSecrets</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The identifier of the secret whose details you want to retrieve. You can
  /// specify either the Amazon Resource Name (ARN) or the friendly name of the
  /// secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  Future<DescribeSecretResponse> describeSecret({
    @_s.required String secretId,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
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

  /// Generates a random password of the specified complexity. This operation is
  /// intended for use in the Lambda rotation function. Per best practice, we
  /// recommend that you specify the maximum length and include every character
  /// type that the system you are generating a password for can support.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:GetRandomPassword
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [excludeCharacters] :
  /// A string that includes characters that should not be included in the
  /// generated password. The default is that all characters from the included
  /// sets can be used.
  ///
  /// Parameter [excludeLowercase] :
  /// Specifies that the generated password should not include lowercase
  /// letters. The default if you do not include this switch parameter is that
  /// lowercase letters can be included.
  ///
  /// Parameter [excludeNumbers] :
  /// Specifies that the generated password should not include digits. The
  /// default if you do not include this switch parameter is that digits can be
  /// included.
  ///
  /// Parameter [excludePunctuation] :
  /// Specifies that the generated password should not include punctuation
  /// characters. The default if you do not include this switch parameter is
  /// that punctuation characters can be included.
  ///
  /// The following are the punctuation characters that <i>can</i> be included
  /// in the generated password if you don't explicitly exclude them with
  /// <code>ExcludeCharacters</code> or <code>ExcludePunctuation</code>:
  ///
  /// <code>! " # $ % &amp; ' ( ) * + , - . / : ; &lt; = &gt; ? @ [ \ ] ^ _ ` {
  /// | } ~</code>
  ///
  /// Parameter [excludeUppercase] :
  /// Specifies that the generated password should not include uppercase
  /// letters. The default if you do not include this switch parameter is that
  /// uppercase letters can be included.
  ///
  /// Parameter [includeSpace] :
  /// Specifies that the generated password can include the space character. The
  /// default if you do not include this switch parameter is that the space
  /// character is not included.
  ///
  /// Parameter [passwordLength] :
  /// The desired length of the generated password. The default value if you do
  /// not include this parameter is 32 characters.
  ///
  /// Parameter [requireEachIncludedType] :
  /// A boolean value that specifies whether the generated password must include
  /// at least one of every allowed character type. The default value is
  /// <code>True</code> and the operation requires at least one of every
  /// character type.
  Future<GetRandomPasswordResponse> getRandomPassword({
    String excludeCharacters,
    bool excludeLowercase,
    bool excludeNumbers,
    bool excludePunctuation,
    bool excludeUppercase,
    bool includeSpace,
    int passwordLength,
    bool requireEachIncludedType,
  }) async {
    _s.validateStringLength(
      'excludeCharacters',
      excludeCharacters,
      0,
      4096,
    );
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
  /// the specified secret. The JSON request string input and response output
  /// displays formatted code with white space and line breaks for better
  /// readability. Submit your input as a single line JSON string.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:GetResourcePolicy
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To attach a resource policy to a secret, use <a>PutResourcePolicy</a>.
  /// </li>
  /// <li>
  /// To delete the resource-based policy attached to a secret, use
  /// <a>DeleteResourcePolicy</a>.
  /// </li>
  /// <li>
  /// To list all of the currently available secrets, use <a>ListSecrets</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret that you want to retrieve the attached resource-based
  /// policy for. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  Future<GetResourcePolicyResponse> getResourcePolicy({
    @_s.required String secretId,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
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
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:GetSecretValue
  /// </li>
  /// <li>
  /// kms:Decrypt - required only if you use a customer-managed AWS KMS key to
  /// encrypt the secret. You do not need this permission to use the account's
  /// default AWS managed CMK for Secrets Manager.
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To create a new version of the secret with different encrypted
  /// information, use <a>PutSecretValue</a>.
  /// </li>
  /// <li>
  /// To retrieve the non-encrypted details for the secret, use
  /// <a>DescribeSecret</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [DecryptionFailure].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret containing the version that you want to retrieve. You
  /// can specify either the Amazon Resource Name (ARN) or the friendly name of
  /// the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [versionId] :
  /// Specifies the unique identifier of the version of the secret that you want
  /// to retrieve. If you specify this parameter then don't specify
  /// <code>VersionStage</code>. If you don't specify either a
  /// <code>VersionStage</code> or <code>VersionId</code> then the default is to
  /// perform the operation on the version with the <code>VersionStage</code>
  /// value of <code>AWSCURRENT</code>.
  ///
  /// This value is typically a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value with 32 hexadecimal digits.
  ///
  /// Parameter [versionStage] :
  /// Specifies the secret version that you want to retrieve by the staging
  /// label attached to the version.
  ///
  /// Staging labels are used to keep track of different versions during the
  /// rotation process. If you use this parameter then don't specify
  /// <code>VersionId</code>. If you don't specify either a
  /// <code>VersionStage</code> or <code>VersionId</code>, then the default is
  /// to perform the operation on the version with the <code>VersionStage</code>
  /// value of <code>AWSCURRENT</code>.
  Future<GetSecretValueResponse> getSecretValue({
    @_s.required String secretId,
    String versionId,
    String versionStage,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'versionId',
      versionId,
      32,
      64,
    );
    _s.validateStringLength(
      'versionStage',
      versionStage,
      1,
      256,
    );
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

  /// Lists all of the versions attached to the specified secret. The output
  /// does not include the <code>SecretString</code> or
  /// <code>SecretBinary</code> fields. By default, the list includes only
  /// versions that have at least one staging label in <code>VersionStage</code>
  /// attached.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter when calling
  /// any of the <code>List*</code> operations. These operations can
  /// occasionally return an empty or shorter than expected list of results even
  /// when there more results become available. When this happens, the
  /// <code>NextToken</code> response parameter contains a value to pass to the
  /// next call to the same API to request the next part of the list.
  /// </note>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:ListSecretVersionIds
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To list the secrets in an account, use <a>ListSecrets</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The identifier for the secret containing the versions you want to list.
  /// You can specify either the Amazon Resource Name (ARN) or the friendly name
  /// of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [includeDeprecated] :
  /// (Optional) Specifies that you want the results to include versions that do
  /// not have any staging labels attached to them. Such versions are considered
  /// deprecated and are subject to deletion by Secrets Manager as needed.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results you want to include in the
  /// response. If you don't include this parameter, it defaults to a value
  /// that's specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (isn't null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Secrets Manager might
  /// return fewer results than the maximum even when there are more results
  /// available. You should check <code>NextToken</code> after every operation
  /// to ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request indicating there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call <code>NextToken</code> response to indicate where the output
  /// should continue from.
  Future<ListSecretVersionIdsResponse> listSecretVersionIds({
    @_s.required String secretId,
    bool includeDeprecated,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
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

  /// Lists all of the secrets that are stored by Secrets Manager in the AWS
  /// account. To list the versions currently stored for a specific secret, use
  /// <a>ListSecretVersionIds</a>. The encrypted fields
  /// <code>SecretString</code> and <code>SecretBinary</code> are not included
  /// in the output. To get that information, call the <a>GetSecretValue</a>
  /// operation.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter when calling
  /// any of the <code>List*</code> operations. These operations can
  /// occasionally return an empty or shorter than expected list of results even
  /// when there more results become available. When this happens, the
  /// <code>NextToken</code> response parameter contains a value to pass to the
  /// next call to the same API to request the next part of the list.
  /// </note>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:ListSecrets
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To list the versions attached to a secret, use
  /// <a>ListSecretVersionIds</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [filters] :
  /// Lists the secret request filters.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results you want to include in the
  /// response. If you don't include this parameter, it defaults to a value
  /// that's specific to the operation. If additional items exist beyond the
  /// maximum you specify, the <code>NextToken</code> response element is
  /// present and has a value (isn't null). Include that value as the
  /// <code>NextToken</code> request parameter in the next call to the operation
  /// to get the next part of the results. Note that Secrets Manager might
  /// return fewer results than the maximum even when there are more results
  /// available. You should check <code>NextToken</code> after every operation
  /// to ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request indicating there's
  /// more output available. In a subsequent call, set it to the value of the
  /// previous call <code>NextToken</code> response to indicate where the output
  /// should continue from.
  ///
  /// Parameter [sortOrder] :
  /// Lists secrets in the requested order.
  Future<ListSecretsResponse> listSecrets({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    SortOrderType sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return ListSecretsResponse.fromJson(jsonResponse.body);
  }

  /// Attaches the contents of the specified resource-based permission policy to
  /// a secret. A resource-based policy is optional. Alternatively, you can use
  /// IAM identity-based policies that specify the secret's Amazon Resource Name
  /// (ARN) in the policy statement's <code>Resources</code> element. You can
  /// also use a combination of both identity-based and resource-based policies.
  /// The affected users and roles receive the permissions that are permitted by
  /// all of the relevant policies. For more information, see <a
  /// href="http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html">Using
  /// Resource-Based Policies for AWS Secrets Manager</a>. For the complete
  /// description of the AWS policy syntax and grammar, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM
  /// JSON Policy Reference</a> in the <i>IAM User Guide</i>.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:PutResourcePolicy
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To retrieve the resource policy attached to a secret, use
  /// <a>GetResourcePolicy</a>.
  /// </li>
  /// <li>
  /// To delete the resource-based policy that's attached to a secret, use
  /// <a>DeleteResourcePolicy</a>.
  /// </li>
  /// <li>
  /// To list all of the currently available secrets, use <a>ListSecrets</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  /// May throw [PublicPolicyException].
  ///
  /// Parameter [resourcePolicy] :
  /// A JSON-formatted string that's constructed according to the grammar and
  /// syntax for an AWS resource-based policy. The policy in the string
  /// identifies who can access or manage this secret and its versions. For
  /// information on how to format a JSON parameter for the various command line
  /// tool environments, see <a
  /// href="http://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.
  ///
  /// Parameter [secretId] :
  /// Specifies the secret that you want to attach the resource-based policy to.
  /// You can specify either the ARN or the friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [blockPublicPolicy] :
  /// Makes an optional API call to Zelkova to validate the Resource Policy to
  /// prevent broad access to your secret.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    @_s.required String resourcePolicy,
    @_s.required String secretId,
    bool blockPublicPolicy,
  }) async {
    ArgumentError.checkNotNull(resourcePolicy, 'resourcePolicy');
    _s.validateStringLength(
      'resourcePolicy',
      resourcePolicy,
      1,
      20480,
      isRequired: true,
    );
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
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

  /// Stores a new encrypted secret value in the specified secret. To do this,
  /// the operation creates a new version and attaches it to the secret. The
  /// version can contain a new <code>SecretString</code> value or a new
  /// <code>SecretBinary</code> value. You can also specify the staging labels
  /// that are initially attached to the new version.
  /// <note>
  /// The Secrets Manager console uses only the <code>SecretString</code> field.
  /// To add binary data to a secret with the <code>SecretBinary</code> field
  /// you must use the AWS CLI or one of the AWS SDKs.
  /// </note>
  /// <ul>
  /// <li>
  /// If this operation creates the first version for the secret then Secrets
  /// Manager automatically attaches the staging label <code>AWSCURRENT</code>
  /// to the new version.
  /// </li>
  /// <li>
  /// If another version of this secret already exists, then this operation does
  /// not automatically move any staging labels other than those that you
  /// explicitly specify in the <code>VersionStages</code> parameter.
  /// </li>
  /// <li>
  /// If this operation moves the staging label <code>AWSCURRENT</code> from
  /// another version to this version (because you included it in the
  /// <code>StagingLabels</code> parameter) then Secrets Manager also
  /// automatically moves the staging label <code>AWSPREVIOUS</code> to the
  /// version that <code>AWSCURRENT</code> was removed from.
  /// </li>
  /// <li>
  /// This operation is idempotent. If a version with a <code>VersionId</code>
  /// with the same value as the <code>ClientRequestToken</code> parameter
  /// already exists and you specify the same secret data, the operation
  /// succeeds but does nothing. However, if the secret data is different, then
  /// the operation fails because you cannot modify an existing version; you can
  /// only create new ones.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If you call an operation to encrypt or decrypt the
  /// <code>SecretString</code> or <code>SecretBinary</code> for a secret in the
  /// same account as the calling user and that secret doesn't specify a AWS KMS
  /// encryption key, Secrets Manager uses the account's default AWS managed
  /// customer master key (CMK) with the alias <code>aws/secretsmanager</code>.
  /// If this key doesn't already exist in your account then Secrets Manager
  /// creates it for you automatically. All users and roles in the same AWS
  /// account automatically have access to use the default CMK. Note that if an
  /// Secrets Manager API call results in AWS creating the account's AWS-managed
  /// CMK, it can result in a one-time significant delay in returning the
  /// result.
  /// </li>
  /// <li>
  /// If the secret resides in a different AWS account from the credentials
  /// calling an API that requires encryption or decryption of the secret value
  /// then you must create and use a custom AWS KMS CMK because you can't access
  /// the default CMK for the account using credentials from a different AWS
  /// account. Store the ARN of the CMK in the secret when you create the secret
  /// or when you update it by including it in the <code>KMSKeyId</code>. If you
  /// call an API that must encrypt or decrypt <code>SecretString</code> or
  /// <code>SecretBinary</code> using credentials from a different account then
  /// the AWS KMS key policy must grant cross-account access to that other
  /// account's user or role for both the kms:GenerateDataKey and kms:Decrypt
  /// operations.
  /// </li>
  /// </ul> </note>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:PutSecretValue
  /// </li>
  /// <li>
  /// kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS
  /// key to encrypt the secret. You do not need this permission to use the
  /// account's default AWS managed CMK for Secrets Manager.
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To retrieve the encrypted value you store in the version of a secret, use
  /// <a>GetSecretValue</a>.
  /// </li>
  /// <li>
  /// To create a secret, use <a>CreateSecret</a>.
  /// </li>
  /// <li>
  /// To get the details for a secret, use <a>DescribeSecret</a>.
  /// </li>
  /// <li>
  /// To list the versions attached to a secret, use
  /// <a>ListSecretVersionIds</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [EncryptionFailure].
  /// May throw [ResourceExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret to which you want to add a new version. You can
  /// specify either the Amazon Resource Name (ARN) or the friendly name of the
  /// secret. The secret must already exist.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) Specifies a unique identifier for the new version of the
  /// secret.
  /// <note>
  /// If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request. If you don't use the SDK and
  /// instead generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a <code>ClientRequestToken</code>
  /// yourself for new versions and include that value in the request.
  /// </note>
  /// This value helps ensure idempotency. Secrets Manager uses this value to
  /// prevent the accidental creation of duplicate versions if there are
  /// failures and retries during the Lambda rotation function's processing. We
  /// recommend that you generate a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value to ensure uniqueness within the specified secret.
  ///
  /// <ul>
  /// <li>
  /// If the <code>ClientRequestToken</code> value isn't already associated with
  /// a version of the secret then a new version of the secret is created.
  /// </li>
  /// <li>
  /// If a version with this value already exists and that version's
  /// <code>SecretString</code> or <code>SecretBinary</code> values are the same
  /// as those in the request then the request is ignored (the operation is
  /// idempotent).
  /// </li>
  /// <li>
  /// If a version with this value already exists and the version of the
  /// <code>SecretString</code> and <code>SecretBinary</code> values are
  /// different from those in the request then the request fails because you
  /// cannot modify an existing secret version. You can only create new versions
  /// to store new secret values.
  /// </li>
  /// </ul>
  /// This value becomes the <code>VersionId</code> of the new version.
  ///
  /// Parameter [secretBinary] :
  /// (Optional) Specifies binary data that you want to encrypt and store in the
  /// new version of the secret. To use this parameter in the command-line
  /// tools, we recommend that you store your binary data in a file and then use
  /// the appropriate technique for your tool to pass the contents of the file
  /// as a parameter. Either <code>SecretBinary</code> or
  /// <code>SecretString</code> must have a value, but not both. They cannot
  /// both be empty.
  ///
  /// This parameter is not accessible if the secret using the Secrets Manager
  /// console.
  /// <p/>
  ///
  /// Parameter [secretString] :
  /// (Optional) Specifies text data that you want to encrypt and store in this
  /// new version of the secret. Either <code>SecretString</code> or
  /// <code>SecretBinary</code> must have a value, but not both. They cannot
  /// both be empty.
  ///
  /// If you create this secret by using the Secrets Manager console then
  /// Secrets Manager puts the protected secret text in only the
  /// <code>SecretString</code> parameter. The Secrets Manager console stores
  /// the information as a JSON structure of key/value pairs that the default
  /// Lambda rotation function knows how to parse.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For information on how to format a
  /// JSON parameter for the various command line tool environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.
  ///
  /// For example:
  ///
  /// <code>[{"username":"bob"},{"password":"abc123xyz456"}]</code>
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text.
  ///
  /// Parameter [versionStages] :
  /// (Optional) Specifies a list of staging labels that are attached to this
  /// version of the secret. These staging labels are used to track the versions
  /// through the rotation process by the Lambda rotation function.
  ///
  /// A staging label must be unique to a single version of the secret. If you
  /// specify a staging label that's already associated with a different version
  /// of the same secret then that staging label is automatically removed from
  /// the other version and attached to this version.
  ///
  /// If you do not specify a value for <code>VersionStages</code> then Secrets
  /// Manager automatically moves the staging label <code>AWSCURRENT</code> to
  /// this new version.
  Future<PutSecretValueResponse> putSecretValue({
    @_s.required String secretId,
    String clientRequestToken,
    Uint8List secretBinary,
    String secretString,
    List<String> versionStages,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringLength(
      'secretString',
      secretString,
      0,
      65536,
    );
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

  /// Cancels the scheduled deletion of a secret by removing the
  /// <code>DeletedDate</code> time stamp. This makes the secret accessible to
  /// query once again.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:RestoreSecret
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To delete a secret, use <a>DeleteSecret</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret that you want to restore from a previously scheduled
  /// deletion. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  Future<RestoreSecretResponse> restoreSecret({
    @_s.required String secretId,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
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

  /// Configures and starts the asynchronous process of rotating this secret. If
  /// you include the configuration parameters, the operation sets those values
  /// for the secret and then immediately starts a rotation. If you do not
  /// include the configuration parameters, the operation starts a rotation with
  /// the values already stored in the secret. After the rotation completes, the
  /// protected service and its clients all use the new version of the secret.
  ///
  /// This required configuration information includes the ARN of an AWS Lambda
  /// function and the time between scheduled rotations. The Lambda rotation
  /// function creates a new version of the secret and creates or updates the
  /// credentials on the protected service to match. After testing the new
  /// credentials, the function marks the new secret with the staging label
  /// <code>AWSCURRENT</code> so that your clients all immediately begin to use
  /// the new version. For more information about rotating secrets and how to
  /// configure a Lambda function to rotate the secrets for your protected
  /// service, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html">Rotating
  /// Secrets in AWS Secrets Manager</a> in the <i>AWS Secrets Manager User
  /// Guide</i>.
  ///
  /// Secrets Manager schedules the next rotation when the previous one
  /// completes. Secrets Manager schedules the date by adding the rotation
  /// interval (number of days) to the actual date of the last rotation. The
  /// service chooses the hour within that 24-hour date window randomly. The
  /// minute is also chosen somewhat randomly, but weighted towards the top of
  /// the hour and influenced by a variety of factors that help distribute load.
  ///
  /// The rotation function must end with the versions of the secret in one of
  /// two states:
  ///
  /// <ul>
  /// <li>
  /// The <code>AWSPENDING</code> and <code>AWSCURRENT</code> staging labels are
  /// attached to the same version of the secret, or
  /// </li>
  /// <li>
  /// The <code>AWSPENDING</code> staging label is not attached to any version
  /// of the secret.
  /// </li>
  /// </ul>
  /// If the <code>AWSPENDING</code> staging label is present but not attached
  /// to the same version as <code>AWSCURRENT</code> then any later invocation
  /// of <code>RotateSecret</code> assumes that a previous rotation request is
  /// still in progress and returns an error.
  ///
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:RotateSecret
  /// </li>
  /// <li>
  /// lambda:InvokeFunction (on the function specified in the secret's metadata)
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To list the secrets in your account, use <a>ListSecrets</a>.
  /// </li>
  /// <li>
  /// To get the details for a version of a secret, use <a>DescribeSecret</a>.
  /// </li>
  /// <li>
  /// To create a new version of a secret, use <a>CreateSecret</a>.
  /// </li>
  /// <li>
  /// To attach staging labels to or remove staging labels from a version of a
  /// secret, use <a>UpdateSecretVersionStage</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret that you want to rotate. You can specify either the
  /// Amazon Resource Name (ARN) or the friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) Specifies a unique identifier for the new version of the secret
  /// that helps ensure idempotency.
  ///
  /// If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request for this parameter. If you don't
  /// use the SDK and instead generate a raw HTTP request to the Secrets Manager
  /// service endpoint, then you must generate a <code>ClientRequestToken</code>
  /// yourself for new versions and include that value in the request.
  ///
  /// You only need to specify your own value if you implement your own retry
  /// logic and want to ensure that a given secret is not created twice. We
  /// recommend that you generate a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value to ensure uniqueness within the specified secret.
  ///
  /// Secrets Manager uses this value to prevent the accidental creation of
  /// duplicate versions if there are failures and retries during the function's
  /// processing. This value becomes the <code>VersionId</code> of the new
  /// version.
  ///
  /// Parameter [rotationLambdaARN] :
  /// (Optional) Specifies the ARN of the Lambda function that can rotate the
  /// secret.
  ///
  /// Parameter [rotationRules] :
  /// A structure that defines the rotation configuration for this secret.
  Future<RotateSecretResponse> rotateSecret({
    @_s.required String secretId,
    String clientRequestToken,
    String rotationLambdaARN,
    RotationRulesType rotationRules,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringLength(
      'rotationLambdaARN',
      rotationLambdaARN,
      0,
      2048,
    );
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
        if (rotationLambdaARN != null) 'RotationLambdaARN': rotationLambdaARN,
        if (rotationRules != null) 'RotationRules': rotationRules,
      },
    );

    return RotateSecretResponse.fromJson(jsonResponse.body);
  }

  /// Attaches one or more tags, each consisting of a key name and a value, to
  /// the specified secret. Tags are part of the secret's overall metadata, and
  /// are not associated with any specific version of the secret. This operation
  /// only appends tags to the existing list of tags. To remove tags, you must
  /// use <a>UntagResource</a>.
  ///
  /// The following basic restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of tags per secret—50
  /// </li>
  /// <li>
  /// Maximum key length—127 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Maximum value length—255 Unicode characters in UTF-8
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Do not use the <code>aws:</code> prefix in your tag names or values
  /// because AWS reserves it for AWS use. You can't edit or delete tag names or
  /// values with this prefix. Tags with this prefix do not count against your
  /// tags per secret limit.
  /// </li>
  /// <li>
  /// If you use your tagging schema across multiple services and resources,
  /// remember other services might have restrictions on allowed characters.
  /// Generally allowed characters: letters, spaces, and numbers representable
  /// in UTF-8, plus the following special characters: + - = . _ : / @.
  /// </li>
  /// </ul> <important>
  /// If you use tags as part of your security strategy, then adding or removing
  /// a tag can change permissions. If successfully completing this operation
  /// would result in you losing your permissions for this secret, then the
  /// operation is blocked and returns an Access Denied error.
  /// </important>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:TagResource
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To remove one or more tags from the collection attached to a secret, use
  /// <a>UntagResource</a>.
  /// </li>
  /// <li>
  /// To view the list of tags attached to a secret, use <a>DescribeSecret</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The identifier for the secret that you want to attach tags to. You can
  /// specify either the Amazon Resource Name (ARN) or the friendly name of the
  /// secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags to attach to the secret. Each element in the list consists of a
  /// <code>Key</code> and a <code>Value</code>.
  ///
  /// This parameter to the API requires a JSON text string argument. For
  /// information on how to format a JSON parameter for the various command line
  /// tool environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For the AWS CLI,
  /// you can also use the syntax: <code>--Tags
  /// Key="Key1",Value="Value1",Key="Key2",Value="Value2"[,…]</code>
  Future<void> tagResource({
    @_s.required String secretId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

  /// Removes one or more tags from the specified secret.
  ///
  /// This operation is idempotent. If a requested tag is not attached to the
  /// secret, no error is returned and the secret metadata is unchanged.
  /// <important>
  /// If you use tags as part of your security strategy, then removing a tag can
  /// change permissions. If successfully completing this operation would result
  /// in you losing your permissions for this secret, then the operation is
  /// blocked and returns an Access Denied error.
  /// </important>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:UntagResource
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To add one or more tags to the collection attached to a secret, use
  /// <a>TagResource</a>.
  /// </li>
  /// <li>
  /// To view the list of tags attached to a secret, use <a>DescribeSecret</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// The identifier for the secret that you want to remove tags from. You can
  /// specify either the Amazon Resource Name (ARN) or the friendly name of the
  /// secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [tagKeys] :
  /// A list of tag key names to remove from the secret. You don't specify the
  /// value. Both the key and its associated value are removed.
  ///
  /// This parameter to the API requires a JSON text string argument. For
  /// information on how to format a JSON parameter for the various command line
  /// tool environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>.
  Future<void> untagResource({
    @_s.required String secretId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'secretsmanager.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

  /// Modifies many of the details of the specified secret. If you include a
  /// <code>ClientRequestToken</code> and <i>either</i>
  /// <code>SecretString</code> or <code>SecretBinary</code> then it also
  /// creates a new version attached to the secret.
  ///
  /// To modify the rotation configuration of a secret, use <a>RotateSecret</a>
  /// instead.
  /// <note>
  /// The Secrets Manager console uses only the <code>SecretString</code>
  /// parameter and therefore limits you to encrypting and storing only a text
  /// string. To encrypt and store binary data as part of the version of a
  /// secret, you must use either the AWS CLI or one of the AWS SDKs.
  /// </note>
  /// <ul>
  /// <li>
  /// If a version with a <code>VersionId</code> with the same value as the
  /// <code>ClientRequestToken</code> parameter already exists, the operation
  /// results in an error. You cannot modify an existing version, you can only
  /// create a new version.
  /// </li>
  /// <li>
  /// If you include <code>SecretString</code> or <code>SecretBinary</code> to
  /// create a new secret version, Secrets Manager automatically attaches the
  /// staging label <code>AWSCURRENT</code> to the new version.
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// If you call an operation to encrypt or decrypt the
  /// <code>SecretString</code> or <code>SecretBinary</code> for a secret in the
  /// same account as the calling user and that secret doesn't specify a AWS KMS
  /// encryption key, Secrets Manager uses the account's default AWS managed
  /// customer master key (CMK) with the alias <code>aws/secretsmanager</code>.
  /// If this key doesn't already exist in your account then Secrets Manager
  /// creates it for you automatically. All users and roles in the same AWS
  /// account automatically have access to use the default CMK. Note that if an
  /// Secrets Manager API call results in AWS creating the account's AWS-managed
  /// CMK, it can result in a one-time significant delay in returning the
  /// result.
  /// </li>
  /// <li>
  /// If the secret resides in a different AWS account from the credentials
  /// calling an API that requires encryption or decryption of the secret value
  /// then you must create and use a custom AWS KMS CMK because you can't access
  /// the default CMK for the account using credentials from a different AWS
  /// account. Store the ARN of the CMK in the secret when you create the secret
  /// or when you update it by including it in the <code>KMSKeyId</code>. If you
  /// call an API that must encrypt or decrypt <code>SecretString</code> or
  /// <code>SecretBinary</code> using credentials from a different account then
  /// the AWS KMS key policy must grant cross-account access to that other
  /// account's user or role for both the kms:GenerateDataKey and kms:Decrypt
  /// operations.
  /// </li>
  /// </ul> </note>
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:UpdateSecret
  /// </li>
  /// <li>
  /// kms:GenerateDataKey - needed only if you use a custom AWS KMS key to
  /// encrypt the secret. You do not need this permission to use the account's
  /// AWS managed CMK for Secrets Manager.
  /// </li>
  /// <li>
  /// kms:Decrypt - needed only if you use a custom AWS KMS key to encrypt the
  /// secret. You do not need this permission to use the account's AWS managed
  /// CMK for Secrets Manager.
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To create a new secret, use <a>CreateSecret</a>.
  /// </li>
  /// <li>
  /// To add only a new version to an existing secret, use
  /// <a>PutSecretValue</a>.
  /// </li>
  /// <li>
  /// To get the details for a secret, use <a>DescribeSecret</a>.
  /// </li>
  /// <li>
  /// To list the versions contained in a secret, use
  /// <a>ListSecretVersionIds</a>.
  /// </li>
  /// </ul>
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
  ///
  /// Parameter [secretId] :
  /// Specifies the secret that you want to modify or to which you want to add a
  /// new version. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) If you want to add a new version to the secret, this parameter
  /// specifies a unique identifier for the new version that helps ensure
  /// idempotency.
  ///
  /// If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request. If you don't use the SDK and
  /// instead generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a <code>ClientRequestToken</code>
  /// yourself for new versions and include that value in the request.
  ///
  /// You typically only need to interact with this value if you implement your
  /// own retry logic and want to ensure that a given secret is not created
  /// twice. We recommend that you generate a <a
  /// href="https://wikipedia.org/wiki/Universally_unique_identifier">UUID-type</a>
  /// value to ensure uniqueness within the specified secret.
  ///
  /// Secrets Manager uses this value to prevent the accidental creation of
  /// duplicate versions if there are failures and retries during the Lambda
  /// rotation function's processing.
  ///
  /// <ul>
  /// <li>
  /// If the <code>ClientRequestToken</code> value isn't already associated with
  /// a version of the secret then a new version of the secret is created.
  /// </li>
  /// <li>
  /// If a version with this value already exists and that version's
  /// <code>SecretString</code> and <code>SecretBinary</code> values are the
  /// same as those in the request then the request is ignored (the operation is
  /// idempotent).
  /// </li>
  /// <li>
  /// If a version with this value already exists and that version's
  /// <code>SecretString</code> and <code>SecretBinary</code> values are
  /// different from the request then an error occurs because you cannot modify
  /// an existing secret value.
  /// </li>
  /// </ul>
  /// This value becomes the <code>VersionId</code> of the new version.
  ///
  /// Parameter [description] :
  /// (Optional) Specifies an updated user-provided description of the secret.
  ///
  /// Parameter [kmsKeyId] :
  /// (Optional) Specifies an updated ARN or alias of the AWS KMS customer
  /// master key (CMK) to be used to encrypt the protected text in new versions
  /// of this secret.
  /// <important>
  /// You can only use the account's default CMK to encrypt and decrypt if you
  /// call this operation using credentials from the same account that owns the
  /// secret. If the secret is in a different account, then you must create a
  /// custom CMK and provide the ARN of that CMK in this field. The user making
  /// the call must have permissions to both the secret and the CMK in their
  /// respective accounts.
  /// </important>
  ///
  /// Parameter [secretBinary] :
  /// (Optional) Specifies updated binary data that you want to encrypt and
  /// store in the new version of the secret. To use this parameter in the
  /// command-line tools, we recommend that you store your binary data in a file
  /// and then use the appropriate technique for your tool to pass the contents
  /// of the file as a parameter. Either <code>SecretBinary</code> or
  /// <code>SecretString</code> must have a value, but not both. They cannot
  /// both be empty.
  ///
  /// This parameter is not accessible using the Secrets Manager console.
  ///
  /// Parameter [secretString] :
  /// (Optional) Specifies updated text data that you want to encrypt and store
  /// in this new version of the secret. Either <code>SecretBinary</code> or
  /// <code>SecretString</code> must have a value, but not both. They cannot
  /// both be empty.
  ///
  /// If you create this secret by using the Secrets Manager console then
  /// Secrets Manager puts the protected secret text in only the
  /// <code>SecretString</code> parameter. The Secrets Manager console stores
  /// the information as a JSON structure of key/value pairs that the default
  /// Lambda rotation function knows how to parse.
  ///
  /// For storing multiple values, we recommend that you use a JSON text string
  /// argument and specify key/value pairs. For information on how to format a
  /// JSON parameter for the various command line tool environments, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a> in the <i>AWS CLI User Guide</i>. For example:
  ///
  /// <code>[{"username":"bob"},{"password":"abc123xyz456"}]</code>
  ///
  /// If your command-line tool or SDK requires quotation marks around the
  /// parameter, you should use single quotes to avoid confusion with the double
  /// quotes required in the JSON text. You can also 'escape' the double quote
  /// character in the embedded JSON text by prefacing each with a backslash.
  /// For example, the following string is surrounded by double-quotes. All of
  /// the embedded double quotes are escaped:
  ///
  /// <code>"[{\"username\":\"bob\"},{\"password\":\"abc123xyz456\"}]"</code>
  Future<UpdateSecretResponse> updateSecret({
    @_s.required String secretId,
    String clientRequestToken,
    String description,
    String kmsKeyId,
    Uint8List secretBinary,
    String secretString,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      32,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2048,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      0,
      2048,
    );
    _s.validateStringLength(
      'secretString',
      secretString,
      0,
      65536,
    );
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

  /// Modifies the staging labels attached to a version of a secret. Staging
  /// labels are used to track a version as it progresses through the secret
  /// rotation process. You can attach a staging label to only one version of a
  /// secret at a time. If a staging label to be added is already attached to
  /// another version, then it is moved--removed from the other version first
  /// and then attached to this one. For more information about staging labels,
  /// see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/terms-concepts.html#term_staging-label">Staging
  /// Labels</a> in the <i>AWS Secrets Manager User Guide</i>.
  ///
  /// The staging labels that you specify in the <code>VersionStage</code>
  /// parameter are added to the existing list of staging labels--they don't
  /// replace it.
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
  /// <b>Minimum permissions</b>
  ///
  /// To run this command, you must have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// secretsmanager:UpdateSecretVersionStage
  /// </li>
  /// </ul>
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To get the list of staging labels that are currently associated with a
  /// version of a secret, use <code> <a>DescribeSecret</a> </code> and examine
  /// the <code>SecretVersionsToStages</code> response value.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceError].
  ///
  /// Parameter [secretId] :
  /// Specifies the secret with the version with the list of staging labels you
  /// want to modify. You can specify either the Amazon Resource Name (ARN) or
  /// the friendly name of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  ///
  /// Parameter [versionStage] :
  /// The staging label to add to this version.
  ///
  /// Parameter [moveToVersionId] :
  /// (Optional) The secret version ID that you want to add the staging label.
  /// If you want to remove a label from a version, then do not specify this
  /// parameter.
  ///
  /// If the staging label is already attached to a different version of the
  /// secret, then you must also specify the <code>RemoveFromVersionId</code>
  /// parameter.
  ///
  /// Parameter [removeFromVersionId] :
  /// Specifies the secret version ID of the version that the staging label is
  /// to be removed from. If the staging label you are trying to attach to one
  /// version is already attached to a different version, then you must include
  /// this parameter and specify the version that the label is to be removed
  /// from. If the label is attached and you either do not specify this
  /// parameter, or the version ID does not match, then the operation fails.
  Future<UpdateSecretVersionStageResponse> updateSecretVersionStage({
    @_s.required String secretId,
    @_s.required String versionStage,
    String moveToVersionId,
    String removeFromVersionId,
  }) async {
    ArgumentError.checkNotNull(secretId, 'secretId');
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionStage, 'versionStage');
    _s.validateStringLength(
      'versionStage',
      versionStage,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'moveToVersionId',
      moveToVersionId,
      32,
      64,
    );
    _s.validateStringLength(
      'removeFromVersionId',
      removeFromVersionId,
      32,
      64,
    );
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

  /// Validates the JSON text of the resource-based policy document attached to
  /// the specified secret. The JSON request string input and response output
  /// displays formatted code with white space and line breaks for better
  /// readability. Submit your input as a single line JSON string. A
  /// resource-based policy is optional.
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServiceError].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [resourcePolicy] :
  /// Identifies the Resource Policy attached to the secret.
  ///
  /// Parameter [secretId] :
  /// The identifier for the secret that you want to validate a resource policy.
  /// You can specify either the Amazon Resource Name (ARN) or the friendly name
  /// of the secret.
  /// <note>
  /// If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you try
  /// to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names ending with a hyphen followed by six characters.
  ///
  /// If you specify an incomplete ARN without the random suffix, and instead
  /// provide the 'friendly name', you <i>must</i> not include the random
  /// suffix. If you do include the random suffix added by Secrets Manager, you
  /// receive either a <i>ResourceNotFoundException</i> or an
  /// <i>AccessDeniedException</i> error, depending on your permissions.
  /// </note>
  Future<ValidateResourcePolicyResponse> validateResourcePolicy({
    @_s.required String resourcePolicy,
    String secretId,
  }) async {
    ArgumentError.checkNotNull(resourcePolicy, 'resourcePolicy');
    _s.validateStringLength(
      'resourcePolicy',
      resourcePolicy,
      1,
      20480,
      isRequired: true,
    );
    _s.validateStringLength(
      'secretId',
      secretId,
      1,
      2048,
    );
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelRotateSecretResponse {
  /// The ARN of the secret for which rotation was canceled.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret for which rotation was canceled.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier of the version of the secret created during the
  /// rotation. This version might not be complete, and should be evaluated for
  /// possible deletion. At the very least, you should remove the
  /// <code>VersionStage</code> value <code>AWSPENDING</code> to enable this
  /// version to be deleted. Failing to clean up a cancelled rotation can block
  /// you from successfully starting future rotations.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  CancelRotateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  factory CancelRotateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelRotateSecretResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSecretResponse {
  /// The Amazon Resource Name (ARN) of the secret that you just created.
  /// <note>
  /// Secrets Manager automatically adds several random characters to the name at
  /// the end of the ARN when you initially create a secret. This affects only the
  /// ARN and not the actual friendly name. This ensures that if you create a new
  /// secret with the same name as an old secret that you previously deleted, then
  /// users with access to the old secret <i>don't</i> automatically get access to
  /// the new secret because the ARNs are different.
  /// </note>
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret that you just created.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier associated with the version of the secret you just
  /// created.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  CreateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  factory CreateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSecretResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was deleted for.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret that the resource-based policy was deleted
  /// for.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteResourcePolicyResponse({
    this.arn,
    this.name,
  });
  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSecretResponse {
  /// The ARN of the secret that is now scheduled for deletion.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The date and time after which this secret can be deleted by Secrets Manager
  /// and can no longer be restored. This value is the date and time of the delete
  /// request plus the number of days specified in
  /// <code>RecoveryWindowInDays</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeletionDate')
  final DateTime deletionDate;

  /// The friendly name of the secret that is now scheduled for deletion.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteSecretResponse({
    this.arn,
    this.deletionDate,
    this.name,
  });
  factory DeleteSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSecretResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSecretResponse {
  /// The ARN of the secret.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The date that the secret was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// This value exists if the secret is scheduled for deletion. Some time after
  /// the specified date and time, Secrets Manager deletes the secret and all of
  /// its versions.
  ///
  /// If a secret is scheduled for deletion, then its details, including the
  /// encrypted secret information, is not accessible. To cancel a scheduled
  /// deletion and restore access, use <a>RestoreSecret</a>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeletedDate')
  final DateTime deletedDate;

  /// The user-provided description of the secret.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN or alias of the AWS KMS customer master key (CMK) that's used to
  /// encrypt the <code>SecretString</code> or <code>SecretBinary</code> fields in
  /// each version of the secret. If you don't provide a key, then Secrets Manager
  /// defaults to encrypting the secret fields with the default AWS KMS CMK (the
  /// one named <code>awssecretsmanager</code>) for this account.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The last date that this secret was accessed. This value is truncated to
  /// midnight of the date and therefore shows only the date, not the time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastAccessedDate')
  final DateTime lastAccessedDate;

  /// The last date and time that this secret was modified in any way.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastChangedDate')
  final DateTime lastChangedDate;

  /// The most recent date and time that the Secrets Manager rotation process was
  /// successfully completed. This value is null if the secret has never rotated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastRotatedDate')
  final DateTime lastRotatedDate;

  /// The user-provided friendly name of the secret.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Returns the name of the service that created this secret.
  @_s.JsonKey(name: 'OwningService')
  final String owningService;

  /// Specifies whether automatic rotation is enabled for this secret.
  ///
  /// To enable rotation, use <a>RotateSecret</a> with
  /// <code>AutomaticallyRotateAfterDays</code> set to a value greater than 0. To
  /// disable rotation, use <a>CancelRotateSecret</a>.
  @_s.JsonKey(name: 'RotationEnabled')
  final bool rotationEnabled;

  /// The ARN of a Lambda function that's invoked by Secrets Manager to rotate the
  /// secret either automatically per the schedule or manually by a call to
  /// <code>RotateSecret</code>.
  @_s.JsonKey(name: 'RotationLambdaARN')
  final String rotationLambdaARN;

  /// A structure that contains the rotation configuration for this secret.
  @_s.JsonKey(name: 'RotationRules')
  final RotationRulesType rotationRules;

  /// The list of user-defined tags that are associated with the secret. To add
  /// tags to a secret, use <a>TagResource</a>. To remove tags, use
  /// <a>UntagResource</a>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A list of all of the currently assigned <code>VersionStage</code> staging
  /// labels and the <code>VersionId</code> that each is attached to. Staging
  /// labels are used to keep track of the different versions during the rotation
  /// process.
  /// <note>
  /// A version that does not have any staging labels attached is considered
  /// deprecated and subject to deletion. Such versions are not included in this
  /// list.
  /// </note>
  @_s.JsonKey(name: 'VersionIdsToStages')
  final Map<String, List<String>> versionIdsToStages;

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
    this.owningService,
    this.rotationEnabled,
    this.rotationLambdaARN,
    this.rotationRules,
    this.tags,
    this.versionIdsToStages,
  });
  factory DescribeSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSecretResponseFromJson(json);
}

/// Allows you to filter your list of secrets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// Filters your list of secrets by a specific key.
  @_s.JsonKey(name: 'Key')
  final FilterNameStringType key;

  /// Filters your list of secrets by a specific value.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    this.key,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

enum FilterNameStringType {
  @_s.JsonValue('description')
  description,
  @_s.JsonValue('name')
  name,
  @_s.JsonValue('tag-key')
  tagKey,
  @_s.JsonValue('tag-value')
  tagValue,
  @_s.JsonValue('all')
  all,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRandomPasswordResponse {
  /// A string with the generated password.
  @_s.JsonKey(name: 'RandomPassword')
  final String randomPassword;

  GetRandomPasswordResponse({
    this.randomPassword,
  });
  factory GetRandomPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRandomPasswordResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was retrieved for.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret that the resource-based policy was retrieved
  /// for.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A JSON-formatted string that describes the permissions that are associated
  /// with the attached secret. These permissions are combined with any
  /// permissions that are associated with the user or role that attempts to
  /// access this secret. The combined permissions specify who can access the
  /// secret and what actions they can perform. For more information, see <a
  /// href="http://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html">Authentication
  /// and Access Control for AWS Secrets Manager</a> in the <i>AWS Secrets Manager
  /// User Guide</i>.
  @_s.JsonKey(name: 'ResourcePolicy')
  final String resourcePolicy;

  GetResourcePolicyResponse({
    this.arn,
    this.name,
    this.resourcePolicy,
  });
  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSecretValueResponse {
  /// The ARN of the secret.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The date and time that this version of the secret was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The friendly name of the secret.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The decrypted part of the protected secret information that was originally
  /// provided as binary data in the form of a byte array. The response parameter
  /// represents the binary data as a <a
  /// href="https://tools.ietf.org/html/rfc4648#section-4">base64-encoded</a>
  /// string.
  ///
  /// This parameter is not used if the secret is created by the Secrets Manager
  /// console.
  ///
  /// If you store custom information in this field of the secret, then you must
  /// code your Lambda rotation function to parse and interpret whatever you store
  /// in the <code>SecretString</code> or <code>SecretBinary</code> fields.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'SecretBinary')
  final Uint8List secretBinary;

  /// The decrypted part of the protected secret information that was originally
  /// provided as a string.
  ///
  /// If you create this secret by using the Secrets Manager console then only the
  /// <code>SecretString</code> parameter contains data. Secrets Manager stores
  /// the information as a JSON structure of key/value pairs that the Lambda
  /// rotation function knows how to parse.
  ///
  /// If you store custom information in the secret by using the
  /// <a>CreateSecret</a>, <a>UpdateSecret</a>, or <a>PutSecretValue</a> API
  /// operations instead of the Secrets Manager console, or by using the <b>Other
  /// secret type</b> in the console, then you must code your Lambda rotation
  /// function to parse and interpret those values.
  @_s.JsonKey(name: 'SecretString')
  final String secretString;

  /// The unique identifier of this version of the secret.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  /// A list of all of the staging labels currently attached to this version of
  /// the secret.
  @_s.JsonKey(name: 'VersionStages')
  final List<String> versionStages;

  GetSecretValueResponse({
    this.arn,
    this.createdDate,
    this.name,
    this.secretBinary,
    this.secretString,
    this.versionId,
    this.versionStages,
  });
  factory GetSecretValueResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSecretValueResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecretVersionIdsResponse {
  /// The Amazon Resource Name (ARN) for the secret.
  /// <note>
  /// Secrets Manager automatically adds several random characters to the name at
  /// the end of the ARN when you initially create a secret. This affects only the
  /// ARN and not the actual friendly name. This ensures that if you create a new
  /// secret with the same name as an old secret that you previously deleted, then
  /// users with access to the old secret <i>don't</i> automatically get access to
  /// the new secret because the ARNs are different.
  /// </note>
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// If present in the response, this value indicates that there's more output
  /// available than included in the current response. This can occur even when
  /// the response includes no values at all, such as when you ask for a filtered
  /// view of a very long list. Use this value in the <code>NextToken</code>
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back empty (as
  /// <code>null</code>).
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of the currently available versions of the specified secret.
  @_s.JsonKey(name: 'Versions')
  final List<SecretVersionsListEntry> versions;

  ListSecretVersionIdsResponse({
    this.arn,
    this.name,
    this.nextToken,
    this.versions,
  });
  factory ListSecretVersionIdsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecretVersionIdsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecretsResponse {
  /// If present in the response, this value indicates that there's more output
  /// available than included in the current response. This can occur even when
  /// the response includes no values at all, such as when you ask for a filtered
  /// view of a very long list. Use this value in the <code>NextToken</code>
  /// request parameter in a subsequent call to the operation to continue
  /// processing and get the next part of the output. You should repeat this until
  /// the <code>NextToken</code> response element comes back empty (as
  /// <code>null</code>).
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the secrets in the account.
  @_s.JsonKey(name: 'SecretList')
  final List<SecretListEntry> secretList;

  ListSecretsResponse({
    this.nextToken,
    this.secretList,
  });
  factory ListSecretsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecretsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutResourcePolicyResponse {
  /// The ARN of the secret retrieved by the resource-based policy.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret that the retrieved by the resource-based
  /// policy.
  @_s.JsonKey(name: 'Name')
  final String name;

  PutResourcePolicyResponse({
    this.arn,
    this.name,
  });
  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSecretValueResponse {
  /// The Amazon Resource Name (ARN) for the secret for which you just created a
  /// version.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret for which you just created or updated a
  /// version.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier of the version of the secret you just created or
  /// updated.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  /// The list of staging labels that are currently attached to this version of
  /// the secret. Staging labels are used to track a version as it progresses
  /// through the secret rotation process.
  @_s.JsonKey(name: 'VersionStages')
  final List<String> versionStages;

  PutSecretValueResponse({
    this.arn,
    this.name,
    this.versionId,
    this.versionStages,
  });
  factory PutSecretValueResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSecretValueResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreSecretResponse {
  /// The ARN of the secret that was restored.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret that was restored.
  @_s.JsonKey(name: 'Name')
  final String name;

  RestoreSecretResponse({
    this.arn,
    this.name,
  });
  factory RestoreSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$RestoreSecretResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RotateSecretResponse {
  /// The ARN of the secret.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The ID of the new version of the secret created by the rotation started by
  /// this request.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  RotateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  factory RotateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$RotateSecretResponseFromJson(json);
}

/// A structure that defines the rotation configuration for the secret.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RotationRulesType {
  /// Specifies the number of days between automatic scheduled rotations of the
  /// secret.
  ///
  /// Secrets Manager schedules the next rotation when the previous one is
  /// complete. Secrets Manager schedules the date by adding the rotation interval
  /// (number of days) to the actual date of the last rotation. The service
  /// chooses the hour within that 24-hour date window randomly. The minute is
  /// also chosen somewhat randomly, but weighted towards the top of the hour and
  /// influenced by a variety of factors that help distribute load.
  @_s.JsonKey(name: 'AutomaticallyAfterDays')
  final int automaticallyAfterDays;

  RotationRulesType({
    this.automaticallyAfterDays,
  });
  factory RotationRulesType.fromJson(Map<String, dynamic> json) =>
      _$RotationRulesTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RotationRulesTypeToJson(this);
}

/// A structure that contains the details about a secret. It does not include
/// the encrypted <code>SecretString</code> and <code>SecretBinary</code>
/// values. To get those values, use the <a>GetSecretValue</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecretListEntry {
  /// The Amazon Resource Name (ARN) of the secret.
  ///
  /// For more information about ARNs in Secrets Manager, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#iam-resources">Policy
  /// Resources</a> in the <i>AWS Secrets Manager User Guide</i>.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The date and time when a secret was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The date and time the deletion of the secret occurred. Not present on active
  /// secrets. The secret can be recovered until the number of days in the
  /// recovery window has passed, as specified in the
  /// <code>RecoveryWindowInDays</code> parameter of the <a>DeleteSecret</a>
  /// operation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeletedDate')
  final DateTime deletedDate;

  /// The user-provided description of the secret.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN or alias of the AWS KMS customer master key (CMK) used to encrypt
  /// the <code>SecretString</code> and <code>SecretBinary</code> fields in each
  /// version of the secret. If you don't provide a key, then Secrets Manager
  /// defaults to encrypting the secret fields with the default KMS CMK, the key
  /// named <code>awssecretsmanager</code>, for this account.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The last date that this secret was accessed. This value is truncated to
  /// midnight of the date and therefore shows only the date, not the time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastAccessedDate')
  final DateTime lastAccessedDate;

  /// The last date and time that this secret was modified in any way.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastChangedDate')
  final DateTime lastChangedDate;

  /// The last date and time that the rotation process for this secret was
  /// invoked.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastRotatedDate')
  final DateTime lastRotatedDate;

  /// The friendly name of the secret. You can use forward slashes in the name to
  /// represent a path hierarchy. For example,
  /// <code>/prod/databases/dbserver1</code> could represent the secret for a
  /// server named <code>dbserver1</code> in the folder <code>databases</code> in
  /// the folder <code>prod</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Returns the name of the service that created the secret.
  @_s.JsonKey(name: 'OwningService')
  final String owningService;

  /// Indicates whether automatic, scheduled rotation is enabled for this secret.
  @_s.JsonKey(name: 'RotationEnabled')
  final bool rotationEnabled;

  /// The ARN of an AWS Lambda function invoked by Secrets Manager to rotate and
  /// expire the secret either automatically per the schedule or manually by a
  /// call to <a>RotateSecret</a>.
  @_s.JsonKey(name: 'RotationLambdaARN')
  final String rotationLambdaARN;

  /// A structure that defines the rotation configuration for the secret.
  @_s.JsonKey(name: 'RotationRules')
  final RotationRulesType rotationRules;

  /// A list of all of the currently assigned <code>SecretVersionStage</code>
  /// staging labels and the <code>SecretVersionId</code> attached to each one.
  /// Staging labels are used to keep track of the different versions during the
  /// rotation process.
  /// <note>
  /// A version that does not have any <code>SecretVersionStage</code> is
  /// considered deprecated and subject to deletion. Such versions are not
  /// included in this list.
  /// </note>
  @_s.JsonKey(name: 'SecretVersionsToStages')
  final Map<String, List<String>> secretVersionsToStages;

  /// The list of user-defined tags associated with the secret. To add tags to a
  /// secret, use <a>TagResource</a>. To remove tags, use <a>UntagResource</a>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

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
    this.owningService,
    this.rotationEnabled,
    this.rotationLambdaARN,
    this.rotationRules,
    this.secretVersionsToStages,
    this.tags,
  });
  factory SecretListEntry.fromJson(Map<String, dynamic> json) =>
      _$SecretListEntryFromJson(json);
}

/// A structure that contains information about one version of a secret.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecretVersionsListEntry {
  /// The date and time this version of the secret was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The date that this version of the secret was last accessed. Note that the
  /// resolution of this field is at the date level and does not include the time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastAccessedDate')
  final DateTime lastAccessedDate;

  /// The unique version identifier of this version of the secret.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  /// An array of staging labels that are currently associated with this version
  /// of the secret.
  @_s.JsonKey(name: 'VersionStages')
  final List<String> versionStages;

  SecretVersionsListEntry({
    this.createdDate,
    this.lastAccessedDate,
    this.versionId,
    this.versionStages,
  });
  factory SecretVersionsListEntry.fromJson(Map<String, dynamic> json) =>
      _$SecretVersionsListEntryFromJson(json);
}

enum SortOrderType {
  @_s.JsonValue('asc')
  asc,
  @_s.JsonValue('desc')
  desc,
}

extension on SortOrderType {
  String toValue() {
    switch (this) {
      case SortOrderType.asc:
        return 'asc';
      case SortOrderType.desc:
        return 'desc';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A structure that contains information about a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key identifier, or name, of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The string value associated with the key of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSecretResponse {
  /// The ARN of the secret that was updated.
  /// <note>
  /// Secrets Manager automatically adds several random characters to the name at
  /// the end of the ARN when you initially create a secret. This affects only the
  /// ARN and not the actual friendly name. This ensures that if you create a new
  /// secret with the same name as an old secret that you previously deleted, then
  /// users with access to the old secret <i>don't</i> automatically get access to
  /// the new secret because the ARNs are different.
  /// </note>
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret that was updated.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// If a new version of the secret was created by this operation, then
  /// <code>VersionId</code> contains the unique identifier of the new version.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  UpdateSecretResponse({
    this.arn,
    this.name,
    this.versionId,
  });
  factory UpdateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSecretResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSecretVersionStageResponse {
  /// The ARN of the secret with the modified staging label.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  /// The friendly name of the secret with the modified staging label.
  @_s.JsonKey(name: 'Name')
  final String name;

  UpdateSecretVersionStageResponse({
    this.arn,
    this.name,
  });
  factory UpdateSecretVersionStageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSecretVersionStageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidateResourcePolicyResponse {
  /// Returns a message stating that your Reource Policy passed validation.
  @_s.JsonKey(name: 'PolicyValidationPassed')
  final bool policyValidationPassed;

  /// Returns an error message if your policy doesn't pass validatation.
  @_s.JsonKey(name: 'ValidationErrors')
  final List<ValidationErrorsEntry> validationErrors;

  ValidateResourcePolicyResponse({
    this.policyValidationPassed,
    this.validationErrors,
  });
  factory ValidateResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidateResourcePolicyResponseFromJson(json);
}

/// Displays errors that occurred during validation of the resource policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidationErrorsEntry {
  /// Checks the name of the policy.
  @_s.JsonKey(name: 'CheckName')
  final String checkName;

  /// Displays error messages if validation encounters problems during validation
  /// of the resource policy.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  ValidationErrorsEntry({
    this.checkName,
    this.errorMessage,
  });
  factory ValidationErrorsEntry.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorsEntryFromJson(json);
}

class DecryptionFailure extends _s.GenericAwsException {
  DecryptionFailure({String type, String message})
      : super(type: type, code: 'DecryptionFailure', message: message);
}

class EncryptionFailure extends _s.GenericAwsException {
  EncryptionFailure({String type, String message})
      : super(type: type, code: 'EncryptionFailure', message: message);
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String type, String message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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

class PreconditionNotMetException extends _s.GenericAwsException {
  PreconditionNotMetException({String type, String message})
      : super(
            type: type, code: 'PreconditionNotMetException', message: message);
}

class PublicPolicyException extends _s.GenericAwsException {
  PublicPolicyException({String type, String message})
      : super(type: type, code: 'PublicPolicyException', message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String type, String message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
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
