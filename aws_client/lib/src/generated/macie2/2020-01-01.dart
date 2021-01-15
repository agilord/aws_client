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

part '2020-01-01.g.dart';

/// Amazon Macie is a fully managed data security and data privacy service that
/// uses machine learning and pattern matching to discover and protect your
/// sensitive data in AWS. Macie automates the discovery of sensitive data, such
/// as PII and intellectual property, to provide you with insight into the data
/// that your organization stores in AWS. Macie also provides an inventory of
/// your Amazon S3 buckets, which it continually monitors for you. If Macie
/// detects sensitive data or potential data access issues, it generates
/// detailed findings for you to review and act upon as necessary.
class Macie2 {
  final _s.RestJsonProtocol _protocol;
  Macie2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'macie2',
            signingName: 'macie2',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts an Amazon Macie membership invitation that was received from a
  /// specific account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [invitationId] :
  /// The unique identifier for the invitation to accept.
  ///
  /// Parameter [masterAccount] :
  /// The AWS account ID for the account that sent the invitation.
  Future<void> acceptInvitation({
    @_s.required String invitationId,
    @_s.required String masterAccount,
  }) async {
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    ArgumentError.checkNotNull(masterAccount, 'masterAccount');
    final $payload = <String, dynamic>{
      'invitationId': invitationId,
      'masterAccount': masterAccount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptInvitationResponse.fromJson(response);
  }

  /// Retrieves information about one or more custom data identifiers.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [ids] :
  /// An array of strings that lists the unique identifiers for the custom data
  /// identifiers to retrieve information about.
  Future<BatchGetCustomDataIdentifiersResponse> batchGetCustomDataIdentifiers({
    List<String> ids,
  }) async {
    final $payload = <String, dynamic>{
      if (ids != null) 'ids': ids,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/custom-data-identifiers/get',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCustomDataIdentifiersResponse.fromJson(response);
  }

  /// Creates and defines the settings for a classification job.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [jobType] :
  /// The schedule for running the job. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// ONE_TIME - Run the job only once. If you specify this value, don't specify
  /// a value for the scheduleFrequency property.
  /// </li>
  /// <li>
  /// SCHEDULED - Run the job on a daily, weekly, or monthly basis. If you
  /// specify this value, use the scheduleFrequency property to define the
  /// recurrence pattern for the job.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// A custom name for the job. The name can contain as many as 500 characters.
  ///
  /// Parameter [s3JobDefinition] :
  /// The S3 buckets that contain the objects to analyze, and the scope of that
  /// analysis.
  ///
  /// Parameter [customDataIdentifierIds] :
  /// The custom data identifiers to use for data analysis and classification.
  ///
  /// Parameter [description] :
  /// A custom description of the job. The description can contain as many as
  /// 200 characters.
  ///
  /// Parameter [initialRun] :
  /// Specifies whether to analyze all existing, eligible objects immediately
  /// after the job is created.
  ///
  /// Parameter [samplingPercentage] :
  /// The sampling depth, as a percentage, to apply when processing objects.
  /// This value determines the percentage of eligible objects that the job
  /// analyzes. If this value is less than 100, Amazon Macie selects the objects
  /// to analyze at random, up to the specified percentage, and analyzes all the
  /// data in those objects.
  ///
  /// Parameter [scheduleFrequency] :
  /// The recurrence pattern for running the job. To run the job only once,
  /// don't specify a value for this property and set the value for the jobType
  /// property to ONE_TIME.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// job.
  ///
  /// A job can have a maximum of 50 tags. Each tag consists of a tag key and an
  /// associated tag value. The maximum length of a tag key is 128 characters.
  /// The maximum length of a tag value is 256 characters.
  Future<CreateClassificationJobResponse> createClassificationJob({
    @_s.required String clientToken,
    @_s.required JobType jobType,
    @_s.required String name,
    @_s.required S3JobDefinition s3JobDefinition,
    List<String> customDataIdentifierIds,
    String description,
    bool initialRun,
    int samplingPercentage,
    JobScheduleFrequency scheduleFrequency,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    ArgumentError.checkNotNull(jobType, 'jobType');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(s3JobDefinition, 's3JobDefinition');
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'jobType': jobType?.toValue() ?? '',
      'name': name,
      's3JobDefinition': s3JobDefinition,
      if (customDataIdentifierIds != null)
        'customDataIdentifierIds': customDataIdentifierIds,
      if (description != null) 'description': description,
      if (initialRun != null) 'initialRun': initialRun,
      if (samplingPercentage != null) 'samplingPercentage': samplingPercentage,
      if (scheduleFrequency != null) 'scheduleFrequency': scheduleFrequency,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateClassificationJobResponse.fromJson(response);
  }

  /// Creates and defines the criteria and other settings for a custom data
  /// identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// A custom description of the custom data identifier. The description can
  /// contain as many as 512 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// description of a custom data identifier. Other users of your account might
  /// be able to see the identifier's description, depending on the actions that
  /// they're allowed to perform in Amazon Macie.
  ///
  /// Parameter [ignoreWords] :
  /// An array that lists specific character sequences (ignore words) to exclude
  /// from the results. If the text matched by the regular expression is the
  /// same as any string in this array, Amazon Macie ignores it. The array can
  /// contain as many as 10 ignore words. Each ignore word can contain 4 - 90
  /// characters. Ignore words are case sensitive.
  ///
  /// Parameter [keywords] :
  /// An array that lists specific character sequences (keywords), one of which
  /// must be within proximity (maximumMatchDistance) of the regular expression
  /// to match. The array can contain as many as 50 keywords. Each keyword can
  /// contain 4 - 90 characters. Keywords aren't case sensitive.
  ///
  /// Parameter [maximumMatchDistance] :
  /// The maximum number of characters that can exist between text that matches
  /// the regex pattern and the character sequences specified by the keywords
  /// array. Macie includes or excludes a result based on the proximity of a
  /// keyword to text that matches the regex pattern. The distance can be 1 -
  /// 300 characters. The default value is 50.
  ///
  /// Parameter [name] :
  /// A custom name for the custom data identifier. The name can contain as many
  /// as 128 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// name of a custom data identifier. Other users of your account might be
  /// able to see the identifier's name, depending on the actions that they're
  /// allowed to perform in Amazon Macie.
  ///
  /// Parameter [regex] :
  /// The regular expression (<i>regex</i>) that defines the pattern to match.
  /// The expression can contain as many as 512 characters.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// custom data identifier.
  ///
  /// A custom data identifier can have a maximum of 50 tags. Each tag consists
  /// of a tag key and an associated tag value. The maximum length of a tag key
  /// is 128 characters. The maximum length of a tag value is 256 characters.
  Future<CreateCustomDataIdentifierResponse> createCustomDataIdentifier({
    String clientToken,
    String description,
    List<String> ignoreWords,
    List<String> keywords,
    int maximumMatchDistance,
    String name,
    String regex,
    Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (ignoreWords != null) 'ignoreWords': ignoreWords,
      if (keywords != null) 'keywords': keywords,
      if (maximumMatchDistance != null)
        'maximumMatchDistance': maximumMatchDistance,
      if (name != null) 'name': name,
      if (regex != null) 'regex': regex,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/custom-data-identifiers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomDataIdentifierResponse.fromJson(response);
  }

  /// Creates and defines the criteria and other settings for a findings filter.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [action] :
  /// The action to perform on findings that meet the filter criteria
  /// (findingCriteria). Valid values are: ARCHIVE, suppress (automatically
  /// archive) the findings; and, NOOP, don't perform any action on the
  /// findings.
  ///
  /// Parameter [findingCriteria] :
  /// The criteria to use to filter findings.
  ///
  /// Parameter [name] :
  /// A custom name for the filter. The name must contain at least 3 characters
  /// and can contain as many as 64 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// name of a filter. Other users of your account might be able to see the
  /// filter's name, depending on the actions that they're allowed to perform in
  /// Amazon Macie.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// A custom description of the filter. The description can contain as many as
  /// 512 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// description of a filter. Other users of your account might be able to see
  /// the filter's description, depending on the actions that they're allowed to
  /// perform in Amazon Macie.
  ///
  /// Parameter [position] :
  /// The position of the filter in the list of saved filters on the Amazon
  /// Macie console. This value also determines the order in which the filter is
  /// applied to findings, relative to other filters that are also applied to
  /// the findings.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// filter.
  ///
  /// A findings filter can have a maximum of 50 tags. Each tag consists of a
  /// tag key and an associated tag value. The maximum length of a tag key is
  /// 128 characters. The maximum length of a tag value is 256 characters.
  Future<CreateFindingsFilterResponse> createFindingsFilter({
    @_s.required FindingsFilterAction action,
    @_s.required FindingCriteria findingCriteria,
    @_s.required String name,
    String clientToken,
    String description,
    int position,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(findingCriteria, 'findingCriteria');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'action': action?.toValue() ?? '',
      'findingCriteria': findingCriteria,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (position != null) 'position': position,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findingsfilters',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFindingsFilterResponse.fromJson(response);
  }

  /// Sends an Amazon Macie membership invitation to one or more accounts.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [accountIds] :
  /// An array that lists AWS account IDs, one for each account to send the
  /// invitation to.
  ///
  /// Parameter [disableEmailNotification] :
  /// Specifies whether to send an email notification to the root user of each
  /// account that the invitation will be sent to. This notification is in
  /// addition to an alert that the root user receives in AWS Personal Health
  /// Dashboard. To send an email notification to the root user of each account,
  /// set this value to true.
  ///
  /// Parameter [message] :
  /// A custom message to include in the invitation. Amazon Macie adds this
  /// message to the standard content that it sends for an invitation.
  Future<CreateInvitationsResponse> createInvitations({
    @_s.required List<String> accountIds,
    bool disableEmailNotification,
    String message,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
      if (disableEmailNotification != null)
        'disableEmailNotification': disableEmailNotification,
      if (message != null) 'message': message,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInvitationsResponse.fromJson(response);
  }

  /// Associates an account with an Amazon Macie master account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [account] :
  /// The details for the account to associate with the master account.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// account in Amazon Macie.
  ///
  /// An account can have a maximum of 50 tags. Each tag consists of a tag key
  /// and an associated tag value. The maximum length of a tag key is 128
  /// characters. The maximum length of a tag value is 256 characters.
  Future<CreateMemberResponse> createMember({
    @_s.required AccountDetail account,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(account, 'account');
    final $payload = <String, dynamic>{
      'account': account,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMemberResponse.fromJson(response);
  }

  /// Creates sample findings.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [findingTypes] :
  /// An array that lists one or more types of findings to include in the set of
  /// sample findings. Currently, the only supported value is
  /// Policy:IAMUser/S3BucketEncryptionDisabled.
  Future<void> createSampleFindings({
    List<FindingType> findingTypes,
  }) async {
    final $payload = <String, dynamic>{
      if (findingTypes != null)
        'findingTypes': findingTypes.map((e) => e?.toValue() ?? '').toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/sample',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSampleFindingsResponse.fromJson(response);
  }

  /// Declines Amazon Macie membership invitations that were received from
  /// specific accounts.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [accountIds] :
  /// An array that lists AWS account IDs, one for each account that sent an
  /// invitation to decline.
  Future<DeclineInvitationsResponse> declineInvitations({
    @_s.required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations/decline',
      exceptionFnMap: _exceptionFns,
    );
    return DeclineInvitationsResponse.fromJson(response);
  }

  /// Soft deletes a custom data identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  Future<void> deleteCustomDataIdentifier({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/custom-data-identifiers/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCustomDataIdentifierResponse.fromJson(response);
  }

  /// Deletes a findings filter.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  Future<void> deleteFindingsFilter({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/findingsfilters/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFindingsFilterResponse.fromJson(response);
  }

  /// Deletes Amazon Macie membership invitations that were received from
  /// specific accounts.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [accountIds] :
  /// An array that lists AWS account IDs, one for each account that sent an
  /// invitation to delete.
  Future<DeleteInvitationsResponse> deleteInvitations({
    @_s.required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInvitationsResponse.fromJson(response);
  }

  /// Deletes the association between an Amazon Macie master account and an
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  Future<void> deleteMember({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/members/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMemberResponse.fromJson(response);
  }

  /// Retrieves (queries) statistical data and other information about one or
  /// more S3 buckets that Amazon Macie monitors and analyzes.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [criteria] :
  /// The criteria to use to filter the query results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of the response. The
  /// default value is 50.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  ///
  /// Parameter [sortCriteria] :
  /// The criteria to use to sort the query results.
  Future<DescribeBucketsResponse> describeBuckets({
    Map<String, BucketCriteriaAdditionalProperties> criteria,
    int maxResults,
    String nextToken,
    BucketSortCriteria sortCriteria,
  }) async {
    final $payload = <String, dynamic>{
      if (criteria != null) 'criteria': criteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasources/s3',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBucketsResponse.fromJson(response);
  }

  /// Retrieves the status and settings for a classification job.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for the classification job.
  Future<DescribeClassificationJobResponse> describeClassificationJob({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClassificationJobResponse.fromJson(response);
  }

  /// Retrieves the Amazon Macie configuration settings for an AWS organization.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<DescribeOrganizationConfigurationResponse>
      describeOrganizationConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/admin/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationConfigurationResponse.fromJson(response);
  }

  /// Disables an Amazon Macie account and deletes Macie resources for the
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<void> disableMacie() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/macie',
      exceptionFnMap: _exceptionFns,
    );
    return DisableMacieResponse.fromJson(response);
  }

  /// Disables an account as the delegated Amazon Macie administrator account
  /// for an AWS organization.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [adminAccountId] :
  /// The AWS account ID of the delegated administrator account.
  Future<void> disableOrganizationAdminAccount({
    @_s.required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    final $query = <String, List<String>>{
      if (adminAccountId != null) 'adminAccountId': [adminAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/admin',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisableOrganizationAdminAccountResponse.fromJson(response);
  }

  /// Disassociates a member account from its Amazon Macie master account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<void> disassociateFromMasterAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/master/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateFromMasterAccountResponse.fromJson(response);
  }

  /// Disassociates an Amazon Macie master account from a member account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  Future<void> disassociateMember({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/members/disassociate/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateMemberResponse.fromJson(response);
  }

  /// Enables Amazon Macie and specifies the configuration settings for a Macie
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [findingPublishingFrequency] :
  /// Specifies how often to publish updates to policy findings for the account.
  /// This includes publishing updates to AWS Security Hub and Amazon
  /// EventBridge (formerly called Amazon CloudWatch Events).
  ///
  /// Parameter [status] :
  /// Specifies the status for the account. To enable Amazon Macie and start all
  /// Amazon Macie activities for the account, set this value to ENABLED.
  Future<void> enableMacie({
    String clientToken,
    FindingPublishingFrequency findingPublishingFrequency,
    MacieStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (findingPublishingFrequency != null)
        'findingPublishingFrequency': findingPublishingFrequency.toValue(),
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/macie',
      exceptionFnMap: _exceptionFns,
    );
    return EnableMacieResponse.fromJson(response);
  }

  /// Designates an account as the delegated Amazon Macie administrator account
  /// for an AWS organization.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [adminAccountId] :
  /// The AWS account ID for the account to designate as the delegated Amazon
  /// Macie administrator account for the organization.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  Future<void> enableOrganizationAdminAccount({
    @_s.required String adminAccountId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    final $payload = <String, dynamic>{
      'adminAccountId': adminAccountId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/admin',
      exceptionFnMap: _exceptionFns,
    );
    return EnableOrganizationAdminAccountResponse.fromJson(response);
  }

  /// Retrieves (queries) aggregated statistical data for all the S3 buckets
  /// that Amazon Macie monitors and analyzes.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [accountId] :
  /// The unique identifier for the AWS account.
  Future<GetBucketStatisticsResponse> getBucketStatistics({
    String accountId,
  }) async {
    final $payload = <String, dynamic>{
      if (accountId != null) 'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasources/s3/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetBucketStatisticsResponse.fromJson(response);
  }

  /// Retrieves the configuration settings for storing data classification
  /// results.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<GetClassificationExportConfigurationResponse>
      getClassificationExportConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/classification-export-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetClassificationExportConfigurationResponse.fromJson(response);
  }

  /// Retrieves the criteria and other settings for a custom data identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  Future<GetCustomDataIdentifierResponse> getCustomDataIdentifier({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-data-identifiers/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCustomDataIdentifierResponse.fromJson(response);
  }

  /// Retrieves (queries) aggregated statistical data about findings.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [groupBy] :
  /// The finding property to use to group the query results. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// classificationDetails.jobId - The unique identifier for the classification
  /// job that produced the finding.
  /// </li>
  /// <li>
  /// resourcesAffected.s3Bucket.name - The name of the S3 bucket that the
  /// finding applies to.
  /// </li>
  /// <li>
  /// severity.description - The severity level of the finding, such as High or
  /// Medium.
  /// </li>
  /// <li>
  /// type - The type of finding, such as Policy:IAMUser/S3BucketPublic and
  /// SensitiveData:S3Object/Personal.
  /// </li>
  /// </ul>
  ///
  /// Parameter [findingCriteria] :
  /// The criteria to use to filter the query results.
  ///
  /// Parameter [size] :
  /// The maximum number of items to include in each page of the response.
  ///
  /// Parameter [sortCriteria] :
  /// The criteria to use to sort the query results.
  Future<GetFindingStatisticsResponse> getFindingStatistics({
    @_s.required GroupBy groupBy,
    FindingCriteria findingCriteria,
    int size,
    FindingStatisticsSortCriteria sortCriteria,
  }) async {
    ArgumentError.checkNotNull(groupBy, 'groupBy');
    final $payload = <String, dynamic>{
      'groupBy': groupBy?.toValue() ?? '',
      if (findingCriteria != null) 'findingCriteria': findingCriteria,
      if (size != null) 'size': size,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingStatisticsResponse.fromJson(response);
  }

  /// Retrieves the details of one or more findings.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [findingIds] :
  /// An array of strings that lists the unique identifiers for the findings to
  /// retrieve.
  ///
  /// Parameter [sortCriteria] :
  /// The criteria for sorting the results of the request.
  Future<GetFindingsResponse> getFindings({
    @_s.required List<String> findingIds,
    SortCriteria sortCriteria,
  }) async {
    ArgumentError.checkNotNull(findingIds, 'findingIds');
    final $payload = <String, dynamic>{
      'findingIds': findingIds,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/describe',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsResponse.fromJson(response);
  }

  /// Retrieves the criteria and other settings for a findings filter.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  Future<GetFindingsFilterResponse> getFindingsFilter({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/findingsfilters/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsFilterResponse.fromJson(response);
  }

  /// Retrieves the count of Amazon Macie membership invitations that were
  /// received by an account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<GetInvitationsCountResponse> getInvitationsCount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitations/count',
      exceptionFnMap: _exceptionFns,
    );
    return GetInvitationsCountResponse.fromJson(response);
  }

  /// Retrieves the current status and configuration settings for an Amazon
  /// Macie account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<GetMacieSessionResponse> getMacieSession() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/macie',
      exceptionFnMap: _exceptionFns,
    );
    return GetMacieSessionResponse.fromJson(response);
  }

  /// Retrieves information about the Amazon Macie master account for an
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<GetMasterAccountResponse> getMasterAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/master',
      exceptionFnMap: _exceptionFns,
    );
    return GetMasterAccountResponse.fromJson(response);
  }

  /// Retrieves information about a member account that's associated with an
  /// Amazon Macie master account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  Future<GetMemberResponse> getMember({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/members/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMemberResponse.fromJson(response);
  }

  /// Retrieves (queries) quotas and aggregated usage data for one or more
  /// accounts.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [filterBy] :
  /// An array of objects, one for each condition to use to filter the query
  /// results. If the array contains more than one object, Amazon Macie uses an
  /// AND operator to join the conditions specified by the objects.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of the response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  ///
  /// Parameter [sortBy] :
  /// The criteria to use to sort the query results.
  Future<GetUsageStatisticsResponse> getUsageStatistics({
    List<UsageStatisticsFilter> filterBy,
    int maxResults,
    String nextToken,
    UsageStatisticsSortBy sortBy,
  }) async {
    final $payload = <String, dynamic>{
      if (filterBy != null) 'filterBy': filterBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/usage/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetUsageStatisticsResponse.fromJson(response);
  }

  /// Retrieves (queries) aggregated usage data for an account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<GetUsageTotalsResponse> getUsageTotals() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/usage',
      exceptionFnMap: _exceptionFns,
    );
    return GetUsageTotalsResponse.fromJson(response);
  }

