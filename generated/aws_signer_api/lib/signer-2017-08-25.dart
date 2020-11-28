// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'signer-2017-08-25.g.dart';

/// With code signing for IoT, you can sign code that you create for any IoT
/// device that is supported by Amazon Web Services (AWS). Code signing is
/// available through <a
/// href="http://docs.aws.amazon.com/freertos/latest/userguide/">Amazon
/// FreeRTOS</a> and <a
/// href="http://docs.aws.amazon.com/iot/latest/developerguide/">AWS IoT Device
/// Management</a>, and integrated with <a
/// href="http://docs.aws.amazon.com/acm/latest/userguide/">AWS Certificate
/// Manager (ACM)</a>. In order to sign code, you import a third-party code
/// signing certificate with ACM that is used to sign updates in Amazon FreeRTOS
/// and AWS IoT Device Management. For general information about using code
/// signing, see the <a
/// href="http://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html">Code
/// Signing for IoT Developer Guide</a>.
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

  /// Changes the state of an <code>ACTIVE</code> signing profile to
  /// <code>CANCELED</code>. A canceled profile is still viewable with the
  /// <code>ListSigningProfiles</code> operation, but it cannot perform new
  /// signing jobs, and is deleted two years after cancelation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
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
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/signing-profiles/${Uri.encodeComponent(profileName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a specific code signing job. You specify the job
  /// by using the <code>jobId</code> value that is returned by the
  /// <a>StartSigningJob</a> operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
      requestUri: '/signing-jobs/${Uri.encodeComponent(jobId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSigningJobResponse.fromJson(response);
  }

  /// Returns information on a specific signing platform.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
      requestUri:
          '/signing-platforms/${Uri.encodeComponent(platformId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSigningPlatformResponse.fromJson(response);
  }

  /// Returns information on a specific signing profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [profileName] :
  /// The name of the target signing profile.
  Future<GetSigningProfileResponse> getSigningProfile({
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/signing-profiles/${Uri.encodeComponent(profileName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSigningProfileResponse.fromJson(response);
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
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
  /// Parameter [status] :
  /// A status value with which to filter your results.
  Future<ListSigningJobsResponse> listSigningJobs({
    int maxResults,
    String nextToken,
    String platformId,
    String requestedBy,
    SigningStatus status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (platformId != null) _s.toQueryParam('platformId', platformId),
      if (requestedBy != null) _s.toQueryParam('requestedBy', requestedBy),
      if (status != null) _s.toQueryParam('status', status.toValue()),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-jobs$_query',
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
  /// May throw [ThrottlingException].
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
    var _query = '';
    _query = '?${[
      if (category != null) _s.toQueryParam('category', category),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (partner != null) _s.toQueryParam('partner', partner),
      if (target != null) _s.toQueryParam('target', target),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-platforms$_query',
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
  /// May throw [ThrottlingException].
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
  Future<ListSigningProfilesResponse> listSigningProfiles({
    bool includeCanceled,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    var _query = '';
    _query = '?${[
      if (includeCanceled != null)
        _s.toQueryParam('includeCanceled', includeCanceled),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signing-profiles$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListSigningProfilesResponse.fromJson(response);
  }

  /// Returns a list of the tags associated with a signing profile resource.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [platformId] :
  /// The ID of the signing platform to be created.
  ///
  /// Parameter [profileName] :
  /// The name of the signing profile to be created.
  ///
  /// Parameter [signingMaterial] :
  /// The AWS Certificate Manager certificate that will be used to sign code
  /// with the new signing profile.
  ///
  /// Parameter [overrides] :
  /// A subfield of <code>platform</code>. This specifies any different
  /// configuration options that you want to apply to the chosen platform (such
  /// as a different <code>hash-algorithm</code> or
  /// <code>signing-algorithm</code>).
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
    @_s.required SigningMaterial signingMaterial,
    SigningPlatformOverrides overrides,
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
    ArgumentError.checkNotNull(signingMaterial, 'signingMaterial');
    final $payload = <String, dynamic>{
      'platformId': platformId,
      'signingMaterial': signingMaterial,
      if (overrides != null) 'overrides': overrides,
      if (signingParameters != null) 'signingParameters': signingParameters,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/signing-profiles/${Uri.encodeComponent(profileName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return PutSigningProfileResponse.fromJson(response);
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
  /// Parameter [source] :
  /// The S3 bucket that contains the object to sign or a BLOB that contains
  /// your raw code.
  ///
  /// Parameter [profileName] :
  /// The name of the signing profile.
  Future<StartSigningJobResponse> startSigningJob({
    @_s.required String clientRequestToken,
    @_s.required Destination destination,
    @_s.required Source source,
    String profileName,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    ArgumentError.checkNotNull(destination, 'destination');
    ArgumentError.checkNotNull(source, 'source');
    _s.validateStringLength(
      'profileName',
      profileName,
      2,
      64,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''^[a-zA-Z0-9_]{2,}''',
    );
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken,
      'destination': destination,
      'source': source,
      if (profileName != null) 'profileName': profileName,
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }
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
  @_s.JsonKey(
      name: 'completedAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime completedAt;

  /// Date and time that the signing job was created.
  @_s.JsonKey(
      name: 'createdAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAt;

  /// The ID of the signing job on output.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// A list of any overrides that were applied to the signing operation.
  @_s.JsonKey(name: 'overrides')
  final SigningPlatformOverrides overrides;

  /// The microcontroller platform to which your signed code image will be
  /// distributed.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// The name of the profile that initiated the signing operation.
  @_s.JsonKey(name: 'profileName')
  final String profileName;

  /// The IAM principal that requested the signing job.
  @_s.JsonKey(name: 'requestedBy')
  final String requestedBy;

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
    this.overrides,
    this.platformId,
    this.profileName,
    this.requestedBy,
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

  /// The ID of the platform that is used by the target signing profile.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// The name of the target signing profile.
  @_s.JsonKey(name: 'profileName')
  final String profileName;

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

  /// A list of tags associated with the signing profile.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetSigningProfileResponse({
    this.arn,
    this.overrides,
    this.platformId,
    this.profileName,
    this.signingMaterial,
    this.signingParameters,
    this.status,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSigningProfileResponse {
  /// The Amazon Resource Name (ARN) of the signing profile created.
  @_s.JsonKey(name: 'arn')
  final String arn;

  PutSigningProfileResponse({
    this.arn,
  });
  factory PutSigningProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSigningProfileResponseFromJson(json);
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
  @_s.JsonKey(
      name: 'createdAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAt;

  /// The ID of the signing job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

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
    this.jobId,
    this.signedObject,
    this.signingMaterial,
    this.source,
    this.status,
  });
  factory SigningJob.fromJson(Map<String, dynamic> json) =>
      _$SigningJobFromJson(json);
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

  /// The ID of a platform that is available for use by a signing profile.
  @_s.JsonKey(name: 'platformId')
  final String platformId;

  /// The name of the signing profile.
  @_s.JsonKey(name: 'profileName')
  final String profileName;

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
    this.platformId,
    this.profileName,
    this.signingMaterial,
    this.signingParameters,
    this.status,
    this.tags,
  });
  factory SigningProfile.fromJson(Map<String, dynamic> json) =>
      _$SigningProfileFromJson(json);
}

enum SigningProfileStatus {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Canceled')
  canceled,
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

  StartSigningJobResponse({
    this.jobId,
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
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

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
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
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
