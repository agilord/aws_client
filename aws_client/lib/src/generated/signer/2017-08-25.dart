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

part '2017-08-25.g.dart';

/// AWS Signer is a fully managed code signing service to help you ensure the
/// trust and integrity of your code.
///
/// AWS Signer supports the following applications:
///
/// With <i>code signing for AWS Lambda</i>, you can sign AWS Lambda deployment
/// packages. Integrated support is provided for Amazon S3, Amazon CloudWatch,
/// and AWS CloudTrail. In order to sign code, you create a signing profile and
/// then use Signer to sign Lambda zip files in S3.
///
/// With <i>code signing for IoT</i>, you can sign code for any IoT device that
/// is supported by AWS. IoT code signing is available for <a
/// href="http://docs.aws.amazon.com/freertos/latest/userguide/">Amazon
/// FreeRTOS</a> and <a
/// href="http://docs.aws.amazon.com/iot/latest/developerguide/">AWS IoT Device
/// Management</a>, and is integrated with <a
/// href="http://docs.aws.amazon.com/acm/latest/userguide/">AWS Certificate
/// Manager (ACM)</a>. In order to sign code, you import a third-party code
/// signing certificate using ACM, and use that to sign updates in Amazon
/// FreeRTOS and AWS IoT Device Management.
///
/// For more information about AWS Signer, see the <a
/// href="http://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html">AWS
/// Signer Developer Guide</a>.
/// <p/>
class Signer {
  final _s.RestJsonProtocol _protocol;
  Signer({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'signer',
            signingName: 'signer',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// The AWS Signer action permitted as part of cross-account permissions.
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
    @_s.required String action,
    @_s.required String principal,
    @_s.required String profileName,
    @_s.required String statementId,
    String profileVersion,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(principal, 'principal');
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(statementId, 'statementId');
    _s.validateStringLength(
      'profileVersion',
      profileVersion,
      10,
      10,
    );
    _s.validateStringPattern(
      'profileVersion',
      profileVersion,
      r'''^[a-zA-Z0-9]{10}$''',
    );
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
    @_s.required String profileName,
  }) async {
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
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
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSigningJobResponse.fromJson(response);
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
    @_s.required String platformId,
  }) async {
    ArgumentError.checkNotNull(platformId, 'platformId');
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
    @_s.required String profileName,
    String profileOwner,
  }) async {
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'profileOwner',
      profileOwner,
      12,
      12,
    );
    _s.validateStringPattern(
      'profileOwner',
      profileOwner,
      r'''^[0-9]{12}$''',
    );
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
    @_s.required String profileName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
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
  /// response. If additional jobs remain to be listed, code signing returns a
  /// <code>nextToken</code> value. Use this value in subsequent calls to
  /// <code>ListSigningJobs</code> to fetch the remaining values. You can
  /// continue calling <code>ListSigningJobs</code> with your
  /// <code>maxResults</code> parameter and with new values that code signing
  /// returns in the <code>nextToken</code> parameter until all of your signing
  /// jobs have been returned.
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
    bool isRevoked,
    String jobInvoker,
    int maxResults,
    String nextToken,
    String platformId,
    String requestedBy,
    DateTime signatureExpiresAfter,
    DateTime signatureExpiresBefore,
    SigningStatus status,
  }) async {
    _s.validateStringLength(
      'jobInvoker',
      jobInvoker,
      12,
      12,
    );
    _s.validateStringPattern(
      'jobInvoker',
      jobInvoker,
      r'''^[0-9]{12}$''',
    );
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

  /// Lists all signing platforms available in code signing that match the
  /// request parameters. If additional jobs remain to be listed, code signing
  /// returns a <code>nextToken</code> value. Use this value in subsequent calls
  /// to <code>ListSigningJobs</code> to fetch the remaining values. You can
  /// continue calling <code>ListSigningJobs</code> with your
  /// <code>maxResults</code> parameter and with new values that code signing
  /// returns in the <code>nextToken</code> parameter until all of your signing
  /// jobs have been returned.
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
    String category,
    int maxResults,
    String nextToken,
    String partner,
    String target,
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
  /// additional jobs remain to be listed, code signing returns a
  /// <code>nextToken</code> value. Use this value in subsequent calls to
  /// <code>ListSigningJobs</code> to fetch the remaining values. You can
  /// continue calling <code>ListSigningJobs</code> with your
  /// <code>maxResults</code> parameter and with new values that code signing
  /// returns in the <code>nextToken</code> parameter until all of your signing
  /// jobs have been returned.
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
    bool includeCanceled,
    int maxResults,
    String nextToken,
    String platformId,
    List<SigningProfileStatus> statuses,
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
        'statuses': statuses.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates a signing profile. A signing profile is a code signing template
  /// that can be used to carry out a pre-defined signing job. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html">http://docs.aws.amazon.com/signer/latest/developerguide/gs-profile.html</a>
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
    @_s.required String platformId,
    @_s.required String profileName,
    SigningPlatformOverrides overrides,
    SignatureValidityPeriod signatureValidityPeriod,
    SigningMaterial signingMaterial,
    Map<String, String> signingParameters,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(platformId, 'platformId');
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
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
    @_s.required String profileName,
    @_s.required String revisionId,
    @_s.required String statementId,
  }) async {
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    ArgumentError.checkNotNull(statementId, 'statementId');
    final $query = <String, List<String>>{
      if (revisionId != null) 'revisionId': [revisionId],
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
    @_s.required String jobId,
    @_s.required String reason,
    String jobOwner,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(reason, 'reason');
    _s.validateStringLength(
      'reason',
      reason,
      1,
      500,
      isRequired: true,
    );
    _s.validateStringLength(
      'jobOwner',
      jobOwner,
      12,
      12,
    );
    _s.validateStringPattern(
      'jobOwner',
      jobOwner,
      r'''^[0-9]{12}$''',
    );
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
    @_s.required DateTime effectiveTime,
    @_s.required String profileName,
    @_s.required String profileVersion,
    @_s.required String reason,
  }) async {
    ArgumentError.checkNotNull(effectiveTime, 'effectiveTime');
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileVersion, 'profileVersion');
    _s.validateStringLength(
      'profileVersion',
      profileVersion,
      10,
      10,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileVersion',
      profileVersion,
      r'''^[a-zA-Z0-9]{10}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(reason, 'reason');
    _s.validateStringLength(
      'reason',
      reason,
      1,
      500,
      isRequired: true,
    );
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

  /// Initiates a signing job to be performed on the code provided. Signing jobs
  /// are viewable by the <code>ListSigningJobs</code> operation for two years
  /// after they are performed. Note the following requirements:
  ///
  /// <ul>
  /// <li>
  /// You must create an Amazon S3 source bucket. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonS3/latest/gsg/CreatingABucket.html">Create
  /// a Bucket</a> in the <i>Amazon S3 Getting Started Guide</i>.
  /// </li>
  /// <li>
  /// Your S3 source bucket must be version enabled.
  /// </li>
  /// <li>
  /// You must create an S3 destination bucket. Code signing uses your S3
  /// destination bucket to write your signed code.
  /// </li>
  /// <li>
  /// You specify the name of the source and destination buckets when calling
  /// the <code>StartSigningJob</code> operation.
  /// </li>
  /// <li>
  /// You must also specify a request token that identifies your request to code
  /// signing.
  /// </li>
  /// </ul>
  /// You can call the <a>DescribeSigningJob</a> and the <a>ListSigningJobs</a>
  /// actions after you call <code>StartSigningJob</code>.
  ///
  /// For a Java example that shows how to use this action, see <a
  /// href="http://docs.aws.amazon.com/acm/latest/userguide/">http://docs.aws.amazon.com/acm/latest/userguide/</a>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [clientRequestToken] :
  /// String that identifies the signing request. All calls after the first that
  /// use this token return the same response as the first call.
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
  /// Parameter [profileOwner] :
  /// The AWS account ID of the signing profile owner.
  Future<StartSigningJobResponse> startSigningJob({
    @_s.required String clientRequestToken,
    @_s.required Destination destination,
    @_s.required String profileName,
    @_s.required Source source,
    String profileOwner,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    ArgumentError.checkNotNull(destination, 'destination');
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(source, 'source');
    _s.validateStringLength(
      'profileOwner',
      profileOwner,
      12,
      12,
    );
    _s.validateStringPattern(
      'profileOwner',
      profileOwner,
      r'''^[0-9]{12}$''',
    );
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'destination': destination,
      'profileName': profileName,
      'source': source,
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddProfilePermissionResponse {
  /// A unique identifier for the current profile revision.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  AddProfilePermissionResponse({
    this.revisionId,
  });
  factory AddProfilePermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProfilePermissionResponseFromJson(json);
}

enum Category {
  @_s.JsonValue('AWSIoT')
  awsIoT,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSigningJobResponse {
  /// Date and time that the signing job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'completedAt')
  final DateTime completedAt;

  /// Date and time that the signing job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the signing job on output.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The IAM entity that initiated the signing job.
  @_s.JsonKey(name: 'jobInvoker')
  final String jobInvoker;

  /// The AWS account ID of the job owner.
  @_s.JsonKey(name: 'jobOwner')
  final String jobOwner;

  /// A list of any overrides that were applied to the signing operation.
  @_s.JsonKey(name: 'overrides')
  final SigningPlatformOverrides overrides;

  /// A human-readable name for the signing platform associated with the signing
  /// job.
  @_s.JsonKey(name: 'platformDisplayName')
  final String platformDisplayName;

  /// The microcontroller platform to which your signed code image will be
  /// distributed.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// The name of the profile that initiated the signing operation.
  @_s.JsonKey(name: 'profileName')
  final String profileName;

  /// The version of the signing profile used to initiate the signing job.
  @_s.JsonKey(name: 'profileVersion')
  final String profileVersion;

  /// The IAM principal that requested the signing job.
  @_s.JsonKey(name: 'requestedBy')
  final String requestedBy;

  /// A revocation record if the signature generated by the signing job has been
  /// revoked. Contains a timestamp and the ID of the IAM entity that revoked the
  /// signature.
  @_s.JsonKey(name: 'revocationRecord')
  final SigningJobRevocationRecord revocationRecord;

  /// Thr expiration timestamp for the signature generated by the signing job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'signatureExpiresAt')
  final DateTime signatureExpiresAt;

  /// Name of the S3 bucket where the signed code image is saved by code signing.
  @_s.JsonKey(name: 'signedObject')
  final SignedObject signedObject;

  /// The Amazon Resource Name (ARN) of your code signing certificate.
  @_s.JsonKey(name: 'signingMaterial')
  final SigningMaterial signingMaterial;

  /// Map of user-assigned key-value pairs used during signing. These values
  /// contain any information that you specified for use in your signing job.
  @_s.JsonKey(name: 'signingParameters')
  final Map<String, String> signingParameters;

  /// The object that contains the name of your S3 bucket or your raw code.
  @_s.JsonKey(name: 'source')
  final Source source;

  /// Status of the signing job.
  @_s.JsonKey(name: 'status')
  final SigningStatus status;

  /// String value that contains the status reason.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

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
  factory DescribeSigningJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSigningJobResponseFromJson(json);
}

/// Points to an <code>S3Destination</code> object that contains information
/// about your S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Destination {
  /// The <code>S3Destination</code> object.
  @_s.JsonKey(name: 's3')
  final S3Destination s3;

  Destination({
    this.s3,
  });
  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

enum EncryptionAlgorithm {
  @_s.JsonValue('RSA')
  rsa,
  @_s.JsonValue('ECDSA')
  ecdsa,
}

/// The encryption algorithm options that are available to a code signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EncryptionAlgorithmOptions {
  /// The set of accepted encryption algorithms that are allowed in a code signing
  /// job.
  @_s.JsonKey(name: 'allowedValues')
  final List<EncryptionAlgorithm> allowedValues;

  /// The default encryption algorithm that is used by a code signing job.
  @_s.JsonKey(name: 'defaultValue')
  final EncryptionAlgorithm defaultValue;

  EncryptionAlgorithmOptions({
    @_s.required this.allowedValues,
    @_s.required this.defaultValue,
  });
  factory EncryptionAlgorithmOptions.fromJson(Map<String, dynamic> json) =>
      _$EncryptionAlgorithmOptionsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSigningPlatformResponse {
  /// The category type of the target signing platform.
  @_s.JsonKey(name: 'category')
  final Category category;

  /// The display name of the target signing platform.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The maximum size (in MB) of the payload that can be signed by the target
  /// platform.
  @_s.JsonKey(name: 'maxSizeInMB')
  final int maxSizeInMB;

  /// A list of partner entities that use the target signing platform.
  @_s.JsonKey(name: 'partner')
  final String partner;

  /// The ID of the target signing platform.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// A flag indicating whether signatures generated for the signing platform can
  /// be revoked.
  @_s.JsonKey(name: 'revocationSupported')
  final bool revocationSupported;

  /// A list of configurations applied to the target platform at signing.
  @_s.JsonKey(name: 'signingConfiguration')
  final SigningConfiguration signingConfiguration;

  /// The format of the target platform's signing image.
  @_s.JsonKey(name: 'signingImageFormat')
  final SigningImageFormat signingImageFormat;

  /// The validation template that is used by the target signing platform.
  @_s.JsonKey(name: 'target')
  final String target;

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
  factory GetSigningPlatformResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSigningPlatformResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSigningProfileResponse {
  /// The Amazon Resource Name (ARN) for the signing profile.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of overrides applied by the target signing profile for signing
  /// operations.
  @_s.JsonKey(name: 'overrides')
  final SigningPlatformOverrides overrides;

  /// A human-readable name for the signing platform associated with the signing
  /// profile.
  @_s.JsonKey(name: 'platformDisplayName')
  final String platformDisplayName;

  /// The ID of the platform that is used by the target signing profile.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// The name of the target signing profile.
  @_s.JsonKey(name: 'profileName')
  final String profileName;

  /// The current version of the signing profile.
  @_s.JsonKey(name: 'profileVersion')
  final String profileVersion;

  /// The signing profile ARN, including the profile version.
  @_s.JsonKey(name: 'profileVersionArn')
  final String profileVersionArn;
  @_s.JsonKey(name: 'revocationRecord')
  final SigningProfileRevocationRecord revocationRecord;
  @_s.JsonKey(name: 'signatureValidityPeriod')
  final SignatureValidityPeriod signatureValidityPeriod;

  /// The ARN of the certificate that the target profile uses for signing
  /// operations.
  @_s.JsonKey(name: 'signingMaterial')
  final SigningMaterial signingMaterial;

  /// A map of key-value pairs for signing operations that is attached to the
  /// target signing profile.
  @_s.JsonKey(name: 'signingParameters')
  final Map<String, String> signingParameters;

  /// The status of the target signing profile.
  @_s.JsonKey(name: 'status')
  final SigningProfileStatus status;

  /// Reason for the status of the target signing profile.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// A list of tags associated with the signing profile.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory GetSigningProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSigningProfileResponseFromJson(json);
}

enum HashAlgorithm {
  @_s.JsonValue('SHA1')
  sha1,
  @_s.JsonValue('SHA256')
  sha256,
}

/// The hash algorithms that are available to a code signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HashAlgorithmOptions {
  /// The set of accepted hash algorithms allowed in a code signing job.
  @_s.JsonKey(name: 'allowedValues')
  final List<HashAlgorithm> allowedValues;

  /// The default hash algorithm that is used in a code signing job.
  @_s.JsonKey(name: 'defaultValue')
  final HashAlgorithm defaultValue;

  HashAlgorithmOptions({
    @_s.required this.allowedValues,
    @_s.required this.defaultValue,
  });
  factory HashAlgorithmOptions.fromJson(Map<String, dynamic> json) =>
      _$HashAlgorithmOptionsFromJson(json);
}

enum ImageFormat {
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('JSONEmbedded')
  jSONEmbedded,
  @_s.JsonValue('JSONDetached')
  jSONDetached,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfilePermissionsResponse {
  /// String for specifying the next set of paginated results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of permissions associated with the Signing Profile.
  @_s.JsonKey(name: 'permissions')
  final List<Permission> permissions;

  /// Total size of the policy associated with the Signing Profile in bytes.
  @_s.JsonKey(name: 'policySizeBytes')
  final int policySizeBytes;

  /// The identifier for the current revision of profile permissions.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  ListProfilePermissionsResponse({
    this.nextToken,
    this.permissions,
    this.policySizeBytes,
    this.revisionId,
  });
  factory ListProfilePermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfilePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSigningJobsResponse {
  /// A list of your signing jobs.
  @_s.JsonKey(name: 'jobs')
  final List<SigningJob> jobs;

  /// String for specifying the next set of paginated results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListSigningJobsResponse({
    this.jobs,
    this.nextToken,
  });
  factory ListSigningJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSigningJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSigningPlatformsResponse {
  /// Value for specifying the next set of paginated results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of all platforms that match the request parameters.
  @_s.JsonKey(name: 'platforms')
  final List<SigningPlatform> platforms;

  ListSigningPlatformsResponse({
    this.nextToken,
    this.platforms,
  });
  factory ListSigningPlatformsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSigningPlatformsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSigningProfilesResponse {
  /// Value for specifying the next set of paginated results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of profiles that are available in the AWS account. This includes
  /// profiles with the status of <code>CANCELED</code> if the
  /// <code>includeCanceled</code> parameter is set to <code>true</code>.
  @_s.JsonKey(name: 'profiles')
  final List<SigningProfile> profiles;

  ListSigningProfilesResponse({
    this.nextToken,
    this.profiles,
  });
  factory ListSigningProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSigningProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of tags associated with the signing profile.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// A cross-account permission for a signing profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Permission {
  /// An AWS Signer action permitted as part of cross-account permissions.
  @_s.JsonKey(name: 'action')
  final String action;

  /// The AWS principal that has been granted a cross-account permission.
  @_s.JsonKey(name: 'principal')
  final String principal;

  /// The signing profile version that a permission applies to.
  @_s.JsonKey(name: 'profileVersion')
  final String profileVersion;

  /// A unique identifier for a cross-account permission statement.
  @_s.JsonKey(name: 'statementId')
  final String statementId;

  Permission({
    this.action,
    this.principal,
    this.profileVersion,
    this.statementId,
  });
  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSigningProfileResponse {
  /// The Amazon Resource Name (ARN) of the signing profile created.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The version of the signing profile being created.
  @_s.JsonKey(name: 'profileVersion')
  final String profileVersion;

  /// The signing profile ARN, including the profile version.
  @_s.JsonKey(name: 'profileVersionArn')
  final String profileVersionArn;

  PutSigningProfileResponse({
    this.arn,
    this.profileVersion,
    this.profileVersionArn,
  });
  factory PutSigningProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSigningProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveProfilePermissionResponse {
  /// An identifier for the current revision of the profile permissions.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  RemoveProfilePermissionResponse({
    this.revisionId,
  });
  factory RemoveProfilePermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveProfilePermissionResponseFromJson(json);
}

/// The name and prefix of the S3 bucket where code signing saves your signed
/// objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3Destination {
  /// Name of the S3 bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// An Amazon S3 prefix that you can use to limit responses to those that begin
  /// with the specified prefix.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  S3Destination({
    this.bucketName,
    this.prefix,
  });
  Map<String, dynamic> toJson() => _$S3DestinationToJson(this);
}

/// The S3 bucket name and key where code signing saved your signed code image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3SignedObject {
  /// Name of the S3 bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// Key name that uniquely identifies a signed code image in your bucket.
  @_s.JsonKey(name: 'key')
  final String key;

  S3SignedObject({
    this.bucketName,
    this.key,
  });
  factory S3SignedObject.fromJson(Map<String, dynamic> json) =>
      _$S3SignedObjectFromJson(json);
}

/// Information about the S3 bucket where you saved your unsigned code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Source {
  /// Name of the S3 bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// Key name of the bucket object that contains your unsigned code.
  @_s.JsonKey(name: 'key')
  final String key;

  /// Version of your source image in your version enabled S3 bucket.
  @_s.JsonKey(name: 'version')
  final String version;

  S3Source({
    @_s.required this.bucketName,
    @_s.required this.key,
    @_s.required this.version,
  });
  factory S3Source.fromJson(Map<String, dynamic> json) =>
      _$S3SourceFromJson(json);

  Map<String, dynamic> toJson() => _$S3SourceToJson(this);
}

/// The validity period for a signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SignatureValidityPeriod {
  /// The time unit for signature validity.
  @_s.JsonKey(name: 'type')
  final ValidityType type;

  /// The numerical value of the time unit for signature validity.
  @_s.JsonKey(name: 'value')
  final int value;

  SignatureValidityPeriod({
    this.type,
    this.value,
  });
  factory SignatureValidityPeriod.fromJson(Map<String, dynamic> json) =>
      _$SignatureValidityPeriodFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureValidityPeriodToJson(this);
}

/// Points to an <code>S3SignedObject</code> object that contains information
/// about your signed code image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SignedObject {
  /// The <code>S3SignedObject</code>.
  @_s.JsonKey(name: 's3')
  final S3SignedObject s3;

  SignedObject({
    this.s3,
  });
  factory SignedObject.fromJson(Map<String, dynamic> json) =>
      _$SignedObjectFromJson(json);
}

/// The configuration of a code signing operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SigningConfiguration {
  /// The encryption algorithm options that are available for a code signing job.
  @_s.JsonKey(name: 'encryptionAlgorithmOptions')
  final EncryptionAlgorithmOptions encryptionAlgorithmOptions;

  /// The hash algorithm options that are available for a code signing job.
  @_s.JsonKey(name: 'hashAlgorithmOptions')
  final HashAlgorithmOptions hashAlgorithmOptions;

  SigningConfiguration({
    @_s.required this.encryptionAlgorithmOptions,
    @_s.required this.hashAlgorithmOptions,
  });
  factory SigningConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SigningConfigurationFromJson(json);
}

/// A signing configuration that overrides the default encryption or hash
/// algorithm of a signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SigningConfigurationOverrides {
  /// A specified override of the default encryption algorithm that is used in a
  /// code signing job.
  @_s.JsonKey(name: 'encryptionAlgorithm')
  final EncryptionAlgorithm encryptionAlgorithm;

  /// A specified override of the default hash algorithm that is used in a code
  /// signing job.
  @_s.JsonKey(name: 'hashAlgorithm')
  final HashAlgorithm hashAlgorithm;

  SigningConfigurationOverrides({
    this.encryptionAlgorithm,
    this.hashAlgorithm,
  });
  factory SigningConfigurationOverrides.fromJson(Map<String, dynamic> json) =>
      _$SigningConfigurationOverridesFromJson(json);

  Map<String, dynamic> toJson() => _$SigningConfigurationOverridesToJson(this);
}

/// The image format of a code signing platform or profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SigningImageFormat {
  /// The default format of a code signing image.
  @_s.JsonKey(name: 'defaultFormat')
  final ImageFormat defaultFormat;

  /// The supported formats of a code signing image.
  @_s.JsonKey(name: 'supportedFormats')
  final List<ImageFormat> supportedFormats;

  SigningImageFormat({
    @_s.required this.defaultFormat,
    @_s.required this.supportedFormats,
  });
  factory SigningImageFormat.fromJson(Map<String, dynamic> json) =>
      _$SigningImageFormatFromJson(json);
}

/// Contains information about a signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SigningJob {
  /// The date and time that the signing job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Indicates whether the signing job is revoked.
  @_s.JsonKey(name: 'isRevoked')
  final bool isRevoked;

  /// The ID of the signing job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The AWS account ID of the job invoker.
  @_s.JsonKey(name: 'jobInvoker')
  final String jobInvoker;

  /// The AWS account ID of the job owner.
  @_s.JsonKey(name: 'jobOwner')
  final String jobOwner;

  /// The name of a signing platform.
  @_s.JsonKey(name: 'platformDisplayName')
  final String platformDisplayName;

  /// The unique identifier for a signing platform.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// The name of the signing profile that created a signing job.
  @_s.JsonKey(name: 'profileName')
  final String profileName;

  /// The version of the signing profile that created a signing job.
  @_s.JsonKey(name: 'profileVersion')
  final String profileVersion;

  /// The time when the signature of a signing job expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'signatureExpiresAt')
  final DateTime signatureExpiresAt;

  /// A <code>SignedObject</code> structure that contains information about a
  /// signing job's signed code image.
  @_s.JsonKey(name: 'signedObject')
  final SignedObject signedObject;

  /// A <code>SigningMaterial</code> object that contains the Amazon Resource Name
  /// (ARN) of the certificate used for the signing job.
  @_s.JsonKey(name: 'signingMaterial')
  final SigningMaterial signingMaterial;

  /// A <code>Source</code> that contains information about a signing job's code
  /// image source.
  @_s.JsonKey(name: 'source')
  final Source source;

  /// The status of the signing job.
  @_s.JsonKey(name: 'status')
  final SigningStatus status;

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
  factory SigningJob.fromJson(Map<String, dynamic> json) =>
      _$SigningJobFromJson(json);
}

/// Revocation information for a signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SigningJobRevocationRecord {
  /// A caller-supplied reason for revocation.
  @_s.JsonKey(name: 'reason')
  final String reason;

  /// The time of revocation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'revokedAt')
  final DateTime revokedAt;

  /// The identity of the revoker.
  @_s.JsonKey(name: 'revokedBy')
  final String revokedBy;

  SigningJobRevocationRecord({
    this.reason,
    this.revokedAt,
    this.revokedBy,
  });
  factory SigningJobRevocationRecord.fromJson(Map<String, dynamic> json) =>
      _$SigningJobRevocationRecordFromJson(json);
}

/// The ACM certificate that is used to sign your code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SigningMaterial {
  /// The Amazon Resource Name (ARN) of the certificates that is used to sign your
  /// code.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  SigningMaterial({
    @_s.required this.certificateArn,
  });
  factory SigningMaterial.fromJson(Map<String, dynamic> json) =>
      _$SigningMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$SigningMaterialToJson(this);
}

/// Contains information about the signing configurations and parameters that
/// are used to perform a code signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SigningPlatform {
  /// The category of a code signing platform.
  @_s.JsonKey(name: 'category')
  final Category category;

  /// The display name of a code signing platform.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The maximum size (in MB) of code that can be signed by a code signing
  /// platform.
  @_s.JsonKey(name: 'maxSizeInMB')
  final int maxSizeInMB;

  /// Any partner entities linked to a code signing platform.
  @_s.JsonKey(name: 'partner')
  final String partner;

  /// The ID of a code signing; platform.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// Indicates whether revocation is supported for the platform.
  @_s.JsonKey(name: 'revocationSupported')
  final bool revocationSupported;

  /// The configuration of a code signing platform. This includes the designated
  /// hash algorithm and encryption algorithm of a signing platform.
  @_s.JsonKey(name: 'signingConfiguration')
  final SigningConfiguration signingConfiguration;
  @_s.JsonKey(name: 'signingImageFormat')
  final SigningImageFormat signingImageFormat;

  /// The types of targets that can be signed by a code signing platform.
  @_s.JsonKey(name: 'target')
  final String target;

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
  factory SigningPlatform.fromJson(Map<String, dynamic> json) =>
      _$SigningPlatformFromJson(json);
}

/// Any overrides that are applied to the signing configuration of a code
/// signing platform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SigningPlatformOverrides {
  /// A signing configuration that overrides the default encryption or hash
  /// algorithm of a signing job.
  @_s.JsonKey(name: 'signingConfiguration')
  final SigningConfigurationOverrides signingConfiguration;

  /// A signed image is a JSON object. When overriding the default signing
  /// platform configuration, a customer can select either of two signing formats,
  /// <code>JSONEmbedded</code> or <code>JSONDetached</code>. (A third format
  /// value, <code>JSON</code>, is reserved for future use.) With
  /// <code>JSONEmbedded</code>, the signing image has the payload embedded in it.
  /// With <code>JSONDetached</code>, the payload is not be embedded in the
  /// signing image.
  @_s.JsonKey(name: 'signingImageFormat')
  final ImageFormat signingImageFormat;

  SigningPlatformOverrides({
    this.signingConfiguration,
    this.signingImageFormat,
  });
  factory SigningPlatformOverrides.fromJson(Map<String, dynamic> json) =>
      _$SigningPlatformOverridesFromJson(json);

  Map<String, dynamic> toJson() => _$SigningPlatformOverridesToJson(this);
}

/// Contains information about the ACM certificates and code signing
/// configuration parameters that can be used by a given code signing user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SigningProfile {
  /// The Amazon Resource Name (ARN) for the signing profile.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the signing platform.
  @_s.JsonKey(name: 'platformDisplayName')
  final String platformDisplayName;

  /// The ID of a platform that is available for use by a signing profile.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// The name of the signing profile.
  @_s.JsonKey(name: 'profileName')
  final String profileName;

  /// The version of a signing profile.
  @_s.JsonKey(name: 'profileVersion')
  final String profileVersion;

  /// The ARN of a signing profile, including the profile version.
  @_s.JsonKey(name: 'profileVersionArn')
  final String profileVersionArn;

  /// The validity period for a signing job created using this signing profile.
  @_s.JsonKey(name: 'signatureValidityPeriod')
  final SignatureValidityPeriod signatureValidityPeriod;

  /// The ACM certificate that is available for use by a signing profile.
  @_s.JsonKey(name: 'signingMaterial')
  final SigningMaterial signingMaterial;

  /// The parameters that are available for use by a code signing user.
  @_s.JsonKey(name: 'signingParameters')
  final Map<String, String> signingParameters;

  /// The status of a code signing profile.
  @_s.JsonKey(name: 'status')
  final SigningProfileStatus status;

  /// A list of tags associated with the signing profile.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory SigningProfile.fromJson(Map<String, dynamic> json) =>
      _$SigningProfileFromJson(json);
}

/// Revocation information for a signing profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SigningProfileRevocationRecord {
  /// The time when revocation becomes effective.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'revocationEffectiveFrom')
  final DateTime revocationEffectiveFrom;

  /// The time when the signing profile was revoked.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'revokedAt')
  final DateTime revokedAt;

  /// The identity of the revoker.
  @_s.JsonKey(name: 'revokedBy')
  final String revokedBy;

  SigningProfileRevocationRecord({
    this.revocationEffectiveFrom,
    this.revokedAt,
    this.revokedBy,
  });
  factory SigningProfileRevocationRecord.fromJson(Map<String, dynamic> json) =>
      _$SigningProfileRevocationRecordFromJson(json);
}

enum SigningProfileStatus {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Canceled')
  canceled,
  @_s.JsonValue('Revoked')
  revoked,
}

extension on SigningProfileStatus {
  String toValue() {
    switch (this) {
      case SigningProfileStatus.active:
        return 'Active';
      case SigningProfileStatus.canceled:
        return 'Canceled';
      case SigningProfileStatus.revoked:
        return 'Revoked';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SigningStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Succeeded')
  succeeded,
}

extension on SigningStatus {
  String toValue() {
    switch (this) {
      case SigningStatus.inProgress:
        return 'InProgress';
      case SigningStatus.failed:
        return 'Failed';
      case SigningStatus.succeeded:
        return 'Succeeded';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An <code>S3Source</code> object that contains information about the S3
/// bucket where you saved your unsigned code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Source {
  /// The <code>S3Source</code> object.
  @_s.JsonKey(name: 's3')
  final S3Source s3;

  Source({
    this.s3,
  });
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSigningJobResponse {
  /// The ID of your signing job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The AWS account ID of the signing job owner.
  @_s.JsonKey(name: 'jobOwner')
  final String jobOwner;

  StartSigningJobResponse({
    this.jobId,
    this.jobOwner,
  });
  factory StartSigningJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSigningJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

enum ValidityType {
  @_s.JsonValue('DAYS')
  days,
  @_s.JsonValue('MONTHS')
  months,
  @_s.JsonValue('YEARS')
  years,
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String type, String message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceLimitExceededException extends _s.GenericAwsException {
  ServiceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceLimitExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