  /// Retrieves a subset of information about one or more classification jobs.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [filterCriteria] :
  /// The criteria to use to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of the response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  ///
  /// Parameter [sortCriteria] :
  /// The criteria to use to sort the results.
  Future<ListClassificationJobsResponse> listClassificationJobs({
    ListJobsFilterCriteria filterCriteria,
    int maxResults,
    String nextToken,
    ListJobsSortCriteria sortCriteria,
  }) async {
    final $payload = <String, dynamic>{
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListClassificationJobsResponse.fromJson(response);
  }

  /// Retrieves a subset of information about all the custom data identifiers
  /// for an account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of the response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListCustomDataIdentifiersResponse> listCustomDataIdentifiers({
    int maxResults,
    String nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/custom-data-identifiers/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomDataIdentifiersResponse.fromJson(response);
  }

  /// Retrieves a subset of information about one or more findings.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [findingCriteria] :
  /// The criteria to use to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of the response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  ///
  /// Parameter [sortCriteria] :
  /// The criteria to use to sort the results.
  Future<ListFindingsResponse> listFindings({
    FindingCriteria findingCriteria,
    int maxResults,
    String nextToken,
    SortCriteria sortCriteria,
  }) async {
    final $payload = <String, dynamic>{
      if (findingCriteria != null) 'findingCriteria': findingCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsResponse.fromJson(response);
  }

  /// Retrieves a subset of information about all the findings filters for an
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of a paginated
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListFindingsFiltersResponse> listFindingsFilters({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/findingsfilters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsFiltersResponse.fromJson(response);
  }

  /// Retrieves information about all the Amazon Macie membership invitations
  /// that were received by an account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of a paginated
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListInvitationsResponse> listInvitations({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvitationsResponse.fromJson(response);
  }

  /// Retrieves information about the accounts that are associated with an
  /// Amazon Macie master account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of a paginated
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  ///
  /// Parameter [onlyAssociated] :
  /// Specifies which accounts to include in the response, based on the status
  /// of an account's relationship with the master account. By default, the
  /// response includes only current member accounts. To include all accounts,
  /// set the value for this parameter to false.
  Future<ListMembersResponse> listMembers({
    int maxResults,
    String nextToken,
    String onlyAssociated,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (onlyAssociated != null) 'onlyAssociated': [onlyAssociated],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersResponse.fromJson(response);
  }

  /// Retrieves information about the delegated Amazon Macie administrator
  /// account for an AWS organization.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of a paginated
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListOrganizationAdminAccountsResponse> listOrganizationAdminAccounts({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/admin',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationAdminAccountsResponse.fromJson(response);
  }

  /// Retrieves the tags (keys and values) that are associated with a
  /// classification job, custom data identifier, findings filter, or member
  /// account.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the classification job, custom data
  /// identifier, findings filter, or member account.
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

  /// Creates or updates the configuration settings for storing data
  /// classification results.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [configuration] :
  /// The location to store data classification results in, and the encryption
  /// settings to use when storing results in that location.
  Future<PutClassificationExportConfigurationResponse>
      putClassificationExportConfiguration({
    @_s.required ClassificationExportConfiguration configuration,
  }) async {
    ArgumentError.checkNotNull(configuration, 'configuration');
    final $payload = <String, dynamic>{
      'configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/classification-export-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutClassificationExportConfigurationResponse.fromJson(response);
  }

  /// Adds or updates one or more tags (keys and values) that are associated
  /// with a classification job, custom data identifier, findings filter, or
  /// member account.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the classification job, custom data
  /// identifier, findings filter, or member account.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// resource.
  ///
  /// A resource can have a maximum of 50 tags. Each tag consists of a tag key
  /// and an associated tag value. The maximum length of a tag key is 128
  /// characters. The maximum length of a tag value is 256 characters.
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

  /// Tests a custom data identifier.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [regex] :
  /// The regular expression (<i>regex</i>) that defines the pattern to match.
  /// The expression can contain as many as 512 characters.
  ///
  /// Parameter [sampleText] :
  /// The sample text to inspect by using the custom data identifier. The text
  /// can contain as many as 1,000 characters.
  ///
  /// Parameter [ignoreWords] :
  /// An array that lists specific character sequences (ignore words) to exclude
  /// from the results. If the text matched by the regular expression is the
  /// same as any string in this array, Amazon Macie ignores it. The array can
  /// contain as many as 10 ignore words. Each ignore word can contain 4 - 90
  /// characters. Ignore words are case sensitive.
  ///
  /// Parameter [keywords] :
  /// An array that lists specific character sequences (keywords), one of which
  /// must be within proximity (maximumMatchDistance) of the regular expression
  /// to match. The array can contain as many as 50 keywords. Each keyword can
  /// contain 4 - 90 characters. Keywords aren't case sensitive.
  ///
  /// Parameter [maximumMatchDistance] :
  /// The maximum number of characters that can exist between text that matches
  /// the regex pattern and the character sequences specified by the keywords
  /// array. Macie includes or excludes a result based on the proximity of a
  /// keyword to text that matches the regex pattern. The distance can be 1 -
  /// 300 characters. The default value is 50.
  Future<TestCustomDataIdentifierResponse> testCustomDataIdentifier({
    @_s.required String regex,
    @_s.required String sampleText,
    List<String> ignoreWords,
    List<String> keywords,
    int maximumMatchDistance,
  }) async {
    ArgumentError.checkNotNull(regex, 'regex');
    ArgumentError.checkNotNull(sampleText, 'sampleText');
    final $payload = <String, dynamic>{
      'regex': regex,
      'sampleText': sampleText,
      if (ignoreWords != null) 'ignoreWords': ignoreWords,
      if (keywords != null) 'keywords': keywords,
      if (maximumMatchDistance != null)
        'maximumMatchDistance': maximumMatchDistance,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/custom-data-identifiers/test',
      exceptionFnMap: _exceptionFns,
    );
    return TestCustomDataIdentifierResponse.fromJson(response);
  }

  /// Removes one or more tags (keys and values) from a classification job,
  /// custom data identifier, findings filter, or member account.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the classification job, custom data
  /// identifier, findings filter, or member account.
  ///
  /// Parameter [tagKeys] :
  /// The key of the tag to remove from the resource. To remove multiple tags,
  /// append the tagKeys parameter and argument for each additional tag to
  /// remove, separated by an ampersand (&amp;).
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

  /// Changes the status of a classification job.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier for the classification job.
  ///
  /// Parameter [jobStatus] :
  /// The new status for the job. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// CANCELLED - Stops the job permanently and cancels it. This value is valid
  /// only if the job's current status is IDLE, PAUSED, RUNNING, or USER_PAUSED.
  ///
  /// If you specify this value and the job's current status is RUNNING, Amazon
  /// Macie immediately begins to stop all processing tasks for the job. You
  /// can't resume or restart a job after you cancel it.
  /// </li>
  /// <li>
  /// RUNNING - Resumes the job. This value is valid only if the job's current
  /// status is USER_PAUSED.
  ///
  /// If you paused the job while it was actively running and you specify this
  /// value less than 30 days after you paused the job, Macie immediately
  /// resumes processing from the point where you paused the job. Otherwise,
  /// Macie resumes the job according to the schedule and other settings for the
  /// job.
  /// </li>
  /// <li>
  /// USER_PAUSED - Pauses the job temporarily. This value is valid only if the
  /// job's current status is IDLE or RUNNING. If you specify this value and the
  /// job's current status is RUNNING, Macie immediately begins to pause all
  /// processing tasks for the job.
  ///
  /// If you pause a one-time job and you don't resume it within 30 days, the
  /// job expires and Macie cancels the job. If you pause a recurring job when
  /// its status is RUNNING and you don't resume it within 30 days, the job run
  /// expires and Macie cancels the run. To check the expiration date, refer to
  /// the UserPausedDetails.jobExpiresAt property.
  /// </li>
  /// </ul>
  Future<void> updateClassificationJob({
    @_s.required String jobId,
    @_s.required JobStatus jobStatus,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(jobStatus, 'jobStatus');
    final $payload = <String, dynamic>{
      'jobStatus': jobStatus?.toValue() ?? '',
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateClassificationJobResponse.fromJson(response);
  }

  /// Updates the criteria and other settings for a findings filter.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  ///
  /// Parameter [action] :
  /// The action to perform on findings that meet the filter criteria
  /// (findingCriteria). Valid values are: ARCHIVE, suppress (automatically
  /// archive) the findings; and, NOOP, don't perform any action on the
  /// findings.
  ///
  /// Parameter [description] :
  /// A custom description of the filter. The description can contain as many as
  /// 512 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// description of a filter. Other users might be able to see the filter's
  /// description, depending on the actions that they're allowed to perform in
  /// Amazon Macie.
  ///
  /// Parameter [findingCriteria] :
  /// The criteria to use to filter findings.
  ///
  /// Parameter [name] :
  /// A custom name for the filter. The name must contain at least 3 characters
  /// and can contain as many as 64 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// name of a filter. Other users might be able to see the filter's name,
  /// depending on the actions that they're allowed to perform in Amazon Macie.
  ///
  /// Parameter [position] :
  /// The position of the filter in the list of saved filters on the Amazon
  /// Macie console. This value also determines the order in which the filter is
  /// applied to findings, relative to other filters that are also applied to
  /// the findings.
  Future<UpdateFindingsFilterResponse> updateFindingsFilter({
    @_s.required String id,
    FindingsFilterAction action,
    String description,
    FindingCriteria findingCriteria,
    String name,
    int position,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      if (action != null) 'action': action.toValue(),
      if (description != null) 'description': description,
      if (findingCriteria != null) 'findingCriteria': findingCriteria,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/findingsfilters/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFindingsFilterResponse.fromJson(response);
  }

  /// Suspends or re-enables an Amazon Macie account, or updates the
  /// configuration settings for a Macie account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [findingPublishingFrequency] :
  /// Specifies how often to publish updates to policy findings for the account.
  /// This includes publishing updates to AWS Security Hub and Amazon
  /// EventBridge (formerly called Amazon CloudWatch Events).
  ///
  /// Parameter [status] :
  /// Specifies whether to change the status of the account. Valid values are:
  /// ENABLED, resume all Amazon Macie activities for the account; and, PAUSED,
  /// suspend all Macie activities for the account.
  Future<void> updateMacieSession({
    FindingPublishingFrequency findingPublishingFrequency,
    MacieStatus status,
  }) async {
    final $payload = <String, dynamic>{
      if (findingPublishingFrequency != null)
        'findingPublishingFrequency': findingPublishingFrequency.toValue(),
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/macie',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMacieSessionResponse.fromJson(response);
  }

  /// Enables an Amazon Macie master account to suspend or re-enable a member
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource or account that the
  /// request applies to.
  ///
  /// Parameter [status] :
  /// Specifies the new status for the account. Valid values are: ENABLED,
  /// resume all Amazon Macie activities for the account; and, PAUSED, suspend
  /// all Macie activities for the account.
  Future<void> updateMemberSession({
    @_s.required String id,
    @_s.required MacieStatus status,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(status, 'status');
    final $payload = <String, dynamic>{
      'status': status?.toValue() ?? '',
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/macie/members/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMemberSessionResponse.fromJson(response);
  }

  /// Updates the Amazon Macie configuration settings for an AWS organization.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [autoEnable] :
  /// Specifies whether Amazon Macie is enabled automatically for each account,
  /// when the account is added to the AWS organization.
  Future<void> updateOrganizationConfiguration({
    @_s.required bool autoEnable,
  }) async {
    ArgumentError.checkNotNull(autoEnable, 'autoEnable');
    final $payload = <String, dynamic>{
      'autoEnable': autoEnable,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/admin/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOrganizationConfigurationResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptInvitationResponse {
  AcceptInvitationResponse();
  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptInvitationResponseFromJson(json);
}

/// Provides information about the permissions settings of the bucket-level
/// access control list (ACL) for an S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessControlList {
  /// Specifies whether the ACL grants the general public with read access
  /// permissions for the bucket.
  @_s.JsonKey(name: 'allowsPublicReadAccess')
  final bool allowsPublicReadAccess;

  /// Specifies whether the ACL grants the general public with write access
  /// permissions for the bucket.
  @_s.JsonKey(name: 'allowsPublicWriteAccess')
  final bool allowsPublicWriteAccess;

  AccessControlList({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });
  factory AccessControlList.fromJson(Map<String, dynamic> json) =>
      _$AccessControlListFromJson(json);
}

/// Specifies details for an account to associate with an Amazon Macie master
/// account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AccountDetail {
  /// The AWS account ID for the account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The email address for the account.
  @_s.JsonKey(name: 'email')
  final String email;

  AccountDetail({
    @_s.required this.accountId,
    @_s.required this.email,
  });
  Map<String, dynamic> toJson() => _$AccountDetailToJson(this);
}

/// Provides information about account-level permissions settings that apply to
/// an S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountLevelPermissions {
  /// The block public access settings for the bucket.
  @_s.JsonKey(name: 'blockPublicAccess')
  final BlockPublicAccess blockPublicAccess;

  AccountLevelPermissions({
    this.blockPublicAccess,
  });
  factory AccountLevelPermissions.fromJson(Map<String, dynamic> json) =>
      _$AccountLevelPermissionsFromJson(json);
}

/// Provides information about the delegated Amazon Macie administrator account
/// for an AWS organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminAccount {
  /// The AWS account ID for the account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The current status of the account as a delegated administrator of Amazon
  /// Macie for the organization.
  @_s.JsonKey(name: 'status')
  final AdminStatus status;

  AdminAccount({
    this.accountId,
    this.status,
  });
  factory AdminAccount.fromJson(Map<String, dynamic> json) =>
      _$AdminAccountFromJson(json);
}

/// The current status of an account as the delegated Amazon Macie administrator
/// account for an AWS organization.
enum AdminStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLING_IN_PROGRESS')
  disablingInProgress,
}

/// Provides information about an API operation that an entity invoked for an
/// affected resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApiCallDetails {
  /// The name of the operation that was invoked most recently and produced the
  /// finding.
  @_s.JsonKey(name: 'api')
  final String api;

  /// The URL of the AWS service that provides the operation, for example:
  /// s3.amazonaws.com.
  @_s.JsonKey(name: 'apiServiceName')
  final String apiServiceName;

  /// The first date and time, in UTC and extended ISO 8601 format, when any
  /// operation was invoked and produced the finding.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'firstSeen')
  final DateTime firstSeen;

  /// The most recent date and time, in UTC and extended ISO 8601 format, when the
  /// specified operation (api) was invoked and produced the finding.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastSeen')
  final DateTime lastSeen;

  ApiCallDetails({
    this.api,
    this.apiServiceName,
    this.firstSeen,
    this.lastSeen,
  });
  factory ApiCallDetails.fromJson(Map<String, dynamic> json) =>
      _$ApiCallDetailsFromJson(json);
}

/// Provides information about an identity that performed an action on an
/// affected resource by using temporary security credentials. The credentials
/// were obtained using the AssumeRole operation of the AWS Security Token
/// Service (AWS STS) API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssumedRole {
  /// The AWS access key ID that identifies the credentials.
  @_s.JsonKey(name: 'accessKeyId')
  final String accessKeyId;

  /// The unique identifier for the AWS account that owns the entity that was used
  /// to get the credentials.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the entity that was used to get the
  /// credentials.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the entity that was used to get the credentials.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  /// The details of the session that was created for the credentials, including
  /// the entity that issued the session.
  @_s.JsonKey(name: 'sessionContext')
  final SessionContext sessionContext;

  AssumedRole({
    this.accessKeyId,
    this.accountId,
    this.arn,
    this.principalId,
    this.sessionContext,
  });
  factory AssumedRole.fromJson(Map<String, dynamic> json) =>
      _$AssumedRoleFromJson(json);
}

/// Provides information about an AWS account and entity that performed an
/// action on an affected resource. The action was performed using the
/// credentials for an AWS account other than your own account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsAccount {
  /// The unique identifier for the AWS account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The unique identifier for the entity that performed the action.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  AwsAccount({
    this.accountId,
    this.principalId,
  });
  factory AwsAccount.fromJson(Map<String, dynamic> json) =>
      _$AwsAccountFromJson(json);
}

/// Provides information about an AWS service that performed an action on an
/// affected resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsService {
  /// The name of the AWS service that performed the action.
  @_s.JsonKey(name: 'invokedBy')
  final String invokedBy;

  AwsService({
    this.invokedBy,
  });
  factory AwsService.fromJson(Map<String, dynamic> json) =>
      _$AwsServiceFromJson(json);
}

/// Provides information about a custom data identifier.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetCustomDataIdentifierSummary {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the custom data
  /// identifier was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Specifies whether the custom data identifier was deleted. If you delete a
  /// custom data identifier, Amazon Macie doesn't delete it permanently. Instead,
  /// it soft deletes the identifier.
  @_s.JsonKey(name: 'deleted')
  final bool deleted;

  /// The custom description of the custom data identifier.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the custom data identifier.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The custom name of the custom data identifier.
  @_s.JsonKey(name: 'name')
  final String name;

  BatchGetCustomDataIdentifierSummary({
    this.arn,
    this.createdAt,
    this.deleted,
    this.description,
    this.id,
    this.name,
  });
  factory BatchGetCustomDataIdentifierSummary.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetCustomDataIdentifierSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetCustomDataIdentifiersResponse {
  /// An array of objects, one for each custom data identifier that meets the
  /// criteria specified in the request.
  @_s.JsonKey(name: 'customDataIdentifiers')
  final List<BatchGetCustomDataIdentifierSummary> customDataIdentifiers;

  /// An array of identifiers, one for each identifier that was specified in the
  /// request, but doesn't correlate to an existing custom data identifier.
  @_s.JsonKey(name: 'notFoundIdentifierIds')
  final List<String> notFoundIdentifierIds;

  BatchGetCustomDataIdentifiersResponse({
    this.customDataIdentifiers,
    this.notFoundIdentifierIds,
  });
  factory BatchGetCustomDataIdentifiersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchGetCustomDataIdentifiersResponseFromJson(json);
}

/// Provides information about the block public access settings for an S3
/// bucket. These settings can apply to a bucket at the account level or bucket
/// level. For detailed information about each setting, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">Using
/// Amazon S3 block public access</a> in the <i>Amazon Simple Storage Service
/// Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BlockPublicAccess {
  /// Specifies whether Amazon S3 blocks public access control lists (ACLs) for
  /// the bucket and objects in the bucket.
  @_s.JsonKey(name: 'blockPublicAcls')
  final bool blockPublicAcls;

  /// Specifies whether Amazon S3 blocks public bucket policies for the bucket.
  @_s.JsonKey(name: 'blockPublicPolicy')
  final bool blockPublicPolicy;

  /// Specifies whether Amazon S3 ignores public ACLs for the bucket and objects
  /// in the bucket.
  @_s.JsonKey(name: 'ignorePublicAcls')
  final bool ignorePublicAcls;

  /// Specifies whether Amazon S3 restricts public bucket policies for the bucket.
  @_s.JsonKey(name: 'restrictPublicBuckets')
  final bool restrictPublicBuckets;

  BlockPublicAccess({
    this.blockPublicAcls,
    this.blockPublicPolicy,
    this.ignorePublicAcls,
    this.restrictPublicBuckets,
  });
  factory BlockPublicAccess.fromJson(Map<String, dynamic> json) =>
      _$BlockPublicAccessFromJson(json);
}

/// Provides information about the number of S3 buckets that are publicly
/// accessible based on a combination of permissions settings for each bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketCountByEffectivePermission {
  /// The total number of buckets that allow the general public to have read or
  /// write access to the bucket.
  @_s.JsonKey(name: 'publiclyAccessible')
  final int publiclyAccessible;

  /// The total number of buckets that allow the general public to have read
  /// access to the bucket.
  @_s.JsonKey(name: 'publiclyReadable')
  final int publiclyReadable;

  /// The total number of buckets that allow the general public to have write
  /// access to the bucket.
  @_s.JsonKey(name: 'publiclyWritable')
  final int publiclyWritable;

  /// The total number of buckets that Amazon Macie wasn't able to evaluate
  /// permissions settings for. Macie can't determine whether these buckets are
  /// publicly accessible.
  @_s.JsonKey(name: 'unknown')
  final int unknown;

  BucketCountByEffectivePermission({
    this.publiclyAccessible,
    this.publiclyReadable,
    this.publiclyWritable,
    this.unknown,
  });
  factory BucketCountByEffectivePermission.fromJson(
          Map<String, dynamic> json) =>
      _$BucketCountByEffectivePermissionFromJson(json);
}

/// Provides information about the number of S3 buckets that use certain types
/// of server-side encryption or don't encrypt objects by default.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketCountByEncryptionType {
  /// The total number of buckets that use an AWS Key Management Service (AWS KMS)
  /// customer master key (CMK) by default to encrypt objects. These buckets use
  /// AWS managed AWS KMS (AWS-KMS) encryption or customer managed AWS KMS
  /// (SSE-KMS) encryption.
  @_s.JsonKey(name: 'kmsManaged')
  final int kmsManaged;

  /// The total number of buckets that use an Amazon S3 managed key by default to
  /// encrypt objects. These buckets use Amazon S3 managed (SSE-S3) encryption.
  @_s.JsonKey(name: 's3Managed')
  final int s3Managed;

  /// The total number of buckets that don't encrypt objects by default. Default
  /// encryption is disabled for these buckets.
  @_s.JsonKey(name: 'unencrypted')
  final int unencrypted;

  BucketCountByEncryptionType({
    this.kmsManaged,
    this.s3Managed,
    this.unencrypted,
  });
  factory BucketCountByEncryptionType.fromJson(Map<String, dynamic> json) =>
      _$BucketCountByEncryptionTypeFromJson(json);
}

/// Provides information about the number of S3 buckets that are shared with
/// other AWS accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketCountBySharedAccessType {
  /// The total number of buckets that are shared with an AWS account that isn't
  /// part of the same Amazon Macie organization.
  @_s.JsonKey(name: 'external')
  final int external;

