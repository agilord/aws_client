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

/// AWS Signer is a fully managed code-signing service to help you ensure the
/// trust and integrity of your code.
///
/// Signer supports the following applications:
///
/// With code signing for AWS Lambda, you can sign <a
/// href="http://docs.aws.amazon.com/lambda/latest/dg/">AWS Lambda</a>
/// deployment packages. Integrated support is provided for <a
/// href="http://docs.aws.amazon.com/AmazonS3/latest/gsg/">Amazon S3</a>, <a
/// href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/">Amazon
/// CloudWatch</a>, and <a
/// href="http://docs.aws.amazon.com/awscloudtrail/latest/userguide/">AWS
/// CloudTrail</a>. In order to sign code, you create a signing profile and then
/// use Signer to sign Lambda zip files in S3.
///
/// With code signing for IoT, you can sign code for any IoT device that is
/// supported by AWS. IoT code signing is available for <a
/// href="http://docs.aws.amazon.com/freertos/latest/userguide/">Amazon
/// FreeRTOS</a> and <a
/// href="http://docs.aws.amazon.com/iot/latest/developerguide/">AWS IoT Device
/// Management</a>, and is integrated with <a
/// href="http://docs.aws.amazon.com/acm/latest/userguide/">AWS Certificate
/// Manager (ACM)</a>. In order to sign code, you import a third-party
/// code-signing certificate using ACM, and use that to sign updates in Amazon
/// FreeRTOS and AWS IoT Device Management.
///
/// With Signer and the Notation CLI from the <a
/// href="https://notaryproject.dev/">Notary&#x2028; Project</a>, you can sign
/// container images stored in a container registry such as Amazon Elastic
/// Container Registry (ECR). The signatures are stored in the registry
/// alongside the images, where they are available for verifying image
/// authenticity and integrity.
///
/// For more information about Signer, see the <a
/// href="https://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html">AWS
/// Signer Developer Guide</a>.
class Signer {
  final _s.RestJsonProtocol _protocol;
  Signer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'signer',
            signingName: 'signer',
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

  /// Adds cross-account permissions to a signing profile.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceLimitExceededException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [action] :
  /// For cross-account signing. Grant a designated account permission to
  /// perform one or more of the following actions. Each action is associated
  /// with a specific API's operations. For more information about cross-account
  /// signing, see <a
  /// href="https://docs.aws.amazon.com/signer/latest/developerguide/signing-profile-cross-account.html">Using
  /// cross-account signing with signing profiles</a> in the <i>AWS Signer
  /// Developer Guide</i>.
  ///
  /// You can designate the following actions to an account.
  ///
  /// <ul>
  /// <li>
  /// <code>signer:StartSigningJob</code>. This action isn't supported for
  /// container image workflows. For details, see <a>StartSigningJob</a>.
  /// </li>
  /// <li>
  /// <code>signer:SignPayload</code>. This action isn't supported for AWS
  /// Lambda workflows. For details, see <a>SignPayload</a>
  /// </li>
  /// <li>
  /// <code>signer:GetSigningProfile</code>. For details, see
  /// <a>GetSigningProfile</a>.
  /// </li>
  /// <li>
  /// <code>signer:RevokeSignature</code>. For details, see
  /// <a>RevokeSignature</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [principal] :
  /// The AWS principal receiving cross-account permissions. This may be an IAM
  /// role or another AWS account ID.
  ///
  /// Parameter [profileName] :
  /// The human-readable name of the signing profile.
  ///
  /// Parameter [statementId] :
  /// A unique identifier for the cross-account permission statement.
  ///
  /// Parameter [profileVersion] :
  /// The version of the signing profile.
  ///
  /// Parameter [revisionId] :
  /// A unique identifier for the current profile revision.
  Future<AddProfilePermissionResponse> addProfilePermission({
    required String action,
    required String principal,
    required String profileName,
    required String statementId,
    String? profileVersion,
    String? revisionId,
  }) async {
    final $payload = <String, dynamic>{
      'action': action,
      'principal': principal,
      'statementId': statementId,
      if (profileVersion != null) 'profileVersion': profileVersion,
      if (revisionId != null) 'revisionId': revisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/signing-profiles/${Uri.encodeComponent(profileName)}/permissions',
      exceptionFnMap: _exceptionFns,
    );
    return AddProfilePermissionResponse.fromJson(response);
  }

