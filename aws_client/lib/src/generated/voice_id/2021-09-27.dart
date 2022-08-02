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

/// Amazon Connect Voice ID provides real-time caller authentication and fraud
/// screening. This guide describes the APIs used for this service.
class VoiceID {
  final _s.JsonProtocol _protocol;
  VoiceID({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'voiceid',
            signingName: 'voiceid',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a domain that contains all Amazon Connect Voice ID data, such as
  /// speakers, fraudsters, customer audio, and voiceprints.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the domain.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The configuration, containing the KMS key identifier, to be used by Voice
  /// ID for the server-side encryption of your data. Refer to <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/encryption-at-rest.html#encryption-at-rest-voiceid">
  /// Amazon Connect Voice ID encryption at rest</a> for more details on how the
  /// KMS key is used.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for creating a new domain. If not provided, Amazon
  /// Web Services SDK populates this field.
  ///
  /// Parameter [description] :
  /// A brief description of this domain.
  ///
  /// Parameter [tags] :
  /// A list of tags you want added to the domain.
  Future<CreateDomainResponse> createDomain({
    required String name,
    required ServerSideEncryptionConfiguration
        serverSideEncryptionConfiguration,
    String? clientToken,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(
        serverSideEncryptionConfiguration, 'serverSideEncryptionConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.CreateDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDomainResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified domain from Voice ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain you want to delete.
  Future<void> deleteDomain({
    required String domainId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DeleteDomain'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
      },
    );
  }

  /// Deletes the specified fraudster from Voice ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the fraudster.
  ///
  /// Parameter [fraudsterId] :
  /// The identifier of the fraudster you want to delete.
  Future<void> deleteFraudster({
    required String domainId,
    required String fraudsterId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(fraudsterId, 'fraudsterId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DeleteFraudster'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'FraudsterId': fraudsterId,
      },
    );
  }

  /// Deletes the specified speaker from Voice ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the speaker.
  ///
  /// Parameter [speakerId] :
  /// The identifier of the speaker you want to delete.
  Future<void> deleteSpeaker({
    required String domainId,
    required String speakerId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(speakerId, 'speakerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DeleteSpeaker'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'SpeakerId': speakerId,
      },
    );
  }

  /// Describes the specified domain.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain you are describing.
  Future<DescribeDomainResponse> describeDomain({
    required String domainId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DescribeDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
      },
    );

    return DescribeDomainResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified fraudster.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the fraudster.
  ///
  /// Parameter [fraudsterId] :
  /// The identifier of the fraudster you are describing.
  Future<DescribeFraudsterResponse> describeFraudster({
    required String domainId,
    required String fraudsterId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(fraudsterId, 'fraudsterId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DescribeFraudster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'FraudsterId': fraudsterId,
      },
    );

    return DescribeFraudsterResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified fraudster registration job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier for the domain containing the fraudster registration job.
  ///
  /// Parameter [jobId] :
  /// The identifier for the fraudster registration job you are describing.
  Future<DescribeFraudsterRegistrationJobResponse>
      describeFraudsterRegistrationJob({
    required String domainId,
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(jobId, 'jobId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DescribeFraudsterRegistrationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'JobId': jobId,
      },
    );

    return DescribeFraudsterRegistrationJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified speaker.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain that contains the speaker.
  ///
  /// Parameter [speakerId] :
  /// The identifier of the speaker you are describing.
  Future<DescribeSpeakerResponse> describeSpeaker({
    required String domainId,
    required String speakerId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(speakerId, 'speakerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DescribeSpeaker'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'SpeakerId': speakerId,
      },
    );

    return DescribeSpeakerResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified speaker enrollment job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the speaker enrollment job.
  ///
  /// Parameter [jobId] :
  /// The identifier of the speaker enrollment job you are describing.
  Future<DescribeSpeakerEnrollmentJobResponse> describeSpeakerEnrollmentJob({
    required String domainId,
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(jobId, 'jobId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.DescribeSpeakerEnrollmentJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'JobId': jobId,
      },
    );

    return DescribeSpeakerEnrollmentJobResponse.fromJson(jsonResponse.body);
  }

  /// Evaluates a specified session based on audio data accumulated during a
  /// streaming Amazon Connect Voice ID call.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain where the session started.
  ///
  /// Parameter [sessionNameOrId] :
  /// The session identifier, or name of the session, that you want to evaluate.
  /// In Voice ID integration, this is the Contact-Id.
  Future<EvaluateSessionResponse> evaluateSession({
    required String domainId,
    required String sessionNameOrId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(sessionNameOrId, 'sessionNameOrId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.EvaluateSession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'SessionNameOrId': sessionNameOrId,
      },
    );

    return EvaluateSessionResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the domains in the Amazon Web Services account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>NextToken</code> to obtain further pages of results. The default is
  /// 100; the maximum allowed page size is also 100.
  ///
  /// Parameter [nextToken] :
  /// If <code>NextToken</code> is returned, there are more results available.
  /// The value of <code>NextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours.
  Future<ListDomainsResponse> listDomains({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.ListDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the fraudster registration jobs in the domain with the given
  /// <code>JobStatus</code>. If <code>JobStatus</code> is not provided, this
  /// lists all fraudster registration jobs in the given domain.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the fraudster registration Jobs.
  ///
  /// Parameter [jobStatus] :
  /// Provides the status of your fraudster registration job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>NextToken</code> to obtain further pages of results. The default is
  /// 100; the maximum allowed page size is also 100.
  ///
  /// Parameter [nextToken] :
  /// If <code>NextToken</code> is returned, there are more results available.
  /// The value of <code>NextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours.
  Future<ListFraudsterRegistrationJobsResponse> listFraudsterRegistrationJobs({
    required String domainId,
    FraudsterRegistrationJobStatus? jobStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.ListFraudsterRegistrationJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFraudsterRegistrationJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the speaker enrollment jobs in the domain with the specified
  /// <code>JobStatus</code>. If <code>JobStatus</code> is not provided, this
  /// lists all jobs with all possible speaker enrollment job statuses.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the speaker enrollment jobs.
  ///
  /// Parameter [jobStatus] :
  /// Provides the status of your speaker enrollment Job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>NextToken</code> to obtain further pages of results. The default is
  /// 100; the maximum allowed page size is also 100.
  ///
  /// Parameter [nextToken] :
  /// If <code>NextToken</code> is returned, there are more results available.
  /// The value of <code>NextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours.
  Future<ListSpeakerEnrollmentJobsResponse> listSpeakerEnrollmentJobs({
    required String domainId,
    SpeakerEnrollmentJobStatus? jobStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.ListSpeakerEnrollmentJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSpeakerEnrollmentJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all speakers in a specified domain.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>NextToken</code> to obtain further pages of results. The default is
  /// 100; the maximum allowed page size is also 100.
  ///
  /// Parameter [nextToken] :
  /// If <code>NextToken</code> is returned, there are more results available.
  /// The value of <code>NextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged. Each pagination token expires
  /// after 24 hours.
  Future<ListSpeakersResponse> listSpeakers({
    required String domainId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.ListSpeakers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSpeakersResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with a specified Voice ID resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Voice ID resource for which you want
  /// to list the tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Opts out a speaker from Voice ID. A speaker can be opted out regardless of
  /// whether or not they already exist in Voice ID. If they don't yet exist, a
  /// new speaker is created in an opted out state. If they already exist, their
  /// existing status is overridden and they are opted out. Enrollment and
  /// evaluation authentication requests are rejected for opted out speakers,
  /// and opted out speakers have no voice embeddings stored in Voice ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the speaker.
  ///
  /// Parameter [speakerId] :
  /// The identifier of the speaker you want opted-out.
  Future<OptOutSpeakerResponse> optOutSpeaker({
    required String domainId,
    required String speakerId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(speakerId, 'speakerId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.OptOutSpeaker'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'SpeakerId': speakerId,
      },
    );

    return OptOutSpeakerResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new batch fraudster registration job using provided details.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions
  /// to access customer's buckets to read the input manifest file and write the
  /// Job output file. Refer to the <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/voiceid-fraudster-watchlist.html">Create
  /// and edit a fraudster watchlist</a> documentation for the permissions
  /// needed in this role.
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain containing the fraudster registration job and
  /// in which the fraudsters are registered.
  ///
  /// Parameter [inputDataConfig] :
  /// The input data config containing an S3 URI for the input manifest file
  /// that contains the list of fraudster registration requests.
  ///
  /// Parameter [outputDataConfig] :
  /// The output data config containing the S3 location where Voice ID writes
  /// the job output file; you must also include a KMS key ID to encrypt the
  /// file.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for starting a new fraudster registration job. If
  /// not provided, Amazon Web Services SDK populates this field.
  ///
  /// Parameter [jobName] :
  /// The name of the new fraudster registration job.
  ///
  /// Parameter [registrationConfig] :
  /// The registration config containing details such as the action to take when
  /// a duplicate fraudster is detected, and the similarity threshold to use for
  /// detecting a duplicate fraudster.
  Future<StartFraudsterRegistrationJobResponse> startFraudsterRegistrationJob({
    required String dataAccessRoleArn,
    required String domainId,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientToken,
    String? jobName,
    RegistrationConfig? registrationConfig,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.StartFraudsterRegistrationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DomainId': domainId,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (registrationConfig != null)
          'RegistrationConfig': registrationConfig,
      },
    );

    return StartFraudsterRegistrationJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts a new batch speaker enrollment job using specified details.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions
  /// to access customer's buckets to read the input manifest file and write the
  /// job output file. Refer to <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/voiceid-batch-enrollment.html">Batch
  /// enrollment using audio data from prior calls</a> documentation for the
  /// permissions needed in this role.
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain that contains the speaker enrollment job and
  /// in which the speakers are enrolled.
  ///
  /// Parameter [inputDataConfig] :
  /// The input data config containing the S3 location for the input manifest
  /// file that contains the list of speaker enrollment requests.
  ///
  /// Parameter [outputDataConfig] :
  /// The output data config containing the S3 location where Voice ID writes
  /// the job output file; you must also include a KMS key ID to encrypt the
  /// file.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for starting a new speaker enrollment Job. If not
  /// provided, Amazon Web Services SDK populates this field.
  ///
  /// Parameter [enrollmentConfig] :
  /// The enrollment config that contains details such as the action to take
  /// when a speaker is already enrolled in Voice ID or when a speaker is
  /// identified as a fraudster.
  ///
  /// Parameter [jobName] :
  /// A name for your speaker enrollment job.
  Future<StartSpeakerEnrollmentJobResponse> startSpeakerEnrollmentJob({
    required String dataAccessRoleArn,
    required String domainId,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig outputDataConfig,
    String? clientToken,
    EnrollmentConfig? enrollmentConfig,
    String? jobName,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.StartSpeakerEnrollmentJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DomainId': domainId,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (enrollmentConfig != null) 'EnrollmentConfig': enrollmentConfig,
        if (jobName != null) 'JobName': jobName,
      },
    );

    return StartSpeakerEnrollmentJobResponse.fromJson(jsonResponse.body);
  }

  /// Tags a Voice ID resource with the provided list of tags.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Voice ID resource you want to tag.
  ///
  /// Parameter [tags] :
  /// The list of tags to assign to the specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Removes specified tags from a specified Amazon Connect Voice ID resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Voice ID resource you want to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys you want to remove from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the specified domain. This API has clobber behavior, and clears
  /// and replaces all attributes. If an optional field, such as 'Description'
  /// is not provided, it is removed from the domain.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainId] :
  /// The identifier of the domain to be updated.
  ///
  /// Parameter [name] :
  /// The name of the domain.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The configuration, containing the KMS key identifier, to be used by Voice
  /// ID for the server-side encryption of your data. Note that all the existing
  /// data in the domain are still encrypted using the existing key, only the
  /// data added to domain after updating the key is encrypted using the new
  /// key.
  ///
  /// Parameter [description] :
  /// A brief description about this domain.
  Future<UpdateDomainResponse> updateDomain({
    required String domainId,
    required String name,
    required ServerSideEncryptionConfiguration
        serverSideEncryptionConfiguration,
    String? description,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(
        serverSideEncryptionConfiguration, 'serverSideEncryptionConfiguration');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'VoiceID.UpdateDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'Name': name,
        'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
        if (description != null) 'Description': description,
      },
    );

    return UpdateDomainResponse.fromJson(jsonResponse.body);
  }
}

/// The configuration used to authenticate a speaker during a session.
class AuthenticationConfiguration {
  /// The minimum threshold needed to successfully authenticate a speaker.
  final int acceptanceThreshold;

  AuthenticationConfiguration({
    required this.acceptanceThreshold,
  });

  factory AuthenticationConfiguration.fromJson(Map<String, dynamic> json) {
    return AuthenticationConfiguration(
      acceptanceThreshold: json['AcceptanceThreshold'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceThreshold = this.acceptanceThreshold;
    return {
      'AcceptanceThreshold': acceptanceThreshold,
    };
  }
}

enum AuthenticationDecision {
  accept,
  reject,
  notEnoughSpeech,
  speakerNotEnrolled,
  speakerOptedOut,
  speakerIdNotProvided,
  speakerExpired,
}

extension on AuthenticationDecision {
  String toValue() {
    switch (this) {
      case AuthenticationDecision.accept:
        return 'ACCEPT';
      case AuthenticationDecision.reject:
        return 'REJECT';
      case AuthenticationDecision.notEnoughSpeech:
        return 'NOT_ENOUGH_SPEECH';
      case AuthenticationDecision.speakerNotEnrolled:
        return 'SPEAKER_NOT_ENROLLED';
      case AuthenticationDecision.speakerOptedOut:
        return 'SPEAKER_OPTED_OUT';
      case AuthenticationDecision.speakerIdNotProvided:
        return 'SPEAKER_ID_NOT_PROVIDED';
      case AuthenticationDecision.speakerExpired:
        return 'SPEAKER_EXPIRED';
    }
  }
}

extension on String {
  AuthenticationDecision toAuthenticationDecision() {
    switch (this) {
      case 'ACCEPT':
        return AuthenticationDecision.accept;
      case 'REJECT':
        return AuthenticationDecision.reject;
      case 'NOT_ENOUGH_SPEECH':
        return AuthenticationDecision.notEnoughSpeech;
      case 'SPEAKER_NOT_ENROLLED':
        return AuthenticationDecision.speakerNotEnrolled;
      case 'SPEAKER_OPTED_OUT':
        return AuthenticationDecision.speakerOptedOut;
      case 'SPEAKER_ID_NOT_PROVIDED':
        return AuthenticationDecision.speakerIdNotProvided;
      case 'SPEAKER_EXPIRED':
        return AuthenticationDecision.speakerExpired;
    }
    throw Exception('$this is not known in enum AuthenticationDecision');
  }
}

/// The authentication result produced by Voice ID, processed against the
/// current session state and streamed audio of the speaker.
class AuthenticationResult {
  /// A timestamp indicating when audio aggregation ended for this authentication
  /// result.
  final DateTime? audioAggregationEndedAt;

  /// A timestamp indicating when audio aggregation started for this
  /// authentication result.
  final DateTime? audioAggregationStartedAt;

  /// The unique identifier for this authentication result. Because there can be
  /// multiple authentications for a given session, this field helps to identify
  /// if the returned result is from a previous streaming activity or a new
  /// result. Note that in absence of any new streaming activity,
  /// <code>AcceptanceThreshold</code> changes, or <code>SpeakerId</code> changes,
  /// Voice ID always returns cached Authentication Result for this API.
  final String? authenticationResultId;

  /// The <code>AuthenticationConfiguration</code> used to generate this
  /// authentication result.
  final AuthenticationConfiguration? configuration;

  /// The client-provided identifier for the speaker whose authentication result
  /// is produced. Only present if a <code>SpeakerId</code> is provided for the
  /// session.
  final String? customerSpeakerId;

  /// The authentication decision produced by Voice ID, processed against the
  /// current session state and streamed audio of the speaker.
  final AuthenticationDecision? decision;

  /// The service-generated identifier for the speaker whose authentication result
  /// is produced.
  final String? generatedSpeakerId;

  /// The authentication score for the speaker whose authentication result is
  /// produced. This value is only present if the authentication decision is
  /// either <code>ACCEPT</code> or <code>REJECT</code>.
  final int? score;

  AuthenticationResult({
    this.audioAggregationEndedAt,
    this.audioAggregationStartedAt,
    this.authenticationResultId,
    this.configuration,
    this.customerSpeakerId,
    this.decision,
    this.generatedSpeakerId,
    this.score,
  });

  factory AuthenticationResult.fromJson(Map<String, dynamic> json) {
    return AuthenticationResult(
      audioAggregationEndedAt:
          timeStampFromJson(json['AudioAggregationEndedAt']),
      audioAggregationStartedAt:
          timeStampFromJson(json['AudioAggregationStartedAt']),
      authenticationResultId: json['AuthenticationResultId'] as String?,
      configuration: json['Configuration'] != null
          ? AuthenticationConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      customerSpeakerId: json['CustomerSpeakerId'] as String?,
      decision: (json['Decision'] as String?)?.toAuthenticationDecision(),
      generatedSpeakerId: json['GeneratedSpeakerId'] as String?,
      score: json['Score'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioAggregationEndedAt = this.audioAggregationEndedAt;
    final audioAggregationStartedAt = this.audioAggregationStartedAt;
    final authenticationResultId = this.authenticationResultId;
    final configuration = this.configuration;
    final customerSpeakerId = this.customerSpeakerId;
    final decision = this.decision;
    final generatedSpeakerId = this.generatedSpeakerId;
    final score = this.score;
    return {
      if (audioAggregationEndedAt != null)
        'AudioAggregationEndedAt': unixTimestampToJson(audioAggregationEndedAt),
      if (audioAggregationStartedAt != null)
        'AudioAggregationStartedAt':
            unixTimestampToJson(audioAggregationStartedAt),
      if (authenticationResultId != null)
        'AuthenticationResultId': authenticationResultId,
      if (configuration != null) 'Configuration': configuration,
      if (customerSpeakerId != null) 'CustomerSpeakerId': customerSpeakerId,
      if (decision != null) 'Decision': decision.toValue(),
      if (generatedSpeakerId != null) 'GeneratedSpeakerId': generatedSpeakerId,
      if (score != null) 'Score': score,
    };
  }
}

class CreateDomainResponse {
  /// Information about the newly created domain.
  final Domain? domain;

  CreateDomainResponse({
    this.domain,
  });

  factory CreateDomainResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainResponse(
      domain: json['Domain'] != null
          ? Domain.fromJson(json['Domain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'Domain': domain,
    };
  }
}

class DescribeDomainResponse {
  /// Information about the specified domain.
  final Domain? domain;

  DescribeDomainResponse({
    this.domain,
  });

  factory DescribeDomainResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDomainResponse(
      domain: json['Domain'] != null
          ? Domain.fromJson(json['Domain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'Domain': domain,
    };
  }
}

class DescribeFraudsterRegistrationJobResponse {
  /// Contains details about the specified fraudster registration job.
  final FraudsterRegistrationJob? job;

  DescribeFraudsterRegistrationJobResponse({
    this.job,
  });

  factory DescribeFraudsterRegistrationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFraudsterRegistrationJobResponse(
      job: json['Job'] != null
          ? FraudsterRegistrationJob.fromJson(
              json['Job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'Job': job,
    };
  }
}

class DescribeFraudsterResponse {
  /// Information about the specified fraudster.
  final Fraudster? fraudster;

  DescribeFraudsterResponse({
    this.fraudster,
  });

  factory DescribeFraudsterResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFraudsterResponse(
      fraudster: json['Fraudster'] != null
          ? Fraudster.fromJson(json['Fraudster'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fraudster = this.fraudster;
    return {
      if (fraudster != null) 'Fraudster': fraudster,
    };
  }
}

class DescribeSpeakerEnrollmentJobResponse {
  /// Contains details about the specified speaker enrollment job.
  final SpeakerEnrollmentJob? job;

  DescribeSpeakerEnrollmentJobResponse({
    this.job,
  });

  factory DescribeSpeakerEnrollmentJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSpeakerEnrollmentJobResponse(
      job: json['Job'] != null
          ? SpeakerEnrollmentJob.fromJson(json['Job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'Job': job,
    };
  }
}

class DescribeSpeakerResponse {
  /// Information about the specified speaker.
  final Speaker? speaker;

  DescribeSpeakerResponse({
    this.speaker,
  });

  factory DescribeSpeakerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSpeakerResponse(
      speaker: json['Speaker'] != null
          ? Speaker.fromJson(json['Speaker'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final speaker = this.speaker;
    return {
      if (speaker != null) 'Speaker': speaker,
    };
  }
}

/// Contains all the information about a domain.
class Domain {
  /// The Amazon Resource Name (ARN) for the domain.
  final String? arn;

  /// The timestamp at which the domain is created.
  final DateTime? createdAt;

  /// The client-provided description of the domain.
  final String? description;

  /// The service-generated identifier for the domain.
  final String? domainId;

  /// The current status of the domain.
  final DomainStatus? domainStatus;

  /// The client-provided name for the domain.
  final String? name;

  /// The server-side encryption configuration containing the KMS key identifier
  /// you want Voice ID to use to encrypt your data.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// Details about the most recent server-side encryption configuration update.
  /// When the server-side encryption configuration is changed, dependency on the
  /// old KMS key is removed through an asynchronous process. When this update is
  /// complete, the domain's data can only be accessed using the new KMS key.
  final ServerSideEncryptionUpdateDetails? serverSideEncryptionUpdateDetails;

  /// The timestamp showing the domain's last update.
  final DateTime? updatedAt;

  Domain({
    this.arn,
    this.createdAt,
    this.description,
    this.domainId,
    this.domainStatus,
    this.name,
    this.serverSideEncryptionConfiguration,
    this.serverSideEncryptionUpdateDetails,
    this.updatedAt,
  });

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      domainId: json['DomainId'] as String?,
      domainStatus: (json['DomainStatus'] as String?)?.toDomainStatus(),
      name: json['Name'] as String?,
      serverSideEncryptionConfiguration:
          json['ServerSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['ServerSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      serverSideEncryptionUpdateDetails:
          json['ServerSideEncryptionUpdateDetails'] != null
              ? ServerSideEncryptionUpdateDetails.fromJson(
                  json['ServerSideEncryptionUpdateDetails']
                      as Map<String, dynamic>)
              : null,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final domainId = this.domainId;
    final domainStatus = this.domainStatus;
    final name = this.name;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final serverSideEncryptionUpdateDetails =
        this.serverSideEncryptionUpdateDetails;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (domainId != null) 'DomainId': domainId,
      if (domainStatus != null) 'DomainStatus': domainStatus.toValue(),
      if (name != null) 'Name': name,
      if (serverSideEncryptionConfiguration != null)
        'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (serverSideEncryptionUpdateDetails != null)
        'ServerSideEncryptionUpdateDetails': serverSideEncryptionUpdateDetails,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DomainStatus {
  active,
  pending,
  suspended,
}

extension on DomainStatus {
  String toValue() {
    switch (this) {
      case DomainStatus.active:
        return 'ACTIVE';
      case DomainStatus.pending:
        return 'PENDING';
      case DomainStatus.suspended:
        return 'SUSPENDED';
    }
  }
}

extension on String {
  DomainStatus toDomainStatus() {
    switch (this) {
      case 'ACTIVE':
        return DomainStatus.active;
      case 'PENDING':
        return DomainStatus.pending;
      case 'SUSPENDED':
        return DomainStatus.suspended;
    }
    throw Exception('$this is not known in enum DomainStatus');
  }
}

/// Contains a summary of information about a domain.
class DomainSummary {
  /// The Amazon Resource Name (ARN) for the domain.
  final String? arn;

  /// The timestamp showing when the domain is created.
  final DateTime? createdAt;

  /// The client-provided description of the domain.
  final String? description;

  /// The service-generated identifier for the domain.
  final String? domainId;

  /// The current status of the domain.
  final DomainStatus? domainStatus;

  /// The client-provided name for the domain.
  final String? name;

  /// The server-side encryption configuration containing the KMS key identifier
  /// you want Voice ID to use to encrypt your data.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// Details about the most recent server-side encryption configuration update.
  /// When the server-side encryption configuration is changed, dependency on the
  /// old KMS key is removed through an asynchronous process. When this update is
  /// complete, the domain’s data can only be accessed using the new KMS key.
  final ServerSideEncryptionUpdateDetails? serverSideEncryptionUpdateDetails;

  /// The timestamp showing the domain's last update.
  final DateTime? updatedAt;

  DomainSummary({
    this.arn,
    this.createdAt,
    this.description,
    this.domainId,
    this.domainStatus,
    this.name,
    this.serverSideEncryptionConfiguration,
    this.serverSideEncryptionUpdateDetails,
    this.updatedAt,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      arn: json['Arn'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      domainId: json['DomainId'] as String?,
      domainStatus: (json['DomainStatus'] as String?)?.toDomainStatus(),
      name: json['Name'] as String?,
      serverSideEncryptionConfiguration:
          json['ServerSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['ServerSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      serverSideEncryptionUpdateDetails:
          json['ServerSideEncryptionUpdateDetails'] != null
              ? ServerSideEncryptionUpdateDetails.fromJson(
                  json['ServerSideEncryptionUpdateDetails']
                      as Map<String, dynamic>)
              : null,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final domainId = this.domainId;
    final domainStatus = this.domainStatus;
    final name = this.name;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final serverSideEncryptionUpdateDetails =
        this.serverSideEncryptionUpdateDetails;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'Arn': arn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (domainId != null) 'DomainId': domainId,
      if (domainStatus != null) 'DomainStatus': domainStatus.toValue(),
      if (name != null) 'Name': name,
      if (serverSideEncryptionConfiguration != null)
        'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (serverSideEncryptionUpdateDetails != null)
        'ServerSideEncryptionUpdateDetails': serverSideEncryptionUpdateDetails,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DuplicateRegistrationAction {
  skip,
  registerAsNew,
}

extension on DuplicateRegistrationAction {
  String toValue() {
    switch (this) {
      case DuplicateRegistrationAction.skip:
        return 'SKIP';
      case DuplicateRegistrationAction.registerAsNew:
        return 'REGISTER_AS_NEW';
    }
  }
}

extension on String {
  DuplicateRegistrationAction toDuplicateRegistrationAction() {
    switch (this) {
      case 'SKIP':
        return DuplicateRegistrationAction.skip;
      case 'REGISTER_AS_NEW':
        return DuplicateRegistrationAction.registerAsNew;
    }
    throw Exception('$this is not known in enum DuplicateRegistrationAction');
  }
}

/// Contains configurations defining enrollment behavior for the batch job.
class EnrollmentConfig {
  /// The action to take when the specified speaker is already enrolled in the
  /// specified domain. The default value is <code>SKIP</code>, which skips the
  /// enrollment for the existing speaker. Setting the value to
  /// <code>OVERWRITE</code> replaces the existing voice prints and enrollment
  /// audio stored for that speaker with new data generated from the latest audio.
  final ExistingEnrollmentAction? existingEnrollmentAction;

  /// The fraud detection configuration to use for the speaker enrollment job.
  final EnrollmentJobFraudDetectionConfig? fraudDetectionConfig;

  EnrollmentConfig({
    this.existingEnrollmentAction,
    this.fraudDetectionConfig,
  });

  factory EnrollmentConfig.fromJson(Map<String, dynamic> json) {
    return EnrollmentConfig(
      existingEnrollmentAction: (json['ExistingEnrollmentAction'] as String?)
          ?.toExistingEnrollmentAction(),
      fraudDetectionConfig: json['FraudDetectionConfig'] != null
          ? EnrollmentJobFraudDetectionConfig.fromJson(
              json['FraudDetectionConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final existingEnrollmentAction = this.existingEnrollmentAction;
    final fraudDetectionConfig = this.fraudDetectionConfig;
    return {
      if (existingEnrollmentAction != null)
        'ExistingEnrollmentAction': existingEnrollmentAction.toValue(),
      if (fraudDetectionConfig != null)
        'FraudDetectionConfig': fraudDetectionConfig,
    };
  }
}

/// The configuration defining the action to take when a speaker is flagged by
/// the fraud detection system during a batch speaker enrollment job, and the
/// risk threshold to use for identification.
class EnrollmentJobFraudDetectionConfig {
  /// The action to take when the given speaker is flagged by the fraud detection
  /// system. The default value is <code>FAIL</code>, which fails the speaker
  /// enrollment. Changing this value to <code>IGNORE</code> results in the
  /// speaker being enrolled even if they are flagged by the fraud detection
  /// system.
  final FraudDetectionAction? fraudDetectionAction;

  /// Threshold value for determining whether the speaker is a high risk to be
  /// fraudulent. If the detected risk score calculated by Voice ID is greater
  /// than or equal to the threshold, the speaker is considered a fraudster.
  final int? riskThreshold;

  EnrollmentJobFraudDetectionConfig({
    this.fraudDetectionAction,
    this.riskThreshold,
  });

  factory EnrollmentJobFraudDetectionConfig.fromJson(
      Map<String, dynamic> json) {
    return EnrollmentJobFraudDetectionConfig(
      fraudDetectionAction:
          (json['FraudDetectionAction'] as String?)?.toFraudDetectionAction(),
      riskThreshold: json['RiskThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final fraudDetectionAction = this.fraudDetectionAction;
    final riskThreshold = this.riskThreshold;
    return {
      if (fraudDetectionAction != null)
        'FraudDetectionAction': fraudDetectionAction.toValue(),
      if (riskThreshold != null) 'RiskThreshold': riskThreshold,
    };
  }
}

class EvaluateSessionResponse {
  /// Details resulting from the authentication process, such as authentication
  /// decision and authentication score.
  final AuthenticationResult? authenticationResult;

  /// The identifier of the domain containing the session.
  final String? domainId;

  /// Details resulting from the fraud detection process, such as fraud detection
  /// decision and risk score.
  final FraudDetectionResult? fraudDetectionResult;

  /// The service-generated identifier of the session.
  final String? sessionId;

  /// The client-provided name of the session.
  final String? sessionName;

  /// The current status of audio streaming for this session. This field is useful
  /// to infer next steps when the Authentication or Fraud Detection results are
  /// empty or the decision is <code>NOT_ENOUGH_SPEECH</code>. In this situation,
  /// if the <code>StreamingStatus</code> is
  /// <code>ONGOING/PENDING_CONFIGURATION</code>, it can mean that the client
  /// should call the API again later, after Voice ID has enough audio to produce
  /// a result. If the decision remains <code>NOT_ENOUGH_SPEECH</code> even after
  /// <code>StreamingStatus</code> is <code>ENDED</code>, it means that the
  /// previously streamed session did not have enough speech to perform
  /// evaluation, and a new streaming session is needed to try again.
  final StreamingStatus? streamingStatus;

  EvaluateSessionResponse({
    this.authenticationResult,
    this.domainId,
    this.fraudDetectionResult,
    this.sessionId,
    this.sessionName,
    this.streamingStatus,
  });

  factory EvaluateSessionResponse.fromJson(Map<String, dynamic> json) {
    return EvaluateSessionResponse(
      authenticationResult: json['AuthenticationResult'] != null
          ? AuthenticationResult.fromJson(
              json['AuthenticationResult'] as Map<String, dynamic>)
          : null,
      domainId: json['DomainId'] as String?,
      fraudDetectionResult: json['FraudDetectionResult'] != null
          ? FraudDetectionResult.fromJson(
              json['FraudDetectionResult'] as Map<String, dynamic>)
          : null,
      sessionId: json['SessionId'] as String?,
      sessionName: json['SessionName'] as String?,
      streamingStatus:
          (json['StreamingStatus'] as String?)?.toStreamingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationResult = this.authenticationResult;
    final domainId = this.domainId;
    final fraudDetectionResult = this.fraudDetectionResult;
    final sessionId = this.sessionId;
    final sessionName = this.sessionName;
    final streamingStatus = this.streamingStatus;
    return {
      if (authenticationResult != null)
        'AuthenticationResult': authenticationResult,
      if (domainId != null) 'DomainId': domainId,
      if (fraudDetectionResult != null)
        'FraudDetectionResult': fraudDetectionResult,
      if (sessionId != null) 'SessionId': sessionId,
      if (sessionName != null) 'SessionName': sessionName,
      if (streamingStatus != null) 'StreamingStatus': streamingStatus.toValue(),
    };
  }
}

enum ExistingEnrollmentAction {
  skip,
  overwrite,
}

extension on ExistingEnrollmentAction {
  String toValue() {
    switch (this) {
      case ExistingEnrollmentAction.skip:
        return 'SKIP';
      case ExistingEnrollmentAction.overwrite:
        return 'OVERWRITE';
    }
  }
}

extension on String {
  ExistingEnrollmentAction toExistingEnrollmentAction() {
    switch (this) {
      case 'SKIP':
        return ExistingEnrollmentAction.skip;
      case 'OVERWRITE':
        return ExistingEnrollmentAction.overwrite;
    }
    throw Exception('$this is not known in enum ExistingEnrollmentAction');
  }
}

/// Contains error details for a failed batch job.
class FailureDetails {
  /// A description of the error that caused the batch job failure.
  final String? message;

  /// An HTTP status code representing the nature of the error.
  final int? statusCode;

  FailureDetails({
    this.message,
    this.statusCode,
  });

  factory FailureDetails.fromJson(Map<String, dynamic> json) {
    return FailureDetails(
      message: json['Message'] as String?,
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final statusCode = this.statusCode;
    return {
      if (message != null) 'Message': message,
      if (statusCode != null) 'StatusCode': statusCode,
    };
  }
}

enum FraudDetectionAction {
  ignore,
  fail,
}

extension on FraudDetectionAction {
  String toValue() {
    switch (this) {
      case FraudDetectionAction.ignore:
        return 'IGNORE';
      case FraudDetectionAction.fail:
        return 'FAIL';
    }
  }
}

extension on String {
  FraudDetectionAction toFraudDetectionAction() {
    switch (this) {
      case 'IGNORE':
        return FraudDetectionAction.ignore;
      case 'FAIL':
        return FraudDetectionAction.fail;
    }
    throw Exception('$this is not known in enum FraudDetectionAction');
  }
}

/// The configuration used for performing fraud detection over a speaker during
/// a session.
class FraudDetectionConfiguration {
  /// Threshold value for determining whether the speaker is a fraudster. If the
  /// detected risk score calculated by Voice ID is higher than the threshold, the
  /// speaker is considered a fraudster.
  final int riskThreshold;

  FraudDetectionConfiguration({
    required this.riskThreshold,
  });

  factory FraudDetectionConfiguration.fromJson(Map<String, dynamic> json) {
    return FraudDetectionConfiguration(
      riskThreshold: json['RiskThreshold'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final riskThreshold = this.riskThreshold;
    return {
      'RiskThreshold': riskThreshold,
    };
  }
}

enum FraudDetectionDecision {
  highRisk,
  lowRisk,
  notEnoughSpeech,
}

extension on FraudDetectionDecision {
  String toValue() {
    switch (this) {
      case FraudDetectionDecision.highRisk:
        return 'HIGH_RISK';
      case FraudDetectionDecision.lowRisk:
        return 'LOW_RISK';
      case FraudDetectionDecision.notEnoughSpeech:
        return 'NOT_ENOUGH_SPEECH';
    }
  }
}

extension on String {
  FraudDetectionDecision toFraudDetectionDecision() {
    switch (this) {
      case 'HIGH_RISK':
        return FraudDetectionDecision.highRisk;
      case 'LOW_RISK':
        return FraudDetectionDecision.lowRisk;
      case 'NOT_ENOUGH_SPEECH':
        return FraudDetectionDecision.notEnoughSpeech;
    }
    throw Exception('$this is not known in enum FraudDetectionDecision');
  }
}

enum FraudDetectionReason {
  knownFraudster,
}

extension on FraudDetectionReason {
  String toValue() {
    switch (this) {
      case FraudDetectionReason.knownFraudster:
        return 'KNOWN_FRAUDSTER';
    }
  }
}

extension on String {
  FraudDetectionReason toFraudDetectionReason() {
    switch (this) {
      case 'KNOWN_FRAUDSTER':
        return FraudDetectionReason.knownFraudster;
    }
    throw Exception('$this is not known in enum FraudDetectionReason');
  }
}

/// The fraud detection result produced by Voice ID, processed against the
/// current session state and streamed audio of the speaker.
class FraudDetectionResult {
  /// A timestamp indicating when audio aggregation ended for this fraud detection
  /// result.
  final DateTime? audioAggregationEndedAt;

  /// A timestamp indicating when audio aggregation started for this fraud
  /// detection result.
  final DateTime? audioAggregationStartedAt;

  /// The <code>FraudDetectionConfiguration</code> used to generate this fraud
  /// detection result.
  final FraudDetectionConfiguration? configuration;

  /// The fraud detection decision produced by Voice ID, processed against the
  /// current session state and streamed audio of the speaker.
  final FraudDetectionDecision? decision;

  /// The unique identifier for this fraud detection result. Given there can be
  /// multiple fraud detections for a given session, this field helps in
  /// identifying if the returned result is from previous streaming activity or a
  /// new result. Note that in the absence of any new streaming activity or risk
  /// threshold changes, Voice ID always returns cached Fraud Detection result for
  /// this API.
  final String? fraudDetectionResultId;

  /// The reason speaker was flagged by the fraud detection system. This is only
  /// be populated if fraud detection Decision is <code>HIGH_RISK</code>, and only
  /// has one possible value: <code>KNOWN_FRAUDSTER</code>.
  final List<FraudDetectionReason>? reasons;

  /// Details about each risk analyzed for this speaker.
  final FraudRiskDetails? riskDetails;

  FraudDetectionResult({
    this.audioAggregationEndedAt,
    this.audioAggregationStartedAt,
    this.configuration,
    this.decision,
    this.fraudDetectionResultId,
    this.reasons,
    this.riskDetails,
  });

  factory FraudDetectionResult.fromJson(Map<String, dynamic> json) {
    return FraudDetectionResult(
      audioAggregationEndedAt:
          timeStampFromJson(json['AudioAggregationEndedAt']),
      audioAggregationStartedAt:
          timeStampFromJson(json['AudioAggregationStartedAt']),
      configuration: json['Configuration'] != null
          ? FraudDetectionConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      decision: (json['Decision'] as String?)?.toFraudDetectionDecision(),
      fraudDetectionResultId: json['FraudDetectionResultId'] as String?,
      reasons: (json['Reasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toFraudDetectionReason())
          .toList(),
      riskDetails: json['RiskDetails'] != null
          ? FraudRiskDetails.fromJson(
              json['RiskDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioAggregationEndedAt = this.audioAggregationEndedAt;
    final audioAggregationStartedAt = this.audioAggregationStartedAt;
    final configuration = this.configuration;
    final decision = this.decision;
    final fraudDetectionResultId = this.fraudDetectionResultId;
    final reasons = this.reasons;
    final riskDetails = this.riskDetails;
    return {
      if (audioAggregationEndedAt != null)
        'AudioAggregationEndedAt': unixTimestampToJson(audioAggregationEndedAt),
      if (audioAggregationStartedAt != null)
        'AudioAggregationStartedAt':
            unixTimestampToJson(audioAggregationStartedAt),
      if (configuration != null) 'Configuration': configuration,
      if (decision != null) 'Decision': decision.toValue(),
      if (fraudDetectionResultId != null)
        'FraudDetectionResultId': fraudDetectionResultId,
      if (reasons != null) 'Reasons': reasons.map((e) => e.toValue()).toList(),
      if (riskDetails != null) 'RiskDetails': riskDetails,
    };
  }
}

/// Details regarding various fraud risk analyses performed against the current
/// session state and streamed audio of the speaker.
class FraudRiskDetails {
  /// The details resulting from 'Known Fraudster Risk' analysis of the speaker.
  final KnownFraudsterRisk knownFraudsterRisk;

  FraudRiskDetails({
    required this.knownFraudsterRisk,
  });

  factory FraudRiskDetails.fromJson(Map<String, dynamic> json) {
    return FraudRiskDetails(
      knownFraudsterRisk: KnownFraudsterRisk.fromJson(
          json['KnownFraudsterRisk'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final knownFraudsterRisk = this.knownFraudsterRisk;
    return {
      'KnownFraudsterRisk': knownFraudsterRisk,
    };
  }
}

/// Contains all the information about a fraudster.
class Fraudster {
  /// The timestamp when Voice ID identified the fraudster.
  final DateTime? createdAt;

  /// The identifier for the domain containing the fraudster.
  final String? domainId;

  /// The service-generated identifier for the fraudster.
  final String? generatedFraudsterId;

  Fraudster({
    this.createdAt,
    this.domainId,
    this.generatedFraudsterId,
  });

  factory Fraudster.fromJson(Map<String, dynamic> json) {
    return Fraudster(
      createdAt: timeStampFromJson(json['CreatedAt']),
      domainId: json['DomainId'] as String?,
      generatedFraudsterId: json['GeneratedFraudsterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final generatedFraudsterId = this.generatedFraudsterId;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (domainId != null) 'DomainId': domainId,
      if (generatedFraudsterId != null)
        'GeneratedFraudsterId': generatedFraudsterId,
    };
  }
}

/// Contains all the information about a fraudster registration job.
class FraudsterRegistrationJob {
  /// A timestamp showing the creation time of the fraudster registration job.
  final DateTime? createdAt;

  /// The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to
  /// access customer's buckets to read the input manifest file and write the job
  /// output file.
  final String? dataAccessRoleArn;

  /// The identifier of the domain containing the fraudster registration job.
  final String? domainId;

  /// A timestamp showing when the fraudster registration job ended.
  final DateTime? endedAt;

  /// Contains details that are populated when an entire batch job fails. In cases
  /// of individual registration job failures, the batch job as a whole doesn't
  /// fail; it is completed with a <code>JobStatus</code> of
  /// <code>COMPLETED_WITH_ERRORS</code>. You can use the job output file to
  /// identify the individual registration requests that failed.
  final FailureDetails? failureDetails;

  /// The input data config containing an S3 URI for the input manifest file that
  /// contains the list of fraudster registration job requests.
  final InputDataConfig? inputDataConfig;

  /// The service-generated identifier for the fraudster registration job.
  final String? jobId;

  /// The client-provided name for the fraudster registration job.
  final String? jobName;

  /// Shows the completed percentage of registration requests listed in the input
  /// file.
  final JobProgress? jobProgress;

  /// The current status of the fraudster registration job.
  final FraudsterRegistrationJobStatus? jobStatus;

  /// The output data config containing the S3 location where you want Voice ID to
  /// write your job output file; you must also include a KMS key iD in order to
  /// encrypt the file.
  final OutputDataConfig? outputDataConfig;

  /// The registration config containing details such as the action to take when a
  /// duplicate fraudster is detected, and the similarity threshold to use for
  /// detecting a duplicate fraudster.
  final RegistrationConfig? registrationConfig;

  FraudsterRegistrationJob({
    this.createdAt,
    this.dataAccessRoleArn,
    this.domainId,
    this.endedAt,
    this.failureDetails,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobProgress,
    this.jobStatus,
    this.outputDataConfig,
    this.registrationConfig,
  });

  factory FraudsterRegistrationJob.fromJson(Map<String, dynamic> json) {
    return FraudsterRegistrationJob(
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      domainId: json['DomainId'] as String?,
      endedAt: timeStampFromJson(json['EndedAt']),
      failureDetails: json['FailureDetails'] != null
          ? FailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobProgress: json['JobProgress'] != null
          ? JobProgress.fromJson(json['JobProgress'] as Map<String, dynamic>)
          : null,
      jobStatus:
          (json['JobStatus'] as String?)?.toFraudsterRegistrationJobStatus(),
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      registrationConfig: json['RegistrationConfig'] != null
          ? RegistrationConfig.fromJson(
              json['RegistrationConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final domainId = this.domainId;
    final endedAt = this.endedAt;
    final failureDetails = this.failureDetails;
    final inputDataConfig = this.inputDataConfig;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobProgress = this.jobProgress;
    final jobStatus = this.jobStatus;
    final outputDataConfig = this.outputDataConfig;
    final registrationConfig = this.registrationConfig;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (domainId != null) 'DomainId': domainId,
      if (endedAt != null) 'EndedAt': unixTimestampToJson(endedAt),
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobProgress != null) 'JobProgress': jobProgress,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (registrationConfig != null) 'RegistrationConfig': registrationConfig,
    };
  }
}

enum FraudsterRegistrationJobStatus {
  submitted,
  inProgress,
  completed,
  completedWithErrors,
  failed,
}

extension on FraudsterRegistrationJobStatus {
  String toValue() {
    switch (this) {
      case FraudsterRegistrationJobStatus.submitted:
        return 'SUBMITTED';
      case FraudsterRegistrationJobStatus.inProgress:
        return 'IN_PROGRESS';
      case FraudsterRegistrationJobStatus.completed:
        return 'COMPLETED';
      case FraudsterRegistrationJobStatus.completedWithErrors:
        return 'COMPLETED_WITH_ERRORS';
      case FraudsterRegistrationJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  FraudsterRegistrationJobStatus toFraudsterRegistrationJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return FraudsterRegistrationJobStatus.submitted;
      case 'IN_PROGRESS':
        return FraudsterRegistrationJobStatus.inProgress;
      case 'COMPLETED':
        return FraudsterRegistrationJobStatus.completed;
      case 'COMPLETED_WITH_ERRORS':
        return FraudsterRegistrationJobStatus.completedWithErrors;
      case 'FAILED':
        return FraudsterRegistrationJobStatus.failed;
    }
    throw Exception(
        '$this is not known in enum FraudsterRegistrationJobStatus');
  }
}

/// Contains a summary of information about a fraudster registration job.
class FraudsterRegistrationJobSummary {
  /// A timestamp showing when the fraudster registration job is created.
  final DateTime? createdAt;

  /// The identifier of the domain containing the fraudster registration job.
  final String? domainId;

  /// A timestamp showing when the fraudster registration job ended.
  final DateTime? endedAt;

  /// Contains details that are populated when an entire batch job fails. In cases
  /// of individual registration job failures, the batch job as a whole doesn't
  /// fail; it is completed with a <code>JobStatus</code> of
  /// <code>COMPLETED_WITH_ERRORS</code>. You can use the job output file to
  /// identify the individual registration requests that failed.
  final FailureDetails? failureDetails;

  /// The service-generated identifier for the fraudster registration job.
  final String? jobId;

  /// The client-provied name for the fraudster registration job.
  final String? jobName;

  /// Shows the completed percentage of registration requests listed in the input
  /// file.
  final JobProgress? jobProgress;

  /// The current status of the fraudster registration job.
  final FraudsterRegistrationJobStatus? jobStatus;

  FraudsterRegistrationJobSummary({
    this.createdAt,
    this.domainId,
    this.endedAt,
    this.failureDetails,
    this.jobId,
    this.jobName,
    this.jobProgress,
    this.jobStatus,
  });

  factory FraudsterRegistrationJobSummary.fromJson(Map<String, dynamic> json) {
    return FraudsterRegistrationJobSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      domainId: json['DomainId'] as String?,
      endedAt: timeStampFromJson(json['EndedAt']),
      failureDetails: json['FailureDetails'] != null
          ? FailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobProgress: json['JobProgress'] != null
          ? JobProgress.fromJson(json['JobProgress'] as Map<String, dynamic>)
          : null,
      jobStatus:
          (json['JobStatus'] as String?)?.toFraudsterRegistrationJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final endedAt = this.endedAt;
    final failureDetails = this.failureDetails;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobProgress = this.jobProgress;
    final jobStatus = this.jobStatus;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (domainId != null) 'DomainId': domainId,
      if (endedAt != null) 'EndedAt': unixTimestampToJson(endedAt),
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobProgress != null) 'JobProgress': jobProgress,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

/// The configuration containing input file information for a batch job.
class InputDataConfig {
  /// The S3 location for the input manifest file that contains the list of
  /// individual enrollment or registration job requests.
  final String s3Uri;

  InputDataConfig({
    required this.s3Uri,
  });

  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      s3Uri: json['S3Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

/// Indicates the completion progress for a batch job.
class JobProgress {
  /// Shows the completed percentage of enrollment or registration requests listed
  /// in the input file.
  final int? percentComplete;

  JobProgress({
    this.percentComplete,
  });

  factory JobProgress.fromJson(Map<String, dynamic> json) {
    return JobProgress(
      percentComplete: json['PercentComplete'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final percentComplete = this.percentComplete;
    return {
      if (percentComplete != null) 'PercentComplete': percentComplete,
    };
  }
}

/// Contains details produced as a result of performing known fraudster risk
/// analysis on a speaker.
class KnownFraudsterRisk {
  /// The score indicating the likelihood the speaker is a known fraudster.
  final int riskScore;

  /// The identifier of the fraudster that is the closest match to the speaker. If
  /// there are no fraudsters registered in a given domain, or if there are no
  /// fraudsters with a non-zero RiskScore, this value is <code>null</code>.
  final String? generatedFraudsterId;

  KnownFraudsterRisk({
    required this.riskScore,
    this.generatedFraudsterId,
  });

  factory KnownFraudsterRisk.fromJson(Map<String, dynamic> json) {
    return KnownFraudsterRisk(
      riskScore: json['RiskScore'] as int,
      generatedFraudsterId: json['GeneratedFraudsterId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final riskScore = this.riskScore;
    final generatedFraudsterId = this.generatedFraudsterId;
    return {
      'RiskScore': riskScore,
      if (generatedFraudsterId != null)
        'GeneratedFraudsterId': generatedFraudsterId,
    };
  }
}

class ListDomainsResponse {
  /// A list containing details about each domain in the Amazon Web Services
  /// account.
  final List<DomainSummary>? domainSummaries;

  /// If <code>NextToken</code> is returned, there are more results available. The
  /// value of <code>NextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  final String? nextToken;

  ListDomainsResponse({
    this.domainSummaries,
    this.nextToken,
  });

  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsResponse(
      domainSummaries: (json['DomainSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainSummaries = this.domainSummaries;
    final nextToken = this.nextToken;
    return {
      if (domainSummaries != null) 'DomainSummaries': domainSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFraudsterRegistrationJobsResponse {
  /// A list containing details about each specified fraudster registration job.
  final List<FraudsterRegistrationJobSummary>? jobSummaries;

  /// If <code>NextToken</code> is returned, there are more results available. The
  /// value of <code>NextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  final String? nextToken;

  ListFraudsterRegistrationJobsResponse({
    this.jobSummaries,
    this.nextToken,
  });

  factory ListFraudsterRegistrationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFraudsterRegistrationJobsResponse(
      jobSummaries: (json['JobSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => FraudsterRegistrationJobSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaries = this.jobSummaries;
    final nextToken = this.nextToken;
    return {
      if (jobSummaries != null) 'JobSummaries': jobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSpeakerEnrollmentJobsResponse {
  /// A list containing details about each specified speaker enrollment job.
  final List<SpeakerEnrollmentJobSummary>? jobSummaries;

  /// If <code>NextToken</code> is returned, there are more results available. The
  /// value of <code>NextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  final String? nextToken;

  ListSpeakerEnrollmentJobsResponse({
    this.jobSummaries,
    this.nextToken,
  });

  factory ListSpeakerEnrollmentJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSpeakerEnrollmentJobsResponse(
      jobSummaries: (json['JobSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SpeakerEnrollmentJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaries = this.jobSummaries;
    final nextToken = this.nextToken;
    return {
      if (jobSummaries != null) 'JobSummaries': jobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSpeakersResponse {
  /// If <code>NextToken</code> is returned, there are more results available. The
  /// value of <code>NextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page. Keep
  /// all other arguments unchanged. Each pagination token expires after 24 hours.
  final String? nextToken;

  /// A list containing details about each speaker in the Amazon Web Services
  /// account.
  final List<SpeakerSummary>? speakerSummaries;

  ListSpeakersResponse({
    this.nextToken,
    this.speakerSummaries,
  });

  factory ListSpeakersResponse.fromJson(Map<String, dynamic> json) {
    return ListSpeakersResponse(
      nextToken: json['NextToken'] as String?,
      speakerSummaries: (json['SpeakerSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => SpeakerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final speakerSummaries = this.speakerSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (speakerSummaries != null) 'SpeakerSummaries': speakerSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class OptOutSpeakerResponse {
  /// Details about the opted-out speaker.
  final Speaker? speaker;

  OptOutSpeakerResponse({
    this.speaker,
  });

  factory OptOutSpeakerResponse.fromJson(Map<String, dynamic> json) {
    return OptOutSpeakerResponse(
      speaker: json['Speaker'] != null
          ? Speaker.fromJson(json['Speaker'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final speaker = this.speaker;
    return {
      if (speaker != null) 'Speaker': speaker,
    };
  }
}

/// The configuration containing output file information for a batch job.
class OutputDataConfig {
  /// The S3 path of the folder where Voice ID writes the job output file. It has
  /// a <code>*.out</code> extension. For example, if the input file name is
  /// <code>input-file.json</code> and the output folder path is
  /// <code>s3://output-bucket/output-folder</code>, the full output file path is
  /// <code>s3://output-bucket/output-folder/job-Id/input-file.json.out</code>.
  final String s3Uri;

  /// the identifier of the KMS key you want Voice ID to use to encrypt the output
  /// file of the fraudster registration job.
  final String? kmsKeyId;

  OutputDataConfig({
    required this.s3Uri,
    this.kmsKeyId,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
      s3Uri: json['S3Uri'] as String,
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final kmsKeyId = this.kmsKeyId;
    return {
      'S3Uri': s3Uri,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// The configuration defining the action to take when a duplicate fraudster is
/// detected, and the similarity threshold to use for detecting a duplicate
/// fraudster during a batch fraudster registration job.
class RegistrationConfig {
  /// The action to take when a fraudster is identified as a duplicate. The
  /// default action is <code>SKIP</code>, which skips registering the duplicate
  /// fraudster. Setting the value to <code>REGISTER_AS_NEW</code> always
  /// registers a new fraudster into the specified domain.
  final DuplicateRegistrationAction? duplicateRegistrationAction;

  /// The minimum similarity score between the new and old fraudsters in order to
  /// consider the new fraudster a duplicate.
  final int? fraudsterSimilarityThreshold;

  RegistrationConfig({
    this.duplicateRegistrationAction,
    this.fraudsterSimilarityThreshold,
  });

  factory RegistrationConfig.fromJson(Map<String, dynamic> json) {
    return RegistrationConfig(
      duplicateRegistrationAction:
          (json['DuplicateRegistrationAction'] as String?)
              ?.toDuplicateRegistrationAction(),
      fraudsterSimilarityThreshold:
          json['FraudsterSimilarityThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final duplicateRegistrationAction = this.duplicateRegistrationAction;
    final fraudsterSimilarityThreshold = this.fraudsterSimilarityThreshold;
    return {
      if (duplicateRegistrationAction != null)
        'DuplicateRegistrationAction': duplicateRegistrationAction.toValue(),
      if (fraudsterSimilarityThreshold != null)
        'FraudsterSimilarityThreshold': fraudsterSimilarityThreshold,
    };
  }
}

/// The configuration containing information about the customer managed key used
/// for encrypting customer data.
class ServerSideEncryptionConfiguration {
  /// The identifier of the KMS key you want Voice ID to use to encrypt your data.
  final String kmsKeyId;

  ServerSideEncryptionConfiguration({
    required this.kmsKeyId,
  });

  factory ServerSideEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServerSideEncryptionConfiguration(
      kmsKeyId: json['KmsKeyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    return {
      'KmsKeyId': kmsKeyId,
    };
  }
}

/// Details about the most recent server-side encryption configuration update.
/// When the server-side encryption configuration is changed, dependency on the
/// old KMS key is removed through an asynchronous process. When this update is
/// complete, the domain’s data can only be accessed using the new KMS key.
class ServerSideEncryptionUpdateDetails {
  /// Message explaining the current UpdateStatus. When the UpdateStatus is
  /// FAILED, this message explains the cause of the failure.
  final String? message;

  /// The previous KMS key ID the domain was encrypted with, before
  /// ServerSideEncryptionConfiguration was updated to a new KMS key ID.
  final String? oldKmsKeyId;

  /// Status of the server-side encryption update. During an update, if there is
  /// an issue with the domain's current or old KMS key ID, such as an
  /// inaccessible or disabled key, then the status is FAILED. In order to resolve
  /// this, the key needs to be made accessible, and then an UpdateDomain call
  /// with the existing server-side encryption configuration will re-attempt this
  /// update process.
  final ServerSideEncryptionUpdateStatus? updateStatus;

  ServerSideEncryptionUpdateDetails({
    this.message,
    this.oldKmsKeyId,
    this.updateStatus,
  });

  factory ServerSideEncryptionUpdateDetails.fromJson(
      Map<String, dynamic> json) {
    return ServerSideEncryptionUpdateDetails(
      message: json['Message'] as String?,
      oldKmsKeyId: json['OldKmsKeyId'] as String?,
      updateStatus: (json['UpdateStatus'] as String?)
          ?.toServerSideEncryptionUpdateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final oldKmsKeyId = this.oldKmsKeyId;
    final updateStatus = this.updateStatus;
    return {
      if (message != null) 'Message': message,
      if (oldKmsKeyId != null) 'OldKmsKeyId': oldKmsKeyId,
      if (updateStatus != null) 'UpdateStatus': updateStatus.toValue(),
    };
  }
}

enum ServerSideEncryptionUpdateStatus {
  inProgress,
  completed,
  failed,
}

extension on ServerSideEncryptionUpdateStatus {
  String toValue() {
    switch (this) {
      case ServerSideEncryptionUpdateStatus.inProgress:
        return 'IN_PROGRESS';
      case ServerSideEncryptionUpdateStatus.completed:
        return 'COMPLETED';
      case ServerSideEncryptionUpdateStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ServerSideEncryptionUpdateStatus toServerSideEncryptionUpdateStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ServerSideEncryptionUpdateStatus.inProgress;
      case 'COMPLETED':
        return ServerSideEncryptionUpdateStatus.completed;
      case 'FAILED':
        return ServerSideEncryptionUpdateStatus.failed;
    }
    throw Exception(
        '$this is not known in enum ServerSideEncryptionUpdateStatus');
  }
}

/// Contains all the information about a speaker.
class Speaker {
  /// A timestamp showing when the speaker is created.
  final DateTime? createdAt;

  /// The client-provided identifier for the speaker.
  final String? customerSpeakerId;

  /// The identifier of the domain that contains the speaker.
  final String? domainId;

  /// The service-generated identifier for the speaker.
  final String? generatedSpeakerId;

  /// The timestamp when the speaker was last accessed for enrollment,
  /// re-enrollment or a successful authentication. This timestamp is accurate to
  /// one hour.
  final DateTime? lastAccessedAt;

  /// The current status of the speaker.
  final SpeakerStatus? status;

  /// A timestamp showing the speaker's last update.
  final DateTime? updatedAt;

  Speaker({
    this.createdAt,
    this.customerSpeakerId,
    this.domainId,
    this.generatedSpeakerId,
    this.lastAccessedAt,
    this.status,
    this.updatedAt,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) {
    return Speaker(
      createdAt: timeStampFromJson(json['CreatedAt']),
      customerSpeakerId: json['CustomerSpeakerId'] as String?,
      domainId: json['DomainId'] as String?,
      generatedSpeakerId: json['GeneratedSpeakerId'] as String?,
      lastAccessedAt: timeStampFromJson(json['LastAccessedAt']),
      status: (json['Status'] as String?)?.toSpeakerStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final customerSpeakerId = this.customerSpeakerId;
    final domainId = this.domainId;
    final generatedSpeakerId = this.generatedSpeakerId;
    final lastAccessedAt = this.lastAccessedAt;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (customerSpeakerId != null) 'CustomerSpeakerId': customerSpeakerId,
      if (domainId != null) 'DomainId': domainId,
      if (generatedSpeakerId != null) 'GeneratedSpeakerId': generatedSpeakerId,
      if (lastAccessedAt != null)
        'LastAccessedAt': unixTimestampToJson(lastAccessedAt),
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains all the information about a speaker enrollment job.
class SpeakerEnrollmentJob {
  /// A timestamp showing the creation of the speaker enrollment job.
  final DateTime? createdAt;

  /// The IAM role Amazon Resource Name (ARN) that grants Voice ID permissions to
  /// access customer's buckets to read the input manifest file and write the job
  /// output file.
  final String? dataAccessRoleArn;

  /// The identifier of the domain that contains the speaker enrollment job.
  final String? domainId;

  /// A timestamp showing when the speaker enrollment job ended.
  final DateTime? endedAt;

  /// The configuration that defines the action to take when the speaker is
  /// already enrolled in Voice ID, and the <code>FraudDetectionConfig</code> to
  /// use.
  final EnrollmentConfig? enrollmentConfig;

  /// Contains details that are populated when an entire batch job fails. In cases
  /// of individual registration job failures, the batch job as a whole doesn't
  /// fail; it is completed with a <code>JobStatus</code> of
  /// <code>COMPLETED_WITH_ERRORS</code>. You can use the job output file to
  /// identify the individual registration requests that failed.
  final FailureDetails? failureDetails;

  /// The input data config containing an S3 URI for the input manifest file that
  /// contains the list of speaker enrollment job requests.
  final InputDataConfig? inputDataConfig;

  /// The service-generated identifier for the speaker enrollment job.
  final String? jobId;

  /// The client-provided name for the speaker enrollment job.
  final String? jobName;

  /// Provides details on job progress. This field shows the completed percentage
  /// of registration requests listed in the input file.
  final JobProgress? jobProgress;

  /// The current status of the speaker enrollment job.
  final SpeakerEnrollmentJobStatus? jobStatus;

  /// The output data config containing the S3 location where Voice ID writes the
  /// job output file; you must also include a KMS key ID to encrypt the file.
  final OutputDataConfig? outputDataConfig;

  SpeakerEnrollmentJob({
    this.createdAt,
    this.dataAccessRoleArn,
    this.domainId,
    this.endedAt,
    this.enrollmentConfig,
    this.failureDetails,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobProgress,
    this.jobStatus,
    this.outputDataConfig,
  });

  factory SpeakerEnrollmentJob.fromJson(Map<String, dynamic> json) {
    return SpeakerEnrollmentJob(
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      domainId: json['DomainId'] as String?,
      endedAt: timeStampFromJson(json['EndedAt']),
      enrollmentConfig: json['EnrollmentConfig'] != null
          ? EnrollmentConfig.fromJson(
              json['EnrollmentConfig'] as Map<String, dynamic>)
          : null,
      failureDetails: json['FailureDetails'] != null
          ? FailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobProgress: json['JobProgress'] != null
          ? JobProgress.fromJson(json['JobProgress'] as Map<String, dynamic>)
          : null,
      jobStatus: (json['JobStatus'] as String?)?.toSpeakerEnrollmentJobStatus(),
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final domainId = this.domainId;
    final endedAt = this.endedAt;
    final enrollmentConfig = this.enrollmentConfig;
    final failureDetails = this.failureDetails;
    final inputDataConfig = this.inputDataConfig;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobProgress = this.jobProgress;
    final jobStatus = this.jobStatus;
    final outputDataConfig = this.outputDataConfig;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (domainId != null) 'DomainId': domainId,
      if (endedAt != null) 'EndedAt': unixTimestampToJson(endedAt),
      if (enrollmentConfig != null) 'EnrollmentConfig': enrollmentConfig,
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobProgress != null) 'JobProgress': jobProgress,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
    };
  }
}

enum SpeakerEnrollmentJobStatus {
  submitted,
  inProgress,
  completed,
  completedWithErrors,
  failed,
}

extension on SpeakerEnrollmentJobStatus {
  String toValue() {
    switch (this) {
      case SpeakerEnrollmentJobStatus.submitted:
        return 'SUBMITTED';
      case SpeakerEnrollmentJobStatus.inProgress:
        return 'IN_PROGRESS';
      case SpeakerEnrollmentJobStatus.completed:
        return 'COMPLETED';
      case SpeakerEnrollmentJobStatus.completedWithErrors:
        return 'COMPLETED_WITH_ERRORS';
      case SpeakerEnrollmentJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  SpeakerEnrollmentJobStatus toSpeakerEnrollmentJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return SpeakerEnrollmentJobStatus.submitted;
      case 'IN_PROGRESS':
        return SpeakerEnrollmentJobStatus.inProgress;
      case 'COMPLETED':
        return SpeakerEnrollmentJobStatus.completed;
      case 'COMPLETED_WITH_ERRORS':
        return SpeakerEnrollmentJobStatus.completedWithErrors;
      case 'FAILED':
        return SpeakerEnrollmentJobStatus.failed;
    }
    throw Exception('$this is not known in enum SpeakerEnrollmentJobStatus');
  }
}

/// Contains a summary of information about a speaker enrollment job.
class SpeakerEnrollmentJobSummary {
  /// A timestamp showing the creation time of the speaker enrollment job.
  final DateTime? createdAt;

  /// The identifier of the domain that contains the speaker enrollment job.
  final String? domainId;

  /// A timestamp showing when the speaker enrollment job ended.
  final DateTime? endedAt;

  /// Contains details that are populated when an entire batch job fails. In cases
  /// of individual registration job failures, the batch job as a whole doesn't
  /// fail; it is completed with a <code>JobStatus</code> of
  /// <code>COMPLETED_WITH_ERRORS</code>. You can use the job output file to
  /// identify the individual registration requests that failed.
  final FailureDetails? failureDetails;

  /// The service-generated identifier for the speaker enrollment job.
  final String? jobId;

  /// The client-provided name for the speaker enrollment job.
  final String? jobName;

  /// Provides details regarding job progress. This field shows the completed
  /// percentage of enrollment requests listed in the input file.
  final JobProgress? jobProgress;

  /// The current status of the speaker enrollment job.
  final SpeakerEnrollmentJobStatus? jobStatus;

  SpeakerEnrollmentJobSummary({
    this.createdAt,
    this.domainId,
    this.endedAt,
    this.failureDetails,
    this.jobId,
    this.jobName,
    this.jobProgress,
    this.jobStatus,
  });

  factory SpeakerEnrollmentJobSummary.fromJson(Map<String, dynamic> json) {
    return SpeakerEnrollmentJobSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      domainId: json['DomainId'] as String?,
      endedAt: timeStampFromJson(json['EndedAt']),
      failureDetails: json['FailureDetails'] != null
          ? FailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobProgress: json['JobProgress'] != null
          ? JobProgress.fromJson(json['JobProgress'] as Map<String, dynamic>)
          : null,
      jobStatus: (json['JobStatus'] as String?)?.toSpeakerEnrollmentJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final endedAt = this.endedAt;
    final failureDetails = this.failureDetails;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobProgress = this.jobProgress;
    final jobStatus = this.jobStatus;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (domainId != null) 'DomainId': domainId,
      if (endedAt != null) 'EndedAt': unixTimestampToJson(endedAt),
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobProgress != null) 'JobProgress': jobProgress,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
    };
  }
}

enum SpeakerStatus {
  enrolled,
  expired,
  optedOut,
  pending,
}

extension on SpeakerStatus {
  String toValue() {
    switch (this) {
      case SpeakerStatus.enrolled:
        return 'ENROLLED';
      case SpeakerStatus.expired:
        return 'EXPIRED';
      case SpeakerStatus.optedOut:
        return 'OPTED_OUT';
      case SpeakerStatus.pending:
        return 'PENDING';
    }
  }
}

extension on String {
  SpeakerStatus toSpeakerStatus() {
    switch (this) {
      case 'ENROLLED':
        return SpeakerStatus.enrolled;
      case 'EXPIRED':
        return SpeakerStatus.expired;
      case 'OPTED_OUT':
        return SpeakerStatus.optedOut;
      case 'PENDING':
        return SpeakerStatus.pending;
    }
    throw Exception('$this is not known in enum SpeakerStatus');
  }
}

/// Contains a summary of information about a speaker.
class SpeakerSummary {
  /// A timestamp showing the speaker's creation time.
  final DateTime? createdAt;

  /// The client-provided identifier for the speaker.
  final String? customerSpeakerId;

  /// The identifier of the domain that contains the speaker.
  final String? domainId;

  /// The service-generated identifier for the speaker.
  final String? generatedSpeakerId;

  /// The timestamp when the speaker was last accessed for enrollment,
  /// re-enrollment or a successful authentication. This timestamp is accurate to
  /// one hour.
  final DateTime? lastAccessedAt;

  /// The current status of the speaker.
  final SpeakerStatus? status;

  /// A timestamp showing the speaker's last update.
  final DateTime? updatedAt;

  SpeakerSummary({
    this.createdAt,
    this.customerSpeakerId,
    this.domainId,
    this.generatedSpeakerId,
    this.lastAccessedAt,
    this.status,
    this.updatedAt,
  });

  factory SpeakerSummary.fromJson(Map<String, dynamic> json) {
    return SpeakerSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      customerSpeakerId: json['CustomerSpeakerId'] as String?,
      domainId: json['DomainId'] as String?,
      generatedSpeakerId: json['GeneratedSpeakerId'] as String?,
      lastAccessedAt: timeStampFromJson(json['LastAccessedAt']),
      status: (json['Status'] as String?)?.toSpeakerStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final customerSpeakerId = this.customerSpeakerId;
    final domainId = this.domainId;
    final generatedSpeakerId = this.generatedSpeakerId;
    final lastAccessedAt = this.lastAccessedAt;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (customerSpeakerId != null) 'CustomerSpeakerId': customerSpeakerId,
      if (domainId != null) 'DomainId': domainId,
      if (generatedSpeakerId != null) 'GeneratedSpeakerId': generatedSpeakerId,
      if (lastAccessedAt != null)
        'LastAccessedAt': unixTimestampToJson(lastAccessedAt),
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class StartFraudsterRegistrationJobResponse {
  /// Details about the started fraudster registration job.
  final FraudsterRegistrationJob? job;

  StartFraudsterRegistrationJobResponse({
    this.job,
  });

  factory StartFraudsterRegistrationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartFraudsterRegistrationJobResponse(
      job: json['Job'] != null
          ? FraudsterRegistrationJob.fromJson(
              json['Job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'Job': job,
    };
  }
}

class StartSpeakerEnrollmentJobResponse {
  /// Details about the started speaker enrollment job.
  final SpeakerEnrollmentJob? job;

  StartSpeakerEnrollmentJobResponse({
    this.job,
  });

  factory StartSpeakerEnrollmentJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSpeakerEnrollmentJobResponse(
      job: json['Job'] != null
          ? SpeakerEnrollmentJob.fromJson(json['Job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'Job': job,
    };
  }
}

enum StreamingStatus {
  pendingConfiguration,
  ongoing,
  ended,
}

extension on StreamingStatus {
  String toValue() {
    switch (this) {
      case StreamingStatus.pendingConfiguration:
        return 'PENDING_CONFIGURATION';
      case StreamingStatus.ongoing:
        return 'ONGOING';
      case StreamingStatus.ended:
        return 'ENDED';
    }
  }
}

extension on String {
  StreamingStatus toStreamingStatus() {
    switch (this) {
      case 'PENDING_CONFIGURATION':
        return StreamingStatus.pendingConfiguration;
      case 'ONGOING':
        return StreamingStatus.ongoing;
      case 'ENDED':
        return StreamingStatus.ended;
    }
    throw Exception('$this is not known in enum StreamingStatus');
  }
}

/// A tag that can be assigned to a Voice ID resource.
class Tag {
  /// The first part of a key:value pair that forms a tag associated with a given
  /// resource. For example, in the tag ‘Department’:’Sales’, the key is
  /// 'Department'.
  final String key;

  /// The second part of a key:value pair that forms a tag associated with a given
  /// resource. For example, in the tag ‘Department’:’Sales’, the value is
  /// 'Sales'.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

class UpdateDomainResponse {
  /// Details about the updated domain
  final Domain? domain;

  UpdateDomainResponse({
    this.domain,
  });

  factory UpdateDomainResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainResponse(
      domain: json['Domain'] != null
          ? Domain.fromJson(json['Domain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'Domain': domain,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