  /// The total number of buckets that are shared with an AWS account that's part
  /// of the same Amazon Macie organization.
  @_s.JsonKey(name: 'internal')
  final int internal;

  /// The total number of buckets that aren't shared with other AWS accounts.
  @_s.JsonKey(name: 'notShared')
  final int notShared;

  /// The total number of buckets that Amazon Macie wasn't able to evaluate shared
  /// access settings for. Macie can't determine whether these buckets are shared
  /// with other AWS accounts.
  @_s.JsonKey(name: 'unknown')
  final int unknown;

  BucketCountBySharedAccessType({
    this.external,
    this.internal,
    this.notShared,
    this.unknown,
  });
  factory BucketCountBySharedAccessType.fromJson(Map<String, dynamic> json) =>
      _$BucketCountBySharedAccessTypeFromJson(json);
}

/// Specifies the operator to use in a property-based condition that filters the
/// results of a query for information about S3 buckets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BucketCriteriaAdditionalProperties {
  /// The value for the property matches (equals) the specified value. If you
  /// specify multiple values, Macie uses OR logic to join the values.
  @_s.JsonKey(name: 'eq')
  final List<String> eq;

  /// The value for the property is greater than the specified value.
  @_s.JsonKey(name: 'gt')
  final int gt;

  /// The value for the property is greater than or equal to the specified value.
  @_s.JsonKey(name: 'gte')
  final int gte;

  /// The value for the property is less than the specified value.
  @_s.JsonKey(name: 'lt')
  final int lt;

  /// The value for the property is less than or equal to the specified value.
  @_s.JsonKey(name: 'lte')
  final int lte;

  /// The value for the property doesn't match (doesn't equal) the specified
  /// value. If you specify multiple values, Amazon Macie uses OR logic to join
  /// the values.
  @_s.JsonKey(name: 'neq')
  final List<String> neq;

  /// The name of the bucket begins with the specified value.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  BucketCriteriaAdditionalProperties({
    this.eq,
    this.gt,
    this.gte,
    this.lt,
    this.lte,
    this.neq,
    this.prefix,
  });
  Map<String, dynamic> toJson() =>
      _$BucketCriteriaAdditionalPropertiesToJson(this);
}

/// Provides information about the bucket-level permissions settings for an S3
/// bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketLevelPermissions {
  /// The permissions settings of the access control list (ACL) for the bucket.
  /// This value is null if an ACL hasn't been defined for the bucket.
  @_s.JsonKey(name: 'accessControlList')
  final AccessControlList accessControlList;

  /// The block public access settings for the bucket.
  @_s.JsonKey(name: 'blockPublicAccess')
  final BlockPublicAccess blockPublicAccess;

  /// The permissions settings of the bucket policy for the bucket. This value is
  /// null if a bucket policy hasn't been defined for the bucket.
  @_s.JsonKey(name: 'bucketPolicy')
  final BucketPolicy bucketPolicy;

  BucketLevelPermissions({
    this.accessControlList,
    this.blockPublicAccess,
    this.bucketPolicy,
  });
  factory BucketLevelPermissions.fromJson(Map<String, dynamic> json) =>
      _$BucketLevelPermissionsFromJson(json);
}

/// Provides information about an S3 bucket that Amazon Macie monitors and
/// analyzes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketMetadata {
  /// The unique identifier for the AWS account that owns the bucket.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the bucket.
  @_s.JsonKey(name: 'bucketArn')
  final String bucketArn;

  /// The date and time, in UTC and extended ISO 8601 format, when the bucket was
  /// created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'bucketCreatedAt')
  final DateTime bucketCreatedAt;

  /// The name of the bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The total number of objects that Amazon Macie can analyze in the bucket.
  /// These objects use a supported storage class and have a file name extension
  /// for a supported file or storage format.
  @_s.JsonKey(name: 'classifiableObjectCount')
  final int classifiableObjectCount;

  /// The total storage size, in bytes, of the objects that Amazon Macie can
  /// analyze in the bucket. These objects use a supported storage class and have
  /// a file name extension for a supported file or storage format.
  @_s.JsonKey(name: 'classifiableSizeInBytes')
  final int classifiableSizeInBytes;

  /// Specifies whether any one-time or recurring classification jobs are
  /// configured to analyze data in the bucket, and, if so, the details of the job
  /// that ran most recently.
  @_s.JsonKey(name: 'jobDetails')
  final JobDetails jobDetails;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently retrieved data about the bucket from Amazon S3.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// The total number of objects in the bucket.
  @_s.JsonKey(name: 'objectCount')
  final int objectCount;

  /// The total number of objects that are in the bucket, grouped by server-side
  /// encryption type. This includes a grouping that reports the total number of
  /// objects that aren't encrypted or use client-side encryption.
  @_s.JsonKey(name: 'objectCountByEncryptionType')
  final ObjectCountByEncryptionType objectCountByEncryptionType;

  /// Specifies whether the bucket is publicly accessible. If this value is true,
  /// an access control list (ACL), bucket policy, or block public access settings
  /// allow the bucket to be accessed by the general public.
  @_s.JsonKey(name: 'publicAccess')
  final BucketPublicAccess publicAccess;

  /// The AWS Region that hosts the bucket.
  @_s.JsonKey(name: 'region')
  final String region;

  /// Specifies whether the bucket is configured to replicate one or more objects
  /// to buckets for other AWS accounts and, if so, which accounts.
  @_s.JsonKey(name: 'replicationDetails')
  final ReplicationDetails replicationDetails;

  /// Specifies whether the bucket is shared with another AWS account. Possible
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// EXTERNAL - The bucket is shared with an AWS account that isn't part of the
  /// same Amazon Macie organization.
  /// </li>
  /// <li>
  /// INTERNAL - The bucket is shared with an AWS account that's part of the same
  /// Amazon Macie organization.
  /// </li>
  /// <li>
  /// NOT_SHARED - The bucket isn't shared with other AWS accounts.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie wasn't able to evaluate the shared access settings
  /// for the bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'sharedAccess')
  final SharedAccess sharedAccess;

  /// The total storage size, in bytes, of the bucket.
  @_s.JsonKey(name: 'sizeInBytes')
  final int sizeInBytes;

  /// The total compressed storage size, in bytes, of the bucket.
  @_s.JsonKey(name: 'sizeInBytesCompressed')
  final int sizeInBytesCompressed;

  /// An array that specifies the tags (keys and values) that are associated with
  /// the bucket.
  @_s.JsonKey(name: 'tags')
  final List<KeyValuePair> tags;

  /// The total number of objects that Amazon Macie can't analyze in the bucket.
  /// These objects don't use a supported storage class or don't have a file name
  /// extension for a supported file or storage format.
  @_s.JsonKey(name: 'unclassifiableObjectCount')
  final ObjectLevelStatistics unclassifiableObjectCount;

  /// The total storage size, in bytes, of the objects that Amazon Macie can't
  /// analyze in the bucket. These objects don't use a supported storage class or
  /// don't have a file name extension for a supported file or storage format.
  @_s.JsonKey(name: 'unclassifiableObjectSizeInBytes')
  final ObjectLevelStatistics unclassifiableObjectSizeInBytes;

  /// Specifies whether versioning is enabled for the bucket.
  @_s.JsonKey(name: 'versioning')
  final bool versioning;

  BucketMetadata({
    this.accountId,
    this.bucketArn,
    this.bucketCreatedAt,
    this.bucketName,
    this.classifiableObjectCount,
    this.classifiableSizeInBytes,
    this.jobDetails,
    this.lastUpdated,
    this.objectCount,
    this.objectCountByEncryptionType,
    this.publicAccess,
    this.region,
    this.replicationDetails,
    this.sharedAccess,
    this.sizeInBytes,
    this.sizeInBytesCompressed,
    this.tags,
    this.unclassifiableObjectCount,
    this.unclassifiableObjectSizeInBytes,
    this.versioning,
  });
  factory BucketMetadata.fromJson(Map<String, dynamic> json) =>
      _$BucketMetadataFromJson(json);
}

/// Provides information about the account-level and bucket-level permissions
/// settings for an S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketPermissionConfiguration {
  /// The account-level permissions settings that apply to the bucket.
  @_s.JsonKey(name: 'accountLevelPermissions')
  final AccountLevelPermissions accountLevelPermissions;

  /// The bucket-level permissions settings for the bucket.
  @_s.JsonKey(name: 'bucketLevelPermissions')
  final BucketLevelPermissions bucketLevelPermissions;

  BucketPermissionConfiguration({
    this.accountLevelPermissions,
    this.bucketLevelPermissions,
  });
  factory BucketPermissionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$BucketPermissionConfigurationFromJson(json);
}

/// Provides information about the permissions settings of a bucket policy for
/// an S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketPolicy {
  /// Specifies whether the bucket policy allows the general public to have read
  /// access to the bucket.
  @_s.JsonKey(name: 'allowsPublicReadAccess')
  final bool allowsPublicReadAccess;

  /// Specifies whether the bucket policy allows the general public to have write
  /// access to the bucket.
  @_s.JsonKey(name: 'allowsPublicWriteAccess')
  final bool allowsPublicWriteAccess;

  BucketPolicy({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });
  factory BucketPolicy.fromJson(Map<String, dynamic> json) =>
      _$BucketPolicyFromJson(json);
}

/// Provides information about the permissions settings that determine whether
/// an S3 bucket is publicly accessible.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketPublicAccess {
  /// Specifies whether the bucket is publicly accessible due to the combination
  /// of permissions settings that apply to the bucket. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// NOT_PUBLIC - The bucket isn't publicly accessible.
  /// </li>
  /// <li>
  /// PUBLIC - The bucket is publicly accessible.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie can't determine whether the bucket is publicly
  /// accessible.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'effectivePermission')
  final EffectivePermission effectivePermission;

  /// The account-level and bucket-level permissions for the bucket.
  @_s.JsonKey(name: 'permissionConfiguration')
  final BucketPermissionConfiguration permissionConfiguration;

  BucketPublicAccess({
    this.effectivePermission,
    this.permissionConfiguration,
  });
  factory BucketPublicAccess.fromJson(Map<String, dynamic> json) =>
      _$BucketPublicAccessFromJson(json);
}

/// Specifies criteria for sorting the results of a query for information about
/// S3 buckets.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BucketSortCriteria {
  /// The name of the property to sort the results by. This value can be the name
  /// of any property that Amazon Macie defines as bucket metadata, such as
  /// bucketName or accountId.
  @_s.JsonKey(name: 'attributeName')
  final String attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  @_s.JsonKey(name: 'orderBy')
  final OrderBy orderBy;

  BucketSortCriteria({
    this.attributeName,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => _$BucketSortCriteriaToJson(this);
}

/// Specifies the location of an occurrence of sensitive data in a Microsoft
/// Excel workbook, CSV file, or TSV file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Cell {
  /// The location of the cell, as an absolute cell reference, that contains the
  /// data. For example, Sheet2!C5 for cell C5 on Sheet2 in a Microsoft Excel
  /// workbook. This value is null for CSV and TSV files.
  @_s.JsonKey(name: 'cellReference')
  final String cellReference;

  /// The column number of the column that contains the data. For a Microsoft
  /// Excel workbook, this value correlates to the alphabetical character(s) for a
  /// column identifier. For example, 1 for column A, 2 for column B, and so on.
  @_s.JsonKey(name: 'column')
  final int column;

  /// The name of the column that contains the data, if available.
  @_s.JsonKey(name: 'columnName')
  final String columnName;

  /// The row number of the row that contains the data.
  @_s.JsonKey(name: 'row')
  final int row;

  Cell({
    this.cellReference,
    this.column,
    this.columnName,
    this.row,
  });
  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
}

/// Provides information about a sensitive data finding, including the
/// classification job that produced the finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClassificationDetails {
  /// The path to the folder or file (in Amazon S3) that contains the
  /// corresponding sensitive data discovery result for the finding. If a finding
  /// applies to a large archive or compressed file, this value is the path to a
  /// folder. Otherwise, this value is the path to a file.
  @_s.JsonKey(name: 'detailedResultsLocation')
  final String detailedResultsLocation;

  /// The Amazon Resource Name (ARN) of the classification job that produced the
  /// finding.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique identifier for the classification job that produced the finding.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The status and other details for the finding.
  @_s.JsonKey(name: 'result')
  final ClassificationResult result;

  ClassificationDetails({
    this.detailedResultsLocation,
    this.jobArn,
    this.jobId,
    this.result,
  });
  factory ClassificationDetails.fromJson(Map<String, dynamic> json) =>
      _$ClassificationDetailsFromJson(json);
}

/// Specifies where to store data classification results, and the encryption
/// settings to use when storing results in that location. Currently, you can
/// store classification results only in an S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClassificationExportConfiguration {
  /// The S3 bucket to store data classification results in, and the encryption
  /// settings to use when storing results in that bucket.
  @_s.JsonKey(name: 's3Destination')
  final S3Destination s3Destination;

  ClassificationExportConfiguration({
    this.s3Destination,
  });
  factory ClassificationExportConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ClassificationExportConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ClassificationExportConfigurationToJson(this);
}

/// Provides the details of a sensitive data finding, including the types,
/// number of occurrences, and locations of the sensitive data that was
/// detected.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClassificationResult {
  /// Specifies whether Amazon Macie detected additional occurrences of sensitive
  /// data in the S3 object. A finding includes location data for a maximum of 15
  /// occurrences of sensitive data.
  ///
  /// This value can help you determine whether to investigate additional
  /// occurrences of sensitive data in an object. You can do this by referring to
  /// the corresponding sensitive data discovery result for the finding
  /// (ClassificationDetails.detailedResultsLocation).
  @_s.JsonKey(name: 'additionalOccurrences')
  final bool additionalOccurrences;

  /// The custom data identifiers that detected the sensitive data and the number
  /// of occurrences of the data that they detected.
  @_s.JsonKey(name: 'customDataIdentifiers')
  final CustomDataIdentifiers customDataIdentifiers;

  /// The type of content, as a MIME type, that the finding applies to. For
  /// example, application/gzip, for a GNU Gzip compressed archive file, or
  /// application/pdf, for an Adobe Portable Document Format file.
  @_s.JsonKey(name: 'mimeType')
  final String mimeType;

  /// The category, types, and number of occurrences of the sensitive data that
  /// produced the finding.
  @_s.JsonKey(name: 'sensitiveData')
  final List<SensitiveDataItem> sensitiveData;

  /// The total size, in bytes, of the data that the finding applies to.
  @_s.JsonKey(name: 'sizeClassified')
  final int sizeClassified;

  /// The status of the finding.
  @_s.JsonKey(name: 'status')
  final ClassificationResultStatus status;

  ClassificationResult({
    this.additionalOccurrences,
    this.customDataIdentifiers,
    this.mimeType,
    this.sensitiveData,
    this.sizeClassified,
    this.status,
  });
  factory ClassificationResult.fromJson(Map<String, dynamic> json) =>
      _$ClassificationResultFromJson(json);
}

/// Provides information about the status of a sensitive data finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClassificationResultStatus {
  /// The status of the finding. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// COMPLETE - Amazon Macie successfully completed its analysis of the object
  /// that the finding applies to.
  /// </li>
  /// <li>
  /// PARTIAL - Macie analyzed only a subset of the data in the object that the
  /// finding applies to. For example, the object is an archive file that contains
  /// files in an unsupported format.
  /// </li>
  /// <li>
  /// SKIPPED - Macie wasn't able to analyze the object that the finding applies
  /// to. For example, the object is a malformed file or a file that uses an
  /// unsupported format.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'code')
  final String code;

  /// A brief description of the status of the finding. Amazon Macie uses this
  /// value to notify you of any errors, warnings, or considerations that might
  /// impact your analysis of the finding.
  @_s.JsonKey(name: 'reason')
  final String reason;

  ClassificationResultStatus({
    this.code,
    this.reason,
  });
  factory ClassificationResultStatus.fromJson(Map<String, dynamic> json) =>
      _$ClassificationResultStatusFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateClassificationJobResponse {
  /// The Amazon Resource Name (ARN) of the job.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique identifier for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  CreateClassificationJobResponse({
    this.jobArn,
    this.jobId,
  });
  factory CreateClassificationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateClassificationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCustomDataIdentifierResponse {
  /// The unique identifier for the custom data identifier that was created.
  @_s.JsonKey(name: 'customDataIdentifierId')
  final String customDataIdentifierId;

  CreateCustomDataIdentifierResponse({
    this.customDataIdentifierId,
  });
  factory CreateCustomDataIdentifierResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCustomDataIdentifierResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFindingsFilterResponse {
  /// The Amazon Resource Name (ARN) of the filter that was created.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the filter that was created.
  @_s.JsonKey(name: 'id')
  final String id;

  CreateFindingsFilterResponse({
    this.arn,
    this.id,
  });
  factory CreateFindingsFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFindingsFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInvitationsResponse {
  /// An array of objects, one for each account whose invitation hasn't been
  /// processed. Each object identifies the account and explains why the
  /// invitation hasn't been processed for the account.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  CreateInvitationsResponse({
    this.unprocessedAccounts,
  });
  factory CreateInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMemberResponse {
  /// The Amazon Resource Name (ARN) of the account that was associated with the
  /// master account.
  @_s.JsonKey(name: 'arn')
  final String arn;

  CreateMemberResponse({
    this.arn,
  });
  factory CreateMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMemberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSampleFindingsResponse {
  CreateSampleFindingsResponse();
  factory CreateSampleFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSampleFindingsResponseFromJson(json);
}

/// Specifies the operator to use in a property-based condition that filters the
/// results of a query for findings. For detailed information and examples of
/// each operator, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/findings-filter-basics.html">Fundamentals
/// of filtering findings</a> in the <i>Amazon Macie User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CriterionAdditionalProperties {
  /// The value for the property matches (equals) the specified value. If you
  /// specify multiple values, Macie uses OR logic to join the values.
  @_s.JsonKey(name: 'eq')
  final List<String> eq;

  /// The value for the property exclusively matches (equals an exact match for)
  /// all the specified values. If you specify multiple values, Amazon Macie uses
  /// AND logic to join the values.
  ///
  /// You can use this operator with the following properties:
  /// customDataIdentifiers.detections.arn, customDataIdentifiers.detections.name,
  /// resourcesAffected.s3Bucket.tags.key, resourcesAffected.s3Bucket.tags.value,
  /// resourcesAffected.s3Object.tags.key, resourcesAffected.s3Object.tags.value,
  /// sensitiveData.category, and sensitiveData.detections.type.
  @_s.JsonKey(name: 'eqExactMatch')
  final List<String> eqExactMatch;

  /// The value for the property is greater than the specified value.
  @_s.JsonKey(name: 'gt')
  final int gt;

  /// The value for the property is greater than or equal to the specified value.
  @_s.JsonKey(name: 'gte')
  final int gte;

  /// The value for the property is less than the specified value.
  @_s.JsonKey(name: 'lt')
  final int lt;

  /// The value for the property is less than or equal to the specified value.
  @_s.JsonKey(name: 'lte')
  final int lte;

  /// The value for the property doesn't match (doesn't equal) the specified
  /// value. If you specify multiple values, Macie uses OR logic to join the
  /// values.
  @_s.JsonKey(name: 'neq')
  final List<String> neq;

  CriterionAdditionalProperties({
    this.eq,
    this.eqExactMatch,
    this.gt,
    this.gte,
    this.lt,
    this.lte,
    this.neq,
  });
  factory CriterionAdditionalProperties.fromJson(Map<String, dynamic> json) =>
      _$CriterionAdditionalPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$CriterionAdditionalPropertiesToJson(this);
}

/// The type of currency that data for a usage metric is reported in. Possible
/// values are:
enum Currency {
  @_s.JsonValue('USD')
  usd,
}

/// Provides information about a custom data identifier.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomDataIdentifierSummary {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the custom data
  /// identifier was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The custom description of the custom data identifier.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the custom data identifier.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The custom name of the custom data identifier.
  @_s.JsonKey(name: 'name')
  final String name;

  CustomDataIdentifierSummary({
    this.arn,
    this.createdAt,
    this.description,
    this.id,
    this.name,
  });
  factory CustomDataIdentifierSummary.fromJson(Map<String, dynamic> json) =>
      _$CustomDataIdentifierSummaryFromJson(json);
}