  /// Changes the state of an <code>ACTIVE</code> signing profile to
  /// <code>CANCELED</code>. A canceled profile is still viewable with the
  /// <code>ListSigningProfiles</code> operation, but it cannot perform new
  /// signing jobs, and is deleted two years after cancelation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [profileName] :
  /// The name of the signing profile to be canceled.
  Future<void> cancelSigningProfile({
    required String profileName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/signing-profiles/${Uri.encodeComponent(profileName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a specific code signing job. You specify the job
  /// by using the <code>jobId</code> value that is returned by the
  /// <a>StartSigningJob</a> operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [jobId] :
  /// The ID of the signing job on input.
  Future<DescribeSigningJobResponse> describeSigningJob({
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSigningJobResponse.fromJson(response);
  }

  /// Retrieves the revocation status of one or more of the signing profile,
  /// signing job, and signing certificate.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [certificateHashes] :
  /// A list of composite signed hashes that identify certificates.
  ///
  /// A certificate identifier consists of a subject certificate TBS hash
  /// (signed by the parent CA) combined with a parent CA TBS hash (signed by
  /// the parent CA’s CA). Root certificates are defined as their own CA.
  ///
  /// The following example shows how to calculate a hash for this parameter
  /// using OpenSSL commands:
  ///
  /// <code>openssl asn1parse -in childCert.pem -strparse 4 -out
  /// childCert.tbs</code>
  ///
  /// <code>openssl sha384 &lt; childCert.tbs -binary &gt;
  /// childCertTbsHash</code>
  ///
  /// <code>openssl asn1parse -in parentCert.pem -strparse 4 -out
  /// parentCert.tbs</code>
  ///
  /// <code>openssl sha384 &lt; parentCert.tbs -binary &gt; parentCertTbsHash
  /// xxd -p childCertTbsHash &gt; certificateHash.hex xxd -p parentCertTbsHash
  /// &gt;&gt; certificateHash.hex</code>
  ///
  /// <code>cat certificateHash.hex | tr -d '\n'</code>
  ///
  /// Parameter [jobArn] :
  /// The ARN of a signing job.
  ///
  /// Parameter [platformId] :
  /// The ID of a signing platform.
  ///
  /// Parameter [profileVersionArn] :
  /// The version of a signing profile.
  ///
  /// Parameter [signatureTimestamp] :
  /// The timestamp of the signature that validates the profile or job.
  Future<GetRevocationStatusResponse> getRevocationStatus({
    required List<String> certificateHashes,
    required String jobArn,
    required String platformId,
    required String profileVersionArn,
    required DateTime signatureTimestamp,
  }) async {
    final $query = <String, List<String>>{
      'certificateHashes': certificateHashes,
      'jobArn': [jobArn],
      'platformId': [platformId],
      'profileVersionArn': [profileVersionArn],
      'signatureTimestamp': [_s.iso8601ToJson(signatureTimestamp).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/revocations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRevocationStatusResponse.fromJson(response);
  }

  /// Returns information on a specific signing platform.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [platformId] :
  /// The ID of the target signing platform.
  Future<GetSigningPlatformResponse> getSigningPlatform({
    required String platformId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-platforms/${Uri.encodeComponent(platformId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSigningPlatformResponse.fromJson(response);
  }

  /// Returns information on a specific signing profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [profileName] :
  /// The name of the target signing profile.
  ///
  /// Parameter [profileOwner] :
  /// The AWS account ID of the profile owner.
  Future<GetSigningProfileResponse> getSigningProfile({
    required String profileName,
    String? profileOwner,
  }) async {
    final $query = <String, List<String>>{
      if (profileOwner != null) 'profileOwner': [profileOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-profiles/${Uri.encodeComponent(profileName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSigningProfileResponse.fromJson(response);
  }

  /// Lists the cross-account permissions associated with a signing profile.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [profileName] :
  /// Name of the signing profile containing the cross-account permissions.
  ///
  /// Parameter [nextToken] :
  /// String for specifying the next set of paginated results.
  Future<ListProfilePermissionsResponse> listProfilePermissions({
    required String profileName,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/signing-profiles/${Uri.encodeComponent(profileName)}/permissions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfilePermissionsResponse.fromJson(response);
  }

  /// Lists all your signing jobs. You can use the <code>maxResults</code>
  /// parameter to limit the number of signing jobs that are returned in the
  /// response. If additional jobs remain to be listed, AWS Signer returns a
  /// <code>nextToken</code> value. Use this value in subsequent calls to
  /// <code>ListSigningJobs</code> to fetch the remaining values. You can
  /// continue calling <code>ListSigningJobs</code> with your
  /// <code>maxResults</code> parameter and with new values that Signer returns
  /// in the <code>nextToken</code> parameter until all of your signing jobs
  /// have been returned.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [isRevoked] :
  /// Filters results to return only signing jobs with revoked signatures.
  ///
  /// Parameter [jobInvoker] :
  /// Filters results to return only signing jobs initiated by a specified IAM
  /// entity.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of items to return in the response. Use this
  /// parameter when paginating results. If additional items exist beyond the
  /// number you specify, the <code>nextToken</code> element is set in the
  /// response. Use the <code>nextToken</code> value in a subsequent request to
  /// retrieve additional items.
  ///
  /// Parameter [nextToken] :
  /// String for specifying the next set of paginated results to return. After
  /// you receive a response with truncated results, use this parameter in a
  /// subsequent request. Set it to the value of <code>nextToken</code> from the
  /// response that you just received.
  ///
  /// Parameter [platformId] :
  /// The ID of microcontroller platform that you specified for the distribution
  /// of your code image.
  ///
  /// Parameter [requestedBy] :
  /// The IAM principal that requested the signing job.
  ///
  /// Parameter [signatureExpiresAfter] :
  /// Filters results to return only signing jobs with signatures expiring after
  /// a specified timestamp.
  ///
  /// Parameter [signatureExpiresBefore] :
  /// Filters results to return only signing jobs with signatures expiring
  /// before a specified timestamp.
  ///
  /// Parameter [status] :
  /// A status value with which to filter your results.
  Future<ListSigningJobsResponse> listSigningJobs({
    bool? isRevoked,
    String? jobInvoker,
    int? maxResults,
    String? nextToken,
    String? platformId,
    String? requestedBy,
    DateTime? signatureExpiresAfter,
    DateTime? signatureExpiresBefore,
    SigningStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (isRevoked != null) 'isRevoked': [isRevoked.toString()],
      if (jobInvoker != null) 'jobInvoker': [jobInvoker],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (platformId != null) 'platformId': [platformId],
      if (requestedBy != null) 'requestedBy': [requestedBy],
      if (signatureExpiresAfter != null)
        'signatureExpiresAfter': [
          _s.iso8601ToJson(signatureExpiresAfter).toString()
        ],
      if (signatureExpiresBefore != null)
        'signatureExpiresBefore': [
          _s.iso8601ToJson(signatureExpiresBefore).toString()
        ],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSigningJobsResponse.fromJson(response);
  }

  /// Lists all signing platforms available in AWS Signer that match the request
  /// parameters. If additional jobs remain to be listed, Signer returns a
  /// <code>nextToken</code> value. Use this value in subsequent calls to
  /// <code>ListSigningJobs</code> to fetch the remaining values. You can
  /// continue calling <code>ListSigningJobs</code> with your
  /// <code>maxResults</code> parameter and with new values that Signer returns
  /// in the <code>nextToken</code> parameter until all of your signing jobs
  /// have been returned.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [category] :
  /// The category type of a signing platform.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned by this operation.
  ///
  /// Parameter [nextToken] :
  /// Value for specifying the next set of paginated results to return. After
  /// you receive a response with truncated results, use this parameter in a
  /// subsequent request. Set it to the value of <code>nextToken</code> from the
  /// response that you just received.
  ///
  /// Parameter [partner] :
  /// Any partner entities connected to a signing platform.
  ///
  /// Parameter [target] :
  /// The validation template that is used by the target signing platform.
  Future<ListSigningPlatformsResponse> listSigningPlatforms({
    String? category,
    int? maxResults,
    String? nextToken,
    String? partner,
    String? target,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (category != null) 'category': [category],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (partner != null) 'partner': [partner],
      if (target != null) 'target': [target],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-platforms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSigningPlatformsResponse.fromJson(response);
  }

  /// Lists all available signing profiles in your AWS account. Returns only
  /// profiles with an <code>ACTIVE</code> status unless the
  /// <code>includeCanceled</code> request field is set to <code>true</code>. If
  /// additional jobs remain to be listed, AWS Signer returns a
  /// <code>nextToken</code> value. Use this value in subsequent calls to
  /// <code>ListSigningJobs</code> to fetch the remaining values. You can
  /// continue calling <code>ListSigningJobs</code> with your
  /// <code>maxResults</code> parameter and with new values that Signer returns
  /// in the <code>nextToken</code> parameter until all of your signing jobs
  /// have been returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [includeCanceled] :
  /// Designates whether to include profiles with the status of
  /// <code>CANCELED</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of profiles to be returned.
  ///
  /// Parameter [nextToken] :
  /// Value for specifying the next set of paginated results to return. After
  /// you receive a response with truncated results, use this parameter in a
  /// subsequent request. Set it to the value of <code>nextToken</code> from the
  /// response that you just received.
  ///
  /// Parameter [platformId] :
  /// Filters results to return only signing jobs initiated for a specified
  /// signing platform.
  ///
  /// Parameter [statuses] :
  /// Filters results to return only signing jobs with statuses in the specified
  /// list.
  Future<ListSigningProfilesResponse> listSigningProfiles({
    bool? includeCanceled,
    int? maxResults,
    String? nextToken,
    String? platformId,
    List<SigningProfileStatus>? statuses,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (includeCanceled != null)
        'includeCanceled': [includeCanceled.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (platformId != null) 'platformId': [platformId],
      if (statuses != null)
        'statuses': statuses.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSigningProfilesResponse.fromJson(response);
  }

  /// Returns a list of the tags associated with a signing profile resource.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the signing profile.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates a signing profile. A signing profile is a code-signing template
  /// that can be used to carry out a pre-defined signing job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [platformId] :
  /// The ID of the signing platform to be created.
  ///
  /// Parameter [profileName] :
  /// The name of the signing profile to be created.
  ///
  /// Parameter [overrides] :
  /// A subfield of <code>platform</code>. This specifies any different
  /// configuration options that you want to apply to the chosen platform (such
  /// as a different <code>hash-algorithm</code> or
  /// <code>signing-algorithm</code>).
  ///
  /// Parameter [signatureValidityPeriod] :
  /// The default validity period override for any signature generated using
  /// this signing profile. If unspecified, the default is 135 months.
  ///
  /// Parameter [signingMaterial] :
  /// The AWS Certificate Manager certificate that will be used to sign code
  /// with the new signing profile.
  ///
  /// Parameter [signingParameters] :
  /// Map of key-value pairs for signing. These can include any information that
  /// you want to use during signing.
  ///
  /// Parameter [tags] :
  /// Tags to be associated with the signing profile that is being created.
  Future<PutSigningProfileResponse> putSigningProfile({
    required String platformId,
    required String profileName,
    SigningPlatformOverrides? overrides,
    SignatureValidityPeriod? signatureValidityPeriod,
    SigningMaterial? signingMaterial,
    Map<String, String>? signingParameters,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'platformId': platformId,
      if (overrides != null) 'overrides': overrides,
      if (signatureValidityPeriod != null)
        'signatureValidityPeriod': signatureValidityPeriod,
      if (signingMaterial != null) 'signingMaterial': signingMaterial,
      if (signingParameters != null) 'signingParameters': signingParameters,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/signing-profiles/${Uri.encodeComponent(profileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutSigningProfileResponse.fromJson(response);
  }

  /// Removes cross-account permissions from a signing profile.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [profileName] :
  /// A human-readable name for the signing profile with permissions to be
  /// removed.
  ///
  /// Parameter [revisionId] :
  /// An identifier for the current revision of the signing profile permissions.
  ///
  /// Parameter [statementId] :
  /// A unique identifier for the cross-account permissions statement.
  Future<RemoveProfilePermissionResponse> removeProfilePermission({
    required String profileName,
    required String revisionId,
    required String statementId,
  }) async {
    final $query = <String, List<String>>{
      'revisionId': [revisionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/signing-profiles/${Uri.encodeComponent(profileName)}/permissions/${Uri.encodeComponent(statementId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RemoveProfilePermissionResponse.fromJson(response);
  }

  /// Changes the state of a signing job to REVOKED. This indicates that the
  /// signature is no longer valid.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [jobId] :
  /// ID of the signing job to be revoked.
  ///
  /// Parameter [reason] :
  /// The reason for revoking the signing job.
  ///
  /// Parameter [jobOwner] :
  /// AWS account ID of the job owner.
  Future<void> revokeSignature({
    required String jobId,
    required String reason,
    String? jobOwner,
  }) async {
    final $payload = <String, dynamic>{
      'reason': reason,
      if (jobOwner != null) 'jobOwner': jobOwner,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/signing-jobs/${Uri.encodeComponent(jobId)}/revoke',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Changes the state of a signing profile to REVOKED. This indicates that
  /// signatures generated using the signing profile after an effective start
  /// date are no longer valid.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [effectiveTime] :
  /// A timestamp for when revocation of a Signing Profile should become
  /// effective. Signatures generated using the signing profile after this
  /// timestamp are not trusted.
  ///
  /// Parameter [profileName] :
  /// The name of the signing profile to be revoked.
  ///
  /// Parameter [profileVersion] :
  /// The version of the signing profile to be revoked.
  ///
  /// Parameter [reason] :
  /// The reason for revoking a signing profile.
  Future<void> revokeSigningProfile({
    required DateTime effectiveTime,
    required String profileName,
    required String profileVersion,
    required String reason,
  }) async {
    final $payload = <String, dynamic>{
      'effectiveTime': unixTimestampToJson(effectiveTime),
      'profileVersion': profileVersion,
      'reason': reason,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/signing-profiles/${Uri.encodeComponent(profileName)}/revoke',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Signs a binary payload and returns a signature envelope.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [payload] :
  /// Specifies the object digest (hash) to sign.
  ///
  /// Parameter [payloadFormat] :
  /// Payload content type. The single valid type is
  /// <code>application/vnd.cncf.notary.payload.v1+json</code>.
  ///
  /// Parameter [profileName] :
  /// The name of the signing profile.
  ///
  /// Parameter [profileOwner] :
  /// The AWS account ID of the profile owner.
  Future<SignPayloadResponse> signPayload({
    required Uint8List payload,
    required String payloadFormat,
    required String profileName,
    String? profileOwner,
  }) async {
    final $payload = <String, dynamic>{
      'payload': base64Encode(payload),
      'payloadFormat': payloadFormat,
      'profileName': profileName,
      if (profileOwner != null) 'profileOwner': profileOwner,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/signing-jobs/with-payload',
      exceptionFnMap: _exceptionFns,
    );
    return SignPayloadResponse.fromJson(response);
  }

  /// Initiates a signing job to be performed on the code provided. Signing jobs
  /// are viewable by the <code>ListSigningJobs</code> operation for two years
  /// after they are performed. Note the following requirements:
  ///
  /// <ul>
  /// <li>
  /// You must create an Amazon S3 source bucket. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html">Creating
  /// a Bucket</a> in the <i>Amazon S3 Getting Started Guide</i>.
  /// </li>
  /// <li>
  /// Your S3 source bucket must be version enabled.
  /// </li>
  /// <li>
  /// You must create an S3 destination bucket. AWS Signer uses your S3
  /// destination bucket to write your signed code.
  /// </li>
  /// <li>
  /// You specify the name of the source and destination buckets when calling
  /// the <code>StartSigningJob</code> operation.
  /// </li>
  /// <li>
  /// You must ensure the S3 buckets are from the same Region as the signing
  /// profile. Cross-Region signing isn't supported.
  /// </li>
  /// <li>
  /// You must also specify a request token that identifies your request to
  /// Signer.
  /// </li>
  /// </ul>
  /// You can call the <a>DescribeSigningJob</a> and the <a>ListSigningJobs</a>
  /// actions after you call <code>StartSigningJob</code>.
  ///
  /// For a Java example that shows how to use this action, see <a
  /// href="https://docs.aws.amazon.com/signer/latest/developerguide/api-startsigningjob.html">StartSigningJob</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [destination] :
  /// The S3 bucket in which to save your signed object. The destination
  /// contains the name of your bucket and an optional prefix.
  ///
  /// Parameter [profileName] :
  /// The name of the signing profile.
  ///
  /// Parameter [source] :
  /// The S3 bucket that contains the object to sign or a BLOB that contains
  /// your raw code.
  ///
  /// Parameter [clientRequestToken] :
  /// String that identifies the signing request. All calls after the first that
  /// use this token return the same response as the first call.
  ///
  /// Parameter [profileOwner] :
  /// The AWS account ID of the signing profile owner.
  Future<StartSigningJobResponse> startSigningJob({
    required Destination destination,
    required String profileName,
    required Source source,
    String? clientRequestToken,
    String? profileOwner,
  }) async {
    final $payload = <String, dynamic>{
      'destination': destination,
      'profileName': profileName,
      'source': source,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (profileOwner != null) 'profileOwner': profileOwner,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/signing-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartSigningJobResponse.fromJson(response);
  }

  /// Adds one or more tags to a signing profile. Tags are labels that you can
  /// use to identify and organize your AWS resources. Each tag consists of a
  /// key and an optional value. To specify the signing profile, use its Amazon
  /// Resource Name (ARN). To specify the tag, use a key-value pair.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the signing profile.
  ///
  /// Parameter [tags] :
  /// One or more tags to be associated with the signing profile.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from a signing profile. To remove the tags,
  /// specify a list of tag keys.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the signing profile.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to be removed from the signing profile.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AddProfilePermissionResponse {
  /// A unique identifier for the current profile revision.
  final String? revisionId;

  AddProfilePermissionResponse({
    this.revisionId,
  });

  factory AddProfilePermissionResponse.fromJson(Map<String, dynamic> json) {
    return AddProfilePermissionResponse(
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionId = this.revisionId;
    return {
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

enum Category {
  awsIoT,
}

extension CategoryValueExtension on Category {
  String toValue() {
    switch (this) {
      case Category.awsIoT:
        return 'AWSIoT';
    }
  }
}

extension CategoryFromString on String {
  Category toCategory() {
    switch (this) {
      case 'AWSIoT':
        return Category.awsIoT;
    }
    throw Exception('$this is not known in enum Category');
  }
}

class DescribeSigningJobResponse {
  /// Date and time that the signing job was completed.
  final DateTime? completedAt;

  /// Date and time that the signing job was created.
  final DateTime? createdAt;

  /// The ID of the signing job on output.
  final String? jobId;

  /// The IAM entity that initiated the signing job.
  final String? jobInvoker;

  /// The AWS account ID of the job owner.
  final String? jobOwner;

  /// A list of any overrides that were applied to the signing operation.
  final SigningPlatformOverrides? overrides;

  /// A human-readable name for the signing platform associated with the signing
  /// job.
  final String? platformDisplayName;

  /// The microcontroller platform to which your signed code image will be
  /// distributed.
  final String? platformId;

  /// The name of the profile that initiated the signing operation.
  final String? profileName;

  /// The version of the signing profile used to initiate the signing job.
  final String? profileVersion;

  /// The IAM principal that requested the signing job.
  final String? requestedBy;

  /// A revocation record if the signature generated by the signing job has been
  /// revoked. Contains a timestamp and the ID of the IAM entity that revoked the
  /// signature.
  final SigningJobRevocationRecord? revocationRecord;

  /// Thr expiration timestamp for the signature generated by the signing job.
  final DateTime? signatureExpiresAt;

  /// Name of the S3 bucket where the signed code image is saved by AWS Signer.
  final SignedObject? signedObject;

  /// The Amazon Resource Name (ARN) of your code signing certificate.
  final SigningMaterial? signingMaterial;

  /// Map of user-assigned key-value pairs used during signing. These values
  /// contain any information that you specified for use in your signing job.
  final Map<String, String>? signingParameters;

  /// The object that contains the name of your S3 bucket or your raw code.
  final Source? source;

  /// Status of the signing job.
  final SigningStatus? status;

  /// String value that contains the status reason.
  final String? statusReason;

  DescribeSigningJobResponse({
    this.completedAt,
    this.createdAt,
    this.jobId,
    this.jobInvoker,
    this.jobOwner,
    this.overrides,
    this.platformDisplayName,
    this.platformId,
    this.profileName,
    this.profileVersion,
    this.requestedBy,
    this.revocationRecord,
    this.signatureExpiresAt,
    this.signedObject,
    this.signingMaterial,
    this.signingParameters,
    this.source,
    this.status,
    this.statusReason,
  });

  factory DescribeSigningJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSigningJobResponse(
      completedAt: timeStampFromJson(json['completedAt']),
      createdAt: timeStampFromJson(json['createdAt']),
      jobId: json['jobId'] as String?,
      jobInvoker: json['jobInvoker'] as String?,
      jobOwner: json['jobOwner'] as String?,
      overrides: json['overrides'] != null
          ? SigningPlatformOverrides.fromJson(
              json['overrides'] as Map<String, dynamic>)
          : null,
      platformDisplayName: json['platformDisplayName'] as String?,
      platformId: json['platformId'] as String?,
      profileName: json['profileName'] as String?,
      profileVersion: json['profileVersion'] as String?,
      requestedBy: json['requestedBy'] as String?,
      revocationRecord: json['revocationRecord'] != null
          ? SigningJobRevocationRecord.fromJson(
              json['revocationRecord'] as Map<String, dynamic>)
          : null,
      signatureExpiresAt: timeStampFromJson(json['signatureExpiresAt']),
      signedObject: json['signedObject'] != null
          ? SignedObject.fromJson(json['signedObject'] as Map<String, dynamic>)
          : null,
      signingMaterial: json['signingMaterial'] != null
          ? SigningMaterial.fromJson(
              json['signingMaterial'] as Map<String, dynamic>)
          : null,
      signingParameters: (json['signingParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toSigningStatus(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedAt = this.completedAt;
    final createdAt = this.createdAt;
    final jobId = this.jobId;
    final jobInvoker = this.jobInvoker;
    final jobOwner = this.jobOwner;
    final overrides = this.overrides;
    final platformDisplayName = this.platformDisplayName;
    final platformId = this.platformId;
    final profileName = this.profileName;
    final profileVersion = this.profileVersion;
    final requestedBy = this.requestedBy;
    final revocationRecord = this.revocationRecord;
    final signatureExpiresAt = this.signatureExpiresAt;
    final signedObject = this.signedObject;
    final signingMaterial = this.signingMaterial;
    final signingParameters = this.signingParameters;
    final source = this.source;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (completedAt != null) 'completedAt': unixTimestampToJson(completedAt),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (jobId != null) 'jobId': jobId,
      if (jobInvoker != null) 'jobInvoker': jobInvoker,
      if (jobOwner != null) 'jobOwner': jobOwner,
      if (overrides != null) 'overrides': overrides,
      if (platformDisplayName != null)
        'platformDisplayName': platformDisplayName,
      if (platformId != null) 'platformId': platformId,
      if (profileName != null) 'profileName': profileName,
      if (profileVersion != null) 'profileVersion': profileVersion,
      if (requestedBy != null) 'requestedBy': requestedBy,
      if (revocationRecord != null) 'revocationRecord': revocationRecord,
      if (signatureExpiresAt != null)
        'signatureExpiresAt': unixTimestampToJson(signatureExpiresAt),
      if (signedObject != null) 'signedObject': signedObject,
      if (signingMaterial != null) 'signingMaterial': signingMaterial,
      if (signingParameters != null) 'signingParameters': signingParameters,
      if (source != null) 'source': source,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Points to an <code>S3Destination</code> object that contains information
/// about your S3 bucket.
class Destination {
  /// The <code>S3Destination</code> object.
  final S3Destination? s3;

  Destination({
    this.s3,
  });

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

enum EncryptionAlgorithm {
  rsa,
  ecdsa,
}

extension EncryptionAlgorithmValueExtension on EncryptionAlgorithm {
  String toValue() {
    switch (this) {
      case EncryptionAlgorithm.rsa:
        return 'RSA';
      case EncryptionAlgorithm.ecdsa:
        return 'ECDSA';
    }
  }
}

extension EncryptionAlgorithmFromString on String {
  EncryptionAlgorithm toEncryptionAlgorithm() {
    switch (this) {
      case 'RSA':
        return EncryptionAlgorithm.rsa;
      case 'ECDSA':
        return EncryptionAlgorithm.ecdsa;
    }
    throw Exception('$this is not known in enum EncryptionAlgorithm');
  }
}

/// The encryption algorithm options that are available to a code-signing job.
class EncryptionAlgorithmOptions {
  /// The set of accepted encryption algorithms that are allowed in a code-signing
  /// job.
  final List<EncryptionAlgorithm> allowedValues;

  /// The default encryption algorithm that is used by a code-signing job.
  final EncryptionAlgorithm defaultValue;

  EncryptionAlgorithmOptions({
    required this.allowedValues,
    required this.defaultValue,
  });

  factory EncryptionAlgorithmOptions.fromJson(Map<String, dynamic> json) {
    return EncryptionAlgorithmOptions(
      allowedValues: (json['allowedValues'] as List)
          .whereNotNull()
          .map((e) => (e as String).toEncryptionAlgorithm())
          .toList(),
      defaultValue: (json['defaultValue'] as String).toEncryptionAlgorithm(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final defaultValue = this.defaultValue;
    return {
      'allowedValues': allowedValues.map((e) => e.toValue()).toList(),
      'defaultValue': defaultValue.toValue(),
    };
  }
}

class GetRevocationStatusResponse {
  /// A list of revoked entities (including zero or more of the signing profile
  /// ARN, signing job ARN, and certificate hashes) supplied as input to the API.
  final List<String>? revokedEntities;

  GetRevocationStatusResponse({
    this.revokedEntities,
  });

  factory GetRevocationStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetRevocationStatusResponse(
      revokedEntities: (json['revokedEntities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final revokedEntities = this.revokedEntities;
    return {
      if (revokedEntities != null) 'revokedEntities': revokedEntities,
    };
  }
}

class GetSigningPlatformResponse {
  /// The category type of the target signing platform.
  final Category? category;

  /// The display name of the target signing platform.
  final String? displayName;

  /// The maximum size (in MB) of the payload that can be signed by the target
  /// platform.
  final int? maxSizeInMB;

  /// A list of partner entities that use the target signing platform.
  final String? partner;

  /// The ID of the target signing platform.
  final String? platformId;

  /// A flag indicating whether signatures generated for the signing platform can
  /// be revoked.
  final bool? revocationSupported;

  /// A list of configurations applied to the target platform at signing.
  final SigningConfiguration? signingConfiguration;

  /// The format of the target platform's signing image.
  final SigningImageFormat? signingImageFormat;

  /// The validation template that is used by the target signing platform.
  final String? target;

  GetSigningPlatformResponse({
    this.category,
    this.displayName,
    this.maxSizeInMB,
    this.partner,
    this.platformId,
    this.revocationSupported,
    this.signingConfiguration,
    this.signingImageFormat,
    this.target,
  });

  factory GetSigningPlatformResponse.fromJson(Map<String, dynamic> json) {
    return GetSigningPlatformResponse(
      category: (json['category'] as String?)?.toCategory(),
      displayName: json['displayName'] as String?,
      maxSizeInMB: json['maxSizeInMB'] as int?,
      partner: json['partner'] as String?,
      platformId: json['platformId'] as String?,
      revocationSupported: json['revocationSupported'] as bool?,
      signingConfiguration: json['signingConfiguration'] != null
          ? SigningConfiguration.fromJson(
              json['signingConfiguration'] as Map<String, dynamic>)
          : null,
      signingImageFormat: json['signingImageFormat'] != null
          ? SigningImageFormat.fromJson(
              json['signingImageFormat'] as Map<String, dynamic>)
          : null,
      target: json['target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final displayName = this.displayName;
    final maxSizeInMB = this.maxSizeInMB;
    final partner = this.partner;
    final platformId = this.platformId;
    final revocationSupported = this.revocationSupported;
    final signingConfiguration = this.signingConfiguration;
    final signingImageFormat = this.signingImageFormat;
    final target = this.target;
    return {
      if (category != null) 'category': category.toValue(),
      if (displayName != null) 'displayName': displayName,
      if (maxSizeInMB != null) 'maxSizeInMB': maxSizeInMB,
      if (partner != null) 'partner': partner,
      if (platformId != null) 'platformId': platformId,
      if (revocationSupported != null)
        'revocationSupported': revocationSupported,
      if (signingConfiguration != null)
        'signingConfiguration': signingConfiguration,
      if (signingImageFormat != null) 'signingImageFormat': signingImageFormat,
      if (target != null) 'target': target,
    };
  }
}

class GetSigningProfileResponse {
  /// The Amazon Resource Name (ARN) for the signing profile.
  final String? arn;

  /// A list of overrides applied by the target signing profile for signing
  /// operations.
  final SigningPlatformOverrides? overrides;

  /// A human-readable name for the signing platform associated with the signing
  /// profile.
  final String? platformDisplayName;

  /// The ID of the platform that is used by the target signing profile.
  final String? platformId;

  /// The name of the target signing profile.
  final String? profileName;

  /// The current version of the signing profile.
  final String? profileVersion;

  /// The signing profile ARN, including the profile version.
  final String? profileVersionArn;
  final SigningProfileRevocationRecord? revocationRecord;
  final SignatureValidityPeriod? signatureValidityPeriod;

  /// The ARN of the certificate that the target profile uses for signing
  /// operations.
  final SigningMaterial? signingMaterial;

  /// A map of key-value pairs for signing operations that is attached to the
  /// target signing profile.
  final Map<String, String>? signingParameters;

  /// The status of the target signing profile.
  final SigningProfileStatus? status;

  /// Reason for the status of the target signing profile.
  final String? statusReason;

  /// A list of tags associated with the signing profile.
  final Map<String, String>? tags;

  GetSigningProfileResponse({
    this.arn,
    this.overrides,
    this.platformDisplayName,
    this.platformId,
    this.profileName,
    this.profileVersion,
    this.profileVersionArn,
    this.revocationRecord,
    this.signatureValidityPeriod,
    this.signingMaterial,
    this.signingParameters,
    this.status,
    this.statusReason,
    this.tags,
  });

  factory GetSigningProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetSigningProfileResponse(
      arn: json['arn'] as String?,
      overrides: json['overrides'] != null
          ? SigningPlatformOverrides.fromJson(
              json['overrides'] as Map<String, dynamic>)
          : null,
      platformDisplayName: json['platformDisplayName'] as String?,
      platformId: json['platformId'] as String?,
      profileName: json['profileName'] as String?,
      profileVersion: json['profileVersion'] as String?,
      profileVersionArn: json['profileVersionArn'] as String?,
      revocationRecord: json['revocationRecord'] != null
          ? SigningProfileRevocationRecord.fromJson(
              json['revocationRecord'] as Map<String, dynamic>)
          : null,
      signatureValidityPeriod: json['signatureValidityPeriod'] != null
          ? SignatureValidityPeriod.fromJson(
              json['signatureValidityPeriod'] as Map<String, dynamic>)
          : null,
      signingMaterial: json['signingMaterial'] != null
          ? SigningMaterial.fromJson(
              json['signingMaterial'] as Map<String, dynamic>)
          : null,
      signingParameters: (json['signingParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.toSigningProfileStatus(),
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final overrides = this.overrides;
    final platformDisplayName = this.platformDisplayName;
    final platformId = this.platformId;
    final profileName = this.profileName;
    final profileVersion = this.profileVersion;
    final profileVersionArn = this.profileVersionArn;
    final revocationRecord = this.revocationRecord;
    final signatureValidityPeriod = this.signatureValidityPeriod;
    final signingMaterial = this.signingMaterial;
    final signingParameters = this.signingParameters;
    final status = this.status;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (overrides != null) 'overrides': overrides,
      if (platformDisplayName != null)
        'platformDisplayName': platformDisplayName,
      if (platformId != null) 'platformId': platformId,
      if (profileName != null) 'profileName': profileName,
      if (profileVersion != null) 'profileVersion': profileVersion,
      if (profileVersionArn != null) 'profileVersionArn': profileVersionArn,
      if (revocationRecord != null) 'revocationRecord': revocationRecord,
      if (signatureValidityPeriod != null)
        'signatureValidityPeriod': signatureValidityPeriod,
      if (signingMaterial != null) 'signingMaterial': signingMaterial,
      if (signingParameters != null) 'signingParameters': signingParameters,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

enum HashAlgorithm {
  sha1,
  sha256,
}

extension HashAlgorithmValueExtension on HashAlgorithm {
  String toValue() {
    switch (this) {
      case HashAlgorithm.sha1:
        return 'SHA1';
      case HashAlgorithm.sha256:
        return 'SHA256';
    }
  }
}

extension HashAlgorithmFromString on String {
  HashAlgorithm toHashAlgorithm() {
    switch (this) {
      case 'SHA1':
        return HashAlgorithm.sha1;
      case 'SHA256':
        return HashAlgorithm.sha256;
    }
    throw Exception('$this is not known in enum HashAlgorithm');
  }
}

/// The hash algorithms that are available to a code-signing job.
class HashAlgorithmOptions {
  /// The set of accepted hash algorithms allowed in a code-signing job.
  final List<HashAlgorithm> allowedValues;

  /// The default hash algorithm that is used in a code-signing job.
  final HashAlgorithm defaultValue;

  HashAlgorithmOptions({
    required this.allowedValues,
    required this.defaultValue,
  });

  factory HashAlgorithmOptions.fromJson(Map<String, dynamic> json) {
    return HashAlgorithmOptions(
      allowedValues: (json['allowedValues'] as List)
          .whereNotNull()
          .map((e) => (e as String).toHashAlgorithm())
          .toList(),
      defaultValue: (json['defaultValue'] as String).toHashAlgorithm(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final defaultValue = this.defaultValue;
    return {
      'allowedValues': allowedValues.map((e) => e.toValue()).toList(),
      'defaultValue': defaultValue.toValue(),
    };
  }
}

enum ImageFormat {
  json,
  jSONEmbedded,
  jSONDetached,
}

extension ImageFormatValueExtension on ImageFormat {
  String toValue() {
    switch (this) {
      case ImageFormat.json:
        return 'JSON';
      case ImageFormat.jSONEmbedded:
        return 'JSONEmbedded';
      case ImageFormat.jSONDetached:
        return 'JSONDetached';
    }
  }
}

extension ImageFormatFromString on String {
  ImageFormat toImageFormat() {
    switch (this) {
      case 'JSON':
        return ImageFormat.json;
      case 'JSONEmbedded':
        return ImageFormat.jSONEmbedded;
      case 'JSONDetached':
        return ImageFormat.jSONDetached;
    }
    throw Exception('$this is not known in enum ImageFormat');
  }
}

class ListProfilePermissionsResponse {
  /// String for specifying the next set of paginated results.
  final String? nextToken;

  /// List of permissions associated with the Signing Profile.
  final List<Permission>? permissions;

  /// Total size of the policy associated with the Signing Profile in bytes.
  final int? policySizeBytes;

  /// The identifier for the current revision of profile permissions.
  final String? revisionId;

  ListProfilePermissionsResponse({
    this.nextToken,
    this.permissions,
    this.policySizeBytes,
    this.revisionId,
  });

  factory ListProfilePermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListProfilePermissionsResponse(
      nextToken: json['nextToken'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
      policySizeBytes: json['policySizeBytes'] as int?,
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    final policySizeBytes = this.policySizeBytes;
    final revisionId = this.revisionId;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissions != null) 'permissions': permissions,
      if (policySizeBytes != null) 'policySizeBytes': policySizeBytes,
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

class ListSigningJobsResponse {
  /// A list of your signing jobs.
  final List<SigningJob>? jobs;

  /// String for specifying the next set of paginated results.
  final String? nextToken;

  ListSigningJobsResponse({
    this.jobs,
    this.nextToken,
  });

  factory ListSigningJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListSigningJobsResponse(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => SigningJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSigningPlatformsResponse {
  /// Value for specifying the next set of paginated results to return.
  final String? nextToken;

  /// A list of all platforms that match the request parameters.
  final List<SigningPlatform>? platforms;

  ListSigningPlatformsResponse({
    this.nextToken,
    this.platforms,
  });

  factory ListSigningPlatformsResponse.fromJson(Map<String, dynamic> json) {
    return ListSigningPlatformsResponse(
      nextToken: json['nextToken'] as String?,
      platforms: (json['platforms'] as List?)
          ?.whereNotNull()
          .map((e) => SigningPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final platforms = this.platforms;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (platforms != null) 'platforms': platforms,
    };
  }
}

class ListSigningProfilesResponse {
  /// Value for specifying the next set of paginated results to return.
  final String? nextToken;

  /// A list of profiles that are available in the AWS account. This includes
  /// profiles with the status of <code>CANCELED</code> if the
  /// <code>includeCanceled</code> parameter is set to <code>true</code>.
  final List<SigningProfile>? profiles;

  ListSigningProfilesResponse({
    this.nextToken,
    this.profiles,
  });

  factory ListSigningProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListSigningProfilesResponse(
      nextToken: json['nextToken'] as String?,
      profiles: (json['profiles'] as List?)
          ?.whereNotNull()
          .map((e) => SigningProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final profiles = this.profiles;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (profiles != null) 'profiles': profiles,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags associated with the signing profile.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// A cross-account permission for a signing profile.
class Permission {
  /// An AWS Signer action permitted as part of cross-account permissions.
  final String? action;

  /// The AWS principal that has been granted a cross-account permission.
  final String? principal;

  /// The signing profile version that a permission applies to.
  final String? profileVersion;

  /// A unique identifier for a cross-account permission statement.
  final String? statementId;

  Permission({
    this.action,
    this.principal,
    this.profileVersion,
    this.statementId,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      action: json['action'] as String?,
      principal: json['principal'] as String?,
      profileVersion: json['profileVersion'] as String?,
      statementId: json['statementId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final principal = this.principal;
    final profileVersion = this.profileVersion;
    final statementId = this.statementId;
    return {
      if (action != null) 'action': action,
      if (principal != null) 'principal': principal,
      if (profileVersion != null) 'profileVersion': profileVersion,
      if (statementId != null) 'statementId': statementId,
    };
  }
}

class PutSigningProfileResponse {
  /// The Amazon Resource Name (ARN) of the signing profile created.
  final String? arn;

  /// The version of the signing profile being created.
  final String? profileVersion;

  /// The signing profile ARN, including the profile version.
  final String? profileVersionArn;

  PutSigningProfileResponse({
    this.arn,
    this.profileVersion,
    this.profileVersionArn,
  });

  factory PutSigningProfileResponse.fromJson(Map<String, dynamic> json) {
    return PutSigningProfileResponse(
      arn: json['arn'] as String?,
      profileVersion: json['profileVersion'] as String?,
      profileVersionArn: json['profileVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final profileVersion = this.profileVersion;
    final profileVersionArn = this.profileVersionArn;
    return {
      if (arn != null) 'arn': arn,
      if (profileVersion != null) 'profileVersion': profileVersion,
      if (profileVersionArn != null) 'profileVersionArn': profileVersionArn,
    };
  }
}

class RemoveProfilePermissionResponse {
  /// An identifier for the current revision of the profile permissions.
  final String? revisionId;

  RemoveProfilePermissionResponse({
    this.revisionId,
  });

  factory RemoveProfilePermissionResponse.fromJson(Map<String, dynamic> json) {
    return RemoveProfilePermissionResponse(
      revisionId: json['revisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionId = this.revisionId;
    return {
      if (revisionId != null) 'revisionId': revisionId,
    };
  }
}

/// The name and prefix of the Amazon S3 bucket where AWS Signer saves your
/// signed objects.
class S3Destination {
  /// Name of the S3 bucket.
  final String? bucketName;

  /// An S3 prefix that you can use to limit responses to those that begin with
  /// the specified prefix.
  final String? prefix;

  S3Destination({
    this.bucketName,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final prefix = this.prefix;
    return {
      if (bucketName != null) 'bucketName': bucketName,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// The Amazon S3 bucket name and key where Signer saved your signed code image.
class S3SignedObject {
  /// Name of the S3 bucket.
  final String? bucketName;

  /// Key name that uniquely identifies a signed code image in your bucket.
  final String? key;

  S3SignedObject({
    this.bucketName,
    this.key,
  });

  factory S3SignedObject.fromJson(Map<String, dynamic> json) {
    return S3SignedObject(
      bucketName: json['bucketName'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    return {
      if (bucketName != null) 'bucketName': bucketName,
      if (key != null) 'key': key,
    };
  }
}

/// Information about the Amazon S3 bucket where you saved your unsigned code.
class S3Source {
  /// Name of the S3 bucket.
  final String bucketName;

  /// Key name of the bucket object that contains your unsigned code.
  final String key;

  /// Version of your source image in your version enabled S3 bucket.
  final String version;

  S3Source({
    required this.bucketName,
    required this.key,
    required this.version,
  });

  factory S3Source.fromJson(Map<String, dynamic> json) {
    return S3Source(
      bucketName: json['bucketName'] as String,
      key: json['key'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    final version = this.version;
    return {
      'bucketName': bucketName,
      'key': key,
      'version': version,
    };
  }
}

class SignPayloadResponse {
  /// Unique identifier of the signing job.
  final String? jobId;

  /// The AWS account ID of the job owner.
  final String? jobOwner;

  /// Information including the signing profile ARN and the signing job ID.
  final Map<String, String>? metadata;

  /// A cryptographic signature.
  final Uint8List? signature;

  SignPayloadResponse({
    this.jobId,
    this.jobOwner,
    this.metadata,
    this.signature,
  });

  factory SignPayloadResponse.fromJson(Map<String, dynamic> json) {
    return SignPayloadResponse(
      jobId: json['jobId'] as String?,
      jobOwner: json['jobOwner'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      signature: _s.decodeNullableUint8List(json['signature'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobOwner = this.jobOwner;
    final metadata = this.metadata;
    final signature = this.signature;
    return {
      if (jobId != null) 'jobId': jobId,
      if (jobOwner != null) 'jobOwner': jobOwner,
      if (metadata != null) 'metadata': metadata,
      if (signature != null) 'signature': base64Encode(signature),
    };
  }
}

/// The validity period for a signing job.
class SignatureValidityPeriod {
  /// The time unit for signature validity.
  final ValidityType? type;

  /// The numerical value of the time unit for signature validity.
  final int? value;

  SignatureValidityPeriod({
    this.type,
    this.value,
  });

  factory SignatureValidityPeriod.fromJson(Map<String, dynamic> json) {
    return SignatureValidityPeriod(
      type: (json['type'] as String?)?.toValidityType(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'type': type.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Points to an <code>S3SignedObject</code> object that contains information
/// about your signed code image.
class SignedObject {
  /// The <code>S3SignedObject</code>.
  final S3SignedObject? s3;

  SignedObject({
    this.s3,
  });

  factory SignedObject.fromJson(Map<String, dynamic> json) {
    return SignedObject(
      s3: json['s3'] != null
          ? S3SignedObject.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

/// The configuration of a signing operation.
class SigningConfiguration {
  /// The encryption algorithm options that are available for a code-signing job.
  final EncryptionAlgorithmOptions encryptionAlgorithmOptions;

  /// The hash algorithm options that are available for a code-signing job.
  final HashAlgorithmOptions hashAlgorithmOptions;

  SigningConfiguration({
    required this.encryptionAlgorithmOptions,
    required this.hashAlgorithmOptions,
  });

  factory SigningConfiguration.fromJson(Map<String, dynamic> json) {
    return SigningConfiguration(
      encryptionAlgorithmOptions: EncryptionAlgorithmOptions.fromJson(
          json['encryptionAlgorithmOptions'] as Map<String, dynamic>),
      hashAlgorithmOptions: HashAlgorithmOptions.fromJson(
          json['hashAlgorithmOptions'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionAlgorithmOptions = this.encryptionAlgorithmOptions;
    final hashAlgorithmOptions = this.hashAlgorithmOptions;
    return {
      'encryptionAlgorithmOptions': encryptionAlgorithmOptions,
      'hashAlgorithmOptions': hashAlgorithmOptions,
    };
  }
}

/// A signing configuration that overrides the default encryption or hash
/// algorithm of a signing job.
class SigningConfigurationOverrides {
  /// A specified override of the default encryption algorithm that is used in a
  /// code-signing job.
  final EncryptionAlgorithm? encryptionAlgorithm;

  /// A specified override of the default hash algorithm that is used in a
  /// code-signing job.
  final HashAlgorithm? hashAlgorithm;

  SigningConfigurationOverrides({
    this.encryptionAlgorithm,
    this.hashAlgorithm,
  });

  factory SigningConfigurationOverrides.fromJson(Map<String, dynamic> json) {
    return SigningConfigurationOverrides(
      encryptionAlgorithm:
          (json['encryptionAlgorithm'] as String?)?.toEncryptionAlgorithm(),
      hashAlgorithm: (json['hashAlgorithm'] as String?)?.toHashAlgorithm(),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionAlgorithm = this.encryptionAlgorithm;
    final hashAlgorithm = this.hashAlgorithm;
    return {
      if (encryptionAlgorithm != null)
        'encryptionAlgorithm': encryptionAlgorithm.toValue(),
      if (hashAlgorithm != null) 'hashAlgorithm': hashAlgorithm.toValue(),
    };
  }
}

/// The image format of a AWS Signer platform or profile.
class SigningImageFormat {
  /// The default format of a signing image.
  final ImageFormat defaultFormat;

  /// The supported formats of a signing image.
  final List<ImageFormat> supportedFormats;

  SigningImageFormat({
    required this.defaultFormat,
    required this.supportedFormats,
  });

  factory SigningImageFormat.fromJson(Map<String, dynamic> json) {
    return SigningImageFormat(
      defaultFormat: (json['defaultFormat'] as String).toImageFormat(),
      supportedFormats: (json['supportedFormats'] as List)
          .whereNotNull()
          .map((e) => (e as String).toImageFormat())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultFormat = this.defaultFormat;
    final supportedFormats = this.supportedFormats;
    return {
      'defaultFormat': defaultFormat.toValue(),
      'supportedFormats': supportedFormats.map((e) => e.toValue()).toList(),
    };
  }
}

/// Contains information about a signing job.
class SigningJob {
  /// The date and time that the signing job was created.
  final DateTime? createdAt;

  /// Indicates whether the signing job is revoked.
  final bool? isRevoked;

  /// The ID of the signing job.
  final String? jobId;

  /// The AWS account ID of the job invoker.
  final String? jobInvoker;

  /// The AWS account ID of the job owner.
  final String? jobOwner;

  /// The name of a signing platform.
  final String? platformDisplayName;

  /// The unique identifier for a signing platform.
  final String? platformId;

  /// The name of the signing profile that created a signing job.
  final String? profileName;

  /// The version of the signing profile that created a signing job.
  final String? profileVersion;

  /// The time when the signature of a signing job expires.
  final DateTime? signatureExpiresAt;

  /// A <code>SignedObject</code> structure that contains information about a
  /// signing job's signed code image.
  final SignedObject? signedObject;

  /// A <code>SigningMaterial</code> object that contains the Amazon Resource Name
  /// (ARN) of the certificate used for the signing job.
  final SigningMaterial? signingMaterial;

  /// A <code>Source</code> that contains information about a signing job's code
  /// image source.
  final Source? source;

  /// The status of the signing job.
  final SigningStatus? status;

  SigningJob({
    this.createdAt,
    this.isRevoked,
    this.jobId,
    this.jobInvoker,
    this.jobOwner,
    this.platformDisplayName,
    this.platformId,
    this.profileName,
    this.profileVersion,
    this.signatureExpiresAt,
    this.signedObject,
    this.signingMaterial,
    this.source,
    this.status,
  });

  factory SigningJob.fromJson(Map<String, dynamic> json) {
    return SigningJob(
      createdAt: timeStampFromJson(json['createdAt']),
      isRevoked: json['isRevoked'] as bool?,
      jobId: json['jobId'] as String?,
      jobInvoker: json['jobInvoker'] as String?,
      jobOwner: json['jobOwner'] as String?,
      platformDisplayName: json['platformDisplayName'] as String?,
      platformId: json['platformId'] as String?,
      profileName: json['profileName'] as String?,
      profileVersion: json['profileVersion'] as String?,
      signatureExpiresAt: timeStampFromJson(json['signatureExpiresAt']),
      signedObject: json['signedObject'] != null
          ? SignedObject.fromJson(json['signedObject'] as Map<String, dynamic>)
          : null,
      signingMaterial: json['signingMaterial'] != null
          ? SigningMaterial.fromJson(
              json['signingMaterial'] as Map<String, dynamic>)
          : null,
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toSigningStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final isRevoked = this.isRevoked;
    final jobId = this.jobId;
    final jobInvoker = this.jobInvoker;
    final jobOwner = this.jobOwner;
    final platformDisplayName = this.platformDisplayName;
    final platformId = this.platformId;
    final profileName = this.profileName;
    final profileVersion = this.profileVersion;
    final signatureExpiresAt = this.signatureExpiresAt;
    final signedObject = this.signedObject;
    final signingMaterial = this.signingMaterial;
    final source = this.source;
    final status = this.status;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (isRevoked != null) 'isRevoked': isRevoked,
      if (jobId != null) 'jobId': jobId,
      if (jobInvoker != null) 'jobInvoker': jobInvoker,
      if (jobOwner != null) 'jobOwner': jobOwner,
      if (platformDisplayName != null)
        'platformDisplayName': platformDisplayName,
      if (platformId != null) 'platformId': platformId,
      if (profileName != null) 'profileName': profileName,
      if (profileVersion != null) 'profileVersion': profileVersion,
      if (signatureExpiresAt != null)
        'signatureExpiresAt': unixTimestampToJson(signatureExpiresAt),
      if (signedObject != null) 'signedObject': signedObject,
      if (signingMaterial != null) 'signingMaterial': signingMaterial,
      if (source != null) 'source': source,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Revocation information for a signing job.
class SigningJobRevocationRecord {
  /// A caller-supplied reason for revocation.
  final String? reason;

  /// The time of revocation.
  final DateTime? revokedAt;

  /// The identity of the revoker.
  final String? revokedBy;

  SigningJobRevocationRecord({
    this.reason,
    this.revokedAt,
    this.revokedBy,
  });

  factory SigningJobRevocationRecord.fromJson(Map<String, dynamic> json) {
    return SigningJobRevocationRecord(
      reason: json['reason'] as String?,
      revokedAt: timeStampFromJson(json['revokedAt']),
      revokedBy: json['revokedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final revokedAt = this.revokedAt;
    final revokedBy = this.revokedBy;
    return {
      if (reason != null) 'reason': reason,
      if (revokedAt != null) 'revokedAt': unixTimestampToJson(revokedAt),
      if (revokedBy != null) 'revokedBy': revokedBy,
    };
  }
}

/// The ACM certificate that is used to sign your code.
class SigningMaterial {
  /// The Amazon Resource Name (ARN) of the certificates that is used to sign your
  /// code.
  final String certificateArn;

  SigningMaterial({
    required this.certificateArn,
  });

  factory SigningMaterial.fromJson(Map<String, dynamic> json) {
    return SigningMaterial(
      certificateArn: json['certificateArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    return {
      'certificateArn': certificateArn,
    };
  }
}

/// Contains information about the signing configurations and parameters that
/// are used to perform a code-signing job.
class SigningPlatform {
  /// The category of a signing platform.
  final Category? category;

  /// The display name of a signing platform.
  final String? displayName;

  /// The maximum size (in MB) of code that can be signed by a signing platform.
  final int? maxSizeInMB;

  /// Any partner entities linked to a signing platform.
  final String? partner;

  /// The ID of a signing platform.
  final String? platformId;

  /// Indicates whether revocation is supported for the platform.
  final bool? revocationSupported;

  /// The configuration of a signing platform. This includes the designated hash
  /// algorithm and encryption algorithm of a signing platform.
  final SigningConfiguration? signingConfiguration;
  final SigningImageFormat? signingImageFormat;

  /// The types of targets that can be signed by a signing platform.
  final String? target;

  SigningPlatform({
    this.category,
    this.displayName,
    this.maxSizeInMB,
    this.partner,
    this.platformId,
    this.revocationSupported,
    this.signingConfiguration,
    this.signingImageFormat,
    this.target,
  });

  factory SigningPlatform.fromJson(Map<String, dynamic> json) {
    return SigningPlatform(
      category: (json['category'] as String?)?.toCategory(),
      displayName: json['displayName'] as String?,
      maxSizeInMB: json['maxSizeInMB'] as int?,
      partner: json['partner'] as String?,
      platformId: json['platformId'] as String?,
      revocationSupported: json['revocationSupported'] as bool?,
      signingConfiguration: json['signingConfiguration'] != null
          ? SigningConfiguration.fromJson(
              json['signingConfiguration'] as Map<String, dynamic>)
          : null,
      signingImageFormat: json['signingImageFormat'] != null
          ? SigningImageFormat.fromJson(
              json['signingImageFormat'] as Map<String, dynamic>)
          : null,
      target: json['target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final displayName = this.displayName;
    final maxSizeInMB = this.maxSizeInMB;
    final partner = this.partner;
    final platformId = this.platformId;
    final revocationSupported = this.revocationSupported;
    final signingConfiguration = this.signingConfiguration;
    final signingImageFormat = this.signingImageFormat;
    final target = this.target;
    return {
      if (category != null) 'category': category.toValue(),
      if (displayName != null) 'displayName': displayName,
      if (maxSizeInMB != null) 'maxSizeInMB': maxSizeInMB,
      if (partner != null) 'partner': partner,
      if (platformId != null) 'platformId': platformId,
      if (revocationSupported != null)
        'revocationSupported': revocationSupported,
      if (signingConfiguration != null)
        'signingConfiguration': signingConfiguration,
      if (signingImageFormat != null) 'signingImageFormat': signingImageFormat,
      if (target != null) 'target': target,
    };
  }
}

/// Any overrides that are applied to the signing configuration of a signing
/// platform.
class SigningPlatformOverrides {
  /// A signing configuration that overrides the default encryption or hash
  /// algorithm of a signing job.
  final SigningConfigurationOverrides? signingConfiguration;

  /// A signed image is a JSON object. When overriding the default signing
  /// platform configuration, a customer can select either of two signing formats,
  /// <code>JSONEmbedded</code> or <code>JSONDetached</code>. (A third format
  /// value, <code>JSON</code>, is reserved for future use.) With
  /// <code>JSONEmbedded</code>, the signing image has the payload embedded in it.
  /// With <code>JSONDetached</code>, the payload is not be embedded in the
  /// signing image.
  final ImageFormat? signingImageFormat;

  SigningPlatformOverrides({
    this.signingConfiguration,
    this.signingImageFormat,
  });

  factory SigningPlatformOverrides.fromJson(Map<String, dynamic> json) {
    return SigningPlatformOverrides(
      signingConfiguration: json['signingConfiguration'] != null
          ? SigningConfigurationOverrides.fromJson(
              json['signingConfiguration'] as Map<String, dynamic>)
          : null,
      signingImageFormat:
          (json['signingImageFormat'] as String?)?.toImageFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final signingConfiguration = this.signingConfiguration;
    final signingImageFormat = this.signingImageFormat;
    return {
      if (signingConfiguration != null)
        'signingConfiguration': signingConfiguration,
      if (signingImageFormat != null)
        'signingImageFormat': signingImageFormat.toValue(),
    };
  }
}

/// Contains information about the ACM certificates and signing configuration
/// parameters that can be used by a given code signing user.
class SigningProfile {
  /// The Amazon Resource Name (ARN) for the signing profile.
  final String? arn;

  /// The name of the signing platform.
  final String? platformDisplayName;

  /// The ID of a platform that is available for use by a signing profile.
  final String? platformId;

  /// The name of the signing profile.
  final String? profileName;

  /// The version of a signing profile.
  final String? profileVersion;

  /// The ARN of a signing profile, including the profile version.
  final String? profileVersionArn;

  /// The validity period for a signing job created using this signing profile.
  final SignatureValidityPeriod? signatureValidityPeriod;

  /// The ACM certificate that is available for use by a signing profile.
  final SigningMaterial? signingMaterial;

  /// The parameters that are available for use by a Signer user.
  final Map<String, String>? signingParameters;

  /// The status of a signing profile.
  final SigningProfileStatus? status;

  /// A list of tags associated with the signing profile.
  final Map<String, String>? tags;

  SigningProfile({
    this.arn,
    this.platformDisplayName,
    this.platformId,
    this.profileName,
    this.profileVersion,
    this.profileVersionArn,
    this.signatureValidityPeriod,
    this.signingMaterial,
    this.signingParameters,
    this.status,
    this.tags,
  });

  factory SigningProfile.fromJson(Map<String, dynamic> json) {
    return SigningProfile(
      arn: json['arn'] as String?,
      platformDisplayName: json['platformDisplayName'] as String?,
      platformId: json['platformId'] as String?,
      profileName: json['profileName'] as String?,
      profileVersion: json['profileVersion'] as String?,
      profileVersionArn: json['profileVersionArn'] as String?,
      signatureValidityPeriod: json['signatureValidityPeriod'] != null
          ? SignatureValidityPeriod.fromJson(
              json['signatureValidityPeriod'] as Map<String, dynamic>)
          : null,
      signingMaterial: json['signingMaterial'] != null
          ? SigningMaterial.fromJson(
              json['signingMaterial'] as Map<String, dynamic>)
          : null,
      signingParameters: (json['signingParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['status'] as String?)?.toSigningProfileStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final platformDisplayName = this.platformDisplayName;
    final platformId = this.platformId;
    final profileName = this.profileName;
    final profileVersion = this.profileVersion;
    final profileVersionArn = this.profileVersionArn;
    final signatureValidityPeriod = this.signatureValidityPeriod;
    final signingMaterial = this.signingMaterial;
    final signingParameters = this.signingParameters;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (platformDisplayName != null)
        'platformDisplayName': platformDisplayName,
      if (platformId != null) 'platformId': platformId,
      if (profileName != null) 'profileName': profileName,
      if (profileVersion != null) 'profileVersion': profileVersion,
      if (profileVersionArn != null) 'profileVersionArn': profileVersionArn,
      if (signatureValidityPeriod != null)
        'signatureValidityPeriod': signatureValidityPeriod,
      if (signingMaterial != null) 'signingMaterial': signingMaterial,
      if (signingParameters != null) 'signingParameters': signingParameters,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Revocation information for a signing profile.
class SigningProfileRevocationRecord {
  /// The time when revocation becomes effective.
  final DateTime? revocationEffectiveFrom;

  /// The time when the signing profile was revoked.
  final DateTime? revokedAt;

  /// The identity of the revoker.
  final String? revokedBy;

  SigningProfileRevocationRecord({
    this.revocationEffectiveFrom,
    this.revokedAt,
    this.revokedBy,
  });

  factory SigningProfileRevocationRecord.fromJson(Map<String, dynamic> json) {
    return SigningProfileRevocationRecord(
      revocationEffectiveFrom:
          timeStampFromJson(json['revocationEffectiveFrom']),
      revokedAt: timeStampFromJson(json['revokedAt']),
      revokedBy: json['revokedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revocationEffectiveFrom = this.revocationEffectiveFrom;
    final revokedAt = this.revokedAt;
    final revokedBy = this.revokedBy;
    return {
      if (revocationEffectiveFrom != null)
        'revocationEffectiveFrom': unixTimestampToJson(revocationEffectiveFrom),
      if (revokedAt != null) 'revokedAt': unixTimestampToJson(revokedAt),
      if (revokedBy != null) 'revokedBy': revokedBy,
    };
  }
}

enum SigningProfileStatus {
  active,
  canceled,
  revoked,
}

extension SigningProfileStatusValueExtension on SigningProfileStatus {
  String toValue() {
    switch (this) {
      case SigningProfileStatus.active:
        return 'Active';
      case SigningProfileStatus.canceled:
        return 'Canceled';
      case SigningProfileStatus.revoked:
        return 'Revoked';
    }
  }
}

extension SigningProfileStatusFromString on String {
  SigningProfileStatus toSigningProfileStatus() {
    switch (this) {
      case 'Active':
        return SigningProfileStatus.active;
      case 'Canceled':
        return SigningProfileStatus.canceled;
      case 'Revoked':
        return SigningProfileStatus.revoked;
    }
    throw Exception('$this is not known in enum SigningProfileStatus');
  }
}

enum SigningStatus {
  inProgress,
  failed,
  succeeded,
}

extension SigningStatusValueExtension on SigningStatus {
  String toValue() {
    switch (this) {
      case SigningStatus.inProgress:
        return 'InProgress';
      case SigningStatus.failed:
        return 'Failed';
      case SigningStatus.succeeded:
        return 'Succeeded';
    }
  }
}

extension SigningStatusFromString on String {
  SigningStatus toSigningStatus() {
    switch (this) {
      case 'InProgress':
        return SigningStatus.inProgress;
      case 'Failed':
        return SigningStatus.failed;
      case 'Succeeded':
        return SigningStatus.succeeded;
    }
    throw Exception('$this is not known in enum SigningStatus');
  }
}

/// An <code>S3Source</code> object that contains information about the S3
/// bucket where you saved your unsigned code.
class Source {
  /// The <code>S3Source</code> object.
  final S3Source? s3;

  Source({
    this.s3,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      s3: json['s3'] != null
          ? S3Source.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

class StartSigningJobResponse {
  /// The ID of your signing job.
  final String? jobId;

  /// The AWS account ID of the signing job owner.
  final String? jobOwner;

  StartSigningJobResponse({
    this.jobId,
    this.jobOwner,
  });

  factory StartSigningJobResponse.fromJson(Map<String, dynamic> json) {
    return StartSigningJobResponse(
      jobId: json['jobId'] as String?,
      jobOwner: json['jobOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobOwner = this.jobOwner;
    return {
      if (jobId != null) 'jobId': jobId,
      if (jobOwner != null) 'jobOwner': jobOwner,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ValidityType {
  days,
  months,
  years,
}

extension ValidityTypeValueExtension on ValidityType {
  String toValue() {
    switch (this) {
      case ValidityType.days:
        return 'DAYS';
      case ValidityType.months:
        return 'MONTHS';
      case ValidityType.years:
        return 'YEARS';
    }
  }
}

extension ValidityTypeFromString on String {
  ValidityType toValidityType() {
    switch (this) {
      case 'DAYS':
        return ValidityType.days;
      case 'MONTHS':
        return ValidityType.months;
      case 'YEARS':
        return ValidityType.years;
    }
    throw Exception('$this is not known in enum ValidityType');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceLimitExceededException extends _s.GenericAwsException {
  ServiceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceLimitExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceLimitExceededException': (type, message) =>
      ServiceLimitExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
