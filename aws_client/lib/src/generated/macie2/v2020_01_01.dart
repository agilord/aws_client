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

/// Amazon Macie
class Macie2 {
  final _s.RestJsonProtocol _protocol;
  Macie2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
  /// An array of custom data identifier IDs, one for each custom data
  /// identifier to retrieve information about.
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

  /// Creates and defines the settings for an allow list.
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
  /// The criteria that specify the text or text pattern to ignore. The criteria
  /// can be the location and name of an S3 object that lists specific text to
  /// ignore (s3WordsList), or a regular expression (regex) that defines a text
  /// pattern to ignore.
  ///
  /// Parameter [name] :
  /// A custom name for the allow list. The name can contain as many as 128
  /// characters.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// A custom description of the allow list. The description can contain as
  /// many as 512 characters.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// allow list.
  ///
  /// An allow list can have a maximum of 50 tags. Each tag consists of a tag
  /// key and an associated tag value. The maximum length of a tag key is 128
  /// characters. The maximum length of a tag value is 256 characters.
  Future<CreateAllowListResponse> createAllowList({
    required AllowListCriteria criteria,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'criteria': criteria,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/allow-lists',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAllowListResponse.fromJson(response);
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
  /// Parameter [allowListIds] :
  /// An array of unique identifiers, one for each allow list for the job to use
  /// when it analyzes data.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [customDataIdentifierIds] :
  /// An array of unique identifiers, one for each custom data identifier for
  /// the job to use when it analyzes data. To use only managed data
  /// identifiers, don't specify a value for this property and specify a value
  /// other than NONE for the managedDataIdentifierSelector property.
  ///
  /// Parameter [description] :
  /// A custom description of the job. The description can contain as many as
  /// 200 characters.
  ///
  /// Parameter [initialRun] :
  /// For a recurring job, specifies whether to analyze all existing, eligible
  /// objects immediately after the job is created (true). To analyze only those
  /// objects that are created or changed after you create the job and before
  /// the job's first scheduled run, set this value to false.
  ///
  /// If you configure the job to run only once, don't specify a value for this
  /// property.
  ///
  /// Parameter [managedDataIdentifierIds] :
  /// An array of unique identifiers, one for each managed data identifier for
  /// the job to include (use) or exclude (not use) when it analyzes data.
  /// Inclusion or exclusion depends on the managed data identifier selection
  /// type that you specify for the job (managedDataIdentifierSelector).
  ///
  /// To retrieve a list of valid values for this property, use the
  /// ListManagedDataIdentifiers operation.
  ///
  /// Parameter [managedDataIdentifierSelector] :
  /// The selection type to apply when determining which managed data
  /// identifiers the job uses to analyze data. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// ALL - Use all managed data identifiers. If you specify this value, don't
  /// specify any values for the managedDataIdentifierIds property.
  /// </li>
  /// <li>
  /// EXCLUDE - Use all managed data identifiers except the ones specified by
  /// the managedDataIdentifierIds property.
  /// </li>
  /// <li>
  /// INCLUDE - Use only the managed data identifiers specified by the
  /// managedDataIdentifierIds property.
  /// </li>
  /// <li>
  /// NONE - Don't use any managed data identifiers. If you specify this value,
  /// specify at least one value for the customDataIdentifierIds property and
  /// don't specify any values for the managedDataIdentifierIds property.
  /// </li>
  /// <li>
  /// RECOMMENDED (default) - Use the recommended set of managed data
  /// identifiers. If you specify this value, don't specify any values for the
  /// managedDataIdentifierIds property.
  /// </li>
  /// </ul>
  /// If you don't specify a value for this property, the job uses the
  /// recommended set of managed data identifiers.
  ///
  /// If the job is a recurring job and you specify ALL or EXCLUDE, each job run
  /// automatically uses new managed data identifiers that are released. If you
  /// don't specify a value for this property or you specify RECOMMENDED for a
  /// recurring job, each job run automatically uses all the managed data
  /// identifiers that are in the recommended set when the run starts.
  ///
  /// For information about individual managed data identifiers or to determine
  /// which ones are in the recommended set, see <a
  /// href="https://docs.aws.amazon.com/macie/latest/user/managed-data-identifiers.html">Using
  /// managed data identifiers</a> and <a
  /// href="https://docs.aws.amazon.com/macie/latest/user/discovery-jobs-mdis-recommended.html">Recommended
  /// managed data identifiers</a> in the <i>Amazon Macie User Guide</i>.
  ///
  /// Parameter [samplingPercentage] :
  /// The sampling depth, as a percentage, for the job to apply when processing
  /// objects. This value determines the percentage of eligible objects that the
  /// job analyzes. If this value is less than 100, Amazon Macie selects the
  /// objects to analyze at random, up to the specified percentage, and analyzes
  /// all the data in those objects.
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
    List<String>? allowListIds,
    String? clientToken,
    List<String>? customDataIdentifierIds,
    String? description,
    bool? initialRun,
    List<String>? managedDataIdentifierIds,
    ManagedDataIdentifierSelector? managedDataIdentifierSelector,
    int? samplingPercentage,
    JobScheduleFrequency? scheduleFrequency,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'jobType': jobType.toValue(),
      'name': name,
      's3JobDefinition': s3JobDefinition,
      if (allowListIds != null) 'allowListIds': allowListIds,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (customDataIdentifierIds != null)
        'customDataIdentifierIds': customDataIdentifierIds,
      if (description != null) 'description': description,
      if (initialRun != null) 'initialRun': initialRun,
      if (managedDataIdentifierIds != null)
        'managedDataIdentifierIds': managedDataIdentifierIds,
      if (managedDataIdentifierSelector != null)
        'managedDataIdentifierSelector':
            managedDataIdentifierSelector.toValue(),
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
  /// Parameter [name] :
  /// A custom name for the custom data identifier. The name can contain as many
  /// as 128 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// name of a custom data identifier. Other users of your account might be
  /// able to see this name, depending on the actions that they're allowed to
  /// perform in Amazon Macie.
  ///
  /// Parameter [regex] :
  /// The regular expression (<i>regex</i>) that defines the pattern to match.
  /// The expression can contain as many as 512 characters.
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
  /// be able to see this description, depending on the actions that they're
  /// allowed to perform in Amazon Macie.
  ///
  /// Parameter [ignoreWords] :
  /// An array that lists specific character sequences (<i>ignore words</i>) to
  /// exclude from the results. If the text matched by the regular expression
  /// contains any string in this array, Amazon Macie ignores it. The array can
  /// contain as many as 10 ignore words. Each ignore word can contain 4-90
  /// UTF-8 characters. Ignore words are case sensitive.
  ///
  /// Parameter [keywords] :
  /// An array that lists specific character sequences (<i>keywords</i>), one of
  /// which must precede and be within proximity (maximumMatchDistance) of the
  /// regular expression to match. The array can contain as many as 50 keywords.
  /// Each keyword can contain 3-90 UTF-8 characters. Keywords aren't case
  /// sensitive.
  ///
  /// Parameter [maximumMatchDistance] :
  /// The maximum number of characters that can exist between the end of at
  /// least one complete character sequence specified by the keywords array and
  /// the end of the text that matches the regex pattern. If a complete keyword
  /// precedes all the text that matches the pattern and the keyword is within
  /// the specified distance, Amazon Macie includes the result. The distance can
  /// be 1-300 characters. The default value is 50.
  ///
  /// Parameter [severityLevels] :
  /// The severity to assign to findings that the custom data identifier
  /// produces, based on the number of occurrences of text that match the custom
  /// data identifier's detection criteria. You can specify as many as three
  /// SeverityLevel objects in this array, one for each severity: LOW, MEDIUM,
  /// or HIGH. If you specify more than one, the occurrences thresholds must be
  /// in ascending order by severity, moving from LOW to HIGH. For example, 1
  /// for LOW, 50 for MEDIUM, and 100 for HIGH. If an S3 object contains fewer
  /// occurrences than the lowest specified threshold, Amazon Macie doesn't
  /// create a finding.
  ///
  /// If you don't specify any values for this array, Macie creates findings for
  /// S3 objects that contain at least one occurrence of text that matches the
  /// detection criteria, and Macie assigns the MEDIUM severity to those
  /// findings.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs that specifies the tags to associate with the
  /// custom data identifier.
  ///
  /// A custom data identifier can have a maximum of 50 tags. Each tag consists
  /// of a tag key and an associated tag value. The maximum length of a tag key
  /// is 128 characters. The maximum length of a tag value is 256 characters.
  Future<CreateCustomDataIdentifierResponse> createCustomDataIdentifier({
    required String name,
    required String regex,
    String? clientToken,
    String? description,
    List<String>? ignoreWords,
    List<String>? keywords,
    int? maximumMatchDistance,
    List<SeverityLevel>? severityLevels,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'regex': regex,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (ignoreWords != null) 'ignoreWords': ignoreWords,
      if (keywords != null) 'keywords': keywords,
      if (maximumMatchDistance != null)
        'maximumMatchDistance': maximumMatchDistance,
      if (severityLevels != null) 'severityLevels': severityLevels,
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
  /// The action to perform on findings that match the filter criteria
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
  /// name of a filter. Other users of your account might be able to see this
  /// name, depending on the actions that they're allowed to perform in Amazon
  /// Macie.
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
  /// this description, depending on the actions that they're allowed to perform
  /// in Amazon Macie.
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
  /// Specifies whether to send the invitation as an email message. If this
  /// value is false, Amazon Macie sends the invitation (as an email message) to
  /// the email address that you specified for the recipient's account when you
  /// associated the account with your account. The default value is false.
  ///
  /// Parameter [message] :
  /// Custom text to include in the email message that contains the invitation.
  /// The text can contain as many as 80 alphanumeric characters.
  Future<CreateInvitationsResponse> createInvitations({
    required List<String> accountIds,
    bool? disableEmailNotification,
    String? message,
  }) async {
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
  /// An array of finding types, one for each type of sample finding to create.
  /// To create a sample of every type of finding that Amazon Macie supports,
  /// don't include this array in your request.
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

  /// Deletes an allow list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  ///
  /// Parameter [ignoreJobChecks] :
  /// Specifies whether to force deletion of the allow list, even if active
  /// classification jobs are configured to use the list.
  ///
  /// When you try to delete an allow list, Amazon Macie checks for
  /// classification jobs that use the list and have a status other than
  /// COMPLETE or CANCELLED. By default, Macie rejects your request if any jobs
  /// meet these criteria. To skip these checks and delete the list, set this
  /// value to true. To delete the list only if no active jobs are configured to
  /// use it, set this value to false.
  Future<void> deleteAllowList({
    required String id,
    String? ignoreJobChecks,
  }) async {
    final $query = <String, List<String>>{
      if (ignoreJobChecks != null) 'ignoreJobChecks': [ignoreJobChecks],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/allow-lists/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<void> deleteCustomDataIdentifier({
    required String id,
  }) async {
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<void> deleteFindingsFilter({
    required String id,
  }) async {
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<void> deleteMember({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/members/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves (queries) statistical data and other information about one or
  /// more S3 buckets that Amazon Macie monitors and analyzes for an account.
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeClassificationJobResponse.fromJson(response);
  }

  /// Retrieves the Amazon Macie configuration settings for an organization in
  /// Organizations.
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

  /// Disables Amazon Macie and deletes all settings and resources for a Macie
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
  /// for an organization in Organizations.
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<void> disassociateMember({
    required String id,
  }) async {
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
  /// (formerly Amazon CloudWatch Events).
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
  /// for an organization in Organizations.
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

  /// Retrieves the settings and status of an allow list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<GetAllowListResponse> getAllowList({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/allow-lists/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAllowListResponse.fromJson(response);
  }

  /// Retrieves the configuration settings and status of automated sensitive
  /// data discovery for an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  Future<GetAutomatedDiscoveryConfigurationResponse>
      getAutomatedDiscoveryConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/automated-discovery/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedDiscoveryConfigurationResponse.fromJson(response);
  }

  /// Retrieves (queries) aggregated statistical data about all the S3 buckets
  /// that Amazon Macie monitors and analyzes for an account.
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

  /// Retrieves the classification scope settings for an account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<GetClassificationScopeResponse> getClassificationScope({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/classification-scopes/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetClassificationScopeResponse.fromJson(response);
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<GetCustomDataIdentifierResponse> getCustomDataIdentifier({
    required String id,
  }) async {
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
  /// retrieve. You can specify as many as 50 unique identifiers in this array.
  ///
  /// Parameter [sortCriteria] :
  /// The criteria for sorting the results of the request.
  Future<GetFindingsResponse> getFindings({
    required List<String> findingIds,
    SortCriteria? sortCriteria,
  }) async {
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<GetFindingsFilterResponse> getFindingsFilter({
    required String id,
  }) async {
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

  /// Retrieves the status and configuration settings for an Amazon Macie
  /// account.
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<GetMemberResponse> getMember({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/members/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMemberResponse.fromJson(response);
  }

  /// Retrieves (queries) sensitive data discovery statistics and the
  /// sensitivity score for an S3 bucket.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 bucket that the request applies
  /// to.
  Future<GetResourceProfileResponse> getResourceProfile({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resource-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceProfileResponse.fromJson(response);
  }

  /// Retrieves the status and configuration settings for retrieving occurrences
  /// of sensitive data reported by findings.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  Future<GetRevealConfigurationResponse> getRevealConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/reveal-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetRevealConfigurationResponse.fromJson(response);
  }

  /// Retrieves occurrences of sensitive data reported by a finding.
  ///
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [findingId] :
  /// The unique identifier for the finding.
  Future<GetSensitiveDataOccurrencesResponse> getSensitiveDataOccurrences({
    required String findingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/findings/${Uri.encodeComponent(findingId)}/reveal',
      exceptionFnMap: _exceptionFns,
    );
    return GetSensitiveDataOccurrencesResponse.fromJson(response);
  }

  /// Checks whether occurrences of sensitive data can be retrieved for a
  /// finding.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [findingId] :
  /// The unique identifier for the finding.
  Future<GetSensitiveDataOccurrencesAvailabilityResponse>
      getSensitiveDataOccurrencesAvailability({
    required String findingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/findings/${Uri.encodeComponent(findingId)}/reveal/availability',
      exceptionFnMap: _exceptionFns,
    );
    return GetSensitiveDataOccurrencesAvailabilityResponse.fromJson(response);
  }

  /// Retrieves the settings for the sensitivity inspection template for an
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  Future<GetSensitivityInspectionTemplateResponse>
      getSensitivityInspectionTemplate({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/templates/sensitivity-inspections/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSensitivityInspectionTemplateResponse.fromJson(response);
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

  /// Retrieves a subset of information about all the allow lists for an
  /// account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of a paginated
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListAllowListsResponse> listAllowLists({
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
      requestUri: '/allow-lists',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAllowListsResponse.fromJson(response);
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

  /// Retrieves a subset of information about the classification scope for an
  /// account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the classification scope to retrieve the unique identifier
  /// for.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListClassificationScopesResponse> listClassificationScopes({
    String? name,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/classification-scopes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListClassificationScopesResponse.fromJson(response);
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

  /// Retrieves information about the Amazon Macie membership invitations that
  /// were received by an account.
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

  /// Retrieves information about all the managed data identifiers that Amazon
  /// Macie currently provides.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListManagedDataIdentifiersResponse> listManagedDataIdentifiers({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/managed-data-identifiers/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedDataIdentifiersResponse.fromJson(response);
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
  /// account for an organization in Organizations.
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

  /// Retrieves information about objects that were selected from an S3 bucket
  /// for automated sensitive data discovery.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 bucket that the request applies
  /// to.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListResourceProfileArtifactsResponse> listResourceProfileArtifacts({
    required String resourceArn,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resource-profiles/artifacts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceProfileArtifactsResponse.fromJson(response);
  }

  /// Retrieves information about the types and amount of sensitive data that
  /// Amazon Macie found in an S3 bucket.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 bucket that the request applies
  /// to.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of a paginated
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListResourceProfileDetectionsResponse> listResourceProfileDetections({
    required String resourceArn,
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
      'resourceArn': [resourceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resource-profiles/detections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceProfileDetectionsResponse.fromJson(response);
  }

  /// Retrieves a subset of information about the sensitivity inspection
  /// template for an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to include in each page of a paginated
  /// response.
  ///
  /// Parameter [nextToken] :
  /// The nextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListSensitivityInspectionTemplatesResponse>
      listSensitivityInspectionTemplates({
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
      requestUri: '/templates/sensitivity-inspections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSensitivityInspectionTemplatesResponse.fromJson(response);
  }

  /// Retrieves the tags (keys and values) that are associated with an Amazon
  /// Macie resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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
  /// with an Amazon Macie resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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
  /// An array that lists specific character sequences (<i>ignore words</i>) to
  /// exclude from the results. If the text matched by the regular expression
  /// contains any string in this array, Amazon Macie ignores it. The array can
  /// contain as many as 10 ignore words. Each ignore word can contain 4-90
  /// UTF-8 characters. Ignore words are case sensitive.
  ///
  /// Parameter [keywords] :
  /// An array that lists specific character sequences (<i>keywords</i>), one of
  /// which must precede and be within proximity (maximumMatchDistance) of the
  /// regular expression to match. The array can contain as many as 50 keywords.
  /// Each keyword can contain 3-90 UTF-8 characters. Keywords aren't case
  /// sensitive.
  ///
  /// Parameter [maximumMatchDistance] :
  /// The maximum number of characters that can exist between the end of at
  /// least one complete character sequence specified by the keywords array and
  /// the end of the text that matches the regex pattern. If a complete keyword
  /// precedes all the text that matches the pattern and the keyword is within
  /// the specified distance, Amazon Macie includes the result. The distance can
  /// be 1-300 characters. The default value is 50.
  Future<TestCustomDataIdentifierResponse> testCustomDataIdentifier({
    required String regex,
    required String sampleText,
    List<String>? ignoreWords,
    List<String>? keywords,
    int? maximumMatchDistance,
  }) async {
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

  /// Removes one or more tags (keys and values) from an Amazon Macie resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// One or more tags (keys) to remove from the resource. In an HTTP request to
  /// remove multiple tags, append the tagKeys parameter and argument for each
  /// tag to remove, separated by an ampersand (&amp;).
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

  /// Updates the settings for an allow list.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [criteria] :
  /// The criteria that specify the text or text pattern to ignore. The criteria
  /// can be the location and name of an S3 object that lists specific text to
  /// ignore (s3WordsList), or a regular expression that defines a text pattern
  /// to ignore (regex).
  ///
  /// You can change a list's underlying criteria, such as the name of the S3
  /// object or the regular expression to use. However, you can't change the
  /// type from s3WordsList to regex or the other way around.
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  ///
  /// Parameter [name] :
  /// A custom name for the allow list. The name can contain as many as 128
  /// characters.
  ///
  /// Parameter [description] :
  /// A custom description of the allow list. The description can contain as
  /// many as 512 characters.
  Future<UpdateAllowListResponse> updateAllowList({
    required AllowListCriteria criteria,
    required String id,
    required String name,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'criteria': criteria,
      'name': name,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/allow-lists/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAllowListResponse.fromJson(response);
  }

  /// Enables or disables automated sensitive data discovery for an account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [status] :
  /// The new status of automated sensitive data discovery for the account.
  /// Valid values are: ENABLED, start or resume automated sensitive data
  /// discovery activities for the account; and, DISABLED, stop performing
  /// automated sensitive data discovery activities for the account.
  ///
  /// When you enable automated sensitive data discovery for the first time,
  /// Amazon Macie uses default configuration settings to determine which data
  /// sources to analyze and which managed data identifiers to use. To change
  /// these settings, use the UpdateClassificationScope and
  /// UpdateSensitivityInspectionTemplate operations, respectively. If you
  /// change the settings and subsequently disable the configuration, Amazon
  /// Macie retains your changes.
  Future<void> updateAutomatedDiscoveryConfiguration({
    required AutomatedDiscoveryStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/automated-discovery/configuration',
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

  /// Updates the classification scope settings for an account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  ///
  /// Parameter [s3] :
  /// The S3 buckets to add or remove from the exclusion list defined by the
  /// classification scope.
  Future<void> updateClassificationScope({
    required String id,
    S3ClassificationScopeUpdate? s3,
  }) async {
    final $payload = <String, dynamic>{
      if (s3 != null) 's3': s3,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/classification-scopes/${Uri.encodeComponent(id)}',
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  ///
  /// Parameter [action] :
  /// The action to perform on findings that match the filter criteria
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
  /// description of a filter. Other users of your account might be able to see
  /// this description, depending on the actions that they're allowed to perform
  /// in Amazon Macie.
  ///
  /// Parameter [findingCriteria] :
  /// The criteria to use to filter findings.
  ///
  /// Parameter [name] :
  /// A custom name for the filter. The name must contain at least 3 characters
  /// and can contain as many as 64 characters.
  ///
  /// We strongly recommend that you avoid including any sensitive data in the
  /// name of a filter. Other users of your account might be able to see this
  /// name, depending on the actions that they're allowed to perform in Amazon
  /// Macie.
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

  /// Suspends or re-enables Amazon Macie, or updates the configuration settings
  /// for a Macie account.
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
  /// (formerly Amazon CloudWatch Events).
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

  /// Enables an Amazon Macie administrator to suspend or re-enable Macie for a
  /// member account.
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
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  ///
  /// Parameter [status] :
  /// Specifies the new status for the account. Valid values are: ENABLED,
  /// resume all Amazon Macie activities for the account; and, PAUSED, suspend
  /// all Macie activities for the account.
  Future<void> updateMemberSession({
    required String id,
    required MacieStatus status,
  }) async {
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

  /// Updates the Amazon Macie configuration settings for an organization in
  /// Organizations.
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
  /// Specifies whether to enable Amazon Macie automatically for an account when
  /// the account is added to the organization in Organizations.
  Future<void> updateOrganizationConfiguration({
    required bool autoEnable,
  }) async {
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

  /// Updates the sensitivity score for an S3 bucket.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 bucket that the request applies
  /// to.
  ///
  /// Parameter [sensitivityScoreOverride] :
  /// The new sensitivity score for the bucket. Valid values are: 100, assign
  /// the maximum score and apply the <i>Sensitive</i> label to the bucket; and,
  /// null (empty), assign a score that Amazon Macie calculates automatically
  /// after you submit the request.
  Future<void> updateResourceProfile({
    required String resourceArn,
    int? sensitivityScoreOverride,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      if (sensitivityScoreOverride != null)
        'sensitivityScoreOverride': sensitivityScoreOverride,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/resource-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the sensitivity scoring settings for an S3 bucket.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the S3 bucket that the request applies
  /// to.
  ///
  /// Parameter [suppressDataIdentifiers] :
  /// An array of objects, one for each custom data identifier or managed data
  /// identifier that detected the type of sensitive data to start excluding or
  /// including in the bucket's score. To start including all sensitive data
  /// types in the score, don't specify any values for this array.
  Future<void> updateResourceProfileDetections({
    required String resourceArn,
    List<SuppressDataIdentifier>? suppressDataIdentifiers,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      if (suppressDataIdentifiers != null)
        'suppressDataIdentifiers': suppressDataIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/resource-profiles/detections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the status and configuration settings for retrieving occurrences
  /// of sensitive data reported by findings.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [configuration] :
  /// The KMS key to use to encrypt the sensitive data, and the status of the
  /// configuration for the Amazon Macie account.
  ///
  /// Parameter [retrievalConfiguration] :
  /// The access method and settings to use when retrieving the sensitive data.
  Future<UpdateRevealConfigurationResponse> updateRevealConfiguration({
    required RevealConfiguration configuration,
    UpdateRetrievalConfiguration? retrievalConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/reveal-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRevealConfigurationResponse.fromJson(response);
  }

  /// Updates the settings for the sensitivity inspection template for an
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [id] :
  /// The unique identifier for the Amazon Macie resource that the request
  /// applies to.
  ///
  /// Parameter [description] :
  /// A custom description of the template. The description can contain as many
  /// as 200 characters.
  ///
  /// Parameter [excludes] :
  /// The managed data identifiers to explicitly exclude (not use) when
  /// analyzing data.
  ///
  /// To exclude an allow list or custom data identifier that's currently
  /// included by the template, update the values for the
  /// SensitivityInspectionTemplateIncludes.allowListIds and
  /// SensitivityInspectionTemplateIncludes.customDataIdentifierIds properties,
  /// respectively.
  ///
  /// Parameter [includes] :
  /// The allow lists, custom data identifiers, and managed data identifiers to
  /// explicitly include (use) when analyzing data.
  Future<void> updateSensitivityInspectionTemplate({
    required String id,
    String? description,
    SensitivityInspectionTemplateExcludes? excludes,
    SensitivityInspectionTemplateIncludes? includes,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/templates/sensitivity-inspections/${Uri.encodeComponent(id)}',
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
/// for an organization in Organizations.
class AdminAccount {
  /// The Amazon Web Services account ID for the account.
  final String? accountId;

  /// The current status of the account as the delegated Amazon Macie
  /// administrator account for the organization.
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
/// account for an organization in Organizations. Possible values are:
enum AdminStatus {
  enabled,
  disablingInProgress,
}

extension AdminStatusValueExtension on AdminStatus {
  String toValue() {
    switch (this) {
      case AdminStatus.enabled:
        return 'ENABLED';
      case AdminStatus.disablingInProgress:
        return 'DISABLING_IN_PROGRESS';
    }
  }
}

extension AdminStatusFromString on String {
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

/// Specifies the criteria for an allow list. The criteria must specify a
/// regular expression (regex) or an S3 object (s3WordsList). It can't specify
/// both.
class AllowListCriteria {
  /// The regular expression (<i>regex</i>) that defines the text pattern to
  /// ignore. The expression can contain as many as 512 characters.
  final String? regex;

  /// The location and name of the S3 object that lists specific text to ignore.
  final S3WordsList? s3WordsList;

  AllowListCriteria({
    this.regex,
    this.s3WordsList,
  });

  factory AllowListCriteria.fromJson(Map<String, dynamic> json) {
    return AllowListCriteria(
      regex: json['regex'] as String?,
      s3WordsList: json['s3WordsList'] != null
          ? S3WordsList.fromJson(json['s3WordsList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final regex = this.regex;
    final s3WordsList = this.s3WordsList;
    return {
      if (regex != null) 'regex': regex,
      if (s3WordsList != null) 's3WordsList': s3WordsList,
    };
  }
}

/// Provides information about the current status of an allow list, which
/// indicates whether Amazon Macie can access and use the list's criteria.
class AllowListStatus {
  /// The current status of the allow list. If the list's criteria specify a
  /// regular expression (regex), this value is typically OK. Amazon Macie can
  /// compile the expression.
  ///
  /// If the list's criteria specify an S3 object, possible values are:
  ///
  /// <ul>
  /// <li>
  /// OK - Macie can retrieve and parse the contents of the object.
  /// </li>
  /// <li>
  /// S3_OBJECT_ACCESS_DENIED - Macie isn't allowed to access the object or the
  /// object is encrypted with a customer managed KMS key that Macie isn't allowed
  /// to use. Check the bucket policy and other permissions settings for the
  /// bucket and the object. If the object is encrypted, also ensure that it's
  /// encrypted with a key that Macie is allowed to use.
  /// </li>
  /// <li>
  /// S3_OBJECT_EMPTY - Macie can retrieve the object but the object doesn't
  /// contain any content. Ensure that the object contains the correct entries.
  /// Also ensure that the list's criteria specify the correct bucket and object
  /// names.
  /// </li>
  /// <li>
  /// S3_OBJECT_NOT_FOUND - The object doesn't exist in Amazon S3. Ensure that the
  /// list's criteria specify the correct bucket and object names.
  /// </li>
  /// <li>
  /// S3_OBJECT_OVERSIZE - Macie can retrieve the object. However, the object
  /// contains too many entries or its storage size exceeds the quota for an allow
  /// list. Try breaking the list into multiple files and ensure that each file
  /// doesn't exceed any quotas. Then configure list settings in Macie for each
  /// file.
  /// </li>
  /// <li>
  /// S3_THROTTLED - Amazon S3 throttled the request to retrieve the object. Wait
  /// a few minutes and then try again.
  /// </li>
  /// <li>
  /// S3_USER_ACCESS_DENIED - Amazon S3 denied the request to retrieve the object.
  /// If the specified object exists, you're not allowed to access it or it's
  /// encrypted with an KMS key that you're not allowed to use. Work with your
  /// Amazon Web Services administrator to ensure that the list's criteria specify
  /// the correct bucket and object names, and you have read access to the bucket
  /// and the object. If the object is encrypted, also ensure that it's encrypted
  /// with a key that you're allowed to use.
  /// </li>
  /// <li>
  /// UNKNOWN_ERROR - A transient or internal error occurred when Macie attempted
  /// to retrieve or parse the object. Wait a few minutes and then try again. A
  /// list can also have this status if it's encrypted with a key that Amazon S3
  /// and Macie can't access or use.
  /// </li>
  /// </ul>
  final AllowListStatusCode code;

  /// A brief description of the status of the allow list. Amazon Macie uses this
  /// value to provide additional information about an error that occurred when
  /// Macie tried to access and use the list's criteria.
  final String? description;

  AllowListStatus({
    required this.code,
    this.description,
  });

  factory AllowListStatus.fromJson(Map<String, dynamic> json) {
    return AllowListStatus(
      code: (json['code'] as String).toAllowListStatusCode(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final description = this.description;
    return {
      'code': code.toValue(),
      if (description != null) 'description': description,
    };
  }
}

/// Indicates the current status of an allow list. Depending on the type of
/// criteria that the list specifies, possible values are:
enum AllowListStatusCode {
  ok,
  s3ObjectNotFound,
  s3UserAccessDenied,
  s3ObjectAccessDenied,
  s3Throttled,
  s3ObjectOversize,
  s3ObjectEmpty,
  unknownError,
}

extension AllowListStatusCodeValueExtension on AllowListStatusCode {
  String toValue() {
    switch (this) {
      case AllowListStatusCode.ok:
        return 'OK';
      case AllowListStatusCode.s3ObjectNotFound:
        return 'S3_OBJECT_NOT_FOUND';
      case AllowListStatusCode.s3UserAccessDenied:
        return 'S3_USER_ACCESS_DENIED';
      case AllowListStatusCode.s3ObjectAccessDenied:
        return 'S3_OBJECT_ACCESS_DENIED';
      case AllowListStatusCode.s3Throttled:
        return 'S3_THROTTLED';
      case AllowListStatusCode.s3ObjectOversize:
        return 'S3_OBJECT_OVERSIZE';
      case AllowListStatusCode.s3ObjectEmpty:
        return 'S3_OBJECT_EMPTY';
      case AllowListStatusCode.unknownError:
        return 'UNKNOWN_ERROR';
    }
  }
}

extension AllowListStatusCodeFromString on String {
  AllowListStatusCode toAllowListStatusCode() {
    switch (this) {
      case 'OK':
        return AllowListStatusCode.ok;
      case 'S3_OBJECT_NOT_FOUND':
        return AllowListStatusCode.s3ObjectNotFound;
      case 'S3_USER_ACCESS_DENIED':
        return AllowListStatusCode.s3UserAccessDenied;
      case 'S3_OBJECT_ACCESS_DENIED':
        return AllowListStatusCode.s3ObjectAccessDenied;
      case 'S3_THROTTLED':
        return AllowListStatusCode.s3Throttled;
      case 'S3_OBJECT_OVERSIZE':
        return AllowListStatusCode.s3ObjectOversize;
      case 'S3_OBJECT_EMPTY':
        return AllowListStatusCode.s3ObjectEmpty;
      case 'UNKNOWN_ERROR':
        return AllowListStatusCode.unknownError;
    }
    throw Exception('$this is not known in enum AllowListStatusCode');
  }
}

/// Provides a subset of information about an allow list.
class AllowListSummary {
  /// The Amazon Resource Name (ARN) of the allow list.
  final String? arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the allow list
  /// was created in Amazon Macie.
  final DateTime? createdAt;

  /// The custom description of the allow list.
  final String? description;

  /// The unique identifier for the allow list.
  final String? id;

  /// The custom name of the allow list.
  final String? name;

  /// The date and time, in UTC and extended ISO 8601 format, when the allow
  /// list's settings were most recently changed in Amazon Macie.
  final DateTime? updatedAt;

  AllowListSummary({
    this.arn,
    this.createdAt,
    this.description,
    this.id,
    this.name,
    this.updatedAt,
  });

  factory AllowListSummary.fromJson(Map<String, dynamic> json) {
    return AllowListSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

enum AllowsUnencryptedObjectUploads {
  $true,
  $false,
  unknown,
}

extension AllowsUnencryptedObjectUploadsValueExtension
    on AllowsUnencryptedObjectUploads {
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

extension AllowsUnencryptedObjectUploadsFromString on String {
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

/// The status of the automated sensitive data discovery configuration for an
/// Amazon Macie account. Valid values are:
enum AutomatedDiscoveryStatus {
  enabled,
  disabled,
}

extension AutomatedDiscoveryStatusValueExtension on AutomatedDiscoveryStatus {
  String toValue() {
    switch (this) {
      case AutomatedDiscoveryStatus.enabled:
        return 'ENABLED';
      case AutomatedDiscoveryStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension AutomatedDiscoveryStatusFromString on String {
  AutomatedDiscoveryStatus toAutomatedDiscoveryStatus() {
    switch (this) {
      case 'ENABLED':
        return AutomatedDiscoveryStatus.enabled;
      case 'DISABLED':
        return AutomatedDiscoveryStatus.disabled;
    }
    throw Exception('$this is not known in enum AutomatedDiscoveryStatus');
  }
}

/// Specifies whether occurrences of sensitive data can be retrieved for a
/// finding. Possible values are:
enum AvailabilityCode {
  available,
  unavailable,
}

extension AvailabilityCodeValueExtension on AvailabilityCode {
  String toValue() {
    switch (this) {
      case AvailabilityCode.available:
        return 'AVAILABLE';
      case AvailabilityCode.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension AvailabilityCodeFromString on String {
  AvailabilityCode toAvailabilityCode() {
    switch (this) {
      case 'AVAILABLE':
        return AvailabilityCode.available;
      case 'UNAVAILABLE':
        return AvailabilityCode.unavailable;
    }
    throw Exception('$this is not known in enum AvailabilityCode');
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
  /// An array of objects, one for each custom data identifier that matches the
  /// criteria specified in the request.
  final List<BatchGetCustomDataIdentifierSummary>? customDataIdentifiers;

  /// An array of custom data identifier IDs, one for each custom data identifier
  /// that was specified in the request but doesn't correlate to an existing
  /// custom data identifier.
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
/// bucket. These settings can apply to a bucket at the account or bucket level.
/// For detailed information about each setting, see <a
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
/// accessible due to a combination of permissions settings for each bucket.
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

/// Provides information about the number of S3 buckets whose settings do or
/// don't specify default server-side encryption behavior for objects that are
/// added to the buckets. For detailed information about these settings, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-encryption.html">Setting
/// default server-side encryption behavior for Amazon S3 buckets</a> in the
/// <i>Amazon Simple Storage Service User Guide</i>.
class BucketCountByEncryptionType {
  /// The total number of buckets whose default encryption settings are configured
  /// to encrypt new objects with an KMS key, either an Amazon Web Services
  /// managed key or a customer managed key. By default, these buckets encrypt new
  /// objects automatically using DSSE-KMS or SSE-KMS encryption.
  final int? kmsManaged;

  /// The total number of buckets whose default encryption settings are configured
  /// to encrypt new objects with an Amazon S3 managed key. By default, these
  /// buckets encrypt new objects automatically using SSE-S3 encryption.
  final int? s3Managed;

  /// The total number of buckets that don't specify default server-side
  /// encryption behavior for new objects. Default encryption settings aren't
  /// configured for these buckets.
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
/// shared with other Amazon Web Services accounts, Amazon CloudFront origin
/// access identities (OAIs), or CloudFront origin access controls (OACs). In
/// this data, an <i>Amazon Macie organization</i> is defined as a set of Macie
/// accounts that are centrally managed as a group of related accounts through
/// Organizations or by Macie invitation.
class BucketCountBySharedAccessType {
  /// The total number of buckets that are shared with one or more of the
  /// following or any combination of the following: an Amazon CloudFront OAI, a
  /// CloudFront OAC, or an Amazon Web Services account that isn't in the same
  /// Amazon Macie organization.
  final int? external;

  /// The total number of buckets that are shared with one or more Amazon Web
  /// Services accounts in the same Amazon Macie organization. These buckets
  /// aren't shared with Amazon CloudFront OAIs or OACs.
  final int? internal;

  /// The total number of buckets that aren't shared with other Amazon Web
  /// Services accounts, Amazon CloudFront OAIs, or CloudFront OACs.
  final int? notShared;

  /// The total number of buckets that Amazon Macie wasn't able to evaluate shared
  /// access settings for. Macie can't determine whether these buckets are shared
  /// with other Amazon Web Services accounts, Amazon CloudFront OAIs, or
  /// CloudFront OACs.
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
/// or don't require server-side encryption of objects when objects are added to
/// the buckets.
class BucketCountPolicyAllowsUnencryptedObjectUploads {
  /// The total number of buckets that don't have a bucket policy or have a bucket
  /// policy that doesn't require server-side encryption of new objects. If a
  /// bucket policy exists, the policy doesn't require PutObject requests to
  /// include a valid server-side encryption header: the
  /// x-amz-server-side-encryption header with a value of AES256 or aws:kms, or
  /// the x-amz-server-side-encryption-customer-algorithm header with a value of
  /// AES256.
  final int? allowsUnencryptedObjectUploads;

  /// The total number of buckets whose bucket policies require server-side
  /// encryption of new objects. PutObject requests for these buckets must include
  /// a valid server-side encryption header: the x-amz-server-side-encryption
  /// header with a value of AES256 or aws:kms, or the
  /// x-amz-server-side-encryption-customer-algorithm header with a value of
  /// AES256.
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
  /// specify multiple values, Amazon Macie uses OR logic to join the values.
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

/// Provides statistical data and other information about an S3 bucket that
/// Amazon Macie monitors and analyzes for your account. By default, object
/// count and storage size values include data for object parts that are the
/// result of incomplete multipart uploads. For more information, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/monitoring-s3-how-it-works.html">How
/// Macie monitors Amazon S3 data security</a> in the <i>Amazon Macie User
/// Guide</i>.
///
/// If an error occurs when Macie attempts to retrieve and process metadata from
/// Amazon S3 for the bucket or the bucket's objects, the value for the
/// versioning property is false and the value for most other properties is
/// null. Key exceptions are accountId, bucketArn, bucketCreatedAt, bucketName,
/// lastUpdated, and region. To identify the cause of the error, refer to the
/// errorCode and errorMessage values.
class BucketMetadata {
  /// The unique identifier for the Amazon Web Services account that owns the
  /// bucket.
  final String? accountId;

  /// Specifies whether the bucket policy for the bucket requires server-side
  /// encryption of objects when objects are added to the bucket. Possible values
  /// are:
  ///
  /// <ul>
  /// <li>
  /// FALSE - The bucket policy requires server-side encryption of new objects.
  /// PutObject requests must include a valid server-side encryption header.
  /// </li>
  /// <li>
  /// TRUE - The bucket doesn't have a bucket policy or it has a bucket policy
  /// that doesn't require server-side encryption of new objects. If a bucket
  /// policy exists, it doesn't require PutObject requests to include a valid
  /// server-side encryption header.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie can't determine whether the bucket policy requires
  /// server-side encryption of new objects.
  /// </li>
  /// </ul>
  /// Valid server-side encryption headers are: x-amz-server-side-encryption with
  /// a value of AES256 or aws:kms, and
  /// x-amz-server-side-encryption-customer-algorithm with a value of AES256.
  final AllowsUnencryptedObjectUploads? allowsUnencryptedObjectUploads;

  /// The Amazon Resource Name (ARN) of the bucket.
  final String? bucketArn;

  /// The date and time, in UTC and extended ISO 8601 format, when the bucket was
  /// created. This value can also indicate when changes such as edits to the
  /// bucket's policy were most recently made to the bucket.
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

  /// The error code for an error that prevented Amazon Macie from retrieving and
  /// processing information about the bucket and the bucket's objects. If this
  /// value is ACCESS_DENIED, Macie doesn't have permission to retrieve the
  /// information. For example, the bucket has a restrictive bucket policy and
  /// Amazon S3 denied the request. If this value is null, Macie was able to
  /// retrieve and process the information.
  final BucketMetadataErrorCode? errorCode;

  /// A brief description of the error (errorCode) that prevented Amazon Macie
  /// from retrieving and processing information about the bucket and the bucket's
  /// objects. This value is null if Macie was able to retrieve and process the
  /// information.
  final String? errorMessage;

  /// Specifies whether any one-time or recurring classification jobs are
  /// configured to analyze data in the bucket, and, if so, the details of the job
  /// that ran most recently.
  final JobDetails? jobDetails;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently analyzed data in the bucket while performing automated
  /// sensitive data discovery for your account. This value is null if automated
  /// sensitive data discovery is currently disabled for your account.
  final DateTime? lastAutomatedDiscoveryTime;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently retrieved bucket or object metadata from Amazon S3 for the
  /// bucket.
  final DateTime? lastUpdated;

  /// The total number of objects in the bucket.
  final int? objectCount;

  /// The total number of objects in the bucket, grouped by server-side encryption
  /// type. This includes a grouping that reports the total number of objects that
  /// aren't encrypted or use client-side encryption.
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

  /// The sensitivity score for the bucket, ranging from -1 (classification error)
  /// to 100 (sensitive). This value is null if automated sensitive data discovery
  /// is currently disabled for your account.
  final int? sensitivityScore;

  /// The default server-side encryption settings for the bucket.
  final BucketServerSideEncryption? serverSideEncryption;

  /// Specifies whether the bucket is shared with another Amazon Web Services
  /// account, an Amazon CloudFront origin access identity (OAI), or a CloudFront
  /// origin access control (OAC). Possible values are:
  ///
  /// <ul>
  /// <li>
  /// EXTERNAL - The bucket is shared with one or more of the following or any
  /// combination of the following: a CloudFront OAI, a CloudFront OAC, or an
  /// Amazon Web Services account that isn't part of your Amazon Macie
  /// organization.
  /// </li>
  /// <li>
  /// INTERNAL - The bucket is shared with one or more Amazon Web Services
  /// accounts that are part of your Amazon Macie organization. It isn't shared
  /// with a CloudFront OAI or OAC.
  /// </li>
  /// <li>
  /// NOT_SHARED - The bucket isn't shared with another Amazon Web Services
  /// account, a CloudFront OAI, or a CloudFront OAC.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie wasn't able to evaluate the shared access settings
  /// for the bucket.
  /// </li>
  /// </ul>
  /// An <i>Amazon Macie organization</i> is a set of Macie accounts that are
  /// centrally managed as a group of related accounts through Organizations or by
  /// Macie invitation.
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
  /// If versioning is enabled for the bucket, Amazon Macie calculates this value
  /// based on the size of the latest version of each applicable object in the
  /// bucket. This value doesn't reflect the storage size of all versions of each
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
    this.errorCode,
    this.errorMessage,
    this.jobDetails,
    this.lastAutomatedDiscoveryTime,
    this.lastUpdated,
    this.objectCount,
    this.objectCountByEncryptionType,
    this.publicAccess,
    this.region,
    this.replicationDetails,
    this.sensitivityScore,
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
      errorCode: (json['errorCode'] as String?)?.toBucketMetadataErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      jobDetails: json['jobDetails'] != null
          ? JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>)
          : null,
      lastAutomatedDiscoveryTime:
          timeStampFromJson(json['lastAutomatedDiscoveryTime']),
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
      sensitivityScore: json['sensitivityScore'] as int?,
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
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final jobDetails = this.jobDetails;
    final lastAutomatedDiscoveryTime = this.lastAutomatedDiscoveryTime;
    final lastUpdated = this.lastUpdated;
    final objectCount = this.objectCount;
    final objectCountByEncryptionType = this.objectCountByEncryptionType;
    final publicAccess = this.publicAccess;
    final region = this.region;
    final replicationDetails = this.replicationDetails;
    final sensitivityScore = this.sensitivityScore;
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
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (lastAutomatedDiscoveryTime != null)
        'lastAutomatedDiscoveryTime': iso8601ToJson(lastAutomatedDiscoveryTime),
      if (lastUpdated != null) 'lastUpdated': iso8601ToJson(lastUpdated),
      if (objectCount != null) 'objectCount': objectCount,
      if (objectCountByEncryptionType != null)
        'objectCountByEncryptionType': objectCountByEncryptionType,
      if (publicAccess != null) 'publicAccess': publicAccess,
      if (region != null) 'region': region,
      if (replicationDetails != null) 'replicationDetails': replicationDetails,
      if (sensitivityScore != null) 'sensitivityScore': sensitivityScore,
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

/// The error code for an error that prevented Amazon Macie from retrieving and
/// processing metadata from Amazon S3 for an S3 bucket and the bucket's
/// objects.
enum BucketMetadataErrorCode {
  accessDenied,
}

extension BucketMetadataErrorCodeValueExtension on BucketMetadataErrorCode {
  String toValue() {
    switch (this) {
      case BucketMetadataErrorCode.accessDenied:
        return 'ACCESS_DENIED';
    }
  }
}

extension BucketMetadataErrorCodeFromString on String {
  BucketMetadataErrorCode toBucketMetadataErrorCode() {
    switch (this) {
      case 'ACCESS_DENIED':
        return BucketMetadataErrorCode.accessDenied;
    }
    throw Exception('$this is not known in enum BucketMetadataErrorCode');
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
  /// The Amazon Resource Name (ARN) or unique identifier (key ID) for the KMS key
  /// that's used by default to encrypt objects that are added to the bucket. This
  /// value is null if the bucket is configured to use an Amazon S3 managed key to
  /// encrypt new objects.
  final String? kmsMasterKeyId;

  /// The server-side encryption algorithm that's used by default to encrypt
  /// objects that are added to the bucket. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// AES256 - New objects use SSE-S3 encryption. They're encrypted with an Amazon
  /// S3 managed key.
  /// </li>
  /// <li>
  /// aws:kms - New objects use SSE-KMS encryption. They're encrypted with an KMS
  /// key (kmsMasterKeyId), either an Amazon Web Services managed key or a
  /// customer managed key.
  /// </li>
  /// <li>
  /// aws:kms:dsse - New objects use DSSE-KMS encryption. They're encrypted with
  /// an KMS key (kmsMasterKeyId), either an Amazon Web Services managed key or a
  /// customer managed key.
  /// </li>
  /// <li>
  /// NONE - The bucket's default encryption settings don't specify server-side
  /// encryption behavior for new objects.
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
  /// classifiableSizeInBytes, objectCount, sensitivityScore, or sizeInBytes.
  final String? attributeName;

  /// The sort order to apply to the results, based on the value specified by the
  /// attributeName property. Valid values are: ASC, sort the results in ascending
  /// order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  BucketSortCriteria({
    this.attributeName,
    this.orderBy,
  });

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName,
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// Provides aggregated statistical data for sensitive data discovery metrics
/// that apply to S3 buckets, grouped by bucket sensitivity score
/// (sensitivityScore). If automated sensitive data discovery is currently
/// disabled for your account, the value for each metric is 0.
class BucketStatisticsBySensitivity {
  /// The aggregated statistical data for all buckets that have a sensitivity
  /// score of -1.
  final SensitivityAggregations? classificationError;

  /// The aggregated statistical data for all buckets that have a sensitivity
  /// score of 50.
  final SensitivityAggregations? notClassified;

  /// The aggregated statistical data for all buckets that have a sensitivity
  /// score of 1-49.
  final SensitivityAggregations? notSensitive;

  /// The aggregated statistical data for all buckets that have a sensitivity
  /// score of 51-100.
  final SensitivityAggregations? sensitive;

  BucketStatisticsBySensitivity({
    this.classificationError,
    this.notClassified,
    this.notSensitive,
    this.sensitive,
  });

  factory BucketStatisticsBySensitivity.fromJson(Map<String, dynamic> json) {
    return BucketStatisticsBySensitivity(
      classificationError: json['classificationError'] != null
          ? SensitivityAggregations.fromJson(
              json['classificationError'] as Map<String, dynamic>)
          : null,
      notClassified: json['notClassified'] != null
          ? SensitivityAggregations.fromJson(
              json['notClassified'] as Map<String, dynamic>)
          : null,
      notSensitive: json['notSensitive'] != null
          ? SensitivityAggregations.fromJson(
              json['notSensitive'] as Map<String, dynamic>)
          : null,
      sensitive: json['sensitive'] != null
          ? SensitivityAggregations.fromJson(
              json['sensitive'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final classificationError = this.classificationError;
    final notClassified = this.notClassified;
    final notSensitive = this.notSensitive;
    final sensitive = this.sensitive;
    return {
      if (classificationError != null)
        'classificationError': classificationError,
      if (notClassified != null) 'notClassified': notClassified,
      if (notSensitive != null) 'notSensitive': notSensitive,
      if (sensitive != null) 'sensitive': sensitive,
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

/// Provides information about a sensitive data finding and the details of the
/// finding.
class ClassificationDetails {
  /// The path to the folder or file in Amazon S3 that contains the corresponding
  /// sensitive data discovery result for the finding. If a finding applies to a
  /// large archive or compressed file, this value is the path to a folder.
  /// Otherwise, this value is the path to a file.
  final String? detailedResultsLocation;

  /// The Amazon Resource Name (ARN) of the classification job that produced the
  /// finding. This value is null if the origin of the finding (originType) is
  /// AUTOMATED_SENSITIVE_DATA_DISCOVERY.
  final String? jobArn;

  /// The unique identifier for the classification job that produced the finding.
  /// This value is null if the origin of the finding (originType) is
  /// AUTOMATED_SENSITIVE_DATA_DISCOVERY.
  final String? jobId;

  /// Specifies how Amazon Macie found the sensitive data that produced the
  /// finding. Possible values are: SENSITIVE_DATA_DISCOVERY_JOB, for a
  /// classification job; and, AUTOMATED_SENSITIVE_DATA_DISCOVERY, for automated
  /// sensitive data discovery.
  final OriginType? originType;

  /// The status and other details of the finding.
  final ClassificationResult? result;

  ClassificationDetails({
    this.detailedResultsLocation,
    this.jobArn,
    this.jobId,
    this.originType,
    this.result,
  });

  factory ClassificationDetails.fromJson(Map<String, dynamic> json) {
    return ClassificationDetails(
      detailedResultsLocation: json['detailedResultsLocation'] as String?,
      jobArn: json['jobArn'] as String?,
      jobId: json['jobId'] as String?,
      originType: (json['originType'] as String?)?.toOriginType(),
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
    final originType = this.originType;
    final result = this.result;
    return {
      if (detailedResultsLocation != null)
        'detailedResultsLocation': detailedResultsLocation,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobId != null) 'jobId': jobId,
      if (originType != null) 'originType': originType.toValue(),
      if (result != null) 'result': result,
    };
  }
}

/// Specifies where to store data classification results, and the encryption
/// settings to use when storing results in that location. The location must be
/// an S3 bucket.
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
  /// (classificationDetails.detailedResultsLocation).
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
  /// applies to. For example, the object is a file that uses an unsupported
  /// format.
  /// </li>
  /// </ul>
  final String? code;

  /// A brief description of the status of the finding. This value is null if the
  /// status (code) of the finding is COMPLETE.
  ///
  /// Amazon Macie uses this value to notify you of any errors, warnings, or
  /// considerations that might impact your analysis of the finding and the
  /// affected S3 object. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// ARCHIVE_CONTAINS_UNPROCESSED_FILES - The object is an archive file and Macie
  /// extracted and analyzed only some or none of the files in the archive. To
  /// determine which files Macie analyzed, if any, refer to the corresponding
  /// sensitive data discovery result for the finding
  /// (classificationDetails.detailedResultsLocation).
  /// </li>
  /// <li>
  /// ARCHIVE_EXCEEDS_SIZE_LIMIT - The object is an archive file whose total
  /// storage size exceeds the size quota for this type of archive.
  /// </li>
  /// <li>
  /// ARCHIVE_NESTING_LEVEL_OVER_LIMIT - The object is an archive file whose
  /// nested depth exceeds the quota for the maximum number of nested levels that
  /// Macie analyzes for this type of archive.
  /// </li>
  /// <li>
  /// ARCHIVE_TOTAL_BYTES_EXTRACTED_OVER_LIMIT - The object is an archive file
  /// that exceeds the quota for the maximum amount of data that Macie extracts
  /// and analyzes for this type of archive.
  /// </li>
  /// <li>
  /// ARCHIVE_TOTAL_DOCUMENTS_PROCESSED_OVER_LIMIT - The object is an archive file
  /// that contains more than the maximum number of files that Macie extracts and
  /// analyzes for this type of archive.
  /// </li>
  /// <li>
  /// FILE_EXCEEDS_SIZE_LIMIT - The storage size of the object exceeds the size
  /// quota for this type of file.
  /// </li>
  /// <li>
  /// INVALID_ENCRYPTION - The object is encrypted using server-side encryption
  /// but Macie isn't allowed to use the key. Macie can't decrypt and analyze the
  /// object.
  /// </li>
  /// <li>
  /// INVALID_KMS_KEY - The object is encrypted with an KMS key that was disabled
  /// or is being deleted. Macie can't decrypt and analyze the object.
  /// </li>
  /// <li>
  /// INVALID_OBJECT_STATE - The object doesn't use a supported Amazon S3 storage
  /// class.
  /// </li>
  /// <li>
  /// JSON_NESTING_LEVEL_OVER_LIMIT - The object contains JSON data and the nested
  /// depth of the data exceeds the quota for the number of nested levels that
  /// Macie analyzes for this type of file.
  /// </li>
  /// <li>
  /// MALFORMED_FILE - The object is a malformed or corrupted file. An error
  /// occurred when Macie attempted to detect the file's type or extract data from
  /// the file.
  /// </li>
  /// <li>
  /// MALFORMED_OR_FILE_SIZE_EXCEEDS_LIMIT - The object is a Microsoft Office file
  /// that is malformed or exceeds the size quota for this type of file. If the
  /// file is malformed, an error occurred when Macie attempted to extract data
  /// from the file.
  /// </li>
  /// <li>
  /// NO_SUCH_BUCKET_AVAILABLE - The object was in a bucket that was deleted
  /// shortly before or when Macie attempted to analyze the object.
  /// </li>
  /// <li>
  /// OBJECT_VERSION_MISMATCH - The object was changed while Macie was analyzing
  /// it.
  /// </li>
  /// <li>
  /// OOXML_UNCOMPRESSED_RATIO_EXCEEDS_LIMIT - The object is an Office Open XML
  /// file whose compression ratio exceeds the compression quota for this type of
  /// file.
  /// </li>
  /// <li>
  /// OOXML_UNCOMPRESSED_SIZE_EXCEEDS_LIMIT - The object is an Office Open XML
  /// file that exceeds the size quota for this type of file.
  /// </li>
  /// <li>
  /// PERMISSION_DENIED - Macie isn't allowed to access the object. The object's
  /// permissions settings prevent Macie from analyzing the object.
  /// </li>
  /// <li>
  /// SOURCE_OBJECT_NO_LONGER_AVAILABLE - The object was deleted shortly before or
  /// when Macie attempted to analyze it.
  /// </li>
  /// <li>
  /// TIME_CUT_OFF_REACHED - Macie started analyzing the object but additional
  /// analysis would exceed the time quota for analyzing an object.
  /// </li>
  /// <li>
  /// UNABLE_TO_PARSE_FILE - The object is a file that contains structured data
  /// and an error occurred when Macie attempted to parse the data.
  /// </li>
  /// <li>
  /// UNSUPPORTED_FILE_TYPE_EXCEPTION - The object is a file that uses an
  /// unsupported file or storage format.
  /// </li>
  /// </ul>
  /// For information about quotas, supported storage classes, and supported file
  /// and storage formats, see <a
  /// href="https://docs.aws.amazon.com/macie/latest/user/macie-quotas.html">Quotas</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/macie/latest/user/discovery-supported-storage.html">Supported
  /// storage classes and formats</a> in the <i>Amazon Macie User Guide</i>.
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

/// Provides information about the classification scope for an Amazon Macie
/// account. Macie uses the scope's settings when it performs automated
/// sensitive data discovery for the account.
class ClassificationScopeSummary {
  /// The unique identifier for the classification scope.
  final String? id;

  /// The name of the classification scope: automated-sensitive-data-discovery.
  final String? name;

  ClassificationScopeSummary({
    this.id,
    this.name,
  });

  factory ClassificationScopeSummary.fromJson(Map<String, dynamic> json) {
    return ClassificationScopeSummary(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// Specifies how to apply changes to the S3 bucket exclusion list defined by
/// the classification scope for an Amazon Macie account. Valid values are:
enum ClassificationScopeUpdateOperation {
  add,
  replace,
  remove,
}

extension ClassificationScopeUpdateOperationValueExtension
    on ClassificationScopeUpdateOperation {
  String toValue() {
    switch (this) {
      case ClassificationScopeUpdateOperation.add:
        return 'ADD';
      case ClassificationScopeUpdateOperation.replace:
        return 'REPLACE';
      case ClassificationScopeUpdateOperation.remove:
        return 'REMOVE';
    }
  }
}

extension ClassificationScopeUpdateOperationFromString on String {
  ClassificationScopeUpdateOperation toClassificationScopeUpdateOperation() {
    switch (this) {
      case 'ADD':
        return ClassificationScopeUpdateOperation.add;
      case 'REPLACE':
        return ClassificationScopeUpdateOperation.replace;
      case 'REMOVE':
        return ClassificationScopeUpdateOperation.remove;
    }
    throw Exception(
        '$this is not known in enum ClassificationScopeUpdateOperation');
  }
}

class CreateAllowListResponse {
  /// The Amazon Resource Name (ARN) of the allow list.
  final String? arn;

  /// The unique identifier for the allow list.
  final String? id;

  CreateAllowListResponse({
    this.arn,
    this.id,
  });

  factory CreateAllowListResponse.fromJson(Map<String, dynamic> json) {
    return CreateAllowListResponse(
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

extension CurrencyValueExtension on Currency {
  String toValue() {
    switch (this) {
      case Currency.usd:
        return 'USD';
    }
  }
}

extension CurrencyFromString on String {
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
  /// The unique identifier for the custom data identifier.
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

/// The severity of a finding, ranging from LOW, for least severe, to HIGH, for
/// most severe. Valid values are:
enum DataIdentifierSeverity {
  low,
  medium,
  high,
}

extension DataIdentifierSeverityValueExtension on DataIdentifierSeverity {
  String toValue() {
    switch (this) {
      case DataIdentifierSeverity.low:
        return 'LOW';
      case DataIdentifierSeverity.medium:
        return 'MEDIUM';
      case DataIdentifierSeverity.high:
        return 'HIGH';
    }
  }
}

extension DataIdentifierSeverityFromString on String {
  DataIdentifierSeverity toDataIdentifierSeverity() {
    switch (this) {
      case 'LOW':
        return DataIdentifierSeverity.low;
      case 'MEDIUM':
        return DataIdentifierSeverity.medium;
      case 'HIGH':
        return DataIdentifierSeverity.high;
    }
    throw Exception('$this is not known in enum DataIdentifierSeverity');
  }
}

/// The type of data identifier that detected a specific type of sensitive data
/// in an S3 bucket. Possible values are:
enum DataIdentifierType {
  custom,
  managed,
}

extension DataIdentifierTypeValueExtension on DataIdentifierType {
  String toValue() {
    switch (this) {
      case DataIdentifierType.custom:
        return 'CUSTOM';
      case DataIdentifierType.managed:
        return 'MANAGED';
    }
  }
}

extension DataIdentifierTypeFromString on String {
  DataIdentifierType toDataIdentifierType() {
    switch (this) {
      case 'CUSTOM':
        return DataIdentifierType.custom;
      case 'MANAGED':
        return DataIdentifierType.managed;
    }
    throw Exception('$this is not known in enum DataIdentifierType');
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

extension DayOfWeekValueExtension on DayOfWeek {
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

extension DayOfWeekFromString on String {
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

/// Provides information about a type of sensitive data that was detected by a
/// managed data identifier and produced a sensitive data finding.
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

class DeleteAllowListResponse {
  DeleteAllowListResponse();

  factory DeleteAllowListResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAllowListResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
  /// An array of objects, one for each bucket that matches the filter criteria
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
  /// An array of unique identifiers, one for each allow list that the job uses
  /// when it analyzes data.
  final List<String>? allowListIds;

  /// The token that was provided to ensure the idempotency of the request to
  /// create the job.
  final String? clientToken;

  /// The date and time, in UTC and extended ISO 8601 format, when the job was
  /// created.
  final DateTime? createdAt;

  /// An array of unique identifiers, one for each custom data identifier that the
  /// job uses when it analyzes data. This value is null if the job uses only
  /// managed data identifiers to analyze data.
  final List<String>? customDataIdentifierIds;

  /// The custom description of the job.
  final String? description;

  /// For a recurring job, specifies whether you configured the job to analyze all
  /// existing, eligible objects immediately after the job was created (true). If
  /// you configured the job to analyze only those objects that were created or
  /// changed after the job was created and before the job's first scheduled run,
  /// this value is false. This value is also false for a one-time job.
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
  /// PAUSED - Macie started running the job but additional processing would
  /// exceed the monthly sensitive data discovery quota for your account or one or
  /// more member accounts that the job analyzes data for.
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
  /// recent run started or, if the job hasn't run yet, when the job was created.
  final DateTime? lastRunTime;

  /// An array of unique identifiers, one for each managed data identifier that
  /// the job is explicitly configured to include (use) or exclude (not use) when
  /// it analyzes data. Inclusion or exclusion depends on the managed data
  /// identifier selection type specified for the job
  /// (managedDataIdentifierSelector).
  ///
  /// This value is null if the job's managed data identifier selection type is
  /// ALL, NONE, or RECOMMENDED.
  final List<String>? managedDataIdentifierIds;

  /// The selection type that determines which managed data identifiers the job
  /// uses when it analyzes data. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// ALL - Use all managed data identifiers.
  /// </li>
  /// <li>
  /// EXCLUDE - Use all managed data identifiers except the ones specified by the
  /// managedDataIdentifierIds property.
  /// </li>
  /// <li>
  /// INCLUDE - Use only the managed data identifiers specified by the
  /// managedDataIdentifierIds property.
  /// </li>
  /// <li>
  /// NONE - Don't use any managed data identifiers. Use only custom data
  /// identifiers (customDataIdentifierIds).
  /// </li>
  /// <li>
  /// RECOMMENDED (default) - Use the recommended set of managed data identifiers.
  /// </li>
  /// </ul>
  /// If this value is null, the job uses the recommended set of managed data
  /// identifiers.
  ///
  /// If the job is a recurring job and this value is ALL or EXCLUDE, each job run
  /// automatically uses new managed data identifiers that are released. If this
  /// value is null or RECOMMENDED for a recurring job, each job run uses all the
  /// managed data identifiers that are in the recommended set when the run
  /// starts.
  ///
  /// For information about individual managed data identifiers or to determine
  /// which ones are in the recommended set, see <a
  /// href="https://docs.aws.amazon.com/macie/latest/user/managed-data-identifiers.html">Using
  /// managed data identifiers</a> and <a
  /// href="https://docs.aws.amazon.com/macie/latest/user/discovery-jobs-mdis-recommended.html">Recommended
  /// managed data identifiers</a> in the <i>Amazon Macie User Guide</i>.
  final ManagedDataIdentifierSelector? managedDataIdentifierSelector;

  /// The custom name of the job.
  final String? name;

  /// The S3 buckets that contain the objects to analyze, and the scope of that
  /// analysis.
  final S3JobDefinition? s3JobDefinition;

  /// The sampling depth, as a percentage, that determines the percentage of
  /// eligible objects that the job analyzes.
  final int? samplingPercentage;

  /// The recurrence pattern for running the job. This value is null if the job is
  /// configured to run only once.
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
    this.allowListIds,
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
    this.managedDataIdentifierIds,
    this.managedDataIdentifierSelector,
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
      allowListIds: (json['allowListIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      managedDataIdentifierIds: (json['managedDataIdentifierIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      managedDataIdentifierSelector:
          (json['managedDataIdentifierSelector'] as String?)
              ?.toManagedDataIdentifierSelector(),
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
    final allowListIds = this.allowListIds;
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
    final managedDataIdentifierIds = this.managedDataIdentifierIds;
    final managedDataIdentifierSelector = this.managedDataIdentifierSelector;
    final name = this.name;
    final s3JobDefinition = this.s3JobDefinition;
    final samplingPercentage = this.samplingPercentage;
    final scheduleFrequency = this.scheduleFrequency;
    final statistics = this.statistics;
    final tags = this.tags;
    final userPausedDetails = this.userPausedDetails;
    return {
      if (allowListIds != null) 'allowListIds': allowListIds,
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
      if (managedDataIdentifierIds != null)
        'managedDataIdentifierIds': managedDataIdentifierIds,
      if (managedDataIdentifierSelector != null)
        'managedDataIdentifierSelector':
            managedDataIdentifierSelector.toValue(),
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
  /// are added to the organization.
  final bool? autoEnable;

  /// Specifies whether the maximum number of Amazon Macie member accounts are
  /// part of the organization.
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

/// Specifies 1-10 occurrences of a specific type of sensitive data reported by
/// a finding.
class DetectedDataDetails {
  /// An occurrence of the specified type of sensitive data. Each occurrence
  /// contains 1-128 characters.
  final String value;

  DetectedDataDetails({
    required this.value,
  });

  factory DetectedDataDetails.fromJson(Map<String, dynamic> json) {
    return DetectedDataDetails(
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// Provides information about a type of sensitive data that Amazon Macie found
/// in an S3 bucket while performing automated sensitive data discovery for the
/// bucket. The information also specifies the custom data identifier or managed
/// data identifier that detected the data. This information is available only
/// if automated sensitive data discovery is currently enabled for your account.
class Detection {
  /// If the sensitive data was detected by a custom data identifier, the Amazon
  /// Resource Name (ARN) of the custom data identifier that detected the data.
  /// Otherwise, this value is null.
  final String? arn;

  /// The total number of occurrences of the sensitive data.
  final int? count;

  /// The unique identifier for the custom data identifier or managed data
  /// identifier that detected the sensitive data. For additional details about a
  /// specified managed data identifier, see <a
  /// href="https://docs.aws.amazon.com/macie/latest/user/managed-data-identifiers.html">Using
  /// managed data identifiers</a> in the <i>Amazon Macie User Guide</i>.
  final String? id;

  /// The name of the custom data identifier or managed data identifier that
  /// detected the sensitive data. For a managed data identifier, this value is
  /// the same as the unique identifier (id).
  final String? name;

  /// Specifies whether occurrences of this type of sensitive data are excluded
  /// (true) or included (false) in the bucket's sensitivity score.
  final bool? suppressed;

  /// The type of data identifier that detected the sensitive data. Possible
  /// values are: CUSTOM, for a custom data identifier; and, MANAGED, for a
  /// managed data identifier.
  final DataIdentifierType? type;

  Detection({
    this.arn,
    this.count,
    this.id,
    this.name,
    this.suppressed,
    this.type,
  });

  factory Detection.fromJson(Map<String, dynamic> json) {
    return Detection(
      arn: json['arn'] as String?,
      count: json['count'] as int?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      suppressed: json['suppressed'] as bool?,
      type: (json['type'] as String?)?.toDataIdentifierType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final count = this.count;
    final id = this.id;
    final name = this.name;
    final suppressed = this.suppressed;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (count != null) 'count': count,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (suppressed != null) 'suppressed': suppressed,
      if (type != null) 'type': type.toValue(),
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

extension EffectivePermissionValueExtension on EffectivePermission {
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

extension EffectivePermissionFromString on String {
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

/// The server-side encryption algorithm that was used to encrypt an S3 object
/// or is used by default to encrypt objects that are added to an S3 bucket.
/// Possible values are:
enum EncryptionType {
  none,
  aes256,
  awsKms,
  unknown,
  awsKmsDsse,
}

extension EncryptionTypeValueExtension on EncryptionType {
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
      case EncryptionType.awsKmsDsse:
        return 'aws:kms:dsse';
    }
  }
}

extension EncryptionTypeFromString on String {
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
      case 'aws:kms:dsse':
        return EncryptionType.awsKmsDsse;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// The source of an issue or delay. Possible values are:
enum ErrorCode {
  clientError,
  internalError,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.clientError:
        return 'ClientError';
      case ErrorCode.internalError:
        return 'InternalError';
    }
  }
}

extension ErrorCodeFromString on String {
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
  /// this value is always 1. All sensitive data findings are considered unique.
  final int? count;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// created the finding.
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

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// last updated the finding. For sensitive data findings, this value is the
  /// same as the value for the createdAt property. All sensitive data findings
  /// are considered new.
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

extension FindingActionTypeValueExtension on FindingActionType {
  String toValue() {
    switch (this) {
      case FindingActionType.awsApiCall:
        return 'AWS_API_CALL';
    }
  }
}

extension FindingActionTypeFromString on String {
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

/// The category of the finding. Possible values are:
enum FindingCategory {
  classification,
  policy,
}

extension FindingCategoryValueExtension on FindingCategory {
  String toValue() {
    switch (this) {
      case FindingCategory.classification:
        return 'CLASSIFICATION';
      case FindingCategory.policy:
        return 'POLICY';
    }
  }
}

extension FindingCategoryFromString on String {
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
/// EventBridge (formerly Amazon CloudWatch Events). For more information, see
/// <a
/// href="https://docs.aws.amazon.com/macie/latest/user/findings-monitor.html">Monitoring
/// and processing findings</a> in the <i>Amazon Macie User Guide</i>. Valid
/// values are:
enum FindingPublishingFrequency {
  fifteenMinutes,
  oneHour,
  sixHours,
}

extension FindingPublishingFrequencyValueExtension
    on FindingPublishingFrequency {
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

extension FindingPublishingFrequencyFromString on String {
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

extension FindingStatisticsSortAttributeNameValueExtension
    on FindingStatisticsSortAttributeName {
  String toValue() {
    switch (this) {
      case FindingStatisticsSortAttributeName.groupKey:
        return 'groupKey';
      case FindingStatisticsSortAttributeName.count:
        return 'count';
    }
  }
}

extension FindingStatisticsSortAttributeNameFromString on String {
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
/// of Amazon Macie findings</a> in the <i>Amazon Macie User Guide</i>. Possible
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
  policyIAMUserS3BucketSharedWithCloudFront,
}

extension FindingTypeValueExtension on FindingType {
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
      case FindingType.policyIAMUserS3BucketSharedWithCloudFront:
        return 'Policy:IAMUser/S3BucketSharedWithCloudFront';
    }
  }
}

extension FindingTypeFromString on String {
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
      case 'Policy:IAMUser/S3BucketSharedWithCloudFront':
        return FindingType.policyIAMUserS3BucketSharedWithCloudFront;
    }
    throw Exception('$this is not known in enum FindingType');
  }
}

/// The action to perform on findings that match the filter criteria. To
/// suppress (automatically archive) findings that match the criteria, set this
/// value to ARCHIVE. Valid values are:
enum FindingsFilterAction {
  archive,
  noop,
}

extension FindingsFilterActionValueExtension on FindingsFilterAction {
  String toValue() {
    switch (this) {
      case FindingsFilterAction.archive:
        return 'ARCHIVE';
      case FindingsFilterAction.noop:
        return 'NOOP';
    }
  }
}

extension FindingsFilterActionFromString on String {
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
  /// The action that's performed on findings that match the filter criteria.
  /// Possible values are: ARCHIVE, suppress (automatically archive) the findings;
  /// and, NOOP, don't perform any action on the findings.
  final FindingsFilterAction? action;

  /// The Amazon Resource Name (ARN) of the filter.
  final String? arn;

  /// The unique identifier for the filter.
  final String? id;

  /// The custom name of the filter.
  final String? name;

  /// A map of key-value pairs that specifies which tags (keys and values) are
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
  /// accounts are associated by an Amazon Macie membership invitation, this
  /// object also provides details about the invitation that was sent to establish
  /// the relationship between the accounts.
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

class GetAllowListResponse {
  /// The Amazon Resource Name (ARN) of the allow list.
  final String? arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the allow list
  /// was created in Amazon Macie.
  final DateTime? createdAt;

  /// The criteria that specify the text or text pattern to ignore. The criteria
  /// can be the location and name of an S3 object that lists specific text to
  /// ignore (s3WordsList), or a regular expression (regex) that defines a text
  /// pattern to ignore.
  final AllowListCriteria? criteria;

  /// The custom description of the allow list.
  final String? description;

  /// The unique identifier for the allow list.
  final String? id;

  /// The custom name of the allow list.
  final String? name;

  /// The current status of the allow list, which indicates whether Amazon Macie
  /// can access and use the list's criteria.
  final AllowListStatus? status;

  /// A map of key-value pairs that specifies which tags (keys and values) are
  /// associated with the allow list.
  final Map<String, String>? tags;

  /// The date and time, in UTC and extended ISO 8601 format, when the allow
  /// list's settings were most recently changed in Amazon Macie.
  final DateTime? updatedAt;

  GetAllowListResponse({
    this.arn,
    this.createdAt,
    this.criteria,
    this.description,
    this.id,
    this.name,
    this.status,
    this.tags,
    this.updatedAt,
  });

  factory GetAllowListResponse.fromJson(Map<String, dynamic> json) {
    return GetAllowListResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      criteria: json['criteria'] != null
          ? AllowListCriteria.fromJson(json['criteria'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] != null
          ? AllowListStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final criteria = this.criteria;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (criteria != null) 'criteria': criteria,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class GetAutomatedDiscoveryConfigurationResponse {
  /// The unique identifier for the classification scope that's used when
  /// performing automated sensitive data discovery for the account. The
  /// classification scope specifies S3 buckets to exclude from automated
  /// sensitive data discovery.
  final String? classificationScopeId;

  /// The date and time, in UTC and extended ISO 8601 format, when automated
  /// sensitive data discovery was most recently disabled for the account. This
  /// value is null if automated sensitive data discovery wasn't enabled and
  /// subsequently disabled for the account.
  final DateTime? disabledAt;

  /// The date and time, in UTC and extended ISO 8601 format, when automated
  /// sensitive data discovery was initially enabled for the account. This value
  /// is null if automated sensitive data discovery has never been enabled for the
  /// account.
  final DateTime? firstEnabledAt;

  /// The date and time, in UTC and extended ISO 8601 format, when automated
  /// sensitive data discovery was most recently enabled or disabled for the
  /// account.
  final DateTime? lastUpdatedAt;

  /// The unique identifier for the sensitivity inspection template that's used
  /// when performing automated sensitive data discovery for the account. The
  /// template specifies which allow lists, custom data identifiers, and managed
  /// data identifiers to use when analyzing data.
  final String? sensitivityInspectionTemplateId;

  /// The current status of the automated sensitive data discovery configuration
  /// for the account. Possible values are: ENABLED, use the specified settings to
  /// perform automated sensitive data discovery activities for the account; and,
  /// DISABLED, don't perform automated sensitive data discovery activities for
  /// the account.
  final AutomatedDiscoveryStatus? status;

  GetAutomatedDiscoveryConfigurationResponse({
    this.classificationScopeId,
    this.disabledAt,
    this.firstEnabledAt,
    this.lastUpdatedAt,
    this.sensitivityInspectionTemplateId,
    this.status,
  });

  factory GetAutomatedDiscoveryConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedDiscoveryConfigurationResponse(
      classificationScopeId: json['classificationScopeId'] as String?,
      disabledAt: timeStampFromJson(json['disabledAt']),
      firstEnabledAt: timeStampFromJson(json['firstEnabledAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      sensitivityInspectionTemplateId:
          json['sensitivityInspectionTemplateId'] as String?,
      status: (json['status'] as String?)?.toAutomatedDiscoveryStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final classificationScopeId = this.classificationScopeId;
    final disabledAt = this.disabledAt;
    final firstEnabledAt = this.firstEnabledAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final sensitivityInspectionTemplateId =
        this.sensitivityInspectionTemplateId;
    final status = this.status;
    return {
      if (classificationScopeId != null)
        'classificationScopeId': classificationScopeId,
      if (disabledAt != null) 'disabledAt': iso8601ToJson(disabledAt),
      if (firstEnabledAt != null)
        'firstEnabledAt': iso8601ToJson(firstEnabledAt),
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (sensitivityInspectionTemplateId != null)
        'sensitivityInspectionTemplateId': sensitivityInspectionTemplateId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetBucketStatisticsResponse {
  /// The total number of buckets.
  final int? bucketCount;

  /// The total number of buckets that are publicly accessible due to a
  /// combination of permissions settings for each bucket.
  final BucketCountByEffectivePermission? bucketCountByEffectivePermission;

  /// The total number of buckets whose settings do or don't specify default
  /// server-side encryption behavior for objects that are added to the buckets.
  final BucketCountByEncryptionType? bucketCountByEncryptionType;

  /// The total number of buckets whose bucket policies do or don't require
  /// server-side encryption of objects when objects are added to the buckets.
  final BucketCountPolicyAllowsUnencryptedObjectUploads?
      bucketCountByObjectEncryptionRequirement;

  /// The total number of buckets that are or aren't shared with other Amazon Web
  /// Services accounts, Amazon CloudFront origin access identities (OAIs), or
  /// CloudFront origin access controls (OACs).
  final BucketCountBySharedAccessType? bucketCountBySharedAccessType;

  /// The aggregated sensitive data discovery statistics for the buckets. If
  /// automated sensitive data discovery is currently disabled for your account,
  /// the value for each statistic is 0.
  final BucketStatisticsBySensitivity? bucketStatisticsBySensitivity;

  /// The total number of objects that Amazon Macie can analyze in the buckets.
  /// These objects use a supported storage class and have a file name extension
  /// for a supported file or storage format.
  final int? classifiableObjectCount;

  /// The total storage size, in bytes, of all the objects that Amazon Macie can
  /// analyze in the buckets. These objects use a supported storage class and have
  /// a file name extension for a supported file or storage format.
  ///
  /// If versioning is enabled for any of the buckets, this value is based on the
  /// size of the latest version of each applicable object in the buckets. This
  /// value doesn't reflect the storage size of all versions of all applicable
  /// objects in the buckets.
  final int? classifiableSizeInBytes;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently retrieved bucket or object metadata from Amazon S3 for the
  /// buckets.
  final DateTime? lastUpdated;

  /// The total number of objects in the buckets.
  final int? objectCount;

  /// The total storage size, in bytes, of the buckets.
  ///
  /// If versioning is enabled for any of the buckets, this value is based on the
  /// size of the latest version of each object in the buckets. This value doesn't
  /// reflect the storage size of all versions of the objects in the buckets.
  final int? sizeInBytes;

  /// The total storage size, in bytes, of the objects that are compressed (.gz,
  /// .gzip, .zip) files in the buckets.
  ///
  /// If versioning is enabled for any of the buckets, this value is based on the
  /// size of the latest version of each applicable object in the buckets. This
  /// value doesn't reflect the storage size of all versions of the applicable
  /// objects in the buckets.
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
    this.bucketStatisticsBySensitivity,
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
      bucketStatisticsBySensitivity:
          json['bucketStatisticsBySensitivity'] != null
              ? BucketStatisticsBySensitivity.fromJson(
                  json['bucketStatisticsBySensitivity'] as Map<String, dynamic>)
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
    final bucketStatisticsBySensitivity = this.bucketStatisticsBySensitivity;
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
      if (bucketStatisticsBySensitivity != null)
        'bucketStatisticsBySensitivity': bucketStatisticsBySensitivity,
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

class GetClassificationScopeResponse {
  /// The unique identifier for the classification scope.
  final String? id;

  /// The name of the classification scope: automated-sensitive-data-discovery.
  final String? name;

  /// The S3 buckets that are excluded from automated sensitive data discovery.
  final S3ClassificationScope? s3;

  GetClassificationScopeResponse({
    this.id,
    this.name,
    this.s3,
  });

  factory GetClassificationScopeResponse.fromJson(Map<String, dynamic> json) {
    return GetClassificationScopeResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      s3: json['s3'] != null
          ? S3ClassificationScope.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final s3 = this.s3;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (s3 != null) 's3': s3,
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

  /// An array that lists specific character sequences (<i>ignore words</i>) to
  /// exclude from the results. If the text matched by the regular expression
  /// contains any string in this array, Amazon Macie ignores it. Ignore words are
  /// case sensitive.
  final List<String>? ignoreWords;

  /// An array that lists specific character sequences (<i>keywords</i>), one of
  /// which must precede and be within proximity (maximumMatchDistance) of the
  /// regular expression to match. Keywords aren't case sensitive.
  final List<String>? keywords;

  /// The maximum number of characters that can exist between the end of at least
  /// one complete character sequence specified by the keywords array and the end
  /// of the text that matches the regex pattern. If a complete keyword precedes
  /// all the text that matches the pattern and the keyword is within the
  /// specified distance, Amazon Macie includes the result. Otherwise, Macie
  /// excludes the result.
  final int? maximumMatchDistance;

  /// The custom name of the custom data identifier.
  final String? name;

  /// The regular expression (<i>regex</i>) that defines the pattern to match.
  final String? regex;

  /// Specifies the severity that's assigned to findings that the custom data
  /// identifier produces, based on the number of occurrences of text that match
  /// the custom data identifier's detection criteria. By default, Amazon Macie
  /// creates findings for S3 objects that contain at least one occurrence of text
  /// that matches the detection criteria, and Macie assigns the MEDIUM severity
  /// to those findings.
  final List<SeverityLevel>? severityLevels;

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
    this.severityLevels,
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
      severityLevels: (json['severityLevels'] as List?)
          ?.whereNotNull()
          .map((e) => SeverityLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final severityLevels = this.severityLevels;
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
      if (severityLevels != null) 'severityLevels': severityLevels,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetFindingStatisticsResponse {
  /// An array of objects, one for each group of findings that matches the filter
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
  /// The action that's performed on findings that match the filter criteria
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

  /// A map of key-value pairs that specifies which tags (keys and values) are
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
  /// An array of objects, one for each finding that matches the criteria
  /// specified in the request.
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

  /// The frequency with which Amazon Macie publishes updates to policy findings
  /// for the account. This includes publishing updates to Security Hub and Amazon
  /// EventBridge (formerly Amazon CloudWatch Events).
  final FindingPublishingFrequency? findingPublishingFrequency;

  /// The Amazon Resource Name (ARN) of the service-linked role that allows Amazon
  /// Macie to monitor and analyze data in Amazon Web Services resources for the
  /// account.
  final String? serviceRole;

  /// The current status of the Amazon Macie account. Possible values are: PAUSED,
  /// the account is enabled but all Macie activities are suspended (paused) for
  /// the account; and, ENABLED, the account is enabled and all Macie activities
  /// are enabled for the account.
  final MacieStatus? status;

  /// The date and time, in UTC and extended ISO 8601 format, of the most recent
  /// change to the status or configuration settings for the Amazon Macie account.
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

  /// The email address for the account. This value is null if the account is
  /// associated with the administrator account through Organizations.
  final String? email;

  /// The date and time, in UTC and extended ISO 8601 format, when an Amazon Macie
  /// membership invitation was last sent to the account. This value is null if a
  /// Macie membership invitation hasn't been sent to the account.
  final DateTime? invitedAt;

  /// (Deprecated) The Amazon Web Services account ID for the administrator
  /// account. This property has been replaced by the administratorAccountId
  /// property and is retained only for backward compatibility.
  final String? masterAccountId;

  /// The current status of the relationship between the account and the
  /// administrator account.
  final RelationshipStatus? relationshipStatus;

  /// A map of key-value pairs that specifies which tags (keys and values) are
  /// associated with the account in Amazon Macie.
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

class GetResourceProfileResponse {
  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently recalculated sensitive data discovery statistics and details
  /// for the bucket. If the bucket's sensitivity score is calculated
  /// automatically, this includes the score.
  final DateTime? profileUpdatedAt;

  /// The current sensitivity score for the bucket, ranging from -1
  /// (classification error) to 100 (sensitive). By default, this score is
  /// calculated automatically based on the amount of data that Amazon Macie has
  /// analyzed in the bucket and the amount of sensitive data that Macie has found
  /// in the bucket.
  final int? sensitivityScore;

  /// Specifies whether the bucket's current sensitivity score was set manually.
  /// If this value is true, the score was manually changed to 100. If this value
  /// is false, the score was calculated automatically by Amazon Macie.
  final bool? sensitivityScoreOverridden;

  /// The sensitive data discovery statistics for the bucket. The statistics
  /// capture the results of automated sensitive data discovery activities that
  /// Amazon Macie has performed for the bucket.
  final ResourceStatistics? statistics;

  GetResourceProfileResponse({
    this.profileUpdatedAt,
    this.sensitivityScore,
    this.sensitivityScoreOverridden,
    this.statistics,
  });

  factory GetResourceProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceProfileResponse(
      profileUpdatedAt: timeStampFromJson(json['profileUpdatedAt']),
      sensitivityScore: json['sensitivityScore'] as int?,
      sensitivityScoreOverridden: json['sensitivityScoreOverridden'] as bool?,
      statistics: json['statistics'] != null
          ? ResourceStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileUpdatedAt = this.profileUpdatedAt;
    final sensitivityScore = this.sensitivityScore;
    final sensitivityScoreOverridden = this.sensitivityScoreOverridden;
    final statistics = this.statistics;
    return {
      if (profileUpdatedAt != null)
        'profileUpdatedAt': iso8601ToJson(profileUpdatedAt),
      if (sensitivityScore != null) 'sensitivityScore': sensitivityScore,
      if (sensitivityScoreOverridden != null)
        'sensitivityScoreOverridden': sensitivityScoreOverridden,
      if (statistics != null) 'statistics': statistics,
    };
  }
}

class GetRevealConfigurationResponse {
  /// The KMS key that's used to encrypt the sensitive data, and the status of the
  /// configuration for the Amazon Macie account.
  final RevealConfiguration? configuration;

  /// The access method and settings that are used to retrieve the sensitive data.
  final RetrievalConfiguration? retrievalConfiguration;

  GetRevealConfigurationResponse({
    this.configuration,
    this.retrievalConfiguration,
  });

  factory GetRevealConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetRevealConfigurationResponse(
      configuration: json['configuration'] != null
          ? RevealConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      retrievalConfiguration: json['retrievalConfiguration'] != null
          ? RetrievalConfiguration.fromJson(
              json['retrievalConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final retrievalConfiguration = this.retrievalConfiguration;
    return {
      if (configuration != null) 'configuration': configuration,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
    };
  }
}

class GetSensitiveDataOccurrencesAvailabilityResponse {
  /// Specifies whether occurrences of sensitive data can be retrieved for the
  /// finding. Possible values are: AVAILABLE, the sensitive data can be
  /// retrieved; and, UNAVAILABLE, the sensitive data can't be retrieved. If this
  /// value is UNAVAILABLE, the reasons array indicates why the data can't be
  /// retrieved.
  final AvailabilityCode? code;

  /// Specifies why occurrences of sensitive data can't be retrieved for the
  /// finding. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// ACCOUNT_NOT_IN_ORGANIZATION - The affected account isn't currently part of
  /// your organization. Or the account is part of your organization but Macie
  /// isn't currently enabled for the account. You're not allowed to access the
  /// affected S3 object by using Macie.
  /// </li>
  /// <li>
  /// INVALID_CLASSIFICATION_RESULT - There isn't a corresponding sensitive data
  /// discovery result for the finding. Or the corresponding sensitive data
  /// discovery result isn't available in the current Amazon Web Services Region,
  /// is malformed or corrupted, or uses an unsupported storage format. Macie
  /// can't verify the location of the sensitive data to retrieve.
  /// </li>
  /// <li>
  /// INVALID_RESULT_SIGNATURE - The corresponding sensitive data discovery result
  /// is stored in an S3 object that wasn't signed by Macie. Macie can't verify
  /// the integrity and authenticity of the sensitive data discovery result.
  /// Therefore, Macie can't verify the location of the sensitive data to
  /// retrieve.
  /// </li>
  /// <li>
  /// MEMBER_ROLE_TOO_PERMISSIVE - The trust or permissions policy for the IAM
  /// role in the affected member account doesn't meet Macie requirements for
  /// restricting access to the role. Or the role's trust policy doesn't specify
  /// the correct external ID for your organization. Macie can't assume the role
  /// to retrieve the sensitive data.
  /// </li>
  /// <li>
  /// MISSING_GET_MEMBER_PERMISSION - You're not allowed to retrieve information
  /// about the association between your account and the affected account. Macie
  /// can't determine whether you’re allowed to access the affected S3 object as
  /// the delegated Macie administrator for the affected account.
  /// </li>
  /// <li>
  /// OBJECT_EXCEEDS_SIZE_QUOTA - The storage size of the affected S3 object
  /// exceeds the size quota for retrieving occurrences of sensitive data from
  /// this type of file.
  /// </li>
  /// <li>
  /// OBJECT_UNAVAILABLE - The affected S3 object isn't available. The object was
  /// renamed, moved, deleted, or changed after Macie created the finding. Or the
  /// object is encrypted with an KMS key that's currently disabled.
  /// </li>
  /// <li>
  /// RESULT_NOT_SIGNED - The corresponding sensitive data discovery result is
  /// stored in an S3 object that hasn't been signed. Macie can't verify the
  /// integrity and authenticity of the sensitive data discovery result.
  /// Therefore, Macie can't verify the location of the sensitive data to
  /// retrieve.
  /// </li>
  /// <li>
  /// ROLE_TOO_PERMISSIVE - Your account is configured to retrieve occurrences of
  /// sensitive data by using an IAM role whose trust or permissions policy
  /// doesn't meet Macie requirements for restricting access to the role. Macie
  /// can’t assume the role to retrieve the sensitive data.
  /// </li>
  /// <li>
  /// UNSUPPORTED_FINDING_TYPE - The specified finding isn't a sensitive data
  /// finding.
  /// </li>
  /// <li>
  /// UNSUPPORTED_OBJECT_TYPE - The affected S3 object uses a file or storage
  /// format that Macie doesn't support for retrieving occurrences of sensitive
  /// data.
  /// </li>
  /// </ul>
  /// This value is null if sensitive data can be retrieved for the finding.
  final List<UnavailabilityReasonCode>? reasons;

  GetSensitiveDataOccurrencesAvailabilityResponse({
    this.code,
    this.reasons,
  });

  factory GetSensitiveDataOccurrencesAvailabilityResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSensitiveDataOccurrencesAvailabilityResponse(
      code: (json['code'] as String?)?.toAvailabilityCode(),
      reasons: (json['reasons'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toUnavailabilityReasonCode())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final reasons = this.reasons;
    return {
      if (code != null) 'code': code.toValue(),
      if (reasons != null) 'reasons': reasons.map((e) => e.toValue()).toList(),
    };
  }
}

class GetSensitiveDataOccurrencesResponse {
  /// If an error occurred when Amazon Macie attempted to retrieve occurrences of
  /// sensitive data reported by the finding, a description of the error that
  /// occurred. This value is null if the status (status) of the request is
  /// PROCESSING or SUCCESS.
  final String? error;

  /// A map that specifies 1-100 types of sensitive data reported by the finding
  /// and, for each type, 1-10 occurrences of sensitive data.
  final Map<String, List<DetectedDataDetails>>? sensitiveDataOccurrences;

  /// The status of the request to retrieve occurrences of sensitive data reported
  /// by the finding. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// ERROR - An error occurred when Amazon Macie attempted to locate, retrieve,
  /// or encrypt the sensitive data. The error value indicates the nature of the
  /// error that occurred.
  /// </li>
  /// <li>
  /// PROCESSING - Macie is processing the request.
  /// </li>
  /// <li>
  /// SUCCESS - Macie successfully located, retrieved, and encrypted the sensitive
  /// data.
  /// </li>
  /// </ul>
  final RevealRequestStatus? status;

  GetSensitiveDataOccurrencesResponse({
    this.error,
    this.sensitiveDataOccurrences,
    this.status,
  });

  factory GetSensitiveDataOccurrencesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSensitiveDataOccurrencesResponse(
      error: json['error'] as String?,
      sensitiveDataOccurrences: (json['sensitiveDataOccurrences']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) =>
                      DetectedDataDetails.fromJson(e as Map<String, dynamic>))
                  .toList())),
      status: (json['status'] as String?)?.toRevealRequestStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final sensitiveDataOccurrences = this.sensitiveDataOccurrences;
    final status = this.status;
    return {
      if (error != null) 'error': error,
      if (sensitiveDataOccurrences != null)
        'sensitiveDataOccurrences': sensitiveDataOccurrences,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetSensitivityInspectionTemplateResponse {
  /// The custom description of the template.
  final String? description;

  /// The managed data identifiers that are explicitly excluded (not used) when
  /// analyzing data.
  final SensitivityInspectionTemplateExcludes? excludes;

  /// The allow lists, custom data identifiers, and managed data identifiers that
  /// are explicitly included (used) when analyzing data.
  final SensitivityInspectionTemplateIncludes? includes;

  /// The name of the template: automated-sensitive-data-discovery.
  final String? name;

  /// The unique identifier for the template.
  final String? sensitivityInspectionTemplateId;

  GetSensitivityInspectionTemplateResponse({
    this.description,
    this.excludes,
    this.includes,
    this.name,
    this.sensitivityInspectionTemplateId,
  });

  factory GetSensitivityInspectionTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSensitivityInspectionTemplateResponse(
      description: json['description'] as String?,
      excludes: json['excludes'] != null
          ? SensitivityInspectionTemplateExcludes.fromJson(
              json['excludes'] as Map<String, dynamic>)
          : null,
      includes: json['includes'] != null
          ? SensitivityInspectionTemplateIncludes.fromJson(
              json['includes'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      sensitivityInspectionTemplateId:
          json['sensitivityInspectionTemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final excludes = this.excludes;
    final includes = this.includes;
    final name = this.name;
    final sensitivityInspectionTemplateId =
        this.sensitivityInspectionTemplateId;
    return {
      if (description != null) 'description': description,
      if (excludes != null) 'excludes': excludes,
      if (includes != null) 'includes': includes,
      if (name != null) 'name': name,
      if (sensitivityInspectionTemplateId != null)
        'sensitivityInspectionTemplateId': sensitivityInspectionTemplateId,
    };
  }
}

class GetUsageStatisticsResponse {
  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  /// An array of objects that contains the results of the query. Each object
  /// contains the data for an account that matches the filter criteria specified
  /// in the request.
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

extension GroupByValueExtension on GroupBy {
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

extension GroupByFromString on String {
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

  /// The username of the IAM user who performed the action.
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

/// Provides information about an Amazon Macie membership invitation.
class Invitation {
  /// The Amazon Web Services account ID for the account that sent the invitation.
  final String? accountId;

  /// The unique identifier for the invitation.
  final String? invitationId;

  /// The date and time, in UTC and extended ISO 8601 format, when the invitation
  /// was sent.
  final DateTime? invitedAt;

  /// The status of the relationship between the account that sent the invitation
  /// and the account that received the invitation.
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

extension IsDefinedInJobValueExtension on IsDefinedInJob {
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

extension IsDefinedInJobFromString on String {
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

extension IsMonitoredByJobValueExtension on IsMonitoredByJob {
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

extension IsMonitoredByJobFromString on String {
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

/// The operator to use in a condition. Depending on the type of condition,
/// possible values are:
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

extension JobComparatorValueExtension on JobComparator {
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

extension JobComparatorFromString on String {
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

extension JobStatusValueExtension on JobStatus {
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

extension JobStatusFromString on String {
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
  /// PAUSED - Macie started running the job but additional processing would
  /// exceed the monthly sensitive data discovery quota for your account or one or
  /// more member accounts that the job analyzes data for.
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

extension JobTypeValueExtension on JobType {
  String toValue() {
    switch (this) {
      case JobType.oneTime:
        return 'ONE_TIME';
      case JobType.scheduled:
        return 'SCHEDULED';
    }
  }
}

extension JobTypeFromString on String {
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

extension LastRunErrorStatusCodeValueExtension on LastRunErrorStatusCode {
  String toValue() {
    switch (this) {
      case LastRunErrorStatusCode.none:
        return 'NONE';
      case LastRunErrorStatusCode.error:
        return 'ERROR';
    }
  }
}

extension LastRunErrorStatusCodeFromString on String {
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

class ListAllowListsResponse {
  /// An array of objects, one for each allow list.
  final List<AllowListSummary>? allowLists;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListAllowListsResponse({
    this.allowLists,
    this.nextToken,
  });

  factory ListAllowListsResponse.fromJson(Map<String, dynamic> json) {
    return ListAllowListsResponse(
      allowLists: (json['allowLists'] as List?)
          ?.whereNotNull()
          .map((e) => AllowListSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowLists = this.allowLists;
    final nextToken = this.nextToken;
    return {
      if (allowLists != null) 'allowLists': allowLists,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListClassificationJobsResponse {
  /// An array of objects, one for each job that matches the filter criteria
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

class ListClassificationScopesResponse {
  /// An array that specifies the unique identifier and name of the classification
  /// scope for the account.
  final List<ClassificationScopeSummary>? classificationScopes;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListClassificationScopesResponse({
    this.classificationScopes,
    this.nextToken,
  });

  factory ListClassificationScopesResponse.fromJson(Map<String, dynamic> json) {
    return ListClassificationScopesResponse(
      classificationScopes: (json['classificationScopes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ClassificationScopeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final classificationScopes = this.classificationScopes;
    final nextToken = this.nextToken;
    return {
      if (classificationScopes != null)
        'classificationScopes': classificationScopes,
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
  /// finding that matches the filter criteria specified in the request.
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

extension ListJobsFilterKeyValueExtension on ListJobsFilterKey {
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

extension ListJobsFilterKeyFromString on String {
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

extension ListJobsSortAttributeNameValueExtension on ListJobsSortAttributeName {
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

extension ListJobsSortAttributeNameFromString on String {
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

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName.toValue(),
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

class ListManagedDataIdentifiersResponse {
  /// An array of objects, one for each managed data identifier.
  final List<ManagedDataIdentifierSummary>? items;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListManagedDataIdentifiersResponse({
    this.items,
    this.nextToken,
  });

  factory ListManagedDataIdentifiersResponse.fromJson(
      Map<String, dynamic> json) {
    return ListManagedDataIdentifiersResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ManagedDataIdentifierSummary.fromJson(e as Map<String, dynamic>))
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

class ListMembersResponse {
  /// An array of objects, one for each account that's associated with the
  /// administrator account and matches the criteria specified in the request.
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

class ListResourceProfileArtifactsResponse {
  /// An array of objects, one for each of 1-100 S3 objects that Amazon Macie
  /// selected for analysis.
  ///
  /// If Macie has analyzed more than 100 objects in the bucket, Macie populates
  /// the array based on the value for the ResourceProfileArtifact.sensitive field
  /// for an object: true (sensitive), followed by false (not sensitive). Macie
  /// then populates any remaining items in the array with information about
  /// objects where the value for the
  /// ResourceProfileArtifact.classificationResultStatus field is SKIPPED.
  final List<ResourceProfileArtifact>? artifacts;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListResourceProfileArtifactsResponse({
    this.artifacts,
    this.nextToken,
  });

  factory ListResourceProfileArtifactsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourceProfileArtifactsResponse(
      artifacts: (json['artifacts'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceProfileArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifacts = this.artifacts;
    final nextToken = this.nextToken;
    return {
      if (artifacts != null) 'artifacts': artifacts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListResourceProfileDetectionsResponse {
  /// An array of objects, one for each type of sensitive data that Amazon Macie
  /// found in the bucket. Each object reports the number of occurrences of the
  /// specified type and provides information about the custom data identifier or
  /// managed data identifier that detected the data.
  final List<Detection>? detections;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListResourceProfileDetectionsResponse({
    this.detections,
    this.nextToken,
  });

  factory ListResourceProfileDetectionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourceProfileDetectionsResponse(
      detections: (json['detections'] as List?)
          ?.whereNotNull()
          .map((e) => Detection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detections = this.detections;
    final nextToken = this.nextToken;
    return {
      if (detections != null) 'detections': detections,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSensitivityInspectionTemplatesResponse {
  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  /// An array that specifies the unique identifier and name of the sensitivity
  /// inspection template for the account.
  final List<SensitivityInspectionTemplatesEntry>?
      sensitivityInspectionTemplates;

  ListSensitivityInspectionTemplatesResponse({
    this.nextToken,
    this.sensitivityInspectionTemplates,
  });

  factory ListSensitivityInspectionTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSensitivityInspectionTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      sensitivityInspectionTemplates:
          (json['sensitivityInspectionTemplates'] as List?)
              ?.whereNotNull()
              .map((e) => SensitivityInspectionTemplatesEntry.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sensitivityInspectionTemplates = this.sensitivityInspectionTemplates;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (sensitivityInspectionTemplates != null)
        'sensitivityInspectionTemplates': sensitivityInspectionTemplates,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map of key-value pairs that specifies which tags (keys and values) are
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

extension MacieStatusValueExtension on MacieStatus {
  String toValue() {
    switch (this) {
      case MacieStatus.paused:
        return 'PAUSED';
      case MacieStatus.enabled:
        return 'ENABLED';
    }
  }
}

extension MacieStatusFromString on String {
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

/// The selection type that determines which managed data identifiers a
/// classification job uses to analyze data. Valid values are:
enum ManagedDataIdentifierSelector {
  all,
  exclude,
  include,
  none,
  recommended,
}

extension ManagedDataIdentifierSelectorValueExtension
    on ManagedDataIdentifierSelector {
  String toValue() {
    switch (this) {
      case ManagedDataIdentifierSelector.all:
        return 'ALL';
      case ManagedDataIdentifierSelector.exclude:
        return 'EXCLUDE';
      case ManagedDataIdentifierSelector.include:
        return 'INCLUDE';
      case ManagedDataIdentifierSelector.none:
        return 'NONE';
      case ManagedDataIdentifierSelector.recommended:
        return 'RECOMMENDED';
    }
  }
}

extension ManagedDataIdentifierSelectorFromString on String {
  ManagedDataIdentifierSelector toManagedDataIdentifierSelector() {
    switch (this) {
      case 'ALL':
        return ManagedDataIdentifierSelector.all;
      case 'EXCLUDE':
        return ManagedDataIdentifierSelector.exclude;
      case 'INCLUDE':
        return ManagedDataIdentifierSelector.include;
      case 'NONE':
        return ManagedDataIdentifierSelector.none;
      case 'RECOMMENDED':
        return ManagedDataIdentifierSelector.recommended;
    }
    throw Exception('$this is not known in enum ManagedDataIdentifierSelector');
  }
}

/// Provides information about a managed data identifier. For additional
/// information, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/managed-data-identifiers.html">Using
/// managed data identifiers</a> in the <i>Amazon Macie User Guide</i>.
class ManagedDataIdentifierSummary {
  /// The category of sensitive data that the managed data identifier detects:
  /// CREDENTIALS, for credentials data such as private keys or Amazon Web
  /// Services secret access keys; FINANCIAL_INFORMATION, for financial data such
  /// as credit card numbers; or, PERSONAL_INFORMATION, for personal health
  /// information, such as health insurance identification numbers, or personally
  /// identifiable information, such as passport numbers.
  final SensitiveDataItemCategory? category;

  /// The unique identifier for the managed data identifier. This is a string that
  /// describes the type of sensitive data that the managed data identifier
  /// detects. For example: OPENSSH_PRIVATE_KEY for OpenSSH private keys,
  /// CREDIT_CARD_NUMBER for credit card numbers, or USA_PASSPORT_NUMBER for US
  /// passport numbers.
  final String? id;

  ManagedDataIdentifierSummary({
    this.category,
    this.id,
  });

  factory ManagedDataIdentifierSummary.fromJson(Map<String, dynamic> json) {
    return ManagedDataIdentifierSummary(
      category: (json['category'] as String?)?.toSensitiveDataItemCategory(),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final id = this.id;
    return {
      if (category != null) 'category': category.toValue(),
      if (id != null) 'id': id,
    };
  }
}

/// Provides statistical data and other information about an S3 bucket that
/// Amazon Macie monitors and analyzes for your account. By default, object
/// count and storage size values include data for object parts that are the
/// result of incomplete multipart uploads. For more information, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/monitoring-s3-how-it-works.html">How
/// Macie monitors Amazon S3 data security</a> in the <i>Amazon Macie User
/// Guide</i>.
///
/// If an error occurs when Macie attempts to retrieve and process information
/// about the bucket or the bucket's objects, the value for most of these
/// properties is null. Key exceptions are accountId and bucketName. To identify
/// the cause of the error, refer to the errorCode and errorMessage values.
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

  /// The error code for an error that prevented Amazon Macie from retrieving and
  /// processing information about the bucket and the bucket's objects. If this
  /// value is ACCESS_DENIED, Macie doesn't have permission to retrieve the
  /// information. For example, the bucket has a restrictive bucket policy and
  /// Amazon S3 denied the request. If this value is null, Macie was able to
  /// retrieve and process the information.
  final BucketMetadataErrorCode? errorCode;

  /// A brief description of the error (errorCode) that prevented Amazon Macie
  /// from retrieving and processing information about the bucket and the bucket's
  /// objects. This value is null if Macie was able to retrieve and process the
  /// information.
  final String? errorMessage;

  /// Specifies whether any one-time or recurring classification jobs are
  /// configured to analyze objects in the bucket, and, if so, the details of the
  /// job that ran most recently.
  final JobDetails? jobDetails;

  /// The date and time, in UTC and extended ISO 8601 format, when Amazon Macie
  /// most recently analyzed data in the bucket while performing automated
  /// sensitive data discovery for your account. This value is null if automated
  /// sensitive data discovery is currently disabled for your account.
  final DateTime? lastAutomatedDiscoveryTime;

  /// The total number of objects in the bucket.
  final int? objectCount;

  /// The total number of objects in the bucket, grouped by server-side encryption
  /// type. This includes a grouping that reports the total number of objects that
  /// aren't encrypted or use client-side encryption.
  final ObjectCountByEncryptionType? objectCountByEncryptionType;

  /// The current sensitivity score for the bucket, ranging from -1
  /// (classification error) to 100 (sensitive). This value is null if automated
  /// sensitive data discovery is currently disabled for your account.
  final int? sensitivityScore;

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
  /// If versioning is enabled for the bucket, Amazon Macie calculates this value
  /// based on the size of the latest version of each applicable object in the
  /// bucket. This value doesn't reflect the storage size of all versions of each
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
    this.errorCode,
    this.errorMessage,
    this.jobDetails,
    this.lastAutomatedDiscoveryTime,
    this.objectCount,
    this.objectCountByEncryptionType,
    this.sensitivityScore,
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
      errorCode: (json['errorCode'] as String?)?.toBucketMetadataErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      jobDetails: json['jobDetails'] != null
          ? JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>)
          : null,
      lastAutomatedDiscoveryTime:
          timeStampFromJson(json['lastAutomatedDiscoveryTime']),
      objectCount: json['objectCount'] as int?,
      objectCountByEncryptionType: json['objectCountByEncryptionType'] != null
          ? ObjectCountByEncryptionType.fromJson(
              json['objectCountByEncryptionType'] as Map<String, dynamic>)
          : null,
      sensitivityScore: json['sensitivityScore'] as int?,
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
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final jobDetails = this.jobDetails;
    final lastAutomatedDiscoveryTime = this.lastAutomatedDiscoveryTime;
    final objectCount = this.objectCount;
    final objectCountByEncryptionType = this.objectCountByEncryptionType;
    final sensitivityScore = this.sensitivityScore;
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
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (lastAutomatedDiscoveryTime != null)
        'lastAutomatedDiscoveryTime': iso8601ToJson(lastAutomatedDiscoveryTime),
      if (objectCount != null) 'objectCount': objectCount,
      if (objectCountByEncryptionType != null)
        'objectCountByEncryptionType': objectCountByEncryptionType,
      if (sensitivityScore != null) 'sensitivityScore': sensitivityScore,
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
/// resource that Amazon Macie monitors and analyzes for your account.
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

  /// The email address for the account. This value is null if the account is
  /// associated with the administrator account through Organizations.
  final String? email;

  /// The date and time, in UTC and extended ISO 8601 format, when an Amazon Macie
  /// membership invitation was last sent to the account. This value is null if a
  /// Macie membership invitation hasn't been sent to the account.
  final DateTime? invitedAt;

  /// (Deprecated) The Amazon Web Services account ID for the administrator
  /// account. This property has been replaced by the administratorAccountId
  /// property and is retained only for backward compatibility.
  final String? masterAccountId;

  /// The current status of the relationship between the account and the
  /// administrator account.
  final RelationshipStatus? relationshipStatus;

  /// A map of key-value pairs that specifies which tags (keys and values) are
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
  /// The total number of objects that are encrypted with customer-provided keys.
  /// The objects use server-side encryption with customer-provided keys (SSE-C).
  final int? customerManaged;

  /// The total number of objects that are encrypted with KMS keys, either Amazon
  /// Web Services managed keys or customer managed keys. The objects use
  /// dual-layer server-side encryption or server-side encryption with KMS keys
  /// (DSSE-KMS or SSE-KMS).
  final int? kmsManaged;

  /// The total number of objects that are encrypted with Amazon S3 managed keys.
  /// The objects use server-side encryption with Amazon S3 managed keys (SSE-S3).
  final int? s3Managed;

  /// The total number of objects that use client-side encryption or aren't
  /// encrypted.
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
/// buckets in the query results. If versioning is enabled for a bucket, storage
/// size values are based on the size of the latest version of each applicable
/// object in the bucket.
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
/// detected by a managed data identifier or a custom data identifier and
/// produced a sensitive data finding.
class Occurrences {
  /// An array of objects, one for each occurrence of sensitive data in a
  /// Microsoft Excel workbook, CSV file, or TSV file. This value is null for all
  /// other types of files.
  ///
  /// Each Cell object specifies a cell or field that contains the sensitive data.
  final List<Cell>? cells;

  /// An array of objects, one for each occurrence of sensitive data in an email
  /// message or a non-binary text file such as an HTML, TXT, or XML file. Each
  /// Range object specifies a line or inclusive range of lines that contains the
  /// sensitive data, and the position of the data on the specified line or lines.
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

extension OrderByValueExtension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';
      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension OrderByFromString on String {
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

/// Specifies how Amazon Macie found the sensitive data that produced a finding.
/// Possible values are:
enum OriginType {
  sensitiveDataDiscoveryJob,
  automatedSensitiveDataDiscovery,
}

extension OriginTypeValueExtension on OriginType {
  String toValue() {
    switch (this) {
      case OriginType.sensitiveDataDiscoveryJob:
        return 'SENSITIVE_DATA_DISCOVERY_JOB';
      case OriginType.automatedSensitiveDataDiscovery:
        return 'AUTOMATED_SENSITIVE_DATA_DISCOVERY';
    }
  }
}

extension OriginTypeFromString on String {
  OriginType toOriginType() {
    switch (this) {
      case 'SENSITIVE_DATA_DISCOVERY_JOB':
        return OriginType.sensitiveDataDiscoveryJob;
      case 'AUTOMATED_SENSITIVE_DATA_DISCOVERY':
        return OriginType.automatedSensitiveDataDiscovery;
    }
    throw Exception('$this is not known in enum OriginType');
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

/// Specifies the location of an occurrence of sensitive data in an email
/// message or a non-binary text file such as an HTML, TXT, or XML file.
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
  /// path, Macie omits this field. If the name of an element exceeds 240
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
/// Amazon Macie administrator account. Possible values are:
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

extension RelationshipStatusValueExtension on RelationshipStatus {
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

extension RelationshipStatusFromString on String {
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
  /// to a bucket for an Amazon Web Services account that isn't part of your
  /// Amazon Macie organization. An <i>Amazon Macie organization</i> is a set of
  /// Macie accounts that are centrally managed as a group of related accounts
  /// through Organizations or by Macie invitation.
  final bool? replicatedExternally;

  /// An array of Amazon Web Services account IDs, one for each Amazon Web
  /// Services account that owns a bucket that the bucket is configured to
  /// replicate one or more objects to.
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

/// Provides information about an S3 object that Amazon Macie selected for
/// analysis while performing automated sensitive data discovery for an S3
/// bucket, and the status and results of the analysis. This information is
/// available only if automated sensitive data discovery is currently enabled
/// for your account.
class ResourceProfileArtifact {
  /// The Amazon Resource Name (ARN) of the object.
  final String arn;

  /// The status of the analysis. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// COMPLETE - Amazon Macie successfully completed its analysis of the object.
  /// </li>
  /// <li>
  /// PARTIAL - Macie analyzed only a subset of data in the object. For example,
  /// the object is an archive file that contains files in an unsupported format.
  /// </li>
  /// <li>
  /// SKIPPED - Macie wasn't able to analyze the object. For example, the object
  /// is a malformed file.
  /// </li>
  /// </ul>
  final String classificationResultStatus;

  /// Specifies whether Amazon Macie found sensitive data in the object.
  final bool? sensitive;

  ResourceProfileArtifact({
    required this.arn,
    required this.classificationResultStatus,
    this.sensitive,
  });

  factory ResourceProfileArtifact.fromJson(Map<String, dynamic> json) {
    return ResourceProfileArtifact(
      arn: json['arn'] as String,
      classificationResultStatus: json['classificationResultStatus'] as String,
      sensitive: json['sensitive'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final classificationResultStatus = this.classificationResultStatus;
    final sensitive = this.sensitive;
    return {
      'arn': arn,
      'classificationResultStatus': classificationResultStatus,
      if (sensitive != null) 'sensitive': sensitive,
    };
  }
}

/// Provides statistical data for sensitive data discovery metrics that apply to
/// an S3 bucket that Amazon Macie monitors and analyzes for your account. The
/// statistics capture the results of automated sensitive data discovery
/// activities that Macie has performed for the bucket. The data is available
/// only if automated sensitive data discovery is currently enabled for your
/// account.
class ResourceStatistics {
  /// The total amount of data, in bytes, that Amazon Macie has analyzed in the
  /// bucket.
  final int? totalBytesClassified;

  /// The total number of occurrences of sensitive data that Amazon Macie has
  /// found in the bucket's objects. This includes occurrences that are currently
  /// suppressed by the sensitivity scoring settings for the bucket
  /// (totalDetectionsSuppressed).
  final int? totalDetections;

  /// The total number of occurrences of sensitive data that are currently
  /// suppressed by the sensitivity scoring settings for the bucket. These
  /// represent occurrences of sensitive data that Amazon Macie found in the
  /// bucket's objects, but the occurrences were manually suppressed. By default,
  /// suppressed occurrences are excluded from the bucket's sensitivity score.
  final int? totalDetectionsSuppressed;

  /// The total number of objects that Amazon Macie has analyzed in the bucket.
  final int? totalItemsClassified;

  /// The total number of the bucket's objects that Amazon Macie has found
  /// sensitive data in.
  final int? totalItemsSensitive;

  /// The total number of objects that Amazon Macie wasn't able to analyze in the
  /// bucket due to an object-level issue or error. For example, an object is a
  /// malformed file. This value includes objects that Macie wasn't able to
  /// analyze for reasons reported by other statistics in the ResourceStatistics
  /// object.
  final int? totalItemsSkipped;

  /// The total number of objects that Amazon Macie wasn't able to analyze in the
  /// bucket because the objects are encrypted with a key that Macie can't access.
  /// The objects use server-side encryption with customer-provided keys (SSE-C).
  final int? totalItemsSkippedInvalidEncryption;

  /// The total number of objects that Amazon Macie wasn't able to analyze in the
  /// bucket because the objects are encrypted with KMS keys that were disabled,
  /// are scheduled for deletion, or were deleted.
  final int? totalItemsSkippedInvalidKms;

  /// The total number of objects that Amazon Macie wasn't able to analyze in the
  /// bucket due to the permissions settings for the objects or the permissions
  /// settings for the keys that were used to encrypt the objects.
  final int? totalItemsSkippedPermissionDenied;

  ResourceStatistics({
    this.totalBytesClassified,
    this.totalDetections,
    this.totalDetectionsSuppressed,
    this.totalItemsClassified,
    this.totalItemsSensitive,
    this.totalItemsSkipped,
    this.totalItemsSkippedInvalidEncryption,
    this.totalItemsSkippedInvalidKms,
    this.totalItemsSkippedPermissionDenied,
  });

  factory ResourceStatistics.fromJson(Map<String, dynamic> json) {
    return ResourceStatistics(
      totalBytesClassified: json['totalBytesClassified'] as int?,
      totalDetections: json['totalDetections'] as int?,
      totalDetectionsSuppressed: json['totalDetectionsSuppressed'] as int?,
      totalItemsClassified: json['totalItemsClassified'] as int?,
      totalItemsSensitive: json['totalItemsSensitive'] as int?,
      totalItemsSkipped: json['totalItemsSkipped'] as int?,
      totalItemsSkippedInvalidEncryption:
          json['totalItemsSkippedInvalidEncryption'] as int?,
      totalItemsSkippedInvalidKms: json['totalItemsSkippedInvalidKms'] as int?,
      totalItemsSkippedPermissionDenied:
          json['totalItemsSkippedPermissionDenied'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalBytesClassified = this.totalBytesClassified;
    final totalDetections = this.totalDetections;
    final totalDetectionsSuppressed = this.totalDetectionsSuppressed;
    final totalItemsClassified = this.totalItemsClassified;
    final totalItemsSensitive = this.totalItemsSensitive;
    final totalItemsSkipped = this.totalItemsSkipped;
    final totalItemsSkippedInvalidEncryption =
        this.totalItemsSkippedInvalidEncryption;
    final totalItemsSkippedInvalidKms = this.totalItemsSkippedInvalidKms;
    final totalItemsSkippedPermissionDenied =
        this.totalItemsSkippedPermissionDenied;
    return {
      if (totalBytesClassified != null)
        'totalBytesClassified': totalBytesClassified,
      if (totalDetections != null) 'totalDetections': totalDetections,
      if (totalDetectionsSuppressed != null)
        'totalDetectionsSuppressed': totalDetectionsSuppressed,
      if (totalItemsClassified != null)
        'totalItemsClassified': totalItemsClassified,
      if (totalItemsSensitive != null)
        'totalItemsSensitive': totalItemsSensitive,
      if (totalItemsSkipped != null) 'totalItemsSkipped': totalItemsSkipped,
      if (totalItemsSkippedInvalidEncryption != null)
        'totalItemsSkippedInvalidEncryption':
            totalItemsSkippedInvalidEncryption,
      if (totalItemsSkippedInvalidKms != null)
        'totalItemsSkippedInvalidKms': totalItemsSkippedInvalidKms,
      if (totalItemsSkippedPermissionDenied != null)
        'totalItemsSkippedPermissionDenied': totalItemsSkippedPermissionDenied,
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

/// Provides information about the access method and settings that are used to
/// retrieve occurrences of sensitive data reported by findings.
class RetrievalConfiguration {
  /// The access method that's used to retrieve sensitive data from affected S3
  /// objects. Valid values are: ASSUME_ROLE, assume an IAM role that is in the
  /// affected Amazon Web Services account and delegates access to Amazon Macie
  /// (roleName); and, CALLER_CREDENTIALS, use the credentials of the IAM user who
  /// requests the sensitive data.
  final RetrievalMode retrievalMode;

  /// The external ID to specify in the trust policy for the IAM role to assume
  /// when retrieving sensitive data from affected S3 objects (roleName). This
  /// value is null if the value for retrievalMode is CALLER_CREDENTIALS.
  ///
  /// This ID is a unique alphanumeric string that Amazon Macie generates
  /// automatically after you configure it to assume an IAM role. For a Macie
  /// administrator to retrieve sensitive data from an affected S3 object for a
  /// member account, the trust policy for the role in the member account must
  /// include an sts:ExternalId condition that requires this ID.
  final String? externalId;

  /// The name of the IAM role that is in the affected Amazon Web Services account
  /// and Amazon Macie is allowed to assume when retrieving sensitive data from
  /// affected S3 objects for the account. This value is null if the value for
  /// retrievalMode is CALLER_CREDENTIALS.
  final String? roleName;

  RetrievalConfiguration({
    required this.retrievalMode,
    this.externalId,
    this.roleName,
  });

  factory RetrievalConfiguration.fromJson(Map<String, dynamic> json) {
    return RetrievalConfiguration(
      retrievalMode: (json['retrievalMode'] as String).toRetrievalMode(),
      externalId: json['externalId'] as String?,
      roleName: json['roleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final retrievalMode = this.retrievalMode;
    final externalId = this.externalId;
    final roleName = this.roleName;
    return {
      'retrievalMode': retrievalMode.toValue(),
      if (externalId != null) 'externalId': externalId,
      if (roleName != null) 'roleName': roleName,
    };
  }
}

/// The access method to use when retrieving occurrences of sensitive data
/// reported by findings. Valid values are:
enum RetrievalMode {
  callerCredentials,
  assumeRole,
}

extension RetrievalModeValueExtension on RetrievalMode {
  String toValue() {
    switch (this) {
      case RetrievalMode.callerCredentials:
        return 'CALLER_CREDENTIALS';
      case RetrievalMode.assumeRole:
        return 'ASSUME_ROLE';
    }
  }
}

extension RetrievalModeFromString on String {
  RetrievalMode toRetrievalMode() {
    switch (this) {
      case 'CALLER_CREDENTIALS':
        return RetrievalMode.callerCredentials;
      case 'ASSUME_ROLE':
        return RetrievalMode.assumeRole;
    }
    throw Exception('$this is not known in enum RetrievalMode');
  }
}

/// Specifies the status of the Amazon Macie configuration for retrieving
/// occurrences of sensitive data reported by findings, and the Key Management
/// Service (KMS) key to use to encrypt sensitive data that's retrieved. When
/// you enable the configuration for the first time, your request must specify
/// an KMS key. Otherwise, an error occurs.
class RevealConfiguration {
  /// The status of the configuration for the Amazon Macie account. In a response,
  /// possible values are: ENABLED, the configuration is currently enabled for the
  /// account; and, DISABLED, the configuration is currently disabled for the
  /// account. In a request, valid values are: ENABLED, enable the configuration
  /// for the account; and, DISABLED, disable the configuration for the account.
  /// <important>
  /// If you disable the configuration, you also permanently delete current
  /// settings that specify how to access affected S3 objects. If your current
  /// access method is ASSUME_ROLE, Macie also deletes the external ID and role
  /// name currently specified for the configuration. These settings can't be
  /// recovered after they're deleted.
  /// </important>
  final RevealStatus status;

  /// The Amazon Resource Name (ARN), ID, or alias of the KMS key to use to
  /// encrypt sensitive data that's retrieved. The key must be an existing,
  /// customer managed, symmetric encryption key that's enabled in the same Amazon
  /// Web Services Region as the Amazon Macie account.
  ///
  /// If this value specifies an alias, it must include the following prefix:
  /// alias/. If this value specifies a key that's owned by another Amazon Web
  /// Services account, it must specify the ARN of the key or the ARN of the key's
  /// alias.
  final String? kmsKeyId;

  RevealConfiguration({
    required this.status,
    this.kmsKeyId,
  });

  factory RevealConfiguration.fromJson(Map<String, dynamic> json) {
    return RevealConfiguration(
      status: (json['status'] as String).toRevealStatus(),
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final kmsKeyId = this.kmsKeyId;
    return {
      'status': status.toValue(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// The status of a request to retrieve occurrences of sensitive data reported
/// by a finding. Possible values are:
enum RevealRequestStatus {
  success,
  processing,
  error,
}

extension RevealRequestStatusValueExtension on RevealRequestStatus {
  String toValue() {
    switch (this) {
      case RevealRequestStatus.success:
        return 'SUCCESS';
      case RevealRequestStatus.processing:
        return 'PROCESSING';
      case RevealRequestStatus.error:
        return 'ERROR';
    }
  }
}

extension RevealRequestStatusFromString on String {
  RevealRequestStatus toRevealRequestStatus() {
    switch (this) {
      case 'SUCCESS':
        return RevealRequestStatus.success;
      case 'PROCESSING':
        return RevealRequestStatus.processing;
      case 'ERROR':
        return RevealRequestStatus.error;
    }
    throw Exception('$this is not known in enum RevealRequestStatus');
  }
}

/// The status of the configuration for retrieving occurrences of sensitive data
/// reported by findings. Valid values are:
enum RevealStatus {
  enabled,
  disabled,
}

extension RevealStatusValueExtension on RevealStatus {
  String toValue() {
    switch (this) {
      case RevealStatus.enabled:
        return 'ENABLED';
      case RevealStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension RevealStatusFromString on String {
  RevealStatus toRevealStatus() {
    switch (this) {
      case 'ENABLED':
        return RevealStatus.enabled;
      case 'DISABLED':
        return RevealStatus.disabled;
    }
    throw Exception('$this is not known in enum RevealStatus');
  }
}

/// Provides information about the S3 bucket that a finding applies to.
class S3Bucket {
  /// Specifies whether the bucket policy for the bucket requires server-side
  /// encryption of objects when objects are added to the bucket. Possible values
  /// are:
  ///
  /// <ul>
  /// <li>
  /// FALSE - The bucket policy requires server-side encryption of new objects.
  /// PutObject requests must include a valid server-side encryption header.
  /// </li>
  /// <li>
  /// TRUE - The bucket doesn't have a bucket policy or it has a bucket policy
  /// that doesn't require server-side encryption of new objects. If a bucket
  /// policy exists, it doesn't require PutObject requests to include a valid
  /// server-side encryption header.
  /// </li>
  /// <li>
  /// UNKNOWN - Amazon Macie can't determine whether the bucket policy requires
  /// server-side encryption of new objects.
  /// </li>
  /// </ul>
  /// Valid server-side encryption headers are: x-amz-server-side-encryption with
  /// a value of AES256 or aws:kms, and
  /// x-amz-server-side-encryption-customer-algorithm with a value of AES256.
  final AllowsUnencryptedObjectUploads? allowsUnencryptedObjectUploads;

  /// The Amazon Resource Name (ARN) of the bucket.
  final String? arn;

  /// The date and time, in UTC and extended ISO 8601 format, when the bucket was
  /// created. This value can also indicate when changes such as edits to the
  /// bucket's policy were most recently made to the bucket, relative to when the
  /// finding was created or last updated.
  final DateTime? createdAt;

  /// The default server-side encryption settings for the bucket.
  final ServerSideEncryption? defaultServerSideEncryption;

  /// The name of the bucket.
  final String? name;

  /// The display name and canonical user ID for the Amazon Web Services account
  /// that owns the bucket.
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

/// Provides information about the Amazon Web Services account that owns an S3
/// bucket.
class S3BucketOwner {
  /// The display name of the account that owns the bucket.
  final String? displayName;

  /// The canonical user ID for the account that owns the bucket.
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

/// Specifies the S3 buckets that are excluded from automated sensitive data
/// discovery for an Amazon Macie account.
class S3ClassificationScope {
  /// The S3 buckets that are excluded.
  final S3ClassificationScopeExclusion excludes;

  S3ClassificationScope({
    required this.excludes,
  });

  factory S3ClassificationScope.fromJson(Map<String, dynamic> json) {
    return S3ClassificationScope(
      excludes: S3ClassificationScopeExclusion.fromJson(
          json['excludes'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    return {
      'excludes': excludes,
    };
  }
}

/// Specifies the names of the S3 buckets that are excluded from automated
/// sensitive data discovery.
class S3ClassificationScopeExclusion {
  /// An array of strings, one for each S3 bucket that is excluded. Each string is
  /// the full name of an excluded bucket.
  final List<String> bucketNames;

  S3ClassificationScopeExclusion({
    required this.bucketNames,
  });

  factory S3ClassificationScopeExclusion.fromJson(Map<String, dynamic> json) {
    return S3ClassificationScopeExclusion(
      bucketNames: (json['bucketNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketNames = this.bucketNames;
    return {
      'bucketNames': bucketNames,
    };
  }
}

/// Specifies S3 buckets to add or remove from the exclusion list defined by the
/// classification scope for an Amazon Macie account.
class S3ClassificationScopeExclusionUpdate {
  /// Depending on the value specified for the update operation
  /// (ClassificationScopeUpdateOperation), an array of strings that: lists the
  /// names of buckets to add or remove from the list, or specifies a new set of
  /// bucket names that overwrites all existing names in the list. Each string
  /// must be the full name of an S3 bucket. Values are case sensitive.
  final List<String> bucketNames;

  /// Specifies how to apply the changes to the exclusion list. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// ADD - Append the specified bucket names to the current list.
  /// </li>
  /// <li>
  /// REMOVE - Remove the specified bucket names from the current list.
  /// </li>
  /// <li>
  /// REPLACE - Overwrite the current list with the specified list of bucket
  /// names. If you specify this value, Amazon Macie removes all existing names
  /// from the list and adds all the specified names to the list.
  /// </li>
  /// </ul>
  final ClassificationScopeUpdateOperation operation;

  S3ClassificationScopeExclusionUpdate({
    required this.bucketNames,
    required this.operation,
  });

  Map<String, dynamic> toJson() {
    final bucketNames = this.bucketNames;
    final operation = this.operation;
    return {
      'bucketNames': bucketNames,
      'operation': operation.toValue(),
    };
  }
}

/// Specifies changes to the list of S3 buckets that are excluded from automated
/// sensitive data discovery for an Amazon Macie account.
class S3ClassificationScopeUpdate {
  /// The names of the S3 buckets to add or remove from the list.
  final S3ClassificationScopeExclusionUpdate excludes;

  S3ClassificationScopeUpdate({
    required this.excludes,
  });

  Map<String, dynamic> toJson() {
    final excludes = this.excludes;
    return {
      'excludes': excludes,
    };
  }
}

/// Specifies an S3 bucket to store data classification results in, and the
/// encryption settings to use when storing results in that bucket.
class S3Destination {
  /// The name of the bucket.
  final String bucketName;

  /// The Amazon Resource Name (ARN) of the customer managed KMS key to use for
  /// encryption of the results. This must be the ARN of an existing, symmetric
  /// encryption KMS key that's enabled in the same Amazon Web Services Region as
  /// the bucket.
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

  /// The full name (<i>key</i>) of the object, including the object's prefix if
  /// applicable.
  final String? key;

  /// The date and time, in UTC and extended ISO 8601 format, when the object was
  /// last modified.
  final DateTime? lastModified;

  /// The full path to the affected object, including the name of the affected
  /// bucket and the object's name (key).
  final String? path;

  /// Specifies whether the object is publicly accessible due to the combination
  /// of permissions settings that apply to the object.
  final bool? publicAccess;

  /// The type of server-side encryption that was used to encrypt the object.
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

/// Provides information about an S3 object that lists specific text to ignore.
class S3WordsList {
  /// The full name of the S3 bucket that contains the object.
  final String bucketName;

  /// The full name (key) of the object.
  final String objectKey;

  S3WordsList({
    required this.bucketName,
    required this.objectKey,
  });

  factory S3WordsList.fromJson(Map<String, dynamic> json) {
    return S3WordsList(
      bucketName: json['bucketName'] as String,
      objectKey: json['objectKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final objectKey = this.objectKey;
    return {
      'bucketName': bucketName,
      'objectKey': objectKey,
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

extension ScopeFilterKeyValueExtension on ScopeFilterKey {
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

extension ScopeFilterKeyFromString on String {
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

extension SearchResourcesComparatorValueExtension on SearchResourcesComparator {
  String toValue() {
    switch (this) {
      case SearchResourcesComparator.eq:
        return 'EQ';
      case SearchResourcesComparator.ne:
        return 'NE';
    }
  }
}

extension SearchResourcesComparatorFromString on String {
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

  Map<String, dynamic> toJson() {
    final and = this.and;
    return {
      if (and != null) 'and': and,
    };
  }
}

class SearchResourcesResponse {
  /// An array of objects, one for each resource that matches the filter criteria
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

extension SearchResourcesSimpleCriterionKeyValueExtension
    on SearchResourcesSimpleCriterionKey {
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

extension SearchResourcesSimpleCriterionKeyFromString on String {
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

extension SearchResourcesSortAttributeNameValueExtension
    on SearchResourcesSortAttributeName {
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

extension SearchResourcesSortAttributeNameFromString on String {
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
  /// access keys; FINANCIAL_INFORMATION, for financial data such as credit card
  /// numbers; or, PERSONAL_INFORMATION, for personal health information, such as
  /// health insurance identification numbers, or personally identifiable
  /// information, such as passport numbers.
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

/// For a finding, the category of sensitive data that was detected and produced
/// the finding. For a managed data identifier, the category of sensitive data
/// that the managed data identifier detects. Possible values are:
enum SensitiveDataItemCategory {
  financialInformation,
  personalInformation,
  credentials,
  customIdentifier,
}

extension SensitiveDataItemCategoryValueExtension on SensitiveDataItemCategory {
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

extension SensitiveDataItemCategoryFromString on String {
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

/// Provides aggregated statistical data for sensitive data discovery metrics
/// that apply to S3 buckets. Each field contains aggregated data for all the
/// buckets that have a sensitivity score (sensitivityScore) of a specified
/// value or within a specified range (BucketStatisticsBySensitivity). If
/// automated sensitive data discovery is currently disabled for your account,
/// the value for each field is 0.
class SensitivityAggregations {
  /// The total storage size, in bytes, of all the objects that Amazon Macie can
  /// analyze in the buckets. These objects use a supported storage class and have
  /// a file name extension for a supported file or storage format.
  ///
  /// If versioning is enabled for any of the buckets, this value is based on the
  /// size of the latest version of each applicable object in the buckets. This
  /// value doesn't reflect the storage size of all versions of all applicable
  /// objects in the buckets.
  final int? classifiableSizeInBytes;

  /// The total number of buckets that are publicly accessible due to a
  /// combination of permissions settings for each bucket.
  final int? publiclyAccessibleCount;

  /// The total number of buckets.
  final int? totalCount;

  /// The total storage size, in bytes, of the buckets.
  ///
  /// If versioning is enabled for any of the buckets, this value is based on the
  /// size of the latest version of each object in the buckets. This value doesn't
  /// reflect the storage size of all versions of the objects in the buckets.
  final int? totalSizeInBytes;

  SensitivityAggregations({
    this.classifiableSizeInBytes,
    this.publiclyAccessibleCount,
    this.totalCount,
    this.totalSizeInBytes,
  });

  factory SensitivityAggregations.fromJson(Map<String, dynamic> json) {
    return SensitivityAggregations(
      classifiableSizeInBytes: json['classifiableSizeInBytes'] as int?,
      publiclyAccessibleCount: json['publiclyAccessibleCount'] as int?,
      totalCount: json['totalCount'] as int?,
      totalSizeInBytes: json['totalSizeInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final classifiableSizeInBytes = this.classifiableSizeInBytes;
    final publiclyAccessibleCount = this.publiclyAccessibleCount;
    final totalCount = this.totalCount;
    final totalSizeInBytes = this.totalSizeInBytes;
    return {
      if (classifiableSizeInBytes != null)
        'classifiableSizeInBytes': classifiableSizeInBytes,
      if (publiclyAccessibleCount != null)
        'publiclyAccessibleCount': publiclyAccessibleCount,
      if (totalCount != null) 'totalCount': totalCount,
      if (totalSizeInBytes != null) 'totalSizeInBytes': totalSizeInBytes,
    };
  }
}

/// Specifies managed data identifiers to exclude (not use) when performing
/// automated sensitive data discovery for an Amazon Macie account. For
/// information about the managed data identifiers that Amazon Macie currently
/// provides, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/managed-data-identifiers.html">Using
/// managed data identifiers</a> in the <i>Amazon Macie User Guide</i>.
class SensitivityInspectionTemplateExcludes {
  /// An array of unique identifiers, one for each managed data identifier to
  /// exclude. To retrieve a list of valid values, use the
  /// ListManagedDataIdentifiers operation.
  final List<String>? managedDataIdentifierIds;

  SensitivityInspectionTemplateExcludes({
    this.managedDataIdentifierIds,
  });

  factory SensitivityInspectionTemplateExcludes.fromJson(
      Map<String, dynamic> json) {
    return SensitivityInspectionTemplateExcludes(
      managedDataIdentifierIds: (json['managedDataIdentifierIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managedDataIdentifierIds = this.managedDataIdentifierIds;
    return {
      if (managedDataIdentifierIds != null)
        'managedDataIdentifierIds': managedDataIdentifierIds,
    };
  }
}

/// Specifies the allow lists, custom data identifiers, and managed data
/// identifiers to include (use) when performing automated sensitive data
/// discovery for an Amazon Macie account. The configuration must specify at
/// least one custom data identifier or managed data identifier. For information
/// about the managed data identifiers that Amazon Macie currently provides, see
/// <a
/// href="https://docs.aws.amazon.com/macie/latest/user/managed-data-identifiers.html">Using
/// managed data identifiers</a> in the <i>Amazon Macie User Guide</i>.
class SensitivityInspectionTemplateIncludes {
  /// An array of unique identifiers, one for each allow list to include.
  final List<String>? allowListIds;

  /// An array of unique identifiers, one for each custom data identifier to
  /// include.
  final List<String>? customDataIdentifierIds;

  /// An array of unique identifiers, one for each managed data identifier to
  /// include.
  ///
  /// Amazon Macie uses these managed data identifiers in addition to managed data
  /// identifiers that are subsequently released and recommended for automated
  /// sensitive data discovery. To retrieve a list of valid values for the managed
  /// data identifiers that are currently available, use the
  /// ListManagedDataIdentifiers operation.
  /// <para/>
  final List<String>? managedDataIdentifierIds;

  SensitivityInspectionTemplateIncludes({
    this.allowListIds,
    this.customDataIdentifierIds,
    this.managedDataIdentifierIds,
  });

  factory SensitivityInspectionTemplateIncludes.fromJson(
      Map<String, dynamic> json) {
    return SensitivityInspectionTemplateIncludes(
      allowListIds: (json['allowListIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      customDataIdentifierIds: (json['customDataIdentifierIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      managedDataIdentifierIds: (json['managedDataIdentifierIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowListIds = this.allowListIds;
    final customDataIdentifierIds = this.customDataIdentifierIds;
    final managedDataIdentifierIds = this.managedDataIdentifierIds;
    return {
      if (allowListIds != null) 'allowListIds': allowListIds,
      if (customDataIdentifierIds != null)
        'customDataIdentifierIds': customDataIdentifierIds,
      if (managedDataIdentifierIds != null)
        'managedDataIdentifierIds': managedDataIdentifierIds,
    };
  }
}

/// Provides information about the sensitivity inspection template for an Amazon
/// Macie account. Macie uses the template's settings when it performs automated
/// sensitive data discovery for the account.
class SensitivityInspectionTemplatesEntry {
  /// The unique identifier for the sensitivity inspection template.
  final String? id;

  /// The name of the sensitivity inspection template:
  /// automated-sensitive-data-discovery.
  final String? name;

  SensitivityInspectionTemplatesEntry({
    this.id,
    this.name,
  });

  factory SensitivityInspectionTemplatesEntry.fromJson(
      Map<String, dynamic> json) {
    return SensitivityInspectionTemplatesEntry(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// Provides information about the default server-side encryption settings for
/// an S3 bucket or the encryption settings for an S3 object.
class ServerSideEncryption {
  /// The server-side encryption algorithm that's used when storing data in the
  /// bucket or object. If default encryption settings aren't configured for the
  /// bucket or the object isn't encrypted using server-side encryption, this
  /// value is NONE.
  final EncryptionType? encryptionType;

  /// The Amazon Resource Name (ARN) or unique identifier (key ID) for the KMS key
  /// that's used to encrypt data in the bucket or the object. This value is null
  /// if an KMS key isn't used to encrypt the data.
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

  /// The Amazon Resource Name (ARN) of the source account, Identity and Access
  /// Management (IAM) user, or role that was used to get the credentials.
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

extension SeverityDescriptionValueExtension on SeverityDescription {
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

extension SeverityDescriptionFromString on String {
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

/// Specifies a severity level for findings that a custom data identifier
/// produces. A severity level determines which severity is assigned to the
/// findings, based on the number of occurrences of text that match the custom
/// data identifier's detection criteria.
class SeverityLevel {
  /// The minimum number of occurrences of text that must match the custom data
  /// identifier's detection criteria in order to produce a finding with the
  /// specified severity (severity).
  final int occurrencesThreshold;

  /// The severity to assign to a finding: if the number of occurrences is greater
  /// than or equal to the specified threshold (occurrencesThreshold); and, if
  /// applicable, the number of occurrences is less than the threshold for the
  /// next consecutive severity level for the custom data identifier, moving from
  /// LOW to HIGH.
  final DataIdentifierSeverity severity;

  SeverityLevel({
    required this.occurrencesThreshold,
    required this.severity,
  });

  factory SeverityLevel.fromJson(Map<String, dynamic> json) {
    return SeverityLevel(
      occurrencesThreshold: json['occurrencesThreshold'] as int,
      severity: (json['severity'] as String).toDataIdentifierSeverity(),
    );
  }

  Map<String, dynamic> toJson() {
    final occurrencesThreshold = this.occurrencesThreshold;
    final severity = this.severity;
    return {
      'occurrencesThreshold': occurrencesThreshold,
      'severity': severity.toValue(),
    };
  }
}

enum SharedAccess {
  external,
  internal,
  notShared,
  unknown,
}

extension SharedAccessValueExtension on SharedAccess {
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

extension SharedAccessFromString on String {
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

extension SimpleCriterionKeyForJobValueExtension on SimpleCriterionKeyForJob {
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

extension SimpleCriterionKeyForJobFromString on String {
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
  /// OBJECT_LAST_MODIFIED_DATE - EQ (equals), GT (greater than), GTE (greater
  /// than or equals), LT (less than), LTE (less than or equals), or NE (not
  /// equals)
  /// </li>
  /// <li>
  /// OBJECT_SIZE - EQ (equals), GT (greater than), GTE (greater than or equals),
  /// LT (less than), LTE (less than or equals), or NE (not equals)
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
  /// example: 2023-09-24T14:31:13Z
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
  /// The name of the property to sort the results by. Valid values are: count,
  /// createdAt, policyDetails.action.apiCallDetails.firstSeen,
  /// policyDetails.action.apiCallDetails.lastSeen, resourcesAffected,
  /// severity.score, type, and updatedAt.
  final String? attributeName;

  /// The sort order to apply to the results, based on the value for the property
  /// specified by the attributeName property. Valid values are: ASC, sort the
  /// results in ascending order; and, DESC, sort the results in descending order.
  final OrderBy? orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });

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
  glacierIr,
  outposts,
}

extension StorageClassValueExtension on StorageClass {
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
      case StorageClass.glacierIr:
        return 'GLACIER_IR';
      case StorageClass.outposts:
        return 'OUTPOSTS';
    }
  }
}

extension StorageClassFromString on String {
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
      case 'GLACIER_IR':
        return StorageClass.glacierIr;
      case 'OUTPOSTS':
        return StorageClass.outposts;
    }
    throw Exception('$this is not known in enum StorageClass');
  }
}

/// Specifies a custom data identifier or managed data identifier that detected
/// a type of sensitive data to start excluding or including in an S3 bucket's
/// sensitivity score.
class SuppressDataIdentifier {
  /// The unique identifier for the custom data identifier or managed data
  /// identifier that detected the type of sensitive data to exclude or include in
  /// the score.
  final String? id;

  /// The type of data identifier that detected the sensitive data. Possible
  /// values are: CUSTOM, for a custom data identifier; and, MANAGED, for a
  /// managed data identifier.
  final DataIdentifierType? type;

  SuppressDataIdentifier({
    this.id,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (type != null) 'type': type.toValue(),
    };
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

extension TagTargetValueExtension on TagTarget {
  String toValue() {
    switch (this) {
      case TagTarget.s3Object:
        return 'S3_OBJECT';
    }
  }
}

extension TagTargetFromString on String {
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
  /// The number of occurrences of sample text that matched the criteria specified
  /// by the custom data identifier.
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

extension TimeRangeValueExtension on TimeRange {
  String toValue() {
    switch (this) {
      case TimeRange.monthToDate:
        return 'MONTH_TO_DATE';
      case TimeRange.past_30Days:
        return 'PAST_30_DAYS';
    }
  }
}

extension TimeRangeFromString on String {
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
  awsKmsDsse,
}

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.none:
        return 'NONE';
      case Type.aes256:
        return 'AES256';
      case Type.awsKms:
        return 'aws:kms';
      case Type.awsKmsDsse:
        return 'aws:kms:dsse';
    }
  }
}

extension TypeFromString on String {
  Type toType() {
    switch (this) {
      case 'NONE':
        return Type.none;
      case 'AES256':
        return Type.aes256;
      case 'aws:kms':
        return Type.awsKms;
      case 'aws:kms:dsse':
        return Type.awsKmsDsse;
    }
    throw Exception('$this is not known in enum Type');
  }
}

/// Specifies why occurrences of sensitive data can't be retrieved for a
/// finding. Possible values are:
enum UnavailabilityReasonCode {
  objectExceedsSizeQuota,
  unsupportedObjectType,
  unsupportedFindingType,
  invalidClassificationResult,
  objectUnavailable,
  accountNotInOrganization,
  missingGetMemberPermission,
  roleTooPermissive,
  memberRoleTooPermissive,
  invalidResultSignature,
  resultNotSigned,
}

extension UnavailabilityReasonCodeValueExtension on UnavailabilityReasonCode {
  String toValue() {
    switch (this) {
      case UnavailabilityReasonCode.objectExceedsSizeQuota:
        return 'OBJECT_EXCEEDS_SIZE_QUOTA';
      case UnavailabilityReasonCode.unsupportedObjectType:
        return 'UNSUPPORTED_OBJECT_TYPE';
      case UnavailabilityReasonCode.unsupportedFindingType:
        return 'UNSUPPORTED_FINDING_TYPE';
      case UnavailabilityReasonCode.invalidClassificationResult:
        return 'INVALID_CLASSIFICATION_RESULT';
      case UnavailabilityReasonCode.objectUnavailable:
        return 'OBJECT_UNAVAILABLE';
      case UnavailabilityReasonCode.accountNotInOrganization:
        return 'ACCOUNT_NOT_IN_ORGANIZATION';
      case UnavailabilityReasonCode.missingGetMemberPermission:
        return 'MISSING_GET_MEMBER_PERMISSION';
      case UnavailabilityReasonCode.roleTooPermissive:
        return 'ROLE_TOO_PERMISSIVE';
      case UnavailabilityReasonCode.memberRoleTooPermissive:
        return 'MEMBER_ROLE_TOO_PERMISSIVE';
      case UnavailabilityReasonCode.invalidResultSignature:
        return 'INVALID_RESULT_SIGNATURE';
      case UnavailabilityReasonCode.resultNotSigned:
        return 'RESULT_NOT_SIGNED';
    }
  }
}

extension UnavailabilityReasonCodeFromString on String {
  UnavailabilityReasonCode toUnavailabilityReasonCode() {
    switch (this) {
      case 'OBJECT_EXCEEDS_SIZE_QUOTA':
        return UnavailabilityReasonCode.objectExceedsSizeQuota;
      case 'UNSUPPORTED_OBJECT_TYPE':
        return UnavailabilityReasonCode.unsupportedObjectType;
      case 'UNSUPPORTED_FINDING_TYPE':
        return UnavailabilityReasonCode.unsupportedFindingType;
      case 'INVALID_CLASSIFICATION_RESULT':
        return UnavailabilityReasonCode.invalidClassificationResult;
      case 'OBJECT_UNAVAILABLE':
        return UnavailabilityReasonCode.objectUnavailable;
      case 'ACCOUNT_NOT_IN_ORGANIZATION':
        return UnavailabilityReasonCode.accountNotInOrganization;
      case 'MISSING_GET_MEMBER_PERMISSION':
        return UnavailabilityReasonCode.missingGetMemberPermission;
      case 'ROLE_TOO_PERMISSIVE':
        return UnavailabilityReasonCode.roleTooPermissive;
      case 'MEMBER_ROLE_TOO_PERMISSIVE':
        return UnavailabilityReasonCode.memberRoleTooPermissive;
      case 'INVALID_RESULT_SIGNATURE':
        return UnavailabilityReasonCode.invalidResultSignature;
      case 'RESULT_NOT_SIGNED':
        return UnavailabilityReasonCode.resultNotSigned;
    }
    throw Exception('$this is not known in enum UnavailabilityReasonCode');
  }
}

enum Unit {
  terabytes,
}

extension UnitValueExtension on Unit {
  String toValue() {
    switch (this) {
      case Unit.terabytes:
        return 'TERABYTES';
    }
  }
}

extension UnitFromString on String {
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

class UpdateAllowListResponse {
  /// The Amazon Resource Name (ARN) of the allow list.
  final String? arn;

  /// The unique identifier for the allow list.
  final String? id;

  UpdateAllowListResponse({
    this.arn,
    this.id,
  });

  factory UpdateAllowListResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAllowListResponse(
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

class UpdateAutomatedDiscoveryConfigurationResponse {
  UpdateAutomatedDiscoveryConfigurationResponse();

  factory UpdateAutomatedDiscoveryConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateAutomatedDiscoveryConfigurationResponse();
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

class UpdateClassificationScopeResponse {
  UpdateClassificationScopeResponse();

  factory UpdateClassificationScopeResponse.fromJson(Map<String, dynamic> _) {
    return UpdateClassificationScopeResponse();
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

class UpdateResourceProfileDetectionsResponse {
  UpdateResourceProfileDetectionsResponse();

  factory UpdateResourceProfileDetectionsResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateResourceProfileDetectionsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateResourceProfileResponse {
  UpdateResourceProfileResponse();

  factory UpdateResourceProfileResponse.fromJson(Map<String, dynamic> _) {
    return UpdateResourceProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the access method and settings to use when retrieving occurrences
/// of sensitive data reported by findings. If your request specifies an
/// Identity and Access Management (IAM) role to assume, Amazon Macie verifies
/// that the role exists and the attached policies are configured correctly. If
/// there's an issue, Macie returns an error. For information about addressing
/// the issue, see <a
/// href="https://docs.aws.amazon.com/macie/latest/user/findings-retrieve-sd-options.html">Configuration
/// options and requirements for retrieving sensitive data samples</a> in the
/// <i>Amazon Macie User Guide</i>.
class UpdateRetrievalConfiguration {
  /// The access method to use when retrieving sensitive data from affected S3
  /// objects. Valid values are: ASSUME_ROLE, assume an IAM role that is in the
  /// affected Amazon Web Services account and delegates access to Amazon Macie;
  /// and, CALLER_CREDENTIALS, use the credentials of the IAM user who requests
  /// the sensitive data. If you specify ASSUME_ROLE, also specify the name of an
  /// existing IAM role for Macie to assume (roleName).
  /// <important>
  /// If you change this value from ASSUME_ROLE to CALLER_CREDENTIALS for an
  /// existing configuration, Macie permanently deletes the external ID and role
  /// name currently specified for the configuration. These settings can't be
  /// recovered after they're deleted.
  /// </important>
  final RetrievalMode retrievalMode;

  /// The name of the IAM role that is in the affected Amazon Web Services account
  /// and Amazon Macie is allowed to assume when retrieving sensitive data from
  /// affected S3 objects for the account. The trust and permissions policies for
  /// the role must meet all requirements for Macie to assume the role.
  final String? roleName;

  UpdateRetrievalConfiguration({
    required this.retrievalMode,
    this.roleName,
  });

  Map<String, dynamic> toJson() {
    final retrievalMode = this.retrievalMode;
    final roleName = this.roleName;
    return {
      'retrievalMode': retrievalMode.toValue(),
      if (roleName != null) 'roleName': roleName,
    };
  }
}

class UpdateRevealConfigurationResponse {
  /// The KMS key to use to encrypt the sensitive data, and the status of the
  /// configuration for the Amazon Macie account.
  final RevealConfiguration? configuration;

  /// The access method and settings to use when retrieving the sensitive data.
  final RetrievalConfiguration? retrievalConfiguration;

  UpdateRevealConfigurationResponse({
    this.configuration,
    this.retrievalConfiguration,
  });

  factory UpdateRevealConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateRevealConfigurationResponse(
      configuration: json['configuration'] != null
          ? RevealConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      retrievalConfiguration: json['retrievalConfiguration'] != null
          ? RetrievalConfiguration.fromJson(
              json['retrievalConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final retrievalConfiguration = this.retrievalConfiguration;
    return {
      if (configuration != null) 'configuration': configuration,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
    };
  }
}

class UpdateSensitivityInspectionTemplateResponse {
  UpdateSensitivityInspectionTemplateResponse();

  factory UpdateSensitivityInspectionTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateSensitivityInspectionTemplateResponse();
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

  /// The name of the metric. Possible values are: AUTOMATED_OBJECT_MONITORING, to
  /// monitor S3 objects for automated sensitive data discovery;
  /// AUTOMATED_SENSITIVE_DATA_DISCOVERY, to analyze S3 objects for automated
  /// sensitive data discovery; DATA_INVENTORY_EVALUATION, to monitor S3 buckets;
  /// and, SENSITIVE_DATA_DISCOVERY, to run classification jobs.
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
  /// of automated sensitive data discovery started for the account. If the
  /// account is a member account in an organization, this value is the same as
  /// the value for the organization's Amazon Macie administrator account.
  final DateTime? automatedDiscoveryFreeTrialStartDate;

  /// The date and time, in UTC and extended ISO 8601 format, when the Amazon
  /// Macie free trial started for the account.
  final DateTime? freeTrialStartDate;

  /// An array of objects that contains usage data and quotas for the account.
  /// Each object contains the data for a specific usage metric and the
  /// corresponding quota.
  final List<UsageByAccount>? usage;

  UsageRecord({
    this.accountId,
    this.automatedDiscoveryFreeTrialStartDate,
    this.freeTrialStartDate,
    this.usage,
  });

  factory UsageRecord.fromJson(Map<String, dynamic> json) {
    return UsageRecord(
      accountId: json['accountId'] as String?,
      automatedDiscoveryFreeTrialStartDate:
          timeStampFromJson(json['automatedDiscoveryFreeTrialStartDate']),
      freeTrialStartDate: timeStampFromJson(json['freeTrialStartDate']),
      usage: (json['usage'] as List?)
          ?.whereNotNull()
          .map((e) => UsageByAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final automatedDiscoveryFreeTrialStartDate =
        this.automatedDiscoveryFreeTrialStartDate;
    final freeTrialStartDate = this.freeTrialStartDate;
    final usage = this.usage;
    return {
      if (accountId != null) 'accountId': accountId,
      if (automatedDiscoveryFreeTrialStartDate != null)
        'automatedDiscoveryFreeTrialStartDate':
            iso8601ToJson(automatedDiscoveryFreeTrialStartDate),
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
  /// when the Amazon Macie free trial started for an account.
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

extension UsageStatisticsFilterComparatorValueExtension
    on UsageStatisticsFilterComparator {
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

extension UsageStatisticsFilterComparatorFromString on String {
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

extension UsageStatisticsFilterKeyValueExtension on UsageStatisticsFilterKey {
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

extension UsageStatisticsFilterKeyFromString on String {
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

extension UsageStatisticsSortKeyValueExtension on UsageStatisticsSortKey {
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

extension UsageStatisticsSortKeyFromString on String {
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

  /// The name of the metric. Possible values are: AUTOMATED_OBJECT_MONITORING, to
  /// monitor S3 objects for automated sensitive data discovery;
  /// AUTOMATED_SENSITIVE_DATA_DISCOVERY, to analyze S3 objects for automated
  /// sensitive data discovery; DATA_INVENTORY_EVALUATION, to monitor S3 buckets;
  /// and, SENSITIVE_DATA_DISCOVERY, to run classification jobs.
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
  automatedSensitiveDataDiscovery,
  automatedObjectMonitoring,
}

extension UsageTypeValueExtension on UsageType {
  String toValue() {
    switch (this) {
      case UsageType.dataInventoryEvaluation:
        return 'DATA_INVENTORY_EVALUATION';
      case UsageType.sensitiveDataDiscovery:
        return 'SENSITIVE_DATA_DISCOVERY';
      case UsageType.automatedSensitiveDataDiscovery:
        return 'AUTOMATED_SENSITIVE_DATA_DISCOVERY';
      case UsageType.automatedObjectMonitoring:
        return 'AUTOMATED_OBJECT_MONITORING';
    }
  }
}

extension UsageTypeFromString on String {
  UsageType toUsageType() {
    switch (this) {
      case 'DATA_INVENTORY_EVALUATION':
        return UsageType.dataInventoryEvaluation;
      case 'SENSITIVE_DATA_DISCOVERY':
        return UsageType.sensitiveDataDiscovery;
      case 'AUTOMATED_SENSITIVE_DATA_DISCOVERY':
        return UsageType.automatedSensitiveDataDiscovery;
      case 'AUTOMATED_OBJECT_MONITORING':
        return UsageType.automatedObjectMonitoring;
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

extension UserIdentityTypeValueExtension on UserIdentityType {
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

extension UserIdentityTypeFromString on String {
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

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String? type, String? message})
      : super(
            type: type, code: 'UnprocessableEntityException', message: message);
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
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