/// Provides information about custom data identifiers that produced a sensitive
/// data finding, and the number of occurrences of the data that they detected
/// for the finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomDataIdentifiers {
  /// The custom data identifiers that detected the data, and the number of
  /// occurrences of the data that each identifier detected.
  @_s.JsonKey(name: 'detections')
  final List<CustomDetection> detections;

  /// The total number of occurrences of the data that was detected by the custom
  /// data identifiers and produced the finding.
  @_s.JsonKey(name: 'totalCount')
  final int totalCount;

  CustomDataIdentifiers({
    this.detections,
    this.totalCount,
  });
  factory CustomDataIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$CustomDataIdentifiersFromJson(json);
}

/// Provides information about a custom data identifier that produced a
/// sensitive data finding, and the sensitive data that it detected for the
/// finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomDetection {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The total number of occurrences of the sensitive data that the custom data
  /// identifier detected.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The name of the custom data identifier.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The location of 1-15 occurrences of the sensitive data that the custom data
  /// identifier detected. A finding includes location data for a maximum of 15
  /// occurrences of sensitive data.
  @_s.JsonKey(name: 'occurrences')
  final Occurrences occurrences;

  CustomDetection({
    this.arn,
    this.count,
    this.name,
    this.occurrences,
  });
  factory CustomDetection.fromJson(Map<String, dynamic> json) =>
      _$CustomDetectionFromJson(json);
}

/// Specifies that a classification job runs once a day, every day. This is an
/// empty object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DailySchedule {
  DailySchedule();
  factory DailySchedule.fromJson(Map<String, dynamic> json) =>
      _$DailyScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DailyScheduleToJson(this);
}

enum DayOfWeek {
  @_s.JsonValue('SUNDAY')
  sunday,
  @_s.JsonValue('MONDAY')
  monday,
  @_s.JsonValue('TUESDAY')
  tuesday,
  @_s.JsonValue('WEDNESDAY')
  wednesday,
  @_s.JsonValue('THURSDAY')
  thursday,
  @_s.JsonValue('FRIDAY')
  friday,
  @_s.JsonValue('SATURDAY')
  saturday,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeclineInvitationsResponse {
  /// An array of objects, one for each account whose invitation hasn't been
  /// declined. Each object identifies the account and explains why the request
  /// hasn't been processed for that account.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  DeclineInvitationsResponse({
    this.unprocessedAccounts,
  });
  factory DeclineInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeclineInvitationsResponseFromJson(json);
}

/// Provides information about a type of sensitive data that was detected by
/// managed data identifiers and produced a sensitive data finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefaultDetection {
  /// The total number of occurrences of the type of sensitive data that was
  /// detected.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The location of 1-15 occurrences of the sensitive data that was detected. A
  /// finding includes location data for a maximum of 15 occurrences of sensitive
  /// data.
  @_s.JsonKey(name: 'occurrences')
  final Occurrences occurrences;

  /// The type of sensitive data that was detected. For example, AWS_CREDENTIALS,
  /// PHONE_NUMBER, or ADDRESS.
  @_s.JsonKey(name: 'type')
  final String type;

  DefaultDetection({
    this.count,
    this.occurrences,
    this.type,
  });
  factory DefaultDetection.fromJson(Map<String, dynamic> json) =>
      _$DefaultDetectionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCustomDataIdentifierResponse {
  DeleteCustomDataIdentifierResponse();
  factory DeleteCustomDataIdentifierResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteCustomDataIdentifierResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFindingsFilterResponse {
  DeleteFindingsFilterResponse();
  factory DeleteFindingsFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFindingsFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInvitationsResponse {
  /// An array of objects, one for each account whose invitation hasn't been
  /// deleted. Each object identifies the account and explains why the request
  /// hasn't been processed for that account.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  DeleteInvitationsResponse({
    this.unprocessedAccounts,
  });
  factory DeleteInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMemberResponse {
  DeleteMemberResponse();
  factory DeleteMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMemberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBucketsResponse {
  /// An array of objects, one for each bucket that meets the filter criteria
  /// specified in the request.
  @_s.JsonKey(name: 'buckets')
  final List<BucketMetadata> buckets;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeBucketsResponse({
    this.buckets,
    this.nextToken,
  });
  factory DescribeBucketsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBucketsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClassificationJobResponse {
  /// The token that was provided to ensure the idempotency of the request to
  /// create the job.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The date and time, in UTC and extended ISO 8601 format, when the job was
  /// created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The custom data identifiers that the job uses to analyze data.
  @_s.JsonKey(name: 'customDataIdentifierIds')
  final List<String> customDataIdentifierIds;

  /// The custom description of the job.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether the job is configured to analyze all existing, eligible
  /// objects immediately after it's created.
  @_s.JsonKey(name: 'initialRun')
  final bool initialRun;

  /// The Amazon Resource Name (ARN) of the job.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique identifier for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The current status of the job. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// CANCELLED - You cancelled the job or, if it's a one-time job, you paused the
  /// job and didn't resume it within 30 days.
  /// </li>
  /// <li>
  /// COMPLETE - For a one-time job, Amazon Macie finished processing the data
  /// specified for the job. This value doesn't apply to recurring jobs.
  /// </li>
  /// <li>
  /// IDLE - For a recurring job, the previous scheduled run is complete and the
  /// next scheduled run is pending. This value doesn't apply to one-time jobs.
  /// </li>
  /// <li>
  /// PAUSED - Amazon Macie started running the job but additional processing
  /// would exceed the monthly sensitive data discovery quota for your account or
  /// one or more member accounts that the job analyzes data for.
  /// </li>
  /// <li>
  /// RUNNING - For a one-time job, the job is in progress. For a recurring job, a
  /// scheduled run is in progress.
  /// </li>
  /// <li>
  /// USER_PAUSED - You paused the job. If you paused the job while it had a
  /// status of RUNNING and you don't resume it within 30 days of pausing it, the
  /// job or job run will expire and be cancelled, depending on the job's type. To
  /// check the expiration date, refer to the UserPausedDetails.jobExpiresAt
  /// property.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'jobStatus')
  final JobStatus jobStatus;

  /// The schedule for running the job. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// ONE_TIME - The job runs only once.
  /// </li>
  /// <li>
  /// SCHEDULED - The job runs on a daily, weekly, or monthly basis. The
  /// scheduleFrequency property indicates the recurrence pattern for the job.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'jobType')
  final JobType jobType;

  /// Specifies whether any account- or bucket-level access errors occurred when
  /// the job ran. For a recurring job, this value indicates the error status of
  /// the job's most recent run.
  @_s.JsonKey(name: 'lastRunErrorStatus')
  final LastRunErrorStatus lastRunErrorStatus;

  /// The date and time, in UTC and extended ISO 8601 format, when the job
  /// started. If the job is a recurring job, this value indicates when the most
  /// recent run started.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastRunTime')
  final DateTime lastRunTime;

  /// The custom name of the job.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The S3 buckets that the job is configured to analyze, and the scope of that
  /// analysis.
  @_s.JsonKey(name: 's3JobDefinition')
  final S3JobDefinition s3JobDefinition;

  /// The sampling depth, as a percentage, that determines the percentage of
  /// eligible objects that the job analyzes.
  @_s.JsonKey(name: 'samplingPercentage')
  final int samplingPercentage;

  /// The recurrence pattern for running the job. If the job is configured to run
  /// only once, this value is null.
  @_s.JsonKey(name: 'scheduleFrequency')
  final JobScheduleFrequency scheduleFrequency;

  /// The number of times that the job has run and processing statistics for the
  /// job's current run.
  @_s.JsonKey(name: 'statistics')
  final Statistics statistics;

  /// A map of key-value pairs that specifies which tags (keys and values) are
  /// associated with the classification job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// If the current status of the job is USER_PAUSED, specifies when the job was
  /// paused and when the job or job run will expire and be cancelled if it isn't
  /// resumed. This value is present only if the value for jobStatus is
  /// USER_PAUSED.
  @_s.JsonKey(name: 'userPausedDetails')
  final UserPausedDetails userPausedDetails;

  DescribeClassificationJobResponse({
    this.clientToken,
    this.createdAt,
    this.customDataIdentifierIds,
    this.description,
    this.initialRun,
    this.jobArn,
    this.jobId,
    this.jobStatus,
    this.jobType,
    this.lastRunErrorStatus,
    this.lastRunTime,
    this.name,
    this.s3JobDefinition,
    this.samplingPercentage,
    this.scheduleFrequency,
    this.statistics,
    this.tags,
    this.userPausedDetails,
  });
  factory DescribeClassificationJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeClassificationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationConfigurationResponse {
  /// Specifies whether Amazon Macie is enabled automatically for accounts that
  /// are added to the AWS organization.
  @_s.JsonKey(name: 'autoEnable')
  final bool autoEnable;

  /// Specifies whether the maximum number of Amazon Macie member accounts are
  /// part of the AWS organization.
  @_s.JsonKey(name: 'maxAccountLimitReached')
  final bool maxAccountLimitReached;

  DescribeOrganizationConfigurationResponse({
    this.autoEnable,
    this.maxAccountLimitReached,
  });
  factory DescribeOrganizationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableMacieResponse {
  DisableMacieResponse();
  factory DisableMacieResponse.fromJson(Map<String, dynamic> json) =>
      _$DisableMacieResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableOrganizationAdminAccountResponse {
  DisableOrganizationAdminAccountResponse();
  factory DisableOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisableOrganizationAdminAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();
  factory DisassociateFromMasterAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateFromMasterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateMemberResponse {
  DisassociateMemberResponse();
  factory DisassociateMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateMemberResponseFromJson(json);
}

/// Provides information about the domain name of the device that an entity used
/// to perform an action on an affected resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainDetails {
  /// The name of the domain.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  DomainDetails({
    this.domainName,
  });
  factory DomainDetails.fromJson(Map<String, dynamic> json) =>
      _$DomainDetailsFromJson(json);
}

enum EffectivePermission {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('NOT_PUBLIC')
  notPublic,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableMacieResponse {
  EnableMacieResponse();
  factory EnableMacieResponse.fromJson(Map<String, dynamic> json) =>
      _$EnableMacieResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableOrganizationAdminAccountResponse {
  EnableOrganizationAdminAccountResponse();
  factory EnableOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EnableOrganizationAdminAccountResponseFromJson(json);
}

/// The type of server-side encryption that's used to encrypt an S3 object or
/// objects in an S3 bucket. Valid values are:
enum EncryptionType {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('AES256')
  aes256,
  @_s.JsonValue('aws:kms')
  awsKms,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

/// The source of an error, issue, or delay. Possible values are:
enum ErrorCode {
  @_s.JsonValue('ClientError')
  clientError,
  @_s.JsonValue('InternalError')
  internalError,
}

/// Provides information about an identity that performed an action on an
/// affected resource by using temporary security credentials. The credentials
/// were obtained using the GetFederationToken operation of the AWS Security
/// Token Service (AWS STS) API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FederatedUser {
  /// The AWS access key ID that identifies the credentials.
  @_s.JsonKey(name: 'accessKeyId')
  final String accessKeyId;

  /// The unique identifier for the AWS account that owns the entity that was used
  /// to get the credentials.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the entity that was used to get the
  /// credentials.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the entity that was used to get the credentials.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  /// The details of the session that was created for the credentials, including
  /// the entity that issued the session.
  @_s.JsonKey(name: 'sessionContext')
  final SessionContext sessionContext;

  FederatedUser({
    this.accessKeyId,
    this.accountId,
    this.arn,
    this.principalId,
    this.sessionContext,
  });
  factory FederatedUser.fromJson(Map<String, dynamic> json) =>
      _$FederatedUserFromJson(json);
}

/// Provides the details of a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Finding {
  /// The unique identifier for the AWS account that the finding applies to. This
  /// is typically the account that owns the affected resource.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// Specifies whether the finding is archived.
  @_s.JsonKey(name: 'archived')
  final bool archived;

  /// The category of the finding. Possible values are: CLASSIFICATION, for a
  /// sensitive data finding; and, POLICY, for a policy finding.
  @_s.JsonKey(name: 'category')
  final FindingCategory category;

  /// The details of a sensitive data finding. This value is null for a policy
  /// finding.
  @_s.JsonKey(name: 'classificationDetails')
  final ClassificationDetails classificationDetails;

  /// The total number of occurrences of the finding. For sensitive data findings,
  /// this value is always 1. All sensitive data findings are considered new
  /// (unique) because they derive from individual classification jobs.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The date and time, in UTC and extended ISO 8601 format, when the finding was
  /// created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The description of the finding.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the finding. This is a random string that Amazon
  /// Macie generates and assigns to a finding when it creates the finding.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The AWS partition that Amazon Macie created the finding in.
  @_s.JsonKey(name: 'partition')
  final String partition;

  /// The details of a policy finding. This value is null for a sensitive data
  /// finding.
  @_s.JsonKey(name: 'policyDetails')
  final PolicyDetails policyDetails;

  /// The AWS Region that Amazon Macie created the finding in.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The resources that the finding applies to.
  @_s.JsonKey(name: 'resourcesAffected')
  final ResourcesAffected resourcesAffected;

  /// Specifies whether the finding is a sample finding. A <i>sample finding</i>
  /// is a finding that uses example data to demonstrate what a finding might
  /// contain.
  @_s.JsonKey(name: 'sample')
  final bool sample;

  /// The version of the schema that was used to define the data structures in the
  /// finding.
  @_s.JsonKey(name: 'schemaVersion')
  final String schemaVersion;

  /// The severity level and score for the finding.
  @_s.JsonKey(name: 'severity')
  final Severity severity;

  /// The brief description of the finding.
  @_s.JsonKey(name: 'title')
  final String title;

  /// The type of the finding.
  @_s.JsonKey(name: 'type')
  final FindingType type;

  /// The date and time, in UTC and extended ISO 8601 format, when the finding was
  /// last updated. For sensitive data findings, this value is the same as the
  /// value for the createdAt property. All sensitive data findings are considered
  /// new (unique) because they derive from individual classification jobs.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  Finding({
    this.accountId,
    this.archived,
    this.category,
    this.classificationDetails,
    this.count,
    this.createdAt,
    this.description,
    this.id,
    this.partition,
    this.policyDetails,
    this.region,
    this.resourcesAffected,
    this.sample,
    this.schemaVersion,
    this.severity,
    this.title,
    this.type,
    this.updatedAt,
  });
  factory Finding.fromJson(Map<String, dynamic> json) =>
      _$FindingFromJson(json);
}

/// Provides information about an action that occurred for a resource and
/// produced a policy finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingAction {
  /// The type of action that occurred for the affected resource. This value is
  /// typically AWS_API_CALL, which indicates that an entity invoked an API
  /// operation for the resource.
  @_s.JsonKey(name: 'actionType')
  final FindingActionType actionType;

  /// The invocation details of the API operation that an entity invoked for the
  /// affected resource, if the value for the actionType property is AWS_API_CALL.
  @_s.JsonKey(name: 'apiCallDetails')
  final ApiCallDetails apiCallDetails;

  FindingAction({
    this.actionType,
    this.apiCallDetails,
  });
  factory FindingAction.fromJson(Map<String, dynamic> json) =>
      _$FindingActionFromJson(json);
}

/// The type of action that occurred for the resource and produced the policy
/// finding:
enum FindingActionType {
  @_s.JsonValue('AWS_API_CALL')
  awsApiCall,
}

/// Provides information about an entity that performed an action that produced
/// a policy finding for a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingActor {
  /// The domain name of the device that the entity used to perform the action on
  /// the affected resource.
  @_s.JsonKey(name: 'domainDetails')
  final DomainDetails domainDetails;

  /// The IP address of the device that the entity used to perform the action on
  /// the affected resource. This object also provides information such as the
  /// owner and geographic location for the IP address.
  @_s.JsonKey(name: 'ipAddressDetails')
  final IpAddressDetails ipAddressDetails;

  /// The type and other characteristics of the entity that performed the action
  /// on the affected resource.
  @_s.JsonKey(name: 'userIdentity')
  final UserIdentity userIdentity;

  FindingActor({
    this.domainDetails,
    this.ipAddressDetails,
    this.userIdentity,
  });
  factory FindingActor.fromJson(Map<String, dynamic> json) =>
      _$FindingActorFromJson(json);
}

/// The category of the finding. Valid values are:
enum FindingCategory {
  @_s.JsonValue('CLASSIFICATION')
  classification,
  @_s.JsonValue('POLICY')
  policy,
}

/// Specifies, as a map, one or more property-based conditions that filter the
/// results of a query for findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FindingCriteria {
  /// A condition that specifies the property, operator, and one or more values to
  /// use to filter the results.
  @_s.JsonKey(name: 'criterion')
  final Map<String, CriterionAdditionalProperties> criterion;

  FindingCriteria({
    this.criterion,
  });
  factory FindingCriteria.fromJson(Map<String, dynamic> json) =>
      _$FindingCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$FindingCriteriaToJson(this);
}

/// The frequency with which Amazon Macie publishes updates to policy findings
/// for an account. This includes publishing updates to AWS Security Hub and
/// Amazon EventBridge (formerly called Amazon CloudWatch Events). Valid values
/// are:
enum FindingPublishingFrequency {
  @_s.JsonValue('FIFTEEN_MINUTES')
  fifteenMinutes,
  @_s.JsonValue('ONE_HOUR')
  oneHour,
  @_s.JsonValue('SIX_HOURS')
  sixHours,
}

