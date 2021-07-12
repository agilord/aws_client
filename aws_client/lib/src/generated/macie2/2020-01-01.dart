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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// Parameter [administratorAccountId] :
  /// The Amazon Web Services account ID for the account that sent the
  /// invitation.
  ///
  /// Parameter [masterAccount] :
  /// (Deprecated) The Amazon Web Services account ID for the account that sent
  /// the invitation. This property has been replaced by the
  /// administratorAccountId property and is retained only for backward
  /// compatibility.
  Future<void> acceptInvitation({
    required String invitationId,
    String? administratorAccountId,
    String? masterAccount,
  }) async {
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    final $payload = <String, dynamic>{
      'invitationId': invitationId,
      if (administratorAccountId != null)
        'administratorAccountId': administratorAccountId,
      if (masterAccount != null) 'masterAccount': masterAccount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitations/accept',
      exceptionFnMap: _exceptionFns,
    );
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
    List<String>? ids,
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
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
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
    required JobType jobType,
    required String name,
    required S3JobDefinition s3JobDefinition,
    String? clientToken,
    List<String>? customDataIdentifierIds,
    String? description,
    bool? initialRun,
    int? samplingPercentage,
    JobScheduleFrequency? scheduleFrequency,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(jobType, 'jobType');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(s3JobDefinition, 's3JobDefinition');
    final $payload = <String, dynamic>{
      'jobType': jobType.toValue(),
      'name': name,
      's3JobDefinition': s3JobDefinition,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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
  /// contain as many as 10 ignore words. Each ignore word can contain 4-90
  /// characters. Ignore words are case sensitive.
  ///
  /// Parameter [keywords] :
  /// An array that lists specific character sequences (keywords), one of which
  /// must be within proximity (maximumMatchDistance) of the regular expression
  /// to match. The array can contain as many as 50 keywords. Each keyword can
  /// contain 3-90 characters. Keywords aren't case sensitive.
  ///
  /// Parameter [maximumMatchDistance] :
  /// The maximum number of characters that can exist between text that matches
  /// the regex pattern and the character sequences specified by the keywords
  /// array. Macie includes or excludes a result based on the proximity of a
  /// keyword to text that matches the regex pattern. The distance can be 1-300
  /// characters. The default value is 50.
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
    String? clientToken,
    String? description,
    List<String>? ignoreWords,
    List<String>? keywords,
    int? maximumMatchDistance,
    String? name,
    String? regex,
    Map<String, String>? tags,
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
    required FindingsFilterAction action,
    required FindingCriteria findingCriteria,
    required String name,
    String? clientToken,
    String? description,
    int? position,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(findingCriteria, 'findingCriteria');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'action': action.toValue(),
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
  /// An array that lists Amazon Web Services account IDs, one for each account
  /// to send the invitation to.
  ///
  /// Parameter [disableEmailNotification] :
  /// Specifies whether to send an email notification to the root user of each
  /// account that the invitation will be sent to. This notification is in
  /// addition to an alert that the root user receives in Personal Health
  /// Dashboard. To send an email notification to the root user of each account,
  /// set this value to true.
  ///
  /// Parameter [message] :
  /// A custom message to include in the invitation. Amazon Macie adds this
  /// message to the standard content that it sends for an invitation.
  Future<CreateInvitationsResponse> createInvitations({
    required List<String> accountIds,
    bool? disableEmailNotification,
    String? message,
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

  /// Associates an account with an Amazon Macie administrator account.
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
  /// The details of the account to associate with the administrator account.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// account in Amazon Macie.
  ///
  /// An account can have a maximum of 50 tags. Each tag consists of a tag key
  /// and an associated tag value. The maximum length of a tag key is 128
  /// characters. The maximum length of a tag value is 256 characters.
  Future<CreateMemberResponse> createMember({
    required AccountDetail account,
    Map<String, String>? tags,
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
    List<FindingType>? findingTypes,
  }) async {
    final $payload = <String, dynamic>{
      if (findingTypes != null)
        'findingTypes': findingTypes.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/sample',
      exceptionFnMap: _exceptionFns,
    );
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
  /// An array that lists Amazon Web Services account IDs, one for each account
  /// that sent an invitation to decline.
  Future<DeclineInvitationsResponse> declineInvitations({
    required List<String> accountIds,
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/custom-data-identifiers/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/findingsfilters/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
  /// An array that lists Amazon Web Services account IDs, one for each account
  /// that sent an invitation to delete.
  Future<DeleteInvitationsResponse> deleteInvitations({
    required List<String> accountIds,
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

  /// Deletes the association between an Amazon Macie administrator account and
  /// an account.
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/members/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    Map<String, BucketCriteriaAdditionalProperties>? criteria,
    int? maxResults,
    String? nextToken,
    BucketSortCriteria? sortCriteria,
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
    required String jobId,
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

  /// Retrieves the Amazon Macie configuration settings for an Amazon Web
  /// Services organization.
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
  }

  /// Disables an account as the delegated Amazon Macie administrator account
  /// for an Amazon Web Services organization.
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
  /// The Amazon Web Services account ID of the delegated Amazon Macie
  /// administrator account.
  Future<void> disableOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    final $query = <String, List<String>>{
      'adminAccountId': [adminAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/admin',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a member account from its Amazon Macie administrator
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<void> disassociateFromAdministratorAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/administrator/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// (Deprecated) Disassociates a member account from its Amazon Macie
  /// administrator account. This operation has been replaced by the <link
  /// linkend="DisassociateFromAdministratorAccount">DisassociateFromAdministratorAccount</link>
  /// operation.
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
  }

  /// Disassociates an Amazon Macie administrator account from a member account.
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/members/disassociate/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
  /// This includes publishing updates to Security Hub and Amazon EventBridge
  /// (formerly called Amazon CloudWatch Events).
  ///
  /// Parameter [status] :
  /// Specifies the new status for the account. To enable Amazon Macie and start
  /// all Macie activities for the account, set this value to ENABLED.
  Future<void> enableMacie({
    String? clientToken,
    FindingPublishingFrequency? findingPublishingFrequency,
    MacieStatus? status,
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
  }

  /// Designates an account as the delegated Amazon Macie administrator account
  /// for an Amazon Web Services organization.
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
  /// The Amazon Web Services account ID for the account to designate as the
  /// delegated Amazon Macie administrator account for the organization.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  Future<void> enableOrganizationAdminAccount({
    required String adminAccountId,
    String? clientToken,
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
  }

  /// Retrieves information about the Amazon Macie administrator account for an
  /// account.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<GetAdministratorAccountResponse> getAdministratorAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/administrator',
      exceptionFnMap: _exceptionFns,
    );
    return GetAdministratorAccountResponse.fromJson(response);
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
  /// The unique identifier for the Amazon Web Services account.
  Future<GetBucketStatisticsResponse> getBucketStatistics({
    String? accountId,
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
    required String id,
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
    required GroupBy groupBy,
    FindingCriteria? findingCriteria,
    int? size,
    FindingStatisticsSortCriteria? sortCriteria,
  }) async {
    ArgumentError.checkNotNull(groupBy, 'groupBy');
    final $payload = <String, dynamic>{
      'groupBy': groupBy.toValue(),
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
    required List<String> findingIds,
    SortCriteria? sortCriteria,
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
    required String id,
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

  /// Retrieves the configuration settings for publishing findings to Security
  /// Hub.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  Future<GetFindingsPublicationConfigurationResponse>
      getFindingsPublicationConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/findings-publication-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsPublicationConfigurationResponse.fromJson(response);
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

  /// (Deprecated) Retrieves information about the Amazon Macie administrator
  /// account for an account. This operation has been replaced by the <link
  /// linkend="GetAdministratorAccount">GetAdministratorAccount</link>
  /// operation.
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

  /// Retrieves information about an account that's associated with an Amazon
  /// Macie administrator account.
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
    required String id,
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
  /// results. If you specify more than one condition, Amazon Macie uses an AND
  /// operator to join the conditions.
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
  ///
  /// Parameter [timeRange] :
  /// The inclusive time period to query usage data for. Valid values are:
  /// MONTH_TO_DATE, for the current calendar month to date; and, PAST_30_DAYS,
  /// for the preceding 30 days. If you don't specify a value, Amazon Macie
  /// provides usage data for the preceding 30 days.
  Future<GetUsageStatisticsResponse> getUsageStatistics({
    List<UsageStatisticsFilter>? filterBy,
    int? maxResults,
    String? nextToken,
    UsageStatisticsSortBy? sortBy,
    TimeRange? timeRange,
  }) async {
    final $payload = <String, dynamic>{
      if (filterBy != null) 'filterBy': filterBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy,
      if (timeRange != null) 'timeRange': timeRange.toValue(),
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
  ///
  /// Parameter [timeRange] :
  /// The inclusive time period to retrieve the data for. Valid values are:
  /// MONTH_TO_DATE, for the current calendar month to date; and, PAST_30_DAYS,
  /// for the preceding 30 days. If you don't specify a value for this
  /// parameter, Amazon Macie provides aggregated usage data for the preceding
  /// 30 days.
  Future<GetUsageTotalsResponse> getUsageTotals({
    String? timeRange,
  }) async {
    final $query = <String, List<String>>{
      if (timeRange != null) 'timeRange': [timeRange],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/usage',
      queryParams: $query,
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
    ListJobsFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    ListJobsSortCriteria? sortCriteria,
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
    int? maxResults,
    String? nextToken,
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
    FindingCriteria? findingCriteria,
    int? maxResults,
    String? nextToken,
    SortCriteria? sortCriteria,
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
    int? maxResults,
    String? nextToken,
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
    int? maxResults,
    String? nextToken,
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
  /// Amazon Macie administrator account.
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
  /// of an account's relationship with the administrator account. By default,
  /// the response includes only current member accounts. To include all
  /// accounts, set this value to false.
  Future<ListMembersResponse> listMembers({
    int? maxResults,
    String? nextToken,
    String? onlyAssociated,
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
  /// account for an Amazon Web Services organization.
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
    int? maxResults,
    String? nextToken,
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
    required String resourceArn,
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
    required ClassificationExportConfiguration configuration,
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

  /// Updates the configuration settings for publishing findings to Security
  /// Hub.
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
  /// Parameter [securityHubConfiguration] :
  /// The configuration settings that determine which findings to publish to
  /// Security Hub.
  Future<void> putFindingsPublicationConfiguration({
    String? clientToken,
    SecurityHubConfiguration? securityHubConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (securityHubConfiguration != null)
        'securityHubConfiguration': securityHubConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/findings-publication-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves (queries) statistical data and other information about Amazon
  /// Web Services resources that Amazon Macie monitors and analyzes.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bucketCriteria] :
  /// The filter conditions that determine which S3 buckets to include or
  /// exclude from the query results.
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
  /// The criteria to use to sort the results.
  Future<SearchResourcesResponse> searchResources({
    SearchResourcesBucketCriteria? bucketCriteria,
    int? maxResults,
    String? nextToken,
    SearchResourcesSortCriteria? sortCriteria,
  }) async {
    final $payload = <String, dynamic>{
      if (bucketCriteria != null) 'bucketCriteria': bucketCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/datasources/search-resources',
      exceptionFnMap: _exceptionFns,
    );
    return SearchResourcesResponse.fromJson(response);
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
    required String resourceArn,
    required Map<String, String> tags,
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
  /// contain as many as 10 ignore words. Each ignore word can contain 4-90
  /// characters. Ignore words are case sensitive.
  ///
  /// Parameter [keywords] :
  /// An array that lists specific character sequences (keywords), one of which
  /// must be within proximity (maximumMatchDistance) of the regular expression
  /// to match. The array can contain as many as 50 keywords. Each keyword can
  /// contain 3-90 characters. Keywords aren't case sensitive.
  ///
  /// Parameter [maximumMatchDistance] :
  /// The maximum number of characters that can exist between text that matches
  /// the regex pattern and the character sequences specified by the keywords
  /// array. Macie includes or excludes a result based on the proximity of a
  /// keyword to text that matches the regex pattern. The distance can be 1-300
  /// characters. The default value is 50.
  Future<TestCustomDataIdentifierResponse> testCustomDataIdentifier({
    required String regex,
    required String sampleText,
    List<String>? ignoreWords,
    List<String>? keywords,
    int? maximumMatchDistance,
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// job's current status is IDLE, PAUSED, or RUNNING. If you specify this
  /// value and the job's current status is RUNNING, Macie immediately begins to
  /// pause all processing tasks for the job.
  ///
  /// If you pause a one-time job and you don't resume it within 30 days, the
  /// job expires and Macie cancels the job. If you pause a recurring job when
  /// its status is RUNNING and you don't resume it within 30 days, the job run
  /// expires and Macie cancels the run. To check the expiration date, refer to
  /// the UserPausedDetails.jobExpiresAt property.
  /// </li>
  /// </ul>
  Future<void> updateClassificationJob({
    required String jobId,
    required JobStatus jobStatus,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(jobStatus, 'jobStatus');
    final $payload = <String, dynamic>{
      'jobStatus': jobStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
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
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
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
    required String id,
    FindingsFilterAction? action,
    String? clientToken,
    String? description,
    FindingCriteria? findingCriteria,
    String? name,
    int? position,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      if (action != null) 'action': action.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
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
  /// This includes publishing updates to Security Hub and Amazon EventBridge
  /// (formerly called Amazon CloudWatch Events).
  ///
  /// Parameter [status] :
  /// Specifies a new status for the account. Valid values are: ENABLED, resume
  /// all Amazon Macie activities for the account; and, PAUSED, suspend all
  /// Macie activities for the account.
  Future<void> updateMacieSession({
    FindingPublishingFrequency? findingPublishingFrequency,
    MacieStatus? status,
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
  }

  /// Enables an Amazon Macie administrator to suspend or re-enable a member
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
    required String id,
    required MacieStatus status,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(status, 'status');
    final $payload = <String, dynamic>{
      'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/macie/members/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the Amazon Macie configuration settings for an Amazon Web Services
  /// organization.
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
  /// Specifies whether to enable Amazon Macie automatically for each account,
  /// when the account is added to the Amazon Web Services organization.
  Future<void> updateOrganizationConfiguration({
    required bool autoEnable,
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
  }
}

class AcceptInvitationResponse {
  AcceptInvitationResponse();

  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> _) {
    return AcceptInvitationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides information about the permissions settings of the bucket-level
/// access control list (ACL) for an S3 bucket.
class AccessControlList {
  /// Specifies whether the ACL grants the general public with read access
  /// permissions for the bucket.
  final bool? allowsPublicReadAccess;

  /// Specifies whether the ACL grants the general public with write access
  /// permissions for the bucket.
  final bool? allowsPublicWriteAccess;

  AccessControlList({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });

  factory AccessControlList.fromJson(Map<String, dynamic> json) {
    return AccessControlList(
      allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool?,
      allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowsPublicReadAccess = this.allowsPublicReadAccess;
    final allowsPublicWriteAccess = this.allowsPublicWriteAccess;
    return {
      if (allowsPublicReadAccess != null)
        'allowsPublicReadAccess': allowsPublicReadAccess,
      if (allowsPublicWriteAccess != null)
        'allowsPublicWriteAccess': allowsPublicWriteAccess,
    };
  }
}

/// Specifies the details of an account to associate with an Amazon Macie
/// administrator account.
class AccountDetail {
  /// The Amazon Web Services account ID for the account.
  final String accountId;

  /// The email address for the account.
  final String email;

  AccountDetail({
    required this.accountId,
    required this.email,
  });

  factory AccountDetail.fromJson(Map<String, dynamic> json) {
    return AccountDetail(
      accountId: json['accountId'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final email = this.email;
    return {
      'accountId': accountId,
      'email': email,
    };
  }
}

/// Provides information about the account-level permissions settings that apply
/// to an S3 bucket.
class AccountLevelPermissions {
  /// The block public access settings for the Amazon Web Services account that
  /// owns the bucket.
  final BlockPublicAccess? blockPublicAccess;

  AccountLevelPermissions({
    this.blockPublicAccess,
  });

  factory AccountLevelPermissions.fromJson(Map<String, dynamic> json) {
    return AccountLevelPermissions(
      blockPublicAccess: json['blockPublicAccess'] != null
          ? BlockPublicAccess.fromJson(
              json['blockPublicAccess'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blockPublicAccess = this.blockPublicAccess;
    return {
      if (blockPublicAccess != null) 'blockPublicAccess': blockPublicAccess,
    };
  }
}

/// Provides information about the delegated Amazon Macie administrator account
/// for an Amazon Web Services organization.
class AdminAccount {
  /// The Amazon Web Services account ID for the account.
  final String? accountId;

  /// The current status of the account as the delegated administrator of Amazon
  /// Macie for the organization.
  final AdminStatus? status;

  AdminAccount({
    this.accountId,
    this.status,
  });

  factory AdminAccount.fromJson(Map<String, dynamic> json) {
    return AdminAccount(
      accountId: json['accountId'] as String?,
      status: (json['status'] as String?)?.toAdminStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final status = this.status;
    return {
      if (accountId != null) 'accountId': accountId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The current status of an account as the delegated Amazon Macie administrator
/// account for an Amazon Web Services organization. Possible values are:
enum AdminStatus {
  enabled,
  disablingInProgress,
}

extension on AdminStatus {
  String toValue() {
    switch (this) {
      case AdminStatus.enabled:
        return 'ENABLED';
      case AdminStatus.disablingInProgress:
        return 'DISABLING_IN_PROGRESS';
    }
  }
}

extension on String {
  AdminStatus toAdminStatus() {
    switch (this) {
      case 'ENABLED':
        return AdminStatus.enabled;
      case 'DISABLING_IN_PROGRESS':
        return AdminStatus.disablingInProgress;
    }
    throw Exception('$this is not known in enum AdminStatus');
  }
}

enum AllowsUnencryptedObjectUploads {
  $true,
  $false,
  unknown,
}

extension on AllowsUnencryptedObjectUploads {
  String toValue() {
    switch (this) {
      case AllowsUnencryptedObjectUploads.$true:
        return 'TRUE';
      case AllowsUnencryptedObjectUploads.$false:
        return 'FALSE';
      case AllowsUnencryptedObjectUploads.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  AllowsUnencryptedObjectUploads toAllowsUnencryptedObjectUploads() {
    switch (this) {
      case 'TRUE':
        return AllowsUnencryptedObjectUploads.$true;
      case 'FALSE':
        return AllowsUnencryptedObjectUploads.$false;
      case 'UNKNOWN':
        return AllowsUnencryptedObjectUploads.unknown;
    }
    throw Exception(
        '$this is not known in enum AllowsUnencryptedObjectUploads');
  }
}

/// Provides information about an API operation that an entity invoked for an
/// affected resource.
class ApiCallDetails {
  /// The name of the operation that was invoked most recently and produced the
  /// finding.
  final String? api;

  /// The URL of the Amazon Web Service that provides the operation, for example:
  /// s3.amazonaws.com.
  final String? apiServiceName;

  /// The first date and time, in UTC and extended ISO 8601 format, when any
  /// operation was invoked and produced the finding.
  final DateTime? firstSeen;

  /// The most recent date and time, in UTC and extended ISO 8601 format, when the
  /// specified operation (api) was invoked and produced the finding.
  final DateTime? lastSeen;

  ApiCallDetails({
    this.api,
    this.apiServiceName,
    this.firstSeen,
    this.lastSeen,
  });

  factory ApiCallDetails.fromJson(Map<String, dynamic> json) {
    return ApiCallDetails(
      api: json['api'] as String?,
      apiServiceName: json['apiServiceName'] as String?,
      firstSeen: timeStampFromJson(json['firstSeen']),
      lastSeen: timeStampFromJson(json['lastSeen']),
    );
  }

  Map<String, dynamic> toJson() {
    final api = this.api;
    final apiServiceName = this.apiServiceName;
    final firstSeen = this.firstSeen;
    final lastSeen = this.lastSeen;
    return {
      if (api != null) 'api': api,
      if (apiServiceName != null) 'apiServiceName': apiServiceName,
      if (firstSeen != null) 'firstSeen': iso8601ToJson(firstSeen),
      if (lastSeen != null) 'lastSeen': iso8601ToJson(lastSeen),
    };
  }
}

/// Provides information about an identity that performed an action on an
/// affected resource by using temporary security credentials. The credentials
/// were obtained using the AssumeRole operation of the Security Token Service
/// (STS) API.
class AssumedRole {
  /// The Amazon Web Services access key ID that identifies the credentials.
  final String? accessKeyId;

  /// The unique identifier for the Amazon Web Services account that owns the
  /// entity that was used to get the credentials.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the entity that was used to get the
  /// credentials.
  final String? arn;

  /// The unique identifier for the entity that was used to get the credentials.
  final String? principalId;

  /// The details of the session that was created for the credentials, including
  /// the entity that issued the session.
  final SessionContext? sessionContext;

  AssumedRole({
    this.accessKeyId,
    this.accountId,
    this.arn,
    this.principalId,
    this.sessionContext,
  });

  factory AssumedRole.fromJson(Map<String, dynamic> json) {
    return AssumedRole(
      accessKeyId: json['accessKeyId'] as String?,
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      principalId: json['principalId'] as String?,
      sessionContext: json['sessionContext'] != null
          ? SessionContext.fromJson(
              json['sessionContext'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final accountId = this.accountId;
    final arn = this.arn;
    final principalId = this.principalId;
    final sessionContext = this.sessionContext;
    return {
      if (accessKeyId != null) 'accessKeyId': accessKeyId,
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (principalId != null) 'principalId': principalId,
      if (sessionContext != null) 'sessionContext': sessionContext,
    };
  }
}

/// Provides information about an Amazon Web Services account and entity that
/// performed an action on an affected resource. The action was performed using
/// the credentials for an Amazon Web Services account other than your own
/// account.
class AwsAccount {
  /// The unique identifier for the Amazon Web Services account.
  final String? accountId;

  /// The unique identifier for the entity that performed the action.
  final String? principalId;

  AwsAccount({
    this.accountId,
    this.principalId,
  });

  factory AwsAccount.fromJson(Map<String, dynamic> json) {
    return AwsAccount(
      accountId: json['accountId'] as String?,
      principalId: json['principalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final principalId = this.principalId;
    return {
      if (accountId != null) 'accountId': accountId,
      if (principalId != null) 'principalId': principalId,
    };
  }
}

/// Provides information about an Amazon Web Service that performed an action on
/// an affected resource.
class AwsService {
  /// The name of the Amazon Web Service that performed the action.
  final String? invokedBy;

  AwsService({
    this.invokedBy,
  });

  factory AwsService.fromJson(Map<String, dynamic> json) {
    return AwsService(
      invokedBy: json['invokedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invokedBy = this.invokedBy;
    return {
      if (invokedBy != null) 'invokedBy': invokedBy,
    };
  }
}

/// Provides information about a custom data identifier.
class BatchGetCustomDataIdentifierSummary {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  final String? arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the custom data
  /// identifier was created.
  final DateTime? createdAt;

  /// Specifies whether the custom data identifier was deleted. If you delete a
  /// custom data identifier, Amazon Macie doesn't delete it permanently. Instead,
  /// it soft deletes the identifier.
  final bool? deleted;

  /// The custom description of the custom data identifier.
  final String? description;

  /// The unique identifier for the custom data identifier.
  final String? id;

  /// The custom name of the custom data identifier.
  final String? name;

  BatchGetCustomDataIdentifierSummary({
    this.arn,
    this.createdAt,
    this.deleted,
    this.description,
    this.id,
    this.name,
  });

  factory BatchGetCustomDataIdentifierSummary.fromJson(
      Map<String, dynamic> json) {
    return BatchGetCustomDataIdentifierSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deleted: json['deleted'] as bool?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deleted = this.deleted;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deleted != null) 'deleted': deleted,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

class BatchGetCustomDataIdentifiersResponse {
  /// An array of objects, one for each custom data identifier that meets the
  /// criteria specified in the request.
  final List<BatchGetCustomDataIdentifierSummary>? customDataIdentifiers;

  /// An array of identifiers, one for each identifier that was specified in the
  /// request, but doesn't correlate to an existing custom data identifier.
  final List<String>? notFoundIdentifierIds;

  BatchGetCustomDataIdentifiersResponse({
    this.customDataIdentifiers,
    this.notFoundIdentifierIds,
  });

  factory BatchGetCustomDataIdentifiersResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetCustomDataIdentifiersResponse(
      customDataIdentifiers: (json['customDataIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => BatchGetCustomDataIdentifierSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      notFoundIdentifierIds: (json['notFoundIdentifierIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customDataIdentifiers = this.customDataIdentifiers;
    final notFoundIdentifierIds = this.notFoundIdentifierIds;
    return {
      if (customDataIdentifiers != null)
        'customDataIdentifiers': customDataIdentifiers,
      if (notFoundIdentifierIds != null)
        'notFoundIdentifierIds': notFoundIdentifierIds,
    };
  }
}

/// Provides information about the block public access settings for an S3
/// bucket. These settings can apply to a bucket at the account level or bucket
/// level. For detailed information about each setting, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html">Blocking
/// public access to your Amazon S3 storage</a> in the <i>Amazon Simple Storage
/// Service User Guide</i>.
class BlockPublicAccess {
  /// Specifies whether Amazon S3 blocks public access control lists (ACLs) for
  /// the bucket and objects in the bucket.
  final bool? blockPublicAcls;

  /// Specifies whether Amazon S3 blocks public bucket policies for the bucket.
  final bool? blockPublicPolicy;

  /// Specifies whether Amazon S3 ignores public ACLs for the bucket and objects
  /// in the bucket.
  final bool? ignorePublicAcls;

  /// Specifies whether Amazon S3 restricts public bucket policies for the bucket.
  final bool? restrictPublicBuckets;

  BlockPublicAccess({
    this.blockPublicAcls,
    this.blockPublicPolicy,
    this.ignorePublicAcls,
    this.restrictPublicBuckets,
  });

  factory BlockPublicAccess.fromJson(Map<String, dynamic> json) {
    return BlockPublicAccess(
      blockPublicAcls: json['blockPublicAcls'] as bool?,
      blockPublicPolicy: json['blockPublicPolicy'] as bool?,
      ignorePublicAcls: json['ignorePublicAcls'] as bool?,
      restrictPublicBuckets: json['restrictPublicBuckets'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockPublicAcls = this.blockPublicAcls;
    final blockPublicPolicy = this.blockPublicPolicy;
    final ignorePublicAcls = this.ignorePublicAcls;
    final restrictPublicBuckets = this.restrictPublicBuckets;
    return {
      if (blockPublicAcls != null) 'blockPublicAcls': blockPublicAcls,
      if (blockPublicPolicy != null) 'blockPublicPolicy': blockPublicPolicy,
      if (ignorePublicAcls != null) 'ignorePublicAcls': ignorePublicAcls,
      if (restrictPublicBuckets != null)
        'restrictPublicBuckets': restrictPublicBuckets,
    };
  }
}

/// Provides information about the number of S3 buckets that are publicly
/// accessible based on a combination of permissions settings for each bucket.
class BucketCountByEffectivePermission {
  /// The total number of buckets that allow the general public to have read or
  /// write access to the bucket.
  final int? publiclyAccessible;

  /// The total number of buckets that allow the general public to have read
  /// access to the bucket.
  final int? publiclyReadable;

  /// The total number of buckets that allow the general public to have write
  /// access to the bucket.
  final int? publiclyWritable;

  /// The total number of buckets that Amazon Macie wasn't able to evaluate
  /// permissions settings for. Macie can't determine whether these buckets are
  /// publicly accessible.
  final int? unknown;

  BucketCountByEffectivePermission({
    this.publiclyAccessible,
    this.publiclyReadable,
    this.publiclyWritable,
    this.unknown,
  });

  factory BucketCountByEffectivePermission.fromJson(Map<String, dynamic> json) {
    return BucketCountByEffectivePermission(
      publiclyAccessible: json['publiclyAccessible'] as int?,
      publiclyReadable: json['publiclyReadable'] as int?,
      publiclyWritable: json['publiclyWritable'] as int?,
      unknown: json['unknown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final publiclyAccessible = this.publiclyAccessible;
    final publiclyReadable = this.publiclyReadable;
    final publiclyWritable = this.publiclyWritable;
    final unknown = this.unknown;
    return {
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (publiclyReadable != null) 'publiclyReadable': publiclyReadable,
      if (publiclyWritable != null) 'publiclyWritable': publiclyWritable,
      if (unknown != null) 'unknown': unknown,
    };
  }
}

/// Provides information about the number of S3 buckets that use certain types
/// of server-side encryption by default or don't encrypt new objects by
/// default. For detailed information about these settings, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-encryption.html">Setting
/// default server-side encryption behavior for Amazon S3 buckets</a> in the
/// <i>Amazon Simple Storage Service User Guide</i>.
class BucketCountByEncryptionType {
  /// The total number of buckets that use an Key Management Service (KMS)
  /// customer master key (CMK) to encrypt new objects by default. These buckets
  /// use Amazon Web Services managed KMS encryption (AWS-KMS) or customer managed
  /// KMS encryption (SSE-KMS) by default.
  final int? kmsManaged;

  /// The total number of buckets that use an Amazon S3 managed key to encrypt new
  /// objects by default. These buckets use Amazon S3 managed encryption (SSE-S3)
  /// by default.
  final int? s3Managed;

  /// The total number of buckets that don't encrypt new objects by default.
  /// Default encryption is disabled for these buckets.
  final int? unencrypted;

  /// The total number of buckets that Amazon Macie doesn't have current
  /// encryption metadata for. Macie can't provide current data about the default
  /// encryption settings for these buckets.
  final int? unknown;

  BucketCountByEncryptionType({
    this.kmsManaged,
    this.s3Managed,
    this.unencrypted,
    this.unknown,
  });

  factory BucketCountByEncryptionType.fromJson(Map<String, dynamic> json) {
    return BucketCountByEncryptionType(
      kmsManaged: json['kmsManaged'] as int?,
      s3Managed: json['s3Managed'] as int?,
      unencrypted: json['unencrypted'] as int?,
      unknown: json['unknown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsManaged = this.kmsManaged;
    final s3Managed = this.s3Managed;
    final unencrypted = this.unencrypted;
    final unknown = this.unknown;
    return {
      if (kmsManaged != null) 'kmsManaged': kmsManaged,
      if (s3Managed != null) 's3Managed': s3Managed,
      if (unencrypted != null) 'unencrypted': unencrypted,
      if (unknown != null) 'unknown': unknown,
    };
  }
}

/// Provides information about the number of S3 buckets that are or aren't
/// shared with other Amazon Web Services accounts.
class BucketCountBySharedAccessType {
  /// The total number of buckets that are shared with an Amazon Web Services
  /// account that isn't part of the same Amazon Macie organization.
  final int? external;

  /// The total number of buckets that are shared with an Amazon Web Services
  /// account that's part of the same Amazon Macie organization.
  final int? internal;

  /// The total number of buckets that aren't shared with other Amazon Web
  /// Services accounts.
  final int? notShared;

  /// The total number of buckets that Amazon Macie wasn't able to evaluate shared
  /// access settings for. Macie can't determine whether these buckets are shared
  /// with other Amazon Web Services accounts.
  final int? unknown;

  BucketCountBySharedAccessType({
    this.external,
    this.internal,
    this.notShared,
    this.unknown,
  });

  factory BucketCountBySharedAccessType.fromJson(Map<String, dynamic> json) {
    return BucketCountBySharedAccessType(
      external: json['external'] as int?,
      internal: json['internal'] as int?,
      notShared: json['notShared'] as int?,
      unknown: json['unknown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final external = this.external;
    final internal = this.internal;
    final notShared = this.notShared;
    final unknown = this.unknown;
    return {
      if (external != null) 'external': external,
      if (internal != null) 'internal': internal,
      if (notShared != null) 'notShared': notShared,
      if (unknown != null) 'unknown': unknown,
    };
  }
}

/// Provides information about the number of S3 buckets whose bucket policies do
/// or don't require server-side encryption of objects when objects are uploaded
/// to the buckets.
class BucketCountPolicyAllowsUnencryptedObjectUploads {
  /// The total number of buckets that don't have a bucket policy or have a bucket
  /// policy that doesn't require server-side encryption of new objects. If a
  /// bucket policy exists, the policy doesn't require PutObject requests to
  /// include the x-amz-server-side-encryption header and it doesn't require the
  /// value for that header to be AES256 or aws:kms.
  final int? allowsUnencryptedObjectUploads;

  /// The total number of buckets whose bucket policies require server-side
  /// encryption of new objects. PutObject requests for these buckets must include
  /// the x-amz-server-side-encryption header and the value for that header must
  /// be AES256 or aws:kms.
  final int? deniesUnencryptedObjectUploads;

  /// The total number of buckets that Amazon Macie wasn't able to evaluate
  /// server-side encryption requirements for. Macie can't determine whether the
  /// bucket policies for these buckets require server-side encryption of new
  /// objects.
  final int? unknown;

  BucketCountPolicyAllowsUnencryptedObjectUploads({
    this.allowsUnencryptedObjectUploads,
    this.deniesUnencryptedObjectUploads,
    this.unknown,
  });

  factory BucketCountPolicyAllowsUnencryptedObjectUploads.fromJson(
      Map<String, dynamic> json) {
    return BucketCountPolicyAllowsUnencryptedObjectUploads(
      allowsUnencryptedObjectUploads:
          json['allowsUnencryptedObjectUploads'] as int?,
      deniesUnencryptedObjectUploads:
          json['deniesUnencryptedObjectUploads'] as int?,
      unknown: json['unknown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowsUnencryptedObjectUploads = this.allowsUnencryptedObjectUploads;
    final deniesUnencryptedObjectUploads = this.deniesUnencryptedObjectUploads;
    final unknown = this.unknown;
    return {
      if (allowsUnencryptedObjectUploads != null)
        'allowsUnencryptedObjectUploads': allowsUnencryptedObjectUploads,
      if (deniesUnencryptedObjectUploads != null)
        'deniesUnencryptedObjectUploads': deniesUnencryptedObjectUploads,
      if (unknown != null) 'unknown': unknown,
    };
  }
}

/// Specifies the operator to use in a property-based condition that filters the
/// results of a query for information about S3 buckets.
class BucketCriteriaAdditionalProperties {
  /// The value for the property matches (equals) the specified value. If you
  /// specify multiple values, Macie uses OR logic to join the values.
  final List<String>? eq;

  /// The value for the property is greater than the specified value.
  final int? gt;

  /// The value for the property is greater than or equal to the specified value.
  final int? gte;

  /// The value for the property is less than the specified value.
  final int? lt;

  /// The value for the property is less than or equal to the specified value.
  final int? lte;

  /// The value for the property doesn't match (doesn't equal) the specified
  /// value. If you specify multiple values, Amazon Macie uses OR logic to join
  /// the values.
  final List<String>? neq;

  /// The name of the bucket begins with the specified value.
  final String? prefix;

  BucketCriteriaAdditionalProperties({
    this.eq,
    this.gt,
    this.gte,
    this.lt,
    this.lte,
    this.neq,
    this.prefix,
  });

  factory BucketCriteriaAdditionalProperties.fromJson(
      Map<String, dynamic> json) {
    return BucketCriteriaAdditionalProperties(
      eq: (json['eq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      neq: (json['neq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eq = this.eq;
    final gt = this.gt;
    final gte = this.gte;
    final lt = this.lt;
    final lte = this.lte;
    final neq = this.neq;
    final prefix = this.prefix;
    return {
      if (eq != null) 'eq': eq,
      if (gt != null) 'gt': gt,
      if (gte != null) 'gte': gte,
      if (lt != null) 'lt': lt,
      if (lte != null) 'lte': lte,
      if (neq != null) 'neq': neq,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Provides information about the bucket-level permissions settings for an S3
/// bucket.
class BucketLevelPermissions {
  /// The permissions settings of the access control list (ACL) for the bucket.
  /// This value is null if an ACL hasn't been defined for the bucket.
  final AccessControlList? accessControlList;

  /// The block public access settings for the bucket.
  final BlockPublicAccess? blockPublicAccess;

  /// The permissions settings of the bucket policy for the bucket. This value is
  /// null if a bucket policy hasn't been defined for the bucket.
  final BucketPolicy? bucketPolicy;

  BucketLevelPermissions({
    this.accessControlList,
    this.blockPublicAccess,
    this.bucketPolicy,
  });

  factory BucketLevelPermissions.fromJson(Map<String, dynamic> json) {
    return BucketLevelPermissions(
      accessControlList: json['accessControlList'] != null
          ? AccessControlList.fromJson(
              json['accessControlList'] as Map<String, dynamic>)
          : null,
      blockPublicAccess: json['blockPublicAccess'] != null
          ? BlockPublicAccess.fromJson(
              json['blockPublicAccess'] as Map<String, dynamic>)
          : null,
      bucketPolicy: json['bucketPolicy'] != null
          ? BucketPolicy.fromJson(json['bucketPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessControlList = this.accessControlList;
    final blockPublicAccess = this.blockPublicAccess;
    final bucketPolicy = this.bucketPolicy;
    return {
      if (accessControlList != null) 'accessControlList': accessControlList,
      if (blockPublicAccess != null) 'blockPublicAccess': blockPublicAccess,
      if (bucketPolicy != null) 'bucketPolicy': bucketPolicy,
    };
  }
}

/// Provides information about an S3 bucket that Amazon Macie monitors and
/// analyzes.
class BucketMetadata {
  /// The unique identifier for the Amazon Web Services account that owns the
  /// bucket.
  final String? accountId;

  /// Specifies whether the bucket policy for the bucket requires server-side
  /// encryption of objects when objects are uploaded to the bucket. Possible
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// FALSE - The bucket policy requires server-side encryption of new objects.
  /// PutObject requests must include the x-amz-server-side-encryption header and
  /// the value for that header must be AES256 or aws:kms.
  /// </li>
  /// <li>
  /// TRUE - The bucket doesn't have a bucket policy or it has a bucket policy
  /// that doesn't require server-side encryption of new objects. If a bucket
  /// policy exists, it doesn't require PutObject requests to include the
  /// x-amz-server-side-encryption header and it doesn't require the value for
  /// that header to be AES256 or aws:kms.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie can't determine whether the bucket policy requires
  /// server-side encryption of new objects.
  /// </li>
  /// </ul>
  final AllowsUnencryptedObjectUploads? allowsUnencryptedObjectUploads;

  /// The Amazon Resource Name (ARN) of the bucket.
  final String? bucketArn;

  /// The date and time, in UTC and extended ISO 8601 format, when the bucket was
  /// created.
  final DateTime? bucketCreatedAt;

  /// The name of the bucket.
  final String? bucketName;

  /// The total number of objects that Amazon Macie can analyze in the bucket.
  /// These objects use a supported storage class and have a file name extension
  /// for a supported file or storage format.
  final int? classifiableObjectCount;

  /// The total storage size, in bytes, of the objects that Amazon Macie can
  /// analyze in the bucket. These objects use a supported storage class and have
  /// a file name extension for a supported file or storage format.
  ///
  /// If versioning is enabled for the bucket, Macie calculates this value based
  /// on the size of the latest version of each applicable object in the bucket.
  /// This value doesn't reflect the storage size of all versions of each
  /// applicable object in the bucket.
  final int? classifiableSizeInBytes;

  /// Specifies whether any one-time or recurring classification jobs are
  /// configured to analyze data in the bucket, and, if so, the details of the job
  /// that ran most recently.
  final JobDetails? jobDetails;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently retrieved both bucket and object metadata from Amazon S3 for
  /// the bucket.
  final DateTime? lastUpdated;

  /// The total number of objects in the bucket.
  final int? objectCount;

  /// The total number of objects that are in the bucket, grouped by server-side
  /// encryption type. This includes a grouping that reports the total number of
  /// objects that aren't encrypted or use client-side encryption.
  final ObjectCountByEncryptionType? objectCountByEncryptionType;

  /// Specifies whether the bucket is publicly accessible due to the combination
  /// of permissions settings that apply to the bucket, and provides information
  /// about those settings.
  final BucketPublicAccess? publicAccess;

  /// The Amazon Web Services Region that hosts the bucket.
  final String? region;

  /// Specifies whether the bucket is configured to replicate one or more objects
  /// to buckets for other Amazon Web Services accounts and, if so, which
  /// accounts.
  final ReplicationDetails? replicationDetails;

  /// Specifies whether the bucket encrypts new objects by default and, if so, the
  /// type of server-side encryption that's used.
  final BucketServerSideEncryption? serverSideEncryption;

  /// Specifies whether the bucket is shared with another Amazon Web Services
  /// account. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// EXTERNAL - The bucket is shared with an Amazon Web Services account that
  /// isn't part of the same Amazon Macie organization.
  /// </li>
  /// <li>
  /// INTERNAL - The bucket is shared with an Amazon Web Services account that's
  /// part of the same Amazon Macie organization.
  /// </li>
  /// <li>
  /// NOT_SHARED - The bucket isn't shared with other Amazon Web Services
  /// accounts.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie wasn't able to evaluate the shared access settings
  /// for the bucket.
  /// </li>
  /// </ul>
  final SharedAccess? sharedAccess;

  /// The total storage size, in bytes, of the bucket.
  ///
  /// If versioning is enabled for the bucket, Amazon Macie calculates this value
  /// based on the size of the latest version of each object in the bucket. This
  /// value doesn't reflect the storage size of all versions of each object in the
  /// bucket.
  final int? sizeInBytes;

  /// The total storage size, in bytes, of the objects that are compressed (.gz,
  /// .gzip, .zip) files in the bucket.
  ///
  /// If versioning is enabled for the bucket, Macie calculates this value based
  /// on the size of the latest version of each applicable object in the bucket.
  /// This value doesn't reflect the storage size of all versions of each
  /// applicable object in the bucket.
  final int? sizeInBytesCompressed;

  /// An array that specifies the tags (keys and values) that are associated with
  /// the bucket.
  final List<KeyValuePair>? tags;

  /// The total number of objects that Amazon Macie can't analyze in the bucket.
  /// These objects don't use a supported storage class or don't have a file name
  /// extension for a supported file or storage format.
  final ObjectLevelStatistics? unclassifiableObjectCount;

  /// The total storage size, in bytes, of the objects that Amazon Macie can't
  /// analyze in the bucket. These objects don't use a supported storage class or
  /// don't have a file name extension for a supported file or storage format.
  final ObjectLevelStatistics? unclassifiableObjectSizeInBytes;

  /// Specifies whether versioning is enabled for the bucket.
  final bool? versioning;

  BucketMetadata({
    this.accountId,
    this.allowsUnencryptedObjectUploads,
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
    this.serverSideEncryption,
    this.sharedAccess,
    this.sizeInBytes,
    this.sizeInBytesCompressed,
    this.tags,
    this.unclassifiableObjectCount,
    this.unclassifiableObjectSizeInBytes,
    this.versioning,
  });

  factory BucketMetadata.fromJson(Map<String, dynamic> json) {
    return BucketMetadata(
      accountId: json['accountId'] as String?,
      allowsUnencryptedObjectUploads:
          (json['allowsUnencryptedObjectUploads'] as String?)
              ?.toAllowsUnencryptedObjectUploads(),
      bucketArn: json['bucketArn'] as String?,
      bucketCreatedAt: timeStampFromJson(json['bucketCreatedAt']),
      bucketName: json['bucketName'] as String?,
      classifiableObjectCount: json['classifiableObjectCount'] as int?,
      classifiableSizeInBytes: json['classifiableSizeInBytes'] as int?,
      jobDetails: json['jobDetails'] != null
          ? JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>)
          : null,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      objectCount: json['objectCount'] as int?,
      objectCountByEncryptionType: json['objectCountByEncryptionType'] != null
          ? ObjectCountByEncryptionType.fromJson(
              json['objectCountByEncryptionType'] as Map<String, dynamic>)
          : null,
      publicAccess: json['publicAccess'] != null
          ? BucketPublicAccess.fromJson(
              json['publicAccess'] as Map<String, dynamic>)
          : null,
      region: json['region'] as String?,
      replicationDetails: json['replicationDetails'] != null
          ? ReplicationDetails.fromJson(
              json['replicationDetails'] as Map<String, dynamic>)
          : null,
      serverSideEncryption: json['serverSideEncryption'] != null
          ? BucketServerSideEncryption.fromJson(
              json['serverSideEncryption'] as Map<String, dynamic>)
          : null,
      sharedAccess: (json['sharedAccess'] as String?)?.toSharedAccess(),
      sizeInBytes: json['sizeInBytes'] as int?,
      sizeInBytesCompressed: json['sizeInBytesCompressed'] as int?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      unclassifiableObjectCount: json['unclassifiableObjectCount'] != null
          ? ObjectLevelStatistics.fromJson(
              json['unclassifiableObjectCount'] as Map<String, dynamic>)
          : null,
      unclassifiableObjectSizeInBytes:
          json['unclassifiableObjectSizeInBytes'] != null
              ? ObjectLevelStatistics.fromJson(
                  json['unclassifiableObjectSizeInBytes']
                      as Map<String, dynamic>)
              : null,
      versioning: json['versioning'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final allowsUnencryptedObjectUploads = this.allowsUnencryptedObjectUploads;
    final bucketArn = this.bucketArn;
    final bucketCreatedAt = this.bucketCreatedAt;
    final bucketName = this.bucketName;
    final classifiableObjectCount = this.classifiableObjectCount;
    final classifiableSizeInBytes = this.classifiableSizeInBytes;
    final jobDetails = this.jobDetails;
    final lastUpdated = this.lastUpdated;
    final objectCount = this.objectCount;
    final objectCountByEncryptionType = this.objectCountByEncryptionType;
    final publicAccess = this.publicAccess;
    final region = this.region;
    final replicationDetails = this.replicationDetails;
    final serverSideEncryption = this.serverSideEncryption;
    final sharedAccess = this.sharedAccess;
    final sizeInBytes = this.sizeInBytes;
    final sizeInBytesCompressed = this.sizeInBytesCompressed;
    final tags = this.tags;
    final unclassifiableObjectCount = this.unclassifiableObjectCount;
    final unclassifiableObjectSizeInBytes =
        this.unclassifiableObjectSizeInBytes;
    final versioning = this.versioning;
    return {
      if (accountId != null) 'accountId': accountId,
      if (allowsUnencryptedObjectUploads != null)
        'allowsUnencryptedObjectUploads':
            allowsUnencryptedObjectUploads.toValue(),
      if (bucketArn != null) 'bucketArn': bucketArn,
      if (bucketCreatedAt != null)
        'bucketCreatedAt': iso8601ToJson(bucketCreatedAt),
      if (bucketName != null) 'bucketName': bucketName,
      if (classifiableObjectCount != null)
        'classifiableObjectCount': classifiableObjectCount,
      if (classifiableSizeInBytes != null)
        'classifiableSizeInBytes': classifiableSizeInBytes,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (lastUpdated != null) 'lastUpdated': iso8601ToJson(lastUpdated),
      if (objectCount != null) 'objectCount': objectCount,
      if (objectCountByEncryptionType != null)
        'objectCountByEncryptionType': objectCountByEncryptionType,
      if (publicAccess != null) 'publicAccess': publicAccess,
      if (region != null) 'region': region,
      if (replicationDetails != null) 'replicationDetails': replicationDetails,
      if (serverSideEncryption != null)
        'serverSideEncryption': serverSideEncryption,
      if (sharedAccess != null) 'sharedAccess': sharedAccess.toValue(),
      if (sizeInBytes != null) 'sizeInBytes': sizeInBytes,
      if (sizeInBytesCompressed != null)
        'sizeInBytesCompressed': sizeInBytesCompressed,
      if (tags != null) 'tags': tags,
      if (unclassifiableObjectCount != null)
        'unclassifiableObjectCount': unclassifiableObjectCount,
      if (unclassifiableObjectSizeInBytes != null)
        'unclassifiableObjectSizeInBytes': unclassifiableObjectSizeInBytes,
      if (versioning != null) 'versioning': versioning,
    };
  }
}

/// Provides information about the account-level and bucket-level permissions
/// settings for an S3 bucket.
class BucketPermissionConfiguration {
  /// The account-level permissions settings that apply to the bucket.
  final AccountLevelPermissions? accountLevelPermissions;

  /// The bucket-level permissions settings for the bucket.
  final BucketLevelPermissions? bucketLevelPermissions;

  BucketPermissionConfiguration({
    this.accountLevelPermissions,
    this.bucketLevelPermissions,
  });

  factory BucketPermissionConfiguration.fromJson(Map<String, dynamic> json) {
    return BucketPermissionConfiguration(
      accountLevelPermissions: json['accountLevelPermissions'] != null
          ? AccountLevelPermissions.fromJson(
              json['accountLevelPermissions'] as Map<String, dynamic>)
          : null,
      bucketLevelPermissions: json['bucketLevelPermissions'] != null
          ? BucketLevelPermissions.fromJson(
              json['bucketLevelPermissions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLevelPermissions = this.accountLevelPermissions;
    final bucketLevelPermissions = this.bucketLevelPermissions;
    return {
      if (accountLevelPermissions != null)
        'accountLevelPermissions': accountLevelPermissions,
      if (bucketLevelPermissions != null)
        'bucketLevelPermissions': bucketLevelPermissions,
    };
  }
}

/// Provides information about the permissions settings of the bucket policy for
/// an S3 bucket.
class BucketPolicy {
  /// Specifies whether the bucket policy allows the general public to have read
  /// access to the bucket.
  final bool? allowsPublicReadAccess;

  /// Specifies whether the bucket policy allows the general public to have write
  /// access to the bucket.
  final bool? allowsPublicWriteAccess;

  BucketPolicy({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });

  factory BucketPolicy.fromJson(Map<String, dynamic> json) {
    return BucketPolicy(
      allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool?,
      allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowsPublicReadAccess = this.allowsPublicReadAccess;
    final allowsPublicWriteAccess = this.allowsPublicWriteAccess;
    return {
      if (allowsPublicReadAccess != null)
        'allowsPublicReadAccess': allowsPublicReadAccess,
      if (allowsPublicWriteAccess != null)
        'allowsPublicWriteAccess': allowsPublicWriteAccess,
    };
  }
}

/// Provides information about the permissions settings that determine whether
/// an S3 bucket is publicly accessible.
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
  final EffectivePermission? effectivePermission;

  /// The account-level and bucket-level permissions settings for the bucket.
  final BucketPermissionConfiguration? permissionConfiguration;

  BucketPublicAccess({
    this.effectivePermission,
    this.permissionConfiguration,
  });

  factory BucketPublicAccess.fromJson(Map<String, dynamic> json) {
    return BucketPublicAccess(
      effectivePermission:
          (json['effectivePermission'] as String?)?.toEffectivePermission(),
      permissionConfiguration: json['permissionConfiguration'] != null
          ? BucketPermissionConfiguration.fromJson(
              json['permissionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final effectivePermission = this.effectivePermission;
    final permissionConfiguration = this.permissionConfiguration;
    return {
      if (effectivePermission != null)
        'effectivePermission': effectivePermission.toValue(),
      if (permissionConfiguration != null)
        'permissionConfiguration': permissionConfiguration,
    };
  }
}

/// Provides information about the default server-side encryption settings for
/// an S3 bucket. For detailed information about these settings, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-encryption.html">Setting
/// default server-side encryption behavior for Amazon S3 buckets</a> in the
/// <i>Amazon Simple Storage Service User Guide</i>.
class BucketServerSideEncryption {
  /// The Amazon Resource Name (ARN) or unique identifier (key ID) for the Key
  /// Management Service (KMS) customer master key (CMK) that's used by default to
  /// encrypt objects that are added to the bucket. This value is null if the
  /// bucket uses an Amazon S3 managed key to encrypt new objects or the bucket
  /// doesn't encrypt new objects by default.
  final String? kmsMasterKeyId;

  /// The type of server-side encryption that's used by default when storing new
  /// objects in the bucket. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// AES256 - New objects are encrypted with an Amazon S3 managed key and use
  /// Amazon S3 managed encryption (SSE-S3).
  /// </li>
  /// <li>
  /// aws:kms - New objects are encrypted with an KMS CMK, specified by the
  /// kmsMasterKeyId property, and use Amazon Web Services managed KMS encryption
  /// (AWS-KMS) or customer managed KMS encryption (SSE-KMS).
  /// </li>
  /// <li>
  /// NONE - New objects aren't encrypted by default. Default encryption is
  /// disabled for the bucket.
  /// </li>
  /// </ul>
  final Type? type;

  BucketServerSideEncryption({
    this.kmsMasterKeyId,
    this.type,
  });

  factory BucketServerSideEncryption.fromJson(Map<String, dynamic> json) {
    return BucketServerSideEncryption(
      kmsMasterKeyId: json['kmsMasterKeyId'] as String?,
      type: (json['type'] as String?)?.toType(),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsMasterKeyId = this.kmsMasterKeyId;
    final type = this.type;
    return {
      if (kmsMasterKeyId != null) 'kmsMasterKeyId': kmsMasterKeyId,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Specifies criteria for sorting the results of a query for information about
/// S3 buckets.
class BucketSortCriteria {
  /// The name of the bucket property to sort the results by. This value can be
  /// one of the following properties that Amazon Macie defines as bucket
  /// metadata: accountId, bucketName, classifiableObjectCount,
  /// classifiableSizeInBytes, objectCount, or sizeInBytes.
  final String? attributeName;

  /// The sort order to apply to the results, based on the value specified by the
  /// attributeName property. Valid values are: ASC, sort the results in ascending
  /// order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  BucketSortCriteria({
    this.attributeName,
    this.orderBy,
  });

  factory BucketSortCriteria.fromJson(Map<String, dynamic> json) {
    return BucketSortCriteria(
      attributeName: json['attributeName'] as String?,
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName,
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// Specifies the location of an occurrence of sensitive data in a Microsoft
/// Excel workbook, CSV file, or TSV file.
class Cell {
  /// The location of the cell, as an absolute cell reference, that contains the
  /// sensitive data, for example Sheet2!C5 for cell C5 on Sheet2 in a Microsoft
  /// Excel workbook. This value is null for CSV and TSV files.
  final String? cellReference;

  /// The column number of the column that contains the sensitive data. For a
  /// Microsoft Excel workbook, this value correlates to the alphabetical
  /// character(s) for a column identifier, for example: 1 for column A, 2 for
  /// column B, and so on.
  final int? column;

  /// The name of the column that contains the sensitive data, if available.
  final String? columnName;

  /// The row number of the row that contains the sensitive data.
  final int? row;

  Cell({
    this.cellReference,
    this.column,
    this.columnName,
    this.row,
  });

  factory Cell.fromJson(Map<String, dynamic> json) {
    return Cell(
      cellReference: json['cellReference'] as String?,
      column: json['column'] as int?,
      columnName: json['columnName'] as String?,
      row: json['row'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cellReference = this.cellReference;
    final column = this.column;
    final columnName = this.columnName;
    final row = this.row;
    return {
      if (cellReference != null) 'cellReference': cellReference,
      if (column != null) 'column': column,
      if (columnName != null) 'columnName': columnName,
      if (row != null) 'row': row,
    };
  }
}

/// Provides information about a sensitive data finding, including the
/// classification job that produced the finding.
class ClassificationDetails {
  /// The path to the folder or file (in Amazon S3) that contains the
  /// corresponding sensitive data discovery result for the finding. If a finding
  /// applies to a large archive or compressed file, this value is the path to a
  /// folder. Otherwise, this value is the path to a file.
  final String? detailedResultsLocation;

  /// The Amazon Resource Name (ARN) of the classification job that produced the
  /// finding.
  final String? jobArn;

  /// The unique identifier for the classification job that produced the finding.
  final String? jobId;

  /// The status and other details of the finding.
  final ClassificationResult? result;

  ClassificationDetails({
    this.detailedResultsLocation,
    this.jobArn,
    this.jobId,
    this.result,
  });

  factory ClassificationDetails.fromJson(Map<String, dynamic> json) {
    return ClassificationDetails(
      detailedResultsLocation: json['detailedResultsLocation'] as String?,
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
      result: json['result'] != null
          ? ClassificationResult.fromJson(
              json['result'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detailedResultsLocation = this.detailedResultsLocation;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final result = this.result;
    return {
      if (detailedResultsLocation != null)
        'detailedResultsLocation': detailedResultsLocation,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobId != null) 'jobId': jobId,
      if (result != null) 'result': result,
    };
  }
}

/// Specifies where to store data classification results, and the encryption
/// settings to use when storing results in that location. Currently, you can
/// store classification results only in an S3 bucket.
class ClassificationExportConfiguration {
  /// The S3 bucket to store data classification results in, and the encryption
  /// settings to use when storing results in that bucket.
  final S3Destination? s3Destination;

  ClassificationExportConfiguration({
    this.s3Destination,
  });

  factory ClassificationExportConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ClassificationExportConfiguration(
      s3Destination: json['s3Destination'] != null
          ? S3Destination.fromJson(
              json['s3Destination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Destination = this.s3Destination;
    return {
      if (s3Destination != null) 's3Destination': s3Destination,
    };
  }
}

/// Provides the details of a sensitive data finding, including the types,
/// number of occurrences, and locations of the sensitive data that was
/// detected.
class ClassificationResult {
  /// Specifies whether Amazon Macie detected additional occurrences of sensitive
  /// data in the S3 object. A finding includes location data for a maximum of 15
  /// occurrences of sensitive data.
  ///
  /// This value can help you determine whether to investigate additional
  /// occurrences of sensitive data in an object. You can do this by referring to
  /// the corresponding sensitive data discovery result for the finding
  /// (ClassificationDetails.detailedResultsLocation).
  final bool? additionalOccurrences;

  /// The custom data identifiers that detected the sensitive data and the number
  /// of occurrences of the data that they detected.
  final CustomDataIdentifiers? customDataIdentifiers;

  /// The type of content, as a MIME type, that the finding applies to. For
  /// example, application/gzip, for a GNU Gzip compressed archive file, or
  /// application/pdf, for an Adobe Portable Document Format file.
  final String? mimeType;

  /// The category, types, and number of occurrences of the sensitive data that
  /// produced the finding.
  final List<SensitiveDataItem>? sensitiveData;

  /// The total size, in bytes, of the data that the finding applies to.
  final int? sizeClassified;

  /// The status of the finding.
  final ClassificationResultStatus? status;

  ClassificationResult({
    this.additionalOccurrences,
    this.customDataIdentifiers,
    this.mimeType,
    this.sensitiveData,
    this.sizeClassified,
    this.status,
  });

  factory ClassificationResult.fromJson(Map<String, dynamic> json) {
    return ClassificationResult(
      additionalOccurrences: json['additionalOccurrences'] as bool?,
      customDataIdentifiers: json['customDataIdentifiers'] != null
          ? CustomDataIdentifiers.fromJson(
              json['customDataIdentifiers'] as Map<String, dynamic>)
          : null,
      mimeType: json['mimeType'] as String?,
      sensitiveData: (json['sensitiveData'] as List?)
          ?.whereNotNull()
          .map((e) => SensitiveDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizeClassified: json['sizeClassified'] as int?,
      status: json['status'] != null
          ? ClassificationResultStatus.fromJson(
              json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalOccurrences = this.additionalOccurrences;
    final customDataIdentifiers = this.customDataIdentifiers;
    final mimeType = this.mimeType;
    final sensitiveData = this.sensitiveData;
    final sizeClassified = this.sizeClassified;
    final status = this.status;
    return {
      if (additionalOccurrences != null)
        'additionalOccurrences': additionalOccurrences,
      if (customDataIdentifiers != null)
        'customDataIdentifiers': customDataIdentifiers,
      if (mimeType != null) 'mimeType': mimeType,
      if (sensitiveData != null) 'sensitiveData': sensitiveData,
      if (sizeClassified != null) 'sizeClassified': sizeClassified,
      if (status != null) 'status': status,
    };
  }
}

/// Provides information about the status of a sensitive data finding.
class ClassificationResultStatus {
  /// The status of the finding. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// COMPLETE - Amazon Macie successfully completed its analysis of the S3 object
  /// that the finding applies to.
  /// </li>
  /// <li>
  /// PARTIAL - Macie analyzed only a subset of the data in the S3 object that the
  /// finding applies to. For example, the object is an archive file that contains
  /// files in an unsupported format.
  /// </li>
  /// <li>
  /// SKIPPED - Macie wasn't able to analyze the S3 object that the finding
  /// applies to. For example, the object is a file in an unsupported format.
  /// </li>
  /// </ul>
  final String? code;

  /// A brief description of the status of the finding. Amazon Macie uses this
  /// value to notify you of any errors, warnings, or considerations that might
  /// impact your analysis of the finding.
  final String? reason;

  ClassificationResultStatus({
    this.code,
    this.reason,
  });

  factory ClassificationResultStatus.fromJson(Map<String, dynamic> json) {
    return ClassificationResultStatus(
      code: json['code'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final reason = this.reason;
    return {
      if (code != null) 'code': code,
      if (reason != null) 'reason': reason,
    };
  }
}

class CreateClassificationJobResponse {
  /// The Amazon Resource Name (ARN) of the job.
  final String? jobArn;

  /// The unique identifier for the job.
  final String? jobId;

  CreateClassificationJobResponse({
    this.jobArn,
    this.jobId,
  });

  factory CreateClassificationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateClassificationJobResponse(
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    return {
      if (jobArn != null) 'jobArn': jobArn,
      if (jobId != null) 'jobId': jobId,
    };
  }
}

class CreateCustomDataIdentifierResponse {
  /// The unique identifier for the custom data identifier that was created.
  final String? customDataIdentifierId;

  CreateCustomDataIdentifierResponse({
    this.customDataIdentifierId,
  });

  factory CreateCustomDataIdentifierResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCustomDataIdentifierResponse(
      customDataIdentifierId: json['customDataIdentifierId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customDataIdentifierId = this.customDataIdentifierId;
    return {
      if (customDataIdentifierId != null)
        'customDataIdentifierId': customDataIdentifierId,
    };
  }
}

class CreateFindingsFilterResponse {
  /// The Amazon Resource Name (ARN) of the filter that was created.
  final String? arn;

  /// The unique identifier for the filter that was created.
  final String? id;

  CreateFindingsFilterResponse({
    this.arn,
    this.id,
  });

  factory CreateFindingsFilterResponse.fromJson(Map<String, dynamic> json) {
    return CreateFindingsFilterResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

class CreateInvitationsResponse {
  /// An array of objects, one for each account whose invitation hasn't been
  /// processed. Each object identifies the account and explains why the
  /// invitation hasn't been processed for the account.
  final List<UnprocessedAccount>? unprocessedAccounts;

  CreateInvitationsResponse({
    this.unprocessedAccounts,
  });

  factory CreateInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return CreateInvitationsResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'unprocessedAccounts': unprocessedAccounts,
    };
  }
}

class CreateMemberResponse {
  /// The Amazon Resource Name (ARN) of the account that was associated with the
  /// administrator account.
  final String? arn;

  CreateMemberResponse({
    this.arn,
  });

  factory CreateMemberResponse.fromJson(Map<String, dynamic> json) {
    return CreateMemberResponse(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

class CreateSampleFindingsResponse {
  CreateSampleFindingsResponse();

  factory CreateSampleFindingsResponse.fromJson(Map<String, dynamic> _) {
    return CreateSampleFindingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies one or more property- and tag-based conditions that define
/// criteria for including or excluding S3 buckets from a classification job.
class CriteriaBlockForJob {
  /// An array of conditions, one for each condition that determines which buckets
  /// to include or exclude from the job. If you specify more than one condition,
  /// Amazon Macie uses AND logic to join the conditions.
  final List<CriteriaForJob>? and;

  CriteriaBlockForJob({
    this.and,
  });

  factory CriteriaBlockForJob.fromJson(Map<String, dynamic> json) {
    return CriteriaBlockForJob(
      and: (json['and'] as List?)
          ?.whereNotNull()
          .map((e) => CriteriaForJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    return {
      if (and != null) 'and': and,
    };
  }
}

/// Specifies a property- or tag-based condition that defines criteria for
/// including or excluding S3 buckets from a classification job.
class CriteriaForJob {
  /// A property-based condition that defines a property, operator, and one or
  /// more values for including or excluding buckets from the job.
  final SimpleCriterionForJob? simpleCriterion;

  /// A tag-based condition that defines an operator and tag keys, tag values, or
  /// tag key and value pairs for including or excluding buckets from the job.
  final TagCriterionForJob? tagCriterion;

  CriteriaForJob({
    this.simpleCriterion,
    this.tagCriterion,
  });

  factory CriteriaForJob.fromJson(Map<String, dynamic> json) {
    return CriteriaForJob(
      simpleCriterion: json['simpleCriterion'] != null
          ? SimpleCriterionForJob.fromJson(
              json['simpleCriterion'] as Map<String, dynamic>)
          : null,
      tagCriterion: json['tagCriterion'] != null
          ? TagCriterionForJob.fromJson(
              json['tagCriterion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final simpleCriterion = this.simpleCriterion;
    final tagCriterion = this.tagCriterion;
    return {
      if (simpleCriterion != null) 'simpleCriterion': simpleCriterion,
      if (tagCriterion != null) 'tagCriterion': tagCriterion,
    };
  }
}

/// Specifies the operator to use in a property-based condition that filters the
/// results of a query for findings. For detailed information and examples of
/// each operator, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/findings-filter-basics.html">Fundamentals
/// of filtering findings</a> in the <i>Amazon Macie User Guide</i>.
class CriterionAdditionalProperties {
  /// The value for the property matches (equals) the specified value. If you
  /// specify multiple values, Macie uses OR logic to join the values.
  final List<String>? eq;

  /// The value for the property exclusively matches (equals an exact match for)
  /// all the specified values. If you specify multiple values, Amazon Macie uses
  /// AND logic to join the values.
  ///
  /// You can use this operator with the following properties:
  /// customDataIdentifiers.detections.arn, customDataIdentifiers.detections.name,
  /// resourcesAffected.s3Bucket.tags.key, resourcesAffected.s3Bucket.tags.value,
  /// resourcesAffected.s3Object.tags.key, resourcesAffected.s3Object.tags.value,
  /// sensitiveData.category, and sensitiveData.detections.type.
  final List<String>? eqExactMatch;

  /// The value for the property is greater than the specified value.
  final int? gt;

  /// The value for the property is greater than or equal to the specified value.
  final int? gte;

  /// The value for the property is less than the specified value.
  final int? lt;

  /// The value for the property is less than or equal to the specified value.
  final int? lte;

  /// The value for the property doesn't match (doesn't equal) the specified
  /// value. If you specify multiple values, Macie uses OR logic to join the
  /// values.
  final List<String>? neq;

  CriterionAdditionalProperties({
    this.eq,
    this.eqExactMatch,
    this.gt,
    this.gte,
    this.lt,
    this.lte,
    this.neq,
  });

  factory CriterionAdditionalProperties.fromJson(Map<String, dynamic> json) {
    return CriterionAdditionalProperties(
      eq: (json['eq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      eqExactMatch: (json['eqExactMatch'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      neq: (json['neq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eq = this.eq;
    final eqExactMatch = this.eqExactMatch;
    final gt = this.gt;
    final gte = this.gte;
    final lt = this.lt;
    final lte = this.lte;
    final neq = this.neq;
    return {
      if (eq != null) 'eq': eq,
      if (eqExactMatch != null) 'eqExactMatch': eqExactMatch,
      if (gt != null) 'gt': gt,
      if (gte != null) 'gte': gte,
      if (lt != null) 'lt': lt,
      if (lte != null) 'lte': lte,
      if (neq != null) 'neq': neq,
    };
  }
}

/// The type of currency that the data for an Amazon Macie usage metric is
/// reported in. Possible values are:
enum Currency {
  usd,
}

extension on Currency {
  String toValue() {
    switch (this) {
      case Currency.usd:
        return 'USD';
    }
  }
}

extension on String {
  Currency toCurrency() {
    switch (this) {
      case 'USD':
        return Currency.usd;
    }
    throw Exception('$this is not known in enum Currency');
  }
}

/// Provides information about a custom data identifier.
class CustomDataIdentifierSummary {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  final String? arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the custom data
  /// identifier was created.
  final DateTime? createdAt;

  /// The custom description of the custom data identifier.
  final String? description;

  /// The unique identifier for the custom data identifier.
  final String? id;

  /// The custom name of the custom data identifier.
  final String? name;

  CustomDataIdentifierSummary({
    this.arn,
    this.createdAt,
    this.description,
    this.id,
    this.name,
  });

  factory CustomDataIdentifierSummary.fromJson(Map<String, dynamic> json) {
    return CustomDataIdentifierSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// Provides information about custom data identifiers that produced a sensitive
/// data finding, and the number of occurrences of the data that they detected
/// for the finding.
class CustomDataIdentifiers {
  /// The custom data identifiers that detected the data, and the number of
  /// occurrences of the data that each identifier detected.
  final List<CustomDetection>? detections;

  /// The total number of occurrences of the data that was detected by the custom
  /// data identifiers and produced the finding.
  final int? totalCount;

  CustomDataIdentifiers({
    this.detections,
    this.totalCount,
  });

  factory CustomDataIdentifiers.fromJson(Map<String, dynamic> json) {
    return CustomDataIdentifiers(
      detections: (json['detections'] as List?)
          ?.whereNotNull()
          .map((e) => CustomDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final detections = this.detections;
    final totalCount = this.totalCount;
    return {
      if (detections != null) 'detections': detections,
      if (totalCount != null) 'totalCount': totalCount,
    };
  }
}

/// Provides information about a custom data identifier that produced a
/// sensitive data finding, and the sensitive data that it detected for the
/// finding.
class CustomDetection {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  final String? arn;

  /// The total number of occurrences of the sensitive data that the custom data
  /// identifier detected.
  final int? count;

  /// The name of the custom data identifier.
  final String? name;

  /// The location of 1-15 occurrences of the sensitive data that the custom data
  /// identifier detected. A finding includes location data for a maximum of 15
  /// occurrences of sensitive data.
  final Occurrences? occurrences;

  CustomDetection({
    this.arn,
    this.count,
    this.name,
    this.occurrences,
  });

  factory CustomDetection.fromJson(Map<String, dynamic> json) {
    return CustomDetection(
      arn: json['arn'] as String?,
      count: json['count'] as int?,
      name: json['name'] as String?,
      occurrences: json['occurrences'] != null
          ? Occurrences.fromJson(json['occurrences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final count = this.count;
    final name = this.name;
    final occurrences = this.occurrences;
    return {
      if (arn != null) 'arn': arn,
      if (count != null) 'count': count,
      if (name != null) 'name': name,
      if (occurrences != null) 'occurrences': occurrences,
    };
  }
}

/// Specifies that a classification job runs once a day, every day. This is an
/// empty object.
class DailySchedule {
  DailySchedule();

  factory DailySchedule.fromJson(Map<String, dynamic> _) {
    return DailySchedule();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DayOfWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

extension on DayOfWeek {
  String toValue() {
    switch (this) {
      case DayOfWeek.sunday:
        return 'SUNDAY';
      case DayOfWeek.monday:
        return 'MONDAY';
      case DayOfWeek.tuesday:
        return 'TUESDAY';
      case DayOfWeek.wednesday:
        return 'WEDNESDAY';
      case DayOfWeek.thursday:
        return 'THURSDAY';
      case DayOfWeek.friday:
        return 'FRIDAY';
      case DayOfWeek.saturday:
        return 'SATURDAY';
    }
  }
}

extension on String {
  DayOfWeek toDayOfWeek() {
    switch (this) {
      case 'SUNDAY':
        return DayOfWeek.sunday;
      case 'MONDAY':
        return DayOfWeek.monday;
      case 'TUESDAY':
        return DayOfWeek.tuesday;
      case 'WEDNESDAY':
        return DayOfWeek.wednesday;
      case 'THURSDAY':
        return DayOfWeek.thursday;
      case 'FRIDAY':
        return DayOfWeek.friday;
      case 'SATURDAY':
        return DayOfWeek.saturday;
    }
    throw Exception('$this is not known in enum DayOfWeek');
  }
}

class DeclineInvitationsResponse {
  /// An array of objects, one for each account whose invitation hasn't been
  /// declined. Each object identifies the account and explains why the request
  /// hasn't been processed for that account.
  final List<UnprocessedAccount>? unprocessedAccounts;

  DeclineInvitationsResponse({
    this.unprocessedAccounts,
  });

  factory DeclineInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return DeclineInvitationsResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'unprocessedAccounts': unprocessedAccounts,
    };
  }
}

/// Provides information about a type of sensitive data that was detected by
/// managed data identifiers and produced a sensitive data finding.
class DefaultDetection {
  /// The total number of occurrences of the type of sensitive data that was
  /// detected.
  final int? count;

  /// The location of 1-15 occurrences of the sensitive data that was detected. A
  /// finding includes location data for a maximum of 15 occurrences of sensitive
  /// data.
  final Occurrences? occurrences;

  /// The type of sensitive data that was detected. For example, AWS_CREDENTIALS,
  /// PHONE_NUMBER, or ADDRESS.
  final String? type;

  DefaultDetection({
    this.count,
    this.occurrences,
    this.type,
  });

  factory DefaultDetection.fromJson(Map<String, dynamic> json) {
    return DefaultDetection(
      count: json['count'] as int?,
      occurrences: json['occurrences'] != null
          ? Occurrences.fromJson(json['occurrences'] as Map<String, dynamic>)
          : null,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final occurrences = this.occurrences;
    final type = this.type;
    return {
      if (count != null) 'count': count,
      if (occurrences != null) 'occurrences': occurrences,
      if (type != null) 'type': type,
    };
  }
}

class DeleteCustomDataIdentifierResponse {
  DeleteCustomDataIdentifierResponse();

  factory DeleteCustomDataIdentifierResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomDataIdentifierResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFindingsFilterResponse {
  DeleteFindingsFilterResponse();

  factory DeleteFindingsFilterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFindingsFilterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteInvitationsResponse {
  /// An array of objects, one for each account whose invitation hasn't been
  /// deleted. Each object identifies the account and explains why the request
  /// hasn't been processed for that account.
  final List<UnprocessedAccount>? unprocessedAccounts;

  DeleteInvitationsResponse({
    this.unprocessedAccounts,
  });

  factory DeleteInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInvitationsResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (unprocessedAccounts != null)
        'unprocessedAccounts': unprocessedAccounts,
    };
  }
}

class DeleteMemberResponse {
  DeleteMemberResponse();

  factory DeleteMemberResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMemberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeBucketsResponse {
  /// An array of objects, one for each bucket that meets the filter criteria
  /// specified in the request.
  final List<BucketMetadata>? buckets;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  DescribeBucketsResponse({
    this.buckets,
    this.nextToken,
  });

  factory DescribeBucketsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBucketsResponse(
      buckets: (json['buckets'] as List?)
          ?.whereNotNull()
          .map((e) => BucketMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buckets = this.buckets;
    final nextToken = this.nextToken;
    return {
      if (buckets != null) 'buckets': buckets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeClassificationJobResponse {
  /// The token that was provided to ensure the idempotency of the request to
  /// create the job.
  final String? clientToken;

  /// The date and time, in UTC and extended ISO 8601 format, when the job was
  /// created.
  final DateTime? createdAt;

  /// The custom data identifiers that the job uses to analyze data.
  final List<String>? customDataIdentifierIds;

  /// The custom description of the job.
  final String? description;

  /// Specifies whether the job is configured to analyze all existing, eligible
  /// objects immediately after it's created.
  final bool? initialRun;

  /// The Amazon Resource Name (ARN) of the job.
  final String? jobArn;

  /// The unique identifier for the job.
  final String? jobId;

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
  final JobStatus? jobStatus;

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
  final JobType? jobType;

  /// Specifies whether any account- or bucket-level access errors occurred when
  /// the job ran. For a recurring job, this value indicates the error status of
  /// the job's most recent run.
  final LastRunErrorStatus? lastRunErrorStatus;

  /// The date and time, in UTC and extended ISO 8601 format, when the job
  /// started. If the job is a recurring job, this value indicates when the most
  /// recent run started.
  final DateTime? lastRunTime;

  /// The custom name of the job.
  final String? name;

  /// The S3 buckets that contain the objects to analyze, and the scope of that
  /// analysis.
  final S3JobDefinition? s3JobDefinition;

  /// The sampling depth, as a percentage, that determines the percentage of
  /// eligible objects that the job analyzes.
  final int? samplingPercentage;

  /// The recurrence pattern for running the job. If the job is configured to run
  /// only once, this value is null.
  final JobScheduleFrequency? scheduleFrequency;

  /// The number of times that the job has run and processing statistics for the
  /// job's current run.
  final Statistics? statistics;

  /// A map of key-value pairs that specifies which tags (keys and values) are
  /// associated with the classification job.
  final Map<String, String>? tags;

  /// If the current status of the job is USER_PAUSED, specifies when the job was
  /// paused and when the job or job run will expire and be cancelled if it isn't
  /// resumed. This value is present only if the value for jobStatus is
  /// USER_PAUSED.
  final UserPausedDetails? userPausedDetails;

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
      Map<String, dynamic> json) {
    return DescribeClassificationJobResponse(
      clientToken: json['clientToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      customDataIdentifierIds: (json['customDataIdentifierIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      initialRun: json['initialRun'] as bool?,
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
      jobStatus: (json['jobStatus'] as String?)?.toJobStatus(),
      jobType: (json['jobType'] as String?)?.toJobType(),
      lastRunErrorStatus: json['lastRunErrorStatus'] != null
          ? LastRunErrorStatus.fromJson(
              json['lastRunErrorStatus'] as Map<String, dynamic>)
          : null,
      lastRunTime: timeStampFromJson(json['lastRunTime']),
      name: json['name'] as String?,
      s3JobDefinition: json['s3JobDefinition'] != null
          ? S3JobDefinition.fromJson(
              json['s3JobDefinition'] as Map<String, dynamic>)
          : null,
      samplingPercentage: json['samplingPercentage'] as int?,
      scheduleFrequency: json['scheduleFrequency'] != null
          ? JobScheduleFrequency.fromJson(
              json['scheduleFrequency'] as Map<String, dynamic>)
          : null,
      statistics: json['statistics'] != null
          ? Statistics.fromJson(json['statistics'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      userPausedDetails: json['userPausedDetails'] != null
          ? UserPausedDetails.fromJson(
              json['userPausedDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final createdAt = this.createdAt;
    final customDataIdentifierIds = this.customDataIdentifierIds;
    final description = this.description;
    final initialRun = this.initialRun;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobType = this.jobType;
    final lastRunErrorStatus = this.lastRunErrorStatus;
    final lastRunTime = this.lastRunTime;
    final name = this.name;
    final s3JobDefinition = this.s3JobDefinition;
    final samplingPercentage = this.samplingPercentage;
    final scheduleFrequency = this.scheduleFrequency;
    final statistics = this.statistics;
    final tags = this.tags;
    final userPausedDetails = this.userPausedDetails;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (customDataIdentifierIds != null)
        'customDataIdentifierIds': customDataIdentifierIds,
      if (description != null) 'description': description,
      if (initialRun != null) 'initialRun': initialRun,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobId != null) 'jobId': jobId,
      if (jobStatus != null) 'jobStatus': jobStatus.toValue(),
      if (jobType != null) 'jobType': jobType.toValue(),
      if (lastRunErrorStatus != null) 'lastRunErrorStatus': lastRunErrorStatus,
      if (lastRunTime != null) 'lastRunTime': iso8601ToJson(lastRunTime),
      if (name != null) 'name': name,
      if (s3JobDefinition != null) 's3JobDefinition': s3JobDefinition,
      if (samplingPercentage != null) 'samplingPercentage': samplingPercentage,
      if (scheduleFrequency != null) 'scheduleFrequency': scheduleFrequency,
      if (statistics != null) 'statistics': statistics,
      if (tags != null) 'tags': tags,
      if (userPausedDetails != null) 'userPausedDetails': userPausedDetails,
    };
  }
}

class DescribeOrganizationConfigurationResponse {
  /// Specifies whether Amazon Macie is enabled automatically for accounts that
  /// are added to the Amazon Web Services organization.
  final bool? autoEnable;

  /// Specifies whether the maximum number of Amazon Macie member accounts are
  /// part of the Amazon Web Services organization.
  final bool? maxAccountLimitReached;

  DescribeOrganizationConfigurationResponse({
    this.autoEnable,
    this.maxAccountLimitReached,
  });

  factory DescribeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigurationResponse(
      autoEnable: json['autoEnable'] as bool?,
      maxAccountLimitReached: json['maxAccountLimitReached'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    final maxAccountLimitReached = this.maxAccountLimitReached;
    return {
      if (autoEnable != null) 'autoEnable': autoEnable,
      if (maxAccountLimitReached != null)
        'maxAccountLimitReached': maxAccountLimitReached,
    };
  }
}

class DisableMacieResponse {
  DisableMacieResponse();

  factory DisableMacieResponse.fromJson(Map<String, dynamic> _) {
    return DisableMacieResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisableOrganizationAdminAccountResponse {
  DisableOrganizationAdminAccountResponse();

  factory DisableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisableOrganizationAdminAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateFromAdministratorAccountResponse {
  DisassociateFromAdministratorAccountResponse();

  factory DisassociateFromAdministratorAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateFromAdministratorAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();

  factory DisassociateFromMasterAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateFromMasterAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMemberResponse {
  DisassociateMemberResponse();

  factory DisassociateMemberResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides information about the domain name of the device that an entity used
/// to perform an action on an affected resource.
class DomainDetails {
  /// The name of the domain.
  final String? domainName;

  DomainDetails({
    this.domainName,
  });

  factory DomainDetails.fromJson(Map<String, dynamic> json) {
    return DomainDetails(
      domainName: json['domainName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    return {
      if (domainName != null) 'domainName': domainName,
    };
  }
}

enum EffectivePermission {
  public,
  notPublic,
  unknown,
}

extension on EffectivePermission {
  String toValue() {
    switch (this) {
      case EffectivePermission.public:
        return 'PUBLIC';
      case EffectivePermission.notPublic:
        return 'NOT_PUBLIC';
      case EffectivePermission.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  EffectivePermission toEffectivePermission() {
    switch (this) {
      case 'PUBLIC':
        return EffectivePermission.public;
      case 'NOT_PUBLIC':
        return EffectivePermission.notPublic;
      case 'UNKNOWN':
        return EffectivePermission.unknown;
    }
    throw Exception('$this is not known in enum EffectivePermission');
  }
}

class EnableMacieResponse {
  EnableMacieResponse();

  factory EnableMacieResponse.fromJson(Map<String, dynamic> _) {
    return EnableMacieResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class EnableOrganizationAdminAccountResponse {
  EnableOrganizationAdminAccountResponse();

  factory EnableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return EnableOrganizationAdminAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The type of server-side encryption that's used to encrypt an S3 object or
/// objects in an S3 bucket. Valid values are:
enum EncryptionType {
  none,
  aes256,
  awsKms,
  unknown,
}

extension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.none:
        return 'NONE';
      case EncryptionType.aes256:
        return 'AES256';
      case EncryptionType.awsKms:
        return 'aws:kms';
      case EncryptionType.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'NONE':
        return EncryptionType.none;
      case 'AES256':
        return EncryptionType.aes256;
      case 'aws:kms':
        return EncryptionType.awsKms;
      case 'UNKNOWN':
        return EncryptionType.unknown;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// The source of an issue or delay. Possible values are:
enum ErrorCode {
  clientError,
  internalError,
}

extension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.clientError:
        return 'ClientError';
      case ErrorCode.internalError:
        return 'InternalError';
    }
  }
}

extension on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'ClientError':
        return ErrorCode.clientError;
      case 'InternalError':
        return ErrorCode.internalError;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Provides information about an identity that performed an action on an
/// affected resource by using temporary security credentials. The credentials
/// were obtained using the GetFederationToken operation of the Security Token
/// Service (STS) API.
class FederatedUser {
  /// The Amazon Web Services access key ID that identifies the credentials.
  final String? accessKeyId;

  /// The unique identifier for the Amazon Web Services account that owns the
  /// entity that was used to get the credentials.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the entity that was used to get the
  /// credentials.
  final String? arn;

  /// The unique identifier for the entity that was used to get the credentials.
  final String? principalId;

  /// The details of the session that was created for the credentials, including
  /// the entity that issued the session.
  final SessionContext? sessionContext;

  FederatedUser({
    this.accessKeyId,
    this.accountId,
    this.arn,
    this.principalId,
    this.sessionContext,
  });

  factory FederatedUser.fromJson(Map<String, dynamic> json) {
    return FederatedUser(
      accessKeyId: json['accessKeyId'] as String?,
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      principalId: json['principalId'] as String?,
      sessionContext: json['sessionContext'] != null
          ? SessionContext.fromJson(
              json['sessionContext'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final accountId = this.accountId;
    final arn = this.arn;
    final principalId = this.principalId;
    final sessionContext = this.sessionContext;
    return {
      if (accessKeyId != null) 'accessKeyId': accessKeyId,
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (principalId != null) 'principalId': principalId,
      if (sessionContext != null) 'sessionContext': sessionContext,
    };
  }
}

/// Provides the details of a finding.
class Finding {
  /// The unique identifier for the Amazon Web Services account that the finding
  /// applies to. This is typically the account that owns the affected resource.
  final String? accountId;

  /// Specifies whether the finding is archived (suppressed).
  final bool? archived;

  /// The category of the finding. Possible values are: CLASSIFICATION, for a
  /// sensitive data finding; and, POLICY, for a policy finding.
  final FindingCategory? category;

  /// The details of a sensitive data finding. This value is null for a policy
  /// finding.
  final ClassificationDetails? classificationDetails;

  /// The total number of occurrences of the finding. For sensitive data findings,
  /// this value is always 1. All sensitive data findings are considered new
  /// (unique) because they derive from individual classification jobs.
  final int? count;

  /// The date and time, in UTC and extended ISO 8601 format, when the finding was
  /// created.
  final DateTime? createdAt;

  /// The description of the finding.
  final String? description;

  /// The unique identifier for the finding. This is a random string that Amazon
  /// Macie generates and assigns to a finding when it creates the finding.
  final String? id;

  /// The Amazon Web Services partition that Amazon Macie created the finding in.
  final String? partition;

  /// The details of a policy finding. This value is null for a sensitive data
  /// finding.
  final PolicyDetails? policyDetails;

  /// The Amazon Web Services Region that Amazon Macie created the finding in.
  final String? region;

  /// The resources that the finding applies to.
  final ResourcesAffected? resourcesAffected;

  /// Specifies whether the finding is a sample finding. A <i>sample finding</i>
  /// is a finding that uses example data to demonstrate what a finding might
  /// contain.
  final bool? sample;

  /// The version of the schema that was used to define the data structures in the
  /// finding.
  final String? schemaVersion;

  /// The severity level and score for the finding.
  final Severity? severity;

  /// The brief description of the finding.
  final String? title;

  /// The type of the finding.
  final FindingType? type;

  /// The date and time, in UTC and extended ISO 8601 format, when the finding was
  /// last updated. For sensitive data findings, this value is the same as the
  /// value for the createdAt property. All sensitive data findings are considered
  /// new (unique) because they derive from individual classification jobs.
  final DateTime? updatedAt;

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

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      accountId: json['accountId'] as String?,
      archived: json['archived'] as bool?,
      category: (json['category'] as String?)?.toFindingCategory(),
      classificationDetails: json['classificationDetails'] != null
          ? ClassificationDetails.fromJson(
              json['classificationDetails'] as Map<String, dynamic>)
          : null,
      count: json['count'] as int?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      partition: json['partition'] as String?,
      policyDetails: json['policyDetails'] != null
          ? PolicyDetails.fromJson(
              json['policyDetails'] as Map<String, dynamic>)
          : null,
      region: json['region'] as String?,
      resourcesAffected: json['resourcesAffected'] != null
          ? ResourcesAffected.fromJson(
              json['resourcesAffected'] as Map<String, dynamic>)
          : null,
      sample: json['sample'] as bool?,
      schemaVersion: json['schemaVersion'] as String?,
      severity: json['severity'] != null
          ? Severity.fromJson(json['severity'] as Map<String, dynamic>)
          : null,
      title: json['title'] as String?,
      type: (json['type'] as String?)?.toFindingType(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final archived = this.archived;
    final category = this.category;
    final classificationDetails = this.classificationDetails;
    final count = this.count;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final partition = this.partition;
    final policyDetails = this.policyDetails;
    final region = this.region;
    final resourcesAffected = this.resourcesAffected;
    final sample = this.sample;
    final schemaVersion = this.schemaVersion;
    final severity = this.severity;
    final title = this.title;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'accountId': accountId,
      if (archived != null) 'archived': archived,
      if (category != null) 'category': category.toValue(),
      if (classificationDetails != null)
        'classificationDetails': classificationDetails,
      if (count != null) 'count': count,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (partition != null) 'partition': partition,
      if (policyDetails != null) 'policyDetails': policyDetails,
      if (region != null) 'region': region,
      if (resourcesAffected != null) 'resourcesAffected': resourcesAffected,
      if (sample != null) 'sample': sample,
      if (schemaVersion != null) 'schemaVersion': schemaVersion,
      if (severity != null) 'severity': severity,
      if (title != null) 'title': title,
      if (type != null) 'type': type.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Provides information about an action that occurred for a resource and
/// produced a policy finding.
class FindingAction {
  /// The type of action that occurred for the affected resource. This value is
  /// typically AWS_API_CALL, which indicates that an entity invoked an API
  /// operation for the resource.
  final FindingActionType? actionType;

  /// The invocation details of the API operation that an entity invoked for the
  /// affected resource, if the value for the actionType property is AWS_API_CALL.
  final ApiCallDetails? apiCallDetails;

  FindingAction({
    this.actionType,
    this.apiCallDetails,
  });

  factory FindingAction.fromJson(Map<String, dynamic> json) {
    return FindingAction(
      actionType: (json['actionType'] as String?)?.toFindingActionType(),
      apiCallDetails: json['apiCallDetails'] != null
          ? ApiCallDetails.fromJson(
              json['apiCallDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final apiCallDetails = this.apiCallDetails;
    return {
      if (actionType != null) 'actionType': actionType.toValue(),
      if (apiCallDetails != null) 'apiCallDetails': apiCallDetails,
    };
  }
}

/// The type of action that occurred for the resource and produced the policy
/// finding:
enum FindingActionType {
  awsApiCall,
}

extension on FindingActionType {
  String toValue() {
    switch (this) {
      case FindingActionType.awsApiCall:
        return 'AWS_API_CALL';
    }
  }
}

extension on String {
  FindingActionType toFindingActionType() {
    switch (this) {
      case 'AWS_API_CALL':
        return FindingActionType.awsApiCall;
    }
    throw Exception('$this is not known in enum FindingActionType');
  }
}

/// Provides information about an entity that performed an action that produced
/// a policy finding for a resource.
class FindingActor {
  /// The domain name of the device that the entity used to perform the action on
  /// the affected resource.
  final DomainDetails? domainDetails;

  /// The IP address of the device that the entity used to perform the action on
  /// the affected resource. This object also provides information such as the
  /// owner and geographic location for the IP address.
  final IpAddressDetails? ipAddressDetails;

  /// The type and other characteristics of the entity that performed the action
  /// on the affected resource.
  final UserIdentity? userIdentity;

  FindingActor({
    this.domainDetails,
    this.ipAddressDetails,
    this.userIdentity,
  });

  factory FindingActor.fromJson(Map<String, dynamic> json) {
    return FindingActor(
      domainDetails: json['domainDetails'] != null
          ? DomainDetails.fromJson(
              json['domainDetails'] as Map<String, dynamic>)
          : null,
      ipAddressDetails: json['ipAddressDetails'] != null
          ? IpAddressDetails.fromJson(
              json['ipAddressDetails'] as Map<String, dynamic>)
          : null,
      userIdentity: json['userIdentity'] != null
          ? UserIdentity.fromJson(json['userIdentity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainDetails = this.domainDetails;
    final ipAddressDetails = this.ipAddressDetails;
    final userIdentity = this.userIdentity;
    return {
      if (domainDetails != null) 'domainDetails': domainDetails,
      if (ipAddressDetails != null) 'ipAddressDetails': ipAddressDetails,
      if (userIdentity != null) 'userIdentity': userIdentity,
    };
  }
}

/// The category of the finding. Valid values are:
enum FindingCategory {
  classification,
  policy,
}

extension on FindingCategory {
  String toValue() {
    switch (this) {
      case FindingCategory.classification:
        return 'CLASSIFICATION';
      case FindingCategory.policy:
        return 'POLICY';
    }
  }
}

extension on String {
  FindingCategory toFindingCategory() {
    switch (this) {
      case 'CLASSIFICATION':
        return FindingCategory.classification;
      case 'POLICY':
        return FindingCategory.policy;
    }
    throw Exception('$this is not known in enum FindingCategory');
  }
}

/// Specifies, as a map, one or more property-based conditions that filter the
/// results of a query for findings.
class FindingCriteria {
  /// A condition that specifies the property, operator, and one or more values to
  /// use to filter the results.
  final Map<String, CriterionAdditionalProperties>? criterion;

  FindingCriteria({
    this.criterion,
  });

  factory FindingCriteria.fromJson(Map<String, dynamic> json) {
    return FindingCriteria(
      criterion: (json['criterion'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              CriterionAdditionalProperties.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final criterion = this.criterion;
    return {
      if (criterion != null) 'criterion': criterion,
    };
  }
}

/// The frequency with which Amazon Macie publishes updates to policy findings
/// for an account. This includes publishing updates to Security Hub and Amazon
/// EventBridge (formerly called Amazon CloudWatch Events). For more
/// information, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/findings-monitor.html">Monitoring
/// and processing findings</a> in the <i>Amazon Macie User Guide</i>. Valid
/// values are:
enum FindingPublishingFrequency {
  fifteenMinutes,
  oneHour,
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
  }
}

extension on String {
  FindingPublishingFrequency toFindingPublishingFrequency() {
    switch (this) {
      case 'FIFTEEN_MINUTES':
        return FindingPublishingFrequency.fifteenMinutes;
      case 'ONE_HOUR':
        return FindingPublishingFrequency.oneHour;
      case 'SIX_HOURS':
        return FindingPublishingFrequency.sixHours;
    }
    throw Exception('$this is not known in enum FindingPublishingFrequency');
  }
}

/// The grouping to sort the results by. Valid values are:
enum FindingStatisticsSortAttributeName {
  groupKey,
  count,
}

extension on FindingStatisticsSortAttributeName {
  String toValue() {
    switch (this) {
      case FindingStatisticsSortAttributeName.groupKey:
        return 'groupKey';
      case FindingStatisticsSortAttributeName.count:
        return 'count';
    }
  }
}

extension on String {
  FindingStatisticsSortAttributeName toFindingStatisticsSortAttributeName() {
    switch (this) {
      case 'groupKey':
        return FindingStatisticsSortAttributeName.groupKey;
      case 'count':
        return FindingStatisticsSortAttributeName.count;
    }
    throw Exception(
        '$this is not known in enum FindingStatisticsSortAttributeName');
  }
}

/// Specifies criteria for sorting the results of a query that retrieves
/// aggregated statistical data about findings.
class FindingStatisticsSortCriteria {
  /// The grouping to sort the results by. Valid values are: count, sort the
  /// results by the number of findings in each group of results; and, groupKey,
  /// sort the results by the name of each group of results.
  final FindingStatisticsSortAttributeName? attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  FindingStatisticsSortCriteria({
    this.attributeName,
    this.orderBy,
  });

  factory FindingStatisticsSortCriteria.fromJson(Map<String, dynamic> json) {
    return FindingStatisticsSortCriteria(
      attributeName: (json['attributeName'] as String?)
          ?.toFindingStatisticsSortAttributeName(),
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName.toValue(),
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// The type of finding. For details about each type, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/findings-types.html">Types
/// of Amazon Macie findings</a> in the <i>Amazon Macie User Guide</i>. Valid
/// values are:
enum FindingType {
  sensitiveDataS3ObjectMultiple,
  sensitiveDataS3ObjectFinancial,
  sensitiveDataS3ObjectPersonal,
  sensitiveDataS3ObjectCredentials,
  sensitiveDataS3ObjectCustomIdentifier,
  policyIAMUserS3BucketPublic,
  policyIAMUserS3BucketSharedExternally,
  policyIAMUserS3BucketReplicatedExternally,
  policyIAMUserS3BucketEncryptionDisabled,
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
  }
}

extension on String {
  FindingType toFindingType() {
    switch (this) {
      case 'SensitiveData:S3Object/Multiple':
        return FindingType.sensitiveDataS3ObjectMultiple;
      case 'SensitiveData:S3Object/Financial':
        return FindingType.sensitiveDataS3ObjectFinancial;
      case 'SensitiveData:S3Object/Personal':
        return FindingType.sensitiveDataS3ObjectPersonal;
      case 'SensitiveData:S3Object/Credentials':
        return FindingType.sensitiveDataS3ObjectCredentials;
      case 'SensitiveData:S3Object/CustomIdentifier':
        return FindingType.sensitiveDataS3ObjectCustomIdentifier;
      case 'Policy:IAMUser/S3BucketPublic':
        return FindingType.policyIAMUserS3BucketPublic;
      case 'Policy:IAMUser/S3BucketSharedExternally':
        return FindingType.policyIAMUserS3BucketSharedExternally;
      case 'Policy:IAMUser/S3BucketReplicatedExternally':
        return FindingType.policyIAMUserS3BucketReplicatedExternally;
      case 'Policy:IAMUser/S3BucketEncryptionDisabled':
        return FindingType.policyIAMUserS3BucketEncryptionDisabled;
      case 'Policy:IAMUser/S3BlockPublicAccessDisabled':
        return FindingType.policyIAMUserS3BlockPublicAccessDisabled;
    }
    throw Exception('$this is not known in enum FindingType');
  }
}

/// The action to perform on findings that meet the filter criteria. To suppress
/// (automatically archive) findings that meet the criteria, set this value to
/// ARCHIVE. Valid values are:
enum FindingsFilterAction {
  archive,
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
  }
}

extension on String {
  FindingsFilterAction toFindingsFilterAction() {
    switch (this) {
      case 'ARCHIVE':
        return FindingsFilterAction.archive;
      case 'NOOP':
        return FindingsFilterAction.noop;
    }
    throw Exception('$this is not known in enum FindingsFilterAction');
  }
}

/// Provides information about a findings filter.
class FindingsFilterListItem {
  /// The action that's performed on findings that meet the filter criteria.
  /// Possible values are: ARCHIVE, suppress (automatically archive) the findings;
  /// and, NOOP, don't perform any action on the findings.
  final FindingsFilterAction? action;

  /// The Amazon Resource Name (ARN) of the filter.
  final String? arn;

  /// The unique identifier for the filter.
  final String? id;

  /// The custom name of the filter.
  final String? name;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the filter.
  final Map<String, String>? tags;

  FindingsFilterListItem({
    this.action,
    this.arn,
    this.id,
    this.name,
    this.tags,
  });

  factory FindingsFilterListItem.fromJson(Map<String, dynamic> json) {
    return FindingsFilterListItem(
      action: (json['action'] as String?)?.toFindingsFilterAction(),
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final tags = this.tags;
    return {
      if (action != null) 'action': action.toValue(),
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetAdministratorAccountResponse {
  /// The Amazon Web Services account ID for the administrator account. If the
  /// accounts are associated by a Macie membership invitation, this object also
  /// provides details about the invitation that was sent to establish the
  /// relationship between the accounts.
  final Invitation? administrator;

  GetAdministratorAccountResponse({
    this.administrator,
  });

  factory GetAdministratorAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetAdministratorAccountResponse(
      administrator: json['administrator'] != null
          ? Invitation.fromJson(json['administrator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final administrator = this.administrator;
    return {
      if (administrator != null) 'administrator': administrator,
    };
  }
}

class GetBucketStatisticsResponse {
  /// The total number of buckets.
  final int? bucketCount;

  /// The total number of buckets that are publicly accessible based on a
  /// combination of permissions settings for each bucket.
  final BucketCountByEffectivePermission? bucketCountByEffectivePermission;

  /// The total number of buckets that use certain types of server-side encryption
  /// to encrypt new objects by default. This object also reports the total number
  /// of buckets that don't encrypt new objects by default.
  final BucketCountByEncryptionType? bucketCountByEncryptionType;

  /// The total number of buckets whose bucket policies do or don't require
  /// server-side encryption of objects when objects are uploaded to the buckets.
  final BucketCountPolicyAllowsUnencryptedObjectUploads?
      bucketCountByObjectEncryptionRequirement;

  /// The total number of buckets that are or aren't shared with another Amazon
  /// Web Services account.
  final BucketCountBySharedAccessType? bucketCountBySharedAccessType;

  /// The total number of objects that Amazon Macie can analyze in the buckets.
  /// These objects use a supported storage class and have a file name extension
  /// for a supported file or storage format.
  final int? classifiableObjectCount;

  /// The total storage size, in bytes, of all the objects that Amazon Macie can
  /// analyze in the buckets. These objects use a supported storage class and have
  /// a file name extension for a supported file or storage format.
  ///
  /// If versioning is enabled for any of the buckets, Macie calculates this value
  /// based on the size of the latest version of each applicable object in those
  /// buckets. This value doesn't reflect the storage size of all versions of all
  /// applicable objects in the buckets.
  final int? classifiableSizeInBytes;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently retrieved both bucket and object metadata from Amazon S3 for
  /// the buckets.
  final DateTime? lastUpdated;

  /// The total number of objects in the buckets.
  final int? objectCount;

  /// The total storage size, in bytes, of the buckets.
  ///
  /// If versioning is enabled for any of the buckets, Macie calculates this value
  /// based on the size of the latest version of each object in those buckets.
  /// This value doesn't reflect the storage size of all versions of the objects
  /// in the buckets.
  final int? sizeInBytes;

  /// The total storage size, in bytes, of the objects that are compressed (.gz,
  /// .gzip, .zip) files in the buckets.
  ///
  /// If versioning is enabled for any of the buckets, Macie calculates this value
  /// based on the size of the latest version of each applicable object in those
  /// buckets. This value doesn't reflect the storage size of all versions of the
  /// applicable objects in the buckets.
  final int? sizeInBytesCompressed;

  /// The total number of objects that Amazon Macie can't analyze in the buckets.
  /// These objects don't use a supported storage class or don't have a file name
  /// extension for a supported file or storage format.
  final ObjectLevelStatistics? unclassifiableObjectCount;

  /// The total storage size, in bytes, of the objects that Amazon Macie can't
  /// analyze in the buckets. These objects don't use a supported storage class or
  /// don't have a file name extension for a supported file or storage format.
  final ObjectLevelStatistics? unclassifiableObjectSizeInBytes;

  GetBucketStatisticsResponse({
    this.bucketCount,
    this.bucketCountByEffectivePermission,
    this.bucketCountByEncryptionType,
    this.bucketCountByObjectEncryptionRequirement,
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

  factory GetBucketStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetBucketStatisticsResponse(
      bucketCount: json['bucketCount'] as int?,
      bucketCountByEffectivePermission:
          json['bucketCountByEffectivePermission'] != null
              ? BucketCountByEffectivePermission.fromJson(
                  json['bucketCountByEffectivePermission']
                      as Map<String, dynamic>)
              : null,
      bucketCountByEncryptionType: json['bucketCountByEncryptionType'] != null
          ? BucketCountByEncryptionType.fromJson(
              json['bucketCountByEncryptionType'] as Map<String, dynamic>)
          : null,
      bucketCountByObjectEncryptionRequirement:
          json['bucketCountByObjectEncryptionRequirement'] != null
              ? BucketCountPolicyAllowsUnencryptedObjectUploads.fromJson(
                  json['bucketCountByObjectEncryptionRequirement']
                      as Map<String, dynamic>)
              : null,
      bucketCountBySharedAccessType:
          json['bucketCountBySharedAccessType'] != null
              ? BucketCountBySharedAccessType.fromJson(
                  json['bucketCountBySharedAccessType'] as Map<String, dynamic>)
              : null,
      classifiableObjectCount: json['classifiableObjectCount'] as int?,
      classifiableSizeInBytes: json['classifiableSizeInBytes'] as int?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      objectCount: json['objectCount'] as int?,
      sizeInBytes: json['sizeInBytes'] as int?,
      sizeInBytesCompressed: json['sizeInBytesCompressed'] as int?,
      unclassifiableObjectCount: json['unclassifiableObjectCount'] != null
          ? ObjectLevelStatistics.fromJson(
              json['unclassifiableObjectCount'] as Map<String, dynamic>)
          : null,
      unclassifiableObjectSizeInBytes:
          json['unclassifiableObjectSizeInBytes'] != null
              ? ObjectLevelStatistics.fromJson(
                  json['unclassifiableObjectSizeInBytes']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketCount = this.bucketCount;
    final bucketCountByEffectivePermission =
        this.bucketCountByEffectivePermission;
    final bucketCountByEncryptionType = this.bucketCountByEncryptionType;
    final bucketCountByObjectEncryptionRequirement =
        this.bucketCountByObjectEncryptionRequirement;
    final bucketCountBySharedAccessType = this.bucketCountBySharedAccessType;
    final classifiableObjectCount = this.classifiableObjectCount;
    final classifiableSizeInBytes = this.classifiableSizeInBytes;
    final lastUpdated = this.lastUpdated;
    final objectCount = this.objectCount;
    final sizeInBytes = this.sizeInBytes;
    final sizeInBytesCompressed = this.sizeInBytesCompressed;
    final unclassifiableObjectCount = this.unclassifiableObjectCount;
    final unclassifiableObjectSizeInBytes =
        this.unclassifiableObjectSizeInBytes;
    return {
      if (bucketCount != null) 'bucketCount': bucketCount,
      if (bucketCountByEffectivePermission != null)
        'bucketCountByEffectivePermission': bucketCountByEffectivePermission,
      if (bucketCountByEncryptionType != null)
        'bucketCountByEncryptionType': bucketCountByEncryptionType,
      if (bucketCountByObjectEncryptionRequirement != null)
        'bucketCountByObjectEncryptionRequirement':
            bucketCountByObjectEncryptionRequirement,
      if (bucketCountBySharedAccessType != null)
        'bucketCountBySharedAccessType': bucketCountBySharedAccessType,
      if (classifiableObjectCount != null)
        'classifiableObjectCount': classifiableObjectCount,
      if (classifiableSizeInBytes != null)
        'classifiableSizeInBytes': classifiableSizeInBytes,
      if (lastUpdated != null) 'lastUpdated': iso8601ToJson(lastUpdated),
      if (objectCount != null) 'objectCount': objectCount,
      if (sizeInBytes != null) 'sizeInBytes': sizeInBytes,
      if (sizeInBytesCompressed != null)
        'sizeInBytesCompressed': sizeInBytesCompressed,
      if (unclassifiableObjectCount != null)
        'unclassifiableObjectCount': unclassifiableObjectCount,
      if (unclassifiableObjectSizeInBytes != null)
        'unclassifiableObjectSizeInBytes': unclassifiableObjectSizeInBytes,
    };
  }
}

class GetClassificationExportConfigurationResponse {
  /// The location where data classification results are stored, and the
  /// encryption settings that are used when storing results in that location.
  final ClassificationExportConfiguration? configuration;

  GetClassificationExportConfigurationResponse({
    this.configuration,
  });

  factory GetClassificationExportConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetClassificationExportConfigurationResponse(
      configuration: json['configuration'] != null
          ? ClassificationExportConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'configuration': configuration,
    };
  }
}

class GetCustomDataIdentifierResponse {
  /// The Amazon Resource Name (ARN) of the custom data identifier.
  final String? arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the custom data
  /// identifier was created.
  final DateTime? createdAt;

  /// Specifies whether the custom data identifier was deleted. If you delete a
  /// custom data identifier, Amazon Macie doesn't delete it permanently. Instead,
  /// it soft deletes the identifier.
  final bool? deleted;

  /// The custom description of the custom data identifier.
  final String? description;

  /// The unique identifier for the custom data identifier.
  final String? id;

  /// An array that lists specific character sequences (ignore words) to exclude
  /// from the results. If the text matched by the regular expression is the same
  /// as any string in this array, Amazon Macie ignores it. Ignore words are case
  /// sensitive.
  final List<String>? ignoreWords;

  /// An array that lists specific character sequences (keywords), one of which
  /// must be within proximity (maximumMatchDistance) of the regular expression to
  /// match. Keywords aren't case sensitive.
  final List<String>? keywords;

  /// The maximum number of characters that can exist between text that matches
  /// the regex pattern and the character sequences specified by the keywords
  /// array. Macie includes or excludes a result based on the proximity of a
  /// keyword to text that matches the regex pattern.
  final int? maximumMatchDistance;

  /// The custom name of the custom data identifier.
  final String? name;

  /// The regular expression (<i>regex</i>) that defines the pattern to match.
  final String? regex;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the custom data identifier.
  final Map<String, String>? tags;

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

  factory GetCustomDataIdentifierResponse.fromJson(Map<String, dynamic> json) {
    return GetCustomDataIdentifierResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deleted: json['deleted'] as bool?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      ignoreWords: (json['ignoreWords'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      keywords: (json['keywords'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maximumMatchDistance: json['maximumMatchDistance'] as int?,
      name: json['name'] as String?,
      regex: json['regex'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deleted = this.deleted;
    final description = this.description;
    final id = this.id;
    final ignoreWords = this.ignoreWords;
    final keywords = this.keywords;
    final maximumMatchDistance = this.maximumMatchDistance;
    final name = this.name;
    final regex = this.regex;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deleted != null) 'deleted': deleted,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (ignoreWords != null) 'ignoreWords': ignoreWords,
      if (keywords != null) 'keywords': keywords,
      if (maximumMatchDistance != null)
        'maximumMatchDistance': maximumMatchDistance,
      if (name != null) 'name': name,
      if (regex != null) 'regex': regex,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetFindingStatisticsResponse {
  /// An array of objects, one for each group of findings that meet the filter
  /// criteria specified in the request.
  final List<GroupCount>? countsByGroup;

  GetFindingStatisticsResponse({
    this.countsByGroup,
  });

  factory GetFindingStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingStatisticsResponse(
      countsByGroup: (json['countsByGroup'] as List?)
          ?.whereNotNull()
          .map((e) => GroupCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final countsByGroup = this.countsByGroup;
    return {
      if (countsByGroup != null) 'countsByGroup': countsByGroup,
    };
  }
}

class GetFindingsFilterResponse {
  /// The action that's performed on findings that meet the filter criteria
  /// (findingCriteria). Possible values are: ARCHIVE, suppress (automatically
  /// archive) the findings; and, NOOP, don't perform any action on the findings.
  final FindingsFilterAction? action;

  /// The Amazon Resource Name (ARN) of the filter.
  final String? arn;

  /// The custom description of the filter.
  final String? description;

  /// The criteria that's used to filter findings.
  final FindingCriteria? findingCriteria;

  /// The unique identifier for the filter.
  final String? id;

  /// The custom name of the filter.
  final String? name;

  /// The position of the filter in the list of saved filters on the Amazon Macie
  /// console. This value also determines the order in which the filter is applied
  /// to findings, relative to other filters that are also applied to the
  /// findings.
  final int? position;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the filter.
  final Map<String, String>? tags;

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

  factory GetFindingsFilterResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingsFilterResponse(
      action: (json['action'] as String?)?.toFindingsFilterAction(),
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      findingCriteria: json['findingCriteria'] != null
          ? FindingCriteria.fromJson(
              json['findingCriteria'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      name: json['name'] as String?,
      position: json['position'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final description = this.description;
    final findingCriteria = this.findingCriteria;
    final id = this.id;
    final name = this.name;
    final position = this.position;
    final tags = this.tags;
    return {
      if (action != null) 'action': action.toValue(),
      if (arn != null) 'arn': arn,
      if (description != null) 'description': description,
      if (findingCriteria != null) 'findingCriteria': findingCriteria,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetFindingsPublicationConfigurationResponse {
  /// The configuration settings that determine which findings are published to
  /// Security Hub.
  final SecurityHubConfiguration? securityHubConfiguration;

  GetFindingsPublicationConfigurationResponse({
    this.securityHubConfiguration,
  });

  factory GetFindingsPublicationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFindingsPublicationConfigurationResponse(
      securityHubConfiguration: json['securityHubConfiguration'] != null
          ? SecurityHubConfiguration.fromJson(
              json['securityHubConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityHubConfiguration = this.securityHubConfiguration;
    return {
      if (securityHubConfiguration != null)
        'securityHubConfiguration': securityHubConfiguration,
    };
  }
}

class GetFindingsResponse {
  /// An array of objects, one for each finding that meets the criteria specified
  /// in the request.
  final List<Finding>? findings;

  GetFindingsResponse({
    this.findings,
  });

  factory GetFindingsResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingsResponse(
      findings: (json['findings'] as List?)
          ?.whereNotNull()
          .map((e) => Finding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    return {
      if (findings != null) 'findings': findings,
    };
  }
}

class GetInvitationsCountResponse {
  /// The total number of invitations that were received by the account, not
  /// including the currently accepted invitation.
  final int? invitationsCount;

  GetInvitationsCountResponse({
    this.invitationsCount,
  });

  factory GetInvitationsCountResponse.fromJson(Map<String, dynamic> json) {
    return GetInvitationsCountResponse(
      invitationsCount: json['invitationsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final invitationsCount = this.invitationsCount;
    return {
      if (invitationsCount != null) 'invitationsCount': invitationsCount,
    };
  }
}

class GetMacieSessionResponse {
  /// The date and time, in UTC and extended ISO 8601 format, when the Amazon
  /// Macie account was created.
  final DateTime? createdAt;

  /// The frequency with which Macie publishes updates to policy findings for the
  /// account. This includes publishing updates to Security Hub and Amazon
  /// EventBridge (formerly called Amazon CloudWatch Events).
  final FindingPublishingFrequency? findingPublishingFrequency;

  /// The Amazon Resource Name (ARN) of the service-linked role that allows Macie
  /// to monitor and analyze data in Amazon Web Services resources for the
  /// account.
  final String? serviceRole;

  /// The current status of the Macie account. Possible values are: PAUSED, the
  /// account is enabled but all Macie activities are suspended (paused) for the
  /// account; and, ENABLED, the account is enabled and all Macie activities are
  /// enabled for the account.
  final MacieStatus? status;

  /// The date and time, in UTC and extended ISO 8601 format, of the most recent
  /// change to the status of the Macie account.
  final DateTime? updatedAt;

  GetMacieSessionResponse({
    this.createdAt,
    this.findingPublishingFrequency,
    this.serviceRole,
    this.status,
    this.updatedAt,
  });

  factory GetMacieSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetMacieSessionResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      findingPublishingFrequency:
          (json['findingPublishingFrequency'] as String?)
              ?.toFindingPublishingFrequency(),
      serviceRole: json['serviceRole'] as String?,
      status: (json['status'] as String?)?.toMacieStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final findingPublishingFrequency = this.findingPublishingFrequency;
    final serviceRole = this.serviceRole;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (findingPublishingFrequency != null)
        'findingPublishingFrequency': findingPublishingFrequency.toValue(),
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetMasterAccountResponse {
  /// (Deprecated) The Amazon Web Services account ID for the administrator
  /// account. If the accounts are associated by a Macie membership invitation,
  /// this object also provides details about the invitation that was sent to
  /// establish the relationship between the accounts.
  final Invitation? master;

  GetMasterAccountResponse({
    this.master,
  });

  factory GetMasterAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetMasterAccountResponse(
      master: json['master'] != null
          ? Invitation.fromJson(json['master'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final master = this.master;
    return {
      if (master != null) 'master': master,
    };
  }
}

class GetMemberResponse {
  /// The Amazon Web Services account ID for the account.
  final String? accountId;

  /// The Amazon Web Services account ID for the administrator account.
  final String? administratorAccountId;

  /// The Amazon Resource Name (ARN) of the account.
  final String? arn;

  /// The email address for the account.
  final String? email;

  /// The date and time, in UTC and extended ISO 8601 format, when an Amazon Macie
  /// membership invitation was last sent to the account. This value is null if a
  /// Macie invitation hasn't been sent to the account.
  final DateTime? invitedAt;

  /// (Deprecated) The Amazon Web Services account ID for the administrator
  /// account. This property has been replaced by the administratorAccountId
  /// property and is retained only for backward compatibility.
  final String? masterAccountId;

  /// The current status of the relationship between the account and the
  /// administrator account.
  final RelationshipStatus? relationshipStatus;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the member account in Amazon Macie.
  final Map<String, String>? tags;

  /// The date and time, in UTC and extended ISO 8601 format, of the most recent
  /// change to the status of the relationship between the account and the
  /// administrator account.
  final DateTime? updatedAt;

  GetMemberResponse({
    this.accountId,
    this.administratorAccountId,
    this.arn,
    this.email,
    this.invitedAt,
    this.masterAccountId,
    this.relationshipStatus,
    this.tags,
    this.updatedAt,
  });

  factory GetMemberResponse.fromJson(Map<String, dynamic> json) {
    return GetMemberResponse(
      accountId: json['accountId'] as String?,
      administratorAccountId: json['administratorAccountId'] as String?,
      arn: json['arn'] as String?,
      email: json['email'] as String?,
      invitedAt: timeStampFromJson(json['invitedAt']),
      masterAccountId: json['masterAccountId'] as String?,
      relationshipStatus:
          (json['relationshipStatus'] as String?)?.toRelationshipStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final administratorAccountId = this.administratorAccountId;
    final arn = this.arn;
    final email = this.email;
    final invitedAt = this.invitedAt;
    final masterAccountId = this.masterAccountId;
    final relationshipStatus = this.relationshipStatus;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'accountId': accountId,
      if (administratorAccountId != null)
        'administratorAccountId': administratorAccountId,
      if (arn != null) 'arn': arn,
      if (email != null) 'email': email,
      if (invitedAt != null) 'invitedAt': iso8601ToJson(invitedAt),
      if (masterAccountId != null) 'masterAccountId': masterAccountId,
      if (relationshipStatus != null)
        'relationshipStatus': relationshipStatus.toValue(),
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetUsageStatisticsResponse {
  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  /// An array of objects that contains the results of the query. Each object
  /// contains the data for an account that meets the filter criteria specified in
  /// the request.
  final List<UsageRecord>? records;

  /// The inclusive time period that the usage data applies to. Possible values
  /// are: MONTH_TO_DATE, for the current calendar month to date; and,
  /// PAST_30_DAYS, for the preceding 30 days.
  final TimeRange? timeRange;

  GetUsageStatisticsResponse({
    this.nextToken,
    this.records,
    this.timeRange,
  });

  factory GetUsageStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetUsageStatisticsResponse(
      nextToken: json['nextToken'] as String?,
      records: (json['records'] as List?)
          ?.whereNotNull()
          .map((e) => UsageRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeRange: (json['timeRange'] as String?)?.toTimeRange(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final records = this.records;
    final timeRange = this.timeRange;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (records != null) 'records': records,
      if (timeRange != null) 'timeRange': timeRange.toValue(),
    };
  }
}

class GetUsageTotalsResponse {
  /// The inclusive time period that the usage data applies to. Possible values
  /// are: MONTH_TO_DATE, for the current calendar month to date; and,
  /// PAST_30_DAYS, for the preceding 30 days.
  final TimeRange? timeRange;

  /// An array of objects that contains the results of the query. Each object
  /// contains the data for a specific usage metric.
  final List<UsageTotal>? usageTotals;

  GetUsageTotalsResponse({
    this.timeRange,
    this.usageTotals,
  });

  factory GetUsageTotalsResponse.fromJson(Map<String, dynamic> json) {
    return GetUsageTotalsResponse(
      timeRange: (json['timeRange'] as String?)?.toTimeRange(),
      usageTotals: (json['usageTotals'] as List?)
          ?.whereNotNull()
          .map((e) => UsageTotal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final timeRange = this.timeRange;
    final usageTotals = this.usageTotals;
    return {
      if (timeRange != null) 'timeRange': timeRange.toValue(),
      if (usageTotals != null) 'usageTotals': usageTotals,
    };
  }
}

enum GroupBy {
  resourcesAffectedS3BucketName,
  type,
  classificationDetailsJobId,
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
  }
}

extension on String {
  GroupBy toGroupBy() {
    switch (this) {
      case 'resourcesAffected.s3Bucket.name':
        return GroupBy.resourcesAffectedS3BucketName;
      case 'type':
        return GroupBy.type;
      case 'classificationDetails.jobId':
        return GroupBy.classificationDetailsJobId;
      case 'severity.description':
        return GroupBy.severityDescription;
    }
    throw Exception('$this is not known in enum GroupBy');
  }
}

/// Provides a group of results for a query that retrieved aggregated
/// statistical data about findings.
class GroupCount {
  /// The total number of findings in the group of query results.
  final int? count;

  /// The name of the property that defines the group in the query results, as
  /// specified by the groupBy property in the query request.
  final String? groupKey;

  GroupCount({
    this.count,
    this.groupKey,
  });

  factory GroupCount.fromJson(Map<String, dynamic> json) {
    return GroupCount(
      count: json['count'] as int?,
      groupKey: json['groupKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final groupKey = this.groupKey;
    return {
      if (count != null) 'count': count,
      if (groupKey != null) 'groupKey': groupKey,
    };
  }
}

/// Provides information about an Identity and Access Management (IAM) user who
/// performed an action on an affected resource.
class IamUser {
  /// The unique identifier for the Amazon Web Services account that's associated
  /// with the IAM user who performed the action.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the principal that performed the action.
  /// The last section of the ARN contains the name of the user who performed the
  /// action.
  final String? arn;

  /// The unique identifier for the IAM user who performed the action.
  final String? principalId;

  /// The user name of the IAM user who performed the action.
  final String? userName;

  IamUser({
    this.accountId,
    this.arn,
    this.principalId,
    this.userName,
  });

  factory IamUser.fromJson(Map<String, dynamic> json) {
    return IamUser(
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      principalId: json['principalId'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final principalId = this.principalId;
    final userName = this.userName;
    return {
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (principalId != null) 'principalId': principalId,
      if (userName != null) 'userName': userName,
    };
  }
}

/// Provides information about an Amazon Macie membership invitation that was
/// received by an account.
class Invitation {
  /// The Amazon Web Services account ID for the account that sent the invitation.
  final String? accountId;

  /// The unique identifier for the invitation. Amazon Macie uses this identifier
  /// to validate the inviter account with the invitee account.
  final String? invitationId;

  /// The date and time, in UTC and extended ISO 8601 format, when the invitation
  /// was sent.
  final DateTime? invitedAt;

  /// The status of the relationship between the account that sent the invitation
  /// (<i>inviter account</i>) and the account that received the invitation
  /// (<i>invitee account</i>).
  final RelationshipStatus? relationshipStatus;

  Invitation({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.relationshipStatus,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) {
    return Invitation(
      accountId: json['accountId'] as String?,
      invitationId: json['invitationId'] as String?,
      invitedAt: timeStampFromJson(json['invitedAt']),
      relationshipStatus:
          (json['relationshipStatus'] as String?)?.toRelationshipStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final invitationId = this.invitationId;
    final invitedAt = this.invitedAt;
    final relationshipStatus = this.relationshipStatus;
    return {
      if (accountId != null) 'accountId': accountId,
      if (invitationId != null) 'invitationId': invitationId,
      if (invitedAt != null) 'invitedAt': iso8601ToJson(invitedAt),
      if (relationshipStatus != null)
        'relationshipStatus': relationshipStatus.toValue(),
    };
  }
}

/// Provides information about the IP address of the device that an entity used
/// to perform an action on an affected resource.
class IpAddressDetails {
  /// The Internet Protocol version 4 (IPv4) address of the device.
  final String? ipAddressV4;

  /// The city that the IP address originated from.
  final IpCity? ipCity;

  /// The country that the IP address originated from.
  final IpCountry? ipCountry;

  /// The geographic coordinates of the location that the IP address originated
  /// from.
  final IpGeoLocation? ipGeoLocation;

  /// The registered owner of the IP address.
  final IpOwner? ipOwner;

  IpAddressDetails({
    this.ipAddressV4,
    this.ipCity,
    this.ipCountry,
    this.ipGeoLocation,
    this.ipOwner,
  });

  factory IpAddressDetails.fromJson(Map<String, dynamic> json) {
    return IpAddressDetails(
      ipAddressV4: json['ipAddressV4'] as String?,
      ipCity: json['ipCity'] != null
          ? IpCity.fromJson(json['ipCity'] as Map<String, dynamic>)
          : null,
      ipCountry: json['ipCountry'] != null
          ? IpCountry.fromJson(json['ipCountry'] as Map<String, dynamic>)
          : null,
      ipGeoLocation: json['ipGeoLocation'] != null
          ? IpGeoLocation.fromJson(
              json['ipGeoLocation'] as Map<String, dynamic>)
          : null,
      ipOwner: json['ipOwner'] != null
          ? IpOwner.fromJson(json['ipOwner'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddressV4 = this.ipAddressV4;
    final ipCity = this.ipCity;
    final ipCountry = this.ipCountry;
    final ipGeoLocation = this.ipGeoLocation;
    final ipOwner = this.ipOwner;
    return {
      if (ipAddressV4 != null) 'ipAddressV4': ipAddressV4,
      if (ipCity != null) 'ipCity': ipCity,
      if (ipCountry != null) 'ipCountry': ipCountry,
      if (ipGeoLocation != null) 'ipGeoLocation': ipGeoLocation,
      if (ipOwner != null) 'ipOwner': ipOwner,
    };
  }
}

/// Provides information about the city that an IP address originated from.
class IpCity {
  /// The name of the city.
  final String? name;

  IpCity({
    this.name,
  });

  factory IpCity.fromJson(Map<String, dynamic> json) {
    return IpCity(
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'name': name,
    };
  }
}

/// Provides information about the country that an IP address originated from.
class IpCountry {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country that
  /// the IP address originated from. For example, US for the United States.
  final String? code;

  /// The name of the country that the IP address originated from.
  final String? name;

  IpCountry({
    this.code,
    this.name,
  });

  factory IpCountry.fromJson(Map<String, dynamic> json) {
    return IpCountry(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    };
  }
}

/// Provides geographic coordinates that indicate where a specified IP address
/// originated from.
class IpGeoLocation {
  /// The latitude coordinate of the location, rounded to four decimal places.
  final double? lat;

  /// The longitude coordinate of the location, rounded to four decimal places.
  final double? lon;

  IpGeoLocation({
    this.lat,
    this.lon,
  });

  factory IpGeoLocation.fromJson(Map<String, dynamic> json) {
    return IpGeoLocation(
      lat: json['lat'] as double?,
      lon: json['lon'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final lat = this.lat;
    final lon = this.lon;
    return {
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
    };
  }
}

/// Provides information about the registered owner of an IP address.
class IpOwner {
  /// The autonomous system number (ASN) for the autonomous system that included
  /// the IP address.
  final String? asn;

  /// The organization identifier that's associated with the autonomous system
  /// number (ASN) for the autonomous system that included the IP address.
  final String? asnOrg;

  /// The name of the internet service provider (ISP) that owned the IP address.
  final String? isp;

  /// The name of the organization that owned the IP address.
  final String? org;

  IpOwner({
    this.asn,
    this.asnOrg,
    this.isp,
    this.org,
  });

  factory IpOwner.fromJson(Map<String, dynamic> json) {
    return IpOwner(
      asn: json['asn'] as String?,
      asnOrg: json['asnOrg'] as String?,
      isp: json['isp'] as String?,
      org: json['org'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final asnOrg = this.asnOrg;
    final isp = this.isp;
    final org = this.org;
    return {
      if (asn != null) 'asn': asn,
      if (asnOrg != null) 'asnOrg': asnOrg,
      if (isp != null) 'isp': isp,
      if (org != null) 'org': org,
    };
  }
}

enum IsDefinedInJob {
  $true,
  $false,
  unknown,
}

extension on IsDefinedInJob {
  String toValue() {
    switch (this) {
      case IsDefinedInJob.$true:
        return 'TRUE';
      case IsDefinedInJob.$false:
        return 'FALSE';
      case IsDefinedInJob.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  IsDefinedInJob toIsDefinedInJob() {
    switch (this) {
      case 'TRUE':
        return IsDefinedInJob.$true;
      case 'FALSE':
        return IsDefinedInJob.$false;
      case 'UNKNOWN':
        return IsDefinedInJob.unknown;
    }
    throw Exception('$this is not known in enum IsDefinedInJob');
  }
}

enum IsMonitoredByJob {
  $true,
  $false,
  unknown,
}

extension on IsMonitoredByJob {
  String toValue() {
    switch (this) {
      case IsMonitoredByJob.$true:
        return 'TRUE';
      case IsMonitoredByJob.$false:
        return 'FALSE';
      case IsMonitoredByJob.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  IsMonitoredByJob toIsMonitoredByJob() {
    switch (this) {
      case 'TRUE':
        return IsMonitoredByJob.$true;
      case 'FALSE':
        return IsMonitoredByJob.$false;
      case 'UNKNOWN':
        return IsMonitoredByJob.unknown;
    }
    throw Exception('$this is not known in enum IsMonitoredByJob');
  }
}

/// The operator to use in a condition. Valid values are:
enum JobComparator {
  eq,
  gt,
  gte,
  lt,
  lte,
  ne,
  contains,
  startsWith,
}

extension on JobComparator {
  String toValue() {
    switch (this) {
      case JobComparator.eq:
        return 'EQ';
      case JobComparator.gt:
        return 'GT';
      case JobComparator.gte:
        return 'GTE';
      case JobComparator.lt:
        return 'LT';
      case JobComparator.lte:
        return 'LTE';
      case JobComparator.ne:
        return 'NE';
      case JobComparator.contains:
        return 'CONTAINS';
      case JobComparator.startsWith:
        return 'STARTS_WITH';
    }
  }
}

extension on String {
  JobComparator toJobComparator() {
    switch (this) {
      case 'EQ':
        return JobComparator.eq;
      case 'GT':
        return JobComparator.gt;
      case 'GTE':
        return JobComparator.gte;
      case 'LT':
        return JobComparator.lt;
      case 'LTE':
        return JobComparator.lte;
      case 'NE':
        return JobComparator.ne;
      case 'CONTAINS':
        return JobComparator.contains;
      case 'STARTS_WITH':
        return JobComparator.startsWith;
    }
    throw Exception('$this is not known in enum JobComparator');
  }
}

/// Specifies whether any one-time or recurring classification jobs are
/// configured to analyze data in an S3 bucket, and, if so, the details of the
/// job that ran most recently.
class JobDetails {
  /// Specifies whether any one-time or recurring jobs are configured to analyze
  /// data in the bucket. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// TRUE - The bucket is explicitly included in the bucket definition
  /// (S3BucketDefinitionForJob) for one or more jobs and at least one of those
  /// jobs has a status other than CANCELLED. Or the bucket matched the bucket
  /// criteria (S3BucketCriteriaForJob) for at least one job that previously ran.
  /// </li>
  /// <li>
  /// FALSE - The bucket isn't explicitly included in the bucket definition
  /// (S3BucketDefinitionForJob) for any jobs, all the jobs that explicitly
  /// include the bucket in their bucket definitions have a status of CANCELLED,
  /// or the bucket didn't match the bucket criteria (S3BucketCriteriaForJob) for
  /// any jobs that previously ran.
  /// </li>
  /// <li>
  /// UNKNOWN - An exception occurred when Amazon Macie attempted to retrieve job
  /// data for the bucket.
  /// </li>
  /// </ul>
  ///
  final IsDefinedInJob? isDefinedInJob;

  /// Specifies whether any recurring jobs are configured to analyze data in the
  /// bucket. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// TRUE - The bucket is explicitly included in the bucket definition
  /// (S3BucketDefinitionForJob) for one or more recurring jobs or the bucket
  /// matches the bucket criteria (S3BucketCriteriaForJob) for one or more
  /// recurring jobs. At least one of those jobs has a status other than
  /// CANCELLED.
  /// </li>
  /// <li>
  /// FALSE - The bucket isn't explicitly included in the bucket definition
  /// (S3BucketDefinitionForJob) for any recurring jobs, the bucket doesn't match
  /// the bucket criteria (S3BucketCriteriaForJob) for any recurring jobs, or all
  /// the recurring jobs that are configured to analyze data in the bucket have a
  /// status of CANCELLED.
  /// </li>
  /// <li>
  /// UNKNOWN - An exception occurred when Amazon Macie attempted to retrieve job
  /// data for the bucket.
  /// </li>
  /// </ul>
  final IsMonitoredByJob? isMonitoredByJob;

  /// The unique identifier for the job that ran most recently and is configured
  /// to analyze data in the bucket, either the latest run of a recurring job or
  /// the only run of a one-time job.
  ///
  /// This value is typically null if the value for the isDefinedInJob property is
  /// FALSE or UNKNOWN.
  final String? lastJobId;

  /// The date and time, in UTC and extended ISO 8601 format, when the job
  /// (lastJobId) started. If the job is a recurring job, this value indicates
  /// when the most recent run started.
  ///
  /// This value is typically null if the value for the isDefinedInJob property is
  /// FALSE or UNKNOWN.
  final DateTime? lastJobRunTime;

  JobDetails({
    this.isDefinedInJob,
    this.isMonitoredByJob,
    this.lastJobId,
    this.lastJobRunTime,
  });

  factory JobDetails.fromJson(Map<String, dynamic> json) {
    return JobDetails(
      isDefinedInJob: (json['isDefinedInJob'] as String?)?.toIsDefinedInJob(),
      isMonitoredByJob:
          (json['isMonitoredByJob'] as String?)?.toIsMonitoredByJob(),
      lastJobId: json['lastJobId'] as String?,
      lastJobRunTime: timeStampFromJson(json['lastJobRunTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final isDefinedInJob = this.isDefinedInJob;
    final isMonitoredByJob = this.isMonitoredByJob;
    final lastJobId = this.lastJobId;
    final lastJobRunTime = this.lastJobRunTime;
    return {
      if (isDefinedInJob != null) 'isDefinedInJob': isDefinedInJob.toValue(),
      if (isMonitoredByJob != null)
        'isMonitoredByJob': isMonitoredByJob.toValue(),
      if (lastJobId != null) 'lastJobId': lastJobId,
      if (lastJobRunTime != null)
        'lastJobRunTime': iso8601ToJson(lastJobRunTime),
    };
  }
}

/// Specifies the recurrence pattern for running a classification job.
class JobScheduleFrequency {
  /// Specifies a daily recurrence pattern for running the job.
  final DailySchedule? dailySchedule;

  /// Specifies a monthly recurrence pattern for running the job.
  final MonthlySchedule? monthlySchedule;

  /// Specifies a weekly recurrence pattern for running the job.
  final WeeklySchedule? weeklySchedule;

  JobScheduleFrequency({
    this.dailySchedule,
    this.monthlySchedule,
    this.weeklySchedule,
  });

  factory JobScheduleFrequency.fromJson(Map<String, dynamic> json) {
    return JobScheduleFrequency(
      dailySchedule: json['dailySchedule'] != null
          ? DailySchedule.fromJson(
              json['dailySchedule'] as Map<String, dynamic>)
          : null,
      monthlySchedule: json['monthlySchedule'] != null
          ? MonthlySchedule.fromJson(
              json['monthlySchedule'] as Map<String, dynamic>)
          : null,
      weeklySchedule: json['weeklySchedule'] != null
          ? WeeklySchedule.fromJson(
              json['weeklySchedule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dailySchedule = this.dailySchedule;
    final monthlySchedule = this.monthlySchedule;
    final weeklySchedule = this.weeklySchedule;
    return {
      if (dailySchedule != null) 'dailySchedule': dailySchedule,
      if (monthlySchedule != null) 'monthlySchedule': monthlySchedule,
      if (weeklySchedule != null) 'weeklySchedule': weeklySchedule,
    };
  }
}

/// Specifies a property- or tag-based condition that defines criteria for
/// including or excluding S3 objects from a classification job. A JobScopeTerm
/// object can contain only one simpleScopeTerm object or one tagScopeTerm
/// object.
class JobScopeTerm {
  /// A property-based condition that defines a property, operator, and one or
  /// more values for including or excluding objects from the job.
  final SimpleScopeTerm? simpleScopeTerm;

  /// A tag-based condition that defines the operator and tag keys or tag key and
  /// value pairs for including or excluding objects from the job.
  final TagScopeTerm? tagScopeTerm;

  JobScopeTerm({
    this.simpleScopeTerm,
    this.tagScopeTerm,
  });

  factory JobScopeTerm.fromJson(Map<String, dynamic> json) {
    return JobScopeTerm(
      simpleScopeTerm: json['simpleScopeTerm'] != null
          ? SimpleScopeTerm.fromJson(
              json['simpleScopeTerm'] as Map<String, dynamic>)
          : null,
      tagScopeTerm: json['tagScopeTerm'] != null
          ? TagScopeTerm.fromJson(json['tagScopeTerm'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final simpleScopeTerm = this.simpleScopeTerm;
    final tagScopeTerm = this.tagScopeTerm;
    return {
      if (simpleScopeTerm != null) 'simpleScopeTerm': simpleScopeTerm,
      if (tagScopeTerm != null) 'tagScopeTerm': tagScopeTerm,
    };
  }
}

/// Specifies one or more property- and tag-based conditions that define
/// criteria for including or excluding S3 objects from a classification job.
class JobScopingBlock {
  /// An array of conditions, one for each property- or tag-based condition that
  /// determines which objects to include or exclude from the job. If you specify
  /// more than one condition, Amazon Macie uses AND logic to join the conditions.
  final List<JobScopeTerm>? and;

  JobScopingBlock({
    this.and,
  });

  factory JobScopingBlock.fromJson(Map<String, dynamic> json) {
    return JobScopingBlock(
      and: (json['and'] as List?)
          ?.whereNotNull()
          .map((e) => JobScopeTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    return {
      if (and != null) 'and': and,
    };
  }
}

/// The status of a classification job. Possible values are:
enum JobStatus {
  running,
  paused,
  cancelled,
  complete,
  idle,
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
  }
}

extension on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'RUNNING':
        return JobStatus.running;
      case 'PAUSED':
        return JobStatus.paused;
      case 'CANCELLED':
        return JobStatus.cancelled;
      case 'COMPLETE':
        return JobStatus.complete;
      case 'IDLE':
        return JobStatus.idle;
      case 'USER_PAUSED':
        return JobStatus.userPaused;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// Provides information about a classification job, including the current
/// status of the job.
class JobSummary {
  /// The property- and tag-based conditions that determine which S3 buckets are
  /// included or excluded from the job's analysis. Each time the job runs, the
  /// job uses these criteria to determine which buckets to analyze. A job's
  /// definition can contain a bucketCriteria object or a bucketDefinitions array,
  /// not both.
  final S3BucketCriteriaForJob? bucketCriteria;

  /// An array of objects, one for each Amazon Web Services account that owns
  /// specific S3 buckets for the job to analyze. Each object specifies the
  /// account ID for an account and one or more buckets to analyze for that
  /// account. A job's definition can contain a bucketDefinitions array or a
  /// bucketCriteria object, not both.
  final List<S3BucketDefinitionForJob>? bucketDefinitions;

  /// The date and time, in UTC and extended ISO 8601 format, when the job was
  /// created.
  final DateTime? createdAt;

  /// The unique identifier for the job.
  final String? jobId;

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
  final JobStatus? jobStatus;

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
  final JobType? jobType;

  /// Specifies whether any account- or bucket-level access errors occurred when
  /// the job ran. For a recurring job, this value indicates the error status of
  /// the job's most recent run.
  final LastRunErrorStatus? lastRunErrorStatus;

  /// The custom name of the job.
  final String? name;

  /// If the current status of the job is USER_PAUSED, specifies when the job was
  /// paused and when the job or job run will expire and be cancelled if it isn't
  /// resumed. This value is present only if the value for jobStatus is
  /// USER_PAUSED.
  final UserPausedDetails? userPausedDetails;

  JobSummary({
    this.bucketCriteria,
    this.bucketDefinitions,
    this.createdAt,
    this.jobId,
    this.jobStatus,
    this.jobType,
    this.lastRunErrorStatus,
    this.name,
    this.userPausedDetails,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      bucketCriteria: json['bucketCriteria'] != null
          ? S3BucketCriteriaForJob.fromJson(
              json['bucketCriteria'] as Map<String, dynamic>)
          : null,
      bucketDefinitions: (json['bucketDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              S3BucketDefinitionForJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      jobId: json['jobId'] as String?,
      jobStatus: (json['jobStatus'] as String?)?.toJobStatus(),
      jobType: (json['jobType'] as String?)?.toJobType(),
      lastRunErrorStatus: json['lastRunErrorStatus'] != null
          ? LastRunErrorStatus.fromJson(
              json['lastRunErrorStatus'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      userPausedDetails: json['userPausedDetails'] != null
          ? UserPausedDetails.fromJson(
              json['userPausedDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketCriteria = this.bucketCriteria;
    final bucketDefinitions = this.bucketDefinitions;
    final createdAt = this.createdAt;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final jobType = this.jobType;
    final lastRunErrorStatus = this.lastRunErrorStatus;
    final name = this.name;
    final userPausedDetails = this.userPausedDetails;
    return {
      if (bucketCriteria != null) 'bucketCriteria': bucketCriteria,
      if (bucketDefinitions != null) 'bucketDefinitions': bucketDefinitions,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (jobId != null) 'jobId': jobId,
      if (jobStatus != null) 'jobStatus': jobStatus.toValue(),
      if (jobType != null) 'jobType': jobType.toValue(),
      if (lastRunErrorStatus != null) 'lastRunErrorStatus': lastRunErrorStatus,
      if (name != null) 'name': name,
      if (userPausedDetails != null) 'userPausedDetails': userPausedDetails,
    };
  }
}

/// The schedule for running a classification job. Valid values are:
enum JobType {
  oneTime,
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
  }
}

extension on String {
  JobType toJobType() {
    switch (this) {
      case 'ONE_TIME':
        return JobType.oneTime;
      case 'SCHEDULED':
        return JobType.scheduled;
    }
    throw Exception('$this is not known in enum JobType');
  }
}

/// Provides information about the tags that are associated with an S3 bucket or
/// object. Each tag consists of a required tag key and an associated tag value.
class KeyValuePair {
  /// One part of a key-value pair that comprises a tag. A tag key is a general
  /// label that acts as a category for more specific tag values.
  final String? key;

  /// One part of a key-value pair that comprises a tag. A tag value acts as a
  /// descriptor for a tag key. A tag value can be an empty string.
  final String? value;

  KeyValuePair({
    this.key,
    this.value,
  });

  factory KeyValuePair.fromJson(Map<String, dynamic> json) {
    return KeyValuePair(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// Specifies whether any account- or bucket-level access errors occurred when a
/// classification job ran. For information about using logging data to
/// investigate these errors, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/discovery-jobs-monitor-cw-logs.html">Monitoring
/// sensitive data discovery jobs</a> in the <i>Amazon Macie User Guide</i>.
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
  final LastRunErrorStatusCode? code;

  LastRunErrorStatus({
    this.code,
  });

  factory LastRunErrorStatus.fromJson(Map<String, dynamic> json) {
    return LastRunErrorStatus(
      code: (json['code'] as String?)?.toLastRunErrorStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    return {
      if (code != null) 'code': code.toValue(),
    };
  }
}

/// Specifies whether any account- or bucket-level access errors occurred during
/// the run of a one-time classification job or the most recent run of a
/// recurring classification job. Possible values are:
enum LastRunErrorStatusCode {
  none,
  error,
}

extension on LastRunErrorStatusCode {
  String toValue() {
    switch (this) {
      case LastRunErrorStatusCode.none:
        return 'NONE';
      case LastRunErrorStatusCode.error:
        return 'ERROR';
    }
  }
}

extension on String {
  LastRunErrorStatusCode toLastRunErrorStatusCode() {
    switch (this) {
      case 'NONE':
        return LastRunErrorStatusCode.none;
      case 'ERROR':
        return LastRunErrorStatusCode.error;
    }
    throw Exception('$this is not known in enum LastRunErrorStatusCode');
  }
}

class ListClassificationJobsResponse {
  /// An array of objects, one for each job that meets the filter criteria
  /// specified in the request.
  final List<JobSummary>? items;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListClassificationJobsResponse({
    this.items,
    this.nextToken,
  });

  factory ListClassificationJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListClassificationJobsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCustomDataIdentifiersResponse {
  /// An array of objects, one for each custom data identifier.
  final List<CustomDataIdentifierSummary>? items;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListCustomDataIdentifiersResponse({
    this.items,
    this.nextToken,
  });

  factory ListCustomDataIdentifiersResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCustomDataIdentifiersResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CustomDataIdentifierSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFindingsFiltersResponse {
  /// An array of objects, one for each filter that's associated with the account.
  final List<FindingsFilterListItem>? findingsFilterListItems;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListFindingsFiltersResponse({
    this.findingsFilterListItems,
    this.nextToken,
  });

  factory ListFindingsFiltersResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingsFiltersResponse(
      findingsFilterListItems: (json['findingsFilterListItems'] as List?)
          ?.whereNotNull()
          .map(
              (e) => FindingsFilterListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingsFilterListItems = this.findingsFilterListItems;
    final nextToken = this.nextToken;
    return {
      if (findingsFilterListItems != null)
        'findingsFilterListItems': findingsFilterListItems,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFindingsResponse {
  /// An array of strings, where each string is the unique identifier for a
  /// finding that meets the filter criteria specified in the request.
  final List<String>? findingIds;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListFindingsResponse({
    this.findingIds,
    this.nextToken,
  });

  factory ListFindingsResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingsResponse(
      findingIds: (json['findingIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingIds = this.findingIds;
    final nextToken = this.nextToken;
    return {
      if (findingIds != null) 'findingIds': findingIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListInvitationsResponse {
  /// An array of objects, one for each invitation that was received by the
  /// account.
  final List<Invitation>? invitations;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });

  factory ListInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvitationsResponse(
      invitations: (json['invitations'] as List?)
          ?.whereNotNull()
          .map((e) => Invitation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invitations = this.invitations;
    final nextToken = this.nextToken;
    return {
      if (invitations != null) 'invitations': invitations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Specifies criteria for filtering the results of a request for information
/// about classification jobs.
class ListJobsFilterCriteria {
  /// An array of objects, one for each condition that determines which jobs to
  /// exclude from the results.
  final List<ListJobsFilterTerm>? excludes;

  /// An array of objects, one for each condition that determines which jobs to
  /// include in the results.
  final List<ListJobsFilterTerm>? includes;

  ListJobsFilterCriteria({
    this.excludes,
    this.includes,
  });

  factory ListJobsFilterCriteria.fromJson(Map<String, dynamic> json) {
    return ListJobsFilterCriteria(
      excludes: (json['excludes'] as List?)
          ?.whereNotNull()
          .map((e) => ListJobsFilterTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
      includes: (json['includes'] as List?)
          ?.whereNotNull()
          .map((e) => ListJobsFilterTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    final includes = this.includes;
    return {
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
  }
}

/// The property to use to filter the results. Valid values are:
enum ListJobsFilterKey {
  jobType,
  jobStatus,
  createdAt,
  name,
}

extension on ListJobsFilterKey {
  String toValue() {
    switch (this) {
      case ListJobsFilterKey.jobType:
        return 'jobType';
      case ListJobsFilterKey.jobStatus:
        return 'jobStatus';
      case ListJobsFilterKey.createdAt:
        return 'createdAt';
      case ListJobsFilterKey.name:
        return 'name';
    }
  }
}

extension on String {
  ListJobsFilterKey toListJobsFilterKey() {
    switch (this) {
      case 'jobType':
        return ListJobsFilterKey.jobType;
      case 'jobStatus':
        return ListJobsFilterKey.jobStatus;
      case 'createdAt':
        return ListJobsFilterKey.createdAt;
      case 'name':
        return ListJobsFilterKey.name;
    }
    throw Exception('$this is not known in enum ListJobsFilterKey');
  }
}

/// Specifies a condition that filters the results of a request for information
/// about classification jobs. Each condition consists of a property, an
/// operator, and one or more values.
class ListJobsFilterTerm {
  /// The operator to use to filter the results.
  final JobComparator? comparator;

  /// The property to use to filter the results.
  final ListJobsFilterKey? key;

  /// An array that lists one or more values to use to filter the results.
  final List<String>? values;

  ListJobsFilterTerm({
    this.comparator,
    this.key,
    this.values,
  });

  factory ListJobsFilterTerm.fromJson(Map<String, dynamic> json) {
    return ListJobsFilterTerm(
      comparator: (json['comparator'] as String?)?.toJobComparator(),
      key: (json['key'] as String?)?.toListJobsFilterKey(),
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final key = this.key;
    final values = this.values;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (key != null) 'key': key.toValue(),
      if (values != null) 'values': values,
    };
  }
}

/// The property to sort the results by. Valid values are:
enum ListJobsSortAttributeName {
  createdAt,
  jobStatus,
  name,
  jobType,
}

extension on ListJobsSortAttributeName {
  String toValue() {
    switch (this) {
      case ListJobsSortAttributeName.createdAt:
        return 'createdAt';
      case ListJobsSortAttributeName.jobStatus:
        return 'jobStatus';
      case ListJobsSortAttributeName.name:
        return 'name';
      case ListJobsSortAttributeName.jobType:
        return 'jobType';
    }
  }
}

extension on String {
  ListJobsSortAttributeName toListJobsSortAttributeName() {
    switch (this) {
      case 'createdAt':
        return ListJobsSortAttributeName.createdAt;
      case 'jobStatus':
        return ListJobsSortAttributeName.jobStatus;
      case 'name':
        return ListJobsSortAttributeName.name;
      case 'jobType':
        return ListJobsSortAttributeName.jobType;
    }
    throw Exception('$this is not known in enum ListJobsSortAttributeName');
  }
}

/// Specifies criteria for sorting the results of a request for information
/// about classification jobs.
class ListJobsSortCriteria {
  /// The property to sort the results by.
  final ListJobsSortAttributeName? attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  ListJobsSortCriteria({
    this.attributeName,
    this.orderBy,
  });

  factory ListJobsSortCriteria.fromJson(Map<String, dynamic> json) {
    return ListJobsSortCriteria(
      attributeName:
          (json['attributeName'] as String?)?.toListJobsSortAttributeName(),
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName.toValue(),
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

class ListMembersResponse {
  /// An array of objects, one for each account that's associated with the
  /// administrator account and meets the criteria specified by the onlyAssociated
  /// request parameter.
  final List<Member>? members;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });

  factory ListMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListMembersResponse(
      members: (json['members'] as List?)
          ?.whereNotNull()
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListOrganizationAdminAccountsResponse {
  /// An array of objects, one for each delegated Amazon Macie administrator
  /// account for the organization. Only one of these accounts can have a status
  /// of ENABLED.
  final List<AdminAccount>? adminAccounts;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListOrganizationAdminAccountsResponse({
    this.adminAccounts,
    this.nextToken,
  });

  factory ListOrganizationAdminAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationAdminAccountsResponse(
      adminAccounts: (json['adminAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => AdminAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccounts = this.adminAccounts;
    final nextToken = this.nextToken;
    return {
      if (adminAccounts != null) 'adminAccounts': adminAccounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the resource.
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

/// The status of an Amazon Macie account. Valid values are:
enum MacieStatus {
  paused,
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
  }
}

extension on String {
  MacieStatus toMacieStatus() {
    switch (this) {
      case 'PAUSED':
        return MacieStatus.paused;
      case 'ENABLED':
        return MacieStatus.enabled;
    }
    throw Exception('$this is not known in enum MacieStatus');
  }
}

/// Provides statistical data and other information about an S3 bucket that
/// Amazon Macie monitors and analyzes.
class MatchingBucket {
  /// The unique identifier for the Amazon Web Services account that owns the
  /// bucket.
  final String? accountId;

  /// The name of the bucket.
  final String? bucketName;

  /// The total number of objects that Amazon Macie can analyze in the bucket.
  /// These objects use a supported storage class and have a file name extension
  /// for a supported file or storage format.
  final int? classifiableObjectCount;

  /// The total storage size, in bytes, of the objects that Amazon Macie can
  /// analyze in the bucket. These objects use a supported storage class and have
  /// a file name extension for a supported file or storage format.
  ///
  /// If versioning is enabled for the bucket, Macie calculates this value based
  /// on the size of the latest version of each applicable object in the bucket.
  /// This value doesn't reflect the storage size of all versions of each
  /// applicable object in the bucket.
  final int? classifiableSizeInBytes;

  /// Specifies whether any one-time or recurring classification jobs are
  /// configured to analyze objects in the bucket, and, if so, the details of the
  /// job that ran most recently.
  final JobDetails? jobDetails;

  /// The total number of objects in the bucket.
  final int? objectCount;

  /// The total number of objects that are in the bucket, grouped by server-side
  /// encryption type. This includes a grouping that reports the total number of
  /// objects that aren't encrypted or use client-side encryption.
  final ObjectCountByEncryptionType? objectCountByEncryptionType;

  /// The total storage size, in bytes, of the bucket.
  ///
  /// If versioning is enabled for the bucket, Amazon Macie calculates this value
  /// based on the size of the latest version of each object in the bucket. This
  /// value doesn't reflect the storage size of all versions of each object in the
  /// bucket.
  final int? sizeInBytes;

  /// The total storage size, in bytes, of the objects that are compressed (.gz,
  /// .gzip, .zip) files in the bucket.
  ///
  /// If versioning is enabled for the bucket, Macie calculates this value based
  /// on the size of the latest version of each applicable object in the bucket.
  /// This value doesn't reflect the storage size of all versions of each
  /// applicable object in the bucket.
  final int? sizeInBytesCompressed;

  /// The total number of objects that Amazon Macie can't analyze in the bucket.
  /// These objects don't use a supported storage class or don't have a file name
  /// extension for a supported file or storage format.
  final ObjectLevelStatistics? unclassifiableObjectCount;

  /// The total storage size, in bytes, of the objects that Amazon Macie can't
  /// analyze in the bucket. These objects don't use a supported storage class or
  /// don't have a file name extension for a supported file or storage format.
  final ObjectLevelStatistics? unclassifiableObjectSizeInBytes;

  MatchingBucket({
    this.accountId,
    this.bucketName,
    this.classifiableObjectCount,
    this.classifiableSizeInBytes,
    this.jobDetails,
    this.objectCount,
    this.objectCountByEncryptionType,
    this.sizeInBytes,
    this.sizeInBytesCompressed,
    this.unclassifiableObjectCount,
    this.unclassifiableObjectSizeInBytes,
  });

  factory MatchingBucket.fromJson(Map<String, dynamic> json) {
    return MatchingBucket(
      accountId: json['accountId'] as String?,
      bucketName: json['bucketName'] as String?,
      classifiableObjectCount: json['classifiableObjectCount'] as int?,
      classifiableSizeInBytes: json['classifiableSizeInBytes'] as int?,
      jobDetails: json['jobDetails'] != null
          ? JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>)
          : null,
      objectCount: json['objectCount'] as int?,
      objectCountByEncryptionType: json['objectCountByEncryptionType'] != null
          ? ObjectCountByEncryptionType.fromJson(
              json['objectCountByEncryptionType'] as Map<String, dynamic>)
          : null,
      sizeInBytes: json['sizeInBytes'] as int?,
      sizeInBytesCompressed: json['sizeInBytesCompressed'] as int?,
      unclassifiableObjectCount: json['unclassifiableObjectCount'] != null
          ? ObjectLevelStatistics.fromJson(
              json['unclassifiableObjectCount'] as Map<String, dynamic>)
          : null,
      unclassifiableObjectSizeInBytes:
          json['unclassifiableObjectSizeInBytes'] != null
              ? ObjectLevelStatistics.fromJson(
                  json['unclassifiableObjectSizeInBytes']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final bucketName = this.bucketName;
    final classifiableObjectCount = this.classifiableObjectCount;
    final classifiableSizeInBytes = this.classifiableSizeInBytes;
    final jobDetails = this.jobDetails;
    final objectCount = this.objectCount;
    final objectCountByEncryptionType = this.objectCountByEncryptionType;
    final sizeInBytes = this.sizeInBytes;
    final sizeInBytesCompressed = this.sizeInBytesCompressed;
    final unclassifiableObjectCount = this.unclassifiableObjectCount;
    final unclassifiableObjectSizeInBytes =
        this.unclassifiableObjectSizeInBytes;
    return {
      if (accountId != null) 'accountId': accountId,
      if (bucketName != null) 'bucketName': bucketName,
      if (classifiableObjectCount != null)
        'classifiableObjectCount': classifiableObjectCount,
      if (classifiableSizeInBytes != null)
        'classifiableSizeInBytes': classifiableSizeInBytes,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (objectCount != null) 'objectCount': objectCount,
      if (objectCountByEncryptionType != null)
        'objectCountByEncryptionType': objectCountByEncryptionType,
      if (sizeInBytes != null) 'sizeInBytes': sizeInBytes,
      if (sizeInBytesCompressed != null)
        'sizeInBytesCompressed': sizeInBytesCompressed,
      if (unclassifiableObjectCount != null)
        'unclassifiableObjectCount': unclassifiableObjectCount,
      if (unclassifiableObjectSizeInBytes != null)
        'unclassifiableObjectSizeInBytes': unclassifiableObjectSizeInBytes,
    };
  }
}

/// Provides statistical data and other information about an Amazon Web Services
/// resource that Amazon Macie monitors and analyzes.
class MatchingResource {
  /// The details of an S3 bucket that Amazon Macie monitors and analyzes.
  final MatchingBucket? matchingBucket;

  MatchingResource({
    this.matchingBucket,
  });

  factory MatchingResource.fromJson(Map<String, dynamic> json) {
    return MatchingResource(
      matchingBucket: json['matchingBucket'] != null
          ? MatchingBucket.fromJson(
              json['matchingBucket'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final matchingBucket = this.matchingBucket;
    return {
      if (matchingBucket != null) 'matchingBucket': matchingBucket,
    };
  }
}

/// Provides information about an account that's associated with an Amazon Macie
/// administrator account.
class Member {
  /// The Amazon Web Services account ID for the account.
  final String? accountId;

  /// The Amazon Web Services account ID for the administrator account.
  final String? administratorAccountId;

  /// The Amazon Resource Name (ARN) of the account.
  final String? arn;

  /// The email address for the account.
  final String? email;

  /// The date and time, in UTC and extended ISO 8601 format, when an Amazon Macie
  /// membership invitation was last sent to the account. This value is null if a
  /// Macie invitation hasn't been sent to the account.
  final DateTime? invitedAt;

  /// (Deprecated) The Amazon Web Services account ID for the administrator
  /// account. This property has been replaced by the administratorAccountId
  /// property and is retained only for backward compatibility.
  final String? masterAccountId;

  /// The current status of the relationship between the account and the
  /// administrator account.
  final RelationshipStatus? relationshipStatus;

  /// A map of key-value pairs that identifies the tags (keys and values) that are
  /// associated with the account in Amazon Macie.
  final Map<String, String>? tags;

  /// The date and time, in UTC and extended ISO 8601 format, of the most recent
  /// change to the status of the relationship between the account and the
  /// administrator account.
  final DateTime? updatedAt;

  Member({
    this.accountId,
    this.administratorAccountId,
    this.arn,
    this.email,
    this.invitedAt,
    this.masterAccountId,
    this.relationshipStatus,
    this.tags,
    this.updatedAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      accountId: json['accountId'] as String?,
      administratorAccountId: json['administratorAccountId'] as String?,
      arn: json['arn'] as String?,
      email: json['email'] as String?,
      invitedAt: timeStampFromJson(json['invitedAt']),
      masterAccountId: json['masterAccountId'] as String?,
      relationshipStatus:
          (json['relationshipStatus'] as String?)?.toRelationshipStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final administratorAccountId = this.administratorAccountId;
    final arn = this.arn;
    final email = this.email;
    final invitedAt = this.invitedAt;
    final masterAccountId = this.masterAccountId;
    final relationshipStatus = this.relationshipStatus;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'accountId': accountId,
      if (administratorAccountId != null)
        'administratorAccountId': administratorAccountId,
      if (arn != null) 'arn': arn,
      if (email != null) 'email': email,
      if (invitedAt != null) 'invitedAt': iso8601ToJson(invitedAt),
      if (masterAccountId != null) 'masterAccountId': masterAccountId,
      if (relationshipStatus != null)
        'relationshipStatus': relationshipStatus.toValue(),
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Specifies a monthly recurrence pattern for running a classification job.
class MonthlySchedule {
  /// The numeric day of the month when Amazon Macie runs the job. This value can
  /// be an integer from 1 through 31.
  ///
  /// If this value exceeds the number of days in a certain month, Macie doesn't
  /// run the job that month. Macie runs the job only during months that have the
  /// specified day. For example, if this value is 31 and a month has only 30
  /// days, Macie doesn't run the job that month. To run the job every month,
  /// specify a value that's less than 29.
  final int? dayOfMonth;

  MonthlySchedule({
    this.dayOfMonth,
  });

  factory MonthlySchedule.fromJson(Map<String, dynamic> json) {
    return MonthlySchedule(
      dayOfMonth: json['dayOfMonth'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfMonth = this.dayOfMonth;
    return {
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
    };
  }
}

/// Provides information about the number of objects that are in an S3 bucket
/// and use certain types of server-side encryption, use client-side encryption,
/// or aren't encrypted.
class ObjectCountByEncryptionType {
  /// The total number of objects that are encrypted with a customer-managed key.
  /// The objects use customer-provided server-side encryption (SSE-C).
  final int? customerManaged;

  /// The total number of objects that are encrypted with an Key Management
  /// Service (KMS) customer master key (CMK). The objects use Amazon Web Services
  /// managed KMS encryption (AWS-KMS) or customer managed KMS encryption
  /// (SSE-KMS).
  final int? kmsManaged;

  /// The total number of objects that are encrypted with an Amazon S3 managed
  /// key. The objects use Amazon S3 managed encryption (SSE-S3).
  final int? s3Managed;

  /// The total number of objects that aren't encrypted or use client-side
  /// encryption.
  final int? unencrypted;

  /// The total number of objects that Amazon Macie doesn't have current
  /// encryption metadata for. Macie can't provide current data about the
  /// encryption settings for these objects.
  final int? unknown;

  ObjectCountByEncryptionType({
    this.customerManaged,
    this.kmsManaged,
    this.s3Managed,
    this.unencrypted,
    this.unknown,
  });

  factory ObjectCountByEncryptionType.fromJson(Map<String, dynamic> json) {
    return ObjectCountByEncryptionType(
      customerManaged: json['customerManaged'] as int?,
      kmsManaged: json['kmsManaged'] as int?,
      s3Managed: json['s3Managed'] as int?,
      unencrypted: json['unencrypted'] as int?,
      unknown: json['unknown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManaged = this.customerManaged;
    final kmsManaged = this.kmsManaged;
    final s3Managed = this.s3Managed;
    final unencrypted = this.unencrypted;
    final unknown = this.unknown;
    return {
      if (customerManaged != null) 'customerManaged': customerManaged,
      if (kmsManaged != null) 'kmsManaged': kmsManaged,
      if (s3Managed != null) 's3Managed': s3Managed,
      if (unencrypted != null) 'unencrypted': unencrypted,
      if (unknown != null) 'unknown': unknown,
    };
  }
}

/// Provides information about the total storage size (in bytes) or number of
/// objects that Amazon Macie can't analyze in one or more S3 buckets. In a
/// BucketMetadata or MatchingBucket object, this data is for a specific bucket.
/// In a GetBucketStatisticsResponse object, this data is aggregated for all the
/// buckets in the query results. If versioning is enabled for a bucket, total
/// storage size values are based on the size of the latest version of each
/// applicable object in the bucket.
class ObjectLevelStatistics {
  /// The total storage size (in bytes) or number of objects that Amazon Macie
  /// can't analyze because the objects don't have a file name extension for a
  /// supported file or storage format.
  final int? fileType;

  /// The total storage size (in bytes) or number of objects that Amazon Macie
  /// can't analyze because the objects use an unsupported storage class.
  final int? storageClass;

  /// The total storage size (in bytes) or number of objects that Amazon Macie
  /// can't analyze because the objects use an unsupported storage class or don't
  /// have a file name extension for a supported file or storage format.
  final int? total;

  ObjectLevelStatistics({
    this.fileType,
    this.storageClass,
    this.total,
  });

  factory ObjectLevelStatistics.fromJson(Map<String, dynamic> json) {
    return ObjectLevelStatistics(
      fileType: json['fileType'] as int?,
      storageClass: json['storageClass'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileType = this.fileType;
    final storageClass = this.storageClass;
    final total = this.total;
    return {
      if (fileType != null) 'fileType': fileType,
      if (storageClass != null) 'storageClass': storageClass,
      if (total != null) 'total': total,
    };
  }
}

/// Specifies the location of 1-15 occurrences of sensitive data that was
/// detected by managed data identifiers or a custom data identifier and
/// produced a sensitive data finding.
class Occurrences {
  /// An array of objects, one for each occurrence of sensitive data in a
  /// Microsoft Excel workbook, CSV file, or TSV file. This value is null for all
  /// other types of files.
  ///
  /// Each Cell object specifies a cell or field that contains the sensitive data.
  final List<Cell>? cells;

  /// An array of objects, one for each occurrence of sensitive data in a
  /// non-binary text file, such as an HTML, TXT, or XML file. Each Range object
  /// specifies a line or inclusive range of lines that contains the sensitive
  /// data, and the position of the data on the specified line or lines.
  ///
  /// This value is often null for file types that are supported by Cell, Page, or
  /// Record objects. Exceptions are the location of sensitive data in:
  /// unstructured sections of an otherwise structured file, such as a comment in
  /// a file; a malformed file that Amazon Macie analyzes as plain text; and, a
  /// CSV or TSV file that has any column names that contain sensitive data.
  final List<Range>? lineRanges;

  /// Reserved for future use.
  final List<Range>? offsetRanges;

  /// An array of objects, one for each occurrence of sensitive data in an Adobe
  /// Portable Document Format file. This value is null for all other types of
  /// files.
  ///
  /// Each Page object specifies a page that contains the sensitive data.
  final List<Page>? pages;

  /// An array of objects, one for each occurrence of sensitive data in an Apache
  /// Avro object container, Apache Parquet file, JSON file, or JSON Lines file.
  /// This value is null for all other types of files.
  ///
  /// For an Avro object container or Parquet file, each Record object specifies a
  /// record index and the path to a field in a record that contains the sensitive
  /// data. For a JSON or JSON Lines file, each Record object specifies the path
  /// to a field or array that contains the sensitive data. For a JSON Lines file,
  /// it also specifies the index of the line that contains the data.
  final List<Record>? records;

  Occurrences({
    this.cells,
    this.lineRanges,
    this.offsetRanges,
    this.pages,
    this.records,
  });

  factory Occurrences.fromJson(Map<String, dynamic> json) {
    return Occurrences(
      cells: (json['cells'] as List?)
          ?.whereNotNull()
          .map((e) => Cell.fromJson(e as Map<String, dynamic>))
          .toList(),
      lineRanges: (json['lineRanges'] as List?)
          ?.whereNotNull()
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      offsetRanges: (json['offsetRanges'] as List?)
          ?.whereNotNull()
          .map((e) => Range.fromJson(e as Map<String, dynamic>))
          .toList(),
      pages: (json['pages'] as List?)
          ?.whereNotNull()
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
      records: (json['records'] as List?)
          ?.whereNotNull()
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    final lineRanges = this.lineRanges;
    final offsetRanges = this.offsetRanges;
    final pages = this.pages;
    final records = this.records;
    return {
      if (cells != null) 'cells': cells,
      if (lineRanges != null) 'lineRanges': lineRanges,
      if (offsetRanges != null) 'offsetRanges': offsetRanges,
      if (pages != null) 'pages': pages,
      if (records != null) 'records': records,
    };
  }
}

enum OrderBy {
  asc,
  desc,
}

extension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';
      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension on String {
  OrderBy toOrderBy() {
    switch (this) {
      case 'ASC':
        return OrderBy.asc;
      case 'DESC':
        return OrderBy.desc;
    }
    throw Exception('$this is not known in enum OrderBy');
  }
}

/// Specifies the location of an occurrence of sensitive data in an Adobe
/// Portable Document Format file.
class Page {
  /// Reserved for future use.
  final Range? lineRange;

  /// Reserved for future use.
  final Range? offsetRange;

  /// The page number of the page that contains the sensitive data.
  final int? pageNumber;

  Page({
    this.lineRange,
    this.offsetRange,
    this.pageNumber,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      lineRange: json['lineRange'] != null
          ? Range.fromJson(json['lineRange'] as Map<String, dynamic>)
          : null,
      offsetRange: json['offsetRange'] != null
          ? Range.fromJson(json['offsetRange'] as Map<String, dynamic>)
          : null,
      pageNumber: json['pageNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final lineRange = this.lineRange;
    final offsetRange = this.offsetRange;
    final pageNumber = this.pageNumber;
    return {
      if (lineRange != null) 'lineRange': lineRange,
      if (offsetRange != null) 'offsetRange': offsetRange,
      if (pageNumber != null) 'pageNumber': pageNumber,
    };
  }
}

/// Provides the details of a policy finding.
class PolicyDetails {
  /// The action that produced the finding.
  final FindingAction? action;

  /// The entity that performed the action that produced the finding.
  final FindingActor? actor;

  PolicyDetails({
    this.action,
    this.actor,
  });

  factory PolicyDetails.fromJson(Map<String, dynamic> json) {
    return PolicyDetails(
      action: json['action'] != null
          ? FindingAction.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      actor: json['actor'] != null
          ? FindingActor.fromJson(json['actor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final actor = this.actor;
    return {
      if (action != null) 'action': action,
      if (actor != null) 'actor': actor,
    };
  }
}

class PutClassificationExportConfigurationResponse {
  /// The location where the data classification results are stored, and the
  /// encryption settings that are used when storing results in that location.
  final ClassificationExportConfiguration? configuration;

  PutClassificationExportConfigurationResponse({
    this.configuration,
  });

  factory PutClassificationExportConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutClassificationExportConfigurationResponse(
      configuration: json['configuration'] != null
          ? ClassificationExportConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      if (configuration != null) 'configuration': configuration,
    };
  }
}

class PutFindingsPublicationConfigurationResponse {
  PutFindingsPublicationConfigurationResponse();

  factory PutFindingsPublicationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutFindingsPublicationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the location of an occurrence of sensitive data in a non-binary
/// text file, such as an HTML, TXT, or XML file.
class Range {
  /// The number of lines from the beginning of the file to the end of the
  /// sensitive data.
  final int? end;

  /// The number of lines from the beginning of the file to the beginning of the
  /// sensitive data.
  final int? start;

  /// The number of characters, with spaces and starting from 1, from the
  /// beginning of the first line that contains the sensitive data (start) to the
  /// beginning of the sensitive data.
  final int? startColumn;

  Range({
    this.end,
    this.start,
    this.startColumn,
  });

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(
      end: json['end'] as int?,
      start: json['start'] as int?,
      startColumn: json['startColumn'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    final startColumn = this.startColumn;
    return {
      if (end != null) 'end': end,
      if (start != null) 'start': start,
      if (startColumn != null) 'startColumn': startColumn,
    };
  }
}

/// Specifies the location of an occurrence of sensitive data in an Apache Avro
/// object container, Apache Parquet file, JSON file, or JSON Lines file.
class Record {
  /// The path, as a JSONPath expression, to the sensitive data. For an Avro
  /// object container or Parquet file, this is the path to the field in the
  /// record (recordIndex) that contains the data. For a JSON or JSON Lines file,
  /// this is the path to the field or array that contains the data. If the data
  /// is a value in an array, the path also indicates which value contains the
  /// data.
  ///
  /// If Amazon Macie detects sensitive data in the name of any element in the
  /// path, Macie omits this field. If the name of an element exceeds 20
  /// characters, Macie truncates the name by removing characters from the
  /// beginning of the name. If the resulting full path exceeds 250 characters,
  /// Macie also truncates the path, starting with the first element in the path,
  /// until the path contains 250 or fewer characters.
  final String? jsonPath;

  /// For an Avro object container or Parquet file, the record index, starting
  /// from 0, for the record that contains the sensitive data. For a JSON Lines
  /// file, the line index, starting from 0, for the line that contains the
  /// sensitive data. This value is always 0 for JSON files.
  final int? recordIndex;

  Record({
    this.jsonPath,
    this.recordIndex,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      jsonPath: json['jsonPath'] as String?,
      recordIndex: json['recordIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonPath = this.jsonPath;
    final recordIndex = this.recordIndex;
    return {
      if (jsonPath != null) 'jsonPath': jsonPath,
      if (recordIndex != null) 'recordIndex': recordIndex,
    };
  }
}

/// The current status of the relationship between an account and an associated
/// Amazon Macie administrator account (<i>inviter account</i>). Possible values
/// are:
enum RelationshipStatus {
  enabled,
  paused,
  invited,
  created,
  removed,
  resigned,
  emailVerificationInProgress,
  emailVerificationFailed,
  regionDisabled,
  accountSuspended,
}

extension on RelationshipStatus {
  String toValue() {
    switch (this) {
      case RelationshipStatus.enabled:
        return 'Enabled';
      case RelationshipStatus.paused:
        return 'Paused';
      case RelationshipStatus.invited:
        return 'Invited';
      case RelationshipStatus.created:
        return 'Created';
      case RelationshipStatus.removed:
        return 'Removed';
      case RelationshipStatus.resigned:
        return 'Resigned';
      case RelationshipStatus.emailVerificationInProgress:
        return 'EmailVerificationInProgress';
      case RelationshipStatus.emailVerificationFailed:
        return 'EmailVerificationFailed';
      case RelationshipStatus.regionDisabled:
        return 'RegionDisabled';
      case RelationshipStatus.accountSuspended:
        return 'AccountSuspended';
    }
  }
}

extension on String {
  RelationshipStatus toRelationshipStatus() {
    switch (this) {
      case 'Enabled':
        return RelationshipStatus.enabled;
      case 'Paused':
        return RelationshipStatus.paused;
      case 'Invited':
        return RelationshipStatus.invited;
      case 'Created':
        return RelationshipStatus.created;
      case 'Removed':
        return RelationshipStatus.removed;
      case 'Resigned':
        return RelationshipStatus.resigned;
      case 'EmailVerificationInProgress':
        return RelationshipStatus.emailVerificationInProgress;
      case 'EmailVerificationFailed':
        return RelationshipStatus.emailVerificationFailed;
      case 'RegionDisabled':
        return RelationshipStatus.regionDisabled;
      case 'AccountSuspended':
        return RelationshipStatus.accountSuspended;
    }
    throw Exception('$this is not known in enum RelationshipStatus');
  }
}

/// Provides information about settings that define whether one or more objects
/// in an S3 bucket are replicated to S3 buckets for other Amazon Web Services
/// accounts and, if so, which accounts.
class ReplicationDetails {
  /// Specifies whether the bucket is configured to replicate one or more objects
  /// to any destination.
  final bool? replicated;

  /// Specifies whether the bucket is configured to replicate one or more objects
  /// to an Amazon Web Services account that isn't part of the same Amazon Macie
  /// organization.
  final bool? replicatedExternally;

  /// An array of Amazon Web Services account IDs, one for each Amazon Web
  /// Services account that the bucket is configured to replicate one or more
  /// objects to.
  final List<String>? replicationAccounts;

  ReplicationDetails({
    this.replicated,
    this.replicatedExternally,
    this.replicationAccounts,
  });

  factory ReplicationDetails.fromJson(Map<String, dynamic> json) {
    return ReplicationDetails(
      replicated: json['replicated'] as bool?,
      replicatedExternally: json['replicatedExternally'] as bool?,
      replicationAccounts: (json['replicationAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final replicated = this.replicated;
    final replicatedExternally = this.replicatedExternally;
    final replicationAccounts = this.replicationAccounts;
    return {
      if (replicated != null) 'replicated': replicated,
      if (replicatedExternally != null)
        'replicatedExternally': replicatedExternally,
      if (replicationAccounts != null)
        'replicationAccounts': replicationAccounts,
    };
  }
}

/// Provides information about the resources that a finding applies to.
class ResourcesAffected {
  /// The details of the S3 bucket that the finding applies to.
  final S3Bucket? s3Bucket;

  /// The details of the S3 object that the finding applies to.
  final S3Object? s3Object;

  ResourcesAffected({
    this.s3Bucket,
    this.s3Object,
  });

  factory ResourcesAffected.fromJson(Map<String, dynamic> json) {
    return ResourcesAffected(
      s3Bucket: json['s3Bucket'] != null
          ? S3Bucket.fromJson(json['s3Bucket'] as Map<String, dynamic>)
          : null,
      s3Object: json['s3Object'] != null
          ? S3Object.fromJson(json['s3Object'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Object = this.s3Object;
    return {
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Object != null) 's3Object': s3Object,
    };
  }
}

/// Provides information about the S3 bucket that a finding applies to.
class S3Bucket {
  /// Specifies whether the bucket policy for the bucket requires server-side
  /// encryption of objects when objects are uploaded to the bucket. Possible
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// FALSE - The bucket policy requires server-side encryption of new objects.
  /// PutObject requests must include the x-amz-server-side-encryption header and
  /// the value for that header must be AES256 or aws:kms.
  /// </li>
  /// <li>
  /// TRUE - The bucket doesn't have a bucket policy or it has a bucket policy
  /// that doesn't require server-side encryption of new objects. If a bucket
  /// policy exists, it doesn't require PutObject requests to include the
  /// x-amz-server-side-encryption header and it doesn't require the value for
  /// that header to be AES256 or aws:kms.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie can't determine whether the bucket policy requires
  /// server-side encryption of objects.
  /// </li>
  /// </ul>
  final AllowsUnencryptedObjectUploads? allowsUnencryptedObjectUploads;

  /// The Amazon Resource Name (ARN) of the bucket.
  final String? arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the bucket was
  /// created.
  final DateTime? createdAt;

  /// The type of server-side encryption that's used by default to encrypt objects
  /// in the bucket.
  final ServerSideEncryption? defaultServerSideEncryption;

  /// The name of the bucket.
  final String? name;

  /// The display name and Amazon Web Services account ID for the user who owns
  /// the bucket.
  final S3BucketOwner? owner;

  /// The permissions settings that determine whether the bucket is publicly
  /// accessible.
  final BucketPublicAccess? publicAccess;

  /// The tags that are associated with the bucket.
  final List<KeyValuePair>? tags;

  S3Bucket({
    this.allowsUnencryptedObjectUploads,
    this.arn,
    this.createdAt,
    this.defaultServerSideEncryption,
    this.name,
    this.owner,
    this.publicAccess,
    this.tags,
  });

  factory S3Bucket.fromJson(Map<String, dynamic> json) {
    return S3Bucket(
      allowsUnencryptedObjectUploads:
          (json['allowsUnencryptedObjectUploads'] as String?)
              ?.toAllowsUnencryptedObjectUploads(),
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      defaultServerSideEncryption: json['defaultServerSideEncryption'] != null
          ? ServerSideEncryption.fromJson(
              json['defaultServerSideEncryption'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      owner: json['owner'] != null
          ? S3BucketOwner.fromJson(json['owner'] as Map<String, dynamic>)
          : null,
      publicAccess: json['publicAccess'] != null
          ? BucketPublicAccess.fromJson(
              json['publicAccess'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowsUnencryptedObjectUploads = this.allowsUnencryptedObjectUploads;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final defaultServerSideEncryption = this.defaultServerSideEncryption;
    final name = this.name;
    final owner = this.owner;
    final publicAccess = this.publicAccess;
    final tags = this.tags;
    return {
      if (allowsUnencryptedObjectUploads != null)
        'allowsUnencryptedObjectUploads':
            allowsUnencryptedObjectUploads.toValue(),
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (defaultServerSideEncryption != null)
        'defaultServerSideEncryption': defaultServerSideEncryption,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (publicAccess != null) 'publicAccess': publicAccess,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies property- and tag-based conditions that define criteria for
/// including or excluding S3 buckets from a classification job. Exclude
/// conditions take precedence over include conditions.
class S3BucketCriteriaForJob {
  /// The property- and tag-based conditions that determine which buckets to
  /// exclude from the job.
  final CriteriaBlockForJob? excludes;

  /// The property- and tag-based conditions that determine which buckets to
  /// include in the job.
  final CriteriaBlockForJob? includes;

  S3BucketCriteriaForJob({
    this.excludes,
    this.includes,
  });

  factory S3BucketCriteriaForJob.fromJson(Map<String, dynamic> json) {
    return S3BucketCriteriaForJob(
      excludes: json['excludes'] != null
          ? CriteriaBlockForJob.fromJson(
              json['excludes'] as Map<String, dynamic>)
          : null,
      includes: json['includes'] != null
          ? CriteriaBlockForJob.fromJson(
              json['includes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    final includes = this.includes;
    return {
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
  }
}

/// Specifies an Amazon Web Services account that owns S3 buckets for a
/// classification job to analyze, and one or more specific buckets to analyze
/// for that account.
class S3BucketDefinitionForJob {
  /// The unique identifier for the Amazon Web Services account that owns the
  /// buckets.
  final String accountId;

  /// An array that lists the names of the buckets.
  final List<String> buckets;

  S3BucketDefinitionForJob({
    required this.accountId,
    required this.buckets,
  });

  factory S3BucketDefinitionForJob.fromJson(Map<String, dynamic> json) {
    return S3BucketDefinitionForJob(
      accountId: json['accountId'] as String,
      buckets: (json['buckets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final buckets = this.buckets;
    return {
      'accountId': accountId,
      'buckets': buckets,
    };
  }
}

/// Provides information about the user who owns an S3 bucket.
class S3BucketOwner {
  /// The display name of the user who owns the bucket.
  final String? displayName;

  /// The Amazon Web Services account ID for the user who owns the bucket.
  final String? id;

  S3BucketOwner({
    this.displayName,
    this.id,
  });

  factory S3BucketOwner.fromJson(Map<String, dynamic> json) {
    return S3BucketOwner(
      displayName: json['displayName'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final id = this.id;
    return {
      if (displayName != null) 'displayName': displayName,
      if (id != null) 'id': id,
    };
  }
}

/// Specifies an S3 bucket to store data classification results in, and the
/// encryption settings to use when storing results in that bucket.
class S3Destination {
  /// The name of the bucket.
  final String bucketName;

  /// The Amazon Resource Name (ARN) of the Key Management Service (KMS) customer
  /// master key (CMK) to use for encryption of the results. This must be the ARN
  /// of an existing CMK that's in the same Amazon Web Services Region as the
  /// bucket.
  final String kmsKeyArn;

  /// The path prefix to use in the path to the location in the bucket. This
  /// prefix specifies where to store classification results in the bucket.
  final String? keyPrefix;

  S3Destination({
    required this.bucketName,
    required this.kmsKeyArn,
    this.keyPrefix,
  });

  factory S3Destination.fromJson(Map<String, dynamic> json) {
    return S3Destination(
      bucketName: json['bucketName'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String,
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final kmsKeyArn = this.kmsKeyArn;
    final keyPrefix = this.keyPrefix;
    return {
      'bucketName': bucketName,
      'kmsKeyArn': kmsKeyArn,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Specifies which S3 buckets contain the objects that a classification job
/// analyzes, and the scope of that analysis. The bucket specification can be
/// static (bucketDefinitions) or dynamic (bucketCriteria). If it's static, the
/// job analyzes objects in the same predefined set of buckets each time the job
/// runs. If it's dynamic, the job analyzes objects in any buckets that match
/// the specified criteria each time the job starts to run.
class S3JobDefinition {
  /// The property- and tag-based conditions that determine which S3 buckets to
  /// include or exclude from the analysis. Each time the job runs, the job uses
  /// these criteria to determine which buckets contain objects to analyze. A
  /// job's definition can contain a bucketCriteria object or a bucketDefinitions
  /// array, not both.
  final S3BucketCriteriaForJob? bucketCriteria;

  /// An array of objects, one for each Amazon Web Services account that owns
  /// specific S3 buckets to analyze. Each object specifies the account ID for an
  /// account and one or more buckets to analyze for that account. A job's
  /// definition can contain a bucketDefinitions array or a bucketCriteria object,
  /// not both.
  final List<S3BucketDefinitionForJob>? bucketDefinitions;

  /// The property- and tag-based conditions that determine which S3 objects to
  /// include or exclude from the analysis. Each time the job runs, the job uses
  /// these criteria to determine which objects to analyze.
  final Scoping? scoping;

  S3JobDefinition({
    this.bucketCriteria,
    this.bucketDefinitions,
    this.scoping,
  });

  factory S3JobDefinition.fromJson(Map<String, dynamic> json) {
    return S3JobDefinition(
      bucketCriteria: json['bucketCriteria'] != null
          ? S3BucketCriteriaForJob.fromJson(
              json['bucketCriteria'] as Map<String, dynamic>)
          : null,
      bucketDefinitions: (json['bucketDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              S3BucketDefinitionForJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      scoping: json['scoping'] != null
          ? Scoping.fromJson(json['scoping'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketCriteria = this.bucketCriteria;
    final bucketDefinitions = this.bucketDefinitions;
    final scoping = this.scoping;
    return {
      if (bucketCriteria != null) 'bucketCriteria': bucketCriteria,
      if (bucketDefinitions != null) 'bucketDefinitions': bucketDefinitions,
      if (scoping != null) 'scoping': scoping,
    };
  }
}

/// Provides information about the S3 object that a finding applies to.
class S3Object {
  /// The Amazon Resource Name (ARN) of the bucket that contains the object.
  final String? bucketArn;

  /// The entity tag (ETag) that identifies the affected version of the object. If
  /// the object was overwritten or changed after Amazon Macie produced the
  /// finding, this value might be different from the current ETag for the object.
  final String? eTag;

  /// The file name extension of the object. If the object doesn't have a file
  /// name extension, this value is "".
  final String? extension;

  /// The full key (name) that's assigned to the object.
  final String? key;

  /// The date and time, in UTC and extended ISO 8601 format, when the object was
  /// last modified.
  final DateTime? lastModified;

  /// The path to the object, including the full key (name).
  final String? path;

  /// Specifies whether the object is publicly accessible due to the combination
  /// of permissions settings that apply to the object.
  final bool? publicAccess;

  /// The type of server-side encryption that's used to encrypt the object.
  final ServerSideEncryption? serverSideEncryption;

  /// The total storage size, in bytes, of the object.
  final int? size;

  /// The storage class of the object.
  final StorageClass? storageClass;

  /// The tags that are associated with the object.
  final List<KeyValuePair>? tags;

  /// The identifier for the affected version of the object.
  final String? versionId;

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

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      bucketArn: json['bucketArn'] as String?,
      eTag: json['eTag'] as String?,
      extension: json['extension'] as String?,
      key: json['key'] as String?,
      lastModified: timeStampFromJson(json['lastModified']),
      path: json['path'] as String?,
      publicAccess: json['publicAccess'] as bool?,
      serverSideEncryption: json['serverSideEncryption'] != null
          ? ServerSideEncryption.fromJson(
              json['serverSideEncryption'] as Map<String, dynamic>)
          : null,
      size: json['size'] as int?,
      storageClass: (json['storageClass'] as String?)?.toStorageClass(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionId: json['versionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final eTag = this.eTag;
    final extension = this.extension;
    final key = this.key;
    final lastModified = this.lastModified;
    final path = this.path;
    final publicAccess = this.publicAccess;
    final serverSideEncryption = this.serverSideEncryption;
    final size = this.size;
    final storageClass = this.storageClass;
    final tags = this.tags;
    final versionId = this.versionId;
    return {
      if (bucketArn != null) 'bucketArn': bucketArn,
      if (eTag != null) 'eTag': eTag,
      if (extension != null) 'extension': extension,
      if (key != null) 'key': key,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (path != null) 'path': path,
      if (publicAccess != null) 'publicAccess': publicAccess,
      if (serverSideEncryption != null)
        'serverSideEncryption': serverSideEncryption,
      if (size != null) 'size': size,
      if (storageClass != null) 'storageClass': storageClass.toValue(),
      if (tags != null) 'tags': tags,
      if (versionId != null) 'versionId': versionId,
    };
  }
}

/// The property to use in a condition that determines whether an S3 object is
/// included or excluded from a classification job. Valid values are:
enum ScopeFilterKey {
  objectExtension,
  objectLastModifiedDate,
  objectSize,
  objectKey,
}

extension on ScopeFilterKey {
  String toValue() {
    switch (this) {
      case ScopeFilterKey.objectExtension:
        return 'OBJECT_EXTENSION';
      case ScopeFilterKey.objectLastModifiedDate:
        return 'OBJECT_LAST_MODIFIED_DATE';
      case ScopeFilterKey.objectSize:
        return 'OBJECT_SIZE';
      case ScopeFilterKey.objectKey:
        return 'OBJECT_KEY';
    }
  }
}

extension on String {
  ScopeFilterKey toScopeFilterKey() {
    switch (this) {
      case 'OBJECT_EXTENSION':
        return ScopeFilterKey.objectExtension;
      case 'OBJECT_LAST_MODIFIED_DATE':
        return ScopeFilterKey.objectLastModifiedDate;
      case 'OBJECT_SIZE':
        return ScopeFilterKey.objectSize;
      case 'OBJECT_KEY':
        return ScopeFilterKey.objectKey;
    }
    throw Exception('$this is not known in enum ScopeFilterKey');
  }
}

/// Specifies one or more property- and tag-based conditions that define
/// criteria for including or excluding S3 objects from a classification job.
/// Exclude conditions take precedence over include conditions.
class Scoping {
  /// The property- and tag-based conditions that determine which objects to
  /// exclude from the analysis.
  final JobScopingBlock? excludes;

  /// The property- and tag-based conditions that determine which objects to
  /// include in the analysis.
  final JobScopingBlock? includes;

  Scoping({
    this.excludes,
    this.includes,
  });

  factory Scoping.fromJson(Map<String, dynamic> json) {
    return Scoping(
      excludes: json['excludes'] != null
          ? JobScopingBlock.fromJson(json['excludes'] as Map<String, dynamic>)
          : null,
      includes: json['includes'] != null
          ? JobScopingBlock.fromJson(json['includes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    final includes = this.includes;
    return {
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
  }
}

/// Specifies property- and tag-based conditions that define filter criteria for
/// including or excluding S3 buckets from the query results. Exclude conditions
/// take precedence over include conditions.
class SearchResourcesBucketCriteria {
  /// The property- and tag-based conditions that determine which buckets to
  /// exclude from the results.
  final SearchResourcesCriteriaBlock? excludes;

  /// The property- and tag-based conditions that determine which buckets to
  /// include in the results.
  final SearchResourcesCriteriaBlock? includes;

  SearchResourcesBucketCriteria({
    this.excludes,
    this.includes,
  });

  factory SearchResourcesBucketCriteria.fromJson(Map<String, dynamic> json) {
    return SearchResourcesBucketCriteria(
      excludes: json['excludes'] != null
          ? SearchResourcesCriteriaBlock.fromJson(
              json['excludes'] as Map<String, dynamic>)
          : null,
      includes: json['includes'] != null
          ? SearchResourcesCriteriaBlock.fromJson(
              json['includes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    final includes = this.includes;
    return {
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
  }
}

/// The operator to use in a condition that filters the results of a query.
/// Valid values are:
enum SearchResourcesComparator {
  eq,
  ne,
}

extension on SearchResourcesComparator {
  String toValue() {
    switch (this) {
      case SearchResourcesComparator.eq:
        return 'EQ';
      case SearchResourcesComparator.ne:
        return 'NE';
    }
  }
}

extension on String {
  SearchResourcesComparator toSearchResourcesComparator() {
    switch (this) {
      case 'EQ':
        return SearchResourcesComparator.eq;
      case 'NE':
        return SearchResourcesComparator.ne;
    }
    throw Exception('$this is not known in enum SearchResourcesComparator');
  }
}

/// Specifies a property- or tag-based filter condition for including or
/// excluding Amazon Web Services resources from the query results.
class SearchResourcesCriteria {
  /// A property-based condition that defines a property, operator, and one or
  /// more values for including or excluding resources from the results.
  final SearchResourcesSimpleCriterion? simpleCriterion;

  /// A tag-based condition that defines an operator and tag keys, tag values, or
  /// tag key and value pairs for including or excluding resources from the
  /// results.
  final SearchResourcesTagCriterion? tagCriterion;

  SearchResourcesCriteria({
    this.simpleCriterion,
    this.tagCriterion,
  });

  factory SearchResourcesCriteria.fromJson(Map<String, dynamic> json) {
    return SearchResourcesCriteria(
      simpleCriterion: json['simpleCriterion'] != null
          ? SearchResourcesSimpleCriterion.fromJson(
              json['simpleCriterion'] as Map<String, dynamic>)
          : null,
      tagCriterion: json['tagCriterion'] != null
          ? SearchResourcesTagCriterion.fromJson(
              json['tagCriterion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final simpleCriterion = this.simpleCriterion;
    final tagCriterion = this.tagCriterion;
    return {
      if (simpleCriterion != null) 'simpleCriterion': simpleCriterion,
      if (tagCriterion != null) 'tagCriterion': tagCriterion,
    };
  }
}

/// Specifies property- and tag-based conditions that define filter criteria for
/// including or excluding Amazon Web Services resources from the query results.
class SearchResourcesCriteriaBlock {
  /// An array of objects, one for each property- or tag-based condition that
  /// includes or excludes resources from the query results. If you specify more
  /// than one condition, Amazon Macie uses AND logic to join the conditions.
  final List<SearchResourcesCriteria>? and;

  SearchResourcesCriteriaBlock({
    this.and,
  });

  factory SearchResourcesCriteriaBlock.fromJson(Map<String, dynamic> json) {
    return SearchResourcesCriteriaBlock(
      and: (json['and'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SearchResourcesCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final and = this.and;
    return {
      if (and != null) 'and': and,
    };
  }
}

class SearchResourcesResponse {
  /// An array of objects, one for each resource that meets the filter criteria
  /// specified in the request.
  final List<MatchingResource>? matchingResources;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  SearchResourcesResponse({
    this.matchingResources,
    this.nextToken,
  });

  factory SearchResourcesResponse.fromJson(Map<String, dynamic> json) {
    return SearchResourcesResponse(
      matchingResources: (json['matchingResources'] as List?)
          ?.whereNotNull()
          .map((e) => MatchingResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final matchingResources = this.matchingResources;
    final nextToken = this.nextToken;
    return {
      if (matchingResources != null) 'matchingResources': matchingResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Specifies a property-based filter condition that determines which Amazon Web
/// Services resources are included or excluded from the query results.
class SearchResourcesSimpleCriterion {
  /// The operator to use in the condition. Valid values are EQ (equals) and NE
  /// (not equals).
  final SearchResourcesComparator? comparator;

  /// The property to use in the condition.
  final SearchResourcesSimpleCriterionKey? key;

  /// An array that lists one or more values to use in the condition. If you
  /// specify multiple values, Amazon Macie uses OR logic to join the values.
  /// Valid values for each supported property (key) are:
  ///
  /// <ul>
  /// <li>
  /// ACCOUNT_ID - A string that represents the unique identifier for the Amazon
  /// Web Services account that owns the resource.
  /// </li>
  /// <li>
  /// S3_BUCKET_EFFECTIVE_PERMISSION - A string that represents an enumerated
  /// value that Macie defines for the <a
  /// href="https://docs.aws.amazon.com/macie/latest/APIReference/datasources-s3.html#datasources-s3-prop-bucketpublicaccess-effectivepermission">BucketPublicAccess.effectivePermission</a>
  /// property of an S3 bucket.
  /// </li>
  /// <li>
  /// S3_BUCKET_NAME - A string that represents the name of an S3 bucket.
  /// </li>
  /// <li>
  /// S3_BUCKET_SHARED_ACCESS - A string that represents an enumerated value that
  /// Macie defines for the <a
  /// href="https://docs.aws.amazon.com/macie/latest/APIReference/datasources-s3.html#datasources-s3-prop-bucketmetadata-sharedaccess">BucketMetadata.sharedAccess</a>
  /// property of an S3 bucket.
  /// </li>
  /// </ul>
  /// Values are case sensitive. Also, Macie doesn't support use of partial values
  /// or wildcard characters in values.
  final List<String>? values;

  SearchResourcesSimpleCriterion({
    this.comparator,
    this.key,
    this.values,
  });

  factory SearchResourcesSimpleCriterion.fromJson(Map<String, dynamic> json) {
    return SearchResourcesSimpleCriterion(
      comparator:
          (json['comparator'] as String?)?.toSearchResourcesComparator(),
      key: (json['key'] as String?)?.toSearchResourcesSimpleCriterionKey(),
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final key = this.key;
    final values = this.values;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (key != null) 'key': key.toValue(),
      if (values != null) 'values': values,
    };
  }
}

/// The property to use in a condition that filters the query results. Valid
/// values are:
enum SearchResourcesSimpleCriterionKey {
  accountId,
  s3BucketName,
  s3BucketEffectivePermission,
  s3BucketSharedAccess,
}

extension on SearchResourcesSimpleCriterionKey {
  String toValue() {
    switch (this) {
      case SearchResourcesSimpleCriterionKey.accountId:
        return 'ACCOUNT_ID';
      case SearchResourcesSimpleCriterionKey.s3BucketName:
        return 'S3_BUCKET_NAME';
      case SearchResourcesSimpleCriterionKey.s3BucketEffectivePermission:
        return 'S3_BUCKET_EFFECTIVE_PERMISSION';
      case SearchResourcesSimpleCriterionKey.s3BucketSharedAccess:
        return 'S3_BUCKET_SHARED_ACCESS';
    }
  }
}

extension on String {
  SearchResourcesSimpleCriterionKey toSearchResourcesSimpleCriterionKey() {
    switch (this) {
      case 'ACCOUNT_ID':
        return SearchResourcesSimpleCriterionKey.accountId;
      case 'S3_BUCKET_NAME':
        return SearchResourcesSimpleCriterionKey.s3BucketName;
      case 'S3_BUCKET_EFFECTIVE_PERMISSION':
        return SearchResourcesSimpleCriterionKey.s3BucketEffectivePermission;
      case 'S3_BUCKET_SHARED_ACCESS':
        return SearchResourcesSimpleCriterionKey.s3BucketSharedAccess;
    }
    throw Exception(
        '$this is not known in enum SearchResourcesSimpleCriterionKey');
  }
}

/// The property to sort the query results by. Valid values are:
enum SearchResourcesSortAttributeName {
  accountId,
  resourceName,
  s3ClassifiableObjectCount,
  s3ClassifiableSizeInBytes,
}

extension on SearchResourcesSortAttributeName {
  String toValue() {
    switch (this) {
      case SearchResourcesSortAttributeName.accountId:
        return 'ACCOUNT_ID';
      case SearchResourcesSortAttributeName.resourceName:
        return 'RESOURCE_NAME';
      case SearchResourcesSortAttributeName.s3ClassifiableObjectCount:
        return 'S3_CLASSIFIABLE_OBJECT_COUNT';
      case SearchResourcesSortAttributeName.s3ClassifiableSizeInBytes:
        return 'S3_CLASSIFIABLE_SIZE_IN_BYTES';
    }
  }
}

extension on String {
  SearchResourcesSortAttributeName toSearchResourcesSortAttributeName() {
    switch (this) {
      case 'ACCOUNT_ID':
        return SearchResourcesSortAttributeName.accountId;
      case 'RESOURCE_NAME':
        return SearchResourcesSortAttributeName.resourceName;
      case 'S3_CLASSIFIABLE_OBJECT_COUNT':
        return SearchResourcesSortAttributeName.s3ClassifiableObjectCount;
      case 'S3_CLASSIFIABLE_SIZE_IN_BYTES':
        return SearchResourcesSortAttributeName.s3ClassifiableSizeInBytes;
    }
    throw Exception(
        '$this is not known in enum SearchResourcesSortAttributeName');
  }
}

/// Specifies criteria for sorting the results of a query for information about
/// Amazon Web Services resources that Amazon Macie monitors and analyzes.
class SearchResourcesSortCriteria {
  /// The property to sort the results by.
  final SearchResourcesSortAttributeName? attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  SearchResourcesSortCriteria({
    this.attributeName,
    this.orderBy,
  });

  factory SearchResourcesSortCriteria.fromJson(Map<String, dynamic> json) {
    return SearchResourcesSortCriteria(
      attributeName: (json['attributeName'] as String?)
          ?.toSearchResourcesSortAttributeName(),
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName.toValue(),
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// Specifies a tag-based filter condition that determines which Amazon Web
/// Services resources are included or excluded from the query results.
class SearchResourcesTagCriterion {
  /// The operator to use in the condition. Valid values are EQ (equals) and NE
  /// (not equals).
  final SearchResourcesComparator? comparator;

  /// The tag keys, tag values, or tag key and value pairs to use in the
  /// condition.
  final List<SearchResourcesTagCriterionPair>? tagValues;

  SearchResourcesTagCriterion({
    this.comparator,
    this.tagValues,
  });

  factory SearchResourcesTagCriterion.fromJson(Map<String, dynamic> json) {
    return SearchResourcesTagCriterion(
      comparator:
          (json['comparator'] as String?)?.toSearchResourcesComparator(),
      tagValues: (json['tagValues'] as List?)
          ?.whereNotNull()
          .map((e) => SearchResourcesTagCriterionPair.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final tagValues = this.tagValues;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (tagValues != null) 'tagValues': tagValues,
    };
  }
}

/// Specifies a tag key, a tag value, or a tag key and value (as a pair) to use
/// in a tag-based filter condition for a query. Tag keys and values are case
/// sensitive. Also, Amazon Macie doesn't support use of partial values or
/// wildcard characters in tag-based filter conditions.
class SearchResourcesTagCriterionPair {
  /// The value for the tag key to use in the condition.
  final String? key;

  /// The tag value to use in the condition.
  final String? value;

  SearchResourcesTagCriterionPair({
    this.key,
    this.value,
  });

  factory SearchResourcesTagCriterionPair.fromJson(Map<String, dynamic> json) {
    return SearchResourcesTagCriterionPair(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// Specifies configuration settings that determine which findings are published
/// to Security Hub automatically. For information about how Macie publishes
/// findings to Security Hub, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/securityhub-integration.html">Amazon
/// Macie integration with Security Hub</a> in the <i>Amazon Macie User
/// Guide</i>.
class SecurityHubConfiguration {
  /// Specifies whether to publish sensitive data findings to Security Hub. If you
  /// set this value to true, Amazon Macie automatically publishes all sensitive
  /// data findings that weren't suppressed by a findings filter. The default
  /// value is false.
  final bool publishClassificationFindings;

  /// Specifies whether to publish policy findings to Security Hub. If you set
  /// this value to true, Amazon Macie automatically publishes all new and updated
  /// policy findings that weren't suppressed by a findings filter. The default
  /// value is true.
  final bool publishPolicyFindings;

  SecurityHubConfiguration({
    required this.publishClassificationFindings,
    required this.publishPolicyFindings,
  });

  factory SecurityHubConfiguration.fromJson(Map<String, dynamic> json) {
    return SecurityHubConfiguration(
      publishClassificationFindings:
          json['publishClassificationFindings'] as bool,
      publishPolicyFindings: json['publishPolicyFindings'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final publishClassificationFindings = this.publishClassificationFindings;
    final publishPolicyFindings = this.publishPolicyFindings;
    return {
      'publishClassificationFindings': publishClassificationFindings,
      'publishPolicyFindings': publishPolicyFindings,
    };
  }
}

/// Provides information about the category, types, and occurrences of sensitive
/// data that produced a sensitive data finding.
class SensitiveDataItem {
  /// The category of sensitive data that was detected. For example: CREDENTIALS,
  /// for credentials data such as private keys or Amazon Web Services secret
  /// keys; FINANCIAL_INFORMATION, for financial data such as credit card numbers;
  /// or, PERSONAL_INFORMATION, for personal health information, such as health
  /// insurance identification numbers, or personally identifiable information,
  /// such as driver's license identification numbers.
  final SensitiveDataItemCategory? category;

  /// An array of objects, one for each type of sensitive data that was detected.
  /// Each object reports the number of occurrences of a specific type of
  /// sensitive data that was detected, and the location of up to 15 of those
  /// occurrences.
  final List<DefaultDetection>? detections;

  /// The total number of occurrences of the sensitive data that was detected.
  final int? totalCount;

  SensitiveDataItem({
    this.category,
    this.detections,
    this.totalCount,
  });

  factory SensitiveDataItem.fromJson(Map<String, dynamic> json) {
    return SensitiveDataItem(
      category: (json['category'] as String?)?.toSensitiveDataItemCategory(),
      detections: (json['detections'] as List?)
          ?.whereNotNull()
          .map((e) => DefaultDetection.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final detections = this.detections;
    final totalCount = this.totalCount;
    return {
      if (category != null) 'category': category.toValue(),
      if (detections != null) 'detections': detections,
      if (totalCount != null) 'totalCount': totalCount,
    };
  }
}

/// The category of sensitive data that was detected and produced the finding.
/// Possible values are:
enum SensitiveDataItemCategory {
  financialInformation,
  personalInformation,
  credentials,
  customIdentifier,
}

extension on SensitiveDataItemCategory {
  String toValue() {
    switch (this) {
      case SensitiveDataItemCategory.financialInformation:
        return 'FINANCIAL_INFORMATION';
      case SensitiveDataItemCategory.personalInformation:
        return 'PERSONAL_INFORMATION';
      case SensitiveDataItemCategory.credentials:
        return 'CREDENTIALS';
      case SensitiveDataItemCategory.customIdentifier:
        return 'CUSTOM_IDENTIFIER';
    }
  }
}

extension on String {
  SensitiveDataItemCategory toSensitiveDataItemCategory() {
    switch (this) {
      case 'FINANCIAL_INFORMATION':
        return SensitiveDataItemCategory.financialInformation;
      case 'PERSONAL_INFORMATION':
        return SensitiveDataItemCategory.personalInformation;
      case 'CREDENTIALS':
        return SensitiveDataItemCategory.credentials;
      case 'CUSTOM_IDENTIFIER':
        return SensitiveDataItemCategory.customIdentifier;
    }
    throw Exception('$this is not known in enum SensitiveDataItemCategory');
  }
}

/// Provides information about the server-side encryption settings for an S3
/// bucket or S3 object.
class ServerSideEncryption {
  /// The server-side encryption algorithm that's used when storing data in the
  /// bucket or object. If default encryption is disabled for the bucket or the
  /// object isn't encrypted using server-side encryption, this value is NONE.
  final EncryptionType? encryptionType;

  /// The Amazon Resource Name (ARN) or unique identifier (key ID) for the Key
  /// Management Service (KMS) customer master key (CMK) that's used to encrypt
  /// data in the bucket or the object. If an KMS CMK isn't used, this value is
  /// null.
  final String? kmsMasterKeyId;

  ServerSideEncryption({
    this.encryptionType,
    this.kmsMasterKeyId,
  });

  factory ServerSideEncryption.fromJson(Map<String, dynamic> json) {
    return ServerSideEncryption(
      encryptionType: (json['encryptionType'] as String?)?.toEncryptionType(),
      kmsMasterKeyId: json['kmsMasterKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final kmsMasterKeyId = this.kmsMasterKeyId;
    return {
      if (encryptionType != null) 'encryptionType': encryptionType.toValue(),
      if (kmsMasterKeyId != null) 'kmsMasterKeyId': kmsMasterKeyId,
    };
  }
}

/// Specifies a current quota for an Amazon Macie account.
class ServiceLimit {
  /// Specifies whether the account has met the quota that corresponds to the
  /// metric specified by the UsageByAccount.type field in the response.
  final bool? isServiceLimited;

  /// The unit of measurement for the value specified by the value field.
  final Unit? unit;

  /// The value for the metric specified by the UsageByAccount.type field in the
  /// response.
  final int? value;

  ServiceLimit({
    this.isServiceLimited,
    this.unit,
    this.value,
  });

  factory ServiceLimit.fromJson(Map<String, dynamic> json) {
    return ServiceLimit(
      isServiceLimited: json['isServiceLimited'] as bool?,
      unit: (json['unit'] as String?)?.toUnit(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final isServiceLimited = this.isServiceLimited;
    final unit = this.unit;
    final value = this.value;
    return {
      if (isServiceLimited != null) 'isServiceLimited': isServiceLimited,
      if (unit != null) 'unit': unit.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// Provides information about a session that was created for an entity that
/// performed an action by using temporary security credentials.
class SessionContext {
  /// The date and time when the credentials were issued, and whether the
  /// credentials were authenticated with a multi-factor authentication (MFA)
  /// device.
  final SessionContextAttributes? attributes;

  /// The source and type of credentials that were issued to the entity.
  final SessionIssuer? sessionIssuer;

  SessionContext({
    this.attributes,
    this.sessionIssuer,
  });

  factory SessionContext.fromJson(Map<String, dynamic> json) {
    return SessionContext(
      attributes: json['attributes'] != null
          ? SessionContextAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>)
          : null,
      sessionIssuer: json['sessionIssuer'] != null
          ? SessionIssuer.fromJson(
              json['sessionIssuer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final sessionIssuer = this.sessionIssuer;
    return {
      if (attributes != null) 'attributes': attributes,
      if (sessionIssuer != null) 'sessionIssuer': sessionIssuer,
    };
  }
}

/// Provides information about the context in which temporary security
/// credentials were issued to an entity.
class SessionContextAttributes {
  /// The date and time, in UTC and ISO 8601 format, when the credentials were
  /// issued.
  final DateTime? creationDate;

  /// Specifies whether the credentials were authenticated with a multi-factor
  /// authentication (MFA) device.
  final bool? mfaAuthenticated;

  SessionContextAttributes({
    this.creationDate,
    this.mfaAuthenticated,
  });

  factory SessionContextAttributes.fromJson(Map<String, dynamic> json) {
    return SessionContextAttributes(
      creationDate: timeStampFromJson(json['creationDate']),
      mfaAuthenticated: json['mfaAuthenticated'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final mfaAuthenticated = this.mfaAuthenticated;
    return {
      if (creationDate != null) 'creationDate': iso8601ToJson(creationDate),
      if (mfaAuthenticated != null) 'mfaAuthenticated': mfaAuthenticated,
    };
  }
}

/// Provides information about the source and type of temporary security
/// credentials that were issued to an entity.
class SessionIssuer {
  /// The unique identifier for the Amazon Web Services account that owns the
  /// entity that was used to get the credentials.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the source account, IAM user, or role that
  /// was used to get the credentials.
  final String? arn;

  /// The unique identifier for the entity that was used to get the credentials.
  final String? principalId;

  /// The source of the temporary security credentials, such as Root, IAMUser, or
  /// Role.
  final String? type;

  /// The name or alias of the user or role that issued the session. This value is
  /// null if the credentials were obtained from a root account that doesn't have
  /// an alias.
  final String? userName;

  SessionIssuer({
    this.accountId,
    this.arn,
    this.principalId,
    this.type,
    this.userName,
  });

  factory SessionIssuer.fromJson(Map<String, dynamic> json) {
    return SessionIssuer(
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      principalId: json['principalId'] as String?,
      type: json['type'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final principalId = this.principalId;
    final type = this.type;
    final userName = this.userName;
    return {
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (principalId != null) 'principalId': principalId,
      if (type != null) 'type': type,
      if (userName != null) 'userName': userName,
    };
  }
}

/// Provides the numerical and qualitative representations of a finding's
/// severity.
class Severity {
  /// The qualitative representation of the finding's severity, ranging from Low
  /// (least severe) to High (most severe).
  final SeverityDescription? description;

  /// The numerical representation of the finding's severity, ranging from 1
  /// (least severe) to 3 (most severe).
  final int? score;

  Severity({
    this.description,
    this.score,
  });

  factory Severity.fromJson(Map<String, dynamic> json) {
    return Severity(
      description: (json['description'] as String?)?.toSeverityDescription(),
      score: json['score'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final score = this.score;
    return {
      if (description != null) 'description': description.toValue(),
      if (score != null) 'score': score,
    };
  }
}

/// The qualitative representation of the finding's severity. Possible values
/// are:
enum SeverityDescription {
  low,
  medium,
  high,
}

extension on SeverityDescription {
  String toValue() {
    switch (this) {
      case SeverityDescription.low:
        return 'Low';
      case SeverityDescription.medium:
        return 'Medium';
      case SeverityDescription.high:
        return 'High';
    }
  }
}

extension on String {
  SeverityDescription toSeverityDescription() {
    switch (this) {
      case 'Low':
        return SeverityDescription.low;
      case 'Medium':
        return SeverityDescription.medium;
      case 'High':
        return SeverityDescription.high;
    }
    throw Exception('$this is not known in enum SeverityDescription');
  }
}

enum SharedAccess {
  external,
  internal,
  notShared,
  unknown,
}

extension on SharedAccess {
  String toValue() {
    switch (this) {
      case SharedAccess.external:
        return 'EXTERNAL';
      case SharedAccess.internal:
        return 'INTERNAL';
      case SharedAccess.notShared:
        return 'NOT_SHARED';
      case SharedAccess.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  SharedAccess toSharedAccess() {
    switch (this) {
      case 'EXTERNAL':
        return SharedAccess.external;
      case 'INTERNAL':
        return SharedAccess.internal;
      case 'NOT_SHARED':
        return SharedAccess.notShared;
      case 'UNKNOWN':
        return SharedAccess.unknown;
    }
    throw Exception('$this is not known in enum SharedAccess');
  }
}

/// Specifies a property-based condition that determines whether an S3 bucket is
/// included or excluded from a classification job.
class SimpleCriterionForJob {
  /// The operator to use in the condition. Valid values are EQ (equals) and NE
  /// (not equals).
  final JobComparator? comparator;

  /// The property to use in the condition.
  final SimpleCriterionKeyForJob? key;

  /// An array that lists one or more values to use in the condition. If you
  /// specify multiple values, Amazon Macie uses OR logic to join the values.
  /// Valid values for each supported property (key) are:
  ///
  /// <ul>
  /// <li>
  /// ACCOUNT_ID - A string that represents the unique identifier for the Amazon
  /// Web Services account that owns the bucket.
  /// </li>
  /// <li>
  /// S3_BUCKET_EFFECTIVE_PERMISSION - A string that represents an enumerated
  /// value that Macie defines for the <a
  /// href="https://docs.aws.amazon.com/macie/latest/APIReference/datasources-s3.html#datasources-s3-prop-bucketpublicaccess-effectivepermission">BucketPublicAccess.effectivePermission</a>
  /// property of a bucket.
  /// </li>
  /// <li>
  /// S3_BUCKET_NAME - A string that represents the name of a bucket.
  /// </li>
  /// <li>
  /// S3_BUCKET_SHARED_ACCESS - A string that represents an enumerated value that
  /// Macie defines for the <a
  /// href="https://docs.aws.amazon.com/macie/latest/APIReference/datasources-s3.html#datasources-s3-prop-bucketmetadata-sharedaccess">BucketMetadata.sharedAccess</a>
  /// property of a bucket.
  /// </li>
  /// </ul>
  /// Values are case sensitive. Also, Macie doesn't support use of partial values
  /// or wildcard characters in these values.
  final List<String>? values;

  SimpleCriterionForJob({
    this.comparator,
    this.key,
    this.values,
  });

  factory SimpleCriterionForJob.fromJson(Map<String, dynamic> json) {
    return SimpleCriterionForJob(
      comparator: (json['comparator'] as String?)?.toJobComparator(),
      key: (json['key'] as String?)?.toSimpleCriterionKeyForJob(),
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final key = this.key;
    final values = this.values;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (key != null) 'key': key.toValue(),
      if (values != null) 'values': values,
    };
  }
}

/// The property to use in a condition that determines whether an S3 bucket is
/// included or excluded from a classification job. Valid values are:
enum SimpleCriterionKeyForJob {
  accountId,
  s3BucketName,
  s3BucketEffectivePermission,
  s3BucketSharedAccess,
}

extension on SimpleCriterionKeyForJob {
  String toValue() {
    switch (this) {
      case SimpleCriterionKeyForJob.accountId:
        return 'ACCOUNT_ID';
      case SimpleCriterionKeyForJob.s3BucketName:
        return 'S3_BUCKET_NAME';
      case SimpleCriterionKeyForJob.s3BucketEffectivePermission:
        return 'S3_BUCKET_EFFECTIVE_PERMISSION';
      case SimpleCriterionKeyForJob.s3BucketSharedAccess:
        return 'S3_BUCKET_SHARED_ACCESS';
    }
  }
}

extension on String {
  SimpleCriterionKeyForJob toSimpleCriterionKeyForJob() {
    switch (this) {
      case 'ACCOUNT_ID':
        return SimpleCriterionKeyForJob.accountId;
      case 'S3_BUCKET_NAME':
        return SimpleCriterionKeyForJob.s3BucketName;
      case 'S3_BUCKET_EFFECTIVE_PERMISSION':
        return SimpleCriterionKeyForJob.s3BucketEffectivePermission;
      case 'S3_BUCKET_SHARED_ACCESS':
        return SimpleCriterionKeyForJob.s3BucketSharedAccess;
    }
    throw Exception('$this is not known in enum SimpleCriterionKeyForJob');
  }
}

/// Specifies a property-based condition that determines whether an S3 object is
/// included or excluded from a classification job.
class SimpleScopeTerm {
  /// The operator to use in the condition. Valid values for each supported
  /// property (key) are:
  ///
  /// <ul>
  /// <li>
  /// OBJECT_EXTENSION - EQ (equals) or NE (not equals)
  /// </li>
  /// <li>
  /// OBJECT_KEY - STARTS_WITH
  /// </li>
  /// <li>
  /// OBJECT_LAST_MODIFIED_DATE - Any operator except CONTAINS
  /// </li>
  /// <li>
  /// OBJECT_SIZE - Any operator except CONTAINS
  /// </li>
  /// </ul>
  final JobComparator? comparator;

  /// The object property to use in the condition.
  final ScopeFilterKey? key;

  /// An array that lists the values to use in the condition. If the value for the
  /// key property is OBJECT_EXTENSION or OBJECT_KEY, this array can specify
  /// multiple values and Amazon Macie uses OR logic to join the values.
  /// Otherwise, this array can specify only one value.
  ///
  /// Valid values for each supported property (key) are:
  ///
  /// <ul>
  /// <li>
  /// OBJECT_EXTENSION - A string that represents the file name extension of an
  /// object. For example: docx or pdf
  /// </li>
  /// <li>
  /// OBJECT_KEY - A string that represents the key prefix (folder name or path)
  /// of an object. For example: logs or awslogs/eventlogs. This value applies a
  /// condition to objects whose keys (names) begin with the specified value.
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
  /// </ul>
  /// Macie doesn't support use of wildcard characters in these values. Also,
  /// string values are case sensitive.
  final List<String>? values;

  SimpleScopeTerm({
    this.comparator,
    this.key,
    this.values,
  });

  factory SimpleScopeTerm.fromJson(Map<String, dynamic> json) {
    return SimpleScopeTerm(
      comparator: (json['comparator'] as String?)?.toJobComparator(),
      key: (json['key'] as String?)?.toScopeFilterKey(),
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final key = this.key;
    final values = this.values;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (key != null) 'key': key.toValue(),
      if (values != null) 'values': values,
    };
  }
}

/// Specifies criteria for sorting the results of a request for findings.
class SortCriteria {
  /// The name of the property to sort the results by. This value can be the name
  /// of any property that Amazon Macie defines for a finding.
  final String? attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });

  factory SortCriteria.fromJson(Map<String, dynamic> json) {
    return SortCriteria(
      attributeName: json['attributeName'] as String?,
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName,
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// Provides processing statistics for a classification job.
class Statistics {
  /// The approximate number of objects that the job has yet to process during its
  /// current run.
  final double? approximateNumberOfObjectsToProcess;

  /// The number of times that the job has run.
  final double? numberOfRuns;

  Statistics({
    this.approximateNumberOfObjectsToProcess,
    this.numberOfRuns,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      approximateNumberOfObjectsToProcess:
          json['approximateNumberOfObjectsToProcess'] as double?,
      numberOfRuns: json['numberOfRuns'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateNumberOfObjectsToProcess =
        this.approximateNumberOfObjectsToProcess;
    final numberOfRuns = this.numberOfRuns;
    return {
      if (approximateNumberOfObjectsToProcess != null)
        'approximateNumberOfObjectsToProcess':
            approximateNumberOfObjectsToProcess,
      if (numberOfRuns != null) 'numberOfRuns': numberOfRuns,
    };
  }
}

/// The storage class of the S3 object. Possible values are:
enum StorageClass {
  standard,
  reducedRedundancy,
  standardIa,
  intelligentTiering,
  deepArchive,
  onezoneIa,
  glacier,
}

extension on StorageClass {
  String toValue() {
    switch (this) {
      case StorageClass.standard:
        return 'STANDARD';
      case StorageClass.reducedRedundancy:
        return 'REDUCED_REDUNDANCY';
      case StorageClass.standardIa:
        return 'STANDARD_IA';
      case StorageClass.intelligentTiering:
        return 'INTELLIGENT_TIERING';
      case StorageClass.deepArchive:
        return 'DEEP_ARCHIVE';
      case StorageClass.onezoneIa:
        return 'ONEZONE_IA';
      case StorageClass.glacier:
        return 'GLACIER';
    }
  }
}

extension on String {
  StorageClass toStorageClass() {
    switch (this) {
      case 'STANDARD':
        return StorageClass.standard;
      case 'REDUCED_REDUNDANCY':
        return StorageClass.reducedRedundancy;
      case 'STANDARD_IA':
        return StorageClass.standardIa;
      case 'INTELLIGENT_TIERING':
        return StorageClass.intelligentTiering;
      case 'DEEP_ARCHIVE':
        return StorageClass.deepArchive;
      case 'ONEZONE_IA':
        return StorageClass.onezoneIa;
      case 'GLACIER':
        return StorageClass.glacier;
    }
    throw Exception('$this is not known in enum StorageClass');
  }
}

/// Specifies a tag-based condition that determines whether an S3 bucket is
/// included or excluded from a classification job.
class TagCriterionForJob {
  /// The operator to use in the condition. Valid values are EQ (equals) and NE
  /// (not equals).
  final JobComparator? comparator;

  /// The tag keys, tag values, or tag key and value pairs to use in the
  /// condition.
  final List<TagCriterionPairForJob>? tagValues;

  TagCriterionForJob({
    this.comparator,
    this.tagValues,
  });

  factory TagCriterionForJob.fromJson(Map<String, dynamic> json) {
    return TagCriterionForJob(
      comparator: (json['comparator'] as String?)?.toJobComparator(),
      tagValues: (json['tagValues'] as List?)
          ?.whereNotNull()
          .map(
              (e) => TagCriterionPairForJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final tagValues = this.tagValues;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (tagValues != null) 'tagValues': tagValues,
    };
  }
}

/// Specifies a tag key, a tag value, or a tag key and value (as a pair) to use
/// in a tag-based condition that determines whether an S3 bucket is included or
/// excluded from a classification job. Tag keys and values are case sensitive.
/// Also, Amazon Macie doesn't support use of partial values or wildcard
/// characters in tag-based conditions.
class TagCriterionPairForJob {
  /// The value for the tag key to use in the condition.
  final String? key;

  /// The tag value to use in the condition.
  final String? value;

  TagCriterionPairForJob({
    this.key,
    this.value,
  });

  factory TagCriterionPairForJob.fromJson(Map<String, dynamic> json) {
    return TagCriterionPairForJob(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
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

/// Specifies a tag-based condition that determines whether an S3 object is
/// included or excluded from a classification job.
class TagScopeTerm {
  /// The operator to use in the condition. Valid values are EQ (equals) or NE
  /// (not equals).
  final JobComparator? comparator;

  /// The object property to use in the condition. The only valid value is TAG.
  final String? key;

  /// The tag keys or tag key and value pairs to use in the condition. To specify
  /// only tag keys in a condition, specify the keys in this array and set the
  /// value for each associated tag value to an empty string.
  final List<TagValuePair>? tagValues;

  /// The type of object to apply the condition to.
  final TagTarget? target;

  TagScopeTerm({
    this.comparator,
    this.key,
    this.tagValues,
    this.target,
  });

  factory TagScopeTerm.fromJson(Map<String, dynamic> json) {
    return TagScopeTerm(
      comparator: (json['comparator'] as String?)?.toJobComparator(),
      key: json['key'] as String?,
      tagValues: (json['tagValues'] as List?)
          ?.whereNotNull()
          .map((e) => TagValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      target: (json['target'] as String?)?.toTagTarget(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final key = this.key;
    final tagValues = this.tagValues;
    final target = this.target;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (key != null) 'key': key,
      if (tagValues != null) 'tagValues': tagValues,
      if (target != null) 'target': target.toValue(),
    };
  }
}

/// The type of object to apply a tag-based condition to. Valid values are:
enum TagTarget {
  s3Object,
}

extension on TagTarget {
  String toValue() {
    switch (this) {
      case TagTarget.s3Object:
        return 'S3_OBJECT';
    }
  }
}

extension on String {
  TagTarget toTagTarget() {
    switch (this) {
      case 'S3_OBJECT':
        return TagTarget.s3Object;
    }
    throw Exception('$this is not known in enum TagTarget');
  }
}

/// Specifies a tag key or tag key and value pair to use in a tag-based
/// condition that determines whether an S3 object is included or excluded from
/// a classification job. Tag keys and values are case sensitive. Also, Amazon
/// Macie doesn't support use of partial values or wildcard characters in
/// tag-based conditions.
class TagValuePair {
  /// The value for the tag key to use in the condition.
  final String? key;

  /// The tag value, associated with the specified tag key (key), to use in the
  /// condition. To specify only a tag key for a condition, specify the tag key
  /// for the key property and set this value to an empty string.
  final String? value;

  TagValuePair({
    this.key,
    this.value,
  });

  factory TagValuePair.fromJson(Map<String, dynamic> json) {
    return TagValuePair(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

class TestCustomDataIdentifierResponse {
  /// The number of instances of sample text that matched the detection criteria
  /// specified in the custom data identifier.
  final int? matchCount;

  TestCustomDataIdentifierResponse({
    this.matchCount,
  });

  factory TestCustomDataIdentifierResponse.fromJson(Map<String, dynamic> json) {
    return TestCustomDataIdentifierResponse(
      matchCount: json['matchCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final matchCount = this.matchCount;
    return {
      if (matchCount != null) 'matchCount': matchCount,
    };
  }
}

/// An inclusive time period that Amazon Macie usage data applies to. Possible
/// values are:
enum TimeRange {
  monthToDate,
  past_30Days,
}

extension on TimeRange {
  String toValue() {
    switch (this) {
      case TimeRange.monthToDate:
        return 'MONTH_TO_DATE';
      case TimeRange.past_30Days:
        return 'PAST_30_DAYS';
    }
  }
}

extension on String {
  TimeRange toTimeRange() {
    switch (this) {
      case 'MONTH_TO_DATE':
        return TimeRange.monthToDate;
      case 'PAST_30_DAYS':
        return TimeRange.past_30Days;
    }
    throw Exception('$this is not known in enum TimeRange');
  }
}

enum Type {
  none,
  aes256,
  awsKms,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.none:
        return 'NONE';
      case Type.aes256:
        return 'AES256';
      case Type.awsKms:
        return 'aws:kms';
    }
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'NONE':
        return Type.none;
      case 'AES256':
        return Type.aes256;
      case 'aws:kms':
        return Type.awsKms;
    }
    throw Exception('$this is not known in enum Type');
  }
}

enum Unit {
  terabytes,
}

extension on Unit {
  String toValue() {
    switch (this) {
      case Unit.terabytes:
        return 'TERABYTES';
    }
  }
}

extension on String {
  Unit toUnit() {
    switch (this) {
      case 'TERABYTES':
        return Unit.terabytes;
    }
    throw Exception('$this is not known in enum Unit');
  }
}

/// Provides information about an account-related request that hasn't been
/// processed.
class UnprocessedAccount {
  /// The Amazon Web Services account ID for the account that the request applies
  /// to.
  final String? accountId;

  /// The source of the issue or delay in processing the request.
  final ErrorCode? errorCode;

  /// The reason why the request hasn't been processed.
  final String? errorMessage;

  UnprocessedAccount({
    this.accountId,
    this.errorCode,
    this.errorMessage,
  });

  factory UnprocessedAccount.fromJson(Map<String, dynamic> json) {
    return UnprocessedAccount(
      accountId: json['accountId'] as String?,
      errorCode: (json['errorCode'] as String?)?.toErrorCode(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (accountId != null) 'accountId': accountId,
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
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

class UpdateClassificationJobResponse {
  UpdateClassificationJobResponse();

  factory UpdateClassificationJobResponse.fromJson(Map<String, dynamic> _) {
    return UpdateClassificationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateFindingsFilterResponse {
  /// The Amazon Resource Name (ARN) of the filter that was updated.
  final String? arn;

  /// The unique identifier for the filter that was updated.
  final String? id;

  UpdateFindingsFilterResponse({
    this.arn,
    this.id,
  });

  factory UpdateFindingsFilterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFindingsFilterResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
  }
}

class UpdateMacieSessionResponse {
  UpdateMacieSessionResponse();

  factory UpdateMacieSessionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMacieSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMemberSessionResponse {
  UpdateMemberSessionResponse();

  factory UpdateMemberSessionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMemberSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateOrganizationConfigurationResponse {
  UpdateOrganizationConfigurationResponse();

  factory UpdateOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateOrganizationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides data for a specific usage metric and the corresponding quota for an
/// Amazon Macie account.
class UsageByAccount {
  /// The type of currency that the value for the metric (estimatedCost) is
  /// reported in.
  final Currency? currency;

  /// The estimated value for the metric.
  final String? estimatedCost;

  /// The current value for the quota that corresponds to the metric specified by
  /// the type field.
  final ServiceLimit? serviceLimit;

  /// The name of the metric. Possible values are: DATA_INVENTORY_EVALUATION, for
  /// monitoring S3 buckets; and, SENSITIVE_DATA_DISCOVERY, for analyzing S3
  /// objects to detect sensitive data.
  final UsageType? type;

  UsageByAccount({
    this.currency,
    this.estimatedCost,
    this.serviceLimit,
    this.type,
  });

  factory UsageByAccount.fromJson(Map<String, dynamic> json) {
    return UsageByAccount(
      currency: (json['currency'] as String?)?.toCurrency(),
      estimatedCost: json['estimatedCost'] as String?,
      serviceLimit: json['serviceLimit'] != null
          ? ServiceLimit.fromJson(json['serviceLimit'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toUsageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final estimatedCost = this.estimatedCost;
    final serviceLimit = this.serviceLimit;
    final type = this.type;
    return {
      if (currency != null) 'currency': currency.toValue(),
      if (estimatedCost != null) 'estimatedCost': estimatedCost,
      if (serviceLimit != null) 'serviceLimit': serviceLimit,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Provides quota and aggregated usage data for an Amazon Macie account.
class UsageRecord {
  /// The unique identifier for the Amazon Web Services account that the data
  /// applies to.
  final String? accountId;

  /// The date and time, in UTC and extended ISO 8601 format, when the free trial
  /// started for the account.
  final DateTime? freeTrialStartDate;

  /// An array of objects that contains usage data and quotas for the account.
  /// Each object contains the data for a specific usage metric and the
  /// corresponding quota.
  final List<UsageByAccount>? usage;

  UsageRecord({
    this.accountId,
    this.freeTrialStartDate,
    this.usage,
  });

  factory UsageRecord.fromJson(Map<String, dynamic> json) {
    return UsageRecord(
      accountId: json['accountId'] as String?,
      freeTrialStartDate: timeStampFromJson(json['freeTrialStartDate']),
      usage: (json['usage'] as List?)
          ?.whereNotNull()
          .map((e) => UsageByAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final freeTrialStartDate = this.freeTrialStartDate;
    final usage = this.usage;
    return {
      if (accountId != null) 'accountId': accountId,
      if (freeTrialStartDate != null)
        'freeTrialStartDate': iso8601ToJson(freeTrialStartDate),
      if (usage != null) 'usage': usage,
    };
  }
}

/// Specifies a condition for filtering the results of a query for quota and
/// usage data for one or more Amazon Macie accounts.
class UsageStatisticsFilter {
  /// The operator to use in the condition. If the value for the key property is
  /// accountId, this value must be CONTAINS. If the value for the key property is
  /// any other supported field, this value can be EQ, GT, GTE, LT, LTE, or NE.
  final UsageStatisticsFilterComparator? comparator;

  /// The field to use in the condition.
  final UsageStatisticsFilterKey? key;

  /// An array that lists values to use in the condition, based on the value for
  /// the field specified by the key property. If the value for the key property
  /// is accountId, this array can specify multiple values. Otherwise, this array
  /// can specify only one value.
  ///
  /// Valid values for each supported field are:
  ///
  /// <ul>
  /// <li>
  /// accountId - The unique identifier for an Amazon Web Services account.
  /// </li>
  /// <li>
  /// freeTrialStartDate - The date and time, in UTC and extended ISO 8601 format,
  /// when the free trial started for an account.
  /// </li>
  /// <li>
  /// serviceLimit - A Boolean (true or false) value that indicates whether an
  /// account has reached its monthly quota.
  /// </li>
  /// <li>
  /// total - A string that represents the current estimated cost for an account.
  /// </li>
  /// </ul>
  final List<String>? values;

  UsageStatisticsFilter({
    this.comparator,
    this.key,
    this.values,
  });

  factory UsageStatisticsFilter.fromJson(Map<String, dynamic> json) {
    return UsageStatisticsFilter(
      comparator:
          (json['comparator'] as String?)?.toUsageStatisticsFilterComparator(),
      key: (json['key'] as String?)?.toUsageStatisticsFilterKey(),
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comparator = this.comparator;
    final key = this.key;
    final values = this.values;
    return {
      if (comparator != null) 'comparator': comparator.toValue(),
      if (key != null) 'key': key.toValue(),
      if (values != null) 'values': values,
    };
  }
}

/// The operator to use in a condition that filters the results of a query for
/// Amazon Macie account quotas and usage data. Valid values are:
enum UsageStatisticsFilterComparator {
  gt,
  gte,
  lt,
  lte,
  eq,
  ne,
  contains,
}

extension on UsageStatisticsFilterComparator {
  String toValue() {
    switch (this) {
      case UsageStatisticsFilterComparator.gt:
        return 'GT';
      case UsageStatisticsFilterComparator.gte:
        return 'GTE';
      case UsageStatisticsFilterComparator.lt:
        return 'LT';
      case UsageStatisticsFilterComparator.lte:
        return 'LTE';
      case UsageStatisticsFilterComparator.eq:
        return 'EQ';
      case UsageStatisticsFilterComparator.ne:
        return 'NE';
      case UsageStatisticsFilterComparator.contains:
        return 'CONTAINS';
    }
  }
}

extension on String {
  UsageStatisticsFilterComparator toUsageStatisticsFilterComparator() {
    switch (this) {
      case 'GT':
        return UsageStatisticsFilterComparator.gt;
      case 'GTE':
        return UsageStatisticsFilterComparator.gte;
      case 'LT':
        return UsageStatisticsFilterComparator.lt;
      case 'LTE':
        return UsageStatisticsFilterComparator.lte;
      case 'EQ':
        return UsageStatisticsFilterComparator.eq;
      case 'NE':
        return UsageStatisticsFilterComparator.ne;
      case 'CONTAINS':
        return UsageStatisticsFilterComparator.contains;
    }
    throw Exception(
        '$this is not known in enum UsageStatisticsFilterComparator');
  }
}

/// The field to use in a condition that filters the results of a query for
/// Amazon Macie account quotas and usage data. Valid values are:
enum UsageStatisticsFilterKey {
  accountId,
  serviceLimit,
  freeTrialStartDate,
  total,
}

extension on UsageStatisticsFilterKey {
  String toValue() {
    switch (this) {
      case UsageStatisticsFilterKey.accountId:
        return 'accountId';
      case UsageStatisticsFilterKey.serviceLimit:
        return 'serviceLimit';
      case UsageStatisticsFilterKey.freeTrialStartDate:
        return 'freeTrialStartDate';
      case UsageStatisticsFilterKey.total:
        return 'total';
    }
  }
}

extension on String {
  UsageStatisticsFilterKey toUsageStatisticsFilterKey() {
    switch (this) {
      case 'accountId':
        return UsageStatisticsFilterKey.accountId;
      case 'serviceLimit':
        return UsageStatisticsFilterKey.serviceLimit;
      case 'freeTrialStartDate':
        return UsageStatisticsFilterKey.freeTrialStartDate;
      case 'total':
        return UsageStatisticsFilterKey.total;
    }
    throw Exception('$this is not known in enum UsageStatisticsFilterKey');
  }
}

/// Specifies criteria for sorting the results of a query for Amazon Macie
/// account quotas and usage data.
class UsageStatisticsSortBy {
  /// The field to sort the results by.
  final UsageStatisticsSortKey? key;

  /// The sort order to apply to the results, based on the value for the field
  /// specified by the key property. Valid values are: ASC, sort the results in
  /// ascending order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  UsageStatisticsSortBy({
    this.key,
    this.orderBy,
  });

  factory UsageStatisticsSortBy.fromJson(Map<String, dynamic> json) {
    return UsageStatisticsSortBy(
      key: (json['key'] as String?)?.toUsageStatisticsSortKey(),
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final orderBy = this.orderBy;
    return {
      if (key != null) 'key': key.toValue(),
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// The field to use to sort the results of a query for Amazon Macie account
/// quotas and usage data. Valid values are:
enum UsageStatisticsSortKey {
  accountId,
  total,
  serviceLimitValue,
  freeTrialStartDate,
}

extension on UsageStatisticsSortKey {
  String toValue() {
    switch (this) {
      case UsageStatisticsSortKey.accountId:
        return 'accountId';
      case UsageStatisticsSortKey.total:
        return 'total';
      case UsageStatisticsSortKey.serviceLimitValue:
        return 'serviceLimitValue';
      case UsageStatisticsSortKey.freeTrialStartDate:
        return 'freeTrialStartDate';
    }
  }
}

extension on String {
  UsageStatisticsSortKey toUsageStatisticsSortKey() {
    switch (this) {
      case 'accountId':
        return UsageStatisticsSortKey.accountId;
      case 'total':
        return UsageStatisticsSortKey.total;
      case 'serviceLimitValue':
        return UsageStatisticsSortKey.serviceLimitValue;
      case 'freeTrialStartDate':
        return UsageStatisticsSortKey.freeTrialStartDate;
    }
    throw Exception('$this is not known in enum UsageStatisticsSortKey');
  }
}

/// Provides aggregated data for an Amazon Macie usage metric. The value for the
/// metric reports estimated usage data for an account for the preceding 30 days
/// or the current calendar month to date, depending on the time period
/// (timeRange) specified in the request.
class UsageTotal {
  /// The type of currency that the value for the metric (estimatedCost) is
  /// reported in.
  final Currency? currency;

  /// The estimated value for the metric.
  final String? estimatedCost;

  /// The name of the metric. Possible values are: DATA_INVENTORY_EVALUATION, for
  /// monitoring S3 buckets; and, SENSITIVE_DATA_DISCOVERY, for analyzing S3
  /// objects to detect sensitive data.
  final UsageType? type;

  UsageTotal({
    this.currency,
    this.estimatedCost,
    this.type,
  });

  factory UsageTotal.fromJson(Map<String, dynamic> json) {
    return UsageTotal(
      currency: (json['currency'] as String?)?.toCurrency(),
      estimatedCost: json['estimatedCost'] as String?,
      type: (json['type'] as String?)?.toUsageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final estimatedCost = this.estimatedCost;
    final type = this.type;
    return {
      if (currency != null) 'currency': currency.toValue(),
      if (estimatedCost != null) 'estimatedCost': estimatedCost,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The name of an Amazon Macie usage metric for an account. Possible values
/// are:
enum UsageType {
  dataInventoryEvaluation,
  sensitiveDataDiscovery,
}

extension on UsageType {
  String toValue() {
    switch (this) {
      case UsageType.dataInventoryEvaluation:
        return 'DATA_INVENTORY_EVALUATION';
      case UsageType.sensitiveDataDiscovery:
        return 'SENSITIVE_DATA_DISCOVERY';
    }
  }
}

extension on String {
  UsageType toUsageType() {
    switch (this) {
      case 'DATA_INVENTORY_EVALUATION':
        return UsageType.dataInventoryEvaluation;
      case 'SENSITIVE_DATA_DISCOVERY':
        return UsageType.sensitiveDataDiscovery;
    }
    throw Exception('$this is not known in enum UsageType');
  }
}

/// Provides information about the type and other characteristics of an entity
/// that performed an action on an affected resource.
class UserIdentity {
  /// If the action was performed with temporary security credentials that were
  /// obtained using the AssumeRole operation of the Security Token Service (STS)
  /// API, the identifiers, session context, and other details about the identity.
  final AssumedRole? assumedRole;

  /// If the action was performed using the credentials for another Amazon Web
  /// Services account, the details of that account.
  final AwsAccount? awsAccount;

  /// If the action was performed by an Amazon Web Services account that belongs
  /// to an Amazon Web Service, the name of the service.
  final AwsService? awsService;

  /// If the action was performed with temporary security credentials that were
  /// obtained using the GetFederationToken operation of the Security Token
  /// Service (STS) API, the identifiers, session context, and other details about
  /// the identity.
  final FederatedUser? federatedUser;

  /// If the action was performed using the credentials for an Identity and Access
  /// Management (IAM) user, the name and other details about the user.
  final IamUser? iamUser;

  /// If the action was performed using the credentials for your Amazon Web
  /// Services account, the details of your account.
  final UserIdentityRoot? root;

  /// The type of entity that performed the action.
  final UserIdentityType? type;

  UserIdentity({
    this.assumedRole,
    this.awsAccount,
    this.awsService,
    this.federatedUser,
    this.iamUser,
    this.root,
    this.type,
  });

  factory UserIdentity.fromJson(Map<String, dynamic> json) {
    return UserIdentity(
      assumedRole: json['assumedRole'] != null
          ? AssumedRole.fromJson(json['assumedRole'] as Map<String, dynamic>)
          : null,
      awsAccount: json['awsAccount'] != null
          ? AwsAccount.fromJson(json['awsAccount'] as Map<String, dynamic>)
          : null,
      awsService: json['awsService'] != null
          ? AwsService.fromJson(json['awsService'] as Map<String, dynamic>)
          : null,
      federatedUser: json['federatedUser'] != null
          ? FederatedUser.fromJson(
              json['federatedUser'] as Map<String, dynamic>)
          : null,
      iamUser: json['iamUser'] != null
          ? IamUser.fromJson(json['iamUser'] as Map<String, dynamic>)
          : null,
      root: json['root'] != null
          ? UserIdentityRoot.fromJson(json['root'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.toUserIdentityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final assumedRole = this.assumedRole;
    final awsAccount = this.awsAccount;
    final awsService = this.awsService;
    final federatedUser = this.federatedUser;
    final iamUser = this.iamUser;
    final root = this.root;
    final type = this.type;
    return {
      if (assumedRole != null) 'assumedRole': assumedRole,
      if (awsAccount != null) 'awsAccount': awsAccount,
      if (awsService != null) 'awsService': awsService,
      if (federatedUser != null) 'federatedUser': federatedUser,
      if (iamUser != null) 'iamUser': iamUser,
      if (root != null) 'root': root,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Provides information about an Amazon Web Services account and entity that
/// performed an action on an affected resource. The action was performed using
/// the credentials for your Amazon Web Services account.
class UserIdentityRoot {
  /// The unique identifier for the Amazon Web Services account.
  final String? accountId;

  /// The Amazon Resource Name (ARN) of the principal that performed the action.
  /// The last section of the ARN contains the name of the user or role that
  /// performed the action.
  final String? arn;

  /// The unique identifier for the entity that performed the action.
  final String? principalId;

  UserIdentityRoot({
    this.accountId,
    this.arn,
    this.principalId,
  });

  factory UserIdentityRoot.fromJson(Map<String, dynamic> json) {
    return UserIdentityRoot(
      accountId: json['accountId'] as String?,
      arn: json['arn'] as String?,
      principalId: json['principalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final principalId = this.principalId;
    return {
      if (accountId != null) 'accountId': accountId,
      if (arn != null) 'arn': arn,
      if (principalId != null) 'principalId': principalId,
    };
  }
}

/// The type of entity that performed the action on the affected resource.
/// Possible values are:
enum UserIdentityType {
  assumedRole,
  iAMUser,
  federatedUser,
  root,
  awsAccount,
  awsService,
}

extension on UserIdentityType {
  String toValue() {
    switch (this) {
      case UserIdentityType.assumedRole:
        return 'AssumedRole';
      case UserIdentityType.iAMUser:
        return 'IAMUser';
      case UserIdentityType.federatedUser:
        return 'FederatedUser';
      case UserIdentityType.root:
        return 'Root';
      case UserIdentityType.awsAccount:
        return 'AWSAccount';
      case UserIdentityType.awsService:
        return 'AWSService';
    }
  }
}

extension on String {
  UserIdentityType toUserIdentityType() {
    switch (this) {
      case 'AssumedRole':
        return UserIdentityType.assumedRole;
      case 'IAMUser':
        return UserIdentityType.iAMUser;
      case 'FederatedUser':
        return UserIdentityType.federatedUser;
      case 'Root':
        return UserIdentityType.root;
      case 'AWSAccount':
        return UserIdentityType.awsAccount;
      case 'AWSService':
        return UserIdentityType.awsService;
    }
    throw Exception('$this is not known in enum UserIdentityType');
  }
}

/// Provides information about when a classification job was paused. For a
/// one-time job, this object also specifies when the job will expire and be
/// cancelled if it isn't resumed. For a recurring job, this object also
/// specifies when the paused job run will expire and be cancelled if it isn't
/// resumed. This object is present only if a job's current status (jobStatus)
/// is USER_PAUSED. The information in this object applies only to a job that
/// was paused while it had a status of RUNNING.
class UserPausedDetails {
  /// The date and time, in UTC and extended ISO 8601 format, when the job or job
  /// run will expire and be cancelled if you don't resume it first.
  final DateTime? jobExpiresAt;

  /// The Amazon Resource Name (ARN) of the Health event that Amazon Macie sent to
  /// notify you of the job or job run's pending expiration and cancellation. This
  /// value is null if a job has been paused for less than 23 days.
  final String? jobImminentExpirationHealthEventArn;

  /// The date and time, in UTC and extended ISO 8601 format, when you paused the
  /// job.
  final DateTime? jobPausedAt;

  UserPausedDetails({
    this.jobExpiresAt,
    this.jobImminentExpirationHealthEventArn,
    this.jobPausedAt,
  });

  factory UserPausedDetails.fromJson(Map<String, dynamic> json) {
    return UserPausedDetails(
      jobExpiresAt: timeStampFromJson(json['jobExpiresAt']),
      jobImminentExpirationHealthEventArn:
          json['jobImminentExpirationHealthEventArn'] as String?,
      jobPausedAt: timeStampFromJson(json['jobPausedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final jobExpiresAt = this.jobExpiresAt;
    final jobImminentExpirationHealthEventArn =
        this.jobImminentExpirationHealthEventArn;
    final jobPausedAt = this.jobPausedAt;
    return {
      if (jobExpiresAt != null) 'jobExpiresAt': iso8601ToJson(jobExpiresAt),
      if (jobImminentExpirationHealthEventArn != null)
        'jobImminentExpirationHealthEventArn':
            jobImminentExpirationHealthEventArn,
      if (jobPausedAt != null) 'jobPausedAt': iso8601ToJson(jobPausedAt),
    };
  }
}

/// Specifies a weekly recurrence pattern for running a classification job.
class WeeklySchedule {
  /// The day of the week when Amazon Macie runs the job.
  final DayOfWeek? dayOfWeek;

  WeeklySchedule({
    this.dayOfWeek,
  });

  factory WeeklySchedule.fromJson(Map<String, dynamic> json) {
    return WeeklySchedule(
      dayOfWeek: (json['dayOfWeek'] as String?)?.toDayOfWeek(),
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfWeek = this.dayOfWeek;
    return {
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.toValue(),
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
