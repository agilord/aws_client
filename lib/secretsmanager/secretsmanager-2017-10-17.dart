import 'dart:convert';
import 'dart:io';

import 'package:aws_client/src/credentials.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:crypto/crypto.dart';

part 'secretsmanager-2017-10-17.g.dart';

/// AWS Secrets Manager API Reference AWS Secrets Manager is a web service
/// that enables you to store, manage, and retrieve, secrets. This guide provides
/// descriptions of the Secrets Manager API. For more information about using
/// this service, see the AWS Secrets Manager User Guide.  API Version  This
/// version of the Secrets Manager API Reference documents the Secrets Manager
/// API version 2017-10-17.  As an alternative to using the API directly, you
/// can use one of the AWS SDKs, which consist of libraries and sample code
/// for various programming languages and platforms (such as Java, Ruby, .NET,
/// iOS, and Android). The SDKs provide a convenient way to create programmatic
/// access to AWS Secrets Manager. For example, the SDKs take care of cryptographically
/// signing requests, managing errors, and retrying requests automatically.
/// For more information about the AWS SDKs, including how to download and
/// install them, see Tools for Amazon Web Services.  We recommend that you
/// use the AWS SDKs to make programmatic API calls to Secrets Manager. However,
/// you also can use the Secrets Manager HTTP Query API to make direct calls
/// to the Secrets Manager web service. To learn more about the Secrets Manager
/// HTTP Query API, see Making Query Requests in the AWS Secrets Manager User
/// Guide.  Secrets Manager supports GET and POST requests for all actions.
/// That is, the API doesn't require you to use GET for some actions and POST
/// for others. However, GET requests are subject to the limitation size of
/// a URL. Therefore, for operations that require larger sizes, use a POST
/// request.  Support and Feedback for AWS Secrets Manager  We welcome your
/// feedback. Send your comments to awssecretsmanager-feedback@amazon.com,
/// or post your feedback and questions in the AWS Secrets Manager Discussion
/// Forum. For more information about the AWS Discussion Forums, see Forums
/// Help.  How examples are presented  The JSON that AWS Secrets Manager expects
/// as your request parameters and that the service returns as a response to
/// HTTP query requests are single, long strings without line breaks or white
/// space formatting. The JSON shown in the examples is formatted with both
/// line breaks and white space to improve readability. When example input
/// parameters would also result in long strings that extend beyond the screen,
/// we insert line breaks to enhance readability. You should always submit
/// the input as a single JSON text string.  Logging API Requests  AWS Secrets
/// Manager supports AWS CloudTrail, a service that records AWS API calls for
/// your AWS account and delivers log files to an Amazon S3 bucket. By using
/// information that's collected by AWS CloudTrail, you can determine which
/// requests were successfully made to Secrets Manager, who made the request,
/// when it was made, and so on. For more about AWS Secrets Manager and its
/// support for AWS CloudTrail, see Logging AWS Secrets Manager Events with
/// AWS CloudTrail in the AWS Secrets Manager User Guide. To learn more about
/// CloudTrail, including how to turn it on and find your log files, see the
/// AWS CloudTrail User Guide.
class SecretsManager {
  static const String apiVersion = '2017-10-17';
  static const String endpointPrefix = 'secretsmanager';
  static const String jsonVersion = '1.1';
  static const String protocol = 'json';
  static const String serviceFullName = 'AWS Secrets Manager';
  static const String serviceId = 'Secrets Manager';
  static const String signatureVersion = 'v4';
  static const String signingName = 'secretsmanager';
  static const String targetPrefix = 'secretsmanager';
  static const String uid = 'secretsmanager-2017-10-17';
  static const _aws4HmacSha256 = 'AWS4-HMAC-SHA256';
  final String region;
  Dio dio;
  Credentials credentials;
  final Map<String, String> environment = Platform.environment;