extension on FindingPublishingFrequency {
  String toValue() {
    switch (this) {
      case FindingPublishingFrequency.fifteenMinutes:
        return 'FIFTEEN_MINUTES';
      case FindingPublishingFrequency.oneHour:
        return 'ONE_HOUR';
      case FindingPublishingFrequency.sixHours:
        return 'SIX_HOURS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The grouping to sort the results by. Valid values are:
enum FindingStatisticsSortAttributeName {
  @_s.JsonValue('groupKey')
  groupKey,
  @_s.JsonValue('count')
  count,
}

/// Specifies criteria for sorting the results of a query that retrieves
/// aggregated statistical data about findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FindingStatisticsSortCriteria {
  /// The grouping to sort the results by. Valid values are: count, sort the
  /// results by the number of findings in each group of results; and, groupKey,
  /// sort the results by the name of each group of results.
  @_s.JsonKey(name: 'attributeName')
  final FindingStatisticsSortAttributeName attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  @_s.JsonKey(name: 'orderBy')
  final OrderBy orderBy;

  FindingStatisticsSortCriteria({
    this.attributeName,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => _$FindingStatisticsSortCriteriaToJson(this);
}

/// The type of finding. For details about each type, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/findings-types.html">Types
/// of Amazon Macie findings</a> in the <i>Amazon Macie User Guide</i>. Valid
/// values are:
enum FindingType {
  @_s.JsonValue('SensitiveData:S3Object/Multiple')
  sensitiveDataS3ObjectMultiple,
  @_s.JsonValue('SensitiveData:S3Object/Financial')
  sensitiveDataS3ObjectFinancial,
  @_s.JsonValue('SensitiveData:S3Object/Personal')
  sensitiveDataS3ObjectPersonal,
  @_s.JsonValue('SensitiveData:S3Object/Credentials')
  sensitiveDataS3ObjectCredentials,
  @_s.JsonValue('SensitiveData:S3Object/CustomIdentifier')
  sensitiveDataS3ObjectCustomIdentifier,
  @_s.JsonValue('Policy:IAMUser/S3BucketPublic')
  policyIAMUserS3BucketPublic,
  @_s.JsonValue('Policy:IAMUser/S3BucketSharedExternally')
  policyIAMUserS3BucketSharedExternally,
  @_s.JsonValue('Policy:IAMUser/S3BucketReplicatedExternally')
  policyIAMUserS3BucketReplicatedExternally,
  @_s.JsonValue('Policy:IAMUser/S3BucketEncryptionDisabled')
  policyIAMUserS3BucketEncryptionDisabled,
  @_s.JsonValue('Policy:IAMUser/S3BlockPublicAccessDisabled')
  policyIAMUserS3BlockPublicAccessDisabled,
}

extension on FindingType {
  String toValue() {
    switch (this) {
      case FindingType.sensitiveDataS3ObjectMultiple:
        return 'SensitiveData:S3Object/Multiple';
      case FindingType.sensitiveDataS3ObjectFinancial:
        return 'SensitiveData:S3Object/Financial';
      case FindingType.sensitiveDataS3ObjectPersonal:
        return 'SensitiveData:S3Object/Personal';
      case FindingType.sensitiveDataS3ObjectCredentials:
        return 'SensitiveData:S3Object/Credentials';
      case FindingType.sensitiveDataS3ObjectCustomIdentifier:
        return 'SensitiveData:S3Object/CustomIdentifier';
      case FindingType.policyIAMUserS3BucketPublic:
        return 'Policy:IAMUser/S3BucketPublic';
      case FindingType.policyIAMUserS3BucketSharedExternally:
        return 'Policy:IAMUser/S3BucketSharedExternally';
      case FindingType.policyIAMUserS3BucketReplicatedExternally:
        return 'Policy:IAMUser/S3BucketReplicatedExternally';
      case FindingType.policyIAMUserS3BucketEncryptionDisabled:
        return 'Policy:IAMUser/S3BucketEncryptionDisabled';
      case FindingType.policyIAMUserS3BlockPublicAccessDisabled:
        return 'Policy:IAMUser/S3BlockPublicAccessDisabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The action to perform on findings that meet the filter criteria. To suppress
/// (automatically archive) findings that meet the criteria, set this value to
/// ARCHIVE. Valid values are:
enum FindingsFilterAction {
  @_s.JsonValue('ARCHIVE')
  archive,
  @_s.JsonValue('NOOP')
  noop,
}

extension on FindingsFilterAction {
  String toValue() {
    switch (this) {
      case FindingsFilterAction.archive:
        return 'ARCHIVE';
      case FindingsFilterAction.noop:
        return 'NOOP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides information about a findings filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingsFilterListItem {
  /// The action that's performed on findings that meet the filter criteria.
  /// Possible values are: ARCHIVE, suppress (automatically archive) the findings;
  /// and, NOOP, don't perform any action on the findings.
  @_s.JsonKey(name: 'action')
  final FindingsFilterAction action;

  /// The Amazon Resource Name (ARN) of the filter.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the filter.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The custom name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the filter.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  FindingsFilterListItem({
    this.action,
    this.arn,
    this.id,
    this.name,
    this.tags,
  });
  factory FindingsFilterListItem.fromJson(Map<String, dynamic> json) =>
      _$FindingsFilterListItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBucketStatisticsResponse {
  /// The total number of buckets.
  @_s.JsonKey(name: 'bucketCount')
  final int bucketCount;

  /// The total number of buckets that are publicly accessible based on a
  /// combination of permissions settings for each bucket.
  @_s.JsonKey(name: 'bucketCountByEffectivePermission')
  final BucketCountByEffectivePermission bucketCountByEffectivePermission;

  /// The total number of buckets, grouped by server-side encryption type. This
  /// object also reports the total number of buckets that don't encrypt objects
  /// by default.
  @_s.JsonKey(name: 'bucketCountByEncryptionType')
  final BucketCountByEncryptionType bucketCountByEncryptionType;

  /// The total number of buckets that are shared with another AWS account.
  @_s.JsonKey(name: 'bucketCountBySharedAccessType')
  final BucketCountBySharedAccessType bucketCountBySharedAccessType;

  /// The total number of objects that Amazon Macie can analyze in the buckets.
  /// These objects use a supported storage class and have a file name extension
  /// for a supported file or storage format.
  @_s.JsonKey(name: 'classifiableObjectCount')
  final int classifiableObjectCount;

  /// The total storage size, in bytes, of all the objects that Amazon Macie can
  /// analyze in the buckets. These objects use a supported storage class and have
  /// a file name extension for a supported file or storage format.
  @_s.JsonKey(name: 'classifiableSizeInBytes')
  final int classifiableSizeInBytes;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently retrieved data about the buckets from Amazon S3.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// The total number of objects in the buckets.
  @_s.JsonKey(name: 'objectCount')
  final int objectCount;

  /// The total storage size, in bytes, of the buckets.
  @_s.JsonKey(name: 'sizeInBytes')
  final int sizeInBytes;

  /// The total compressed storage size, in bytes, of the buckets.
  @_s.JsonKey(name: 'sizeInBytesCompressed')
  final int sizeInBytesCompressed;

  /// The total number of objects that Amazon Macie can't analyze in the buckets.
  /// These objects don't use a supported storage class or don't have a file name
  /// extension for a supported file or storage format.
  @_s.JsonKey(name: 'unclassifiableObjectCount')
  final ObjectLevelStatistics unclassifiableObjectCount;

  /// The total storage size, in bytes, of all the objects that Amazon Macie can't
  /// analyze in the buckets. These objects don't use a supported storage class or
  /// don't have a file name extension for a supported file or storage format.
  @_s.JsonKey(name: 'unclassifiableObjectSizeInBytes')
  final ObjectLevelStatistics unclassifiableObjectSizeInBytes;

  GetBucketStatisticsResponse({
    this.bucketCount,
    this.bucketCountByEffectivePermission,
    this.bucketCountByEncryptionType,
    this.bucketCountBySharedAccessType,
    this.classifiableObjectCount,
    this.classifiableSizeInBytes,
    this.lastUpdated,
    this.objectCount,
    this.sizeInBytes,
    this.sizeInBytesCompressed,
    this.unclassifiableObjectCount,
    this.unclassifiableObjectSizeInBytes,
  });
  factory GetBucketStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBucketStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetClassificationExportConfigurationResponse {
  /// The location where data classification results are stored, and the
  /// encryption settings that are used when storing results in that location.
  @_s.JsonKey(name: 'configuration')
  final ClassificationExportConfiguration configuration;

  GetClassificationExportConfigurationResponse({
    this.configuration,
  });
  factory GetClassificationExportConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetClassificationExportConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCustomDataIdentifierResponse {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the custom data
  /// identifier was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Specifies whether the custom data identifier was deleted. If you delete a
  /// custom data identifier, Amazon Macie doesn't delete it permanently. Instead,
  /// it soft deletes the identifier.
  @_s.JsonKey(name: 'deleted')
  final bool deleted;

  /// The custom description of the custom data identifier.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the custom data identifier.
  @_s.JsonKey(name: 'id')
  final String id;

  /// An array that lists specific character sequences (ignore words) to exclude
  /// from the results. If the text matched by the regular expression is the same
  /// as any string in this array, Amazon Macie ignores it. Ignore words are case
  /// sensitive.
  @_s.JsonKey(name: 'ignoreWords')
  final List<String> ignoreWords;

  /// An array that lists specific character sequences (keywords), one of which
  /// must be within proximity (maximumMatchDistance) of the regular expression to
  /// match. Keywords aren't case sensitive.
  @_s.JsonKey(name: 'keywords')
  final List<String> keywords;

  /// The maximum number of characters that can exist between text that matches
  /// the regex pattern and the character sequences specified by the keywords
  /// array. Macie includes or excludes a result based on the proximity of a
  /// keyword to text that matches the regex pattern.
  @_s.JsonKey(name: 'maximumMatchDistance')
  final int maximumMatchDistance;

  /// The custom name of the custom data identifier.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The regular expression (<i>regex</i>) that defines the pattern to match.
  @_s.JsonKey(name: 'regex')
  final String regex;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the custom data identifier.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetCustomDataIdentifierResponse({
    this.arn,
    this.createdAt,
    this.deleted,
    this.description,
    this.id,
    this.ignoreWords,
    this.keywords,
    this.maximumMatchDistance,
    this.name,
    this.regex,
    this.tags,
  });
  factory GetCustomDataIdentifierResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCustomDataIdentifierResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingStatisticsResponse {
  /// An array of objects, one for each group of findings that meet the filter
  /// criteria specified in the request.
  @_s.JsonKey(name: 'countsByGroup')
  final List<GroupCount> countsByGroup;

  GetFindingStatisticsResponse({
    this.countsByGroup,
  });
  factory GetFindingStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFindingStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingsFilterResponse {
  /// The action that's performed on findings that meet the filter criteria
  /// (findingCriteria). Possible values are: ARCHIVE, suppress (automatically
  /// archive) the findings; and, NOOP, don't perform any action on the findings.
  @_s.JsonKey(name: 'action')
  final FindingsFilterAction action;

  /// The Amazon Resource Name (ARN) of the filter.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The custom description of the filter.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The criteria that's used to filter findings.
  @_s.JsonKey(name: 'findingCriteria')
  final FindingCriteria findingCriteria;

  /// The unique identifier for the filter.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The custom name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The position of the filter in the list of saved filters on the Amazon Macie
  /// console. This value also determines the order in which the filter is applied
  /// to findings, relative to other filters that are also applied to the
  /// findings.
  @_s.JsonKey(name: 'position')
  final int position;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the filter.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetFindingsFilterResponse({
    this.action,
    this.arn,
    this.description,
    this.findingCriteria,
    this.id,
    this.name,
    this.position,
    this.tags,
  });
  factory GetFindingsFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFindingsFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingsResponse {
  /// An array of objects, one for each finding that meets the criteria specified
  /// in the request.
  @_s.JsonKey(name: 'findings')
  final List<Finding> findings;

  GetFindingsResponse({
    this.findings,
  });
  factory GetFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInvitationsCountResponse {
  /// The total number of invitations that were received by the account, not
  /// including the currently accepted invitation.
  @_s.JsonKey(name: 'invitationsCount')
  final int invitationsCount;

  GetInvitationsCountResponse({
    this.invitationsCount,
  });
  factory GetInvitationsCountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInvitationsCountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMacieSessionResponse {
  /// The date and time, in UTC and extended ISO 8601 format, when the Amazon
  /// Macie account was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The frequency with which Amazon Macie publishes updates to policy findings
  /// for the account. This includes publishing updates to AWS Security Hub and
  /// Amazon EventBridge (formerly called Amazon CloudWatch Events).
  @_s.JsonKey(name: 'findingPublishingFrequency')
  final FindingPublishingFrequency findingPublishingFrequency;

  /// The Amazon Resource Name (ARN) of the service-linked role that allows Amazon
  /// Macie to monitor and analyze data in AWS resources for the account.
  @_s.JsonKey(name: 'serviceRole')
  final String serviceRole;

  /// The current status of the Amazon Macie account. Possible values are: PAUSED,
  /// the account is enabled but all Amazon Macie activities are suspended
  /// (paused) for the account; and, ENABLED, the account is enabled and all
  /// Amazon Macie activities are enabled for the account.
  @_s.JsonKey(name: 'status')
  final MacieStatus status;

  /// The date and time, in UTC and extended ISO 8601 format, of the most recent
  /// change to the status of the Amazon Macie account.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  GetMacieSessionResponse({
    this.createdAt,
    this.findingPublishingFrequency,
    this.serviceRole,
    this.status,
    this.updatedAt,
  });
  factory GetMacieSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMacieSessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMasterAccountResponse {
  /// The AWS account ID for the master account. If the accounts are associated by
  /// a Macie membership invitation, this object also provides details about the
  /// invitation that was sent and accepted to establish the relationship between
  /// the accounts.
  @_s.JsonKey(name: 'master')
  final Invitation master;

  GetMasterAccountResponse({
    this.master,
  });
  factory GetMasterAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMasterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMemberResponse {
  /// The AWS account ID for the account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the account.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The email address for the account.
  @_s.JsonKey(name: 'email')
  final String email;

  /// The date and time, in UTC and extended ISO 8601 format, when an Amazon Macie
  /// membership invitation was last sent to the account. This value is null if a
  /// Macie invitation hasn't been sent to the account.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'invitedAt')
  final DateTime invitedAt;

  /// The AWS account ID for the master account.
  @_s.JsonKey(name: 'masterAccountId')
  final String masterAccountId;

  /// The current status of the relationship between the account and the master
  /// account.
  @_s.JsonKey(name: 'relationshipStatus')
  final RelationshipStatus relationshipStatus;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the member account in Amazon Macie.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The date and time, in UTC and extended ISO 8601 format, of the most recent
  /// change to the status of the relationship between the account and the master
  /// account.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  GetMemberResponse({
    this.accountId,
    this.arn,
    this.email,
    this.invitedAt,
    this.masterAccountId,
    this.relationshipStatus,
    this.tags,
    this.updatedAt,
  });
  factory GetMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUsageStatisticsResponse {
  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// An array of objects that contains the results of the query. Each object
  /// contains the data for an account that meets the filter criteria specified in
  /// the request.
  @_s.JsonKey(name: 'records')
  final List<UsageRecord> records;

  GetUsageStatisticsResponse({
    this.nextToken,
    this.records,
  });
  factory GetUsageStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsageStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUsageTotalsResponse {
  /// An array of objects that contains the results of the query. Each object
  /// contains the data for a specific usage metric.
  @_s.JsonKey(name: 'usageTotals')
  final List<UsageTotal> usageTotals;

  GetUsageTotalsResponse({
    this.usageTotals,
  });
  factory GetUsageTotalsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsageTotalsResponseFromJson(json);
}

enum GroupBy {
  @_s.JsonValue('resourcesAffected.s3Bucket.name')
  resourcesAffectedS3BucketName,
  @_s.JsonValue('type')
  type,
  @_s.JsonValue('classificationDetails.jobId')
  classificationDetailsJobId,
  @_s.JsonValue('severity.description')
  severityDescription,
}

extension on GroupBy {
  String toValue() {
    switch (this) {
      case GroupBy.resourcesAffectedS3BucketName:
        return 'resourcesAffected.s3Bucket.name';
      case GroupBy.type:
        return 'type';
      case GroupBy.classificationDetailsJobId:
        return 'classificationDetails.jobId';
      case GroupBy.severityDescription:
        return 'severity.description';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides a group of results for a query that retrieved aggregated
/// statistical data about findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupCount {
  /// The total number of findings in the group of query results.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The name of the property that defines the group in the query results, as
  /// specified by the groupBy property in the query request.
  @_s.JsonKey(name: 'groupKey')
  final String groupKey;

  GroupCount({
    this.count,
    this.groupKey,
  });
  factory GroupCount.fromJson(Map<String, dynamic> json) =>
      _$GroupCountFromJson(json);
}

/// Provides information about an AWS Identity and Access Management (IAM) user
/// who performed an action on an affected resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IamUser {
  /// The unique identifier for the AWS account that's associated with the IAM
  /// user who performed the action.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the principal that performed the action.
  /// The last section of the ARN contains the name of the user who performed the
  /// action.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the IAM user who performed the action.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  /// The user name of the IAM user who performed the action.
  @_s.JsonKey(name: 'userName')
  final String userName;

  IamUser({
    this.accountId,
    this.arn,
    this.principalId,
    this.userName,
  });
  factory IamUser.fromJson(Map<String, dynamic> json) =>
      _$IamUserFromJson(json);
}

/// Provides information about an Amazon Macie membership invitation that was
/// received by an account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Invitation {
  /// The AWS account ID for the account that sent the invitation.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The unique identifier for the invitation. Amazon Macie uses this identifier
  /// to validate the inviter account with the invitee account.
  @_s.JsonKey(name: 'invitationId')
  final String invitationId;

  /// The date and time, in UTC and extended ISO 8601 format, when the invitation
  /// was sent.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'invitedAt')
  final DateTime invitedAt;

  /// The status of the relationship between the account that sent the invitation
  /// (<i>inviter account</i>) and the account that received the invitation
  /// (<i>invitee account</i>).
  @_s.JsonKey(name: 'relationshipStatus')
  final RelationshipStatus relationshipStatus;

  Invitation({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.relationshipStatus,
  });
  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}

/// Provides information about the IP address of the device that an entity used
/// to perform an action on an affected resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpAddressDetails {
  /// The Internet Protocol version 4 (IPv4) address of the device.
  @_s.JsonKey(name: 'ipAddressV4')
  final String ipAddressV4;

  /// The city that the IP address originated from.
  @_s.JsonKey(name: 'ipCity')
  final IpCity ipCity;

  /// The country that the IP address originated from.
  @_s.JsonKey(name: 'ipCountry')
  final IpCountry ipCountry;

  /// The geographic coordinates of the location that the IP address originated
  /// from.
  @_s.JsonKey(name: 'ipGeoLocation')
  final IpGeoLocation ipGeoLocation;

  /// The registered owner of the IP address.
  @_s.JsonKey(name: 'ipOwner')
  final IpOwner ipOwner;

  IpAddressDetails({
    this.ipAddressV4,
    this.ipCity,
    this.ipCountry,
    this.ipGeoLocation,
    this.ipOwner,
  });
  factory IpAddressDetails.fromJson(Map<String, dynamic> json) =>
      _$IpAddressDetailsFromJson(json);
}

/// Provides information about the city that an IP address originated from.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpCity {
  /// The name of the city.
  @_s.JsonKey(name: 'name')
  final String name;

  IpCity({
    this.name,
  });
  factory IpCity.fromJson(Map<String, dynamic> json) => _$IpCityFromJson(json);
}

/// Provides information about the country that an IP address originated from.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpCountry {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country that
  /// the IP address originated from. For example, US for the United States.
  @_s.JsonKey(name: 'code')
  final String code;

  /// The name of the country that the IP address originated from.
  @_s.JsonKey(name: 'name')
  final String name;

  IpCountry({
    this.code,
    this.name,
  });
  factory IpCountry.fromJson(Map<String, dynamic> json) =>
      _$IpCountryFromJson(json);
}

/// Provides geographic coordinates that indicate where a specified IP address
/// originated from.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpGeoLocation {
  /// The latitude coordinate of the location, rounded to four decimal places.
  @_s.JsonKey(name: 'lat')
  final double lat;

  /// The longitude coordinate of the location, rounded to four decimal places.
  @_s.JsonKey(name: 'lon')
  final double lon;

  IpGeoLocation({
    this.lat,
    this.lon,
  });
  factory IpGeoLocation.fromJson(Map<String, dynamic> json) =>
      _$IpGeoLocationFromJson(json);
}

/// Provides information about the registered owner of an IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IpOwner {
  /// The autonomous system number (ASN) for the autonomous system that included
  /// the IP address.
  @_s.JsonKey(name: 'asn')
  final String asn;

  /// The organization identifier that's associated with the autonomous system
  /// number (ASN) for the autonomous system that included the IP address.
  @_s.JsonKey(name: 'asnOrg')
  final String asnOrg;

  /// The name of the internet service provider (ISP) that owned the IP address.
  @_s.JsonKey(name: 'isp')
  final String isp;

  /// The name of the organization that owned the IP address.
  @_s.JsonKey(name: 'org')
  final String org;

  IpOwner({
    this.asn,
    this.asnOrg,
    this.isp,
    this.org,
  });
  factory IpOwner.fromJson(Map<String, dynamic> json) =>
      _$IpOwnerFromJson(json);
}

enum IsDefinedInJob {
  @_s.JsonValue('TRUE')
  $true,
  @_s.JsonValue('FALSE')
  $false,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

enum IsMonitoredByJob {
  @_s.JsonValue('TRUE')
  $true,
  @_s.JsonValue('FALSE')
  $false,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

/// The operator to use in a condition. Valid values are:
enum JobComparator {
  @_s.JsonValue('EQ')
  eq,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('GTE')
  gte,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('LTE')
  lte,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('CONTAINS')
  contains,
}

/// Specifies whether any one-time or recurring classification jobs are
/// configured to analyze data in an S3 bucket, and, if so, the details of the
/// job that ran most recently.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobDetails {
  /// Specifies whether any one-time or recurring jobs are configured to analyze
  /// data in the bucket. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// TRUE - One or more jobs is configured to analyze data in the bucket, and at
  /// least one of those jobs has a status other than CANCELLED.
  /// </li>
  /// <li>
  /// FALSE - No jobs are configured to analyze data in the bucket, or all the
  /// jobs that are configured to analyze data in the bucket have a status of
  /// CANCELLED.
  /// </li>
  /// <li>
  /// UNKNOWN - An exception occurred when Amazon Macie attempted to retrieve job
  /// data for the bucket.
  /// </li>
  /// </ul>
  ///
  @_s.JsonKey(name: 'isDefinedInJob')
  final IsDefinedInJob isDefinedInJob;

  /// Specifies whether any recurring jobs are configured to analyze data in the
  /// bucket. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// TRUE - One or more recurring jobs is configured to analyze data in the
  /// bucket, and at least one of those jobs has a status other than CANCELLED.
  /// </li>
  /// <li>
  /// FALSE - No recurring jobs are configured to analyze data in the bucket, or
  /// all the recurring jobs that are configured to analyze data in the bucket
  /// have a status of CANCELLED.
  /// </li>
  /// <li>
  /// UNKNOWN - An exception occurred when Amazon Macie attempted to retrieve job
  /// data for the bucket.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'isMonitoredByJob')
  final IsMonitoredByJob isMonitoredByJob;

  /// The unique identifier for the job that ran most recently (either the latest
  /// run of a recurring job or the only run of a one-time job) and is configured
  /// to analyze data in the bucket.
  ///
  /// This value is null if the value for the isDefinedInJob property is FALSE or
  /// UNKNOWN.
  @_s.JsonKey(name: 'lastJobId')
  final String lastJobId;

  /// The date and time, in UTC and extended ISO 8601 format, when the job
  /// (lastJobId) started. If the job is a recurring job, this value indicates
  /// when the most recent run started.
  ///
  /// This value is null if the value for the isDefinedInJob property is FALSE or
  /// UNKNOWN.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastJobRunTime')
  final DateTime lastJobRunTime;

  JobDetails({
    this.isDefinedInJob,
    this.isMonitoredByJob,
    this.lastJobId,
    this.lastJobRunTime,
  });
  factory JobDetails.fromJson(Map<String, dynamic> json) =>
      _$JobDetailsFromJson(json);
}

/// Specifies the recurrence pattern for running a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobScheduleFrequency {
  /// Specifies a daily recurrence pattern for running the job.
  @_s.JsonKey(name: 'dailySchedule')
  final DailySchedule dailySchedule;

  /// Specifies a monthly recurrence pattern for running the job.
  @_s.JsonKey(name: 'monthlySchedule')
  final MonthlySchedule monthlySchedule;

  /// Specifies a weekly recurrence pattern for running the job.
  @_s.JsonKey(name: 'weeklySchedule')
  final WeeklySchedule weeklySchedule;

  JobScheduleFrequency({
    this.dailySchedule,
    this.monthlySchedule,
    this.weeklySchedule,
  });
  factory JobScheduleFrequency.fromJson(Map<String, dynamic> json) =>
      _$JobScheduleFrequencyFromJson(json);

  Map<String, dynamic> toJson() => _$JobScheduleFrequencyToJson(this);
}

/// Specifies a property- or tag-based condition that defines criteria for
/// including or excluding objects from a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobScopeTerm {
  /// A property-based condition that defines a property, operator, and one or
  /// more values for including or excluding an object from the job.
  @_s.JsonKey(name: 'simpleScopeTerm')
  final SimpleScopeTerm simpleScopeTerm;

  /// A tag-based condition that defines the operator and tag keys or tag key and
  /// value pairs for including or excluding an object from the job.
  @_s.JsonKey(name: 'tagScopeTerm')
  final TagScopeTerm tagScopeTerm;

  JobScopeTerm({
    this.simpleScopeTerm,
    this.tagScopeTerm,
  });
  factory JobScopeTerm.fromJson(Map<String, dynamic> json) =>
      _$JobScopeTermFromJson(json);

  Map<String, dynamic> toJson() => _$JobScopeTermToJson(this);
}

/// Specifies one or more property- and tag-based conditions that define
/// criteria for including or excluding objects from a classification job. If
/// you specify more than one condition, Amazon Macie uses an AND operator to
/// join the conditions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobScopingBlock {
  /// An array of conditions, one for each condition that determines which objects
  /// to include or exclude from the job.
  @_s.JsonKey(name: 'and')
  final List<JobScopeTerm> and;

  JobScopingBlock({
    this.and,
  });
  factory JobScopingBlock.fromJson(Map<String, dynamic> json) =>
      _$JobScopingBlockFromJson(json);

  Map<String, dynamic> toJson() => _$JobScopingBlockToJson(this);
}

/// The status of a classification job. Possible values are:
enum JobStatus {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('PAUSED')
  paused,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('IDLE')
  idle,
  @_s.JsonValue('USER_PAUSED')
  userPaused,
}

extension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.running:
        return 'RUNNING';
      case JobStatus.paused:
        return 'PAUSED';
      case JobStatus.cancelled:
        return 'CANCELLED';
      case JobStatus.complete:
        return 'COMPLETE';
      case JobStatus.idle:
        return 'IDLE';
      case JobStatus.userPaused:
        return 'USER_PAUSED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides information about a classification job, including the current
/// status of the job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobSummary {
  /// The S3 buckets that the job is configured to analyze.
  @_s.JsonKey(name: 'bucketDefinitions')
  final List<S3BucketDefinitionForJob> bucketDefinitions;

  /// The date and time, in UTC and extended ISO 8601 format, when the job was
  /// created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The unique identifier for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The current status of the job. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// CANCELLED - You cancelled the job or, if it's a one-time job, you paused the
  /// job and didn't resume it within 30 days.
  /// </li>
  /// <li>
  /// COMPLETE - For a one-time job, Amazon Macie finished processing the data
  /// specified for the job. This value doesn't apply to recurring jobs.
  /// </li>
  /// <li>
  /// IDLE - For a recurring job, the previous scheduled run is complete and the
  /// next scheduled run is pending. This value doesn't apply to one-time jobs.
  /// </li>
  /// <li>
  /// PAUSED - Amazon Macie started running the job but additional processing
  /// would exceed the monthly sensitive data discovery quota for your account or
  /// one or more member accounts that the job analyzes data for.
  /// </li>
  /// <li>
  /// RUNNING - For a one-time job, the job is in progress. For a recurring job, a
  /// scheduled run is in progress.
  /// </li>
  /// <li>
  /// USER_PAUSED - You paused the job. If you paused the job while it had a
  /// status of RUNNING and you don't resume it within 30 days of pausing it, the
  /// job or job run will expire and be cancelled, depending on the job's type. To
  /// check the expiration date, refer to the UserPausedDetails.jobExpiresAt
  /// property.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'jobStatus')
  final JobStatus jobStatus;

  /// The schedule for running the job. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// ONE_TIME - The job runs only once.
  /// </li>
  /// <li>
  /// SCHEDULED - The job runs on a daily, weekly, or monthly basis.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'jobType')
  final JobType jobType;

  /// Specifies whether any account- or bucket-level access errors occurred when
  /// the job ran. For a recurring job, this value indicates the error status of
  /// the job's most recent run.
  @_s.JsonKey(name: 'lastRunErrorStatus')
  final LastRunErrorStatus lastRunErrorStatus;

  /// The custom name of the job.
  @_s.JsonKey(name: 'name')
  final String name;

  /// If the current status of the job is USER_PAUSED, specifies when the job was
  /// paused and when the job or job run will expire and be cancelled if it isn't
  /// resumed. This value is present only if the value for jobStatus is
  /// USER_PAUSED.
  @_s.JsonKey(name: 'userPausedDetails')
  final UserPausedDetails userPausedDetails;

  JobSummary({
    this.bucketDefinitions,
    this.createdAt,
    this.jobId,
    this.jobStatus,
    this.jobType,
    this.lastRunErrorStatus,
    this.name,
    this.userPausedDetails,
  });
  factory JobSummary.fromJson(Map<String, dynamic> json) =>
      _$JobSummaryFromJson(json);
}

/// The schedule for running a classification job. Valid values are:
enum JobType {
  @_s.JsonValue('ONE_TIME')
  oneTime,
  @_s.JsonValue('SCHEDULED')
  scheduled,
}

extension on JobType {
  String toValue() {
    switch (this) {
      case JobType.oneTime:
        return 'ONE_TIME';
      case JobType.scheduled:
        return 'SCHEDULED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides information about the tags that are associated with an S3 bucket or
/// object. Each tag consists of a required tag key and an associated tag value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeyValuePair {
  /// One part of a key-value pair that comprises a tag. A tag key is a general
  /// label that acts as a category for more specific tag values.
  @_s.JsonKey(name: 'key')
  final String key;

  /// One part of a key-value pair that comprises a tag. A tag value acts as a
  /// descriptor for a tag key. A tag value can be an empty string.
  @_s.JsonKey(name: 'value')
  final String value;

  KeyValuePair({
    this.key,
    this.value,
  });
  factory KeyValuePair.fromJson(Map<String, dynamic> json) =>
      _$KeyValuePairFromJson(json);
}

/// Specifies whether any account- or bucket-level access errors occurred when a
/// classification job ran. For example, the job is configured to analyze data
/// for a member account that was suspended, or the job is configured to analyze
/// an S3 bucket that Amazon Macie isn't allowed to access.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LastRunErrorStatus {
  /// Specifies whether any account- or bucket-level access errors occurred when
  /// the job ran. For a recurring job, this value indicates the error status of
  /// the job's most recent run. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// ERROR - One or more errors occurred. Amazon Macie didn't process all the
  /// data specified for the job.
  /// </li>
  /// <li>
  /// NONE - No errors occurred. Macie processed all the data specified for the
  /// job.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'code')
  final LastRunErrorStatusCode code;

  LastRunErrorStatus({
    this.code,
  });
  factory LastRunErrorStatus.fromJson(Map<String, dynamic> json) =>
      _$LastRunErrorStatusFromJson(json);
}

/// Specifies whether any account- or bucket-level access errors occurred during
/// the run of a one-time classification job or the most recent run of a
/// recurring classification job. Possible values are:
enum LastRunErrorStatusCode {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('ERROR')
  error,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListClassificationJobsResponse {
  /// An array of objects, one for each job that meets the filter criteria
  /// specified in the request.
  @_s.JsonKey(name: 'items')
  final List<JobSummary> items;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListClassificationJobsResponse({
    this.items,
    this.nextToken,
  });
  factory ListClassificationJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListClassificationJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCustomDataIdentifiersResponse {
  /// An array of objects, one for each custom data identifier.
  @_s.JsonKey(name: 'items')
  final List<CustomDataIdentifierSummary> items;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListCustomDataIdentifiersResponse({
    this.items,
    this.nextToken,
  });
  factory ListCustomDataIdentifiersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCustomDataIdentifiersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFindingsFiltersResponse {
  /// An array of objects, one for each filter that's associated with the account.
  @_s.JsonKey(name: 'findingsFilterListItems')
  final List<FindingsFilterListItem> findingsFilterListItems;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFindingsFiltersResponse({
    this.findingsFilterListItems,
    this.nextToken,
  });
  factory ListFindingsFiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFindingsFiltersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFindingsResponse {
  /// An array of strings, where each string is the unique identifier for a
  /// finding that meets the filter criteria specified in the request.
  @_s.JsonKey(name: 'findingIds')
  final List<String> findingIds;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFindingsResponse({
    this.findingIds,
    this.nextToken,
  });
  factory ListFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInvitationsResponse {
  /// An array of objects, one for each invitation that was received by the
  /// account.
  @_s.JsonKey(name: 'invitations')
  final List<Invitation> invitations;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });
  factory ListInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInvitationsResponseFromJson(json);
}

/// Specifies criteria for filtering the results of a request for information
/// about classification jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListJobsFilterCriteria {
  /// An array of objects, one for each condition that determines which jobs to
  /// exclude from the results.
  @_s.JsonKey(name: 'excludes')
  final List<ListJobsFilterTerm> excludes;

  /// An array of objects, one for each condition that determines which jobs to
  /// include in the results.
  @_s.JsonKey(name: 'includes')
  final List<ListJobsFilterTerm> includes;

  ListJobsFilterCriteria({
    this.excludes,
    this.includes,
  });
  Map<String, dynamic> toJson() => _$ListJobsFilterCriteriaToJson(this);
}

/// The property to use to filter the results. Valid values are:
enum ListJobsFilterKey {
  @_s.JsonValue('jobType')
  jobType,
  @_s.JsonValue('jobStatus')
  jobStatus,
  @_s.JsonValue('createdAt')
  createdAt,
  @_s.JsonValue('name')
  name,
}

/// Specifies a condition that filters the results of a request for information
/// about classification jobs. Each condition consists of a property, an
/// operator, and one or more values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListJobsFilterTerm {
  /// The operator to use to filter the results.
  @_s.JsonKey(name: 'comparator')
  final JobComparator comparator;

  /// The property to use to filter the results.
  @_s.JsonKey(name: 'key')
  final ListJobsFilterKey key;

  /// An array that lists one or more values to use to filter the results.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  ListJobsFilterTerm({
    this.comparator,
    this.key,
    this.values,
  });
  Map<String, dynamic> toJson() => _$ListJobsFilterTermToJson(this);
}

/// The property to sort the results by. Valid values are:
enum ListJobsSortAttributeName {
  @_s.JsonValue('createdAt')
  createdAt,
  @_s.JsonValue('jobStatus')
  jobStatus,
  @_s.JsonValue('name')
  name,
  @_s.JsonValue('jobType')
  jobType,
}

/// Specifies criteria for sorting the results of a request for information
/// about classification jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListJobsSortCriteria {
  /// The property to sort the results by.
  @_s.JsonKey(name: 'attributeName')
  final ListJobsSortAttributeName attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  @_s.JsonKey(name: 'orderBy')
  final OrderBy orderBy;

  ListJobsSortCriteria({
    this.attributeName,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => _$ListJobsSortCriteriaToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMembersResponse {
  /// An array of objects, one for each account that's associated with the master
  /// account and meets the criteria specified by the onlyAssociated request
  /// parameter.
  @_s.JsonKey(name: 'members')
  final List<Member> members;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });
  factory ListMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOrganizationAdminAccountsResponse {
  /// An array of objects, one for each delegated Amazon Macie administrator
  /// account for the organization. Only one of these accounts can have a status
  /// of ENABLED.
  @_s.JsonKey(name: 'adminAccounts')
  final List<AdminAccount> adminAccounts;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListOrganizationAdminAccountsResponse({
    this.adminAccounts,
    this.nextToken,
  });
  factory ListOrganizationAdminAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListOrganizationAdminAccountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// The status of an Amazon Macie account. Valid values are:
enum MacieStatus {
  @_s.JsonValue('PAUSED')
  paused,
  @_s.JsonValue('ENABLED')
  enabled,
}

extension on MacieStatus {
  String toValue() {
    switch (this) {
      case MacieStatus.paused:
        return 'PAUSED';
      case MacieStatus.enabled:
        return 'ENABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides information about an account that's associated with an Amazon Macie
/// master account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Member {
  /// The AWS account ID for the account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the account.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The email address for the account.
  @_s.JsonKey(name: 'email')
  final String email;

  /// The date and time, in UTC and extended ISO 8601 format, when an Amazon Macie
  /// membership invitation was last sent to the account. This value is null if a
  /// Macie invitation hasn't been sent to the account.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'invitedAt')
  final DateTime invitedAt;

  /// The AWS account ID for the master account.
  @_s.JsonKey(name: 'masterAccountId')
  final String masterAccountId;

  /// The current status of the relationship between the account and the master
  /// account.
  @_s.JsonKey(name: 'relationshipStatus')
  final RelationshipStatus relationshipStatus;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the account in Amazon Macie.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The date and time, in UTC and extended ISO 8601 format, of the most recent
  /// change to the status of the relationship between the account and the master
  /// account.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  Member({
    this.accountId,
    this.arn,
    this.email,
    this.invitedAt,
    this.masterAccountId,
    this.relationshipStatus,
    this.tags,
    this.updatedAt,
  });
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

/// Specifies a monthly recurrence pattern for running a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonthlySchedule {
  /// The numeric day of the month when Amazon Macie runs the job. This value can
  /// be an integer from 1 through 31.
  ///
  /// If this value exceeds the number of days in a certain month, Macie runs the
  /// job on the last day of that month. For example, if this value is 31 and a
  /// month has only 30 days, Macie runs the job on day 30 of that month.
  @_s.JsonKey(name: 'dayOfMonth')
  final int dayOfMonth;

  MonthlySchedule({
    this.dayOfMonth,
  });
  factory MonthlySchedule.fromJson(Map<String, dynamic> json) =>
      _$MonthlyScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$MonthlyScheduleToJson(this);
}

/// Provides information about the number of objects that are in an S3 bucket
/// and use certain types of server-side encryption, use client-side encryption,
/// or aren't encrypted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ObjectCountByEncryptionType {
  /// The total number of objects that are encrypted using a customer-managed key.
  /// The objects use customer-provided server-side (SSE-C) encryption.
  @_s.JsonKey(name: 'customerManaged')
  final int customerManaged;

  /// The total number of objects that are encrypted using an AWS Key Management
  /// Service (AWS KMS) customer master key (CMK). The objects use AWS managed AWS
  /// KMS (AWS-KMS) encryption or customer managed AWS KMS (SSE-KMS) encryption.
  @_s.JsonKey(name: 'kmsManaged')
  final int kmsManaged;

  /// The total number of objects that are encrypted using an Amazon S3 managed
  /// key. The objects use Amazon S3 managed (SSE-S3) encryption.
  @_s.JsonKey(name: 's3Managed')
  final int s3Managed;

  /// The total number of objects that aren't encrypted or use client-side
  /// encryption.
  @_s.JsonKey(name: 'unencrypted')
  final int unencrypted;

  ObjectCountByEncryptionType({
    this.customerManaged,
    this.kmsManaged,
    this.s3Managed,
    this.unencrypted,
  });
  factory ObjectCountByEncryptionType.fromJson(Map<String, dynamic> json) =>
      _$ObjectCountByEncryptionTypeFromJson(json);
}

/// Provides information about the total storage size (in bytes) or number of
/// objects that Amazon Macie can't analyze in one or more S3 buckets. In a
/// BucketMetadata object, this data is for a specific bucket. In a
/// GetBucketStatisticsResponse object, this data is aggregated for all the
/// buckets in the query results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ObjectLevelStatistics {
  /// The total storage size (in bytes) or number of objects that Amazon Macie
  /// can't analyze because the objects don't have a file name extension for a
  /// supported file or storage format.
  @_s.JsonKey(name: 'fileType')
  final int fileType;

  /// The total storage size (in bytes) or number of objects that Amazon Macie
  /// can't analyze because the objects use an unsupported storage class.
  @_s.JsonKey(name: 'storageClass')
  final int storageClass;

  /// The total storage size (in bytes) or number of objects that Amazon Macie
  /// can't analyze because the objects use an unsupported storage class or don't
  /// have a file name extension for a supported file or storage format.
  @_s.JsonKey(name: 'total')
  final int total;

  ObjectLevelStatistics({
    this.fileType,
    this.storageClass,
    this.total,
  });
  factory ObjectLevelStatistics.fromJson(Map<String, dynamic> json) =>
      _$ObjectLevelStatisticsFromJson(json);
}

/// Provides the location of 1-15 occurrences of sensitive data that was
/// detected by managed data identifiers or a custom data identifier and
/// produced a sensitive data finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Occurrences {
  /// An array of objects, one for each occurrence of sensitive data in a
  /// Microsoft Excel workbook, CSV file, or TSV file. Each object specifies the
  /// cell or field that contains the data. This value is null for all other types
  /// of files.
  @_s.JsonKey(name: 'cells')
  final List<Cell> cells;

  /// An array of objects, one for each occurrence of sensitive data in a
  /// Microsoft Word document or non-binary text file, such as an HTML, JSON, TXT,
  /// or XML file. Each object specifies the line that contains the data, and the
  /// position of the data on that line.
  ///
  /// This value is often null for file types that are supported by Cell, Page, or
  /// Record objects. Exceptions are the locations of: data in unstructured
  /// sections of an otherwise structured file, such as a comment in a file; and,
  /// data in a malformed file that Amazon Macie analyzes as plain text.
  @_s.JsonKey(name: 'lineRanges')
  final List<Range> lineRanges;

  /// An array of objects, one for each occurrence of sensitive data in a binary
  /// text file. Each object specifies the position of the data relative to the
  /// beginning of the file.
  ///
  /// This value is typically null. For binary text files, Amazon Macie adds
  /// location data to a lineRanges.Range or Page object, depending on the file
  /// type.
  @_s.JsonKey(name: 'offsetRanges')
  final List<Range> offsetRanges;

  /// An array of objects, one for each occurrence of sensitive data in an Adobe
  /// Portable Document Format file. Each object specifies the page that contains
  /// the data, and the position of the data on that page. This value is null for
  /// all other types of files.
  @_s.JsonKey(name: 'pages')
  final List<Page> pages;

  /// An array of objects, one for each occurrence of sensitive data in an Apache
  /// Avro object container or Apache Parquet file. Each object specifies the
  /// record index and the path to the field in the record that contains the data.
  /// This value is null for all other types of files.
  @_s.JsonKey(name: 'records')
  final List<Record> records;

  Occurrences({
    this.cells,
    this.lineRanges,
    this.offsetRanges,
    this.pages,
    this.records,
  });
  factory Occurrences.fromJson(Map<String, dynamic> json) =>
      _$OccurrencesFromJson(json);
}

enum OrderBy {
  @_s.JsonValue('ASC')
  asc,
  @_s.JsonValue('DESC')
  desc,
}

/// Specifies the location of an occurrence of sensitive data in an Adobe
/// Portable Document Format file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Page {
  /// The line that contains the data, and the position of the data on that line.
  @_s.JsonKey(name: 'lineRange')
  final Range lineRange;

  /// The position of the data on the page, relative to the beginning of the page.
  @_s.JsonKey(name: 'offsetRange')
  final Range offsetRange;

  /// The page number of the page that contains the data.
  @_s.JsonKey(name: 'pageNumber')
  final int pageNumber;

  Page({
    this.lineRange,
    this.offsetRange,
    this.pageNumber,
  });
  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

/// Provides the details of a policy finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyDetails {
  /// The action that produced the finding.
  @_s.JsonKey(name: 'action')
  final FindingAction action;

  /// The entity that performed the action that produced the finding.
  @_s.JsonKey(name: 'actor')
  final FindingActor actor;

  PolicyDetails({
    this.action,
    this.actor,
  });
  factory PolicyDetails.fromJson(Map<String, dynamic> json) =>
      _$PolicyDetailsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutClassificationExportConfigurationResponse {
  /// The location where the data classification results are stored, and the
  /// encryption settings that are used when storing results in that location.
  @_s.JsonKey(name: 'configuration')
  final ClassificationExportConfiguration configuration;

  PutClassificationExportConfigurationResponse({
    this.configuration,
  });
  factory PutClassificationExportConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutClassificationExportConfigurationResponseFromJson(json);
}

/// Provides details about the location of an occurrence of sensitive data in an
/// Adobe Portable Document Format file, Microsoft Word document, or non-binary
/// text file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Range {
  /// Possible values are:
  ///
  /// <ul>
  /// <li>
  /// In an Occurrences.lineRanges array, the number of lines from the beginning
  /// of the file to the end of the sensitive data.
  /// </li>
  /// <li>
  /// In an Occurrences.offsetRanges array, the number of characters from the
  /// beginning of the file to the end of the sensitive data.
  /// </li>
  /// <li>
  /// In a Page object, the number of lines (lineRange) or characters
  /// (offsetRange) from the beginning of the page to the end of the sensitive
  /// data.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'end')
  final int end;

  /// Possible values are:
  ///
  /// <ul>
  /// <li>
  /// In an Occurrences.lineRanges array, the number of lines from the beginning
  /// of the file to the beginning of the sensitive data.
  /// </li>
  /// <li>
  /// In an Occurrences.offsetRanges array, the number of characters from the
  /// beginning of the file to the beginning of the sensitive data.
  /// </li>
  /// <li>
  /// In a Page object, the number of lines (lineRange) or characters
  /// (offsetRange) from the beginning of the page to the beginning of the
  /// sensitive data.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'start')
  final int start;

  /// The column number for the column that contains the data, if the file
  /// contains structured data.
  @_s.JsonKey(name: 'startColumn')
  final int startColumn;

  Range({
    this.end,
    this.start,
    this.startColumn,
  });
  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

/// Specifies the location of an occurrence of sensitive data in an Apache Avro
/// object container or Apache Parquet file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Record {
  /// The path, as a JSONPath expression, to the field in the record that contains
  /// the data.
  ///
  /// If the name of an element exceeds 20 characters, Amazon Macie truncates the
  /// name by removing characters from the beginning of the name. If the resulting
  /// full path exceeds 250 characters, Macie also truncates the path, starting
  /// with the first element in the path, until the path contains 250 or fewer
  /// characters.
  @_s.JsonKey(name: 'jsonPath')
  final String jsonPath;

  /// The record index, starting from 0, for the record that contains the data.
  @_s.JsonKey(name: 'recordIndex')
  final int recordIndex;

  Record({
    this.jsonPath,
    this.recordIndex,
  });
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

/// The current status of the relationship between an account and an associated
/// Amazon Macie master account (<i>inviter account</i>). Possible values are:
enum RelationshipStatus {
  @_s.JsonValue('Enabled')
  enabled,
  @_s.JsonValue('Paused')
  paused,
  @_s.JsonValue('Invited')
  invited,
  @_s.JsonValue('Created')
  created,
  @_s.JsonValue('Removed')
  removed,
  @_s.JsonValue('Resigned')
  resigned,
  @_s.JsonValue('EmailVerificationInProgress')
  emailVerificationInProgress,
  @_s.JsonValue('EmailVerificationFailed')
  emailVerificationFailed,
  @_s.JsonValue('RegionDisabled')
  regionDisabled,
  @_s.JsonValue('AccountSuspended')
  accountSuspended,
}

/// Provides information about settings that define whether one or more objects
/// in an S3 bucket are replicated to S3 buckets for other AWS accounts and, if
/// so, which accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationDetails {
  /// Specifies whether the bucket is configured to replicate one or more objects
  /// to any destination.
  @_s.JsonKey(name: 'replicated')
  final bool replicated;

  /// Specifies whether the bucket is configured to replicate one or more objects
  /// to an AWS account that isn't part of the same Amazon Macie organization.
  @_s.JsonKey(name: 'replicatedExternally')
  final bool replicatedExternally;

  /// An array of AWS account IDs, one for each AWS account that the bucket is
  /// configured to replicate one or more objects to.
  @_s.JsonKey(name: 'replicationAccounts')
  final List<String> replicationAccounts;

  ReplicationDetails({
    this.replicated,
    this.replicatedExternally,
    this.replicationAccounts,
  });
  factory ReplicationDetails.fromJson(Map<String, dynamic> json) =>
      _$ReplicationDetailsFromJson(json);
}

/// Provides information about the resources that a finding applies to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourcesAffected {
  /// An array of objects, one for each S3 bucket that the finding applies to.
  /// Each object provides a set of metadata about an affected S3 bucket.
  @_s.JsonKey(name: 's3Bucket')
  final S3Bucket s3Bucket;

  /// An array of objects, one for each S3 object that the finding applies to.
  /// Each object provides a set of metadata about an affected S3 object.
  @_s.JsonKey(name: 's3Object')
  final S3Object s3Object;

  ResourcesAffected({
    this.s3Bucket,
    this.s3Object,
  });
  factory ResourcesAffected.fromJson(Map<String, dynamic> json) =>
      _$ResourcesAffectedFromJson(json);
}

/// Provides information about an S3 bucket that a finding applies to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3Bucket {
  /// The Amazon Resource Name (ARN) of the bucket.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the bucket was
  /// created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The type of server-side encryption that's used by default to encrypt objects
  /// in the bucket.
  @_s.JsonKey(name: 'defaultServerSideEncryption')
  final ServerSideEncryption defaultServerSideEncryption;

  /// The name of the bucket.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The display name and account identifier for the user who owns the bucket.
  @_s.JsonKey(name: 'owner')
  final S3BucketOwner owner;

  /// The permissions settings that determine whether the bucket is publicly
  /// accessible.
  @_s.JsonKey(name: 'publicAccess')
  final BucketPublicAccess publicAccess;

  /// The tags that are associated with the bucket.
  @_s.JsonKey(name: 'tags')
  final List<KeyValuePair> tags;

  S3Bucket({
    this.arn,
    this.createdAt,
    this.defaultServerSideEncryption,
    this.name,
    this.owner,
    this.publicAccess,
    this.tags,
  });
  factory S3Bucket.fromJson(Map<String, dynamic> json) =>
      _$S3BucketFromJson(json);
}

/// Specifies which AWS account owns the S3 buckets that a classification job
/// analyzes, and the buckets to analyze for the account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3BucketDefinitionForJob {
  /// The unique identifier for the AWS account that owns the buckets. If you
  /// specify this value and don't specify a value for the buckets array, the job
  /// analyzes objects in all the buckets that are owned by the account and meet
  /// other conditions specified for the job.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// An array that lists the names of the buckets.
  @_s.JsonKey(name: 'buckets')
  final List<String> buckets;

  S3BucketDefinitionForJob({
    this.accountId,
    this.buckets,
  });
  factory S3BucketDefinitionForJob.fromJson(Map<String, dynamic> json) =>
      _$S3BucketDefinitionForJobFromJson(json);

  Map<String, dynamic> toJson() => _$S3BucketDefinitionForJobToJson(this);
}

/// Provides information about the user who owns an S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3BucketOwner {
  /// The display name of the user who owns the bucket.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The AWS account ID for the user who owns the bucket.
  @_s.JsonKey(name: 'id')
  final String id;

  S3BucketOwner({
    this.displayName,
    this.id,
  });
  factory S3BucketOwner.fromJson(Map<String, dynamic> json) =>
      _$S3BucketOwnerFromJson(json);
}

/// Specifies an S3 bucket to store data classification results in, and the
/// encryption settings to use when storing results in that bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Destination {
  /// The name of the bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The Amazon Resource Name (ARN) of the AWS Key Management Service (AWS KMS)
  /// customer master key (CMK) to use for encryption of the results. This must be
  /// the ARN of an existing CMK that's in the same AWS Region as the bucket.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  /// The path prefix to use in the path to the location in the bucket. This
  /// prefix specifies where to store classification results in the bucket.
  @_s.JsonKey(name: 'keyPrefix')
  final String keyPrefix;

  S3Destination({
    @_s.required this.bucketName,
    @_s.required this.kmsKeyArn,
    this.keyPrefix,
  });
  factory S3Destination.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$S3DestinationToJson(this);
}

/// Specifies which S3 buckets contain the objects that a classification job
/// analyzes, and the scope of that analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3JobDefinition {
  /// An array of objects, one for each AWS account that owns buckets to analyze.
  /// Each object specifies the account ID for an account and one or more buckets
  /// to analyze for the account.
  @_s.JsonKey(name: 'bucketDefinitions')
  final List<S3BucketDefinitionForJob> bucketDefinitions;

  /// The property- and tag-based conditions that determine which objects to
  /// include or exclude from the analysis.
  @_s.JsonKey(name: 'scoping')
  final Scoping scoping;

  S3JobDefinition({
    this.bucketDefinitions,
    this.scoping,
  });
  factory S3JobDefinition.fromJson(Map<String, dynamic> json) =>
      _$S3JobDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$S3JobDefinitionToJson(this);
}

/// Provides information about an S3 object that a finding applies to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3Object {
  /// The Amazon Resource Name (ARN) of the bucket that contains the object.
  @_s.JsonKey(name: 'bucketArn')
  final String bucketArn;

  /// The entity tag (ETag) that identifies the affected version of the object. If
  /// the object was overwritten or changed after Amazon Macie produced the
  /// finding, this value might be different from the current ETag for the object.
  @_s.JsonKey(name: 'eTag')
  final String eTag;

  /// The file name extension of the object. If the object doesn't have a file
  /// name extension, this value is "".
  @_s.JsonKey(name: 'extension')
  final String extension;

  /// The full key (name) that's assigned to the object.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The date and time, in UTC and extended ISO 8601 format, when the object was
  /// last modified.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastModified')
  final DateTime lastModified;

  /// The path to the object, including the full key (name).
  @_s.JsonKey(name: 'path')
  final String path;

  /// Specifies whether the object is publicly accessible due to the combination
  /// of permissions settings that apply to the object.
  @_s.JsonKey(name: 'publicAccess')
  final bool publicAccess;

  /// The type of server-side encryption that's used for the object.
  @_s.JsonKey(name: 'serverSideEncryption')
  final ServerSideEncryption serverSideEncryption;

  /// The total storage size, in bytes, of the object.
  @_s.JsonKey(name: 'size')
  final int size;

  /// The storage class of the object.
  @_s.JsonKey(name: 'storageClass')
  final StorageClass storageClass;

  /// The tags that are associated with the object.
  @_s.JsonKey(name: 'tags')
  final List<KeyValuePair> tags;

  /// The identifier for the affected version of the object.
  @_s.JsonKey(name: 'versionId')
  final String versionId;

  S3Object({
    this.bucketArn,
    this.eTag,
    this.extension,
    this.key,
    this.lastModified,
    this.path,
    this.publicAccess,
    this.serverSideEncryption,
    this.size,
    this.storageClass,
    this.tags,
    this.versionId,
  });
  factory S3Object.fromJson(Map<String, dynamic> json) =>
      _$S3ObjectFromJson(json);
}