  SecretsManager({this.region = 'eu-west-1', this.credentials, this.dio}) {
    dio ??= Dio()
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          options.headers.putIfAbsent(
            'X-Amz-Date',
                () => DateTime.now()
                .toUtc()
                .toIso8601String()
                .replaceAll('-', '')
                .replaceAll(':', '')
                .split('.')
                .first,
          );

          _sign(credentials, options);

          return options;
        },
      ))
      ..options.baseUrl = 'https://$endpointPrefix.$region.amazonaws.com';

    credentials ??= Credentials(
      accessKey: environment['AWS_ACCESS_KEY_ID'],
      secretKey: environment['AWS_SECRET_ACCESS_KEY'],
      sessionToken: environment['AWS_SESSION_TOKEN'],
    );
  }

  /// Disables automatic scheduled rotation and cancels the rotation of a secret
  /// if one is currently in progress. To re-enable scheduled rotation, call
  /// RotateSecret with AutomaticallyRotateAfterDays set to a value greater than
  /// 0. This will immediately rotate your secret and then enable the automatic
  /// schedule.  If you cancel a rotation that is in progress, it can leave the
  /// VersionStage labels in an unexpected state. Depending on what step of the
  /// rotation was in progress, you might need to remove the staging label AWSPENDING
  /// from the partially created version, specified by the VersionId response
  /// value. You should also evaluate the partially rotated new version to see
  /// if it should be deleted, which you can do by removing all staging labels
  /// from the new version's VersionStage field.  To successfully start a rotation,
  /// the staging label AWSPENDING must be in one of the following states:
  /// Not be attached to any version at all   Attached to the same version as
  /// the staging label AWSCURRENT    If the staging label AWSPENDING is attached
  /// to a different version than the version with AWSCURRENT then the attempt
  /// to rotate fails.  Minimum permissions  To run this command, you must have
  /// the following permissions:   secretsmanager:CancelRotateSecret    Related
  /// operations    To configure rotation for a secret or to manually trigger
  /// a rotation, use RotateSecret.   To get the rotation configuration details
  /// for a secret, use DescribeSecret.   To list all of the currently available
  /// secrets, use ListSecrets.   To list all of the versions currently associated
  /// with a secret, use ListSecretVersionIds.
  Future<CancelRotateSecretResponse> cancelRotateSecret(
      CancelRotateSecretRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return CancelRotateSecretResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Creates a new secret. A secret in Secrets Manager consists of both the
  /// protected secret data and the important information needed to manage the
  /// secret. Secrets Manager stores the encrypted secret data in one of a collection
  /// of "versions" associated with the secret. Each version contains a copy
  /// of the encrypted secret data. Each version is associated with one or more
  /// "staging labels" that identify where the version is in the rotation cycle.
  /// The SecretVersionsToStages field of the secret contains the mapping of
  /// staging labels to the active versions of the secret. Versions without a
  /// staging label are considered deprecated and are not included in the list.
  /// You provide the secret data to be encrypted by putting text in either the
  /// SecretString parameter or binary data in the SecretBinary parameter, but
  /// not both. If you include SecretString or SecretBinary then Secrets Manager
  /// also creates an initial secret version and automatically attaches the staging
  /// label AWSCURRENT to the new version.    If you call an operation that needs
  /// to encrypt or decrypt the SecretString or SecretBinary for a secret in
  /// the same account as the calling user and that secret doesn't specify a
  /// AWS KMS encryption key, Secrets Manager uses the account's default AWS
  /// managed customer master key (CMK) with the alias aws/secretsmanager. If
  /// this key doesn't already exist in your account then Secrets Manager creates
  /// it for you automatically. All users and roles in the same AWS account automatically
  /// have access to use the default CMK. Note that if an Secrets Manager API
  /// call results in AWS having to create the account's AWS-managed CMK, it
  /// can result in a one-time significant delay in returning the result.   If
  /// the secret is in a different AWS account from the credentials calling an
  /// API that requires encryption or decryption of the secret value then you
  /// must create and use a custom AWS KMS CMK because you can't access the default
  /// CMK for the account using credentials from a different AWS account. Store
  /// the ARN of the CMK in the secret when you create the secret or when you
  /// update it by including it in the KMSKeyId. If you call an API that must
  /// encrypt or decrypt SecretString or SecretBinary using credentials from
  /// a different account then the AWS KMS key policy must grant cross-account
  /// access to that other account's user or role for both the kms:GenerateDataKey
  /// and kms:Decrypt operations.       Minimum permissions  To run this command,
  /// you must have the following permissions:   secretsmanager:CreateSecret
  ///   kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS
  /// key to encrypt the secret. You do not need this permission to use the account's
  /// default AWS managed CMK for Secrets Manager.   kms:Decrypt - needed only
  /// if you use a customer-managed AWS KMS key to encrypt the secret. You do
  /// not need this permission to use the account's default AWS managed CMK for
  /// Secrets Manager.   secretsmanager:TagResource - needed only if you include
  /// the Tags parameter.     Related operations    To delete a secret, use DeleteSecret.
  ///   To modify an existing secret, use UpdateSecret.   To create a new version
  /// of a secret, use PutSecretValue.   To retrieve the encrypted secure string
  /// and secure binary values, use GetSecretValue.   To retrieve all other details
  /// for a secret, use DescribeSecret. This does not include the encrypted secure
  /// string and secure binary values.   To retrieve the list of secret versions
  /// associated with the current secret, use DescribeSecret and examine the
  /// SecretVersionsToStages response value.
  Future<CreateSecretResponse> createSecret(CreateSecretRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return CreateSecretResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Deletes the resource-based permission policy that's attached to the secret.
  ///  Minimum permissions  To run this command, you must have the following
  /// permissions:   secretsmanager:DeleteResourcePolicy    Related operations
  ///    To attach a resource policy to a secret, use PutResourcePolicy.   To
  /// retrieve the current resource-based policy that's attached to a secret,
  /// use GetResourcePolicy.   To list all of the currently available secrets,
  /// use ListSecrets.
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy(
      DeleteResourcePolicyRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DeleteResourcePolicyResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Deletes an entire secret and all of its versions. You can optionally include
  /// a recovery window during which you can restore the secret. If you don't
  /// specify a recovery window value, the operation defaults to 30 days. Secrets
  /// Manager attaches a DeletionDate stamp to the secret that specifies the
  /// end of the recovery window. At the end of the recovery window, Secrets
  /// Manager deletes the secret permanently. At any time before recovery window
  /// ends, you can use RestoreSecret to remove the DeletionDate and cancel the
  /// deletion of the secret. You cannot access the encrypted secret information
  /// in any secret that is scheduled for deletion. If you need to access that
  /// information, you must cancel the deletion with RestoreSecret and then retrieve
  /// the information.    There is no explicit operation to delete a version
  /// of a secret. Instead, remove all staging labels from the VersionStage field
  /// of a version. That marks the version as deprecated and allows Secrets Manager
  /// to delete it as needed. Versions that do not have any staging labels do
  /// not show up in ListSecretVersionIds unless you specify IncludeDeprecated.
  ///   The permanent secret deletion at the end of the waiting period is performed
  /// as a background task with low priority. There is no guarantee of a specific
  /// time after the recovery window for the actual delete operation to occur.
  ///     Minimum permissions  To run this command, you must have the following
  /// permissions:   secretsmanager:DeleteSecret    Related operations    To
  /// create a secret, use CreateSecret.   To cancel deletion of a version of
  /// a secret before the recovery window has expired, use RestoreSecret.
  Future<DeleteSecretResponse> deleteSecret(DeleteSecretRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DeleteSecretResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Retrieves the details of a secret. It does not include the encrypted fields.
  /// Only those fields that are populated with a value are returned in the response.
  ///   Minimum permissions  To run this command, you must have the following
  /// permissions:   secretsmanager:DescribeSecret    Related operations    To
  /// create a secret, use CreateSecret.   To modify a secret, use UpdateSecret.
  ///   To retrieve the encrypted secret information in a version of the secret,
  /// use GetSecretValue.   To list all of the secrets in the AWS account, use
  /// ListSecrets.
  Future<DescribeSecretResponse> describeSecret(
      DescribeSecretRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return DescribeSecretResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Generates a random password of the specified complexity. This operation
  /// is intended for use in the Lambda rotation function. Per best practice,
  /// we recommend that you specify the maximum length and include every character
  /// type that the system you are generating a password for can support.  Minimum
  /// permissions  To run this command, you must have the following permissions:
  ///   secretsmanager:GetRandomPassword
  Future<GetRandomPasswordResponse> getRandomPassword(
      GetRandomPasswordRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return GetRandomPasswordResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Retrieves the JSON text of the resource-based policy document that's attached
  /// to the specified secret. The JSON request string input and response output
  /// are shown formatted with white space and line breaks for better readability.
  /// Submit your input as a single line JSON string.  Minimum permissions  To
  /// run this command, you must have the following permissions:   secretsmanager:GetResourcePolicy
  ///    Related operations    To attach a resource policy to a secret, use PutResourcePolicy.
  ///   To delete the resource-based policy that's attached to a secret, use
  /// DeleteResourcePolicy.   To list all of the currently available secrets,
  /// use ListSecrets.
  Future<GetResourcePolicyResponse> getResourcePolicy(
      GetResourcePolicyRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return GetResourcePolicyResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Retrieves the contents of the encrypted fields SecretString or SecretBinary
  /// from the specified version of a secret, whichever contains content.  Minimum
  /// permissions  To run this command, you must have the following permissions:
  ///   secretsmanager:GetSecretValue   kms:Decrypt - required only if you use
  /// a customer-managed AWS KMS key to encrypt the secret. You do not need this
  /// permission to use the account's default AWS managed CMK for Secrets Manager.
  ///    Related operations    To create a new version of the secret with different
  /// encrypted information, use PutSecretValue.   To retrieve the non-encrypted
  /// details for the secret, use DescribeSecret.
  Future<GetSecretValueResponse> getSecretValue(
      GetSecretValueRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return GetSecretValueResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Lists all of the versions attached to the specified secret. The output
  /// does not include the SecretString or SecretBinary fields. By default, the
  /// list includes only versions that have at least one staging label in VersionStage
  /// attached.  Always check the NextToken response parameter when calling any
  /// of the List* operations. These operations can occasionally return an empty
  /// or shorter than expected list of results even when there are more results
  /// available. When this happens, the NextToken response parameter contains
  /// a value to pass to the next call to the same API to request the next part
  /// of the list.   Minimum permissions  To run this command, you must have
  /// the following permissions:   secretsmanager:ListSecretVersionIds    Related
  /// operations    To list the secrets in an account, use ListSecrets.
  Future<ListSecretVersionIdsResponse> listSecretVersionIds(
      ListSecretVersionIdsRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return ListSecretVersionIdsResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Lists all of the secrets that are stored by Secrets Manager in the AWS
  /// account. To list the versions currently stored for a specific secret, use
  /// ListSecretVersionIds. The encrypted fields SecretString and SecretBinary
  /// are not included in the output. To get that information, call the GetSecretValue
  /// operation.  Always check the NextToken response parameter when calling
  /// any of the List* operations. These operations can occasionally return an
  /// empty or shorter than expected list of results even when there are more
  /// results available. When this happens, the NextToken response parameter
  /// contains a value to pass to the next call to the same API to request the
  /// next part of the list.   Minimum permissions  To run this command, you
  /// must have the following permissions:   secretsmanager:ListSecrets    Related
  /// operations    To list the versions attached to a secret, use ListSecretVersionIds.
  ///
  Future<ListSecretsResponse> listSecrets(ListSecretsRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return ListSecretsResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Attaches the contents of the specified resource-based permission policy
  /// to a secret. A resource-based policy is optional. Alternatively, you can
  /// use IAM identity-based policies that specify the secret's Amazon Resource
  /// Name (ARN) in the policy statement's Resources element. You can also use
  /// a combination of both identity-based and resource-based policies. The affected
  /// users and roles receive the permissions that are permitted by all of the
  /// relevant policies. For more information, see Using Resource-Based Policies
  /// for AWS Secrets Manager. For the complete description of the AWS policy
  /// syntax and grammar, see IAM JSON Policy Reference in the IAM User Guide.
  ///  Minimum permissions  To run this command, you must have the following
  /// permissions:   secretsmanager:PutResourcePolicy    Related operations
  ///   To retrieve the resource policy that's attached to a secret, use GetResourcePolicy.
  ///   To delete the resource-based policy that's attached to a secret, use
  /// DeleteResourcePolicy.   To list all of the currently available secrets,
  /// use ListSecrets.
  Future<PutResourcePolicyResponse> putResourcePolicy(
      PutResourcePolicyRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return PutResourcePolicyResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Stores a new encrypted secret value in the specified secret. To do this,
  /// the operation creates a new version and attaches it to the secret. The
  /// version can contain a new SecretString value or a new SecretBinary value.
  /// You can also specify the staging labels that are initially attached to
  /// the new version.  The Secrets Manager console uses only the SecretString
  /// field. To add binary data to a secret with the SecretBinary field you must
  /// use the AWS CLI or one of the AWS SDKs.    If this operation creates the
  /// first version for the secret then Secrets Manager automatically attaches
  /// the staging label AWSCURRENT to the new version.   If another version of
  /// this secret already exists, then this operation does not automatically
  /// move any staging labels other than those that you explicitly specify in
  /// the VersionStages parameter.   If this operation moves the staging label
  /// AWSCURRENT from another version to this version (because you included it
  /// in the StagingLabels parameter) then Secrets Manager also automatically
  /// moves the staging label AWSPREVIOUS to the version that AWSCURRENT was
  /// removed from.   This operation is idempotent. If a version with a VersionId
  /// with the same value as the ClientRequestToken parameter already exists
  /// and you specify the same secret data, the operation succeeds but does nothing.
  /// However, if the secret data is different, then the operation fails because
  /// you cannot modify an existing version; you can only create new ones.
  ///    If you call an operation that needs to encrypt or decrypt the SecretString
  /// or SecretBinary for a secret in the same account as the calling user and
  /// that secret doesn't specify a AWS KMS encryption key, Secrets Manager uses
  /// the account's default AWS managed customer master key (CMK) with the alias
  /// aws/secretsmanager. If this key doesn't already exist in your account then
  /// Secrets Manager creates it for you automatically. All users and roles in
  /// the same AWS account automatically have access to use the default CMK.
  /// Note that if an Secrets Manager API call results in AWS having to create
  /// the account's AWS-managed CMK, it can result in a one-time significant
  /// delay in returning the result.   If the secret is in a different AWS account
  /// from the credentials calling an API that requires encryption or decryption
  /// of the secret value then you must create and use a custom AWS KMS CMK because
  /// you can't access the default CMK for the account using credentials from
  /// a different AWS account. Store the ARN of the CMK in the secret when you
  /// create the secret or when you update it by including it in the KMSKeyId.
  /// If you call an API that must encrypt or decrypt SecretString or SecretBinary
  /// using credentials from a different account then the AWS KMS key policy
  /// must grant cross-account access to that other account's user or role for
  /// both the kms:GenerateDataKey and kms:Decrypt operations.     Minimum permissions
  ///  To run this command, you must have the following permissions:   secretsmanager:PutSecretValue
  ///   kms:GenerateDataKey - needed only if you use a customer-managed AWS KMS
  /// key to encrypt the secret. You do not need this permission to use the account's
  /// default AWS managed CMK for Secrets Manager.    Related operations    To
  /// retrieve the encrypted value you store in the version of a secret, use
  /// GetSecretValue.   To create a secret, use CreateSecret.   To get the details
  /// for a secret, use DescribeSecret.   To list the versions attached to a
  /// secret, use ListSecretVersionIds.
  Future<PutSecretValueResponse> putSecretValue(
      PutSecretValueRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return PutSecretValueResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Cancels the scheduled deletion of a secret by removing the DeletedDate
  /// time stamp. This makes the secret accessible to query once again.  Minimum
  /// permissions  To run this command, you must have the following permissions:
  ///   secretsmanager:RestoreSecret    Related operations    To delete a secret,
  /// use DeleteSecret.
  Future<RestoreSecretResponse> restoreSecret(
      RestoreSecretRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return RestoreSecretResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Configures and starts the asynchronous process of rotating this secret.
  /// If you include the configuration parameters, the operation sets those values
  /// for the secret and then immediately starts a rotation. If you do not include
  /// the configuration parameters, the operation starts a rotation with the
  /// values already stored in the secret. After the rotation completes, the
  /// protected service and its clients all use the new version of the secret.
  ///  This required configuration information includes the ARN of an AWS Lambda
  /// function and the time between scheduled rotations. The Lambda rotation
  /// function creates a new version of the secret and creates or updates the
  /// credentials on the protected service to match. After testing the new credentials,
  /// the function marks the new secret with the staging label AWSCURRENT so
  /// that your clients all immediately begin to use the new version. For more
  /// information about rotating secrets and how to configure a Lambda function
  /// to rotate the secrets for your protected service, see Rotating Secrets
  /// in AWS Secrets Manager in the AWS Secrets Manager User Guide. Secrets Manager
  /// schedules the next rotation when the previous one is complete. Secrets
  /// Manager schedules the date by adding the rotation interval (number of days)
  /// to the actual date of the last rotation. The service chooses the hour within
  /// that 24-hour date window randomly. The minute is also chosen somewhat randomly,
  /// but weighted towards the top of the hour and influenced by a variety of
  /// factors that help distribute load. The rotation function must end with
  /// the versions of the secret in one of two states:   The AWSPENDING and AWSCURRENT
  /// staging labels are attached to the same version of the secret, or   The
  /// AWSPENDING staging label is not attached to any version of the secret.
  ///   If instead the AWSPENDING staging label is present but is not attached
  /// to the same version as AWSCURRENT then any later invocation of RotateSecret
  /// assumes that a previous rotation request is still in progress and returns
  /// an error.  Minimum permissions  To run this command, you must have the
  /// following permissions:   secretsmanager:RotateSecret   lambda:InvokeFunction
  /// (on the function specified in the secret's metadata)    Related operations
  ///    To list the secrets in your account, use ListSecrets.   To get the details
  /// for a version of a secret, use DescribeSecret.   To create a new version
  /// of a secret, use CreateSecret.   To attach staging labels to or remove
  /// staging labels from a version of a secret, use UpdateSecretVersionStage.
  ///
  Future<RotateSecretResponse> rotateSecret(RotateSecretRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return RotateSecretResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Attaches one or more tags, each consisting of a key name and a value, to
  /// the specified secret. Tags are part of the secret's overall metadata, and
  /// are not associated with any specific version of the secret. This operation
  /// only appends tags to the existing list of tags. To remove tags, you must
  /// use UntagResource. The following basic restrictions apply to tags:   Maximum
  /// number of tags per secret—50   Maximum key length—127 Unicode characters
  /// in UTF-8   Maximum value length—255 Unicode characters in UTF-8   Tag keys
  /// and values are case sensitive.   Do not use the aws: prefix in your tag
  /// names or values because it is reserved for AWS use. You can't edit or delete
  /// tag names or values with this prefix. Tags with this prefix do not count
  /// against your tags per secret limit.   If your tagging schema will be used
  /// across multiple services and resources, remember that other services might
  /// have restrictions on allowed characters. Generally allowed characters are:
  /// letters, spaces, and numbers representable in UTF-8, plus the following
  /// special characters: + - = . _ : / @.    If you use tags as part of your
  /// security strategy, then adding or removing a tag can change permissions.
  /// If successfully completing this operation would result in you losing your
  /// permissions for this secret, then the operation is blocked and returns
  /// an Access Denied error.   Minimum permissions  To run this command, you
  /// must have the following permissions:   secretsmanager:TagResource    Related
  /// operations    To remove one or more tags from the collection attached to
  /// a secret, use UntagResource.   To view the list of tags attached to a secret,
  /// use DescribeSecret.
  Future<void> tagResource(TagResourceRequest param) async {
    await dio.post('/', data: param.toJson());
  }

  /// Removes one or more tags from the specified secret. This operation is idempotent.
  /// If a requested tag is not attached to the secret, no error is returned
  /// and the secret metadata is unchanged.  If you use tags as part of your
  /// security strategy, then removing a tag can change permissions. If successfully
  /// completing this operation would result in you losing your permissions for
  /// this secret, then the operation is blocked and returns an Access Denied
  /// error.   Minimum permissions  To run this command, you must have the following
  /// permissions:   secretsmanager:UntagResource    Related operations    To
  /// add one or more tags to the collection attached to a secret, use TagResource.
  ///   To view the list of tags attached to a secret, use DescribeSecret.
  Future<void> untagResource(UntagResourceRequest param) async {
    await dio.post('/', data: param.toJson());
  }

  /// Modifies many of the details of the specified secret. If you include a
  /// ClientRequestToken and either SecretString or SecretBinary then it also
  /// creates a new version attached to the secret. To modify the rotation configuration
  /// of a secret, use RotateSecret instead.  The Secrets Manager console uses
  /// only the SecretString parameter and therefore limits you to encrypting
  /// and storing only a text string. To encrypt and store binary data as part
  /// of the version of a secret, you must use either the AWS CLI or one of the
  /// AWS SDKs.    If a version with a VersionId with the same value as the ClientRequestToken
  /// parameter already exists, the operation results in an error. You cannot
  /// modify an existing version, you can only create a new version.   If you
  /// include SecretString or SecretBinary to create a new secret version, Secrets
  /// Manager automatically attaches the staging label AWSCURRENT to the new
  /// version.       If you call an operation that needs to encrypt or decrypt
  /// the SecretString or SecretBinary for a secret in the same account as the
  /// calling user and that secret doesn't specify a AWS KMS encryption key,
  /// Secrets Manager uses the account's default AWS managed customer master
  /// key (CMK) with the alias aws/secretsmanager. If this key doesn't already
  /// exist in your account then Secrets Manager creates it for you automatically.
  /// All users and roles in the same AWS account automatically have access to
  /// use the default CMK. Note that if an Secrets Manager API call results in
  /// AWS having to create the account's AWS-managed CMK, it can result in a
  /// one-time significant delay in returning the result.   If the secret is
  /// in a different AWS account from the credentials calling an API that requires
  /// encryption or decryption of the secret value then you must create and use
  /// a custom AWS KMS CMK because you can't access the default CMK for the account
  /// using credentials from a different AWS account. Store the ARN of the CMK
  /// in the secret when you create the secret or when you update it by including
  /// it in the KMSKeyId. If you call an API that must encrypt or decrypt SecretString
  /// or SecretBinary using credentials from a different account then the AWS
  /// KMS key policy must grant cross-account access to that other account's
  /// user or role for both the kms:GenerateDataKey and kms:Decrypt operations.
  ///     Minimum permissions  To run this command, you must have the following
  /// permissions:   secretsmanager:UpdateSecret   kms:GenerateDataKey - needed
  /// only if you use a custom AWS KMS key to encrypt the secret. You do not
  /// need this permission to use the account's AWS managed CMK for Secrets Manager.
  ///   kms:Decrypt - needed only if you use a custom AWS KMS key to encrypt
  /// the secret. You do not need this permission to use the account's AWS managed
  /// CMK for Secrets Manager.    Related operations    To create a new secret,
  /// use CreateSecret.   To add only a new version to an existing secret, use
  /// PutSecretValue.   To get the details for a secret, use DescribeSecret.
  ///   To list the versions contained in a secret, use ListSecretVersionIds.
  ///
  Future<UpdateSecretResponse> updateSecret(UpdateSecretRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateSecretResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Modifies the staging labels attached to a version of a secret. Staging
  /// labels are used to track a version as it progresses through the secret
  /// rotation process. You can attach a staging label to only one version of
  /// a secret at a time. If a staging label to be added is already attached
  /// to another version, then it is moved--removed from the other version first
  /// and then attached to this one. For more information about staging labels,
  /// see Staging Labels in the AWS Secrets Manager User Guide.  The staging
  /// labels that you specify in the VersionStage parameter are added to the
  /// existing list of staging labels--they don't replace it. You can move the
  /// AWSCURRENT staging label to this version by including it in this call.
  ///  Whenever you move AWSCURRENT, Secrets Manager automatically moves the
  /// label AWSPREVIOUS to the version that AWSCURRENT was removed from.  If
  /// this action results in the last label being removed from a version, then
  /// the version is considered to be 'deprecated' and can be deleted by Secrets
  /// Manager.  Minimum permissions  To run this command, you must have the following
  /// permissions:   secretsmanager:UpdateSecretVersionStage    Related operations
  ///    To get the list of staging labels that are currently associated with
  /// a version of a secret, use  DescribeSecret  and examine the SecretVersionsToStages
  /// response value.
  Future<UpdateSecretVersionStageResponse> updateSecretVersionStage(
      UpdateSecretVersionStageRequest param) async {
    final Response response = await dio.post('/', data: param.toJson());
    return UpdateSecretVersionStageResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  _sign(Credentials credentials, RequestOptions options) {
    final queryKeys = options.uri.queryParameters.keys.toList()..sort();
    final canonicalQuery = queryKeys
        .map((s) =>
            '${_queryComponent(s)}=${_queryComponent(options.uri.queryParameters[s])}')
        .join('&');
    final canonicalHeaders = options.headers.keys
        .map((key) => '${key.toLowerCase()}:${options.headers[key].trim()}')
        .toList()
          ..sort();
    final signedHeaders = (options.headers.keys.toList()..sort())
        .map((s) => s.toLowerCase())
        .join(';');

    final payloadHash = options.headers['X-Amz-Content-Sha256'] as String ??
        sha256.convert(utf8.encode(jsonEncode(options.data))).toString();

    final canonical = ([
      options.method.toUpperCase(),
      Uri.encodeFull(options.uri.path),
      canonicalQuery,
    ]
          ..addAll(canonicalHeaders)
          ..addAll([
            '',
            signedHeaders,
            payloadHash,
          ]))
        .join('\n');

    final date = options.headers['X-Amz-Date'] as String;
    final List<String> credentialList = [
      date.substring(0, 8),
      region,
      endpointPrefix,
      'aws4_request',
    ];
    final canonicalHash = sha256.convert(utf8.encode(canonical)).toString();
    final toSign = [
      _aws4HmacSha256,
      date,
      credentialList.join('/'),
      canonicalHash,
    ].join('\n');
    final signingKey = credentialList.fold(
        utf8.encode('AWS4${credentials.secretKey}'), (List<int> key, String s) {
      final hmac = Hmac(sha256, key);
      return hmac.convert(utf8.encode(s)).bytes;
    });
    final signature =
        Hmac(sha256, signingKey).convert(utf8.encode(toSign)).toString();
    if (credentials.sessionToken != null) {
      options.headers['X-Amz-Security-Token'] = credentials.sessionToken;
    }

    final auth = '$_aws4HmacSha256 '
        'Credential=${credentials.accessKey}/${credentialList.join('/')}, '
        'SignedHeaders=$signedHeaders, '
        'Signature=$signature';
    options.headers['Authorization'] = auth;
  }

  String _queryComponent(String path) =>
      Uri.encodeQueryComponent(path).replaceAll('+', '%20');
}

@JsonSerializable()
class CancelRotateSecretRequest {
  /// Specifies the secret for which you want to cancel a rotation request. You
  /// can specify either the Amazon Resource Name (ARN) or the friendly name
  /// of the secret.  If you specify an ARN, we generally recommend that you
  /// specify a complete ARN. You can specify a partial ARN too—for example,
  /// if you don’t include the final hyphen and six random characters that Secrets
  /// Manager adds at the end of the ARN when you created the secret. A partial
  /// ARN match can work as long as it uniquely matches only one secret. However,
  /// if your secret has a name that ends in a hyphen followed by six characters
  /// (before Secrets Manager adds the hyphen and six characters to the ARN)
  /// and you try to use that as a partial ARN, then those characters cause Secrets
  /// Manager to assume that you’re specifying a complete ARN. This confusion
  /// can cause unexpected results. To avoid this situation, we recommend that
  /// you don’t create secret names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  CancelRotateSecretRequest({
    @required this.secretId,
  });

  factory CancelRotateSecretRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelRotateSecretRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CancelRotateSecretRequestToJson(this);
}

@JsonSerializable()
class CancelRotateSecretResponse {
  /// The ARN of the secret for which rotation was canceled.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret for which rotation was canceled.
  @JsonKey(name: 'Name')
  final String name;

  /// The unique identifier of the version of the secret that was created during
  /// the rotation. This version might not be complete, and should be evaluated
  /// for possible deletion. At the very least, you should remove the VersionStage
  /// value AWSPENDING to enable this version to be deleted. Failing to clean
  /// up a cancelled rotation can block you from successfully starting future
  /// rotations.
  @JsonKey(name: 'VersionId')
  final String versionId;

  CancelRotateSecretResponse({
    this.aRN,
    this.name,
    this.versionId,
  });

  factory CancelRotateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelRotateSecretResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelRotateSecretResponseToJson(this);
}

@JsonSerializable()
class CreateSecretRequest {
  /// Specifies the friendly name of the new secret. The secret name must be
  /// ASCII letters, digits, or the following characters : /_+=.@-  Don't end
  /// your secret name with a hyphen followed by six characters. If you do so,
  /// you risk confusion and unexpected results when searching for a secret by
  /// partial ARN. This is because Secrets Manager automatically adds a hyphen
  /// and six random characters at the end of the ARN.
  @JsonKey(name: 'Name')
  final String name;

  /// (Optional) If you include SecretString or SecretBinary, then an initial
  /// version is created as part of the secret, and this parameter specifies
  /// a unique identifier for the new version.   If you use the AWS CLI or one
  /// of the AWS SDK to call this operation, then you can leave this parameter
  /// empty. The CLI or SDK generates a random UUID for you and includes it as
  /// the value for this parameter in the request. If you don't use the SDK and
  /// instead generate a raw HTTP request to the Secrets Manager service endpoint,
  /// then you must generate a ClientRequestToken yourself for the new version
  /// and include that value in the request.  This value helps ensure idempotency.
  /// Secrets Manager uses this value to prevent the accidental creation of duplicate
  /// versions if there are failures and retries during a rotation. We recommend
  /// that you generate a UUID-type value to ensure uniqueness of your versions
  /// within the specified secret.    If the ClientRequestToken value isn't already
  /// associated with a version of the secret then a new version of the secret
  /// is created.    If a version with this value already exists and that version's
  /// SecretString and SecretBinary values are the same as those in the request,
  /// then the request is ignored (the operation is idempotent).   If a version
  /// with this value already exists and that version's SecretString and SecretBinary
  /// values are different from those in the request then the request fails because
  /// you cannot modify an existing version. Instead, use PutSecretValue to create
  /// a new version.   This value becomes the VersionId of the new version.
  @JsonKey(name: 'ClientRequestToken')
  final String clientRequestToken;

  /// (Optional) Specifies a user-provided description of the secret.
  @JsonKey(name: 'Description')
  final String description;

  /// (Optional) Specifies the ARN, Key ID, or alias of the AWS KMS customer
  /// master key (CMK) to be used to encrypt the SecretString or SecretBinary
  /// values in the versions stored in this secret. You can specify any of the
  /// supported ways to identify a AWS KMS key ID. If you need to reference a
  /// CMK in a different account, you can use only the key ARN or the alias ARN.
  /// If you don't specify this value, then Secrets Manager defaults to using
  /// the AWS account's default CMK (the one named aws/secretsmanager). If a
  /// AWS KMS CMK with that name doesn't yet exist, then Secrets Manager creates
  /// it for you automatically the first time it needs to encrypt a version's
  /// SecretString or SecretBinary fields.  You can use the account's default
  /// CMK to encrypt and decrypt only if you call this operation using credentials
  /// from the same account that owns the secret. If the secret is in a different
  /// account, then you must create a custom CMK and specify the ARN in this
  /// field.
  @JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// (Optional) Specifies binary data that you want to encrypt and store in
  /// the new version of the secret. To use this parameter in the command-line
  /// tools, we recommend that you store your binary data in a file and then
  /// use the appropriate technique for your tool to pass the contents of the
  /// file as a parameter. Either SecretString or SecretBinary must have a value,
  /// but not both. They cannot both be empty. This parameter is not available
  /// using the Secrets Manager console. It can be accessed only by using the
  /// AWS CLI or one of the AWS SDKs.
  @JsonKey(name: 'SecretBinary')
  @Base64Converter()
  final String secretBinary;

  /// (Optional) Specifies text data that you want to encrypt and store in this
  /// new version of the secret. Either SecretString or SecretBinary must have
  /// a value, but not both. They cannot both be empty. If you create a secret
  /// by using the Secrets Manager console then Secrets Manager puts the protected
  /// secret text in only the SecretString parameter. The Secrets Manager console
  /// stores the information as a JSON structure of key/value pairs that the
  /// Lambda rotation function knows how to parse. For storing multiple values,
  /// we recommend that you use a JSON text string argument and specify key/value
  /// pairs. For information on how to format a JSON parameter for the various
  /// command line tool environments, see Using JSON for Parameters in the AWS
  /// CLI User Guide. For example:  [{"username":"bob"},{"password":"abc123xyz456"}]
  ///  If your command-line tool or SDK requires quotation marks around the parameter,
  /// you should use single quotes to avoid confusion with the double quotes
  /// required in the JSON text.
  @JsonKey(name: 'SecretString')
  final String secretString;

  /// (Optional) Specifies a list of user-defined tags that are attached to the
  /// secret. Each tag is a "Key" and "Value" pair of strings. This operation
  /// only appends tags to the existing list of tags. To remove tags, you must
  /// use UntagResource.    Secrets Manager tag key names are case sensitive.
  /// A tag with the key "ABC" is a different tag from one with key "abc".
  /// If you check tags in IAM policy Condition elements as part of your security
  /// strategy, then adding or removing a tag can change permissions. If the
  /// successful completion of this operation would result in you losing your
  /// permissions for this secret, then this operation is blocked and returns
  /// an Access Denied error.    This parameter requires a JSON text string argument.
  /// For information on how to format a JSON parameter for the various command
  /// line tool environments, see Using JSON for Parameters in the AWS CLI User
  /// Guide. For example:  [{"Key":"CostCenter","Value":"12345"},{"Key":"environment","Value":"production"}]
  ///  If your command-line tool or SDK requires quotation marks around the parameter,
  /// you should use single quotes to avoid confusion with the double quotes
  /// required in the JSON text.  The following basic restrictions apply to tags:
  ///   Maximum number of tags per secret—50   Maximum key length—127 Unicode
  /// characters in UTF-8   Maximum value length—255 Unicode characters in UTF-8
  ///   Tag keys and values are case sensitive.   Do not use the aws: prefix
  /// in your tag names or values because it is reserved for AWS use. You can't
  /// edit or delete tag names or values with this prefix. Tags with this prefix
  /// do not count against your tags per secret limit.   If your tagging schema
  /// will be used across multiple services and resources, remember that other
  /// services might have restrictions on allowed characters. Generally allowed
  /// characters are: letters, spaces, and numbers representable in UTF-8, plus
  /// the following special characters: + - = . _ : / @.
  @JsonKey(name: 'Tags')
  final List<Tag> tags;

  CreateSecretRequest({
    @required this.name,
    this.clientRequestToken,
    this.description,
    this.kmsKeyId,
    this.secretBinary,
    this.secretString,
    this.tags,
  });

  factory CreateSecretRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSecretRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSecretRequestToJson(this);
}

@JsonSerializable()
class CreateSecretResponse {
  /// The Amazon Resource Name (ARN) of the secret that you just created.  Secrets
  /// Manager automatically adds several random characters to the name at the
  /// end of the ARN when you initially create a secret. This affects only the
  /// ARN and not the actual friendly name. This ensures that if you create a
  /// new secret with the same name as an old secret that you previously deleted,
  /// then users with access to the old secret don't automatically get access
  /// to the new secret because the ARNs are different.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret that you just created.
  @JsonKey(name: 'Name')
  final String name;

  /// The unique identifier that's associated with the version of the secret
  /// you just created.
  @JsonKey(name: 'VersionId')
  final String versionId;

  CreateSecretResponse({
    this.aRN,
    this.name,
    this.versionId,
  });

  factory CreateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSecretResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSecretResponseToJson(this);
}

@JsonSerializable()
class DeleteResourcePolicyRequest {
  /// Specifies the secret that you want to delete the attached resource-based
  /// policy for. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.  If you specify an ARN, we generally recommend
  /// that you specify a complete ARN. You can specify a partial ARN too—for
  /// example, if you don’t include the final hyphen and six random characters
  /// that Secrets Manager adds at the end of the ARN when you created the secret.
  /// A partial ARN match can work as long as it uniquely matches only one secret.
  /// However, if your secret has a name that ends in a hyphen followed by six
  /// characters (before Secrets Manager adds the hyphen and six characters to
  /// the ARN) and you try to use that as a partial ARN, then those characters
  /// cause Secrets Manager to assume that you’re specifying a complete ARN.
  /// This confusion can cause unexpected results. To avoid this situation, we
  /// recommend that you don’t create secret names that end with a hyphen followed
  /// by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  DeleteResourcePolicyRequest({
    @required this.secretId,
  });

  factory DeleteResourcePolicyRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourcePolicyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteResourcePolicyRequestToJson(this);
}

@JsonSerializable()
class DeleteResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was deleted for.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret that the resource-based policy was deleted
  /// for.
  @JsonKey(name: 'Name')
  final String name;

  DeleteResourcePolicyResponse({
    this.aRN,
    this.name,
  });

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourcePolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteResourcePolicyResponseToJson(this);
}

@JsonSerializable()
class DeleteSecretRequest {
  /// Specifies the secret that you want to delete. You can specify either the
  /// Amazon Resource Name (ARN) or the friendly name of the secret.  If you
  /// specify an ARN, we generally recommend that you specify a complete ARN.
  /// You can specify a partial ARN too—for example, if you don’t include the
  /// final hyphen and six random characters that Secrets Manager adds at the
  /// end of the ARN when you created the secret. A partial ARN match can work
  /// as long as it uniquely matches only one secret. However, if your secret
  /// has a name that ends in a hyphen followed by six characters (before Secrets
  /// Manager adds the hyphen and six characters to the ARN) and you try to use
  /// that as a partial ARN, then those characters cause Secrets Manager to assume
  /// that you’re specifying a complete ARN. This confusion can cause unexpected
  /// results. To avoid this situation, we recommend that you don’t create secret
  /// names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// (Optional) Specifies the number of days that Secrets Manager waits before
  /// it can delete the secret. You can't use both this parameter and the ForceDeleteWithoutRecovery
  /// parameter in the same API call. This value can range from 7 to 30 days.
  /// The default value is 30.
  @JsonKey(name: 'RecoveryWindowInDays')
  final int recoveryWindowInDays;

  /// (Optional) Specifies that the secret is to be deleted without any recovery
  /// window. You can't use both this parameter and the RecoveryWindowInDays
  /// parameter in the same API call. An asynchronous background process performs
  /// the actual deletion, so there can be a short delay before the operation
  /// completes. If you write code to delete and then immediately recreate a
  /// secret with the same name, ensure that your code includes appropriate back
  /// off and retry logic.  Use this parameter with caution. This parameter causes
  /// the operation to skip the normal waiting period before the permanent deletion
  /// that AWS would normally impose with the RecoveryWindowInDays parameter.
  /// If you delete a secret with the ForceDeleteWithouRecovery parameter, then
  /// you have no opportunity to recover the secret. It is permanently lost.
  @JsonKey(name: 'ForceDeleteWithoutRecovery')
  final bool forceDeleteWithoutRecovery;

  DeleteSecretRequest({
    @required this.secretId,
    this.recoveryWindowInDays,
    this.forceDeleteWithoutRecovery,
  });

  factory DeleteSecretRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteSecretRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteSecretRequestToJson(this);
}

@JsonSerializable()
class DeleteSecretResponse {
  /// The ARN of the secret that is now scheduled for deletion.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret that is now scheduled for deletion.
  @JsonKey(name: 'Name')
  final String name;

  /// The date and time after which this secret can be deleted by Secrets Manager
  /// and can no longer be restored. This value is the date and time of the delete
  /// request plus the number of days specified in RecoveryWindowInDays.
  @JsonKey(name: 'DeletionDate')
  final String deletionDate;

  DeleteSecretResponse({
    this.aRN,
    this.name,
    this.deletionDate,
  });

  factory DeleteSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSecretResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteSecretResponseToJson(this);
}

@JsonSerializable()
class DescribeSecretRequest {
  /// The identifier of the secret whose details you want to retrieve. You can
  /// specify either the Amazon Resource Name (ARN) or the friendly name of the
  /// secret.  If you specify an ARN, we generally recommend that you specify
  /// a complete ARN. You can specify a partial ARN too—for example, if you don’t
  /// include the final hyphen and six random characters that Secrets Manager
  /// adds at the end of the ARN when you created the secret. A partial ARN match
  /// can work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you
  /// try to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  DescribeSecretRequest({
    @required this.secretId,
  });

  factory DescribeSecretRequest.fromJson(Map<String, dynamic> json) =>
      _$DescribeSecretRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeSecretRequestToJson(this);
}

@JsonSerializable()
class DescribeSecretResponse {
  /// The ARN of the secret.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The user-provided friendly name of the secret.
  @JsonKey(name: 'Name')
  final String name;

  /// The user-provided description of the secret.
  @JsonKey(name: 'Description')
  final String description;

  /// The ARN or alias of the AWS KMS customer master key (CMK) that's used to
  /// encrypt the SecretString or SecretBinary fields in each version of the
  /// secret. If you don't provide a key, then Secrets Manager defaults to encrypting
  /// the secret fields with the default AWS KMS CMK (the one named awssecretsmanager)
  /// for this account.
  @JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// Specifies whether automatic rotation is enabled for this secret. To enable
  /// rotation, use RotateSecret with AutomaticallyRotateAfterDays set to a value
  /// greater than 0. To disable rotation, use CancelRotateSecret.
  @JsonKey(name: 'RotationEnabled')
  final bool rotationEnabled;

  /// The ARN of a Lambda function that's invoked by Secrets Manager to rotate
  /// the secret either automatically per the schedule or manually by a call
  /// to RotateSecret.
  @JsonKey(name: 'RotationLambdaARN')
  final String rotationLambdaARN;

  /// A structure that contains the rotation configuration for this secret.
  @JsonKey(name: 'RotationRules')
  final RotationRulesType rotationRules;

  /// The most recent date and time that the Secrets Manager rotation process
  /// was successfully completed. This value is null if the secret has never
  /// rotated.
  @JsonKey(name: 'LastRotatedDate')
  final String lastRotatedDate;

  /// The last date and time that this secret was modified in any way.
  @JsonKey(name: 'LastChangedDate')
  final String lastChangedDate;

  /// The last date that this secret was accessed. This value is truncated to
  /// midnight of the date and therefore shows only the date, not the time.
  @JsonKey(name: 'LastAccessedDate')
  final String lastAccessedDate;

  /// This value exists if the secret is scheduled for deletion. Some time after
  /// the specified date and time, Secrets Manager deletes the secret and all
  /// of its versions. If a secret is scheduled for deletion, then its details,
  /// including the encrypted secret information, is not accessible. To cancel
  /// a scheduled deletion and restore access, use RestoreSecret.
  @JsonKey(name: 'DeletedDate')
  final String deletedDate;

  /// The list of user-defined tags that are associated with the secret. To add
  /// tags to a secret, use TagResource. To remove tags, use UntagResource.
  @JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A list of all of the currently assigned VersionStage staging labels and
  /// the VersionId that each is attached to. Staging labels are used to keep
  /// track of the different versions during the rotation process.  A version
  /// that does not have any staging labels attached is considered deprecated
  /// and subject to deletion. Such versions are not included in this list.
  @JsonKey(name: 'VersionIdsToStages')
  final Map<String, List<String>> versionIdsToStages;
  @JsonKey(name: 'OwningService')
  final String owningService;

  DescribeSecretResponse({
    this.aRN,
    this.name,
    this.description,
    this.kmsKeyId,
    this.rotationEnabled,
    this.rotationLambdaARN,
    this.rotationRules,
    this.lastRotatedDate,
    this.lastChangedDate,
    this.lastAccessedDate,
    this.deletedDate,
    this.tags,
    this.versionIdsToStages,
    this.owningService,
  });

  factory DescribeSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSecretResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DescribeSecretResponseToJson(this);
}

@JsonSerializable()
class GetRandomPasswordRequest {
  /// The desired length of the generated password. The default value if you
  /// do not include this parameter is 32 characters.
  @JsonKey(name: 'PasswordLength')
  final int passwordLength;

  /// A string that includes characters that should not be included in the generated
  /// password. The default is that all characters from the included sets can
  /// be used.
  @JsonKey(name: 'ExcludeCharacters')
  final String excludeCharacters;

  /// Specifies that the generated password should not include digits. The default
  /// if you do not include this switch parameter is that digits can be included.
  @JsonKey(name: 'ExcludeNumbers')
  final bool excludeNumbers;

  /// Specifies that the generated password should not include punctuation characters.
  /// The default if you do not include this switch parameter is that punctuation
  /// characters can be included. The following are the punctuation characters
  /// that can be included in the generated password if you don't explicitly
  /// exclude them with ExcludeCharacters or ExcludePunctuation:  ! " # $ % &
  /// ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~
  @JsonKey(name: 'ExcludePunctuation')
  final bool excludePunctuation;

  /// Specifies that the generated password should not include uppercase letters.
  /// The default if you do not include this switch parameter is that uppercase
  /// letters can be included.
  @JsonKey(name: 'ExcludeUppercase')
  final bool excludeUppercase;

  /// Specifies that the generated password should not include lowercase letters.
  /// The default if you do not include this switch parameter is that lowercase
  /// letters can be included.
  @JsonKey(name: 'ExcludeLowercase')
  final bool excludeLowercase;

  /// Specifies that the generated password can include the space character.
  /// The default if you do not include this switch parameter is that the space
  /// character is not included.
  @JsonKey(name: 'IncludeSpace')
  final bool includeSpace;

  /// A boolean value that specifies whether the generated password must include
  /// at least one of every allowed character type. The default value is True
  /// and the operation requires at least one of every character type.
  @JsonKey(name: 'RequireEachIncludedType')
  final bool requireEachIncludedType;

  GetRandomPasswordRequest({
    this.passwordLength,
    this.excludeCharacters,
    this.excludeNumbers,
    this.excludePunctuation,
    this.excludeUppercase,
    this.excludeLowercase,
    this.includeSpace,
    this.requireEachIncludedType,
  });

  factory GetRandomPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRandomPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRandomPasswordRequestToJson(this);
}

@JsonSerializable()
class GetRandomPasswordResponse {
  /// A string with the generated password.
  @JsonKey(name: 'RandomPassword')
  final String randomPassword;

  GetRandomPasswordResponse({
    this.randomPassword,
  });

  factory GetRandomPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRandomPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRandomPasswordResponseToJson(this);
}

@JsonSerializable()
class GetResourcePolicyRequest {
  /// Specifies the secret that you want to retrieve the attached resource-based
  /// policy for. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.  If you specify an ARN, we generally recommend
  /// that you specify a complete ARN. You can specify a partial ARN too—for
  /// example, if you don’t include the final hyphen and six random characters
  /// that Secrets Manager adds at the end of the ARN when you created the secret.
  /// A partial ARN match can work as long as it uniquely matches only one secret.
  /// However, if your secret has a name that ends in a hyphen followed by six
  /// characters (before Secrets Manager adds the hyphen and six characters to
  /// the ARN) and you try to use that as a partial ARN, then those characters
  /// cause Secrets Manager to assume that you’re specifying a complete ARN.
  /// This confusion can cause unexpected results. To avoid this situation, we
  /// recommend that you don’t create secret names that end with a hyphen followed
  /// by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  GetResourcePolicyRequest({
    @required this.secretId,
  });

  factory GetResourcePolicyRequest.fromJson(Map<String, dynamic> json) =>
      _$GetResourcePolicyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetResourcePolicyRequestToJson(this);
}

@JsonSerializable()
class GetResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was retrieved for.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret that the resource-based policy was retrieved
  /// for.
  @JsonKey(name: 'Name')
  final String name;

  /// A JSON-formatted string that describes the permissions that are associated
  /// with the attached secret. These permissions are combined with any permissions
  /// that are associated with the user or role that attempts to access this
  /// secret. The combined permissions specify who can access the secret and
  /// what actions they can perform. For more information, see Authentication
  /// and Access Control for AWS Secrets Manager in the AWS Secrets Manager User
  /// Guide.
  @JsonKey(name: 'ResourcePolicy')
  final String resourcePolicy;

  GetResourcePolicyResponse({
    this.aRN,
    this.name,
    this.resourcePolicy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourcePolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetResourcePolicyResponseToJson(this);
}

@JsonSerializable()
class GetSecretValueRequest {
  /// Specifies the secret containing the version that you want to retrieve.
  /// You can specify either the Amazon Resource Name (ARN) or the friendly name
  /// of the secret.  If you specify an ARN, we generally recommend that you
  /// specify a complete ARN. You can specify a partial ARN too—for example,
  /// if you don’t include the final hyphen and six random characters that Secrets
  /// Manager adds at the end of the ARN when you created the secret. A partial
  /// ARN match can work as long as it uniquely matches only one secret. However,
  /// if your secret has a name that ends in a hyphen followed by six characters
  /// (before Secrets Manager adds the hyphen and six characters to the ARN)
  /// and you try to use that as a partial ARN, then those characters cause Secrets
  /// Manager to assume that you’re specifying a complete ARN. This confusion
  /// can cause unexpected results. To avoid this situation, we recommend that
  /// you don’t create secret names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// Specifies the unique identifier of the version of the secret that you want
  /// to retrieve. If you specify this parameter then don't specify VersionStage.
  /// If you don't specify either a VersionStage or VersionId then the default
  /// is to perform the operation on the version with the VersionStage value
  /// of AWSCURRENT. This value is typically a UUID-type value with 32 hexadecimal
  /// digits.
  @JsonKey(name: 'VersionId')
  final String versionId;

  /// Specifies the secret version that you want to retrieve by the staging label
  /// attached to the version. Staging labels are used to keep track of different
  /// versions during the rotation process. If you use this parameter then don't
  /// specify VersionId. If you don't specify either a VersionStage or VersionId,
  /// then the default is to perform the operation on the version with the VersionStage
  /// value of AWSCURRENT.
  @JsonKey(name: 'VersionStage')
  final String versionStage;

  GetSecretValueRequest({
    @required this.secretId,
    this.versionId,
    this.versionStage,
  });

  factory GetSecretValueRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSecretValueRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSecretValueRequestToJson(this);
}

@JsonSerializable()
class GetSecretValueResponse {
  /// The ARN of the secret.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret.
  @JsonKey(name: 'Name')
  final String name;

  /// The unique identifier of this version of the secret.
  @JsonKey(name: 'VersionId')
  final String versionId;

  /// The decrypted part of the protected secret information that was originally
  /// provided as binary data in the form of a byte array. The response parameter
  /// represents the binary data as a base64-encoded string. This parameter is
  /// not used if the secret is created by the Secrets Manager console. If you
  /// store custom information in this field of the secret, then you must code
  /// your Lambda rotation function to parse and interpret whatever you store
  /// in the SecretString or SecretBinary fields.
  @JsonKey(name: 'SecretBinary')
  @Base64Converter()
  final String secretBinary;

  /// The decrypted part of the protected secret information that was originally
  /// provided as a string. If you create this secret by using the Secrets Manager
  /// console then only the SecretString parameter contains data. Secrets Manager
  /// stores the information as a JSON structure of key/value pairs that the
  /// Lambda rotation function knows how to parse. If you store custom information
  /// in the secret by using the CreateSecret, UpdateSecret, or PutSecretValue
  /// API operations instead of the Secrets Manager console, or by using the
  /// Other secret type in the console, then you must code your Lambda rotation
  /// function to parse and interpret those values.
  @JsonKey(name: 'SecretString')
  final String secretString;

  /// A list of all of the staging labels currently attached to this version
  /// of the secret.
  @JsonKey(name: 'VersionStages')
  final List<String> versionStages;

  /// The date and time that this version of the secret was created.
  @JsonKey(name: 'CreatedDate')
  final String createdDate;

  GetSecretValueResponse({
    this.aRN,
    this.name,
    this.versionId,
    this.secretBinary,
    this.secretString,
    this.versionStages,
    this.createdDate,
  });

  factory GetSecretValueResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSecretValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSecretValueResponseToJson(this);
}

@JsonSerializable()
class ListSecretVersionIdsRequest {
  /// The identifier for the secret containing the versions you want to list.
  /// You can specify either the Amazon Resource Name (ARN) or the friendly name
  /// of the secret.  If you specify an ARN, we generally recommend that you
  /// specify a complete ARN. You can specify a partial ARN too—for example,
  /// if you don’t include the final hyphen and six random characters that Secrets
  /// Manager adds at the end of the ARN when you created the secret. A partial
  /// ARN match can work as long as it uniquely matches only one secret. However,
  /// if your secret has a name that ends in a hyphen followed by six characters
  /// (before Secrets Manager adds the hyphen and six characters to the ARN)
  /// and you try to use that as a partial ARN, then those characters cause Secrets
  /// Manager to assume that you’re specifying a complete ARN. This confusion
  /// can cause unexpected results. To avoid this situation, we recommend that
  /// you don’t create secret names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, it defaults to a value that's
  /// specific to the operation. If additional items exist beyond the maximum
  /// you specify, the NextToken response element is present and has a value
  /// (isn't null). Include that value as the NextToken request parameter in
  /// the next call to the operation to get the next part of the results. Note
  /// that Secrets Manager might return fewer results than the maximum even when
  /// there are more results available. You should check NextToken after every
  /// operation to ensure that you receive all of the results.
  @JsonKey(name: 'MaxResults')
  final int maxResults;

  /// (Optional) Use this parameter in a request if you receive a NextToken response
  /// in a previous request that indicates that there's more output available.
  /// In a subsequent call, set it to the value of the previous call's NextToken
  /// response to indicate where the output should continue from.
  @JsonKey(name: 'NextToken')
  final String nextToken;

  /// (Optional) Specifies that you want the results to include versions that
  /// do not have any staging labels attached to them. Such versions are considered
  /// deprecated and are subject to deletion by Secrets Manager as needed.
  @JsonKey(name: 'IncludeDeprecated')
  final bool includeDeprecated;

  ListSecretVersionIdsRequest({
    @required this.secretId,
    this.maxResults,
    this.nextToken,
    this.includeDeprecated,
  });

  factory ListSecretVersionIdsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListSecretVersionIdsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListSecretVersionIdsRequestToJson(this);
}

@JsonSerializable()
class ListSecretVersionIdsResponse {
  /// The list of the currently available versions of the specified secret.
  @JsonKey(name: 'Versions')
  final List<SecretVersionsListEntry> versions;

  /// If present in the response, this value indicates that there's more output
  /// available than what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask
  /// for a filtered view of a very long list. Use this value in the NextToken
  /// request parameter in a subsequent call to the operation to continue processing
  /// and get the next part of the output. You should repeat this until the NextToken
  /// response element comes back empty (as null).
  @JsonKey(name: 'NextToken')
  final String nextToken;

  /// The Amazon Resource Name (ARN) for the secret.  Secrets Manager automatically
  /// adds several random characters to the name at the end of the ARN when you
  /// initially create a secret. This affects only the ARN and not the actual
  /// friendly name. This ensures that if you create a new secret with the same
  /// name as an old secret that you previously deleted, then users with access
  /// to the old secret don't automatically get access to the new secret because
  /// the ARNs are different.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret.
  @JsonKey(name: 'Name')
  final String name;

  ListSecretVersionIdsResponse({
    this.versions,
    this.nextToken,
    this.aRN,
    this.name,
  });

  factory ListSecretVersionIdsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecretVersionIdsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListSecretVersionIdsResponseToJson(this);
}

@JsonSerializable()
class ListSecretsRequest {
  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, it defaults to a value that's
  /// specific to the operation. If additional items exist beyond the maximum
  /// you specify, the NextToken response element is present and has a value
  /// (isn't null). Include that value as the NextToken request parameter in
  /// the next call to the operation to get the next part of the results. Note
  /// that Secrets Manager might return fewer results than the maximum even when
  /// there are more results available. You should check NextToken after every
  /// operation to ensure that you receive all of the results.
  @JsonKey(name: 'MaxResults')
  final int maxResults;

  /// (Optional) Use this parameter in a request if you receive a NextToken response
  /// in a previous request that indicates that there's more output available.
  /// In a subsequent call, set it to the value of the previous call's NextToken
  /// response to indicate where the output should continue from.
  @JsonKey(name: 'NextToken')
  final String nextToken;

  ListSecretsRequest({
    this.maxResults,
    this.nextToken,
  });

  factory ListSecretsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListSecretsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListSecretsRequestToJson(this);
}

@JsonSerializable()
class ListSecretsResponse {
  /// A list of the secrets in the account.
  @JsonKey(name: 'SecretList')
  final List<SecretListEntry> secretList;

  /// If present in the response, this value indicates that there's more output
  /// available than what's included in the current response. This can occur
  /// even when the response includes no values at all, such as when you ask
  /// for a filtered view of a very long list. Use this value in the NextToken
  /// request parameter in a subsequent call to the operation to continue processing
  /// and get the next part of the output. You should repeat this until the NextToken
  /// response element comes back empty (as null).
  @JsonKey(name: 'NextToken')
  final String nextToken;

  ListSecretsResponse({
    this.secretList,
    this.nextToken,
  });

  factory ListSecretsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecretsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListSecretsResponseToJson(this);
}

@JsonSerializable()
class PutResourcePolicyRequest {
  /// Specifies the secret that you want to attach the resource-based policy
  /// to. You can specify either the ARN or the friendly name of the secret.
  ///  If you specify an ARN, we generally recommend that you specify a complete
  /// ARN. You can specify a partial ARN too—for example, if you don’t include
  /// the final hyphen and six random characters that Secrets Manager adds at
  /// the end of the ARN when you created the secret. A partial ARN match can
  /// work as long as it uniquely matches only one secret. However, if your secret
  /// has a name that ends in a hyphen followed by six characters (before Secrets
  /// Manager adds the hyphen and six characters to the ARN) and you try to use
  /// that as a partial ARN, then those characters cause Secrets Manager to assume
  /// that you’re specifying a complete ARN. This confusion can cause unexpected
  /// results. To avoid this situation, we recommend that you don’t create secret
  /// names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// A JSON-formatted string that's constructed according to the grammar and
  /// syntax for an AWS resource-based policy. The policy in the string identifies
  /// who can access or manage this secret and its versions. For information
  /// on how to format a JSON parameter for the various command line tool environments,
  /// see Using JSON for Parameters in the AWS CLI User Guide.
  @JsonKey(name: 'ResourcePolicy')
  final String resourcePolicy;

  PutResourcePolicyRequest({
    @required this.secretId,
    @required this.resourcePolicy,
  });

  factory PutResourcePolicyRequest.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutResourcePolicyRequestToJson(this);
}

@JsonSerializable()
class PutResourcePolicyResponse {
  /// The ARN of the secret that the resource-based policy was retrieved for.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret that the resource-based policy was retrieved
  /// for.
  @JsonKey(name: 'Name')
  final String name;

  PutResourcePolicyResponse({
    this.aRN,
    this.name,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PutResourcePolicyResponseToJson(this);
}

@JsonSerializable()
class PutSecretValueRequest {
  /// Specifies the secret to which you want to add a new version. You can specify
  /// either the Amazon Resource Name (ARN) or the friendly name of the secret.
  /// The secret must already exist.  If you specify an ARN, we generally recommend
  /// that you specify a complete ARN. You can specify a partial ARN too—for
  /// example, if you don’t include the final hyphen and six random characters
  /// that Secrets Manager adds at the end of the ARN when you created the secret.
  /// A partial ARN match can work as long as it uniquely matches only one secret.
  /// However, if your secret has a name that ends in a hyphen followed by six
  /// characters (before Secrets Manager adds the hyphen and six characters to
  /// the ARN) and you try to use that as a partial ARN, then those characters
  /// cause Secrets Manager to assume that you’re specifying a complete ARN.
  /// This confusion can cause unexpected results. To avoid this situation, we
  /// recommend that you don’t create secret names that end with a hyphen followed
  /// by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// (Optional) Specifies a unique identifier for the new version of the secret.
  ///   If you use the AWS CLI or one of the AWS SDK to call this operation,
  /// then you can leave this parameter empty. The CLI or SDK generates a random
  /// UUID for you and includes that in the request. If you don't use the SDK
  /// and instead generate a raw HTTP request to the Secrets Manager service
  /// endpoint, then you must generate a ClientRequestToken yourself for new
  /// versions and include that value in the request.   This value helps ensure
  /// idempotency. Secrets Manager uses this value to prevent the accidental
  /// creation of duplicate versions if there are failures and retries during
  /// the Lambda rotation function's processing. We recommend that you generate
  /// a UUID-type value to ensure uniqueness within the specified secret.
  /// If the ClientRequestToken value isn't already associated with a version
  /// of the secret then a new version of the secret is created.    If a version
  /// with this value already exists and that version's SecretString or SecretBinary
  /// values are the same as those in the request then the request is ignored
  /// (the operation is idempotent).    If a version with this value already
  /// exists and that version's SecretString and SecretBinary values are different
  /// from those in the request then the request fails because you cannot modify
  /// an existing secret version. You can only create new versions to store new
  /// secret values.   This value becomes the VersionId of the new version.
  @JsonKey(name: 'ClientRequestToken')
  final String clientRequestToken;

  /// (Optional) Specifies binary data that you want to encrypt and store in
  /// the new version of the secret. To use this parameter in the command-line
  /// tools, we recommend that you store your binary data in a file and then
  /// use the appropriate technique for your tool to pass the contents of the
  /// file as a parameter. Either SecretBinary or SecretString must have a value,
  /// but not both. They cannot both be empty. This parameter is not accessible
  /// if the secret using the Secrets Manager console.
  @JsonKey(name: 'SecretBinary')
  @Base64Converter()
  final String secretBinary;

  /// (Optional) Specifies text data that you want to encrypt and store in this
  /// new version of the secret. Either SecretString or SecretBinary must have
  /// a value, but not both. They cannot both be empty. If you create this secret
  /// by using the Secrets Manager console then Secrets Manager puts the protected
  /// secret text in only the SecretString parameter. The Secrets Manager console
  /// stores the information as a JSON structure of key/value pairs that the
  /// default Lambda rotation function knows how to parse. For storing multiple
  /// values, we recommend that you use a JSON text string argument and specify
  /// key/value pairs. For information on how to format a JSON parameter for
  /// the various command line tool environments, see Using JSON for Parameters
  /// in the AWS CLI User Guide.  For example:  [{"username":"bob"},{"password":"abc123xyz456"}]
  ///  If your command-line tool or SDK requires quotation marks around the parameter,
  /// you should use single quotes to avoid confusion with the double quotes
  /// required in the JSON text.
  @JsonKey(name: 'SecretString')
  final String secretString;

  /// (Optional) Specifies a list of staging labels that are attached to this
  /// version of the secret. These staging labels are used to track the versions
  /// through the rotation process by the Lambda rotation function. A staging
  /// label must be unique to a single version of the secret. If you specify
  /// a staging label that's already associated with a different version of the
  /// same secret then that staging label is automatically removed from the other
  /// version and attached to this version. If you do not specify a value for
  /// VersionStages then Secrets Manager automatically moves the staging label
  /// AWSCURRENT to this new version.
  @JsonKey(name: 'VersionStages')
  final List<String> versionStages;

  PutSecretValueRequest({
    @required this.secretId,
    this.clientRequestToken,
    this.secretBinary,
    this.secretString,
    this.versionStages,
  });

  factory PutSecretValueRequest.fromJson(Map<String, dynamic> json) =>
      _$PutSecretValueRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutSecretValueRequestToJson(this);
}

@JsonSerializable()
class PutSecretValueResponse {
  /// The Amazon Resource Name (ARN) for the secret for which you just created
  /// a version.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret for which you just created or updated a
  /// version.
  @JsonKey(name: 'Name')
  final String name;

  /// The unique identifier of the version of the secret you just created or
  /// updated.
  @JsonKey(name: 'VersionId')
  final String versionId;

  /// The list of staging labels that are currently attached to this version
  /// of the secret. Staging labels are used to track a version as it progresses
  /// through the secret rotation process.
  @JsonKey(name: 'VersionStages')
  final List<String> versionStages;

  PutSecretValueResponse({
    this.aRN,
    this.name,
    this.versionId,
    this.versionStages,
  });

  factory PutSecretValueResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSecretValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PutSecretValueResponseToJson(this);
}

@JsonSerializable()
class RestoreSecretRequest {
  /// Specifies the secret that you want to restore from a previously scheduled
  /// deletion. You can specify either the Amazon Resource Name (ARN) or the
  /// friendly name of the secret.  If you specify an ARN, we generally recommend
  /// that you specify a complete ARN. You can specify a partial ARN too—for
  /// example, if you don’t include the final hyphen and six random characters
  /// that Secrets Manager adds at the end of the ARN when you created the secret.
  /// A partial ARN match can work as long as it uniquely matches only one secret.
  /// However, if your secret has a name that ends in a hyphen followed by six
  /// characters (before Secrets Manager adds the hyphen and six characters to
  /// the ARN) and you try to use that as a partial ARN, then those characters
  /// cause Secrets Manager to assume that you’re specifying a complete ARN.
  /// This confusion can cause unexpected results. To avoid this situation, we
  /// recommend that you don’t create secret names that end with a hyphen followed
  /// by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  RestoreSecretRequest({
    @required this.secretId,
  });

  factory RestoreSecretRequest.fromJson(Map<String, dynamic> json) =>
      _$RestoreSecretRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RestoreSecretRequestToJson(this);
}

@JsonSerializable()
class RestoreSecretResponse {
  /// The ARN of the secret that was restored.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret that was restored.
  @JsonKey(name: 'Name')
  final String name;

  RestoreSecretResponse({
    this.aRN,
    this.name,
  });

  factory RestoreSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$RestoreSecretResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestoreSecretResponseToJson(this);
}

@JsonSerializable()
class RotateSecretRequest {
  /// Specifies the secret that you want to rotate. You can specify either the
  /// Amazon Resource Name (ARN) or the friendly name of the secret.  If you
  /// specify an ARN, we generally recommend that you specify a complete ARN.
  /// You can specify a partial ARN too—for example, if you don’t include the
  /// final hyphen and six random characters that Secrets Manager adds at the
  /// end of the ARN when you created the secret. A partial ARN match can work
  /// as long as it uniquely matches only one secret. However, if your secret
  /// has a name that ends in a hyphen followed by six characters (before Secrets
  /// Manager adds the hyphen and six characters to the ARN) and you try to use
  /// that as a partial ARN, then those characters cause Secrets Manager to assume
  /// that you’re specifying a complete ARN. This confusion can cause unexpected
  /// results. To avoid this situation, we recommend that you don’t create secret
  /// names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// (Optional) Specifies a unique identifier for the new version of the secret
  /// that helps ensure idempotency.  If you use the AWS CLI or one of the AWS
  /// SDK to call this operation, then you can leave this parameter empty. The
  /// CLI or SDK generates a random UUID for you and includes that in the request
  /// for this parameter. If you don't use the SDK and instead generate a raw
  /// HTTP request to the Secrets Manager service endpoint, then you must generate
  /// a ClientRequestToken yourself for new versions and include that value in
  /// the request. You only need to specify your own value if you are implementing
  /// your own retry logic and want to ensure that a given secret is not created
  /// twice. We recommend that you generate a UUID-type value to ensure uniqueness
  /// within the specified secret.  Secrets Manager uses this value to prevent
  /// the accidental creation of duplicate versions if there are failures and
  /// retries during the function's processing. This value becomes the VersionId
  /// of the new version.
  @JsonKey(name: 'ClientRequestToken')
  final String clientRequestToken;

  /// (Optional) Specifies the ARN of the Lambda function that can rotate the
  /// secret.
  @JsonKey(name: 'RotationLambdaARN')
  final String rotationLambdaARN;

  /// A structure that defines the rotation configuration for this secret.
  @JsonKey(name: 'RotationRules')
  final RotationRulesType rotationRules;

  RotateSecretRequest({
    @required this.secretId,
    this.clientRequestToken,
    this.rotationLambdaARN,
    this.rotationRules,
  });

  factory RotateSecretRequest.fromJson(Map<String, dynamic> json) =>
      _$RotateSecretRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RotateSecretRequestToJson(this);
}

@JsonSerializable()
class RotateSecretResponse {
  /// The ARN of the secret.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret.
  @JsonKey(name: 'Name')
  final String name;

  /// The ID of the new version of the secret created by the rotation started
  /// by this request.
  @JsonKey(name: 'VersionId')
  final String versionId;

  RotateSecretResponse({
    this.aRN,
    this.name,
    this.versionId,
  });

  factory RotateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$RotateSecretResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RotateSecretResponseToJson(this);
}

/// A structure that defines the rotation configuration for the secret.
@JsonSerializable()
class RotationRulesType {
  /// Specifies the number of days between automatic scheduled rotations of the
  /// secret. Secrets Manager schedules the next rotation when the previous one
  /// is complete. Secrets Manager schedules the date by adding the rotation
  /// interval (number of days) to the actual date of the last rotation. The
  /// service chooses the hour within that 24-hour date window randomly. The
  /// minute is also chosen somewhat randomly, but weighted towards the top of
  /// the hour and influenced by a variety of factors that help distribute load.
  @JsonKey(name: 'AutomaticallyAfterDays')
  final int automaticallyAfterDays;

  RotationRulesType({
    this.automaticallyAfterDays,
  });

  factory RotationRulesType.fromJson(Map<String, dynamic> json) =>
      _$RotationRulesTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RotationRulesTypeToJson(this);
}

/// A structure that contains the details about a secret. It does not include
/// the encrypted SecretString and SecretBinary values. To get those values,
/// use the GetSecretValue operation.
@JsonSerializable()
class SecretListEntry {
  /// The Amazon Resource Name (ARN) of the secret. For more information about
  /// ARNs in Secrets Manager, see Policy Resources in the AWS Secrets Manager
  /// User Guide.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret. You can use forward slashes in the name
  /// to represent a path hierarchy. For example, /prod/databases/dbserver1 could
  /// represent the secret for a server named dbserver1 in the folder databases
  /// in the folder prod.
  @JsonKey(name: 'Name')
  final String name;

  /// The user-provided description of the secret.
  @JsonKey(name: 'Description')
  final String description;

  /// The ARN or alias of the AWS KMS customer master key (CMK) that's used to
  /// encrypt the SecretString and SecretBinary fields in each version of the
  /// secret. If you don't provide a key, then Secrets Manager defaults to encrypting
  /// the secret fields with the default KMS CMK (the one named awssecretsmanager)
  /// for this account.
  @JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// Indicated whether automatic, scheduled rotation is enabled for this secret.
  @JsonKey(name: 'RotationEnabled')
  final bool rotationEnabled;

  /// The ARN of an AWS Lambda function that's invoked by Secrets Manager to
  /// rotate and expire the secret either automatically per the schedule or manually
  /// by a call to RotateSecret.
  @JsonKey(name: 'RotationLambdaARN')
  final String rotationLambdaARN;

  /// A structure that defines the rotation configuration for the secret.
  @JsonKey(name: 'RotationRules')
  final RotationRulesType rotationRules;

  /// The last date and time that the rotation process for this secret was invoked.
  @JsonKey(name: 'LastRotatedDate')
  final String lastRotatedDate;

  /// The last date and time that this secret was modified in any way.
  @JsonKey(name: 'LastChangedDate')
  final String lastChangedDate;

  /// The last date that this secret was accessed. This value is truncated to
  /// midnight of the date and therefore shows only the date, not the time.
  @JsonKey(name: 'LastAccessedDate')
  final String lastAccessedDate;

  /// The date and time on which this secret was deleted. Not present on active
  /// secrets. The secret can be recovered until the number of days in the recovery
  /// window has passed, as specified in the RecoveryWindowInDays parameter of
  /// the DeleteSecret operation.
  @JsonKey(name: 'DeletedDate')
  final String deletedDate;

  /// The list of user-defined tags that are associated with the secret. To add
  /// tags to a secret, use TagResource. To remove tags, use UntagResource.
  @JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// A list of all of the currently assigned SecretVersionStage staging labels
  /// and the SecretVersionId that each is attached to. Staging labels are used
  /// to keep track of the different versions during the rotation process.  A
  /// version that does not have any SecretVersionStage is considered deprecated
  /// and subject to deletion. Such versions are not included in this list.
  @JsonKey(name: 'SecretVersionsToStages')
  final Map<String, List<String>> secretVersionsToStages;
  @JsonKey(name: 'OwningService')
  final String owningService;

  SecretListEntry({
    this.aRN,
    this.name,
    this.description,
    this.kmsKeyId,
    this.rotationEnabled,
    this.rotationLambdaARN,
    this.rotationRules,
    this.lastRotatedDate,
    this.lastChangedDate,
    this.lastAccessedDate,
    this.deletedDate,
    this.tags,
    this.secretVersionsToStages,
    this.owningService,
  });

  factory SecretListEntry.fromJson(Map<String, dynamic> json) =>
      _$SecretListEntryFromJson(json);

  Map<String, dynamic> toJson() => _$SecretListEntryToJson(this);
}

/// A structure that contains information about one version of a secret.
@JsonSerializable()
class SecretVersionsListEntry {
  /// The unique version identifier of this version of the secret.
  @JsonKey(name: 'VersionId')
  final String versionId;

  /// An array of staging labels that are currently associated with this version
  /// of the secret.
  @JsonKey(name: 'VersionStages')
  final List<String> versionStages;

  /// The date that this version of the secret was last accessed. Note that the
  /// resolution of this field is at the date level and does not include the
  /// time.
  @JsonKey(name: 'LastAccessedDate')
  final String lastAccessedDate;

  /// The date and time this version of the secret was created.
  @JsonKey(name: 'CreatedDate')
  final String createdDate;

  SecretVersionsListEntry({
    this.versionId,
    this.versionStages,
    this.lastAccessedDate,
    this.createdDate,
  });

  factory SecretVersionsListEntry.fromJson(Map<String, dynamic> json) =>
      _$SecretVersionsListEntryFromJson(json);

  Map<String, dynamic> toJson() => _$SecretVersionsListEntryToJson(this);
}

/// A structure that contains information about a tag.
@JsonSerializable()
class Tag {
  /// The key identifier, or name, of the tag.
  @JsonKey(name: 'Key')
  final String key;

  /// The string value that's associated with the key of the tag.
  @JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class TagResourceRequest {
  /// The identifier for the secret that you want to attach tags to. You can
  /// specify either the Amazon Resource Name (ARN) or the friendly name of the
  /// secret.  If you specify an ARN, we generally recommend that you specify
  /// a complete ARN. You can specify a partial ARN too—for example, if you don’t
  /// include the final hyphen and six random characters that Secrets Manager
  /// adds at the end of the ARN when you created the secret. A partial ARN match
  /// can work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you
  /// try to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// The tags to attach to the secret. Each element in the list consists of
  /// a Key and a Value. This parameter to the API requires a JSON text string
  /// argument. For information on how to format a JSON parameter for the various
  /// command line tool environments, see Using JSON for Parameters in the AWS
  /// CLI User Guide. For the AWS CLI, you can also use the syntax: --Tags Key="Key1",Value="Value1",Key="Key2",Value="Value2"[,…]
  @JsonKey(name: 'Tags')
  final List<Tag> tags;

  TagResourceRequest({
    @required this.secretId,
    @required this.tags,
  });

  factory TagResourceRequest.fromJson(Map<String, dynamic> json) =>
      _$TagResourceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
}

@JsonSerializable()
class UntagResourceRequest {
  /// The identifier for the secret that you want to remove tags from. You can
  /// specify either the Amazon Resource Name (ARN) or the friendly name of the
  /// secret.  If you specify an ARN, we generally recommend that you specify
  /// a complete ARN. You can specify a partial ARN too—for example, if you don’t
  /// include the final hyphen and six random characters that Secrets Manager
  /// adds at the end of the ARN when you created the secret. A partial ARN match
  /// can work as long as it uniquely matches only one secret. However, if your
  /// secret has a name that ends in a hyphen followed by six characters (before
  /// Secrets Manager adds the hyphen and six characters to the ARN) and you
  /// try to use that as a partial ARN, then those characters cause Secrets Manager
  /// to assume that you’re specifying a complete ARN. This confusion can cause
  /// unexpected results. To avoid this situation, we recommend that you don’t
  /// create secret names that end with a hyphen followed by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// A list of tag key names to remove from the secret. You don't specify the
  /// value. Both the key and its associated value are removed. This parameter
  /// to the API requires a JSON text string argument. For information on how
  /// to format a JSON parameter for the various command line tool environments,
  /// see Using JSON for Parameters in the AWS CLI User Guide.
  @JsonKey(name: 'TagKeys')
  final List<String> tagKeys;

  UntagResourceRequest({
    @required this.secretId,
    @required this.tagKeys,
  });

  factory UntagResourceRequest.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
}

@JsonSerializable()
class UpdateSecretRequest {
  /// Specifies the secret that you want to modify or to which you want to add
  /// a new version. You can specify either the Amazon Resource Name (ARN) or
  /// the friendly name of the secret.  If you specify an ARN, we generally recommend
  /// that you specify a complete ARN. You can specify a partial ARN too—for
  /// example, if you don’t include the final hyphen and six random characters
  /// that Secrets Manager adds at the end of the ARN when you created the secret.
  /// A partial ARN match can work as long as it uniquely matches only one secret.
  /// However, if your secret has a name that ends in a hyphen followed by six
  /// characters (before Secrets Manager adds the hyphen and six characters to
  /// the ARN) and you try to use that as a partial ARN, then those characters
  /// cause Secrets Manager to assume that you’re specifying a complete ARN.
  /// This confusion can cause unexpected results. To avoid this situation, we
  /// recommend that you don’t create secret names that end with a hyphen followed
  /// by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// (Optional) If you want to add a new version to the secret, this parameter
  /// specifies a unique identifier for the new version that helps ensure idempotency.
  ///  If you use the AWS CLI or one of the AWS SDK to call this operation, then
  /// you can leave this parameter empty. The CLI or SDK generates a random UUID
  /// for you and includes that in the request. If you don't use the SDK and
  /// instead generate a raw HTTP request to the Secrets Manager service endpoint,
  /// then you must generate a ClientRequestToken yourself for new versions and
  /// include that value in the request. You typically only need to interact
  /// with this value if you implement your own retry logic and want to ensure
  /// that a given secret is not created twice. We recommend that you generate
  /// a UUID-type value to ensure uniqueness within the specified secret.  Secrets
  /// Manager uses this value to prevent the accidental creation of duplicate
  /// versions if there are failures and retries during the Lambda rotation function's
  /// processing.   If the ClientRequestToken value isn't already associated
  /// with a version of the secret then a new version of the secret is created.
  ///    If a version with this value already exists and that version's SecretString
  /// and SecretBinary values are the same as those in the request then the request
  /// is ignored (the operation is idempotent).    If a version with this value
  /// already exists and that version's SecretString and SecretBinary values
  /// are different from the request then an error occurs because you cannot
  /// modify an existing secret value.   This value becomes the VersionId of
  /// the new version.
  @JsonKey(name: 'ClientRequestToken')
  final String clientRequestToken;

  /// (Optional) Specifies an updated user-provided description of the secret.
  @JsonKey(name: 'Description')
  final String description;

  /// (Optional) Specifies an updated ARN or alias of the AWS KMS customer master
  /// key (CMK) to be used to encrypt the protected text in new versions of this
  /// secret.  You can only use the account's default CMK to encrypt and decrypt
  /// if you call this operation using credentials from the same account that
  /// owns the secret. If the secret is in a different account, then you must
  /// create a custom CMK and provide the ARN of that CMK in this field. The
  /// user making the call must have permissions to both the secret and the CMK
  /// in their respective accounts.
  @JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// (Optional) Specifies updated binary data that you want to encrypt and store
  /// in the new version of the secret. To use this parameter in the command-line
  /// tools, we recommend that you store your binary data in a file and then
  /// use the appropriate technique for your tool to pass the contents of the
  /// file as a parameter. Either SecretBinary or SecretString must have a value,
  /// but not both. They cannot both be empty. This parameter is not accessible
  /// using the Secrets Manager console.
  @JsonKey(name: 'SecretBinary')
  @Base64Converter()
  final String secretBinary;

  /// (Optional) Specifies updated text data that you want to encrypt and store
  /// in this new version of the secret. Either SecretBinary or SecretString
  /// must have a value, but not both. They cannot both be empty. If you create
  /// this secret by using the Secrets Manager console then Secrets Manager puts
  /// the protected secret text in only the SecretString parameter. The Secrets
  /// Manager console stores the information as a JSON structure of key/value
  /// pairs that the default Lambda rotation function knows how to parse. For
  /// storing multiple values, we recommend that you use a JSON text string argument
  /// and specify key/value pairs. For information on how to format a JSON parameter
  /// for the various command line tool environments, see Using JSON for Parameters
  /// in the AWS CLI User Guide. For example:  [{"username":"bob"},{"password":"abc123xyz456"}]
  ///  If your command-line tool or SDK requires quotation marks around the parameter,
  /// you should use single quotes to avoid confusion with the double quotes
  /// required in the JSON text. You can also 'escape' the double quote character
  /// in the embedded JSON text by prefacing each with a backslash. For example,
  /// the following string is surrounded by double-quotes. All of the embedded
  /// double quotes are escaped:  "[{\"username\":\"bob\"},{\"password\":\"abc123xyz456\"}]"
  @JsonKey(name: 'SecretString')
  final String secretString;

  UpdateSecretRequest({
    @required this.secretId,
    this.clientRequestToken,
    this.description,
    this.kmsKeyId,
    this.secretBinary,
    this.secretString,
  });

  factory UpdateSecretRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSecretRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSecretRequestToJson(this);
}

@JsonSerializable()
class UpdateSecretResponse {
  /// The ARN of the secret that was updated.  Secrets Manager automatically
  /// adds several random characters to the name at the end of the ARN when you
  /// initially create a secret. This affects only the ARN and not the actual
  /// friendly name. This ensures that if you create a new secret with the same
  /// name as an old secret that you previously deleted, then users with access
  /// to the old secret don't automatically get access to the new secret because
  /// the ARNs are different.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret that was updated.
  @JsonKey(name: 'Name')
  final String name;

  /// If a new version of the secret was created by this operation, then VersionId
  /// contains the unique identifier of the new version.
  @JsonKey(name: 'VersionId')
  final String versionId;

  UpdateSecretResponse({
    this.aRN,
    this.name,
    this.versionId,
  });

  factory UpdateSecretResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSecretResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSecretResponseToJson(this);
}

@JsonSerializable()
class UpdateSecretVersionStageRequest {
  /// Specifies the secret with the version whose list of staging labels you
  /// want to modify. You can specify either the Amazon Resource Name (ARN) or
  /// the friendly name of the secret.  If you specify an ARN, we generally recommend
  /// that you specify a complete ARN. You can specify a partial ARN too—for
  /// example, if you don’t include the final hyphen and six random characters
  /// that Secrets Manager adds at the end of the ARN when you created the secret.
  /// A partial ARN match can work as long as it uniquely matches only one secret.
  /// However, if your secret has a name that ends in a hyphen followed by six
  /// characters (before Secrets Manager adds the hyphen and six characters to
  /// the ARN) and you try to use that as a partial ARN, then those characters
  /// cause Secrets Manager to assume that you’re specifying a complete ARN.
  /// This confusion can cause unexpected results. To avoid this situation, we
  /// recommend that you don’t create secret names that end with a hyphen followed
  /// by six characters.
  @JsonKey(name: 'SecretId')
  final String secretId;

  /// The staging label to add to this version.
  @JsonKey(name: 'VersionStage')
  final String versionStage;

  /// Specifies the secret version ID of the version that the staging label is
  /// to be removed from. If the staging label you are trying to attach to one
  /// version is already attached to a different version, then you must include
  /// this parameter and specify the version that the label is to be removed
  /// from. If the label is attached and you either do not specify this parameter,
  /// or the version ID does not match, then the operation fails.
  @JsonKey(name: 'RemoveFromVersionId')
  final String removeFromVersionId;

  /// (Optional) The secret version ID that you want to add the staging label
  /// to. If you want to remove a label from a version, then do not specify this
  /// parameter. If the staging label is already attached to a different version
  /// of the secret, then you must also specify the RemoveFromVersionId parameter.
  @JsonKey(name: 'MoveToVersionId')
  final String moveToVersionId;

  UpdateSecretVersionStageRequest({
    @required this.secretId,
    @required this.versionStage,
    this.removeFromVersionId,
    this.moveToVersionId,
  });

  factory UpdateSecretVersionStageRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSecretVersionStageRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateSecretVersionStageRequestToJson(this);
}

@JsonSerializable()
class UpdateSecretVersionStageResponse {
  /// The ARN of the secret with the staging label that was modified.
  @JsonKey(name: 'ARN')
  final String aRN;

  /// The friendly name of the secret with the staging label that was modified.
  @JsonKey(name: 'Name')
  final String name;

  UpdateSecretVersionStageResponse({
    this.aRN,
    this.name,
  });

  factory UpdateSecretVersionStageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSecretVersionStageResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateSecretVersionStageResponseToJson(this);
}

class Base64Converter implements JsonConverter<String, String> {
  const Base64Converter();

  @override
  String fromJson(String json) => utf8.decode(base64Decode(json));

  @override
  String toJson(String object) => base64Encode(utf8.encode(object));
}

class Base64ListConverter implements JsonConverter<List<String>, List<String>> {
  const Base64ListConverter();

  @override
  List<String> fromJson(List<String> json) =>
      json.map((x) => utf8.decode(base64Decode(x))).toList(growable: false);

  @override
  List<String> toJson(List<String> object) =>
      object.map((x) => base64Encode(utf8.encode(x))).toList(growable: false);
}