/// The property to use in a condition that determines which objects are
/// analyzed by a classification job. Valid values are:
enum ScopeFilterKey {
  @_s.JsonValue('BUCKET_CREATION_DATE')
  bucketCreationDate,
  @_s.JsonValue('OBJECT_EXTENSION')
  objectExtension,
  @_s.JsonValue('OBJECT_LAST_MODIFIED_DATE')
  objectLastModifiedDate,
  @_s.JsonValue('OBJECT_SIZE')
  objectSize,
  @_s.JsonValue('TAG')
  tag,
}

/// Specifies one or more property- and tag-based conditions that refine the
/// scope of a classification job. These conditions define criteria that
/// determine which objects a job analyzes. Exclude conditions take precedence
/// over include conditions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scoping {
  /// The property- or tag-based conditions that determine which objects to
  /// exclude from the analysis.
  @_s.JsonKey(name: 'excludes')
  final JobScopingBlock excludes;

  /// The property- or tag-based conditions that determine which objects to
  /// include in the analysis.
  @_s.JsonKey(name: 'includes')
  final JobScopingBlock includes;

  Scoping({
    this.excludes,
    this.includes,
  });
  factory Scoping.fromJson(Map<String, dynamic> json) =>
      _$ScopingFromJson(json);

  Map<String, dynamic> toJson() => _$ScopingToJson(this);
}

/// Provides information about the category, types, and occurrences of sensitive
/// data that produced a sensitive data finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SensitiveDataItem {
  /// The category of sensitive data that was detected. For example: CREDENTIALS,
  /// for credentials data such as private keys or AWS secret keys;
  /// FINANCIAL_INFORMATION, for financial data such as credit card numbers; or,
  /// PERSONAL_INFORMATION, for personal health information, such as health
  /// insurance identification numbers, or personally identifiable information,
  /// such as driver's license identification numbers.
  @_s.JsonKey(name: 'category')
  final SensitiveDataItemCategory category;

  /// An array of objects, one for each type of sensitive data that was detected.
  /// Each object reports the number of occurrences of a specific type of
  /// sensitive data that was detected, and the location of up to 15 of those
  /// occurrences.
  @_s.JsonKey(name: 'detections')
  final List<DefaultDetection> detections;

  /// The total number of occurrences of the sensitive data that was detected.
  @_s.JsonKey(name: 'totalCount')
  final int totalCount;

  SensitiveDataItem({
    this.category,
    this.detections,
    this.totalCount,
  });
  factory SensitiveDataItem.fromJson(Map<String, dynamic> json) =>
      _$SensitiveDataItemFromJson(json);
}

/// The category of sensitive data that was detected and produced the finding.
/// Possible values are:
enum SensitiveDataItemCategory {
  @_s.JsonValue('FINANCIAL_INFORMATION')
  financialInformation,
  @_s.JsonValue('PERSONAL_INFORMATION')
  personalInformation,
  @_s.JsonValue('CREDENTIALS')
  credentials,
  @_s.JsonValue('CUSTOM_IDENTIFIER')
  customIdentifier,
}

/// Provides information about the server-side encryption settings for an S3
/// bucket or S3 object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServerSideEncryption {
  /// The server-side encryption algorithm that's used when storing data in the
  /// bucket or object. If encryption is disabled for the bucket or object, this
  /// value is NONE.
  @_s.JsonKey(name: 'encryptionType')
  final EncryptionType encryptionType;

  /// The unique identifier for the AWS Key Management Service (AWS KMS) master
  /// key that's used to encrypt the bucket or object. This value is null if AWS
  /// KMS isn't used to encrypt the bucket or object.
  @_s.JsonKey(name: 'kmsMasterKeyId')
  final String kmsMasterKeyId;

  ServerSideEncryption({
    this.encryptionType,
    this.kmsMasterKeyId,
  });
  factory ServerSideEncryption.fromJson(Map<String, dynamic> json) =>
      _$ServerSideEncryptionFromJson(json);
}

/// Specifies a current quota for an account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceLimit {
  /// Specifies whether the account has met the quota that corresponds to the
  /// metric specified by the UsageByAccount.type field in the response.
  @_s.JsonKey(name: 'isServiceLimited')
  final bool isServiceLimited;

  /// The unit of measurement for the value specified by the value field.
  @_s.JsonKey(name: 'unit')
  final Unit unit;

  /// The value for the metric specified by the UsageByAccount.type field in the
  /// response.
  @_s.JsonKey(name: 'value')
  final int value;

  ServiceLimit({
    this.isServiceLimited,
    this.unit,
    this.value,
  });
  factory ServiceLimit.fromJson(Map<String, dynamic> json) =>
      _$ServiceLimitFromJson(json);
}

/// Provides information about a session that was created for an entity that
/// performed an action by using temporary security credentials.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SessionContext {
  /// The date and time when the credentials were issued, and whether the
  /// credentials were authenticated with a multi-factor authentication (MFA)
  /// device.
  @_s.JsonKey(name: 'attributes')
  final SessionContextAttributes attributes;

  /// The source and type of credentials that were issued to the entity.
  @_s.JsonKey(name: 'sessionIssuer')
  final SessionIssuer sessionIssuer;

  SessionContext({
    this.attributes,
    this.sessionIssuer,
  });
  factory SessionContext.fromJson(Map<String, dynamic> json) =>
      _$SessionContextFromJson(json);
}

/// Provides information about the context in which temporary security
/// credentials were issued to an entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SessionContextAttributes {
  /// The date and time, in UTC and ISO 8601 format, when the credentials were
  /// issued.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// Specifies whether the credentials were authenticated with a multi-factor
  /// authentication (MFA) device.
  @_s.JsonKey(name: 'mfaAuthenticated')
  final bool mfaAuthenticated;

  SessionContextAttributes({
    this.creationDate,
    this.mfaAuthenticated,
  });
  factory SessionContextAttributes.fromJson(Map<String, dynamic> json) =>
      _$SessionContextAttributesFromJson(json);
}

/// Provides information about the source and type of temporary security
/// credentials that were issued to an entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SessionIssuer {
  /// The unique identifier for the AWS account that owns the entity that was used
  /// to get the credentials.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the source account, IAM user, or role that
  /// was used to get the credentials.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the entity that was used to get the credentials.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  /// The source of the temporary security credentials, such as Root, IAMUser, or
  /// Role.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The name or alias of the user or role that issued the session. This value is
  /// null if the credentials were obtained from a root account that doesn't have
  /// an alias.
  @_s.JsonKey(name: 'userName')
  final String userName;

  SessionIssuer({
    this.accountId,
    this.arn,
    this.principalId,
    this.type,
    this.userName,
  });
  factory SessionIssuer.fromJson(Map<String, dynamic> json) =>
      _$SessionIssuerFromJson(json);
}

/// Provides the numerical and qualitative representations of a finding's
/// severity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Severity {
  /// The qualitative representation of the finding's severity, ranging from Low
  /// (least severe) to High (most severe).
  @_s.JsonKey(name: 'description')
  final SeverityDescription description;

  /// The numerical representation of the finding's severity, ranging from 1
  /// (least severe) to 3 (most severe).
  @_s.JsonKey(name: 'score')
  final int score;

  Severity({
    this.description,
    this.score,
  });
  factory Severity.fromJson(Map<String, dynamic> json) =>
      _$SeverityFromJson(json);
}

/// The qualitative representation of the finding's severity. Possible values
/// are:
enum SeverityDescription {
  @_s.JsonValue('Low')
  low,
  @_s.JsonValue('Medium')
  medium,
  @_s.JsonValue('High')
  high,
}

enum SharedAccess {
  @_s.JsonValue('EXTERNAL')
  external,
  @_s.JsonValue('INTERNAL')
  internal,
  @_s.JsonValue('NOT_SHARED')
  notShared,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

/// Specifies a property-based condition that determines whether an object is
/// included or excluded from a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SimpleScopeTerm {
  /// The operator to use in the condition. Valid operators for each supported
  /// property (key) are:
  ///
  /// <ul>
  /// <li>
  /// OBJECT_EXTENSION - EQ (equals) or NE (not equals)
  /// </li>
  /// <li>
  /// OBJECT_LAST_MODIFIED_DATE - Any operator except CONTAINS
  /// </li>
  /// <li>
  /// OBJECT_SIZE - Any operator except CONTAINS
  /// </li>
  /// <li>
  /// TAG - EQ (equals) or NE (not equals)
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'comparator')
  final JobComparator comparator;

  /// The object property to use in the condition.
  @_s.JsonKey(name: 'key')
  final ScopeFilterKey key;

  /// An array that lists the values to use in the condition. If the value for the
  /// key property is OBJECT_EXTENSION, this array can specify multiple values and
  /// Amazon Macie uses an OR operator to join the values. Otherwise, this array
  /// can specify only one value. Valid values for each supported property (key)
  /// are:
  ///
  /// <ul>
  /// <li>
  /// OBJECT_EXTENSION - A string that represents the file name extension of an
  /// object. For example: doc, docx, pdf
  /// </li>
  /// <li>
  /// OBJECT_LAST_MODIFIED_DATE - The date and time (in UTC and extended ISO 8601
  /// format) when an object was created or last changed, whichever is latest. For
  /// example: 2020-09-28T14:31:13Z
  /// </li>
  /// <li>
  /// OBJECT_SIZE - An integer that represents the storage size (in bytes) of an
  /// object.
  /// </li>
  /// <li>
  /// TAG - A string that represents a tag key for an object. For advanced
  /// options, use a TagScopeTerm object, instead of a SimpleScopeTerm object, to
  /// define a tag-based condition for the job.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'values')
  final List<String> values;

  SimpleScopeTerm({
    this.comparator,
    this.key,
    this.values,
  });
  factory SimpleScopeTerm.fromJson(Map<String, dynamic> json) =>
      _$SimpleScopeTermFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleScopeTermToJson(this);
}

/// Specifies criteria for sorting the results of a request for findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SortCriteria {
  /// The name of the property to sort the results by. This value can be the name
  /// of any property that Amazon Macie defines for a finding.
  @_s.JsonKey(name: 'attributeName')
  final String attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  @_s.JsonKey(name: 'orderBy')
  final OrderBy orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => _$SortCriteriaToJson(this);
}

/// Provides processing statistics for a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Statistics {
  /// The approximate number of objects that the job has yet to process during its
  /// current run.
  @_s.JsonKey(name: 'approximateNumberOfObjectsToProcess')
  final double approximateNumberOfObjectsToProcess;

  /// The number of times that the job has run.
  @_s.JsonKey(name: 'numberOfRuns')
  final double numberOfRuns;

  Statistics({
    this.approximateNumberOfObjectsToProcess,
    this.numberOfRuns,
  });
  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}

/// The storage class of the S3 object. Possible values are:
enum StorageClass {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('REDUCED_REDUNDANCY')
  reducedRedundancy,
  @_s.JsonValue('STANDARD_IA')
  standardIa,
  @_s.JsonValue('INTELLIGENT_TIERING')
  intelligentTiering,
  @_s.JsonValue('DEEP_ARCHIVE')
  deepArchive,
  @_s.JsonValue('ONEZONE_IA')
  onezoneIa,
  @_s.JsonValue('GLACIER')
  glacier,
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

/// Specifies a tag-based condition that determines whether an object is
/// included or excluded from a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagScopeTerm {
  /// The operator to use in the condition. Valid operators are EQ (equals) or NE
  /// (not equals).
  @_s.JsonKey(name: 'comparator')
  final JobComparator comparator;

  /// The tag key to use in the condition.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The tag keys or tag key and value pairs to use in the condition.
  @_s.JsonKey(name: 'tagValues')
  final List<TagValuePair> tagValues;

  /// The type of object to apply the condition to.
  @_s.JsonKey(name: 'target')
  final TagTarget target;

  TagScopeTerm({
    this.comparator,
    this.key,
    this.tagValues,
    this.target,
  });
  factory TagScopeTerm.fromJson(Map<String, dynamic> json) =>
      _$TagScopeTermFromJson(json);

  Map<String, dynamic> toJson() => _$TagScopeTermToJson(this);
}

/// The type of object to apply a tag-based condition to. Valid values are:
enum TagTarget {
  @_s.JsonValue('S3_OBJECT')
  s3Object,
}

/// Specifies a tag key or tag key and value pair to use in a tag-based
/// condition for a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagValuePair {
  /// The value for the tag key to use in the condition.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The tag value, associated with the specified tag key (key), to use in the
  /// condition. To specify only a tag key for a condition, specify the tag key
  /// for the key property and set this value to an empty string.
  @_s.JsonKey(name: 'value')
  final String value;

  TagValuePair({
    this.key,
    this.value,
  });
  factory TagValuePair.fromJson(Map<String, dynamic> json) =>
      _$TagValuePairFromJson(json);

  Map<String, dynamic> toJson() => _$TagValuePairToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestCustomDataIdentifierResponse {
  /// The number of instances of sample text that matched the detection criteria
  /// specified in the custom data identifier.
  @_s.JsonKey(name: 'matchCount')
  final int matchCount;

  TestCustomDataIdentifierResponse({
    this.matchCount,
  });
  factory TestCustomDataIdentifierResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TestCustomDataIdentifierResponseFromJson(json);
}

enum Unit {
  @_s.JsonValue('TERABYTES')
  terabytes,
}

/// Provides information about an account-related request that hasn't been
/// processed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedAccount {
  /// The AWS account ID for the account that the request applies to.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The source of the issue or delay in processing the request.
  @_s.JsonKey(name: 'errorCode')
  final ErrorCode errorCode;

  /// The reason why the request hasn't been processed.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  UnprocessedAccount({
    this.accountId,
    this.errorCode,
    this.errorMessage,
  });
  factory UnprocessedAccount.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedAccountFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClassificationJobResponse {
  UpdateClassificationJobResponse();
  factory UpdateClassificationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateClassificationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFindingsFilterResponse {
  /// The Amazon Resource Name (ARN) of the filter that was updated.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the filter that was updated.
  @_s.JsonKey(name: 'id')
  final String id;

  UpdateFindingsFilterResponse({
    this.arn,
    this.id,
  });
  factory UpdateFindingsFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFindingsFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMacieSessionResponse {
  UpdateMacieSessionResponse();
  factory UpdateMacieSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMacieSessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMemberSessionResponse {
  UpdateMemberSessionResponse();
  factory UpdateMemberSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMemberSessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateOrganizationConfigurationResponse {
  UpdateOrganizationConfigurationResponse();
  factory UpdateOrganizationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOrganizationConfigurationResponseFromJson(json);
}

/// Provides data for a specific usage metric and the corresponding quota for an
/// account. The value for the metric is an aggregated value that reports usage
/// during the past 30 days.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageByAccount {
  /// The type of currency that the value for the metric (estimatedCost) is
  /// reported in.
  @_s.JsonKey(name: 'currency')
  final Currency currency;

  /// The estimated value for the metric.
  @_s.JsonKey(name: 'estimatedCost')
  final String estimatedCost;

  /// The current value for the quota that corresponds to the metric specified by
  /// the type field.
  @_s.JsonKey(name: 'serviceLimit')
  final ServiceLimit serviceLimit;

  /// The name of the metric. Possible values are: DATA_INVENTORY_EVALUATION, for
  /// monitoring S3 buckets; and, SENSITIVE_DATA_DISCOVERY, for analyzing
  /// sensitive data.
  @_s.JsonKey(name: 'type')
  final UsageType type;

  UsageByAccount({
    this.currency,
    this.estimatedCost,
    this.serviceLimit,
    this.type,
  });
  factory UsageByAccount.fromJson(Map<String, dynamic> json) =>
      _$UsageByAccountFromJson(json);
}

/// Provides quota and aggregated usage data for an account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageRecord {
  /// The unique identifier for the AWS account that the data applies to.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The date and time, in UTC and extended ISO 8601 format, when the free trial
  /// started for the account.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'freeTrialStartDate')
  final DateTime freeTrialStartDate;

  /// An array of objects that contains usage data and quotas for the account.
  /// Each object contains the data for a specific usage metric and the
  /// corresponding quota.
  @_s.JsonKey(name: 'usage')
  final List<UsageByAccount> usage;

  UsageRecord({
    this.accountId,
    this.freeTrialStartDate,
    this.usage,
  });
  factory UsageRecord.fromJson(Map<String, dynamic> json) =>
      _$UsageRecordFromJson(json);
}

/// Specifies a condition for filtering the results of a query for account
/// quotas and usage data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UsageStatisticsFilter {
  /// The operator to use in the condition. If the value for the key property is
  /// accountId, this value must be CONTAINS. If the value for the key property is
  /// any other supported field, this value can be EQ, GT, GTE, LT, LTE, or NE.
  @_s.JsonKey(name: 'comparator')
  final UsageStatisticsFilterComparator comparator;

  /// The field to use in the condition.
  @_s.JsonKey(name: 'key')
  final UsageStatisticsFilterKey key;

  /// An array that lists values to use in the condition, based on the value for
  /// the field specified by the key property. If the value for the key property
  /// is accountId, this array can specify multiple values. Otherwise, this array
  /// can specify only one value.
  ///
  /// Valid values for each supported field are:
  ///
  /// <ul>
  /// <li>
  /// accountId - The unique identifier for an AWS account.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// freeTrialStartDate - The date and time, in UTC and extended ISO 8601 format,
  /// when the free trial started for an account.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// serviceLimit - A Boolean (true or false) value that indicates whether an
  /// account has reached its monthly quota.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// total - A string that represents the current, estimated month-to-date cost
  /// for an account.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'values')
  final List<String> values;

  UsageStatisticsFilter({
    this.comparator,
    this.key,
    this.values,
  });
  Map<String, dynamic> toJson() => _$UsageStatisticsFilterToJson(this);
}

/// The operator to use in a condition that filters the results of a query for
/// account quotas and usage data. Valid values are:
enum UsageStatisticsFilterComparator {
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('GTE')
  gte,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('LTE')
  lte,
  @_s.JsonValue('EQ')
  eq,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('CONTAINS')
  contains,
}

/// The field to use in a condition that filters the results of a query for
/// account quotas and usage data. Valid values are:
enum UsageStatisticsFilterKey {
  @_s.JsonValue('accountId')
  accountId,
  @_s.JsonValue('serviceLimit')
  serviceLimit,
  @_s.JsonValue('freeTrialStartDate')
  freeTrialStartDate,
  @_s.JsonValue('total')
  total,
}

/// Specifies criteria for sorting the results of a query for account quotas and
/// usage data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UsageStatisticsSortBy {
  /// The field to sort the results by.
  @_s.JsonKey(name: 'key')
  final UsageStatisticsSortKey key;

  /// The sort order to apply to the results, based on the value for the field
  /// specified by the key property. Valid values are: ASC, sort the results in
  /// ascending order; and, DESC, sort the results in descending order.
  @_s.JsonKey(name: 'orderBy')
  final OrderBy orderBy;

  UsageStatisticsSortBy({
    this.key,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => _$UsageStatisticsSortByToJson(this);
}

/// The field to use to sort the results of a query for account quotas and usage
/// data. Valid values are:
enum UsageStatisticsSortKey {
  @_s.JsonValue('accountId')
  accountId,
  @_s.JsonValue('total')
  total,
  @_s.JsonValue('serviceLimitValue')
  serviceLimitValue,
  @_s.JsonValue('freeTrialStartDate')
  freeTrialStartDate,
}

/// Provides aggregated data for a usage metric. The value for the metric
/// reports usage data for an account during the past 30 days.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageTotal {
  /// The type of currency that the value for the metric (estimatedCost) is
  /// reported in.
  @_s.JsonKey(name: 'currency')
  final Currency currency;

  /// The estimated value for the metric.
  @_s.JsonKey(name: 'estimatedCost')
  final String estimatedCost;

  /// The name of the metric. Possible values are: DATA_INVENTORY_EVALUATION, for
  /// monitoring S3 buckets; and, SENSITIVE_DATA_DISCOVERY, for analyzing
  /// sensitive data.
  @_s.JsonKey(name: 'type')
  final UsageType type;

  UsageTotal({
    this.currency,
    this.estimatedCost,
    this.type,
  });
  factory UsageTotal.fromJson(Map<String, dynamic> json) =>
      _$UsageTotalFromJson(json);
}

/// The name of a usage metric for an account. Possible values are:
enum UsageType {
  @_s.JsonValue('DATA_INVENTORY_EVALUATION')
  dataInventoryEvaluation,
  @_s.JsonValue('SENSITIVE_DATA_DISCOVERY')
  sensitiveDataDiscovery,
}

/// Provides information about the type and other characteristics of an entity
/// that performed an action on an affected resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserIdentity {
  /// If the action was performed with temporary security credentials that were
  /// obtained using the AssumeRole operation of the AWS Security Token Service
  /// (AWS STS) API, the identifiers, session context, and other details about the
  /// identity.
  @_s.JsonKey(name: 'assumedRole')
  final AssumedRole assumedRole;

  /// If the action was performed using the credentials for another AWS account,
  /// the details of that account.
  @_s.JsonKey(name: 'awsAccount')
  final AwsAccount awsAccount;

  /// If the action was performed by an AWS account that belongs to an AWS
  /// service, the name of the service.
  @_s.JsonKey(name: 'awsService')
  final AwsService awsService;

  /// If the action was performed with temporary security credentials that were
  /// obtained using the GetFederationToken operation of the AWS Security Token
  /// Service (AWS STS) API, the identifiers, session context, and other details
  /// about the identity.
  @_s.JsonKey(name: 'federatedUser')
  final FederatedUser federatedUser;

  /// If the action was performed using the credentials for an AWS Identity and
  /// Access Management (IAM) user, the name and other details about the user.
  @_s.JsonKey(name: 'iamUser')
  final IamUser iamUser;

  /// If the action was performed using the credentials for your AWS account, the
  /// details of your account.
  @_s.JsonKey(name: 'root')
  final UserIdentityRoot root;

  /// The type of entity that performed the action.
  @_s.JsonKey(name: 'type')
  final UserIdentityType type;

  UserIdentity({
    this.assumedRole,
    this.awsAccount,
    this.awsService,
    this.federatedUser,
    this.iamUser,
    this.root,
    this.type,
  });
  factory UserIdentity.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityFromJson(json);
}

/// Provides information about an AWS account and entity that performed an
/// action on an affected resource. The action was performed using the
/// credentials for your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserIdentityRoot {
  /// The unique identifier for the AWS account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The Amazon Resource Name (ARN) of the principal that performed the action.
  /// The last section of the ARN contains the name of the user or role that
  /// performed the action.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The unique identifier for the entity that performed the action.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  UserIdentityRoot({
    this.accountId,
    this.arn,
    this.principalId,
  });
  factory UserIdentityRoot.fromJson(Map<String, dynamic> json) =>
      _$UserIdentityRootFromJson(json);
}

/// The type of entity that performed the action on the affected resource.
/// Possible values are:
enum UserIdentityType {
  @_s.JsonValue('AssumedRole')
  assumedRole,
  @_s.JsonValue('IAMUser')
  iAMUser,
  @_s.JsonValue('FederatedUser')
  federatedUser,
  @_s.JsonValue('Root')
  root,
  @_s.JsonValue('AWSAccount')
  awsAccount,
  @_s.JsonValue('AWSService')
  awsService,
}

/// Provides information about when a classification job was paused. For a
/// one-time job, this object also specifies when the job will expire and be
/// cancelled if it isn't resumed. For a recurring job, this object also
/// specifies when the paused job run will expire and be cancelled if it isn't
/// resumed. This object is present only if a job's current status (jobStatus)
/// is USER_PAUSED. The information in this object applies only to a job that
/// was paused while it had a status of RUNNING.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserPausedDetails {
  /// The date and time, in UTC and extended ISO 8601 format, when the job or job
  /// run will expire and be cancelled if you don't resume it first.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'jobExpiresAt')
  final DateTime jobExpiresAt;

  /// The Amazon Resource Name (ARN) of the AWS Health event that Amazon Macie
  /// sent to notify you of the job or job run's pending expiration and
  /// cancellation. This value is null if a job has been paused for less than 23
  /// days.
  @_s.JsonKey(name: 'jobImminentExpirationHealthEventArn')
  final String jobImminentExpirationHealthEventArn;

  /// The date and time, in UTC and extended ISO 8601 format, when you paused the
  /// job.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'jobPausedAt')
  final DateTime jobPausedAt;

  UserPausedDetails({
    this.jobExpiresAt,
    this.jobImminentExpirationHealthEventArn,
    this.jobPausedAt,
  });
  factory UserPausedDetails.fromJson(Map<String, dynamic> json) =>
      _$UserPausedDetailsFromJson(json);
}

/// Specifies a weekly recurrence pattern for running a classification job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WeeklySchedule {
  /// The day of the week when Amazon Macie runs the job.
  @_s.JsonKey(name: 'dayOfWeek')
  final DayOfWeek dayOfWeek;

  WeeklySchedule({
    this.dayOfWeek,
  });
  factory WeeklySchedule.fromJson(Map<String, dynamic> json) =>
      _$WeeklyScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklyScheduleToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
